#pragma once

#include <ap_fixed.h>
#include <ap_int.h>

// Shared scalar/packet types and compile-time model geometry.  This header is
// intentionally independent from every controller so layout, packer and
// compute modules can depend on one small, stable definition layer.
using int4_weight_word_t = ap_uint<512>;
using int4_weight_scale_word_t = ap_uint<512>;
using int4_scale_word_t = ap_uint<512>;
using int4_output_word_t = ap_uint<512>;

static constexpr int INT4_ACTIVATION_BITS = 14;
static constexpr int INT4_ACTIVATION_MAX = (1 << (INT4_ACTIVATION_BITS - 1)) - 1;
static constexpr int INT4_PACK_SHIFT = 22;
static constexpr int INT4_QUANT_WORD_BITS =
    32 * INT4_ACTIVATION_BITS;
using int4_quant_word_t = ap_uint<INT4_QUANT_WORD_BITS>;
using int4_activation_t = ap_int<INT4_ACTIVATION_BITS>;
using int4_weight_t = ap_int<4>;
using int4_group_acc_t = ap_int<23>;
using int4_packed_acc_t = ap_int<46>;
using int4_output_value_t = ap_uint<32>;

// Four FP32 values are the only wide partial-result packet that crosses an
// SLR boundary.
static constexpr int INT4_REDUCTION_LANES = 4;
static constexpr int INT4_REDUCTION_PACKET_BITS =
    INT4_REDUCTION_LANES * 32;
using int4_reduction_packet_t = ap_uint<INT4_REDUCTION_PACKET_BITS>;

static constexpr int INT4_DIM = 4096;
static constexpr int INT4_KV_DIM = 4096;
static constexpr int INT4_HIDDEN_DIM = 11008;
static constexpr int INT4_VOCAB_SIZE = 32000;
static constexpr int INT4_NUM_LAYERS = 32;

// Layer-trace ABI used only by the dedicated debug build.  Slot zero captures
// the decoder input.  Every model layer then contributes two checkpoints:
// residual after the attention projection/add and residual after FFN/add.
static constexpr int INT4_LAYER_TRACE_CHECKPOINTS =
    1 + 2 * INT4_NUM_LAYERS;

static constexpr int INT4_PE_COUNT = 4;
static constexpr int INT4_TILE_ROWS = 128;
static constexpr int INT4_TILE_COLS = 256;
static constexpr int INT4_GROUP_SIZE = 32;
static constexpr int INT4_GROUPS_PER_TILE =
    INT4_TILE_COLS / INT4_GROUP_SIZE;
static constexpr int INT4_ROW_BLOCK = INT4_REDUCTION_LANES;
static constexpr int INT4_ROW_BLOCKS =
    INT4_TILE_ROWS / INT4_ROW_BLOCK;
static constexpr int INT4_WEIGHT_WORDS_PER_TILE = INT4_TILE_COLS;
static constexpr int INT4_OUTPUTS_PER_WORD = 16;
static constexpr int INT4_OUTPUT_WORDS_PER_TILE =
    INT4_TILE_ROWS / INT4_OUTPUTS_PER_WORD;

static constexpr int INT4_WEIGHT_SCALE_BITS = 16;
static constexpr int INT4_WEIGHT_SCALES_PER_WORD =
    512 / INT4_WEIGHT_SCALE_BITS;
static constexpr int INT4_SCALE_ROWS_PER_WORD = 16;

// AutoRound W4G128 super-block configuration.  A 512-bit AXI beat is 64
// bytes, so every physical burst is capped at 64 beats (4 KiB): two dense
// scale bursts followed by 64 weight bursts per super-block.
static constexpr int INT4_AUTOROUND_GROUP_SIZE = 128;
static constexpr int INT4_AUTOROUND_GROUPS_PER_TILE =
    INT4_TILE_COLS / INT4_AUTOROUND_GROUP_SIZE; // 2 groups of 128 per tile
static constexpr int INT4_TILES_PER_BLOCK = 16;
static constexpr int INT4_ACTIVE_SCALE_WORDS_PER_TILE = 8;
// Eight 512-bit words hold all 256 Q1.15 scales required by one 128x256
// tile.  The former eight-word pad is intentionally absent so DDR carries
// only scale data consumed by the MAC.
static constexpr int INT4_SCALE_WORDS_PER_TILE =
    INT4_ACTIVE_SCALE_WORDS_PER_TILE;
static constexpr int INT4_SCALE_WORDS_PER_BLOCK =
    INT4_TILES_PER_BLOCK * INT4_SCALE_WORDS_PER_TILE; // 128 words (2 x 64-beat bursts)
static constexpr int INT4_WEIGHT_WORDS_PER_BLOCK =
    INT4_TILES_PER_BLOCK * INT4_WEIGHT_WORDS_PER_TILE; // 4096 words (64 x 64-beat bursts)
static constexpr int INT4_SUPER_BLOCK_WORDS =
    INT4_SCALE_WORDS_PER_BLOCK + INT4_WEIGHT_WORDS_PER_BLOCK; // 4224 words (66 bursts)
// Two complete AXI bursts decouple the m_axi response path from the splitter.
// The m_axi adapter separately tracks the configured outstanding requests.
static constexpr int INT4_MODEL_WORD_STREAM_DEPTH = 128;

// Weight scale is stored as Q1.15 signed fixed-point (ap_int<16>).
// Value = raw_bits * 2^-15.  Range [-1.0, +1.0), LSB ≈ 3.05e-5.
// Max |scale| observed in LLaMA-2-7B W4G128: 0.21 — well within range.
// Replaces FP16 (ap_uint<16>) so DDR footprint is unchanged.
using int4_weight_scale_t = ap_int<INT4_WEIGHT_SCALE_BITS>;
static constexpr int INT4_WEIGHT_SCALE_FRAC_BITS = 15;  // Q1.15

// Activation scale uses E8M0 Microscaling (QLlama-style):
// 8-bit unsigned biased exponent, no mantissa.
// value = 2^(raw - 127).  Replaces float (FP32).
using int4_act_scale_t = ap_uint<8>;

// Activation mantissa for online quantize (QLlama E8M0 frexp path).
// ap_fixed<14,1>: 1 sign/integer bit + 13 fractional bits.
// frexpf() returns mantissa ∈ [-1,+1) — stored here without FP division.
using int4_act_mantissa_t = ap_fixed<INT4_ACTIVATION_BITS, 1>;

constexpr int int4_round_up_constexpr(int value, int quantum) {
    return ((value + quantum - 1) / quantum) * quantum;
}

// Input-column shards are tile aligned. Hidden size 11008 has 43 tiles, so
// it is padded to 44 tiles (11 per PE); padded lanes are always zero.
static constexpr int INT4_PADDED_DIM =
    int4_round_up_constexpr(INT4_DIM, INT4_PE_COUNT * INT4_TILE_COLS);
static constexpr int INT4_PADDED_HIDDEN_DIM =
    int4_round_up_constexpr(
        INT4_HIDDEN_DIM, INT4_PE_COUNT * INT4_TILE_COLS);
static constexpr int INT4_PADDED_VOCAB_SIZE =
    int4_round_up_constexpr(
        INT4_VOCAB_SIZE, INT4_PE_COUNT * INT4_TILE_ROWS);

static constexpr int INT4_LOCAL_DIM = INT4_PADDED_DIM / INT4_PE_COUNT;
static constexpr int INT4_LOCAL_HIDDEN_DIM =
    INT4_PADDED_HIDDEN_DIM / INT4_PE_COUNT;
static constexpr int INT4_LOCAL_VOCAB_SIZE =
    INT4_PADDED_VOCAB_SIZE / INT4_PE_COUNT;
static constexpr int INT4_VECTOR_WORDS_PER_PE =
    INT4_LOCAL_DIM / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_HIDDEN_WORDS_PER_PE =
    INT4_LOCAL_HIDDEN_DIM / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_LOGIT_WORDS_PER_PE =
    INT4_LOCAL_VOCAB_SIZE / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_LOCAL_GROUPS_DIM =
    INT4_LOCAL_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_LOCAL_GROUPS_HIDDEN =
    INT4_LOCAL_HIDDEN_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_MAX_LOCAL_GROUPS = INT4_LOCAL_GROUPS_HIDDEN;
static constexpr int INT4_MAX_LOCAL_OUTPUT_WORDS = INT4_LOGIT_WORDS_PER_PE;

// One full-debug build captures every important layer-zero boundary in the
// same trace BO.  Each packed-activation region stores one 448-bit INT14/G32
// word in a 512-bit trace word, followed by packed E8M0 scale bytes.  This
// deliberately trades debug-only DDR traffic for avoiding repeated XCLBIN
// rebuilds while narrowing hardware/software divergence.
static constexpr int INT4_TRACE_SCALE_BYTES_PER_WORD = 64;
static constexpr int INT4_TRACE_DIM_SCALE_WORDS =
    (INT4_LOCAL_GROUPS_DIM + INT4_TRACE_SCALE_BYTES_PER_WORD - 1) /
    INT4_TRACE_SCALE_BYTES_PER_WORD;
static constexpr int INT4_TRACE_HIDDEN_SCALE_WORDS =
    (INT4_LOCAL_GROUPS_HIDDEN + INT4_TRACE_SCALE_BYTES_PER_WORD - 1) /
    INT4_TRACE_SCALE_BYTES_PER_WORD;
static constexpr int INT4_TRACE_QSCALE_DIM_WORDS =
    INT4_LOCAL_GROUPS_DIM + INT4_TRACE_DIM_SCALE_WORDS;
static constexpr int INT4_TRACE_QSCALE_HIDDEN_WORDS =
    INT4_LOCAL_GROUPS_HIDDEN + INT4_TRACE_HIDDEN_SCALE_WORDS;

static constexpr int INT4_LAYER_TRACE_RESIDUAL_WORDS_PER_PE =
    INT4_LAYER_TRACE_CHECKPOINTS * INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_BASE_WORD =
    INT4_LAYER_TRACE_RESIDUAL_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_ATTN_RMS_WORD = 0;
static constexpr int INT4_STAGE_TRACE_Q_WORD =
    INT4_STAGE_TRACE_ATTN_RMS_WORD + INT4_TRACE_QSCALE_DIM_WORDS;
static constexpr int INT4_STAGE_TRACE_K_WORD =
    INT4_STAGE_TRACE_Q_WORD + INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_V_WORD =
    INT4_STAGE_TRACE_K_WORD + INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_ATTN_QSCALE_WORD =
    INT4_STAGE_TRACE_V_WORD + INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_O_WORD =
    INT4_STAGE_TRACE_ATTN_QSCALE_WORD + INT4_TRACE_QSCALE_DIM_WORDS;
static constexpr int INT4_STAGE_TRACE_FFN_RMS_WORD =
    INT4_STAGE_TRACE_O_WORD + INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_GATE_WORD =
    INT4_STAGE_TRACE_FFN_RMS_WORD + INT4_TRACE_QSCALE_DIM_WORDS;
static constexpr int INT4_STAGE_TRACE_UP_WORD =
    INT4_STAGE_TRACE_GATE_WORD + INT4_HIDDEN_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_SWIGLU_WORD =
    INT4_STAGE_TRACE_UP_WORD + INT4_HIDDEN_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_DOWN_WORD =
    INT4_STAGE_TRACE_SWIGLU_WORD + INT4_TRACE_QSCALE_HIDDEN_WORDS;
// Deep layer-0 Q diagnostics.  The normal stage trace only exposes the
// quantized RMS input and the fully reduced Q output, which cannot distinguish
// a local MAC/scale error from an AXI-Stream reduction error.  The regions
// below retain every PE-local Q partial plus a group-by-group audit trail for
// output rows 0..3 (the first final Q mismatch always includes row zero).
static constexpr int INT4_Q_DEEP_ROWS = INT4_REDUCTION_LANES;
static constexpr int INT4_Q_DEEP_VALUES =
    INT4_LOCAL_GROUPS_DIM * INT4_Q_DEEP_ROWS;
static constexpr int INT4_Q_DEEP_WORDS =
    INT4_Q_DEEP_VALUES / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_Q_LOCAL_PARTIAL_PACKETS =
    INT4_DIM / INT4_REDUCTION_LANES;
static constexpr int INT4_Q_LOCAL_PARTIAL_WORDS =
    INT4_DIM / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD =
    INT4_STAGE_TRACE_DOWN_WORD + INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_STAGE_TRACE_Q_GROUP_DOT_WORD =
    INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD +
    INT4_Q_LOCAL_PARTIAL_WORDS;
static constexpr int INT4_STAGE_TRACE_Q_WEIGHT_SCALE_WORD =
    INT4_STAGE_TRACE_Q_GROUP_DOT_WORD + INT4_Q_DEEP_WORDS;
static constexpr int INT4_STAGE_TRACE_Q_CUMULATIVE_WORD =
    INT4_STAGE_TRACE_Q_WEIGHT_SCALE_WORD + INT4_Q_DEEP_WORDS;
static constexpr int INT4_STAGE_TRACE_Q_ACTIVATION_WORD =
    INT4_STAGE_TRACE_Q_CUMULATIVE_WORD + INT4_Q_DEEP_WORDS;
static constexpr int INT4_STAGE_TRACE_Q_WEIGHT_WORD =
    INT4_STAGE_TRACE_Q_ACTIVATION_WORD + INT4_LOCAL_GROUPS_DIM;
static constexpr int INT4_STAGE_TRACE_WORDS_PER_PE =
    INT4_STAGE_TRACE_Q_WEIGHT_WORD + INT4_LOCAL_GROUPS_DIM;
static constexpr int INT4_LAYER_TRACE_WORDS_PER_PE =
    INT4_LAYER_TRACE_RESIDUAL_WORDS_PER_PE +
    INT4_STAGE_TRACE_WORDS_PER_PE;

static_assert(INT4_Q_DEEP_WORDS == 8,
              "four Q rows across 32 local groups must occupy eight words");
static_assert(INT4_Q_LOCAL_PARTIAL_WORDS == 256,
              "one complete PE-local Q partial must occupy 256 words");
static_assert(INT4_STAGE_TRACE_WORDS_PER_PE == 1205,
              "layer-zero full-stage trace layout changed unexpectedly");
static_assert(INT4_LAYER_TRACE_WORDS_PER_PE == 5365,
              "combined residual/stage trace layout changed unexpectedly");

static_assert(INT4_LOCAL_DIM == 1024,
              "four SLRs must own 1024 model channels each");
static_assert(INT4_LOCAL_HIDDEN_DIM == 2816,
              "the padded FFN shard must contain eleven 256-column tiles");
static_assert(INT4_LOCAL_VOCAB_SIZE == 8064,
              "the padded vocabulary shard must contain 63 row tiles");
static_assert(INT4_QUANT_WORD_BITS == INT4_GROUP_SIZE * INT4_ACTIVATION_BITS,
              "one activation word must contain one complete G32 group");
static_assert((1LL << (INT4_PACK_SHIFT - 1)) >
                  1LL * INT4_GROUP_SIZE * INT4_ACTIVATION_MAX * 8,
              "signed G32 lane does not fit below the pack shift");
static_assert((1LL << 26) >=
                  8LL * (1LL << INT4_PACK_SHIFT) + 8,
              "packed signed INT4 weights do not fit in port A");
// Verify group_acc_t (23-bit) holds the worst-case partial sum before the
// combined-scale multiply: max = GROUP_SIZE * ACTIVATION_MAX * max_w4 = 32*8191*7 = 1,834,784 < 2^21.
// High half of packed_acc is bits[45:22], which is 24 raw bits; the
// ap_int<23> sign-extends correctly since actual values are < 2^21.
static_assert(1LL * INT4_GROUP_SIZE * INT4_ACTIVATION_MAX * 7 < (1LL << 22),
              "int4_group_acc_t (23-bit) is too narrow for worst-case G32 sum");

enum Int4LinearMode {
    INT4_LINEAR_Q = 0,
    INT4_LINEAR_K = 1,
    INT4_LINEAR_V = 2,
    INT4_LINEAR_O = 3,
    INT4_LINEAR_GATE = 4,
    INT4_LINEAR_UP = 5,
    INT4_LINEAR_DOWN = 6,
    INT4_LINEAR_LOGITS = 7
};

enum Int4RmsNormMode {
    INT4_RMSNORM_ATTENTION = 0,
    INT4_RMSNORM_FFN = 1,
    INT4_RMSNORM_FINAL = 2
};

struct Int4LinearShape {
    int valid_output_rows;
    int padded_output_rows;
    int valid_input_cols;
    int padded_input_cols;
    int output_tiles;
    int local_input_tiles;
    int local_output_tiles;
};
