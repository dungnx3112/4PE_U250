import os
import sys
import time
import struct
import numpy as np

# Model paths
AUTOROUND_BIN_PATH = "C:/KLTN/4PE_U250/autoround_w4g128.bin"
OUTPUT_DIR = "C:/KLTN/4PE_U250"

# Architecture constants matching int4_types.hpp & int4_model_layout.hpp
NUM_LAYERS = 32
DIM = 4096
HIDDEN_DIM = 11008
PADDED_HIDDEN_DIM = 11264
VOCAB_SIZE = 32000
PADDED_VOCAB_SIZE = 32256

NUM_PES = 4
TILE_ROWS = 128
TILE_COLS = 256
GROUP_SIZE = 32
AUTOROUND_GROUP_SIZE = 128

TILES_PER_BLOCK = 16
SCALE_WORDS_PER_BLOCK = 256
WEIGHT_WORDS_PER_BLOCK = 4096
SUPER_BLOCK_WORDS = 4352

WORD_BYTES = 64
NORM_BASE_WORD = 0
TOTAL_NORM_WORDS_PER_PE = 4160
DATA_BASE_WORD = 4160
TOTAL_DATA_WORDS_PER_PE = 13922048
MODEL_WORDS_PER_DDR = 13926208
TOTAL_BYTES_PER_BANK = MODEL_WORDS_PER_DDR * WORD_BYTES # 891,277,312 bytes

# Mode indices matching int4_types.hpp
MODE_Q = 0
MODE_K = 1
MODE_V = 2
MODE_O = 3
MODE_GATE = 4
MODE_UP = 5
MODE_DOWN = 6
MODE_LOGITS = 7

NORM_ATTN = 0
NORM_FFN = 1
NORM_FINAL = 2

def matrix_shape_info(mode):
    if mode in (MODE_Q, MODE_K, MODE_V, MODE_O):
        valid_out, padded_out = DIM, DIM
        valid_in, padded_in = DIM, DIM
    elif mode in (MODE_GATE, MODE_UP):
        valid_out, padded_out = HIDDEN_DIM, PADDED_HIDDEN_DIM
        valid_in, padded_in = DIM, DIM
    elif mode == MODE_DOWN:
        valid_out, padded_out = DIM, DIM
        valid_in, padded_in = HIDDEN_DIM, PADDED_HIDDEN_DIM
    elif mode == MODE_LOGITS:
        valid_out, padded_out = VOCAB_SIZE, PADDED_VOCAB_SIZE
        valid_in, padded_in = DIM, DIM
    else:
        raise ValueError(f"Unknown mode {mode}")

    out_tiles = padded_out // TILE_ROWS
    local_in_tiles = padded_in // (NUM_PES * TILE_COLS)
    tile_count = out_tiles * local_in_tiles
    block_count = tile_count // TILES_PER_BLOCK
    data_words = block_count * SUPER_BLOCK_WORDS
    return valid_out, padded_out, valid_in, padded_in, out_tiles, local_in_tiles, tile_count, block_count, data_words

matrix_data_words_map = {m: matrix_shape_info(m)[8] for m in range(8)}
layer_data_stride = sum(matrix_data_words_map[m] for m in range(7)) # 426,496

def get_data_offset(layer, mode):
    if mode == MODE_LOGITS:
        return NUM_LAYERS * layer_data_stride
    off = layer * layer_data_stride
    for prior in range(mode):
        off += matrix_data_words_map[prior]
    return off

def get_norm_offset(layer, norm_mode):
    if norm_mode == NORM_FINAL:
        return NUM_LAYERS * 128 # 4096
    return layer * 128 + (64 if norm_mode == NORM_FFN else 0)

def permute_qk_rows(mat):
    """Convert Hugging Face split-half RoPE rows to adjacent-pair rows."""
    M, K = mat.shape
    num_heads = 32
    head_dim = 128
    assert M == num_heads * head_dim
    heads = mat.reshape(num_heads, head_dim, K)
    permuted = np.empty_like(heads)
    half = head_dim // 2
    permuted[:, 0::2, :] = heads[:, :half, :]
    permuted[:, 1::2, :] = heads[:, half:, :]
    return permuted.reshape(M, K)

def pack_matrix_to_super_blocks(pe, mat_w, mat_scales_q115, out_tiles, local_in_tiles, M, K):
    """
    Packs a matrix shard for 1 PE into contiguous Super-Blocks:
    Each Super-Block = 256 words scale + 4096 words weight = 4352 words (278,528 bytes).
    """
    total_tiles = out_tiles * local_in_tiles
    block_count = total_tiles // TILES_PER_BLOCK
    
    # Preallocate buffer for all Super-Blocks of this matrix shard
    out_buf = np.zeros((block_count, SUPER_BLOCK_WORDS, WORD_BYTES), dtype=np.uint8)
    
    for b in range(block_count):
        # 1. Pack 256 scale words (16 tiles * 16 words per tile)
        # Each word is 64 bytes = 32 int16 values
        scale_block = np.zeros((16, 16, 32), dtype=np.int16)
        for t in range(16):
            matrix_tile = b * 16 + t
            out_tile = matrix_tile // local_in_tiles
            local_col_tile = matrix_tile % local_in_tiles
            
            row_start = out_tile * 128
            col_start = (pe * local_in_tiles + local_col_tile) * 256
            g128_start = col_start // 128
            
            # Unpack 8 active scale words
            for w in range(8):
                for s in range(32):
                    r_local = s // 8
                    lane = (s % 8) // 2
                    g128 = s % 2
                    row_block = w * 4 + r_local
                    r = row_block * 4 + lane
                    global_r = row_start + r
                    global_g128 = g128_start + g128
                    if global_r < M and global_g128 < (K // 128):
                        scale_block[t, w, s] = mat_scales_q115[global_r, global_g128]
            # Words 8..15 remain 0 (padding)
            
        out_buf[b, :SCALE_WORDS_PER_BLOCK] = scale_block.view(np.uint8).reshape(256, 64)
        
        # 2. Pack 4096 weight words (16 tiles * 256 words per tile)
        weight_block = np.zeros((16, 8, 32, 64), dtype=np.uint8) # [16 tiles, 8 groups, 32 row_blocks, 64 bytes]
        for t in range(16):
            matrix_tile = b * 16 + t
            out_tile = matrix_tile // local_in_tiles
            local_col_tile = matrix_tile % local_in_tiles
            
            row_start = out_tile * 128
            col_start = (pe * local_in_tiles + local_col_tile) * 256
            
            tile_w = np.zeros((128, 256), dtype=np.int8)
            r_end = min(row_start + 128, M)
            c_end = min(col_start + 256, K)
            if r_end > row_start and c_end > col_start:
                tile_w[:r_end - row_start, :c_end - col_start] = mat_w[row_start:r_end, col_start:c_end]
            
            # Offset binary 4-bit two's complement: val & 0x0F
            q4 = tile_w & 0x0F
            
            # Vectorized packing: reshape tile into [32 row_blocks, 4 rows, 8 groups, 32 lanes]
            # Transpose to [8 groups, 32 row_blocks, 32 lanes, 4 rows]
            q4_tr = q4.reshape(32, 4, 8, 32).transpose(2, 0, 3, 1)
            
            r0 = q4_tr[..., 0]
            r1 = q4_tr[..., 1]
            r2 = q4_tr[..., 2]
            r3 = q4_tr[..., 3]
            
            byte0 = (r0 << 4) | (r1 & 0x0F)
            byte1 = (r2 << 4) | (r3 & 0x0F)
            
            weight_block[t, :, :, 0::2] = byte0
            weight_block[t, :, :, 1::2] = byte1
            
        out_buf[b, SCALE_WORDS_PER_BLOCK:] = weight_block.reshape(4096, 64)
        
    return out_buf.reshape(-1) # 1D byte array

def main():
    print("==================================================================")
    print(" AutoRound W4G128 Model Packer for AMD Alveo U250 (4 PEs)")
    print(" Layout: Interleaved Super-Blocks (1 Scale : 16 Weight bursts)")
    print("==================================================================")
    
    total_start_time = time.time()
    
    if not os.path.exists(AUTOROUND_BIN_PATH):
        raise FileNotFoundError(f"Model file not found: {AUTOROUND_BIN_PATH}")
        
    f_in = open(AUTOROUND_BIN_PATH, "rb")
    
    # 1. Read Header
    header = f_in.read(256)
    magic, ver, dim, hidden_dim, n_layers, n_heads, n_kv_heads, vocab_size, group_size = struct.unpack("<4sIIIIIIII", header[:36])
    assert magic == b"AR4\x00", f"Invalid magic: {magic}"
    print(f"[1/5] Loaded header: Dim={dim}, Hidden={hidden_dim}, Layers={n_layers}, GroupSize={group_size}")
    
    # 2. Extract Token Embeddings
    emb_path = os.path.join(OUTPUT_DIR, "embeddings.bin")
    emb_bytes = vocab_size * dim * 4
    if not os.path.exists(emb_path) or os.path.getsize(emb_path) != emb_bytes:
        print(f"[2/5] Writing {emb_path} ({emb_bytes / (1024*1024):.1f} MB)...")
        emb_data = f_in.read(emb_bytes)
        with open(emb_path, "wb") as f_emb:
            f_emb.write(emb_data)
    else:
        print(f"[2/5] {emb_path} already exists. Seeking past embeddings...")
        f_in.seek(256 + emb_bytes)
        
    # 3. Initialize 4 DDR Binary Files
    print(f"\n[3/5] Initializing 4 DDR Binary Files ({TOTAL_BYTES_PER_BANK / (1024*1024):.1f} MB each)...")
    banks = []
    for p in range(NUM_PES):
        bin_path = os.path.join(OUTPUT_DIR, f"model_bank{p}.bin")
        create_mode = "r+b" if os.path.exists(bin_path) else "w+b"
        with open(bin_path, create_mode) as bf:
            bf.truncate(TOTAL_BYTES_PER_BANK)
        banks.append(np.memmap(bin_path, dtype=np.uint8, mode="r+", shape=(TOTAL_BYTES_PER_BANK,)))
        print(f"  Mapped model_bank{p}.bin")

    # Helper to unpack weights from autoround raw bytes
    def read_ar_matrix(M, K):
        w_raw = np.frombuffer(f_in.read(M * (K // 2)), dtype=np.uint8).reshape(M, K // 2)
        scales_f32 = np.frombuffer(f_in.read(M * (K // 128) * 4), dtype=np.float32).reshape(M, K // 128)
        
        # Unpack offset binary: col 2*i is byte & 0x0F - 8, col 2*i + 1 is byte >> 4 - 8
        w_unpacked = np.empty((M, K), dtype=np.int8)
        w_unpacked[:, 0::2] = (w_raw & 0x0F).astype(np.int8) - 8
        w_unpacked[:, 1::2] = (w_raw >> 4).astype(np.int8) - 8
        
        # Convert scales to Q1.15
        scales_q115 = np.clip(np.round(scales_f32 * 32768.0), -32768, 32767).astype(np.int16)
        return w_unpacked, scales_q115

    # 4. Pack 32 Layers
    print("\n[4/5] Packing 32 Transformer Decoder Layers...")
    
    projs = [
        (MODE_Q,    "w_q",    DIM,        DIM),
        (MODE_K,    "w_k",    DIM,        DIM),
        (MODE_V,    "w_v",    DIM,        DIM),
        (MODE_O,    "w_o",    DIM,        DIM),
        (MODE_GATE, "w_gate", HIDDEN_DIM, DIM),
        (MODE_UP,   "w_up",   HIDDEN_DIM, DIM),
        (MODE_DOWN, "w_down", DIM,        HIDDEN_DIM),
    ]

    for l in range(NUM_LAYERS):
        t_layer_start = time.time()
        
        # Attention Norm
        attn_norm = np.frombuffer(f_in.read(DIM * 4), dtype=np.float32)
        # FFN Norm is read after w_o
        # Read w_q, w_k, w_v, w_o
        layer_mats = {}
        for mode, name, M, K in projs[:4]:
            w, s = read_ar_matrix(M, K)
            if mode in (MODE_Q, MODE_K):
                w = permute_qk_rows(w)
                s = permute_qk_rows(s)
            layer_mats[mode] = (w, s)
            
        ffn_norm = np.frombuffer(f_in.read(DIM * 4), dtype=np.float32)
        
        for mode, name, M, K in projs[4:]:
            w, s = read_ar_matrix(M, K)
            layer_mats[mode] = (w, s)
            
        # Write Norm weights to banks:
        # Attn Norm at layer * 128 + 0
        # FFN Norm at layer * 128 + 64
        attn_word = NORM_BASE_WORD + get_norm_offset(l, NORM_ATTN)
        ffn_word = NORM_BASE_WORD + get_norm_offset(l, NORM_FFN)
        attn_bytes = attn_norm.view(np.uint8)
        ffn_bytes = ffn_norm.view(np.uint8)
        
        for p in range(NUM_PES):
            p_attn = attn_bytes[p * 1024 * 4 : (p + 1) * 1024 * 4]
            p_ffn = ffn_bytes[p * 1024 * 4 : (p + 1) * 1024 * 4]
            banks[p][attn_word * WORD_BYTES : (attn_word + 64) * WORD_BYTES] = p_attn
            banks[p][ffn_word * WORD_BYTES : (ffn_word + 64) * WORD_BYTES] = p_ffn
            
        # Pack the 7 linear projections for this layer
        for mode, name, M, K in projs:
            w, s = layer_mats[mode]
            valid_out, padded_out, valid_in, padded_in, out_tiles, local_in_tiles, tile_count, block_count, data_words = matrix_shape_info(mode)
            
            # Apply padding if necessary
            if padded_out != valid_out or padded_in != valid_in:
                w_pad = np.zeros((padded_out, padded_in), dtype=np.int8)
                w_pad[:valid_out, :valid_in] = w
                s_pad = np.zeros((padded_out, padded_in // 128), dtype=np.int16)
                s_pad[:valid_out, :valid_in // 128] = s
                w, s = w_pad, s_pad
                
            data_offset_word = DATA_BASE_WORD + get_data_offset(l, mode)
            byte_start = data_offset_word * WORD_BYTES
            
            for p in range(NUM_PES):
                packed_bytes = pack_matrix_to_super_blocks(p, w, s, out_tiles, local_in_tiles, padded_out, padded_in)
                banks[p][byte_start : byte_start + len(packed_bytes)] = packed_bytes
                
        print(f"  Layer {l:2d}/32 packed in {time.time() - t_layer_start:.2f}s")
        
    # 5. Final Norm & LM Head (Logits)
    print("\n[5/5] Packing Final Norm & LM Head (Logits)...")
    final_norm = np.frombuffer(f_in.read(DIM * 4), dtype=np.float32)
    final_word = NORM_BASE_WORD + get_norm_offset(0, NORM_FINAL)
    fn_bytes = final_norm.view(np.uint8)
    for p in range(NUM_PES):
        p_fn = fn_bytes[p * 1024 * 4 : (p + 1) * 1024 * 4]
        banks[p][final_word * WORD_BYTES : (final_word + 64) * WORD_BYTES] = p_fn
        
    # LM Head: [32000, 4096] float32
    head_raw = np.frombuffer(f_in.read(VOCAB_SIZE * DIM * 4), dtype=np.float32).reshape(VOCAB_SIZE, DIM)
    valid_out, padded_out, valid_in, padded_in, out_tiles, local_in_tiles, tile_count, block_count, data_words = matrix_shape_info(MODE_LOGITS)
    
    # Pad to [32256, 4096]
    head_pad = np.zeros((padded_out, padded_in), dtype=np.float32)
    head_pad[:valid_out, :valid_in] = head_raw
    
    # AutoRound W4G128 quantization for LM Head:
    # Group size 128 along columns -> 32 groups
    head_reshaped = head_pad.reshape(padded_out, padded_in // 128, 128)
    max_abs = np.max(np.abs(head_reshaped), axis=2, keepdims=True)
    max_abs = np.maximum(max_abs, 1e-8)
    scales_f32 = (max_abs / 7.0).squeeze(axis=2) # [padded_out, 32]
    
    q_cand = np.clip(np.round(head_reshaped / (scales_f32[:, :, None] + 1e-12)), -8, 7).astype(np.int8)
    head_w = q_cand.reshape(padded_out, padded_in)
    head_s_q115 = np.clip(np.round(scales_f32 * 32768.0), -32768, 32767).astype(np.int16)
    
    logits_offset_word = DATA_BASE_WORD + get_data_offset(0, MODE_LOGITS)
    logits_byte_start = logits_offset_word * WORD_BYTES
    
    for p in range(NUM_PES):
        packed_bytes = pack_matrix_to_super_blocks(p, head_w, head_s_q115, out_tiles, local_in_tiles, padded_out, padded_in)
        banks[p][logits_byte_start : logits_byte_start + len(packed_bytes)] = packed_bytes
        
    f_in.close()
    
    # Flush all memory-mapped files to disk
    print("\nFlushing 4 DDR binary images to disk...")
    for p in range(NUM_PES):
        banks[p].flush()
        file_size = os.path.getsize(os.path.join(OUTPUT_DIR, f"model_bank{p}.bin"))
        print(f"  model_bank{p}.bin saved: {file_size:,} bytes ({file_size / (1024*1024):.1f} MB)")
        
    print(f"\n==================================================================")
    print(f" SUCCESS: ALL 4 DDR BANKS PACKED IN {time.time() - total_start_time:.1f}s")
    print(f"==================================================================")

if __name__ == "__main__":
    main()
