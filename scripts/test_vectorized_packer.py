import numpy as np
import time

def test_tile_packing():
    # Shape of Q: [4096 rows, 4096 cols]
    # Sharded to 4 PEs: each PE has [4096, 1024]
    # Local input tiles: 1024 / 256 = 4 tiles
    # Output tiles: 4096 / 128 = 32 tiles
    # Total tiles per PE: 32 * 4 = 128 tiles
    
    rows, cols = 4096, 4096
    pe_cols = 1024
    
    matrix = np.random.randn(rows, cols).astype(np.float32) * 0.02
    
    t0 = time.time()
    
    # Let's vectorize packing for 1 PE:
    # A tile is [128, 256]
    # Output tiles = 32, Input tiles = 4
    # Reshape matrix into tiles:
    # pe_matrix: [32, 128, 4, 256] -> transpose to [32, 4, 128, 256]
    pe_mat = matrix[:, :pe_cols].reshape(32, 128, 4, 256).transpose(0, 2, 1, 3) # [32, 4, 128, 256]
    
    # 1. Tile scales: max_abs per tile of [128, 256]
    max_abs = np.max(np.abs(pe_mat), axis=(2, 3), keepdims=True) # [32, 4, 1, 1]
    scales = np.maximum(max_abs / 7.0, 1e-7).astype(np.float16)
    stored_scales = scales.astype(np.float32) # broadcasted float32 scale
    
    # 2. Quantize:
    q = np.clip(np.round(pe_mat / stored_scales), -7, 7).astype(np.int8) # [32, 4, 128, 256]
    
    # 3. Pack into 512-bit words (64 bytes each):
    # In each tile of [128, 256]:
    # It has 8 groups of 32 cols, 32 row_blocks of 4 rows. Total 8 * 32 = 256 words of 64 bytes.
    # Reshape tile: [128, 256] -> [32 row_blocks, 4 rows, 8 groups, 32 cols]
    # -> transpose to [8 groups, 32 row_blocks, 32 cols, 4 rows]
    q_reshaped = q.reshape(32, 4, 32, 4, 8, 32).transpose(0, 1, 4, 2, 5, 3)
    # shape: [32 out_tiles, 4 in_tiles, 8 groups, 32 row_blocks, 32 lanes, 4 rows_in_block]
    
    # For each lane (32 lanes):
    # byte 0: (row0 & 0xF) << 4 | (row1 & 0xF)
    # byte 1: (row2 & 0xF) << 4 | (row3 & 0xF)
    r0 = q_reshaped[..., 0] & 0x0F
    r1 = q_reshaped[..., 1] & 0x0F
    r2 = q_reshaped[..., 2] & 0x0F
    r3 = q_reshaped[..., 3] & 0x0F
    
    byte0 = (r0 << 4) | r1
    byte1 = (r2 << 4) | r3
    
    # Interleave byte0 and byte1 along lane axis:
    # shape of byte0: [32, 4, 8, 32, 32]
    packed_bytes = np.empty((32, 4, 8, 32, 64), dtype=np.uint8)
    packed_bytes[..., 0::2] = byte0
    packed_bytes[..., 1::2] = byte1
    
    packed_flat = packed_bytes.reshape(-1)
    
    elapsed = time.time() - t0
    print(f"[Vectorized Test] 1 PE ({rows}x{pe_cols}) packed to {packed_flat.nbytes} bytes in {elapsed:.4f}s")
    print(f"[Vectorized Test] Extrapolated 4 PEs: {elapsed * 4:.4f}s")

if __name__ == "__main__":
    test_tile_packing()
