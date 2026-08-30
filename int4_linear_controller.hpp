#pragma once

#include <ap_int.h>
#include <hls_stream.h>

// Four-SLR SwiftKV-style tensor-parallel linear engine.
//
// Architectural invariant:
//   * PE n owns DDR n and only the local input-column shard.
//   * Every PE computes a partial value for the same output rows.
//   * Only 128-bit registered partial-result streams leave a PE.
//   * Reduction scatters each completed output shard directly to its owner;
//     an activation is never broadcast back across all SLRs.

using int4_weight_word_t = ap_uint<512>;
using int4_weight_scale_word_t = ap_uint<512>;
using int4_scale_word_t = ap_uint<512>;
using int4_output_word_t = ap_uint<512>;

static constexpr int INT4_ACTIVATION_BITS = 15;
static constexpr int INT4_QUANT_WORD_BITS = 480;
using int4_quant_word_t = ap_uint<INT4_QUANT_WORD_BITS>;
using int4_activation_t = ap_int<INT4_ACTIVATION_BITS>;
using int4_weight_t = ap_int<4>;
using int4_group_acc_t = ap_int<23>;
using int4_packed_acc_t = ap_int<46>;
using int4_output_value_t = ap_uint<32>;

// Four FP32 partials form the only wide inter-SLR data interface.
static constexpr int INT4_REDUCTION_LANES = 4;
static constexpr int INT4_REDUCTION_PACKET_BITS =
    INT4_REDUCTION_LANES * 32;
using int4_reduction_packet_t = ap_uint<INT4_REDUCTION_PACKET_BITS>;

static constexpr int INT4_DIM = 4096;
static constexpr int INT4_KV_DIM = 4096;
static constexpr int INT4_HIDDEN_DIM = 11008;
static constexpr int INT4_VOCAB_SIZE = 32000;
static constexpr int INT4_NUM_LAYERS = 32;

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

static_assert(INT4_LOCAL_DIM == 1024,
              "four SLRs must own 1024 model channels each");
static_assert(INT4_LOCAL_HIDDEN_DIM == 2816,
              "the padded FFN shard must contain eleven 256-column tiles");
static_assert(INT4_LOCAL_VOCAB_SIZE == 8064,
              "the padded vocabulary shard must contain 63 row tiles");
static_assert(INT4_QUANT_WORD_BITS == INT4_GROUP_SIZE * INT4_ACTIVATION_BITS,
              "one activation word must contain one complete G32 group");
static_assert((1LL << 22) >
                  1LL * INT4_GROUP_SIZE * 16383 * 7,
              "signed G32 accumulator is too narrow");

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

Int4LinearShape int4_linear_shape(int mode);
int int4_mode_valid_output_rows(int mode);
int int4_mode_padded_output_rows(int mode);
int int4_mode_valid_input_cols(int mode);
int int4_mode_padded_input_cols(int mode);
int int4_mode_output_tiles(int mode);
int int4_mode_local_input_tiles(int mode);
int int4_mode_local_output_tiles(int mode);
int int4_mode_local_groups(int mode);
bool int4_mode_output_is_fxp(int mode);

// One call site serves Q/K/V/O/GATE/UP/DOWN/LOGITS. HLS therefore creates
// one reusable GEMV pipeline per PE, not one copy per projection. Weight
// order inside every DDR bank is:
//   [global output tile][local input-column tile][256 packed weight words].
// The scale array uses the same tile order with 32 FP16 scales per word.
void int4_sharded_linear_4pe(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    const int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale3[INT4_MAX_LOCAL_GROUPS],
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    ap_uint<3> mode,
    ap_uint<24> weight_word_offset,
    ap_uint<16> weight_scale_word_offset
);
