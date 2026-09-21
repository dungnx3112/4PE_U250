#!/usr/bin/env python3
"""
build_xclbin.py
===============
Convenience script to orchestrate the full xclbin build pipeline.

Steps:
  1. Run HLS synthesis + export (.xo) for all 4 PEs
  2. Link .xo files into the final .xclbin using v++ --link

Usage (on a Linux server with Vitis installed):
  python3 scripts/build_xclbin.py [--freq 300mhz] [--pe 0]

Environment:
  XILINX_VITIS  must be set (e.g. /opt/xilinx/Vitis/2023.2)
"""

import os
import sys
import subprocess
import argparse

REPO_ROOT    = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCRIPTS_DIR  = os.path.join(REPO_ROOT, "scripts")
KERNEL_DIR   = os.path.join(REPO_ROOT, "kernel_HLS")

PART         = "xcu250-figd2104-2L-e"
PLATFORM     = "xilinx_u250_gen3x16_xdma_4_1_202210_1"   # adjust if needed

def run(cmd, cwd=None):
    print(f"\n>>> {cmd}\n")
    ret = subprocess.run(cmd, shell=True, cwd=cwd or REPO_ROOT)
    if ret.returncode != 0:
        print(f"FAILED (exit {ret.returncode}): {cmd}")
        sys.exit(ret.returncode)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--freq",   default="300mhz", choices=["300mhz"])
    p.add_argument("--pe",     type=int, default=None,
                   help="Build only a single PE (0..3); default: all 4")
    p.add_argument("--hls-only", action="store_true",
                   help="Run HLS synthesis only, skip v++ link")
    args = p.parse_args()

    pes = [args.pe] if args.pe is not None else [0, 1, 2, 3]

    # ── Step 1: HLS synthesis ────────────────────────────────────────────────
    print("=" * 60)
    print(" Step 1: HLS C Synthesis (vitis_hls)")
    print("=" * 60)

    for pe in pes:
        env_extra = f"INT4_DECODER_PE={pe} TARGET_FREQ={args.freq}"
        run(f"env {env_extra} vitis_hls -f scripts/run_hls_decoder_multikernel.tcl")

    if args.hls_only:
        print("HLS-only mode: done.")
        return

    # ── Step 2: v++ link ────────────────────────────────────────────────────
    print("=" * 60)
    print(" Step 2: v++ Link (xclbin packaging)")
    print("=" * 60)

    xo_files = " ".join(
        f"int4_decoder_pe{pe}_kernel_{args.freq}.xo" for pe in [0, 1, 2, 3]
    )

    # Replace placeholder in link config with empty pre-place TCL
    link_cfg_src = os.path.join(SCRIPTS_DIR, "link_300mhz.cfg")
    link_cfg_dst = os.path.join(REPO_ROOT, "link_300mhz_build.cfg")

    with open(link_cfg_src) as f:
        cfg_text = f.read()
    # Remove placeholder TCL hooks (not needed for basic build)
    cfg_text = cfg_text.replace("__PRE_PLACE_TCL__", "")
    cfg_text = cfg_text.replace("__PRE_PHYSOPT_TCL__", "")
    with open(link_cfg_dst, "w") as f:
        f.write(cfg_text)

    xclbin_name = f"decoder_{args.freq}.xclbin"
    vpp_cmd = (
        f"v++ --link"
        f" --platform {PLATFORM}"
        f" --target hw"
        f" --config {link_cfg_dst}"
        f" {xo_files}"
        f" --output {xclbin_name}"
        f" --report_level 2"
        f" --temp_dir _vpp_temp"
        f" --log_dir _vpp_logs"
        f" --jobs 32"
    )
    run(vpp_cmd)

    print(f"\nBuild complete: {xclbin_name}")
    print("Next steps:")
    print(f"  1. python3 scripts/generate_rope_lut.py")
    print(f"  2. python3 scripts/export_embeddings.py")
    print(f"  3. ./host/decode_host --xclbin {xclbin_name} \\")
    print(f"         --banks . --rope rope_lut.bin \\")
    print(f"         --tokenizer tokenizer.bin \\")
    print(f"         --prompt \"The capital of France is\"")

if __name__ == "__main__":
    main()
