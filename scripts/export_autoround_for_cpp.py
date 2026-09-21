#!/usr/bin/env python3
"""
export_autoround_for_cpp.py
Converts AutoRound W4G128 safetensors weights into a streamlined binary file (autoround_w4g128.bin)
optimized for rapid C++ inference and token generation testing.
"""

import os
import sys
import time
import struct
import numpy as np
import torch
from safetensors import safe_open

def export_model(safetensors_path, output_bin_path):
    print(f"=== Exporting AutoRound W4G128 model ===")
    print(f"Input : {safetensors_path}")
    print(f"Output: {output_bin_path}")
    
    t0 = time.time()
    
    # Model architecture constants
    dim = 4096
    hidden_dim = 11008
    n_layers = 32
    n_heads = 32
    n_kv_heads = 32
    vocab_size = 32000
    group_size = 128
    
    with safe_open(safetensors_path, framework="pt") as f:
        keys = set(f.keys())
        print(f"Found {len(keys)} tensors in safetensors file.")
        
        with open(output_bin_path, "wb") as out:
            # 1. Header (256 bytes)
            # magic 'AR4\0', version 1
            magic = b"AR4\0"
            version = 1
            header = struct.pack(
                "<4sIIIIIIII",
                magic,
                version,
                dim,
                hidden_dim,
                n_layers,
                n_heads,
                n_kv_heads,
                vocab_size,
                group_size
            )
            # Pad header to 256 bytes
            header += b"\x00" * (256 - len(header))
            out.write(header)
            print(f"Header written (256 bytes).")
            
            # 2. Token Embeddings: [32000, 4096] float32
            emb = f.get_tensor("model.embed_tokens.weight").contiguous().to(torch.float32).numpy()
            out.write(emb.tobytes())
            print(f"Token embeddings written: {emb.shape}, {emb.nbytes / 1e6:.1f} MB")
            
            # 3. 32 Layers
            for l in range(n_layers):
                t_layer = time.time()
                # attn_norm
                attn_norm = f.get_tensor(f"model.layers.{l}.input_layernorm.weight").contiguous().to(torch.float32).numpy()
                out.write(attn_norm.tobytes())
                
                # Projections: (name, M, K)
                projs = [
                    ("self_attn.q_proj", 4096, 4096),
                    ("self_attn.k_proj", 4096, 4096),
                    ("self_attn.v_proj", 4096, 4096),
                    ("self_attn.o_proj", 4096, 4096),
                ]
                for proj_name, M, K in projs:
                    qw = f.get_tensor(f"model.layers.{l}.{proj_name}.qweight") # [K//8, M]
                    # Transpose to [M, K//8] int32, view as [M, K//2] uint8
                    qw_bytes = qw.t().contiguous().numpy().view(np.uint8)
                    assert qw_bytes.shape == (M, K // 2), f"Shape mismatch: {qw_bytes.shape} vs ({M}, {K//2})"
                    out.write(qw_bytes.tobytes())
                    
                    scales = f.get_tensor(f"model.layers.{l}.{proj_name}.scales") # [K//128, M]
                    # Transpose to [M, K//128] float32
                    scales_f32 = scales.t().contiguous().to(torch.float32).numpy()
                    assert scales_f32.shape == (M, K // group_size), f"Scale shape mismatch: {scales_f32.shape}"
                    out.write(scales_f32.tobytes())
                
                # ffn_norm
                ffn_norm = f.get_tensor(f"model.layers.{l}.post_attention_layernorm.weight").contiguous().to(torch.float32).numpy()
                out.write(ffn_norm.tobytes())
                
                # MLP Projections
                mlp_projs = [
                    ("mlp.gate_proj", 11008, 4096),
                    ("mlp.up_proj", 11008, 4096),
                    ("mlp.down_proj", 4096, 11008),
                ]
                for proj_name, M, K in mlp_projs:
                    qw = f.get_tensor(f"model.layers.{l}.{proj_name}.qweight") # [K//8, M]
                    qw_bytes = qw.t().contiguous().numpy().view(np.uint8)
                    assert qw_bytes.shape == (M, K // 2), f"Shape mismatch: {qw_bytes.shape} vs ({M}, {K//2})"
                    out.write(qw_bytes.tobytes())
                    
                    scales = f.get_tensor(f"model.layers.{l}.{proj_name}.scales") # [K//128, M]
                    scales_f32 = scales.t().contiguous().to(torch.float32).numpy()
                    assert scales_f32.shape == (M, K // group_size), f"Scale shape mismatch: {scales_f32.shape}"
                    out.write(scales_f32.tobytes())
                
                if (l + 1) % 4 == 0 or l == n_layers - 1:
                    print(f"  Layer {l:2d}/31 done ({time.time() - t_layer:.2f}s, total file size: {out.tell() / 1e6:.1f} MB)")
            
            # 4. Final Norm
            final_norm = f.get_tensor("model.norm.weight").contiguous().to(torch.float32).numpy()
            out.write(final_norm.tobytes())
            
            # 5. LM Head: [32000, 4096] float32
            lm_head = f.get_tensor("lm_head.weight").contiguous().to(torch.float32).numpy()
            out.write(lm_head.tobytes())
            print(f"LM Head written: {lm_head.shape}, {lm_head.nbytes / 1e6:.1f} MB")
            
    total_size = os.path.getsize(output_bin_path)
    print(f"\n Export COMPLETED in {time.time() - t0:.2f}s!")
    print(f"Output file: {output_bin_path}")
    print(f"Total size : {total_size / (1024**3):.2f} GB ({total_size:,} bytes)")

if __name__ == "__main__":
    safetensors_file = "model.safetensors"
    output_bin = "autoround_w4g128.bin"
    if len(sys.argv) > 1:
        safetensors_file = sys.argv[1]
    if len(sys.argv) > 2:
        output_bin = sys.argv[2]
    export_model(safetensors_file, output_bin)
