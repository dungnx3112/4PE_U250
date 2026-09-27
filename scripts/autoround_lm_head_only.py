#!/usr/bin/env python3
"""Calibrate only Llama-2's lm_head with AutoRound and export U250-ready W4G128.

The decoder blocks are kept in floating point during this run.  They are used
only to produce representative inputs to ``lm_head``; AutoRound tunes the
rounding parameters and scales of ``lm_head`` itself.  The compact output is:

    64-byte header
    [vocab, dim / 2] packed uint4 values (stored as signed_int4 + 8)
    [vocab, dim / group_size] float32 scales

This avoids writing another full 7B checkpoint.  The artifact can be consumed
by ``autoround_pack_llama2_u250.py --lm-head-autoround ...``.
"""

from __future__ import annotations

import argparse
import json
import os
import struct
import sys
import tempfile
from pathlib import Path


MAGIC = b"ARLH"
VERSION = 1
HEADER_BYTES = 64
VOCAB_SIZE = 32000
DIM = 4096
GROUP_SIZE = 128
BITS = 4


def _prepare_local_dataset(path: Path, chunk_chars: int = 8192) -> tuple[str, str | None]:
    """Return an AutoRound-compatible dataset path and an optional temp path."""
    if path.suffix.lower() in {".json", ".jsonl"}:
        # AutoRound uses ':' for dataset options.  An absolute Windows path
        # such as C:\\data.jsonl would therefore be parsed as a remote dataset
        # name plus options.  A relative path avoids that ambiguity.
        return os.path.relpath(path, Path.cwd()), None

    text = path.read_text(encoding="utf-8", errors="replace")
    chunks = []
    cursor = 0
    while cursor < len(text):
        end = min(cursor + chunk_chars, len(text))
        if end < len(text):
            split = text.rfind("\n", cursor, end)
            if split > cursor + chunk_chars // 2:
                end = split
        sample = text[cursor:end].strip()
        if sample:
            chunks.append({"text": sample})
        cursor = max(end, cursor + 1)

    if not chunks:
        raise ValueError(f"Calibration text is empty: {path}")

    tmp = tempfile.NamedTemporaryFile(
        mode="w",
        suffix=".jsonl",
        prefix="autoround_lm_head_",
        dir=path.parent,
        delete=False,
        encoding="utf-8",
    )
    with tmp:
        for sample in chunks:
            # Keep the JSONL byte stream ASCII-only because AutoRound's local
            # loader currently opens files without an explicit encoding on
            # Windows (therefore using the active ANSI codepage).
            tmp.write(json.dumps(sample, ensure_ascii=True) + "\n")
    return os.path.relpath(tmp.name, Path.cwd()), tmp.name


def _get_lm_head(model):
    head = getattr(model, "lm_head", None)
    if head is None:
        raise AttributeError("The loaded model has no top-level lm_head module")
    if getattr(head, "weight", None) is None:
        raise AttributeError("lm_head has no weight tensor")
    return head


def _reshape_scales(torch, scale, rows: int, groups: int):
    if scale is None:
        raise RuntimeError("AutoRound did not attach scales to lm_head")
    if not isinstance(scale, torch.Tensor):
        raise TypeError(f"Unsupported lm_head scale type: {type(scale)!r}")
    if scale.numel() != rows * groups:
        raise ValueError(
            f"Unexpected lm_head scale count {scale.numel()}; expected {rows * groups}"
        )
    return scale.detach().to(device="cpu", dtype=torch.float32).reshape(rows, groups).contiguous()


def _validate_symmetric_zero_point(torch, zp) -> None:
    expected = 1 << (BITS - 1)
    if zp is None:
        return
    if isinstance(zp, torch.Tensor):
        values = torch.unique(zp.detach().to(device="cpu", dtype=torch.int32))
        if values.numel() != 1 or int(values.item()) != expected:
            raise ValueError(f"lm_head is not symmetric int4; zero points are {values.tolist()}")
    elif int(zp) != expected:
        raise ValueError(f"lm_head is not symmetric int4; zero point is {zp}")


def _export_head(torch, head, output: Path, chunk_rows: int) -> None:
    rows, cols = tuple(head.weight.shape)
    if (rows, cols) != (VOCAB_SIZE, DIM):
        raise ValueError(f"Unexpected lm_head shape {(rows, cols)}; expected {(VOCAB_SIZE, DIM)}")
    if cols % GROUP_SIZE:
        raise ValueError("lm_head input dimension is not divisible by group size")

    groups = cols // GROUP_SIZE
    scales = _reshape_scales(torch, getattr(head, "scale", None), rows, groups)
    _validate_symmetric_zero_point(torch, getattr(head, "zp", None))

    output.parent.mkdir(parents=True, exist_ok=True)
    max_reconstruction_error = 0.0
    header = struct.pack(
        "<4sIIIIII", MAGIC, VERSION, rows, cols, GROUP_SIZE, BITS, 1
    ).ljust(HEADER_BYTES, b"\0")

    with output.open("wb") as out:
        out.write(header)
        for start in range(0, rows, chunk_rows):
            stop = min(start + chunk_rows, rows)
            weight = head.weight[start:stop].detach().to(device="cpu", dtype=torch.float32)
            scale = scales[start:stop]
            expanded = scale.repeat_interleave(GROUP_SIZE, dim=1)
            q = torch.round(weight / expanded).clamp_(-8, 7).to(torch.int16)
            reconstructed = q.to(torch.float32) * expanded
            error = float(torch.max(torch.abs(reconstructed - weight)).item())
            max_reconstruction_error = max(max_reconstruction_error, error)

            offset = (q + 8).to(torch.uint8)
            packed = offset[:, 0::2] | (offset[:, 1::2] << 4)
            out.write(packed.contiguous().numpy().tobytes())

        out.write(scales.numpy().tobytes())

    expected_bytes = HEADER_BYTES + rows * (cols // 2) + rows * groups * 4
    actual_bytes = output.stat().st_size
    if actual_bytes != expected_bytes:
        raise RuntimeError(f"Bad artifact size {actual_bytes}; expected {expected_bytes}")

    print(f"[OK] lm_head artifact: {output}")
    print(f"[OK] size: {actual_bytes:,} bytes ({actual_bytes / (1024**2):.2f} MiB)")
    print(f"[OK] max QDQ reconstruction error: {max_reconstruction_error:.8g}")
    print(f"[NEXT] python scripts/autoround_pack_llama2_u250.py --lm-head-autoround {output}")


def main() -> None:
    repo_root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(
        description="Run activation-aware AutoRound on only Llama-2 lm_head"
    )
    parser.add_argument("--model", default=str(repo_root / "Llama-2-7b-chat-hf"))
    parser.add_argument("--dataset", default=str(repo_root / "software_sim" / "wiki.test.raw"))
    parser.add_argument("--output", default=str(repo_root / "lm_head_autoround_w4g128.bin"))
    parser.add_argument(
        "--device-map", default="auto",
        help="device mapping: auto, cpu, CUDA device 0, or a multi-GPU mapping",
    )
    parser.add_argument(
        "--cpu-threads", type=int, default=0,
        help="PyTorch CPU threads; 0 keeps PyTorch's default",
    )
    parser.add_argument("--nsamples", type=int, default=128)
    parser.add_argument("--seqlen", type=int, default=512)
    parser.add_argument("--batch-size", type=int, default=1)
    parser.add_argument("--iters", type=int, default=200)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--chunk-rows", type=int, default=256)
    args = parser.parse_args()

    model_path = Path(args.model).resolve()
    dataset_path = Path(args.dataset).resolve()
    output_path = Path(args.output).resolve()
    if not model_path.exists():
        raise FileNotFoundError(f"Model directory not found: {model_path}")
    if not dataset_path.exists():
        raise FileNotFoundError(f"Calibration dataset not found: {dataset_path}")

    local_autoround = repo_root / "auto-round"
    if str(local_autoround) not in sys.path:
        sys.path.insert(0, str(local_autoround))

    try:
        import torch
        from auto_round import AutoRound
        from auto_round.algorithms.quantization.sign_round.config import SignRoundConfig
    except ImportError as exc:
        raise RuntimeError(
            "AutoRound dependencies are missing. Activate the CUDA Python environment "
            "used for AutoRound (torch, transformers, datasets, accelerate, safetensors)."
        ) from exc

    has_cuda = torch.cuda.is_available()
    has_xpu = hasattr(torch, "xpu") and torch.xpu.is_available()
    device_map = args.device_map
    if str(device_map).lower() == "auto" and not has_cuda and not has_xpu:
        device_map = "cpu"
        print("[AutoRound] No CUDA/XPU backend detected; falling back to CPU.")
    if str(device_map).lower() == "cpu" and args.cpu_threads > 0:
        torch.set_num_threads(args.cpu_threads)

    dataset_arg, temporary_dataset = _prepare_local_dataset(dataset_path)
    print("=== AutoRound lm_head-only calibration ===")
    print(f"model      : {model_path}")
    print(f"dataset    : {dataset_path}")
    print(f"nsamples   : {args.nsamples}")
    print(f"seqlen     : {args.seqlen}")
    print(f"iterations : {args.iters}")
    print(f"device_map : {device_map}")
    if str(device_map).lower() == "cpu":
        print(f"CPU threads: {torch.get_num_threads()}")
        print("WARNING    : CPU calibration is supported but may take hours for 128x512 samples.")
    print("quantized  : lm_head only (decoder layers remain FP16/BF16)")

    try:
        signround = SignRoundConfig(
            bits=BITS,
            group_size=GROUP_SIZE,
            sym=True,
            iters=args.iters,
            # The 32 decoder layers are explicitly kept in FP16/BF16, so a
            # second forward pass for "quantized" lm_head inputs is identical
            # and only stresses Accelerate's disk-offload path on CPU.
            enable_quanted_input=False,
        )
        autoround = AutoRound(
            model=str(model_path),
            scheme="W4A16",
            alg_configs=signround,
            dataset=dataset_arg,
            scale_dtype="fp32",
            quant_lm_head=True,
            ignore_layers="model.layers",
            device_map=device_map,
            nsamples=args.nsamples,
            seqlen=args.seqlen,
            batch_size=args.batch_size,
            seed=args.seed,
            low_cpu_mem_usage=True,
            enable_torch_compile=False,
        )
        model, layer_config = autoround.quantize()
        head_cfg = layer_config.get("lm_head", {})
        print(f"[AutoRound] lm_head config: {dict(head_cfg)}")
        _export_head(torch, _get_lm_head(model), output_path, args.chunk_rows)
    finally:
        if temporary_dataset is not None:
            try:
                os.unlink(temporary_dataset)
            except OSError:
                pass


if __name__ == "__main__":
    main()
