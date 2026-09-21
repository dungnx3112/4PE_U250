import os
import time
import numpy as np
from transformers import AutoTokenizer

MODEL_DIR = "C:/KLTN/4PE_U250/Llama-2-7b-chat-hf"
BANKS_DIR = "C:/KLTN/4PE_U250"

DIM = 4096
HIDDEN_DIM = 11008
PADDED_HIDDEN_DIM = 11264
VOCAB_SIZE = 32000
PADDED_VOCAB_SIZE = 32256
NUM_HEADS = 32
HEAD_DIM = 128
NUM_PES = 4
LOCAL_DIM = 1024
LOCAL_HIDDEN_DIM = 2816
LOCAL_HEADS = 8
GROUP_SIZE = 32
MAX_SEQ_LEN = 256

WORD_BYTES = 64
SCALE_BASE_WORD = 0
NORM_BASE_WORD = 1600
WEIGHT_BASE_WORD = 5760

MODE_Q, MODE_K, MODE_V, MODE_O = 0, 1, 2, 3
MODE_GATE, MODE_UP, MODE_DOWN = 4, 5, 6
MODE_LOGITS = 7

def get_weight_offset(layer, mode):
    matrix_weight_words = [32768, 32768, 32768, 32768, 90112, 90112, 90112, 258048]
    if mode == MODE_LOGITS:
        return 32 * 401408
    off = layer * 401408
    for p in range(mode):
        off += matrix_weight_words[p]
    return off

def get_scale_offset(layer, mode):
    matrix_scale_words = [4, 4, 4, 4, 11, 11, 11, 32]
    if mode == MODE_LOGITS:
        return 32 * 49
    off = layer * 49
    for p in range(mode):
        off += matrix_scale_words[p]
    return off

def get_norm_offset(layer, norm_mode):
    if norm_mode == 2: # FINAL
        return 32 * 128
    return layer * 128 + (64 if norm_mode == 1 else 0)

class RealModelRunner:
    def __init__(self, num_layers=32):
        self.num_layers = num_layers
        print(f"[Init] Loading Tokenizer from {MODEL_DIR}...")
        self.tokenizer = AutoTokenizer.from_pretrained(MODEL_DIR, use_fast=False)

        print(f"[Init] Memory-mapping 4 DDR Banks ({BANKS_DIR}/model_bank0..3.bin)...")
        self.banks = []
        for p in range(NUM_PES):
            bin_path = os.path.join(BANKS_DIR, f"model_bank{p}.bin")
            mmap = np.memmap(bin_path, dtype=np.uint8, mode='r')
            self.banks.append(mmap)

        print("[Init] Loading Embeddings table (32000 x 4096)...")
        emb_path = os.path.join(BANKS_DIR, "embeddings.bin")
        self.embeddings = np.fromfile(emb_path, dtype=np.float32).reshape(VOCAB_SIZE, DIM)

        # Load Final Norm Gamma
        self.final_norm_gamma = np.empty(DIM, dtype=np.float32)
        final_norm_base = (NORM_BASE_WORD + get_norm_offset(0, 2)) * WORD_BYTES
        for p in range(NUM_PES):
            self.final_norm_gamma[p*1024 : (p+1)*1024] = np.frombuffer(
                self.banks[p][final_norm_base : final_norm_base + 4096], dtype=np.float32
            )

        print(f"[Init] Initializing KV Cache for {num_layers} layers...")
        # KV Cache: [layer, head, max_seq_len, head_dim]
        self.k_cache = np.zeros((num_layers, NUM_HEADS, MAX_SEQ_LEN, HEAD_DIM), dtype=np.float32)
        self.v_cache = np.zeros((num_layers, NUM_HEADS, MAX_SEQ_LEN, HEAD_DIM), dtype=np.float32)

    def load_layer_gammas(self, layer):
        attn_norm_base = (NORM_BASE_WORD + get_norm_offset(layer, 0)) * WORD_BYTES
        ffn_norm_base = (NORM_BASE_WORD + get_norm_offset(layer, 1)) * WORD_BYTES
        attn_gamma = np.empty(DIM, dtype=np.float32)
        ffn_gamma = np.empty(DIM, dtype=np.float32)
        for p in range(NUM_PES):
            attn_gamma[p*1024 : (p+1)*1024] = np.frombuffer(
                self.banks[p][attn_norm_base : attn_norm_base + 4096], dtype=np.float32
            )
            ffn_gamma[p*1024 : (p+1)*1024] = np.frombuffer(
                self.banks[p][ffn_norm_base : ffn_norm_base + 4096], dtype=np.float32
            )
        return attn_gamma, ffn_gamma

    def gemv_4pe(self, layer, mode, act):
        # act: shape [cols]
        if mode in (MODE_Q, MODE_K, MODE_V, MODE_O):
            out_rows, in_cols = DIM, DIM
            out_tiles, in_tiles = 32, 4
        elif mode in (MODE_GATE, MODE_UP):
            out_rows, in_cols = PADDED_HIDDEN_DIM, DIM
            out_tiles, in_tiles = 88, 4
        elif mode == MODE_DOWN:
            out_rows, in_cols = DIM, PADDED_HIDDEN_DIM
            out_tiles, in_tiles = 32, 11
        elif mode == MODE_LOGITS:
            out_rows, in_cols = PADDED_VOCAB_SIZE, DIM
            out_tiles, in_tiles = 252, 4

        w_offset = (WEIGHT_BASE_WORD + get_weight_offset(layer, mode)) * WORD_BYTES
        s_offset = (SCALE_BASE_WORD + get_scale_offset(layer, mode)) * WORD_BYTES
        tile_count = out_tiles * in_tiles

        output = np.zeros(out_rows, dtype=np.float32)
        local_cols = in_cols // NUM_PES

        # 4 PEs execute in parallel
        for p in range(NUM_PES):
            p_act = act[p * local_cols : (p + 1) * local_cols] # shape [local_cols]
            # Read tile scales
            scales = np.frombuffer(self.banks[p][s_offset : s_offset + tile_count * 2], dtype=np.float16).astype(np.float32)
            scales = scales.reshape(out_tiles, in_tiles)

            # Read packed weights
            w_bytes = out_tiles * in_tiles * 256 * WORD_BYTES
            p_bytes = np.frombuffer(self.banks[p][w_offset : w_offset + w_bytes], dtype=np.uint8)
            p_words = p_bytes.reshape(out_tiles, in_tiles, 8, 32, 64)

            # Unpack INT4 weights
            b0 = p_words[..., 0::2] # [out_tiles, in_tiles, 8, 32, 32]
            b1 = p_words[..., 1::2]

            def s4(n):
                val = n.astype(np.int8)
                return np.where(val >= 8, val - 16, val)

            r0 = s4(b0 >> 4)
            r1 = s4(b0 & 0x0F)
            r2 = s4(b1 >> 4)
            r3 = s4(b1 & 0x0F)

            # Stack back to [out_tiles, in_tiles, 32 row_blocks, 4 rows, 8 groups, 32 cols]
            # Tile shape: [out_tiles, in_tiles, 128 rows, 256 cols]
            w_tile = np.empty((out_tiles, in_tiles, 32, 8, 32, 4), dtype=np.float32)
            w_tile[..., 0] = r0.transpose(0, 1, 3, 2, 4)
            w_tile[..., 1] = r1.transpose(0, 1, 3, 2, 4)
            w_tile[..., 2] = r2.transpose(0, 1, 3, 2, 4)
            w_tile[..., 3] = r3.transpose(0, 1, 3, 2, 4)

            # Reshape to [out_tiles, 128 rows, in_tiles, 256 cols]
            w_matrix = w_tile.transpose(0, 2, 5, 1, 3, 4).reshape(out_tiles * 128, in_tiles * 256)
            
            # Apply tile scales
            s_expanded = np.repeat(np.repeat(scales, 128, axis=0), 256, axis=1)
            w_matrix *= s_expanded

            # Matmul contribution of PE p
            output += w_matrix @ p_act

        return output

    def decode_token(self, residual, pos):
        # residual: shape [4096]
        for l in range(self.num_layers):
            attn_gamma, ffn_gamma = self.load_layer_gammas(l)

            # 1. RMSNorm (Attention)
            rms = np.sqrt(np.mean(residual ** 2) + 1e-5)
            normed = (residual / rms) * attn_gamma

            # 2. Q, K, V GEMV
            q = self.gemv_4pe(l, MODE_Q, normed)
            k = self.gemv_4pe(l, MODE_K, normed)
            v = self.gemv_4pe(l, MODE_V, normed)

            # 3. RoPE
            for h in range(NUM_HEADS):
                q_h = q[h * HEAD_DIM : (h + 1) * HEAD_DIM]
                k_h = k[h * HEAD_DIM : (h + 1) * HEAD_DIM]
                for p in range(HEAD_DIM // 2):
                    freq = 10000.0 ** (-p / (HEAD_DIM / 2.0))
                    angle = pos * freq
                    cos_val, sin_val = np.cos(angle), np.sin(angle)
                    
                    x0, x1 = q_h[2*p], q_h[2*p+1]
                    q_h[2*p]   = x0 * cos_val - x1 * sin_val
                    q_h[2*p+1] = x0 * sin_val + x1 * cos_val

                    x0, x1 = k_h[2*p], k_h[2*p+1]
                    k_h[2*p]   = x0 * cos_val - x1 * sin_val
                    k_h[2*p+1] = x0 * sin_val + x1 * cos_val

            # 4. KV Cache Update & Attention
            self.k_cache[l, :, pos, :] = k.reshape(NUM_HEADS, HEAD_DIM)
            self.v_cache[l, :, pos, :] = v.reshape(NUM_HEADS, HEAD_DIM)

            attn_out = np.zeros(DIM, dtype=np.float32)
            scale = 1.0 / np.sqrt(HEAD_DIM)

            for h in range(NUM_HEADS):
                q_h = q[h * HEAD_DIM : (h + 1) * HEAD_DIM] # [128]
                k_seq = self.k_cache[l, h, :pos+1, :]     # [pos+1, 128]
                v_seq = self.v_cache[l, h, :pos+1, :]     # [pos+1, 128]

                scores = (k_seq @ q_h) * scale             # [pos+1]
                scores_max = np.max(scores)
                exp_scores = np.exp(scores - scores_max)
                weights = exp_scores / np.sum(exp_scores)   # [pos+1]
                out_h = weights @ v_seq                     # [128]
                attn_out[h * HEAD_DIM : (h + 1) * HEAD_DIM] = out_h

            # 5. O Projection & Residual Add
            proj_o = self.gemv_4pe(l, MODE_O, attn_out)
            residual += proj_o

            # 6. RMSNorm (FFN)
            rms_ffn = np.sqrt(np.mean(residual ** 2) + 1e-5)
            normed_ffn = (residual / rms_ffn) * ffn_gamma

            # 7. GATE & UP Projections
            gate = self.gemv_4pe(l, MODE_GATE, normed_ffn)
            up = self.gemv_4pe(l, MODE_UP, normed_ffn)

            # 8. SwiGLU: (gate * sigmoid(gate)) * up
            sigmoid_gate = 1.0 / (1.0 + np.exp(-gate))
            swiglu_out = (gate * sigmoid_gate) * up

            # 9. DOWN Projection & Residual Add
            proj_down = self.gemv_4pe(l, MODE_DOWN, swiglu_out)
            residual += proj_down

        # Final RMSNorm
        rms_final = np.sqrt(np.mean(residual ** 2) + 1e-5)
        normed_final = (residual / rms_final) * self.final_norm_gamma

        # Logits Projection
        padded_logits = self.gemv_4pe(0, MODE_LOGITS, normed_final)
        logits = padded_logits[:VOCAB_SIZE]
        return logits

    def generate(self, prompt_text, max_new_tokens=10):
        print(f"\n[Prompt]: \"{prompt_text}\"")
        prompt_tokens = self.tokenizer.encode(prompt_text)
        print(f"[Tokens]: {prompt_tokens}")

        residual = np.zeros(DIM, dtype=np.float32)
        pos = 0

        # Prefill phase
        t0 = time.time()
        for t in prompt_tokens:
            emb = self.embeddings[t].copy()
            residual = emb
            logits = self.decode_token(residual, pos)
            pos += 1
        print(f"[Prefill] {len(prompt_tokens)} tokens processed in {time.time() - t0:.2f}s")

        # Decode phase
        generated = []
        next_token = int(np.argmax(logits))
        generated.append(next_token)

        for _ in range(max_new_tokens - 1):
            t_step = time.time()
            emb = self.embeddings[next_token].copy()
            residual = emb
            logits = self.decode_token(residual, pos)
            next_token = int(np.argmax(logits))
            generated.append(next_token)
            pos += 1
            decoded_word = self.tokenizer.decode([next_token])
            print(f"  Step {pos:2d} | Token: {next_token:5d} ({repr(decoded_word):15s}) in {time.time() - t_step:.2f}s")

        full_output = self.tokenizer.decode(prompt_tokens + generated)
        print(f"\n==================================================================")
        print(f"[Generated Text]:\n{full_output}")
        print(f"==================================================================")

if __name__ == "__main__":
    runner = RealModelRunner(num_layers=32)
    runner.generate("The capital of France is", max_new_tokens=8)
