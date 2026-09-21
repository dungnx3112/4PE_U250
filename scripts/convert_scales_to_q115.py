#!/usr/bin/env python3
"""
convert_scales_to_q115.py
Converts the scale region (first 102,400 bytes) of model_bank{0..3}.bin
from FP16 (np.float16) to Q1.15 signed fixed-point (np.int16).

Formula:
  Q1.15 = clip(round(FP16 * 32768.0), -32768, 32767)
"""

import os
import sys
import numpy as np

BASE_DIR = r"C:\KLTN\4PE_U250"
SCALE_BYTES = 102400  # 1600 words * 64 bytes = 51200 int16/float16 values
EXPECTED_TOTAL_BYTES = 838967296  # 800 MiB

def convert_bank(bank_idx):
    bin_path = os.path.join(BASE_DIR, f"model_bank{bank_idx}.bin")
    bak_path = os.path.join(BASE_DIR, f"model_bank{bank_idx}_scales_fp16.bak")
    
    if not os.path.exists(bin_path):
        print(f"Error: {bin_path} not found!")
        return False
        
    size = os.path.getsize(bin_path)
    if size != EXPECTED_TOTAL_BYTES:
        print(f"Error: {bin_path} size {size} != expected {EXPECTED_TOTAL_BYTES}")
        return False
        
    # 1. Read scale region
    with open(bin_path, "rb") as f:
        raw_scale_bytes = f.read(SCALE_BYTES)
        
    # Backup original FP16 scales if not backed up yet
    if not os.path.exists(bak_path):
        with open(bak_path, "wb") as f_bak:
            f_bak.write(raw_scale_bytes)
        print(f"[Bank {bank_idx}] Backed up original FP16 scales to {os.path.basename(bak_path)}")
        
    # 2. Decode as float16
    scales_fp16 = np.frombuffer(raw_scale_bytes, dtype=np.float16)
    non_zero = scales_fp16[scales_fp16 != 0]
    
    # 3. Convert to Q1.15 int16
    scales_f32 = scales_fp16.astype(np.float32)
    scales_q115 = np.clip(np.round(scales_f32 * 32768.0), -32768, 32767).astype(np.int16)
    
    # Verification stats
    recon_f32 = scales_q115.astype(np.float32) / 32768.0
    diff = np.abs(scales_f32 - recon_f32)
    max_err = np.max(diff)
    
    print(f"[Bank {bank_idx}] Non-zero scales: {len(non_zero)}/51200")
    print(f"          Range: [{non_zero.min():.6f}, {non_zero.max():.6f}]")
    print(f"          Max quantization error vs FP16: {max_err:.7f}")
    
    # 4. Write back in-place
    with open(bin_path, "r+b") as f:
        f.seek(0)
        f.write(scales_q115.tobytes())
        
    new_size = os.path.getsize(bin_path)
    assert new_size == EXPECTED_TOTAL_BYTES, f"File size changed! {new_size} vs {EXPECTED_TOTAL_BYTES}"
    print(f"[Bank {bank_idx}] Successfully updated scale region to Q1.15 ({new_size:,} bytes total)\n")
    return True

def main():
    print("=== Converting model_bank{0..3}.bin scales to Q1.15 (int16) ===")
    success = True
    for p in range(4):
        if not convert_bank(p):
            success = False
            break
            
    if success:
        print("All 4 DDR bank files successfully converted to Q1.15 fixed-point scales!")
    else:
        print("Conversion failed!")

if __name__ == "__main__":
    main()
