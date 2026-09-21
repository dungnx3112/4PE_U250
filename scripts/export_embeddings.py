#!/usr/bin/env python3
"""
export_embeddings.py
====================
Export the token embedding table and final LM norm gamma from
Llama-2-7b-chat-hf safetensors into flat float32 binary files.

Output files:
  embeddings.bin   -- float32[32000 * 4096]  (788 MB)  vocab embedding table
  final_norm.bin   -- float32[4096]           (16 KB)   final RMSNorm gamma

Usage:
  python3 scripts/export_embeddings.py --model /path/to/Llama-2-7b-chat-hf
"""

import os
import sys
import struct
import numpy as np
import json

DEFAULT_MODEL_DIR = "C:/KLTN/4PE_U250/Llama-2-7b-chat-hf"
DEFAULT_OUT_DIR   = "C:/KLTN/4PE_U250"

VOCAB_SIZE = 32000
DIM        = 4096

def main():
    model_dir = DEFAULT_MODEL_DIR
    out_dir   = DEFAULT_OUT_DIR

    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i] == "--model" and i + 1 < len(args):
            model_dir = args[i + 1]; i += 2
        elif args[i] == "--out" and i + 1 < len(args):
            out_dir = args[i + 1]; i += 2
        else:
            raise SystemExit(f"Unknown argument: {args[i]}")

    # Locate safetensors index
    index_path = os.path.join(model_dir, "model.safetensors.index.json")
    if not os.path.exists(index_path):
        raise SystemExit(f"model.safetensors.index.json not found in {model_dir}")

    with open(index_path) as f:
        weight_map = json.load(f)["weight_map"]

    # Open required safetensors shards
    try:
        from safetensors import safe_open
    except ImportError:
        raise SystemExit("pip install safetensors")

    st_files = {}
    for sf in set(weight_map.values()):
        st_files[sf] = safe_open(os.path.join(model_dir, sf), framework="pt")

    def get_tensor(name):
        sf = weight_map[name]
        return st_files[sf].get_tensor(name).float().numpy()

    # 1. Token embeddings [32000, 4096] float32
    print("Loading embed_tokens.weight ...")
    emb = get_tensor("model.embed_tokens.weight").astype(np.float32)
    assert emb.shape == (VOCAB_SIZE, DIM), f"Unexpected shape: {emb.shape}"

    emb_path = os.path.join(out_dir, "embeddings.bin")
    emb.tofile(emb_path)
    print(f"  Written: {emb_path}  ({os.path.getsize(emb_path):,} bytes)")

    # 2. Final RMSNorm gamma [4096] float32
    print("Loading model.norm.weight ...")
    gamma = get_tensor("model.norm.weight").astype(np.float32)
    assert gamma.shape == (DIM,), f"Unexpected shape: {gamma.shape}"

    gamma_path = os.path.join(out_dir, "final_norm.bin")
    gamma.tofile(gamma_path)
    print(f"  Written: {gamma_path}  ({os.path.getsize(gamma_path):,} bytes)")

    print("\nDone.")


if __name__ == "__main__":
    main()
