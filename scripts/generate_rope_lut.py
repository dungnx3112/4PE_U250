#!/usr/bin/env python3
"""
generate_rope_lut.py
====================
Generate rope_lut.bin for the int4_decoder HLS kernel.

The HLS kernel reads cosine/sine values for RoPE from a precomputed LUT stored
in DDR.  This script generates that LUT and writes it as a flat binary file.

--- HLS Constants (from swiftkv_attention.hpp) ---
  SWIFTKV_ROPE_PAIRS               = 64   (HEAD_SIZE/2)
  SWIFTKV_ROPE_POSITIONS           = 4096 (max sequence length)
  SWIFTKV_ROPE_PAIRS_PER_LUT_WORD  = 16
  SWIFTKV_ROPE_LUT_WORDS_PER_POS   = 64/16 = 4
  SWIFTKV_ROPE_LUT_WORD_BITS       = 16 * 2 * 19 = 608 bits per LUT word
  SWIFTKV_ROPE_DDR_WORDS_PER_LUT_WORD = 2
  SWIFTKV_ROPE_DDR_WORDS           = 4096 * 4 * 2 = 32768 DDR words
  Total file size                  = 32768 * 64 bytes = 2,097,152 bytes

--- LUT Word Bit Layout (608-bit, LSB-first within each field) ---
  For each of 16 pairs (pair 0..15):
    bits [18:0]   = cosine  (Q1.17 signed 19-bit)
    bits [37:19]  = sine    (Q1.17 signed 19-bit)
  Total: 16 * 38 = 608 bits

--- DDR Packing (2 x 512-bit DDR words per LUT word) ---
  DDR word 0: bits [511:0]   = LUT word bits [511:0]
  DDR word 1: bits [95:0]    = LUT word bits [607:512]
              bits [511:96]  = padding zeros

--- Address Mapping ---
  address = position * SWIFTKV_ROPE_LUT_WORDS_PER_POS + bank_index (0..3)
  ddr_address = address * 2
  DDR word read: rope_lut_ddr[ddr_address] and rope_lut_ddr[ddr_address + 1]

--- RoPE frequency formula (Adjacent-pair, matching llama2.c/runq.c) ---
  pair index p in [0, 63]:
  freq_p = 1 / (10000 ^ (2*p / HEAD_SIZE)) = 10000 ^ (-p/64)
  angle  = position * freq_p
  cos(angle), sin(angle)
"""

import os
import sys
import struct
import numpy as np

# ── HLS constants (must match swiftkv_attention.hpp) ──────────────────────────
HEAD_SIZE                         = 128
ROPE_PAIRS                        = HEAD_SIZE // 2             # 64
ROPE_POSITIONS                    = 4096
ROPE_PAIRS_PER_LUT_WORD           = 16
ROPE_LUT_WORDS_PER_POSITION       = ROPE_PAIRS // ROPE_PAIRS_PER_LUT_WORD   # 4
ROPE_LUT_WORDS                    = ROPE_POSITIONS * ROPE_LUT_WORDS_PER_POSITION  # 16384
ROPE_LUT_WORD_BITS                = ROPE_PAIRS_PER_LUT_WORD * 2 * 19        # 608
ROPE_DDR_WORDS_PER_LUT_WORD       = 2
ROPE_DDR_WORDS                    = ROPE_LUT_WORDS * ROPE_DDR_WORDS_PER_LUT_WORD  # 32768
DDR_WORD_BYTES                    = 64   # 512-bit

TOTAL_BYTES                       = ROPE_DDR_WORDS * DDR_WORD_BYTES          # 2,097,152

# ── Q1.17 encoding: signed 19-bit integer ─────────────────────────────────────
Q17_SCALE   = 1 << 17                  # 131072
Q17_MAX     = (1 << 18) - 1           # 262143  (largest positive)
Q17_MIN     = -(1 << 18)              # -262144 (most negative)

def to_q17(v: float) -> int:
    """Convert float in [-1, 1] to signed 19-bit Q1.17 integer."""
    raw = int(round(v * Q17_SCALE))
    # Saturate
    if raw > Q17_MAX:
        raw = Q17_MAX
    if raw < Q17_MIN:
        raw = Q17_MIN
    # Two's complement within 19 bits
    if raw < 0:
        raw = raw + (1 << 19)
    return raw  # unsigned 19-bit value

# ── Precompute all (cos, sin) values for all positions and pairs ──────────────
print("Computing RoPE cosine/sine table …")
positions = np.arange(ROPE_POSITIONS, dtype=np.float64)   # [0 .. 4095]
pairs     = np.arange(ROPE_PAIRS,     dtype=np.float64)   # [0 .. 63]

# freq[p] = 10000^(-p/64) — same as llama2.c/runq.c formula head_dim/float(head_size)
# where head_dim iterates in steps of 2 over [0, 126], and pair index = head_dim/2
freq = 1.0 / (10000.0 ** (pairs / ROPE_PAIRS))   # shape [64]

angles = np.outer(positions, freq)  # shape [4096, 64]
cos_table = np.cos(angles)          # shape [4096, 64]
sin_table = np.sin(angles)          # shape [4096, 64]

print(f"  cos range: [{cos_table.min():.4f}, {cos_table.max():.4f}]")
print(f"  sin range: [{sin_table.min():.4f}, {sin_table.max():.4f}]")

# Spot-check Q1.17 precision on first 4 positions only
cos_first4     = cos_table[:4]
cos_first4_q17 = np.array([[
    (to_q17(c) if to_q17(c) < (1<<18) else to_q17(c) - (1<<19)) / Q17_SCALE
    for c in row] for row in cos_first4])
max_cos_err    = np.max(np.abs(cos_first4 - cos_first4_q17))
print(f"  Q1.17 max abs error on first 4 positions: {max_cos_err:.2e}")

# ── Pack into DDR words ────────────────────────────────────────────────────────
#
# Layout per token position (4 LUT words = 8 DDR words):
#   LUT word 0 (bank 0): pairs  0..15 → DDR words 0, 1
#   LUT word 1 (bank 1): pairs 16..31 → DDR words 2, 3
#   LUT word 2 (bank 2): pairs 32..47 → DDR words 4, 5
#   LUT word 3 (bank 3): pairs 48..63 → DDR words 6, 7
#
# Within each LUT word the pairs are stored LSB-first:
#   pair 0 occupies bits [37:0], pair 15 occupies bits [607:570]
#   cos → bits [18:0], sin → bits [37:19]

output_path = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                           "..", "rope_lut.bin")
output_path = os.path.normpath(output_path)
print(f"\nWriting {TOTAL_BYTES:,} bytes -> {output_path}")

buf = bytearray(TOTAL_BYTES)

for pos in range(ROPE_POSITIONS):
    for bank in range(ROPE_LUT_WORDS_PER_POSITION):   # 0..3
        # This LUT word covers pairs [bank*16 .. bank*16 + 15]
        pair_start = bank * ROPE_PAIRS_PER_LUT_WORD

        # Build 608-bit integer from 16 (cos, sin) pairs LSB-first
        lut_word_int = 0
        for i in range(ROPE_PAIRS_PER_LUT_WORD - 1, -1, -1):
            pair_idx = pair_start + i
            c19 = to_q17(cos_table[pos, pair_idx])
            s19 = to_q17(sin_table[pos, pair_idx])
            lut_word_int = (lut_word_int << 19) | s19
            lut_word_int = (lut_word_int << 19) | c19

        # lut_word_int is 608 bits.  Split into 2 DDR words:
        #   DDR word 0: bits [511:0]
        #   DDR word 1: bits [607:512] padded to 512 bits at MSB
        ddr_address = (pos * ROPE_LUT_WORDS_PER_POSITION + bank) * ROPE_DDR_WORDS_PER_LUT_WORD
        byte_offset  = ddr_address * DDR_WORD_BYTES

        # Lower 512 bits → DDR word 0 (64 bytes, little-endian)
        low_512 = lut_word_int & ((1 << 512) - 1)
        high_96 = (lut_word_int >> 512) & ((1 << 96) - 1)

        for b in range(64):
            buf[byte_offset + b] = (low_512 >> (8 * b)) & 0xFF
        for b in range(64):
            buf[byte_offset + 64 + b] = (high_96 >> (8 * b)) & 0xFF if b < 12 else 0

    if pos % 512 == 0:
        pct = 100 * pos // ROPE_POSITIONS
        print(f"  {pct:3d}%  position {pos}")

with open(output_path, "wb") as f:
    f.write(buf)

print(f"\nDone. {output_path} written ({os.path.getsize(output_path):,} bytes)")

# ── Quick self-verification ────────────────────────────────────────────────────
print("\n[Verify] Spot-checking 3 (position, pair) entries …")
buf_check = buf

def read_lut_entry(pos, pair):
    """Reconstruct (cos_q17, sin_q17) for a given position and pair index."""
    bank       = pair // ROPE_PAIRS_PER_LUT_WORD
    lane       = pair %  ROPE_PAIRS_PER_LUT_WORD
    ddr_addr   = (pos * ROPE_LUT_WORDS_PER_POSITION + bank) * ROPE_DDR_WORDS_PER_LUT_WORD
    byte_off   = ddr_addr * DDR_WORD_BYTES

    # Reassemble 608-bit integer from 2 DDR words
    low_512 = int.from_bytes(buf_check[byte_off      : byte_off + 64], 'little')
    high_96 = int.from_bytes(buf_check[byte_off + 64 : byte_off + 76], 'little')
    lut_word = low_512 | (high_96 << 512)

    # Extract lane-th pair (38 bits per pair, cos first)
    field = (lut_word >> (lane * 38)) & ((1 << 38) - 1)
    cos_raw = field & ((1 << 19) - 1)
    sin_raw = (field >> 19) & ((1 << 19) - 1)
    # Sign extend 19-bit
    if cos_raw >= (1 << 18): cos_raw -= (1 << 19)
    if sin_raw >= (1 << 18): sin_raw -= (1 << 19)
    return cos_raw / Q17_SCALE, sin_raw / Q17_SCALE

test_cases = [(0, 0), (1, 0), (100, 32), (4095, 63)]
all_ok = True
for pos, pair in test_cases:
    got_cos, got_sin = read_lut_entry(pos, pair)
    exp_cos = float(cos_table[pos, pair])
    exp_sin = float(sin_table[pos, pair])
    err = max(abs(got_cos - exp_cos), abs(got_sin - exp_sin))
    status = "OK" if err < 1e-4 else "FAIL"
    if status == "FAIL":
        all_ok = False
    print(f"  pos={pos:4d} pair={pair:2d}: cos={got_cos:.6f} (exp {exp_cos:.6f}), "
          f"sin={got_sin:.6f} (exp {exp_sin:.6f})  err={err:.2e}  [{status}]")

if all_ok:
    print("\nAll spot checks PASSED.")
else:
    print("\nSome spot checks FAILED — check packing logic.")
    sys.exit(1)
