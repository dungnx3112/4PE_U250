#include <iostream>
#include <vector>
#include <cmath>
#include <cstdint>
#include <iomanip>
#include <chrono>
#include <algorithm>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <random>
#include <cstdio>
#include <cstdlib>
#include <cctype>

#ifdef _OPENMP
#include <omp.h>
#endif

// ============================================================================
// Model Architecture Configurations (matching HLS specifications)
// ============================================================================
static constexpr int DIM = 4096;
static constexpr int HIDDEN_DIM = 11008;
static constexpr int PADDED_HIDDEN_DIM = 11264; // 44 tiles of 256
static constexpr int VOCAB_SIZE = 32000;
static constexpr int PADDED_VOCAB_SIZE = 32256;  // 63 row tiles of 128 x 4 PEs
static constexpr int NUM_HEADS = 32;
static constexpr int HEAD_DIM = 128; // 4096 / 32
static constexpr int NUM_PES = 4;
static constexpr int LOCAL_DIM = DIM / NUM_PES; // 1024
static constexpr int LOCAL_HIDDEN_DIM = PADDED_HIDDEN_DIM / NUM_PES; // 2816
static constexpr int LOCAL_HEADS = NUM_HEADS / NUM_PES; // 8
static constexpr int GROUP_SIZE = 32;
static constexpr int MAX_SEQ_LEN = 512;


// HLS Bank Layout Offsets in 512-bit words
static constexpr int SCALE_BASE_WORD = 0;
static constexpr int NORM_BASE_WORD = 1600;
static constexpr int WEIGHT_BASE_WORD = 5760;
static constexpr int TOTAL_WORDS = 13108864;
static constexpr int WORD_BYTES = 64;

static int g_num_layers = 32;
static const std::string HARDCODED_WEIGHTS_DIR = "C:/KLTN/4PE_U250";
static bool g_float_act = false;  // --float-act: bypass E8M0, use float activation (for debugging)
static bool g_e8m0_act = false;   // --e8m0-act: enable E8M0 activation quantization in autoround mode


// ============================================================================
// Data Types & Structures
// ============================================================================
using int14_t = int16_t;
using int4_t = int8_t;

struct QuantizedActivation {
    std::vector<int14_t> q;
    std::vector<float> scale;
};

struct QuantizedMatrix {
    int rows;
    int cols;
    int local_cols;
    std::vector<std::vector<int4_t>> pe_weights; // [4][rows * local_cols]
    std::vector<std::vector<float>> pe_scales;   // [4][tile_count]
};

struct KVCachePE {
    std::vector<int8_t> k_cache;
    std::vector<float> k_scale;
    std::vector<int8_t> v_cache;
    std::vector<float> v_scale;
};

struct DecoderLayer {
    std::vector<float> attn_norm_gamma; // size DIM (4096)
    std::vector<float> ffn_norm_gamma;  // size DIM (4096)

    QuantizedMatrix w_q; // 4096 x 4096
    QuantizedMatrix w_k; // 4096 x 4096
    QuantizedMatrix w_v; // 4096 x 4096
    QuantizedMatrix w_o; // 4096 x 4096

    QuantizedMatrix w_gate; // 11264 x 4096
    QuantizedMatrix w_up;   // 11264 x 4096
    QuantizedMatrix w_down; // 4096 x 11264
};

struct TransformerModel {
    std::vector<DecoderLayer> layers;
    std::vector<float> final_norm_gamma; // size DIM (4096)
    QuantizedMatrix w_logits;             // 32256 x 4096
    std::vector<float> token_embeddings; // VOCAB_SIZE * DIM
    bool loaded_from_real_weights = false;
};

// ============================================================================
// AutoRound W4G128 Data Structures (used when --autoround flag is set)
// Scale: FP32 from autoround_w4g128.bin → stored as Q1.15 int16 in-memory
//        Layout: [M][K/128] int16,  value = raw * (1/32768.0)
// Weight: nibble-packed, offset [-8,7] (byte & 0xF) - 8
// ============================================================================
static constexpr int AR_GROUP_SIZE = 128; // AutoRound group size

struct AutoRoundMatrix {
    int rows;   // M (output dimension, valid rows)
    int cols;   // K (input dimension)
    int num_groups;  // K / 128
    std::vector<uint8_t> packed_weights;  // M * (K/2) bytes, 2 nibbles/byte
    std::vector<int16_t> scales_q115;     // M * num_groups int16 Q1.15
};

struct ARDecoderLayer {
    std::vector<float> attn_norm_gamma;  // [DIM]
    std::vector<float> ffn_norm_gamma;   // [DIM]
    AutoRoundMatrix w_q, w_k, w_v, w_o;
    AutoRoundMatrix w_gate, w_up, w_down;
};

struct AutoRoundModel {
    std::vector<ARDecoderLayer> layers;
    std::vector<float> final_norm_gamma; // [DIM]
    std::vector<float> token_embeddings; // [VOCAB_SIZE * DIM]
    // lm_head: FP32 (not quantized in autoround_w4g128.bin)
    std::vector<float> lm_head;          // [VOCAB_SIZE * DIM]
    bool loaded = false;
};

static bool g_autoround = false;          // --autoround: use autoround_w4g128.bin
static AutoRoundModel g_ar_model;


// ============================================================================
// IEEE-754 Half-Precision (FP16) Conversion Helper
// ============================================================================
static float fp16_to_fp32(uint16_t h) {
    uint32_t sign = (h & 0x8000) << 16;
    uint32_t exp = (h & 0x7c00) >> 10;
    uint32_t frac = (h & 0x03ff);
    if (exp == 0) {
        if (frac == 0) return (sign ? -0.0f : 0.0f);
        while ((frac & 0x0400) == 0) { frac <<= 1; exp--; }
        exp++; frac &= ~0x0400;
        exp = (exp - 15 + 127) << 23;
        frac <<= 13;
        uint32_t bits = sign | exp | frac;
        union { uint32_t u; float f; } u = {bits};
        return u.f;
    } else if (exp == 31) {
        uint32_t bits = sign | 0x7f800000 | (frac << 13);
        union { uint32_t u; float f; } u = {bits};
        return u.f;
    }
    exp = (exp - 15 + 127) << 23;
    frac <<= 13;
    uint32_t bits = sign | exp | frac;
    union { uint32_t u; float f; } u = {bits};
    return u.f;
}

// Group-32 Microscaling E8M0 Activation Quantization to INT14 (QLlama-style)
void quantize_activation_g32(const float* input, int size, QuantizedActivation& out) {
    out.q.resize(size);
    const int num_groups = size / GROUP_SIZE;
    out.scale.resize(num_groups);

    for (int g = 0; g < num_groups; ++g) {
        const int base = g * GROUP_SIZE;
        int max_exp = -255;
        int exps[GROUP_SIZE];
        float mantissas[GROUP_SIZE];

        // Pass 1: frexpf extracts mantissa in [-1, +1) and exponent (zero division)
        for (int i = 0; i < GROUP_SIZE; ++i) {
            float val = input[base + i];
            if (val != 0.0f) {
                mantissas[i] = std::frexpf(val, &exps[i]);
                if (exps[i] > max_exp) max_exp = exps[i];
            } else {
                mantissas[i] = 0.0f;
                exps[i] = -255;
            }
        }
        if (max_exp < -127) max_exp = -127;

        // Scale: 2^(max_exp - 13) so that INT14 raw bits reconstruct the value.
        out.scale[g] = std::ldexp(1.0f, max_exp - 13);

        // Pass 2: shift mantissa right by (max_exp - exp_i) and clamp to INT14
        for (int i = 0; i < GROUP_SIZE; ++i) {
            if (exps[i] == -255) {
                out.q[base + i] = 0;
                continue;
            }
            const int dif = max_exp - exps[i];
            const float scaled = std::ldexp(mantissas[i], -dif);
            int val = static_cast<int>(std::round(scaled * 8192.0f));
            if (val > 8191) val = 8191;
            if (val < -8191) val = -8191;
            out.q[base + i] = static_cast<int14_t>(val);
        }
    }
}


// ============================================================================
// 4-PE Sharded GEMV Engine (Emulating HLS HW Reduction Tree)
// ============================================================================
void sharded_gemv_4pe(
    const QuantizedMatrix& mat,
    const QuantizedActivation& act,
    std::vector<float>& output
) {
    output.assign(mat.rows, 0.0f);
    const int tile_rows = 128;
    const int tile_cols = 256;
    const int col_tiles = (mat.local_cols + tile_cols - 1) / tile_cols;

    std::vector<std::vector<float>> pe_partials(NUM_PES, std::vector<float>(mat.rows, 0.0f));

    #pragma omp parallel for collapse(2) schedule(static)
    for (int p = 0; p < NUM_PES; ++p) {
        for (int r = 0; r < mat.rows; ++r) {
            const int4_t* weights = mat.pe_weights[p].data();
            const float* scales = mat.pe_scales[p].data();
            const int col_offset = p * mat.local_cols;
            const int rt = r / tile_rows;
            float row_sum = 0.0f;

            for (int ct = 0; ct < col_tiles; ++ct) {
                const float tile_scale = scales[rt * col_tiles + ct];
                const int start_col = ct * tile_cols;
                const int end_col = std::min(start_col + tile_cols, mat.local_cols);

                for (int c = start_col; c < end_col; c += GROUP_SIZE) {
                    const int global_c = col_offset + c;
                    const int g = global_c / GROUP_SIZE;
                    const float act_scale = act.scale[g];
                    const float combined_scale = tile_scale * act_scale;

                    int32_t group_dot = 0;
                    for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                        const int4_t w = weights[r * mat.local_cols + c + lane];
                        const int14_t a = act.q[global_c + lane];
                        group_dot += static_cast<int32_t>(w) * static_cast<int32_t>(a);
                    }
                    row_sum += static_cast<float>(group_dot) * combined_scale;
                }
            }
            pe_partials[p][r] = row_sum;
        }
    }

    #pragma omp parallel for schedule(static)
    for (int r = 0; r < mat.rows; ++r) {
        float sum01 = pe_partials[0][r] + pe_partials[1][r];
        float sum23 = pe_partials[2][r] + pe_partials[3][r];
        output[r] = sum01 + sum23;
    }
}

// Float-activation GEMV: bypass E8M0, use fp32 activations with INT4 weights + tile scales
void sharded_gemv_4pe_float(
    const QuantizedMatrix& mat,
    const float* act_float,   // float array of size mat.cols
    std::vector<float>& output
) {
    output.assign(mat.rows, 0.0f);
    const int tile_rows = 128;
    const int tile_cols = 256;
    const int col_tiles = (mat.local_cols + tile_cols - 1) / tile_cols;

    std::vector<std::vector<float>> pe_partials(NUM_PES, std::vector<float>(mat.rows, 0.0f));

    #pragma omp parallel for collapse(2) schedule(static)
    for (int p = 0; p < NUM_PES; ++p) {
        for (int r = 0; r < mat.rows; ++r) {
            const int4_t* weights = mat.pe_weights[p].data();
            const float* scales = mat.pe_scales[p].data();
            const int col_offset = p * mat.local_cols;
            const int rt = r / tile_rows;
            float row_sum = 0.0f;

            for (int ct = 0; ct < col_tiles; ++ct) {
                const float tile_scale = scales[rt * col_tiles + ct];
                const int start_col = ct * tile_cols;
                const int end_col = std::min(start_col + tile_cols, mat.local_cols);

                float tile_dot = 0.0f;
                for (int c = start_col; c < end_col; ++c) {
                    const int4_t w = weights[r * mat.local_cols + c];
                    const float a = act_float[col_offset + c];
                    tile_dot += static_cast<float>(w) * a;
                }
                row_sum += tile_dot * tile_scale;
            }
            pe_partials[p][r] = row_sum;
        }
    }

    #pragma omp parallel for schedule(static)
    for (int r = 0; r < mat.rows; ++r) {
        float sum01 = pe_partials[0][r] + pe_partials[1][r];
        float sum23 = pe_partials[2][r] + pe_partials[3][r];
        output[r] = sum01 + sum23;
    }
}

// ============================================================================
// AutoRound W4G128 GEMV: y = W * x
// W: nibble-packed INT4, range [-8,7] (offset binary, unpack = (byte & 0xF) - 8)
// Scale: Q1.15 int16, per-row per-group-128, value = raw * (1/32768.0)
// ============================================================================
void gemv_autoround(
    const AutoRoundMatrix& mat,
    const float* x,
    std::vector<float>& y
) {
    y.assign(mat.rows, 0.0f);
    const int K = mat.cols;
    const int M = mat.rows;
    const int ng = mat.num_groups;  // K / 128
    const uint8_t* weights = mat.packed_weights.data();
    const int16_t* scales = mat.scales_q115.data();

    #pragma omp parallel for schedule(static)
    for (int m = 0; m < M; ++m) {
        const uint8_t* w_row = weights + static_cast<size_t>(m) * (K / 2);
        const int16_t* s_row = scales + m * ng;
        float acc = 0.0f;

        for (int g = 0; g < ng; ++g) {
            // Q1.15 -> float: raw * 2^-15
            const float scale = static_cast<float>(s_row[g]) * (1.0f / 32768.0f);
            const int start_k = g * AR_GROUP_SIZE;
            const uint8_t* w_grp = w_row + start_k / 2;
            const float* x_grp = x + start_k;

            float grp_sum = 0.0f;
            for (int i = 0; i < AR_GROUP_SIZE / 2; ++i) {
                const uint8_t byte = w_grp[i];
                const int8_t w0 = static_cast<int8_t>(byte & 0x0F) - 8;
                const int8_t w1 = static_cast<int8_t>(byte >> 4) - 8;
                grp_sum += static_cast<float>(w0) * x_grp[2 * i]
                         + static_cast<float>(w1) * x_grp[2 * i + 1];
            }
            acc += grp_sum * scale;
        }
        y[m] = acc;
    }
}

// ============================================================================
// AutoRound W4G128 GEMV with E8M0 Microscaling Quantized Activation
// W: nibble-packed INT4 [-8, 7]
// W scale: Q1.15 int16 per-group-128
// Act: INT14 [-8191, 8191]
// Act scale: E8M0 per-group-32 (4 act groups per 1 weight group)
// Compute: exact INT4 * INT14 integer MAC over 32 lanes, scale combined
// ============================================================================
void gemv_autoround_e8m0(
    const AutoRoundMatrix& mat,
    const QuantizedActivation& act,
    std::vector<float>& y
) {
    y.assign(mat.rows, 0.0f);
    const int K = mat.cols;
    const int M = mat.rows;
    const int ng = mat.num_groups;  // K / 128
    const uint8_t* weights = mat.packed_weights.data();
    const int16_t* scales = mat.scales_q115.data();
    const int14_t* act_q = act.q.data();
    const float* act_scales = act.scale.data();

    #pragma omp parallel for schedule(static)
    for (int m = 0; m < M; ++m) {
        const uint8_t* w_row = weights + static_cast<size_t>(m) * (K / 2);
        const int16_t* s_row = scales + m * ng;
        float row_acc = 0.0f;

        for (int g = 0; g < ng; ++g) {
            const float w_scale = static_cast<float>(s_row[g]) * (1.0f / 32768.0f);
            float g128_acc = 0.0f;

            for (int sg = 0; sg < 4; ++sg) {
                const int g32 = g * 4 + sg;
                const float a_scale = act_scales[g32];
                const int start_k = g32 * GROUP_SIZE;
                const uint8_t* w_ptr = w_row + start_k / 2;
                const int14_t* a_ptr = act_q + start_k;

                int32_t dot32 = 0;
                for (int i = 0; i < GROUP_SIZE / 2; ++i) {
                    const uint8_t byte = w_ptr[i];
                    const int32_t w0 = static_cast<int32_t>(static_cast<int8_t>(byte & 0x0F) - 8);
                    const int32_t w1 = static_cast<int32_t>(static_cast<int8_t>(byte >> 4) - 8);
                    dot32 += w0 * static_cast<int32_t>(a_ptr[2 * i])
                           + w1 * static_cast<int32_t>(a_ptr[2 * i + 1]);
                }
                g128_acc += static_cast<float>(dot32) * a_scale;
            }
            row_acc += g128_acc * w_scale;
        }
        y[m] = row_acc;
    }
}

// ============================================================================
// Elementwise Operations
// ============================================================================

void rmsnorm(const float* input, const float* gamma, int size, float* output) {
    float sum_sq = 0.0f;
    for (int i = 0; i < size; ++i) {
        sum_sq += input[i] * input[i];
    }
    float rsqrt = 1.0f / std::sqrt((sum_sq / static_cast<float>(size)) + 1e-5f);
    for (int i = 0; i < size; ++i) {
        output[i] = input[i] * rsqrt * gamma[i];
    }
}

void apply_rope(float* vec, int num_heads, int head_dim, int pos) {
    // HuggingFace Llama-2 uses split-half RoPE:
    // first head_dim/2 elements rotate with second head_dim/2 elements
    const int half = head_dim / 2;
    for (int h = 0; h < num_heads; ++h) {
        float* h_ptr = vec + h * head_dim;
        for (int p = 0; p < half; ++p) {
            const float freq = 1.0f / std::pow(10000.0f, static_cast<float>(2 * p) / static_cast<float>(head_dim));
            const float angle = static_cast<float>(pos) * freq;
            const float cos_val = std::cos(angle);
            const float sin_val = std::sin(angle);

            const float x0 = h_ptr[p];
            const float x1 = h_ptr[p + half];
            h_ptr[p]        = x0 * cos_val - x1 * sin_val;
            h_ptr[p + half] = x1 * cos_val + x0 * sin_val;
        }
    }
}

void swiftkv_attention_4pe(
    const float* q,
    const float* k,
    const float* v,
    KVCachePE* kv_pes,
    int layer_idx,
    int pos,
    float* attn_out
) {
    const float scale = 1.0f / std::sqrt(static_cast<float>(HEAD_DIM));

    #pragma omp parallel for collapse(2) schedule(static)
    for (int p = 0; p < NUM_PES; ++p) {
        for (int lh = 0; lh < LOCAL_HEADS; ++lh) {
            KVCachePE& pe = kv_pes[p];
            const int head_start = p * LOCAL_HEADS;
            const int gh = head_start + lh;
            const float* q_h = q + gh * HEAD_DIM;
            const float* k_h = k + gh * HEAD_DIM;
            const float* v_h = v + gh * HEAD_DIM;

            const int cache_entry_base = ((layer_idx * LOCAL_HEADS + lh) * MAX_SEQ_LEN + pos) * HEAD_DIM;
            const int scale_entry_base = ((layer_idx * LOCAL_HEADS + lh) * MAX_SEQ_LEN + pos) * (HEAD_DIM / 32);

            for (int g = 0; g < HEAD_DIM / 32; ++g) {
                float k_max = 0.0f, v_max = 0.0f;
                for (int i = 0; i < 32; ++i) {
                    if (std::fabs(k_h[g * 32 + i]) > k_max) k_max = std::fabs(k_h[g * 32 + i]);
                    if (std::fabs(v_h[g * 32 + i]) > v_max) v_max = std::fabs(v_h[g * 32 + i]);
                }
                float ks = k_max == 0.0f ? 0.0f : k_max / 127.0f;
                float vs = v_max == 0.0f ? 0.0f : v_max / 127.0f;
                pe.k_scale[scale_entry_base + g] = ks;
                pe.v_scale[scale_entry_base + g] = vs;

                for (int i = 0; i < 32; ++i) {
                    int kq = ks == 0.0f ? 0 : static_cast<int>(std::round(k_h[g * 32 + i] / ks));
                    int vq = vs == 0.0f ? 0 : static_cast<int>(std::round(v_h[g * 32 + i] / vs));
                    pe.k_cache[cache_entry_base + g * 32 + i] = static_cast<int8_t>(std::max(-127, std::min(127, kq)));
                    pe.v_cache[cache_entry_base + g * 32 + i] = static_cast<int8_t>(std::max(-127, std::min(127, vq)));
                }
            }

            float m_val = -1e30f;
            float l_val = 0.0f;
            std::vector<float> acc(HEAD_DIM, 0.0f);

            for (int t = 0; t <= pos; ++t) {
                const int t_cache_base = ((layer_idx * LOCAL_HEADS + lh) * MAX_SEQ_LEN + t) * HEAD_DIM;
                const int t_scale_base = ((layer_idx * LOCAL_HEADS + lh) * MAX_SEQ_LEN + t) * (HEAD_DIM / 32);

                float score = 0.0f;
                for (int g = 0; g < HEAD_DIM / 32; ++g) {
                    float ks = pe.k_scale[t_scale_base + g];
                    for (int i = 0; i < 32; ++i) {
                        float k_val = static_cast<float>(pe.k_cache[t_cache_base + g * 32 + i]) * ks;
                        score += q_h[g * 32 + i] * k_val;
                    }
                }
                score *= scale;

                float m_new = std::max(m_val, score);
                float exp_old = std::exp(m_val - m_new);
                float exp_score = std::exp(score - m_new);

                l_val = l_val * exp_old + exp_score;

                for (int g = 0; g < HEAD_DIM / 32; ++g) {
                    float vs = pe.v_scale[t_scale_base + g];
                    for (int i = 0; i < 32; ++i) {
                        float v_val = static_cast<float>(pe.v_cache[t_cache_base + g * 32 + i]) * vs;
                        acc[g * 32 + i] = acc[g * 32 + i] * exp_old + exp_score * v_val;
                    }
                }
                m_val = m_new;
            }

            float inv_l = l_val > 0.0f ? 1.0f / l_val : 0.0f;
            float* out_h = attn_out + gh * HEAD_DIM;
            for (int d = 0; d < HEAD_DIM; ++d) {
                out_h[d] = acc[d] * inv_l;
            }
        }
    }
}

void swiglu(const float* gate, const float* up, int size, float* output) {
    for (int i = 0; i < size; ++i) {
        float g = gate[i];
        float sigmoid = 1.0f / (1.0f + std::exp(-g));
        output[i] = (g * sigmoid) * up[i];
    }
}

// ============================================================================
// Model Forward Pass (returning logits array)
// ============================================================================
float* forward(
    const TransformerModel& model,
    KVCachePE* kv_pes,
    int token,
    int pos,
    std::vector<float>& residual,
    std::vector<float>& out_logits
) {
    const float* emb_ptr = model.token_embeddings.data() + token * DIM;
    std::copy(emb_ptr, emb_ptr + DIM, residual.begin());

    std::vector<float> normed(DIM);
    std::vector<float> q(DIM), k(DIM), v(DIM);
    std::vector<float> attn_out(DIM);
    std::vector<float> proj_o(DIM);
    std::vector<float> gate(PADDED_HIDDEN_DIM), up(PADDED_HIDDEN_DIM);
    std::vector<float> swiglu_out(PADDED_HIDDEN_DIM);
    std::vector<float> proj_down(DIM);
    QuantizedActivation qact;

    // Helper lambda: dispatch GEMV based on g_float_act flag
    auto do_gemv = [&](const QuantizedMatrix& mat, const float* fp_act, std::vector<float>& out) {
        if (g_float_act) {
            sharded_gemv_4pe_float(mat, fp_act, out);
        } else {
            quantize_activation_g32(fp_act, mat.cols, qact);
            sharded_gemv_4pe(mat, qact, out);
        }
    };

    for (int l = 0; l < g_num_layers; ++l) {
        const DecoderLayer& layer = model.layers[l];

        // 1. RMSNorm(attention)
        rmsnorm(residual.data(), layer.attn_norm_gamma.data(), DIM, normed.data());

        // 2. Q, K, V
        do_gemv(layer.w_q, normed.data(), q);
        do_gemv(layer.w_k, normed.data(), k);
        do_gemv(layer.w_v, normed.data(), v);

        // 3. RoPE
        apply_rope(q.data(), NUM_HEADS, HEAD_DIM, pos);
        apply_rope(k.data(), NUM_HEADS, HEAD_DIM, pos);

        // 4. SwiftKV Attention
        swiftkv_attention_4pe(q.data(), k.data(), v.data(), kv_pes, l, pos, attn_out.data());

        // 5. O Projection & Residual Add
        do_gemv(layer.w_o, attn_out.data(), proj_o);
        for (int i = 0; i < DIM; ++i) residual[i] += proj_o[i];

        // 6. RMSNorm(FFN)
        rmsnorm(residual.data(), layer.ffn_norm_gamma.data(), DIM, normed.data());

        // 7. GATE & UP Projections
        do_gemv(layer.w_gate, normed.data(), gate);
        do_gemv(layer.w_up, normed.data(), up);

        // 8. SwiGLU & DOWN Projection
        swiglu(gate.data(), up.data(), PADDED_HIDDEN_DIM, swiglu_out.data());
        do_gemv(layer.w_down, swiglu_out.data(), proj_down);

        // 9. Residual Add
        for (int i = 0; i < DIM; ++i) residual[i] += proj_down[i];
    }

    // Final Norm & Logits
    rmsnorm(residual.data(), model.final_norm_gamma.data(), DIM, normed.data());
    std::vector<float> padded_logits(PADDED_VOCAB_SIZE, 0.0f);
    do_gemv(model.w_logits, normed.data(), padded_logits);

    out_logits.resize(VOCAB_SIZE);
    std::copy(padded_logits.begin(), padded_logits.begin() + VOCAB_SIZE, out_logits.begin());

    return out_logits.data();
}

// ============================================================================
// Binary Bank Loader for Real AutoRound Weights (Hardcoded / Quiet)
// ============================================================================
static int get_weight_offset(int layer, int mode) {
    static const int matrix_weight_words[8] = {32768, 32768, 32768, 32768, 90112, 90112, 90112, 258048};
    if (mode == 7) return 32 * 401408;
    int off = layer * 401408;
    for (int p = 0; p < mode; ++p) off += matrix_weight_words[p];
    return off;
}

static int get_scale_offset(int layer, int mode) {
    static const int matrix_scale_words[8] = {4, 4, 4, 4, 11, 11, 11, 32};
    if (mode == 7) return 32 * 49;
    int off = layer * 49;
    for (int p = 0; p < mode; ++p) off += matrix_scale_words[p];
    return off;
}

void unpack_binary_matrix(
    std::vector<std::ifstream>& banks,
    int layer,
    int mode,
    int rows,
    int cols,
    QuantizedMatrix& qm
) {
    qm.rows = rows;
    qm.cols = cols;
    qm.local_cols = cols / NUM_PES;
    qm.pe_weights.resize(NUM_PES);
    qm.pe_scales.resize(NUM_PES);

    const int out_tiles = rows / 128;
    const int local_in_tiles = qm.local_cols / 256;
    const int tile_count = out_tiles * local_in_tiles;

    const uint64_t w_byte_offset = static_cast<uint64_t>(WEIGHT_BASE_WORD + get_weight_offset(layer, mode)) * WORD_BYTES;
    const uint64_t s_byte_offset = static_cast<uint64_t>(SCALE_BASE_WORD + get_scale_offset(layer, mode)) * WORD_BYTES;

    for (int p = 0; p < NUM_PES; ++p) {
        qm.pe_weights[p].assign(rows * qm.local_cols, 0);
        qm.pe_scales[p].assign(tile_count, 0.0f);

        // 1. Read scales (Q1.15 signed fixed-point, ap_int<16>)
        banks[p].seekg(s_byte_offset);
        std::vector<int16_t> q115_scales(tile_count);
        banks[p].read(reinterpret_cast<char*>(q115_scales.data()), tile_count * sizeof(int16_t));
        for (int t = 0; t < tile_count; ++t) {
            qm.pe_scales[p][t] = static_cast<float>(q115_scales[t]) * (1.0f / 32768.0f);
        }

        // 2. Read and unpack INT4 weights
        banks[p].seekg(w_byte_offset);
        const int tile_bytes = 256 * WORD_BYTES; // 16384 bytes
        std::vector<uint8_t> tile_buf(tile_bytes);

        for (int t = 0; t < tile_count; ++t) {
            const int out_tile = t / local_in_tiles;
            const int in_tile = t % local_in_tiles;

            banks[p].read(reinterpret_cast<char*>(tile_buf.data()), tile_bytes);

            for (int group = 0; group < 8; ++group) {
                for (int row_block = 0; row_block < 32; ++row_block) {
                    const uint8_t* word_bytes = tile_buf.data() + (group * 32 + row_block) * 64;

                    for (int lane = 0; lane < 32; ++lane) {
                        const int col = in_tile * 256 + group * 32 + lane;
                        const uint8_t byte0 = word_bytes[2 * lane];
                        const uint8_t byte1 = word_bytes[2 * lane + 1];

                        auto sign_ext_nibble = [](uint8_t n) -> int8_t {
                            int8_t val = static_cast<int8_t>(n & 0x0F);
                            if (val >= 8) val -= 16;
                            return val;
                        };

                        const int8_t r0 = sign_ext_nibble(byte0 >> 4);
                        const int8_t r1 = sign_ext_nibble(byte0 & 0x0F);
                        const int8_t r2 = sign_ext_nibble(byte1 >> 4);
                        const int8_t r3 = sign_ext_nibble(byte1 & 0x0F);

                        const int base_r = out_tile * 128 + row_block * 4;
                        qm.pe_weights[p][(base_r + 0) * qm.local_cols + col] = r0;
                        qm.pe_weights[p][(base_r + 1) * qm.local_cols + col] = r1;
                        qm.pe_weights[p][(base_r + 2) * qm.local_cols + col] = r2;
                        qm.pe_weights[p][(base_r + 3) * qm.local_cols + col] = r3;
                    }
                }
            }
        }
    }
}

bool load_real_model(TransformerModel& model, const std::string& base_dir, int num_layers) {
    // List candidate base directories
    std::vector<std::string> candidates = { base_dir, HARDCODED_WEIGHTS_DIR, ".", ".." };
    std::string valid_dir = "";

    for (const auto& d : candidates) {
        if (d.empty()) continue;
        std::string check_file = d + "/model_bank0.bin";
        std::ifstream f(check_file, std::ios::binary);
        if (f.is_open()) {
            valid_dir = d;
            break;
        }
    }

    if (valid_dir.empty()) {
        return false;
    }

    std::vector<std::ifstream> banks(NUM_PES);
    for (int p = 0; p < NUM_PES; ++p) {
        std::string path = valid_dir + "/model_bank" + std::to_string(p) + ".bin";
        banks[p].open(path, std::ios::binary);
        if (!banks[p].is_open()) return false;
    }

    std::string emb_path = valid_dir + "/embeddings.bin";
    std::ifstream emb_f(emb_path, std::ios::binary);
    if (!emb_f.is_open()) return false;

    model.token_embeddings.resize(VOCAB_SIZE * DIM);
    emb_f.read(reinterpret_cast<char*>(model.token_embeddings.data()), model.token_embeddings.size() * sizeof(float));

    model.final_norm_gamma.resize(DIM);
    const uint64_t final_norm_base = static_cast<uint64_t>(NORM_BASE_WORD + 32 * 128) * WORD_BYTES;
    for (int p = 0; p < NUM_PES; ++p) {
        banks[p].seekg(final_norm_base);
        banks[p].read(reinterpret_cast<char*>(model.final_norm_gamma.data() + p * 1024), 1024 * sizeof(float));
    }

    model.layers.resize(num_layers);
    for (int l = 0; l < num_layers; ++l) {
        DecoderLayer& lyr = model.layers[l];
        lyr.attn_norm_gamma.resize(DIM);
        lyr.ffn_norm_gamma.resize(DIM);

        const uint64_t attn_norm_base = static_cast<uint64_t>(NORM_BASE_WORD + l * 128) * WORD_BYTES;
        const uint64_t ffn_norm_base = static_cast<uint64_t>(NORM_BASE_WORD + l * 128 + 64) * WORD_BYTES;

        for (int p = 0; p < NUM_PES; ++p) {
            banks[p].seekg(attn_norm_base);
            banks[p].read(reinterpret_cast<char*>(lyr.attn_norm_gamma.data() + p * 1024), 1024 * sizeof(float));
            banks[p].seekg(ffn_norm_base);
            banks[p].read(reinterpret_cast<char*>(lyr.ffn_norm_gamma.data() + p * 1024), 1024 * sizeof(float));
        }

        unpack_binary_matrix(banks, l, 0, DIM, DIM, lyr.w_q);
        unpack_binary_matrix(banks, l, 1, DIM, DIM, lyr.w_k);
        unpack_binary_matrix(banks, l, 2, DIM, DIM, lyr.w_v);
        unpack_binary_matrix(banks, l, 3, DIM, DIM, lyr.w_o);
        unpack_binary_matrix(banks, l, 4, PADDED_HIDDEN_DIM, DIM, lyr.w_gate);
        unpack_binary_matrix(banks, l, 5, PADDED_HIDDEN_DIM, DIM, lyr.w_up);
        unpack_binary_matrix(banks, l, 6, DIM, PADDED_HIDDEN_DIM, lyr.w_down);
    }

    unpack_binary_matrix(banks, 0, 7, PADDED_VOCAB_SIZE, DIM, model.w_logits);
    model.loaded_from_real_weights = true;
    return true;
}

// ============================================================================
// AutoRound W4G128 Model Loader
// Reads autoround_w4g128.bin:
//   header: 256 bytes ("AR4\0")
//   token_embeddings: VOCAB_SIZE * DIM * float32
//   per layer:
//     attn_norm: DIM * float32
//     w_q: M*(K/2) bytes + M*(K/128) float32 scales
//     w_k, w_v, w_o: same
//     ffn_norm: DIM * float32
//     w_gate, w_up: HIDDEN_DIM*(K/2) bytes + HIDDEN_DIM*(K/128) * float32
//     w_down: DIM*(HIDDEN_DIM/2) bytes + DIM*(HIDDEN_DIM/128) * float32
//   final_norm: DIM * float32
//   lm_head: VOCAB_SIZE * DIM * float32
// FP32 scale → Q1.15 int16 in-memory: raw * 32768, clip
// ============================================================================
static bool read_ar_matrix(std::ifstream& f, int M, int K, AutoRoundMatrix& mat) {
    mat.rows = M;
    mat.cols = K;
    mat.num_groups = K / AR_GROUP_SIZE;

    const size_t w_bytes = static_cast<size_t>(M) * (K / 2);
    mat.packed_weights.resize(w_bytes);
    f.read(reinterpret_cast<char*>(mat.packed_weights.data()), w_bytes);
    if (!f) return false;

    const size_t s_count = static_cast<size_t>(M) * mat.num_groups;
    std::vector<float> scales_f32(s_count);
    f.read(reinterpret_cast<char*>(scales_f32.data()), s_count * sizeof(float));
    if (!f) return false;

    // Convert FP32 scale → Q1.15 int16
    mat.scales_q115.resize(s_count);
    for (size_t i = 0; i < s_count; ++i) {
        const int raw = static_cast<int>(std::round(scales_f32[i] * 32768.0f));
        mat.scales_q115[i] = static_cast<int16_t>(std::max(-32768, std::min(32767, raw)));
    }
    return true;
}

bool load_autoround_model(const std::string& bin_path) {
    std::cout << "[AutoRound] Opening " << bin_path << " ..." << std::endl;
    std::ifstream f(bin_path, std::ios::binary);
    if (!f.is_open()) {
        // Try relative paths
        std::ifstream f2(HARDCODED_WEIGHTS_DIR + "/autoround_w4g128.bin", std::ios::binary);
        if (!f2.is_open()) {
            std::cerr << "Error: cannot open autoround_w4g128.bin" << std::endl;
            return false;
        }
        f = std::move(f2);
    }

    char header[256];
    f.read(header, 256);
    if (std::memcmp(header, "AR4\0", 4) != 0) {
        std::cerr << "Error: invalid autoround_w4g128.bin header" << std::endl;
        return false;
    }

    AutoRoundModel& m = g_ar_model;

    // Token embeddings
    m.token_embeddings.resize(static_cast<size_t>(VOCAB_SIZE) * DIM);
    f.read(reinterpret_cast<char*>(m.token_embeddings.data()),
           m.token_embeddings.size() * sizeof(float));

    // 32 layers
    m.layers.resize(g_num_layers);
    for (int l = 0; l < g_num_layers; ++l) {
        ARDecoderLayer& lyr = m.layers[l];
        lyr.attn_norm_gamma.resize(DIM);
        f.read(reinterpret_cast<char*>(lyr.attn_norm_gamma.data()), DIM * sizeof(float));

        if (!read_ar_matrix(f, DIM,       DIM,        lyr.w_q))   return false;
        if (!read_ar_matrix(f, DIM,       DIM,        lyr.w_k))   return false;
        if (!read_ar_matrix(f, DIM,       DIM,        lyr.w_v))   return false;
        if (!read_ar_matrix(f, DIM,       DIM,        lyr.w_o))   return false;

        lyr.ffn_norm_gamma.resize(DIM);
        f.read(reinterpret_cast<char*>(lyr.ffn_norm_gamma.data()), DIM * sizeof(float));

        if (!read_ar_matrix(f, HIDDEN_DIM, DIM,        lyr.w_gate)) return false;
        if (!read_ar_matrix(f, HIDDEN_DIM, DIM,        lyr.w_up))   return false;
        if (!read_ar_matrix(f, DIM,        HIDDEN_DIM, lyr.w_down)) return false;

        std::cout << "  [AutoRound] Layer " << l << " loaded." << std::endl;
    }

    // Final norm
    m.final_norm_gamma.resize(DIM);
    f.read(reinterpret_cast<char*>(m.final_norm_gamma.data()), DIM * sizeof(float));

    // LM head (FP32, not quantized)
    m.lm_head.resize(static_cast<size_t>(VOCAB_SIZE) * DIM);
    f.read(reinterpret_cast<char*>(m.lm_head.data()), m.lm_head.size() * sizeof(float));

    m.loaded = true;
    std::cout << "[AutoRound] Model loaded successfully." << std::endl;
    return true;
}

// ============================================================================
// AutoRound Forward Pass (used when --autoround is set)
// Uses FP32 KV cache (no KV quantize), split-half RoPE (HuggingFace style)
// ============================================================================
float* forward_autoround(
    int token, int pos,
    std::vector<float>& residual,
    std::vector<float>& out_logits,
    std::vector<float>& kv_cache_k,   // [NUM_LAYERS * MAX_SEQ_LEN * DIM]
    std::vector<float>& kv_cache_v
) {
    const AutoRoundModel& model = g_ar_model;
    const float* emb_ptr = model.token_embeddings.data() + token * DIM;
    std::copy(emb_ptr, emb_ptr + DIM, residual.begin());

    std::vector<float> normed(DIM);
    std::vector<float> q(DIM), k(DIM), v(DIM);
    std::vector<float> attn_out(DIM);
    std::vector<float> proj_o(DIM);
    std::vector<float> gate(HIDDEN_DIM), up(HIDDEN_DIM);
    std::vector<float> swiglu_out(HIDDEN_DIM);
    std::vector<float> proj_down(DIM);

    QuantizedActivation qact_dim;
    QuantizedActivation qact_hidden;

    const float attn_scale_factor = 1.0f / std::sqrt(static_cast<float>(HEAD_DIM));

    for (int l = 0; l < g_num_layers; ++l) {
        const ARDecoderLayer& layer = model.layers[l];

        // 1. Attn RMSNorm
        rmsnorm(residual.data(), layer.attn_norm_gamma.data(), DIM, normed.data());

        // 2. Q, K, V projections
        if (g_e8m0_act) {
            quantize_activation_g32(normed.data(), DIM, qact_dim);
            gemv_autoround_e8m0(layer.w_q, qact_dim, q);
            gemv_autoround_e8m0(layer.w_k, qact_dim, k);
            gemv_autoround_e8m0(layer.w_v, qact_dim, v);
        } else {
            gemv_autoround(layer.w_q, normed.data(), q);
            gemv_autoround(layer.w_k, normed.data(), k);
            gemv_autoround(layer.w_v, normed.data(), v);
        }

        // 3. RoPE (split-half, HuggingFace style)
        apply_rope(q.data(), NUM_HEADS, HEAD_DIM, pos);
        apply_rope(k.data(), NUM_HEADS, HEAD_DIM, pos);

        // 4. Update KV cache
        const int kv_layer_offset = l * MAX_SEQ_LEN * DIM;
        std::copy(k.begin(), k.end(), kv_cache_k.begin() + kv_layer_offset + pos * DIM);
        std::copy(v.begin(), v.end(), kv_cache_v.begin() + kv_layer_offset + pos * DIM);

        // 5. Multi-head attention (FP32 KV cache)
        std::fill(attn_out.begin(), attn_out.end(), 0.0f);
        #pragma omp parallel for schedule(static)
        for (int h = 0; h < NUM_HEADS; ++h) {
            const float* q_h = q.data() + h * HEAD_DIM;
            float* out_h = attn_out.data() + h * HEAD_DIM;

            float scores[MAX_SEQ_LEN];
            float max_score = -1e30f;
            for (int t = 0; t <= pos; ++t) {
                const float* k_t = kv_cache_k.data() + kv_layer_offset + t * DIM + h * HEAD_DIM;
                float dot = 0.0f;
                for (int d = 0; d < HEAD_DIM; ++d) dot += q_h[d] * k_t[d];
                scores[t] = dot * attn_scale_factor;
                if (scores[t] > max_score) max_score = scores[t];
            }

            float sum_exp = 0.0f;
            for (int t = 0; t <= pos; ++t) {
                scores[t] = std::exp(scores[t] - max_score);
                sum_exp += scores[t];
            }
            const float inv_sum = 1.0f / sum_exp;
            for (int t = 0; t <= pos; ++t) scores[t] *= inv_sum;

            for (int t = 0; t <= pos; ++t) {
                const float* v_t = kv_cache_v.data() + kv_layer_offset + t * DIM + h * HEAD_DIM;
                const float sc = scores[t];
                for (int d = 0; d < HEAD_DIM; ++d) out_h[d] += sc * v_t[d];
            }
        }

        // 6. O projection & residual
        if (g_e8m0_act) {
            quantize_activation_g32(attn_out.data(), DIM, qact_dim);
            gemv_autoround_e8m0(layer.w_o, qact_dim, proj_o);
        } else {
            gemv_autoround(layer.w_o, attn_out.data(), proj_o);
        }
        for (int i = 0; i < DIM; ++i) residual[i] += proj_o[i];

        // 7. FFN RMSNorm
        rmsnorm(residual.data(), layer.ffn_norm_gamma.data(), DIM, normed.data());

        // 8. Gate & Up
        if (g_e8m0_act) {
            quantize_activation_g32(normed.data(), DIM, qact_dim);
            gemv_autoround_e8m0(layer.w_gate, qact_dim, gate);
            gemv_autoround_e8m0(layer.w_up,   qact_dim, up);
        } else {
            gemv_autoround(layer.w_gate, normed.data(), gate);
            gemv_autoround(layer.w_up,   normed.data(), up);
        }

        // 9. SwiGLU
        swiglu(gate.data(), up.data(), HIDDEN_DIM, swiglu_out.data());

        // 10. Down & residual
        if (g_e8m0_act) {
            quantize_activation_g32(swiglu_out.data(), HIDDEN_DIM, qact_hidden);
            gemv_autoround_e8m0(layer.w_down, qact_hidden, proj_down);
        } else {
            gemv_autoround(layer.w_down, swiglu_out.data(), proj_down);
        }
        for (int i = 0; i < DIM; ++i) residual[i] += proj_down[i];
    }

    // Final norm & logits (FP32 lm_head)
    rmsnorm(residual.data(), model.final_norm_gamma.data(), DIM, normed.data());
    out_logits.resize(VOCAB_SIZE);
    #pragma omp parallel for schedule(static)
    for (int m = 0; m < VOCAB_SIZE; ++m) {
        float acc = 0.0f;
        const float* w = model.lm_head.data() + m * DIM;
        for (int d = 0; d < DIM; ++d) acc += w[d] * normed[d];
        out_logits[m] = acc;
    }
    return out_logits.data();
}

// ============================================================================
// Byte Pair Encoding (BPE) Tokenizer (Identical to runq.c)

// ============================================================================
typedef struct {
    char *str;
    int id;
} TokenIndex;

typedef struct {
    char** vocab;
    float* vocab_scores;
    TokenIndex *sorted_vocab;
    int vocab_size;
    unsigned int max_token_length;
    unsigned char byte_pieces[512]; // stores all single-byte strings
} Tokenizer;

int compare_tokens(const void *a, const void *b) {
    return strcmp(((TokenIndex*)a)->str, ((TokenIndex*)b)->str);
}

void build_tokenizer(Tokenizer* t, const char* tokenizer_path, int vocab_size) {
    t->vocab_size = vocab_size;
    t->vocab = (char**)malloc(vocab_size * sizeof(char*));
    t->vocab_scores = (float*)malloc(vocab_size * sizeof(float));
    t->sorted_vocab = NULL;
    for (int i = 0; i < 256; i++) {
        t->byte_pieces[i * 2] = (unsigned char)i;
        t->byte_pieces[i * 2 + 1] = '\0';
    }

    FILE *file = fopen(tokenizer_path, "rb");
    if (!file) file = fopen("tokenizer.bin", "rb");
    if (!file) file = fopen("software_sim/tokenizer.bin", "rb");
    if (!file) file = fopen("C:/KLTN/4PE_U250/software_sim/tokenizer.bin", "rb");
    if (!file) file = fopen("C:/KLTN/4PE_U250/llama2.c/tokenizer.bin", "rb");
    if (!file) file = fopen("../llama2.c/tokenizer.bin", "rb");

    if (!file) { fprintf(stderr, "couldn't load %s\n", tokenizer_path); exit(EXIT_FAILURE); }
    if (fread(&t->max_token_length, sizeof(int), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
    int len;
    for (int i = 0; i < vocab_size; i++) {
        if (fread(t->vocab_scores + i, sizeof(float), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        if (fread(&len, sizeof(int), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        t->vocab[i] = (char *)malloc(len + 1);
        if (fread(t->vocab[i], len, 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        t->vocab[i][len] = '\0';
    }
    fclose(file);
}

void free_tokenizer(Tokenizer* t) {
    for (int i = 0; i < t->vocab_size; i++) { free(t->vocab[i]); }
    free(t->vocab);
    free(t->vocab_scores);
    if (t->sorted_vocab) free(t->sorted_vocab);
}

char* decode(Tokenizer* t, int prev_token, int token) {
    char *piece = t->vocab[token];
    if (prev_token == 1 && piece[0] == ' ') { piece++; }
    unsigned char byte_val;
    if (sscanf(piece, "<0x%02hhX>", &byte_val) == 1) {
        piece = (char*)t->byte_pieces + byte_val * 2;
    }
    return piece;
}

void safe_printf(const char *piece) {
    if (piece == NULL) { return; }
    if (piece[0] == '\0') { return; }
    if (piece[1] == '\0') {
        unsigned char byte_val = piece[0];
        // SentencePiece may emit one UTF-8 byte token at a time.  Preserve
        // bytes >= 0x80 so the terminal can reconstruct accented characters;
        // suppress only ASCII control bytes.
        if (byte_val < 0x80 && !(isprint(byte_val) || isspace(byte_val))) {
            return;
        }
    }
    printf("%s", piece);
}

int str_lookup(const char *str, TokenIndex *sorted_vocab, int vocab_size) {
    TokenIndex tok = { (char*)str, 0 };
    TokenIndex *res = (TokenIndex*)bsearch(&tok, sorted_vocab, vocab_size, sizeof(TokenIndex), compare_tokens);
    return res != NULL ? res->id : -1;
}

void encode(Tokenizer* t, const char *text, int8_t bos, int8_t eos, int *tokens, int *n_tokens) {
    if (text == NULL) { fprintf(stderr, "cannot encode NULL text\n"); exit(EXIT_FAILURE); }

    if (t->sorted_vocab == NULL) {
        t->sorted_vocab = (TokenIndex*)malloc(t->vocab_size * sizeof(TokenIndex));
        for (int i = 0; i < t->vocab_size; i++) {
            t->sorted_vocab[i].str = t->vocab[i];
            t->sorted_vocab[i].id = i;
        }
        qsort(t->sorted_vocab, t->vocab_size, sizeof(TokenIndex), compare_tokens);
    }

    char* str_buffer = (char*)malloc((t->max_token_length * 2 + 1 + 2) * sizeof(char));
    size_t str_len = 0;
    *n_tokens = 0;

    if (bos) tokens[(*n_tokens)++] = 1;

    if (text[0] != '\0') {
        int dummy_prefix = str_lookup(" ", t->sorted_vocab, t->vocab_size);
        tokens[(*n_tokens)++] = dummy_prefix;
    }

    for (const char *c = text; *c != '\0'; c++) {
        if ((*c & 0xC0) != 0x80) {
            str_len = 0;
        }
        str_buffer[str_len++] = *c;
        str_buffer[str_len] = '\0';

        if ((*(c+1) & 0xC0) == 0x80 && str_len < 4) {
            continue;
        }

        int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
        if (id != -1) {
            tokens[(*n_tokens)++] = id;
        } else {
            for (size_t i = 0; i < str_len; i++) {
                tokens[(*n_tokens)++] = (unsigned char)str_buffer[i] + 3;
            }
        }
        str_len = 0;
    }

    while (1) {
        float best_score = -1e10f;
        int best_id = -1;
        int best_idx = -1;

        for (int i = 0; i < (*n_tokens - 1); i++) {
            sprintf(str_buffer, "%s%s", t->vocab[tokens[i]], t->vocab[tokens[i+1]]);
            int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
            if (id != -1 && t->vocab_scores[id] > best_score) {
                best_score = t->vocab_scores[id];
                best_id = id;
                best_idx = i;
            }
        }

        if (best_idx == -1) {
            break;
        }

        tokens[best_idx] = best_id;
        for (int i = best_idx + 1; i < (*n_tokens - 1); i++) {
            tokens[i] = tokens[i+1];
        }
        (*n_tokens)--;
    }

    if (eos) tokens[(*n_tokens)++] = 2;

    free(str_buffer);
}

// ============================================================================
// Sampler (Identical to runq.c)
// ============================================================================
typedef struct {
    float prob;
    int index;
} ProbIndex;

typedef struct {
    int vocab_size;
    ProbIndex* probindex;
    float temperature;
    float topp;
    unsigned long long rng_state;
} Sampler;

int sample_argmax(float* probabilities, int n) {
    int max_i = 0;
    float max_p = probabilities[0];
    for (int i = 1; i < n; i++) {
        if (probabilities[i] > max_p) {
            max_i = i;
            max_p = probabilities[i];
        }
    }
    return max_i;
}

int sample_mult(float* probabilities, int n, float coin) {
    float cdf = 0.0f;
    for (int i = 0; i < n; i++) {
        cdf += probabilities[i];
        if (coin < cdf) {
            return i;
        }
    }
    return n - 1;
}

int compare_probindex(const void* a, const void* b) {
    ProbIndex* a_ = (ProbIndex*) a;
    ProbIndex* b_ = (ProbIndex*) b;
    if (a_->prob > b_->prob) return -1;
    if (a_->prob < b_->prob) return 1;
    return 0;
}

int sample_topp(float* probabilities, int n, float topp, ProbIndex* probindex, float coin) {
    int n0 = 0;
    const float cutoff = (1.0f - topp) / (n - 1);
    for (int i = 0; i < n; i++) {
        if (probabilities[i] >= cutoff) {
            probindex[n0].index = i;
            probindex[n0].prob = probabilities[i];
            n0++;
        }
    }
    qsort(probindex, n0, sizeof(ProbIndex), compare_probindex);

    float cumulative_prob = 0.0f;
    int last_idx = n0 - 1;
    for (int i = 0; i < n0; i++) {
        cumulative_prob += probindex[i].prob;
        if (cumulative_prob > topp) {
            last_idx = i;
            break;
        }
    }

    float r = coin * cumulative_prob;
    float cdf = 0.0f;
    for (int i = 0; i <= last_idx; i++) {
        cdf += probindex[i].prob;
        if (r < cdf) {
            return probindex[i].index;
        }
    }
    return probindex[last_idx].index;
}

void build_sampler(Sampler* sampler, int vocab_size, float temperature, float topp, unsigned long long rng_seed) {
    sampler->vocab_size = vocab_size;
    sampler->temperature = temperature;
    sampler->topp = topp;
    sampler->rng_state = rng_seed;
    sampler->probindex = (ProbIndex*)malloc(sampler->vocab_size * sizeof(ProbIndex));
}

void free_sampler(Sampler* sampler) {
    free(sampler->probindex);
}

unsigned int random_u32(unsigned long long *state) {
    *state ^= *state >> 12;
    *state ^= *state << 25;
    *state ^= *state >> 27;
    return (*state * 0x2545F4914F6CDD1Dull) >> 32;
}

float random_f32(unsigned long long *state) {
    return (random_u32(state) >> 8) / 16777216.0f;
}

void softmax_logits(float* x, int size) {
    float max_val = x[0];
    for (int i = 1; i < size; i++) {
        if (x[i] > max_val) {
            max_val = x[i];
        }
    }
    float sum = 0.0f;
    for (int i = 0; i < size; i++) {
        x[i] = expf(x[i] - max_val);
        sum += x[i];
    }
    for (int i = 0; i < size; i++) {
        x[i] /= sum;
    }
}

int sample(Sampler* sampler, float* logits) {
    // Greedy argmax: token co diem cao nhat se duoc chon
    return sample_argmax(logits, sampler->vocab_size);
}

// ============================================================================
// Timing
// ============================================================================
long time_in_ms() {
    auto now = std::chrono::steady_clock::now();
    return std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
}

// ============================================================================
// Generation Loop (Identical to runq.c)
// ============================================================================
void generate(const TransformerModel& model, KVCachePE* kv_pes, Tokenizer *tokenizer, Sampler *sampler, const char *prompt, int steps) {
    const char *empty_prompt = "";
    if (prompt == NULL) { prompt = empty_prompt; }

    // encode the (string) prompt into tokens sequence
    int num_prompt_tokens = 0;
    int* prompt_tokens = (int*)malloc((strlen(prompt)+3) * sizeof(int)); // +3 for '\0', ?BOS, ?EOS
    encode(tokenizer, prompt, 1, 0, prompt_tokens, &num_prompt_tokens);
    if (num_prompt_tokens < 1) {
        fprintf(stderr, "something is wrong, expected at least 1 prompt token\n");
        exit(EXIT_FAILURE);
    }

    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    // start the main loop
    long start = 0;  // used to time our code, only initialized after first iteration
    int next = 0;    // will store the next token in the sequence
    int token = prompt_tokens[0]; // kick off with the first token in the prompt
    int pos = 0;     // position in the sequence
    while (pos < steps) {

        // forward the transformer to get logits for the next token
        float* logits_ptr = forward(model, kv_pes, token, pos, residual, logits);

        // advance the state state machine
        if (pos < num_prompt_tokens - 1) {
            // if we are still processing the input prompt, force the next prompt token
            next = prompt_tokens[pos + 1];
        } else {
            // otherwise sample the next token from the logits
            next = sample(sampler, logits_ptr);
        }
        pos++;

        // Llama-2 uses token 2 as EOS. Token 1 is BOS and must not be used as
        // the generation stop condition.
        if (next == 2) { break; }

        // print the token as string, decode it with the Tokenizer object
        char* piece = decode(tokenizer, token, next);
        safe_printf(piece); // same as printf("%s", piece), but skips "unsafe" bytes
        fflush(stdout);
        token = next;

        // init the timer here because the first iteration can be slower
        if (start == 0) { start = time_in_ms(); }
    }
    printf("\n");

    // report achieved tok/s (pos-1 because the timer starts after first iteration)
    if (pos > 1) {
        long end = time_in_ms();
        fprintf(stderr, "achieved tok/s: %f\n", (pos-1) / (double)(end-start)*1000);
    }

    free(prompt_tokens);
}

void read_stdin(const char* guide, char* buffer, size_t bufsize) {
    printf("%s", guide);
    if (fgets(buffer, bufsize, stdin) != NULL) {
        size_t len = strlen(buffer);
        if (len > 0 && buffer[len - 1] == '\n') {
            buffer[len - 1] = '\0';
        }
    }
}

// ============================================================================
// Chat Loop (Identical to runq.c)
// ============================================================================
void chat(const TransformerModel& model, KVCachePE* kv_pes, Tokenizer *tokenizer, Sampler *sampler,
          const char *cli_user_prompt, const char *cli_system_prompt, int steps) {

    char system_prompt[512];
    char user_prompt[512];
    char rendered_prompt[1152];
    int num_prompt_tokens = 0;
    int* prompt_tokens = (int*)malloc(1152 * sizeof(int));
    int user_idx = 0;

    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    int8_t user_turn = 1; // user starts
    int next = 0;        // will store the next token in the sequence
    int token = 0;       // stores the current token to feed into the transformer
    int pos = 0;         // position in the sequence
    while (pos < steps) {

        if (user_turn) {
            if (pos == 0) {
                if (cli_system_prompt == NULL) {
                    read_stdin("Enter system prompt (optional): ", system_prompt, sizeof(system_prompt));
                } else {
                    strcpy(system_prompt, cli_system_prompt);
                }
            }
            if (pos == 0 && cli_user_prompt != NULL) {
                strcpy(user_prompt, cli_user_prompt);
            } else {
                read_stdin("User: ", user_prompt, sizeof(user_prompt));
            }
            if (pos == 0 && system_prompt[0] != '\0') {
                char system_template[] = "[INST] <<SYS>>\n%s\n<</SYS>>\n\n%s [/INST]";
                sprintf(rendered_prompt, system_template, system_prompt, user_prompt);
            } else {
                char user_template[] = "[INST] %s [/INST]";
                sprintf(rendered_prompt, user_template, user_prompt);
            }
            encode(tokenizer, rendered_prompt, 1, 0, prompt_tokens, &num_prompt_tokens);
            user_idx = 0;
            user_turn = 0;
            printf("Assistant: ");
        }

        if (user_idx < num_prompt_tokens) {
            token = prompt_tokens[user_idx++];
        } else {
            token = next;
        }
        if (token == 2) { user_turn = 1; }

        float* logits_ptr = forward(model, kv_pes, token, pos, residual, logits);
        next = sample(sampler, logits_ptr);
        pos++;

        if (user_idx >= num_prompt_tokens && next != 2) {
            char* piece = decode(tokenizer, token, next);
            safe_printf(piece);
            fflush(stdout);
        }
        if (next == 2) {
            printf("\n");
            // A CLI-provided prompt is a one-shot chat request.  The original
            // runq.c loop waits for another interactive user turn, which is
            // undesirable when stdin is not being used.
            if (cli_user_prompt != NULL) { break; }
        }
    }
    printf("\n");
    free(prompt_tokens);
}

// ============================================================================
// Perplexity (PPL) Evaluation on WikiText-2 (Matching run_autoround.cpp)
// ============================================================================
void calculate_perplexity(
    const TransformerModel& model,
    Tokenizer* tokenizer,
    const std::string& path_or_text,
    int max_tokens = 0
) {
    std::cout << "\n==========================================================" << std::endl;
    if (g_autoround) {
        std::cout << "  AUTOROUND W4G128 EMULATOR - PPL EVALUATION              " << std::endl;
        std::cout << "  Weights    : autoround_w4g128.bin (INT4 + FP32 scale)  " << std::endl;
        std::cout << "  Scale      : Q1.15 int16 in-memory (from FP32)         " << std::endl;
        if (g_e8m0_act) {
            std::cout << "  Activation : INT14 + E8M0 Microscaling (QLlama G32)    " << std::endl;
        } else {
            std::cout << "  Activation : FP32 (no quantize)                        " << std::endl;
        }
    } else if (g_float_act) {
        std::cout << "  4-PE HW EMULATOR - PPL (FLOAT ACT MODE)                " << std::endl;
        std::cout << "  Weights    : model_bank{0..3}.bin (Q1.15 scale/tile)   " << std::endl;
        std::cout << "  Activation : FP32 passthrough (--float-act)            " << std::endl;
    } else {
        std::cout << "  4-PE HW EMULATOR - PPL EVALUATION                      " << std::endl;
        std::cout << "  Weights    : model_bank{0..3}.bin (Q1.15 fixed-point)  " << std::endl;
        std::cout << "  Activation : INT14 + E8M0 Microscaling (QLlama)        " << std::endl;
    }
    std::cout << "==========================================================" << std::endl;

    std::vector<int> all_tokens;
    std::ifstream bf(path_or_text, std::ios::binary);
    bool is_binary_tokens = false;
    if (path_or_text.size() >= 4 && path_or_text.substr(path_or_text.size() - 4) == ".bin" && path_or_text != "tokenizer.bin") {
        is_binary_tokens = true;
    }

    if (is_binary_tokens && bf.is_open()) {
        std::cout << "Detected pre-tokenized binary token file: " << path_or_text << std::endl;
        bf.seekg(0, std::ios::end);
        size_t file_bytes = bf.tellg();
        bf.seekg(0, std::ios::beg);
        size_t n_tokens = file_bytes / sizeof(int32_t);
        all_tokens.resize(n_tokens);
        bf.read(reinterpret_cast<char*>(all_tokens.data()), file_bytes);
        std::cout << "Loaded " << n_tokens << " pre-tokenized tokens." << std::endl;
    } else {
        std::string text = path_or_text;
        std::ifstream tf(path_or_text);
        if (tf.is_open()) {
            std::stringstream ss;
            ss << tf.rdbuf();
            text = ss.str();
        }
        all_tokens.resize(text.size() + 16);
        int n_all_tokens = 0;
        encode(tokenizer, const_cast<char*>(text.c_str()), 1, 0, all_tokens.data(), &n_all_tokens);
        all_tokens.resize(n_all_tokens);
    }

    if (all_tokens.size() < 2) {
        std::cerr << "Text too short for PPL evaluation (needs >= 2 tokens)" << std::endl;
        return;
    }

    int eval_limit = (int)all_tokens.size();
    if (max_tokens > 0 && max_tokens < eval_limit) {
        eval_limit = max_tokens;
    }

    std::cout << "Total dataset tokens : " << all_tokens.size() << std::endl;
    std::cout << "Evaluating on        : " << eval_limit << " tokens" << std::endl;

    double total_nll = 0.0;
    int eval_count = 0;
    auto t0 = std::chrono::high_resolution_clock::now();

    const int chunk_size = MAX_SEQ_LEN;
    const int num_chunks = (eval_limit + chunk_size - 1) / chunk_size;

    // AutoRound mode: FP32 KV cache
    std::vector<float> ar_kv_k, ar_kv_v;
    // Bank-mode: INT8 KV cache
    std::vector<KVCachePE> kv_pes;

    if (g_autoround) {
        const size_t kv_sz = static_cast<size_t>(g_num_layers) * MAX_SEQ_LEN * DIM;
        ar_kv_k.assign(kv_sz, 0.0f);
        ar_kv_v.assign(kv_sz, 0.0f);
    } else {
        kv_pes.resize(NUM_PES);
        for (int p = 0; p < NUM_PES; ++p) {
            kv_pes[p].k_cache.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * HEAD_DIM, 0);
            kv_pes[p].k_scale.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0.0f);
            kv_pes[p].v_cache.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * HEAD_DIM, 0);
            kv_pes[p].v_scale.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0.0f);
        }
    }
    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    for (int chunk = 0; chunk < num_chunks; ++chunk) {
        int chunk_start = chunk * chunk_size;
        int chunk_end = std::min(eval_limit, chunk_start + chunk_size);
        if (chunk_end - chunk_start < 2) break;

        // Reset caches for each chunk
        if (g_autoround) {
            std::fill(ar_kv_k.begin(), ar_kv_k.end(), 0.0f);
            std::fill(ar_kv_v.begin(), ar_kv_v.end(), 0.0f);
        } else {
            for (int p = 0; p < NUM_PES; ++p) {
                std::fill(kv_pes[p].k_cache.begin(), kv_pes[p].k_cache.end(), 0);
                std::fill(kv_pes[p].k_scale.begin(), kv_pes[p].k_scale.end(), 0.0f);
                std::fill(kv_pes[p].v_cache.begin(), kv_pes[p].v_cache.end(), 0);
                std::fill(kv_pes[p].v_scale.begin(), kv_pes[p].v_scale.end(), 0.0f);
            }
        }

        for (int pos = 0; pos < chunk_end - chunk_start - 1; ++pos) {
            int cur_token = all_tokens[chunk_start + pos];
            int target_token = all_tokens[chunk_start + pos + 1];

            float* logits_ptr;
            if (g_autoround) {
                logits_ptr = forward_autoround(cur_token, pos, residual, logits, ar_kv_k, ar_kv_v);
            } else {
                logits_ptr = forward(model, kv_pes.data(), cur_token, pos, residual, logits);
            }

            float max_l = logits_ptr[0];
            for (int i = 1; i < VOCAB_SIZE; ++i) {
                if (logits_ptr[i] > max_l) max_l = logits_ptr[i];
            }

            float sum_exp = 0.0f;
            for (int i = 0; i < VOCAB_SIZE; ++i) {
                sum_exp += std::exp(logits_ptr[i] - max_l);
            }
            double log_sum_exp = max_l + std::log(sum_exp);
            double log_prob = logits_ptr[target_token] - log_sum_exp;

            total_nll += -log_prob;
            eval_count++;

            if (eval_count % 25 == 0 || eval_count == eval_limit - 1) {
                double current_loss = total_nll / eval_count;
                double current_ppl = std::exp(current_loss);
                std::cout << "  Processed " << std::setw(4) << eval_count << "/" << (eval_limit - 1)
                          << " tokens | Avg Loss: " << std::fixed << std::setprecision(4) << current_loss
                          << " | Current PPL: " << std::fixed << std::setprecision(2) << current_ppl << std::endl;
            }
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    double elapsed_sec = std::chrono::duration<double>(t1 - t0).count();

    const double final_loss = total_nll / eval_count;
    const double final_ppl = std::exp(final_loss);

    std::cout << "\n----------------------------------------------------------" << std::endl;
    std::cout << "  WIKITEXT-2 EVALUATION RESULTS:                            " << std::endl;
    std::cout << "----------------------------------------------------------" << std::endl;
    std::cout << "Total Tokens Evaluated : " << eval_count << std::endl;
    std::cout << "Average Cross-Entropy  : " << std::fixed << std::setprecision(4) << final_loss << std::endl;
    std::cout << "Perplexity (PPL)       : " << std::fixed << std::setprecision(2) << final_ppl << std::endl;
    std::cout << "Time Elapsed           : " << std::fixed << std::setprecision(2) << elapsed_sec << " s ("
              << (eval_count / elapsed_sec) << " tok/s)" << std::endl;
    std::cout << "----------------------------------------------------------" << std::endl;
    std::cout << "Reference Benchmarks (LLaMA-2-7B):" << std::endl;
    std::cout << "  - FP16 Base Model       : PPL ~ 5.4 - 5.8" << std::endl;
    std::cout << "  - AutoRound W4G128 FP16 : PPL = 5.58 (WikiText-2, 511 tokens)" << std::endl;
    std::cout << "==========================================================\n" << std::endl;
}

// ============================================================================
// CLI & Main Entry (Identical to runq.c, with hardcoded weights support)
// ============================================================================
void error_usage() {
    fprintf(stderr, "Usage:   run <checkpoint> [options]\n");
    fprintf(stderr, "Example: run model.bin -n 256 -i \"Once upon a time\"\n");
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "  -t <float>  temperature in [0,inf], default 0.0 (0.0 = greedy argmax)\n");
    fprintf(stderr, "  -p <float>  p value in top-p (nucleus) sampling in [0,1] default 0.9\n");
    fprintf(stderr, "  -s <int>    random seed, default time(NULL)\n");
    fprintf(stderr, "  -n <int>    number of steps to run for, default 256. 0 = max_seq_len\n");
    fprintf(stderr, "  -i <string> input prompt\n");
    fprintf(stderr, "  -z <string> optional path to custom tokenizer\n");
    fprintf(stderr, "  -m <string> mode: generate|chat, default: generate\n");
    fprintf(stderr, "  -y <string> (optional) system prompt in chat mode\n");
    fprintf(stderr, "  --ppl <file> evaluate perplexity on text/binary token file\n");
    fprintf(stderr, "  --float-act  bypass E8M0, use FP32 activation (for debug)\n");
    fprintf(stderr, "  --autoround  use autoround_w4g128.bin (W4G128 scale per-group-128)\n");
    fprintf(stderr, "  --e8m0-act   enable E8M0 activation quantization in autoround mode\n");
    exit(EXIT_FAILURE);


}

int main(int argc, char *argv[]) {
    // default parameters
    char *checkpoint_path = (char*)HARDCODED_WEIGHTS_DIR.c_str();  // hardcoded default
    const char *tokenizer_path = "tokenizer.bin";
    float temperature = 0.0f;   // 0.0 = greedy argmax deterministic
    float topp = 0.9f;          // top-p in nucleus sampling. 1.0 = off. 0.9 works well, but slower
    int steps = 256;            // number of steps to run for
    char *prompt = NULL;        // prompt string
    unsigned long long rng_seed = 0; // seed rng with time by default
    const char *mode = "generate";    // generate|chat
    char *system_prompt = NULL; // the (optional) system prompt to use in chat mode
    bool is_ppl_mode = false;
    std::string ppl_path = "";

    // Parse command line arguments
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "-h" || arg == "--help") {
            error_usage();
        } else if (arg == "--ppl" && i + 1 < argc) {
            is_ppl_mode = true;
            ppl_path = argv[++i];
        } else if (arg == "-t" && i + 1 < argc) {
            temperature = std::atof(argv[++i]);
        } else if (arg == "-p" && i + 1 < argc) {
            topp = std::atof(argv[++i]);
        } else if (arg == "-s" && i + 1 < argc) {
            rng_seed = std::atoll(argv[++i]);
        } else if (arg == "-n" && i + 1 < argc) {
            steps = std::atoi(argv[++i]);
        } else if (arg == "-i" && i + 1 < argc) {
            prompt = argv[++i];
        } else if (arg == "-z" && i + 1 < argc) {
            tokenizer_path = argv[++i];
        } else if (arg == "-m" && i + 1 < argc) {
            mode = argv[++i];
        } else if (arg == "-y" && i + 1 < argc) {
            system_prompt = argv[++i];
        } else if (arg == "--float-act") {
            g_float_act = true;
        } else if (arg == "--autoround") {
            g_autoround = true;
        } else if (arg == "--e8m0-act" || arg == "--e8m0") {
            g_e8m0_act = true;
        } else if (arg[0] != '-') {
            checkpoint_path = argv[i];
        }

    }

    // parameter validation/overrides
    if (rng_seed <= 0) rng_seed = (unsigned int)time(NULL);
    if (temperature < 0.0) temperature = 0.0;
    if (topp < 0.0 || 1.0 < topp) topp = 0.9;
    if (steps < 0) steps = 0;

    // Load Model weights
    TransformerModel model;
    if (g_autoround) {
        // --autoround: load from autoround_w4g128.bin (INT4 + FP32 scale per-group-128)
        std::string ar_path = std::string(checkpoint_path) + "/autoround_w4g128.bin";
        if (!load_autoround_model(ar_path)) {
            // try hardcoded dir
            ar_path = HARDCODED_WEIGHTS_DIR + "/autoround_w4g128.bin";
            if (!load_autoround_model(ar_path)) {
                fprintf(stderr, "couldn't load autoround_w4g128.bin\n");
                exit(EXIT_FAILURE);
            }
        }
    } else {
        // Default: load from model_bank{0..3}.bin
        if (!load_real_model(model, checkpoint_path, g_num_layers)) {
            fprintf(stderr, "couldn't load model weights from %s\n", checkpoint_path);
            exit(EXIT_FAILURE);
        }
    }
    if (steps == 0 || steps > MAX_SEQ_LEN) steps = MAX_SEQ_LEN;

    // build the Tokenizer via the tokenizer .bin file
    Tokenizer tokenizer;
    build_tokenizer(&tokenizer, tokenizer_path, VOCAB_SIZE);

    // PPL Mode
    if (is_ppl_mode) {
        calculate_perplexity(model, &tokenizer, ppl_path, steps);
        free_tokenizer(&tokenizer);
        return 0;
    }


    // build the Sampler
    Sampler sampler;
    build_sampler(&sampler, VOCAB_SIZE, temperature, topp, rng_seed);

    // Initialize KV Caches for 4 PEs
    std::vector<KVCachePE> kv_pes(NUM_PES);
    for (int p = 0; p < NUM_PES; ++p) {
        kv_pes[p].k_cache.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * HEAD_DIM, 0);
        kv_pes[p].k_scale.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0.0f);
        kv_pes[p].v_cache.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * HEAD_DIM, 0);
        kv_pes[p].v_scale.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0.0f);
    }

    // run!
    if (strcmp(mode, "generate") == 0) {
        generate(model, kv_pes.data(), &tokenizer, &sampler, prompt, steps);
    } else if (strcmp(mode, "chat") == 0) {
        chat(model, kv_pes.data(), &tokenizer, &sampler, prompt, system_prompt, steps);
    } else {
        fprintf(stderr, "unknown mode: %s\n", mode);
        error_usage();
    }

    // memory and file handles cleanup
    free_sampler(&sampler);
    free_tokenizer(&tokenizer);
    return 0;
}

