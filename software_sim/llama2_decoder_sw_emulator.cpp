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
#include <array>
#include <limits>
#include <stdexcept>

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
static constexpr int ACTIVATION_BITS = 14;
static constexpr int MAX_SEQ_LEN = 4096;
static constexpr int NUM_LAYERS = 32;


// HLS Bank Layout Offsets in 512-bit words
// Current HLS image layout (int4_model_layout.hpp).  Each matrix is a stream
// of 4224-word superblocks: 128 scale words followed by 4096 weight words.
static constexpr int NORM_BASE_WORD = 0;
static constexpr int WEIGHT_BASE_WORD = 4160;
static constexpr int TOTAL_WORDS = 13516736;
static constexpr int SUPERBLOCK_WORDS = 4224;
static constexpr int SCALE_WORDS_PER_BLOCK = 128;
static constexpr int TILES_PER_BLOCK = 16;
static constexpr int WORD_BYTES = 64;
static constexpr int KV_WORDS_PER_TOKEN_HEAD = 5;
static constexpr int KV_RECORD_BYTES = KV_WORDS_PER_TOKEN_HEAD * WORD_BYTES;
static constexpr int KV_DUMP_BYTES =
    NUM_PES * LOCAL_HEADS * KV_RECORD_BYTES;
static constexpr int VECTOR_WORDS_PER_PE = LOCAL_DIM / 16;
static constexpr int HIDDEN_WORDS_PER_PE = LOCAL_HIDDEN_DIM / 16;
static constexpr int LOCAL_GROUPS_DIM = LOCAL_DIM / GROUP_SIZE;
static constexpr int LOCAL_GROUPS_HIDDEN = LOCAL_HIDDEN_DIM / GROUP_SIZE;
static constexpr int QSCALE_DIM_WORDS = LOCAL_GROUPS_DIM + 1;
static constexpr int QSCALE_HIDDEN_WORDS = LOCAL_GROUPS_HIDDEN + 2;
static constexpr int STAGE_ATTN_RMS_WORD = 0;
static constexpr int STAGE_Q_WORD = STAGE_ATTN_RMS_WORD + QSCALE_DIM_WORDS;
static constexpr int STAGE_K_WORD = STAGE_Q_WORD + VECTOR_WORDS_PER_PE;
static constexpr int STAGE_V_WORD = STAGE_K_WORD + VECTOR_WORDS_PER_PE;
static constexpr int STAGE_ATTN_QSCALE_WORD =
    STAGE_V_WORD + VECTOR_WORDS_PER_PE;
static constexpr int STAGE_O_WORD =
    STAGE_ATTN_QSCALE_WORD + QSCALE_DIM_WORDS;
static constexpr int STAGE_FFN_RMS_WORD = STAGE_O_WORD + VECTOR_WORDS_PER_PE;
static constexpr int STAGE_GATE_WORD =
    STAGE_FFN_RMS_WORD + QSCALE_DIM_WORDS;
static constexpr int STAGE_UP_WORD = STAGE_GATE_WORD + HIDDEN_WORDS_PER_PE;
static constexpr int STAGE_SWIGLU_WORD =
    STAGE_UP_WORD + HIDDEN_WORDS_PER_PE;
static constexpr int STAGE_DOWN_WORD =
    STAGE_SWIGLU_WORD + QSCALE_HIDDEN_WORDS;
static constexpr int Q_DEEP_ROWS = 4;
static constexpr int DEEP_MAX_LOCAL_GROUPS = LOCAL_GROUPS_HIDDEN;
static constexpr int Q_DEEP_VALUES = DEEP_MAX_LOCAL_GROUPS * Q_DEEP_ROWS;
static constexpr int Q_DEEP_WORDS = Q_DEEP_VALUES / 16;
static constexpr int STAGE_Q_LOCAL_PARTIAL_WORD =
    STAGE_DOWN_WORD + VECTOR_WORDS_PER_PE;
static constexpr int STAGE_Q_GROUP_DOT_WORD =
    STAGE_Q_LOCAL_PARTIAL_WORD + PADDED_VOCAB_SIZE / 16;
static constexpr int STAGE_Q_WEIGHT_SCALE_WORD =
    STAGE_Q_GROUP_DOT_WORD + Q_DEEP_WORDS;
static constexpr int STAGE_Q_CUMULATIVE_WORD =
    STAGE_Q_WEIGHT_SCALE_WORD + Q_DEEP_WORDS;
static constexpr int STAGE_Q_ACTIVATION_WORD =
    STAGE_Q_CUMULATIVE_WORD + Q_DEEP_WORDS;
static constexpr int STAGE_Q_WEIGHT_WORD =
    STAGE_Q_ACTIVATION_WORD + DEEP_MAX_LOCAL_GROUPS;
static constexpr int STAGE_WORDS_PER_PE =
    STAGE_Q_WEIGHT_WORD + DEEP_MAX_LOCAL_GROUPS;
static constexpr int STAGE_BYTES_PER_PE = STAGE_WORDS_PER_PE * WORD_BYTES;
static constexpr int STAGE_DUMP_BYTES = NUM_PES * STAGE_BYTES_PER_PE;
static_assert(KV_DUMP_BYTES == 10240,
              "one layer-zero KV dump must contain all PE/head records");
static_assert(Q_DEEP_WORDS == 22,
              "four rows across 88 local groups must occupy 22 words");
static_assert(STAGE_WORDS_PER_PE == 3119,
              "layer-zero full-stage trace layout changed unexpectedly");

static int g_num_layers = 32;
static int g_cache_seq_len = MAX_SEQ_LEN;
static const std::string HARDCODED_WEIGHTS_DIR = "C:/KLTN/4PE_U250";
static bool g_float_act = false;  // --float-act: bypass E8M0, use float activation (for debugging)
static bool g_e8m0_act = false;   // --e8m0-act: enable E8M0 activation quantization in autoround mode
static bool g_add_bos = true;     // --no-bos: align a prompt token with host position zero
static std::string g_dump_logits_dir;
static std::string g_dump_residuals_dir;
static std::string g_dump_layer_trace_dir;
static std::string g_dump_kv_cache_dir;
static int g_dump_kv_layer = 0;
static std::string g_dump_stage_trace_dir;
static int g_trace_layer = 0;
static int g_trace_mode = 3;
static std::vector<float> g_layer_trace;
static std::vector<uint8_t> g_stage_trace;

static uint8_t* stage_word_ptr(int pe, int word);
static void store_u32_le(uint8_t* destination, uint32_t value);


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
    std::vector<std::vector<float>> pe_scales;   // [4][rows * local_cols/128]
};

struct KVCachePE {
    std::vector<int8_t> k_cache;
    std::vector<uint8_t> k_shift;
    std::vector<int8_t> v_cache;
    std::vector<uint8_t> v_shift;
};

struct RopeTable {
    std::vector<int32_t> cosine; // signed Q2.17, 64 pairs/position
    std::vector<int32_t> sine;
    bool loaded = false;
};

static RopeTable g_rope;

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


static inline float fp_add(float a, float b) {
    volatile float r = a + b;
    return r;
}

static inline float fp_mul(float a, float b) {
    volatile float r = a * b;
    return r;
}

// Group-32 microscaling used by int4_quantize_g32 in the HLS.  ap_fixed's
// AP_TRN conversion is a floor operation (including negative values), then
// the fixed-point arithmetic right shift aligns every mantissa to max_exp.
void quantize_activation_g32(const float* input, int size, QuantizedActivation& out) {
    out.q.resize(size);
    const int num_groups = size / GROUP_SIZE;
    out.scale.resize(num_groups);

    for (int g = 0; g < num_groups; ++g) {
        const int base = g * GROUP_SIZE;
        int max_exp = -255;
        int exps[GROUP_SIZE];
        int32_t mantissa_raw[GROUP_SIZE];

        // Pass 1: frexpf extracts mantissa in [-1, +1) and exponent (zero division)
        for (int i = 0; i < GROUP_SIZE; ++i) {
            float val = input[base + i];
            if (val != 0.0f) {
                const float mantissa = std::frexp(val, &exps[i]);
                mantissa_raw[i] = static_cast<int32_t>(
                    std::floor(static_cast<double>(mantissa) * 8192.0));
                if (exps[i] > max_exp) max_exp = exps[i];
            } else {
                mantissa_raw[i] = 0;
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
            int val = dif >= 31 ? (mantissa_raw[i] < 0 ? -1 : 0)
                                : (mantissa_raw[i] >> dif);
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
    std::vector<float>& output,
    bool capture_deep_q = false
) {
    output.assign(mat.rows, 0.0f);
    std::vector<std::vector<float>> pe_partials(NUM_PES, std::vector<float>(mat.rows, 0.0f));

    #pragma omp parallel for collapse(2) schedule(static)
    for (int p = 0; p < NUM_PES; ++p) {
        for (int r = 0; r < mat.rows; ++r) {
            const int4_t* weights = mat.pe_weights[p].data();
            const float* scales = mat.pe_scales[p].data();
            const int col_offset = p * mat.local_cols;
            const int groups128 = mat.local_cols / 128;
            float row_sum = 0.0f;

            // The HLS consumes groups in increasing local-column order and
            // rounds every FP32 multiply/add at each group boundary.
            for (int g128 = 0; g128 < groups128; ++g128) {
                const float weight_scale = scales[r * groups128 + g128];
                for (int sg = 0; sg < 4; ++sg) {
                    const int c = g128 * 128 + sg * GROUP_SIZE;
                    const int global_c = col_offset + c;
                    const int g = global_c / GROUP_SIZE;
                    const float act_scale = act.scale[g];
                    const float combined_scale = fp_mul(weight_scale, act_scale);

                    int32_t group_dot = 0;
                    for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                        const int4_t w = weights[r * mat.local_cols + c + lane];
                        const int14_t a = act.q[global_c + lane];
                        group_dot += static_cast<int32_t>(w) * static_cast<int32_t>(a);
                    }
                    const float contribution = fp_mul(static_cast<float>(group_dot), combined_scale);
                    row_sum = fp_add(row_sum, contribution);
                    if (capture_deep_q && r < Q_DEEP_ROWS) {
                        const int group = g128 * 4 + sg;
                        const int trace_index = group * Q_DEEP_ROWS + r;
                        uint32_t scale_bits = 0;
                        uint32_t cumulative_bits = 0;
                        std::memcpy(&scale_bits, &weight_scale,
                                    sizeof(scale_bits));
                        std::memcpy(&cumulative_bits, &row_sum,
                                    sizeof(cumulative_bits));
                        uint8_t* dot_destination = stage_word_ptr(
                            p, STAGE_Q_GROUP_DOT_WORD + trace_index / 16) +
                            (trace_index % 16) * 4;
                        uint8_t* scale_destination = stage_word_ptr(
                            p, STAGE_Q_WEIGHT_SCALE_WORD +
                                   trace_index / 16) +
                            (trace_index % 16) * 4;
                        uint8_t* cumulative_destination = stage_word_ptr(
                            p, STAGE_Q_CUMULATIVE_WORD +
                                   trace_index / 16) +
                            (trace_index % 16) * 4;
                        store_u32_le(dot_destination,
                                     static_cast<uint32_t>(group_dot));
                        store_u32_le(scale_destination, scale_bits);
                        store_u32_le(cumulative_destination,
                                     cumulative_bits);
                    }
                }
            }
            pe_partials[p][r] = row_sum;
        }
    }

    if (capture_deep_q) {
        for (int p = 0; p < NUM_PES; ++p) {
            const int4_t* weights = mat.pe_weights[p].data();
            const int col_offset = p * mat.local_cols;
            const int local_groups = mat.local_cols / GROUP_SIZE;
            for (int group = 0; group < local_groups; ++group) {
                uint8_t* activation_destination = stage_word_ptr(
                    p, STAGE_Q_ACTIVATION_WORD + group);
                const int global_c = col_offset + group * GROUP_SIZE;
                for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                    const uint16_t value = static_cast<uint16_t>(
                        act.q[global_c + lane]) & 0x3fffU;
                    for (int bit = 0; bit < 14; ++bit) {
                        const int destination_bit = lane * 14 + bit;
                        activation_destination[destination_bit / 8] |=
                            static_cast<uint8_t>(
                                ((value >> bit) & 1U) <<
                                (destination_bit % 8));
                    }
                }

                uint8_t* weight_destination = stage_word_ptr(
                    p, STAGE_Q_WEIGHT_WORD + group);
                const int c = group * GROUP_SIZE;
                for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                    const uint8_t row0 = static_cast<uint8_t>(
                        weights[c + lane]) & 0x0fU;
                    const uint8_t row1 = static_cast<uint8_t>(
                        weights[mat.local_cols + c + lane]) & 0x0fU;
                    const uint8_t row2 = static_cast<uint8_t>(
                        weights[2 * mat.local_cols + c + lane]) & 0x0fU;
                    const uint8_t row3 = static_cast<uint8_t>(
                        weights[3 * mat.local_cols + c + lane]) & 0x0fU;
                    weight_destination[2 * lane] =
                        static_cast<uint8_t>((row0 << 4) | row1);
                    weight_destination[2 * lane + 1] =
                        static_cast<uint8_t>((row2 << 4) | row3);
                }
            }
            for (int r = 0; r < mat.rows; ++r) {
                uint32_t bits = 0;
                std::memcpy(&bits, &pe_partials[p][r], sizeof(bits));
                uint8_t* destination = stage_word_ptr(
                    p, STAGE_Q_LOCAL_PARTIAL_WORD + r / 16) +
                    (r % 16) * 4;
                store_u32_le(destination, bits);
            }
        }
    }

    #pragma omp parallel for schedule(static)
    for (int r = 0; r < mat.rows; ++r) {
        float sum01 = fp_add(pe_partials[0][r], pe_partials[1][r]);
        float sum23 = fp_add(pe_partials[2][r], pe_partials[3][r]);
        output[r] = fp_add(sum01, sum23);
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

static void rmsnorm_quantize_hls(
    const float* input, const float* gamma, QuantizedActivation& output) {
    float pe_partial[NUM_PES] = {0, 0, 0, 0};
    for (int p = 0; p < NUM_PES; ++p) {
        float slots[8] = {0, 0, 0, 0, 0, 0, 0, 0};
        const int base = p * LOCAL_DIM;
        for (int i = 0; i < LOCAL_DIM; ++i) {
            const float square = fp_mul(input[base + i], input[base + i]);
            slots[i & 7] = fp_add(slots[i & 7], square);
        }
        float total = 0.0f;
        for (float slot : slots) total = fp_add(total, slot);
        pe_partial[p] = total;
    }
    const float sum01 = fp_add(pe_partial[0], pe_partial[1]);
    const float sum23 = fp_add(pe_partial[2], pe_partial[3]);
    const float total = fp_add(sum01, sum23);
    const float mean_eps = fp_add(fp_mul(total, 1.0f / static_cast<float>(DIM)), 1.0e-5f);
    const float reciprocal = 1.0f / std::sqrt(mean_eps);

    std::vector<float> normalized(DIM);
    #pragma omp parallel for schedule(static)
    for (int i = 0; i < DIM; ++i) {
        normalized[i] = fp_mul(fp_mul(input[i], reciprocal), gamma[i]);
    }
    quantize_activation_g32(normalized.data(), DIM, output);
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

static inline int32_t saturate_i32(int64_t value) {
    if (value > INT32_MAX) return INT32_MAX;
    if (value < INT32_MIN) return INT32_MIN;
    return static_cast<int32_t>(value);
}

static int32_t float_to_q17(float value) {
    uint32_t bits;
    std::memcpy(&bits, &value, sizeof(bits));
    const bool negative = (bits >> 31) != 0;
    const uint32_t exponent = (bits >> 23) & 0xffU;
    const uint32_t fraction = bits & 0x7fffffU;
    if (exponent == 0 || exponent < 109) return 0;
    if (exponent >= 141) return negative ? INT32_MIN : INT32_MAX;
    const uint32_t significand = (1U << 23) | fraction;
    uint64_t magnitude;
    if (exponent >= 133) {
        magnitude = static_cast<uint64_t>(significand) << (exponent - 133);
    } else {
        const unsigned shift = 133 - exponent;
        uint32_t quotient = significand >> shift;
        const uint32_t mask = (1U << shift) - 1U;
        const uint32_t remainder = significand & mask;
        const uint32_t halfway = 1U << (shift - 1);
        if (remainder > halfway || (remainder == halfway && (quotient & 1U))) ++quotient;
        magnitude = quotient;
    }
    if (!negative) return magnitude > static_cast<uint64_t>(INT32_MAX) ? INT32_MAX
                                                                       : static_cast<int32_t>(magnitude);
    return magnitude >= (1ULL << 31) ? INT32_MIN : -static_cast<int32_t>(magnitude);
}

static inline int64_t round_shift_even(int64_t value, unsigned shift) {
    if (shift == 0) return value;
    const bool neg = value < 0;
    const uint64_t mag = neg ? static_cast<uint64_t>(-(value + 1)) + 1U
                             : static_cast<uint64_t>(value);
    uint64_t q = mag >> shift;
    const uint64_t rem = mag & ((uint64_t(1) << shift) - 1U);
    const uint64_t half = uint64_t(1) << (shift - 1);
    if (rem > half || (rem == half && (q & 1U))) ++q;
    return neg ? -static_cast<int64_t>(q) : static_cast<int64_t>(q);
}

static inline int64_t wrap_signed(int64_t value, unsigned bits) {
    const uint64_t mask = (uint64_t(1) << bits) - 1U;
    uint64_t raw = static_cast<uint64_t>(value) & mask;
    if (raw & (uint64_t(1) << (bits - 1))) raw |= ~mask;
    return static_cast<int64_t>(raw);
}

static void apply_rope_q17(int32_t* vec, int pos) {
    const int rope_base = pos * (HEAD_DIM / 2);
    for (int h = 0; h < NUM_HEADS; ++h) {
        int32_t* head = vec + h * HEAD_DIM;
        for (int pair = 0; pair < HEAD_DIM / 2; ++pair) {
            const int32_t a = head[2 * pair];
            const int32_t b = head[2 * pair + 1];
            const int32_t c = g_rope.cosine[rope_base + pair];
            const int32_t s = g_rope.sine[rope_base + pair];
            head[2 * pair] = saturate_i32((static_cast<int64_t>(a) * c -
                                           static_cast<int64_t>(b) * s) >> 17);
            head[2 * pair + 1] = saturate_i32((static_cast<int64_t>(a) * s +
                                               static_cast<int64_t>(b) * c) >> 17);
        }
    }
}

static inline uint8_t swiftkv_shift_for_group(const int32_t* values) {
    uint32_t maximum = 0;
    for (int i = 0; i < GROUP_SIZE; ++i) {
        const int64_t v = values[i];
        const uint32_t mag = static_cast<uint32_t>(v < 0 ? -v : v);
        maximum = std::max(maximum, mag);
    }
    if (maximum == 0) return 0;
    int msb = 31;
    while (msb > 0 && ((maximum >> msb) & 1U) == 0) --msb;
    return static_cast<uint8_t>(msb > 6 ? msb - 6 : 0);
}

static inline int8_t swiftkv_quantize_raw(int32_t raw, uint8_t shift) {
    const int64_t wide = raw;
    uint64_t magnitude = static_cast<uint64_t>(wide < 0 ? -wide : wide);
    if (shift) magnitude += uint64_t(1) << (shift - 1);
    magnitude >>= shift;
    if (magnitude > 127) magnitude = 127;
    return static_cast<int8_t>(wide < 0 ? -static_cast<int>(magnitude)
                                        : static_cast<int>(magnitude));
}

static constexpr uint32_t SWIFTKV_EXP2_LUT_Q30[33] = {
    1073741824U,1097253708U,1121280436U,1145833280U,1170923762U,1196563654U,
    1222764986U,1249540052U,1276901417U,1304861917U,1333434672U,1362633090U,
    1392470869U,1422962010U,1454120821U,1485961921U,1518500250U,1551751076U,
    1585730000U,1620452965U,1655936265U,1692196547U,1729250827U,1767116489U,
    1805811301U,1845353420U,1885761398U,1927054196U,1969251188U,2012372174U,
    2056437387U,2101467502U,2147483648U
};

static uint32_t swiftkv_exp_negative_q17(int32_t x) {
    if (x >= 0) return 1U << 17;
    if (x <= -(32 << 17)) return 0;
    const int32_t log2_e_q21 = static_cast<int32_t>(std::nearbyint(1.4426950408889634 * (1 << 21)));
    int64_t log2_raw = round_shift_even(static_cast<int64_t>(x) * log2_e_q21, 21);
    log2_raw = wrap_signed(log2_raw, 24);
    const int exponent = static_cast<int>(log2_raw >> 17);
    const int32_t fraction = static_cast<int32_t>(log2_raw - (static_cast<int64_t>(exponent) << 17));
    const unsigned index = static_cast<unsigned>(fraction) >> 12;
    const unsigned remainder = static_cast<unsigned>(fraction) & 0xfffU;
    const uint32_t base = SWIFTKV_EXP2_LUT_Q30[index];
    const uint32_t delta = SWIFTKV_EXP2_LUT_Q30[index + 1] - base;
    const uint32_t interpolated = base + static_cast<uint32_t>(
        (static_cast<uint64_t>(delta) * remainder + (1U << 11)) >> 12);
    const int shift = 13 - exponent;
    uint64_t output = 0;
    if (shift <= 0) output = static_cast<uint64_t>(interpolated) << (-shift);
    else if (shift < 32) output = (static_cast<uint64_t>(interpolated) +
                                  (uint64_t(1) << (shift - 1))) >> shift;
    return static_cast<uint32_t>(output) & ((1U << 18) - 1U);
}

static inline int32_t mul_q17_wrap(int32_t a, uint32_t b) {
    return static_cast<int32_t>(wrap_signed(
        round_shift_even(static_cast<int64_t>(a) * static_cast<int64_t>(b), 17), 32));
}

static void swiftkv_attention_4pe(
    const int32_t* q, const int32_t* k, const int32_t* v,
    KVCachePE* kv_pes, int layer_idx, int pos, QuantizedActivation& output) {
    output.q.assign(DIM, 0);
    output.scale.assign(DIM / GROUP_SIZE, 0.0f);
    const int32_t score_scale = float_to_q17(0.08838834764831845f);

    #pragma omp parallel for collapse(2) schedule(static)
    for (int p = 0; p < NUM_PES; ++p) {
        for (int lh = 0; lh < LOCAL_HEADS; ++lh) {
            KVCachePE& pe = kv_pes[p];
            const int gh = p * LOCAL_HEADS + lh;
            const int32_t* qh = q + gh * HEAD_DIM;
            const int32_t* kh = k + gh * HEAD_DIM;
            const int32_t* vh = v + gh * HEAD_DIM;
            const size_t record = (static_cast<size_t>(layer_idx) * LOCAL_HEADS + lh) * g_cache_seq_len + pos;
            const size_t data_base = record * HEAD_DIM;
            const size_t shift_base = record * 4;
            for (int group = 0; group < 4; ++group) {
                const uint8_t ks = swiftkv_shift_for_group(kh + group * GROUP_SIZE);
                const uint8_t vs = swiftkv_shift_for_group(vh + group * GROUP_SIZE);
                pe.k_shift[shift_base + group] = ks;
                pe.v_shift[shift_base + group] = vs;
                for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                    pe.k_cache[data_base + group * GROUP_SIZE + lane] =
                        swiftkv_quantize_raw(kh[group * GROUP_SIZE + lane], ks);
                    pe.v_cache[data_base + group * GROUP_SIZE + lane] =
                        swiftkv_quantize_raw(vh[group * GROUP_SIZE + lane], vs);
                }
            }

            int32_t running_max = 0;
            uint32_t normalization = 0; // unsigned Q13.17, wrap30
            int32_t state[HEAD_DIM] = {0};
            for (int token = 0; token <= pos; ++token) {
                const size_t tr = (static_cast<size_t>(layer_idx) * LOCAL_HEADS + lh) * g_cache_seq_len + token;
                const size_t tb = tr * HEAD_DIM;
                const size_t ts = tr * 4;
                int64_t token_dot = 0;
                for (int group = 0; group < 4; ++group) {
                    int64_t halves[2] = {0, 0};
                    for (int half = 0; half < 2; ++half) {
                        int64_t sum = 0;
                        for (int lane = 0; lane < 16; ++lane) {
                            const int idx = group * 32 + half * 16 + lane;
                            sum += static_cast<int64_t>(qh[idx]) * pe.k_cache[tb + idx];
                        }
                        const int shift = static_cast<int>(pe.k_shift[ts + group]);
                        halves[half] = wrap_signed(shift >= 10 ? (sum << (shift - 10))
                                                               : (sum >> (10 - shift)), 44);
                    }
                    const int64_t group_dot = wrap_signed(halves[0] + halves[1], 44);
                    token_dot = group == 0 ? group_dot : wrap_signed(token_dot + group_dot, 44);
                }
                const int32_t score = saturate_i32(round_shift_even(token_dot * score_scale, 24));
                uint32_t coefficient = 1U << 17;
                bool rescale_history = false;
                if (token == 0) {
                    running_max = score;
                    normalization = 1U << 17;
                } else if (score <= running_max) {
                    coefficient = swiftkv_exp_negative_q17(saturate_i32(
                        static_cast<int64_t>(score) - running_max));
                    normalization = (normalization + coefficient) & ((1U << 30) - 1U);
                } else {
                    coefficient = swiftkv_exp_negative_q17(saturate_i32(
                        static_cast<int64_t>(running_max) - score));
                    normalization = static_cast<uint32_t>(round_shift_even(
                        static_cast<int64_t>(normalization) * coefficient, 17)) & ((1U << 30) - 1U);
                    normalization = (normalization + (1U << 17)) & ((1U << 30) - 1U);
                    running_max = score;
                    rescale_history = true;
                }
                for (int d = 0; d < HEAD_DIM; ++d) {
                    const int group = d / GROUP_SIZE;
                    const int32_t value = static_cast<int32_t>(pe.v_cache[tb + d]) << pe.v_shift[ts + group];
                    if (token == 0) state[d] = value;
                    else if (rescale_history) {
                        state[d] = saturate_i32(static_cast<int64_t>(mul_q17_wrap(state[d], coefficient)) + value);
                    } else {
                        state[d] = saturate_i32(static_cast<int64_t>(state[d]) + mul_q17_wrap(value, coefficient));
                    }
                }
            }
            const uint32_t inverse = normalization == 0 ? 0U : static_cast<uint32_t>(
                ((uint64_t(1) << 34) + (normalization >> 1)) / normalization);
            int32_t normalized[HEAD_DIM];
            for (int d = 0; d < HEAD_DIM; ++d) normalized[d] = mul_q17_wrap(state[d], inverse);
            for (int group = 0; group < 4; ++group) {
                int32_t max_raw = 0;
                for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                    const int32_t value = normalized[group * GROUP_SIZE + lane];
                    const int32_t mag = value == INT32_MIN ? INT32_MAX : std::abs(value);
                    max_raw = std::max(max_raw, mag);
                }
                const float max_float = static_cast<float>(max_raw) * (1.0f / 131072.0f);
                int max_exp = -127;
                if (max_float != 0.0f) std::frexp(max_float, &max_exp);
                const float scale = max_float == 0.0f ? 0.0f : std::ldexp(1.0f, max_exp - 13);
                const float inv_scale = max_float == 0.0f ? 0.0f : std::ldexp(1.0f, 13 - max_exp);
                const int global_group = gh * 4 + group;
                output.scale[global_group] = scale;
                for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                    const float value = static_cast<float>(normalized[group * GROUP_SIZE + lane]) * (1.0f / 131072.0f);
                    float rounded = fp_mul(value, inv_scale);
                    rounded += rounded >= 0.0f ? 0.5f : -0.5f;
                    rounded = std::max(-8191.0f, std::min(8191.0f, rounded));
                    output.q[global_group * GROUP_SIZE + lane] = static_cast<int16_t>(rounded);
                }
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

static uint8_t* stage_word_ptr(int pe, int word) {
    return g_stage_trace.data() +
        (static_cast<size_t>(pe) * STAGE_WORDS_PER_PE + word) *
            WORD_BYTES;
}

static void store_u32_le(uint8_t* destination, uint32_t value) {
    destination[0] = static_cast<uint8_t>(value);
    destination[1] = static_cast<uint8_t>(value >> 8);
    destination[2] = static_cast<uint8_t>(value >> 16);
    destination[3] = static_cast<uint8_t>(value >> 24);
}

static void pack_stage_fxp32(const std::vector<int32_t>& values,
                             int local_values, int stage_word) {
    for (int pe = 0; pe < NUM_PES; ++pe) {
        const int global_base = pe * local_values;
        for (int index = 0; index < local_values; ++index) {
            uint8_t* destination = stage_word_ptr(
                pe, stage_word + index / 16) + (index % 16) * 4;
            store_u32_le(destination,
                         static_cast<uint32_t>(values[global_base + index]));
        }
    }
}

static void pack_stage_fp32(const std::vector<float>& values,
                            int local_values, int stage_word) {
    for (int pe = 0; pe < NUM_PES; ++pe) {
        const int global_base = pe * local_values;
        for (int index = 0; index < local_values; ++index) {
            uint32_t bits = 0;
            std::memcpy(&bits, &values[global_base + index], sizeof(bits));
            uint8_t* destination = stage_word_ptr(
                pe, stage_word + index / 16) + (index % 16) * 4;
            store_u32_le(destination, bits);
        }
    }
}

static void pack_stage_qscale(const QuantizedActivation& activation,
                              int local_groups, int stage_word) {
    for (int pe = 0; pe < NUM_PES; ++pe) {
        for (int group = 0; group < local_groups; ++group) {
            uint8_t* quantized = stage_word_ptr(pe, stage_word + group);
            const int global_group = pe * local_groups + group;
            for (int lane = 0; lane < GROUP_SIZE; ++lane) {
                const uint16_t raw = static_cast<uint16_t>(
                    activation.q[global_group * GROUP_SIZE + lane]) &
                    0x3fffU;
                const int first_bit = lane * 14;
                for (int bit = 0; bit < 14; ++bit) {
                    if ((raw >> bit) & 1U) {
                        const int destination_bit = first_bit + bit;
                        quantized[destination_bit / 8] |=
                            static_cast<uint8_t>(1U <<
                                (destination_bit % 8));
                    }
                }
            }
        }

        const int scale_word = stage_word + local_groups;
        for (int group = 0; group < local_groups; ++group) {
            const float scale = activation.scale[
                pe * local_groups + group];
            uint8_t encoded = 0;
            if (scale != 0.0f) {
                int scale_exp = 0;
                (void)std::frexp(scale, &scale_exp);
                const int raw = scale_exp + 127 +
                    ACTIVATION_BITS - 2;
                encoded = static_cast<uint8_t>(
                    std::max(0, std::min(255, raw)));
            }
            stage_word_ptr(pe, scale_word + group / WORD_BYTES)
                [group % WORD_BYTES] = encoded;
        }
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
    if (!g_dump_stage_trace_dir.empty()) {
        g_stage_trace.assign(STAGE_DUMP_BYTES, 0);
    }
    if (!g_dump_layer_trace_dir.empty()) {
        g_layer_trace.assign(static_cast<size_t>(1 + 2 * NUM_LAYERS) * DIM,
                             0.0f);
        std::copy(residual.begin(), residual.end(), g_layer_trace.begin());
    }

    std::vector<float> q_float(DIM), k_float(DIM), v_float(DIM);
    std::vector<int32_t> q(DIM), k(DIM), v(DIM);
    std::vector<float> proj_o(DIM);
    std::vector<float> gate(PADDED_HIDDEN_DIM), up(PADDED_HIDDEN_DIM);
    std::vector<float> swiglu_out(PADDED_HIDDEN_DIM);
    std::vector<float> proj_down(DIM);
    QuantizedActivation norm_act, attn_act, swiglu_act;
    const auto capture_deep = [](int layer, int mode) {
        return !g_dump_stage_trace_dir.empty() &&
               layer == g_trace_layer && mode == g_trace_mode;
    };

    for (int l = 0; l < g_num_layers; ++l) {
        const DecoderLayer& layer = model.layers[l];

        rmsnorm_quantize_hls(residual.data(), layer.attn_norm_gamma.data(), norm_act);
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_qscale(norm_act, LOCAL_GROUPS_DIM,
                              STAGE_ATTN_RMS_WORD);
        }
        sharded_gemv_4pe(
            layer.w_q, norm_act, q_float,
            capture_deep(l, 0));
        sharded_gemv_4pe(layer.w_k, norm_act, k_float,
                         capture_deep(l, 1));
        sharded_gemv_4pe(layer.w_v, norm_act, v_float,
                         capture_deep(l, 2));
        #pragma omp parallel for schedule(static)
        for (int i = 0; i < DIM; ++i) {
            q[i] = float_to_q17(q_float[i]);
            k[i] = float_to_q17(k_float[i]);
            v[i] = float_to_q17(v_float[i]);
        }
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_fxp32(q, LOCAL_DIM, STAGE_Q_WORD);
            pack_stage_fxp32(k, LOCAL_DIM, STAGE_K_WORD);
            pack_stage_fxp32(v, LOCAL_DIM, STAGE_V_WORD);
        }
        apply_rope_q17(q.data(), pos);
        apply_rope_q17(k.data(), pos);
        swiftkv_attention_4pe(q.data(), k.data(), v.data(), kv_pes, l, pos, attn_act);
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_qscale(attn_act, LOCAL_GROUPS_DIM,
                              STAGE_ATTN_QSCALE_WORD);
        }

        // One runtime selector chooses exactly one layer/mode for the shared
        // deep-linear trace region; changing it does not require a new XCLBIN.
        sharded_gemv_4pe(
            layer.w_o, attn_act, proj_o,
            capture_deep(l, 3));
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_fp32(proj_o, LOCAL_DIM, STAGE_O_WORD);
        }
        for (int i = 0; i < DIM; ++i) residual[i] += proj_o[i];
        if (!g_dump_layer_trace_dir.empty()) {
            std::copy(residual.begin(), residual.end(),
                      g_layer_trace.begin() +
                          static_cast<size_t>(1 + 2 * l) * DIM);
        }

        rmsnorm_quantize_hls(residual.data(), layer.ffn_norm_gamma.data(), norm_act);
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_qscale(norm_act, LOCAL_GROUPS_DIM,
                              STAGE_FFN_RMS_WORD);
        }
        sharded_gemv_4pe(layer.w_gate, norm_act, gate,
                         capture_deep(l, 4));
        sharded_gemv_4pe(layer.w_up, norm_act, up,
                         capture_deep(l, 5));
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_fp32(gate, LOCAL_HIDDEN_DIM, STAGE_GATE_WORD);
            pack_stage_fp32(up, LOCAL_HIDDEN_DIM, STAGE_UP_WORD);
        }
        swiglu(gate.data(), up.data(), PADDED_HIDDEN_DIM, swiglu_out.data());
        quantize_activation_g32(swiglu_out.data(), PADDED_HIDDEN_DIM, swiglu_act);
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_qscale(swiglu_act, LOCAL_GROUPS_HIDDEN,
                              STAGE_SWIGLU_WORD);
        }
        sharded_gemv_4pe(layer.w_down, swiglu_act, proj_down,
                         capture_deep(l, 6));
        if (l == 0 && !g_dump_stage_trace_dir.empty()) {
            pack_stage_fp32(proj_down, LOCAL_DIM, STAGE_DOWN_WORD);
        }
        for (int i = 0; i < DIM; ++i) residual[i] += proj_down[i];
        if (!g_dump_layer_trace_dir.empty()) {
            std::copy(residual.begin(), residual.end(),
                      g_layer_trace.begin() +
                          static_cast<size_t>(2 + 2 * l) * DIM);
        }
    }

    rmsnorm_quantize_hls(residual.data(), model.final_norm_gamma.data(), norm_act);
    std::vector<float> padded_logits(PADDED_VOCAB_SIZE, 0.0f);
    sharded_gemv_4pe(model.w_logits, norm_act, padded_logits,
                     capture_deep(NUM_LAYERS, 7));

    out_logits.resize(VOCAB_SIZE);
    std::copy(padded_logits.begin(), padded_logits.begin() + VOCAB_SIZE, out_logits.begin());

    return out_logits.data();
}

// ============================================================================
// Binary Bank Loader for Real AutoRound Weights (Hardcoded / Quiet)
// ============================================================================
static int get_weight_offset(int layer, int mode) {
    static const int matrix_data_words[8] = {
        33792, 33792, 33792, 33792, 92928, 92928, 92928, 266112
    };
    static constexpr int layer_stride = 413952;
    if (mode == 7) return 32 * layer_stride;
    int off = layer * layer_stride;
    for (int p = 0; p < mode; ++p) off += matrix_data_words[p];
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
    const int block_count = tile_count / TILES_PER_BLOCK;
    const size_t matrix_bytes = static_cast<size_t>(block_count) * SUPERBLOCK_WORDS * WORD_BYTES;
    const uint64_t matrix_byte_offset =
        static_cast<uint64_t>(WEIGHT_BASE_WORD + get_weight_offset(layer, mode)) * WORD_BYTES;

    for (int p = 0; p < NUM_PES; ++p) {
        qm.pe_weights[p].assign(static_cast<size_t>(rows) * qm.local_cols, 0);
        const int local_groups128 = qm.local_cols / 128;
        qm.pe_scales[p].assign(static_cast<size_t>(rows) * local_groups128, 0.0f);
        std::vector<uint8_t> matrix(matrix_bytes);
        banks[p].clear();
        banks[p].seekg(static_cast<std::streamoff>(matrix_byte_offset));
        banks[p].read(reinterpret_cast<char*>(matrix.data()), static_cast<std::streamsize>(matrix.size()));
        if (banks[p].gcount() != static_cast<std::streamsize>(matrix.size())) {
            throw std::runtime_error("short matrix read from model_bank" + std::to_string(p) + ".bin");
        }

        for (int t = 0; t < tile_count; ++t) {
            const int out_tile = t / local_in_tiles;
            const int in_tile = t % local_in_tiles;
            const int block = t / TILES_PER_BLOCK;
            const int tile_in_block = t % TILES_PER_BLOCK;

            // Eight scale words encode 128 rows x two G128 scales.
            for (int row = 0; row < 128; ++row) {
                const int row_block = row / 4;
                const int lane = row & 3;
                const int word = row_block / 4;
                const int r_local = row_block & 3;
                for (int g128 = 0; g128 < 2; ++g128) {
                    const int scalar = r_local * 8 + lane * 2 + g128;
                    const size_t byte_offset =
                        (static_cast<size_t>(block) * SUPERBLOCK_WORDS +
                         tile_in_block * 8 + word) * WORD_BYTES + scalar * 2;
                    int16_t raw;
                    std::memcpy(&raw, matrix.data() + byte_offset, sizeof(raw));
                    const int global_row = out_tile * 128 + row;
                    const int local_g128 = in_tile * 2 + g128;
                    qm.pe_scales[p][static_cast<size_t>(global_row) * local_groups128 + local_g128] =
                        static_cast<float>(raw) * (1.0f / 32768.0f);
                }
            }

            for (int group = 0; group < 8; ++group) {
                for (int row_block = 0; row_block < 32; ++row_block) {
                    const size_t word_index =
                        static_cast<size_t>(block) * SUPERBLOCK_WORDS + SCALE_WORDS_PER_BLOCK +
                        tile_in_block * 256 + group * 32 + row_block;
                    const uint8_t* word_bytes = matrix.data() + word_index * WORD_BYTES;

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
        banks[p].seekg(0, std::ios::end);
        const uint64_t bytes = static_cast<uint64_t>(banks[p].tellg());
        const uint64_t expected = static_cast<uint64_t>(TOTAL_WORDS) * WORD_BYTES;
        if (bytes != expected) {
            std::cerr << "ERROR: " << path << " has " << bytes << " bytes; current dense HLS layout requires "
                      << expected << " bytes.\n";
            return false;
        }
        banks[p].seekg(0);
    }

    std::string emb_path = valid_dir + "/embeddings.bin";
    std::ifstream emb_f(emb_path, std::ios::binary);
    if (!emb_f.is_open()) return false;

    model.token_embeddings.resize(VOCAB_SIZE * DIM);
    emb_f.read(reinterpret_cast<char*>(model.token_embeddings.data()), model.token_embeddings.size() * sizeof(float));
    if (emb_f.gcount() != static_cast<std::streamsize>(model.token_embeddings.size() * sizeof(float))) return false;

    // The LUT stores four 608-bit logical words per position, each padded to
    // two little-endian 512-bit DDR words.
    std::ifstream rope_f(valid_dir + "/rope_lut.bin", std::ios::binary);
    if (!rope_f.is_open()) return false;
    std::vector<uint8_t> rope_bytes(static_cast<size_t>(MAX_SEQ_LEN) * 4 * 128);
    rope_f.read(reinterpret_cast<char*>(rope_bytes.data()), static_cast<std::streamsize>(rope_bytes.size()));
    if (rope_f.gcount() != static_cast<std::streamsize>(rope_bytes.size())) return false;
    g_rope.cosine.resize(static_cast<size_t>(MAX_SEQ_LEN) * 64);
    g_rope.sine.resize(static_cast<size_t>(MAX_SEQ_LEN) * 64);
    auto extract_bits = [&](size_t base, int bit, int width) -> uint32_t {
        uint64_t value = 0;
        for (int b = 0; b < width; ++b) {
            const int source = bit + b;
            value |= static_cast<uint64_t>((rope_bytes[base + source / 8] >> (source & 7)) & 1U) << b;
        }
        return static_cast<uint32_t>(value);
    };
    auto sign19 = [](uint32_t raw) -> int32_t {
        return (raw & (1U << 18)) ? static_cast<int32_t>(raw | 0xfff80000U)
                                 : static_cast<int32_t>(raw);
    };
    for (int pos = 0; pos < MAX_SEQ_LEN; ++pos) {
        for (int group = 0; group < 4; ++group) {
            const size_t base = (static_cast<size_t>(pos) * 4 + group) * 128;
            for (int lane = 0; lane < 16; ++lane) {
                const int pair = group * 16 + lane;
                g_rope.cosine[static_cast<size_t>(pos) * 64 + pair] = sign19(extract_bits(base, lane * 38, 19));
                g_rope.sine[static_cast<size_t>(pos) * 64 + pair] = sign19(extract_bits(base, lane * 38 + 19, 19));
            }
        }
    }
    g_rope.loaded = true;

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
    unsigned char* penalized;
    float temperature;
    float topp;
    float repeat_penalty;
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

void build_sampler(Sampler* sampler, int vocab_size, float temperature,
                   float topp, float repeat_penalty,
                   unsigned long long rng_seed) {
    sampler->vocab_size = vocab_size;
    sampler->temperature = temperature;
    sampler->topp = topp;
    sampler->repeat_penalty = repeat_penalty;
    sampler->rng_state = rng_seed;
    sampler->probindex = (ProbIndex*)malloc(sampler->vocab_size * sizeof(ProbIndex));
    sampler->penalized = (unsigned char*)calloc(sampler->vocab_size, 1);
}

void free_sampler(Sampler* sampler) {
    free(sampler->probindex);
    free(sampler->penalized);
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

int sample(Sampler* sampler, float* logits,
           const std::vector<int>& token_history) {
    if (sampler->repeat_penalty != 1.0f) {
        memset(sampler->penalized, 0, sampler->vocab_size);
        for (int token : token_history) {
            if (token < 0 || token >= sampler->vocab_size ||
                sampler->penalized[token]) {
                continue;
            }
            logits[token] = logits[token] < 0.0f
                ? logits[token] * sampler->repeat_penalty
                : logits[token] / sampler->repeat_penalty;
            sampler->penalized[token] = 1;
        }
    }
    // Match llama2.c/runq.c: temperature 0 selects greedy argmax; otherwise
    // temperature scaling + softmax is followed by multinomial or top-p.
    if (sampler->temperature == 0.0f) {
        return sample_argmax(logits, sampler->vocab_size);
    }
    for (int q = 0; q < sampler->vocab_size; ++q) {
        logits[q] /= sampler->temperature;
    }
    softmax_logits(logits, sampler->vocab_size);
    const float coin = random_f32(&sampler->rng_state);
    if (sampler->topp <= 0.0f || sampler->topp >= 1.0f) {
        return sample_mult(logits, sampler->vocab_size, coin);
    }
    return sample_topp(
        logits, sampler->vocab_size, sampler->topp,
        sampler->probindex, coin);
}

// ============================================================================
// Timing
// ============================================================================
long time_in_ms() {
    auto now = std::chrono::steady_clock::now();
    return std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
}

// ============================================================================
// Generation loop: same prefill/decode boundary as tb_decoder_token.
// ============================================================================
static void dump_reference_step(int pos, int token,
                                const std::vector<float>& logits,
                                const std::vector<float>& residual,
                                const KVCachePE* kv_pes) {
    char filename[128];
    if (!g_dump_logits_dir.empty()) {
        snprintf(filename, sizeof(filename),
                 "logits_pos%04d_token%05d.bin", pos, token);
        std::ofstream out(g_dump_logits_dir + "/" + filename,
                          std::ios::binary);
        if (!out) throw std::runtime_error("cannot create software logits dump");
        out.write(reinterpret_cast<const char*>(logits.data()),
                  static_cast<std::streamsize>(VOCAB_SIZE * sizeof(float)));
        const std::array<float, PADDED_VOCAB_SIZE - VOCAB_SIZE> padding{};
        out.write(reinterpret_cast<const char*>(padding.data()),
                  static_cast<std::streamsize>(padding.size() * sizeof(float)));
    }
    if (!g_dump_residuals_dir.empty()) {
        snprintf(filename, sizeof(filename),
                 "residual_pos%04d_token%05d.bin", pos, token);
        std::ofstream out(g_dump_residuals_dir + "/" + filename,
                          std::ios::binary);
        if (!out) throw std::runtime_error("cannot create software residual dump");
        out.write(reinterpret_cast<const char*>(residual.data()),
                  static_cast<std::streamsize>(DIM * sizeof(float)));
    }
    if (!g_dump_layer_trace_dir.empty()) {
        snprintf(filename, sizeof(filename),
                 "layer_trace_pos%04d_token%05d.bin", pos, token);
        std::ofstream out(g_dump_layer_trace_dir + "/" + filename,
                          std::ios::binary);
        if (!out) {
            throw std::runtime_error(
                "cannot create software layer trace dump");
        }
        out.write(reinterpret_cast<const char*>(g_layer_trace.data()),
                  static_cast<std::streamsize>(
                      g_layer_trace.size() * sizeof(float)));
    }
    if (!g_dump_stage_trace_dir.empty()) {
        snprintf(filename, sizeof(filename),
                 "stage_trace_pos%04d_token%05d.bin", pos, token);
        std::ofstream out(g_dump_stage_trace_dir + "/" + filename,
                          std::ios::binary | std::ios::trunc);
        if (!out) {
            throw std::runtime_error(
                "cannot create software stage trace dump");
        }
        out.write(reinterpret_cast<const char*>(g_stage_trace.data()),
                  static_cast<std::streamsize>(g_stage_trace.size()));
        if (!out || g_stage_trace.size() !=
                static_cast<size_t>(STAGE_DUMP_BYTES)) {
            throw std::runtime_error(
                "cannot write complete software stage trace dump");
        }
    }
    if (!g_dump_kv_cache_dir.empty()) {
        // Repack the semantic software cache into the exact headerless HLS
        // DDR layout: [PE][local_head][metadata,K0,K1,V0,V1].
        snprintf(filename, sizeof(filename),
                 "kv_layer%02d_pos%04d_token%05d.bin",
                 g_dump_kv_layer, pos, token);
        std::ofstream out(g_dump_kv_cache_dir + "/" + filename,
                          std::ios::binary | std::ios::trunc);
        if (!out) {
            throw std::runtime_error(
                "cannot create software KV cache dump");
        }
        std::array<uint8_t, KV_RECORD_BYTES> packed{};
        for (int pe = 0; pe < NUM_PES; ++pe) {
            for (int head = 0; head < LOCAL_HEADS; ++head) {
                packed.fill(0);
                const size_t semantic_record =
                    (static_cast<size_t>(g_dump_kv_layer) * LOCAL_HEADS +
                     head) * g_cache_seq_len + pos;
                const size_t data_base = semantic_record * HEAD_DIM;
                const size_t shift_base = semantic_record *
                    (HEAD_DIM / GROUP_SIZE);
                uint64_t metadata = 0;
                for (int group = 0; group < HEAD_DIM / GROUP_SIZE;
                     ++group) {
                    metadata |=
                        static_cast<uint64_t>(
                            kv_pes[pe].k_shift[shift_base + group] & 0x1fU)
                        << (group * 5);
                    metadata |=
                        static_cast<uint64_t>(
                            kv_pes[pe].v_shift[shift_base + group] & 0x1fU)
                        << (20 + group * 5);
                }
                for (int byte = 0; byte < 5; ++byte) {
                    packed[byte] = static_cast<uint8_t>(
                        metadata >> (byte * 8));
                }
                for (int index = 0; index < HEAD_DIM; ++index) {
                    packed[WORD_BYTES + index] = static_cast<uint8_t>(
                        kv_pes[pe].k_cache[data_base + index]);
                    packed[3 * WORD_BYTES + index] = static_cast<uint8_t>(
                        kv_pes[pe].v_cache[data_base + index]);
                }
                out.write(reinterpret_cast<const char*>(packed.data()),
                          static_cast<std::streamsize>(packed.size()));
            }
        }
        if (!out || out.tellp() !=
                static_cast<std::streampos>(KV_DUMP_BYTES)) {
            throw std::runtime_error(
                "cannot write complete software KV cache dump");
        }
    }
}

void generate(const TransformerModel& model, KVCachePE* kv_pes, Tokenizer *tokenizer, Sampler *sampler, const char *prompt, int max_new_tokens) {
    const char *empty_prompt = "";
    if (prompt == NULL) { prompt = empty_prompt; }

    // encode the (string) prompt into tokens sequence
    int num_prompt_tokens = 0;
    int* prompt_tokens = (int*)malloc((strlen(prompt)+3) * sizeof(int)); // +3 for '\0', ?BOS, ?EOS
    encode(tokenizer, prompt, g_add_bos ? 1 : 0, 0,
           prompt_tokens, &num_prompt_tokens);
    if (num_prompt_tokens < 1) {
        fprintf(stderr, "something is wrong, expected at least 1 prompt token\n");
        exit(EXIT_FAILURE);
    }

    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    std::cout << "[Prompt tokens]";
    for (int i = 0; i < num_prompt_tokens; ++i) std::cout << ' ' << prompt_tokens[i];
    std::cout << "\n[Sampling] temperature=" << sampler->temperature
              << ", top-p=" << sampler->topp
              << ", repeat-penalty=" << sampler->repeat_penalty
              << ", seed=" << sampler->rng_state;
    std::cout << "\n[Text] " << prompt;
    std::cout.flush();

    const auto prefill_start = std::chrono::steady_clock::now();
    float* logits_ptr = nullptr;
    int pos = 0;
    for (int i = 0; i < num_prompt_tokens; ++i) {
        logits_ptr = forward(model, kv_pes, prompt_tokens[i], pos++, residual, logits);
        dump_reference_step(pos - 1, prompt_tokens[i], logits, residual,
                            kv_pes);
    }
    const auto prefill_end = std::chrono::steady_clock::now();

    int token = prompt_tokens[num_prompt_tokens - 1];
    std::vector<int> token_history(prompt_tokens,
                                   prompt_tokens + num_prompt_tokens);
    std::vector<int> generated_ids;
    std::vector<float> generated_logits;
    std::vector<float> raw_logits(VOCAB_SIZE);
    const auto decode_start = std::chrono::steady_clock::now();
    for (int generated = 0; generated < max_new_tokens && pos < MAX_SEQ_LEN; ++generated) {
        // runq.c's stochastic sampler overwrites logits with probabilities.
        // Preserve raw logits so the diagnostic output keeps its stated unit.
        std::copy(logits_ptr, logits_ptr + VOCAB_SIZE, raw_logits.begin());
        const int next = sample(sampler, logits_ptr, token_history);
        generated_ids.push_back(next);
        token_history.push_back(next);
        generated_logits.push_back(raw_logits[next]);
        if (next == 2) break;
        safe_printf(decode(tokenizer, token, next));
        fflush(stdout);
        token = next;
        if (generated + 1 < max_new_tokens) {
            logits_ptr = forward(model, kv_pes, token, pos++, residual, logits);
            dump_reference_step(pos - 1, token, logits, residual, kv_pes);
        }
    }
    const auto decode_end = std::chrono::steady_clock::now();
    std::cout << "\n[Generated token IDs]";
    for (int id : generated_ids) std::cout << ' ' << id;
    std::cout << "\n[Selected logits]";
    for (float value : generated_logits) std::cout << ' ' << std::setprecision(7) << value;
    const double prefill_s = std::chrono::duration<double>(prefill_end - prefill_start).count();
    const double decode_s = std::chrono::duration<double>(decode_end - decode_start).count();
    const int decode_forwards = std::max(0, static_cast<int>(generated_ids.size()) - 1);
    std::cout << "\n[Timing] prefill=" << std::fixed << std::setprecision(3) << prefill_s << " s";
    if (decode_forwards > 0) {
        std::cout << ", decode=" << decode_s << " s, "
                  << (decode_s * 1000.0 / decode_forwards) << " ms/token-forward";
    }
    std::cout << "\n";

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
    std::vector<int> token_history;
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
        token_history.push_back(token);

        float* logits_ptr = forward(model, kv_pes, token, pos, residual, logits);
        next = sample(sampler, logits_ptr, token_history);
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
            if (max_tokens > 0) {
                // The tokenizer is intentionally simple and expensive on a
                // complete multi-megabyte corpus.  Read a generously sized
                // prefix: 64 bytes/token leaves ample look-ahead so truncating
                // the token vector below is identical to tokenizing the full
                // file for the requested prefix.
                const size_t prefix_bytes = static_cast<size_t>(max_tokens) * 64;
                std::vector<char> prefix(prefix_bytes);
                tf.read(prefix.data(), static_cast<std::streamsize>(prefix.size()));
                text.assign(prefix.data(), static_cast<size_t>(tf.gcount()));
            } else {
                std::stringstream ss;
                ss << tf.rdbuf();
                text = ss.str();
            }
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
            kv_pes[p].k_shift.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0);
            kv_pes[p].v_cache.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * HEAD_DIM, 0);
            kv_pes[p].v_shift.assign(g_num_layers * LOCAL_HEADS * MAX_SEQ_LEN * (HEAD_DIM / 32), 0);
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
                std::fill(kv_pes[p].k_shift.begin(), kv_pes[p].k_shift.end(), 0);
                std::fill(kv_pes[p].v_cache.begin(), kv_pes[p].v_cache.end(), 0);
                std::fill(kv_pes[p].v_shift.begin(), kv_pes[p].v_shift.end(), 0);
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
static int parse_trace_mode(const std::string& name) {
    static const char* names[] = {
        "q", "k", "v", "o", "gate", "up", "down", "logits"};
    for (int mode = 0; mode < 8; ++mode) {
        if (name == names[mode]) return mode;
    }
    throw std::runtime_error("invalid --trace-mode: " + name);
}

void error_usage() {
    fprintf(stderr, "Usage:   run <checkpoint> [options]\n");
    fprintf(stderr, "Example: run model.bin -n 256 -i \"Once upon a time\"\n");
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "  -t <float>  temperature in [0,inf], default 1.0 (0.0 = greedy argmax)\n");
    fprintf(stderr, "  -p <float>  p value in top-p (nucleus) sampling in [0,1] default 0.9\n");
    fprintf(stderr, "  -r, --repeat-penalty <float> repetition penalty > 0, default 1.0\n");
    fprintf(stderr, "  -s <int>    random seed, default time(NULL)\n");
    fprintf(stderr, "  -n, --max-tokens <int> number of new tokens, default 256\n");
    fprintf(stderr, "  -i <string> input prompt\n");
    fprintf(stderr, "  --no-bos     do not prepend BOS (debug HW/SW position alignment)\n");
    fprintf(stderr, "  -z <string> optional path to custom tokenizer\n");
    fprintf(stderr, "  -m <string> mode: generate|chat, default: generate\n");
    fprintf(stderr, "  -y <string> (optional) system prompt in chat mode\n");
    fprintf(stderr, "  --ppl <file> evaluate perplexity on text/binary token file\n");
    fprintf(stderr, "  --float-act  bypass E8M0, use FP32 activation (for debug)\n");
    fprintf(stderr, "  --autoround  use autoround_w4g128.bin (W4G128 scale per-group-128)\n");
    fprintf(stderr, "  --e8m0-act   enable E8M0 activation quantization in autoround mode\n");
    fprintf(stderr, "  --dump-logits <dir> dump padded FP32 logits for every generate step\n");
    fprintf(stderr, "  --dump-residuals <dir> dump final FP32 residual for every generate step\n");
    fprintf(stderr, "  --dump-layer-trace <dir> dump 65 x 4096 layer-boundary residuals\n");
    fprintf(stderr, "  --dump-kv-cache <dir> dump selected-layer compressed KV records per step\n");
    fprintf(stderr, "  --kv-layer <0..31> layer used by --dump-kv-cache\n");
    fprintf(stderr, "  --dump-stage-trace <dir> dump all layer-0 internal stage checkpoints\n");
    fprintf(stderr, "  --trace-layer <0..32> select deep linear layer (32=logits)\n");
    fprintf(stderr, "  --trace-mode <q|k|v|o|gate|up|down|logits> select deep linear mode\n");
    fprintf(stderr, "  --replay-residual <file> run final norm + LM head on a dumped residual\n");
    fprintf(stderr, "  --replay-logits <file> output path used with --replay-residual\n");
    exit(EXIT_FAILURE);


}

int main(int argc, char *argv[]) {
    // default parameters
    char *checkpoint_path = (char*)HARDCODED_WEIGHTS_DIR.c_str();  // hardcoded default
    const char *tokenizer_path = "tokenizer.bin";
    float temperature = 1.0f;   // runq.c default; 0.0 = greedy deterministic
    float topp = 0.9f;          // top-p in nucleus sampling. 1.0 = off. 0.9 works well, but slower
    float repeat_penalty = 1.0f;
    int steps = 256;            // number of steps to run for
    char *prompt = NULL;        // prompt string
    unsigned long long rng_seed = 0; // seed rng with time by default
    const char *mode = "generate";    // generate|chat
    char *system_prompt = NULL; // the (optional) system prompt to use in chat mode
    bool is_ppl_mode = false;
    std::string ppl_path = "";
    std::string replay_residual_path;
    std::string replay_logits_path;

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
        } else if ((arg == "-r" || arg == "--repeat-penalty") &&
                   i + 1 < argc) {
            repeat_penalty = std::atof(argv[++i]);
        } else if (arg == "-s" && i + 1 < argc) {
            rng_seed = std::atoll(argv[++i]);
        } else if ((arg == "-n" || arg == "--max-tokens") && i + 1 < argc) {
            steps = std::atoi(argv[++i]);
        } else if (arg == "-i" && i + 1 < argc) {
            prompt = argv[++i];
        } else if (arg == "--no-bos") {
            g_add_bos = false;
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
        } else if (arg == "--dump-logits" && i + 1 < argc) {
            g_dump_logits_dir = argv[++i];
        } else if (arg == "--dump-residuals" && i + 1 < argc) {
            g_dump_residuals_dir = argv[++i];
        } else if (arg == "--dump-layer-trace" && i + 1 < argc) {
            g_dump_layer_trace_dir = argv[++i];
        } else if (arg == "--dump-kv-cache" && i + 1 < argc) {
            g_dump_kv_cache_dir = argv[++i];
        } else if (arg == "--kv-layer" && i + 1 < argc) {
            g_dump_kv_layer = std::atoi(argv[++i]);
        } else if (arg == "--dump-stage-trace" && i + 1 < argc) {
            g_dump_stage_trace_dir = argv[++i];
        } else if (arg == "--trace-layer" && i + 1 < argc) {
            g_trace_layer = std::atoi(argv[++i]);
        } else if (arg == "--trace-mode" && i + 1 < argc) {
            g_trace_mode = parse_trace_mode(argv[++i]);
        } else if (arg == "--replay-residual" && i + 1 < argc) {
            replay_residual_path = argv[++i];
        } else if (arg == "--replay-logits" && i + 1 < argc) {
            replay_logits_path = argv[++i];
        } else if (arg[0] != '-') {
            checkpoint_path = argv[i];
        }

    }

    // parameter validation/overrides
    if (rng_seed <= 0) rng_seed = (unsigned int)time(NULL);
    if (temperature < 0.0) temperature = 0.0;
    if (topp < 0.0 || 1.0 < topp) topp = 0.9;
    if (repeat_penalty <= 0.0f) repeat_penalty = 1.0f;
    if (steps < 0) steps = 0;
    if (g_trace_layer < 0 || g_trace_layer > NUM_LAYERS) {
        throw std::runtime_error("--trace-layer must be in [0,32]");
    }
    if (g_dump_kv_layer < 0 || g_dump_kv_layer >= g_num_layers) {
        throw std::runtime_error("--kv-layer must be in [0,num-layers-1]");
    }
    if ((g_trace_mode == 7) != (g_trace_layer == NUM_LAYERS)) {
        throw std::runtime_error(
            "logits requires --trace-layer 32; decoder modes require 0..31");
    }

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

    if (!replay_residual_path.empty()) {
        if (replay_logits_path.empty()) {
            throw std::runtime_error(
                "--replay-logits is required with --replay-residual");
        }
        std::vector<float> replay_residual(DIM);
        std::ifstream input(replay_residual_path, std::ios::binary);
        input.read(reinterpret_cast<char*>(replay_residual.data()),
                   static_cast<std::streamsize>(DIM * sizeof(float)));
        if (!input) {
            throw std::runtime_error("cannot read replay residual");
        }
        QuantizedActivation replay_norm;
        rmsnorm_quantize_hls(replay_residual.data(),
                             model.final_norm_gamma.data(), replay_norm);
        std::vector<float> replay_logits(PADDED_VOCAB_SIZE, 0.0f);
        sharded_gemv_4pe(model.w_logits, replay_norm, replay_logits);
        std::ofstream output(replay_logits_path,
                             std::ios::binary | std::ios::trunc);
        output.write(reinterpret_cast<const char*>(replay_logits.data()),
                     static_cast<std::streamsize>(
                         replay_logits.size() * sizeof(float)));
        if (!output) {
            throw std::runtime_error("cannot write replay logits");
        }
        free_tokenizer(&tokenizer);
        return 0;
    }

    // PPL Mode
    if (is_ppl_mode) {
        calculate_perplexity(model, &tokenizer, ppl_path, steps);
        free_tokenizer(&tokenizer);
        return 0;
    }


    // build the Sampler
    Sampler sampler;
    build_sampler(&sampler, VOCAB_SIZE, temperature, topp,
                  repeat_penalty, rng_seed);

    // Initialize KV Caches for 4 PEs
    if (strcmp(mode, "generate") == 0) {
        const int prompt_bound = prompt ? static_cast<int>(std::strlen(prompt)) + 3 : 3;
        g_cache_seq_len = std::min(MAX_SEQ_LEN, std::max(1, steps + prompt_bound));
    } else {
        g_cache_seq_len = MAX_SEQ_LEN;
    }
    std::vector<KVCachePE> kv_pes(NUM_PES);
    for (int p = 0; p < NUM_PES; ++p) {
        const size_t records = static_cast<size_t>(g_num_layers) * LOCAL_HEADS * g_cache_seq_len;
        kv_pes[p].k_cache.assign(records * HEAD_DIM, 0);
        kv_pes[p].k_shift.assign(records * (HEAD_DIM / 32), 0);
        kv_pes[p].v_cache.assign(records * HEAD_DIM, 0);
        kv_pes[p].v_shift.assign(records * (HEAD_DIM / 32), 0);
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

