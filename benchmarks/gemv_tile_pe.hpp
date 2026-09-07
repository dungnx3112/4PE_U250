#pragma once

#include <ap_int.h>

// A15 activations and symmetric INT4 weights.  The packed arithmetic relies
// on the quantizer never emitting -8; valid weight values are [-7, 7].
using gemv_act_t = ap_int<15>;
using gemv_w4_t = ap_int<4>;
using gemv_weight_word_t = ap_uint<512>;
using gemv_activation_word_t = ap_uint<512>;
using gemv_output_word_t = ap_uint<512>;
using gemv_partial_t = ap_int<30>;
using gemv_float_word_t = ap_uint<512>;
using gemv_packed_acc_t = ap_int<46>;
using gemv_group_acc_t = ap_int<23>;

static constexpr int GEMV_TILE_ROWS = 128;
static constexpr int GEMV_TILE_COLS = 256;
static constexpr int GEMV_ROW_PAIRS = GEMV_TILE_ROWS / 2;
static constexpr int GEMV_PACK_CHUNK = 32;
static constexpr int GEMV_CHUNKS_PER_TILE =
    GEMV_TILE_COLS / GEMV_PACK_CHUNK;
static constexpr int GEMV_ACTS_PER_WORD = 32;  // 32 x signed 16-bit storage
static constexpr int GEMV_ACT_WORDS_PER_TILE =
    GEMV_TILE_COLS / GEMV_ACTS_PER_WORD;
static constexpr int GEMV_OUTPUTS_PER_WORD = 16;  // 16 x signed 32-bit
static constexpr int GEMV_OUTPUT_WORDS_PER_TILE =
    GEMV_TILE_ROWS / GEMV_OUTPUTS_PER_WORD;
static constexpr int GEMV_FLOATS_PER_WORD = 16;
static constexpr int GEMV_GROUP_ACC_BITS = 23;
static constexpr int GEMV_QUANT_ACT_BITS = 15;
static constexpr int GEMV_QUANT_LANES = 4;
static constexpr int GEMV_DEQUANT_LANES = 4;
static constexpr int GEMV_QUANT_ACT_WORD_BITS =
    GEMV_PACK_CHUNK * GEMV_QUANT_ACT_BITS;
using gemv_quant_activation_word_t =
    ap_uint<GEMV_QUANT_ACT_WORD_BITS>;
static constexpr int GEMV_GROUP_BLOCK_ROWS = GEMV_DEQUANT_LANES;
static constexpr int GEMV_GROUP_BLOCK_BITS =
    GEMV_GROUP_BLOCK_ROWS * GEMV_GROUP_ACC_BITS;
static constexpr int GEMV_GROUP_BLOCKS =
    GEMV_TILE_ROWS / GEMV_GROUP_BLOCK_ROWS;
static constexpr int GEMV_PAIRS_PER_QUAD =
    GEMV_GROUP_BLOCK_ROWS / 2;
using gemv_group_block_t = ap_uint<GEMV_GROUP_BLOCK_BITS>;

static constexpr int GEMV_VECTOR_SIZE = 4096;
static constexpr int GEMV_COL_TILES =
    GEMV_VECTOR_SIZE / GEMV_TILE_COLS;
static constexpr int GEMV_MAX_ROW_TILES =
    GEMV_VECTOR_SIZE / GEMV_TILE_ROWS;
static constexpr int GEMV_ACTIVATION_WORDS =
    GEMV_VECTOR_SIZE / GEMV_ACTS_PER_WORD;
static constexpr int GEMV_ACTIVATION_FP_WORDS =
    GEMV_VECTOR_SIZE / GEMV_FLOATS_PER_WORD;
static constexpr int GEMV_ACTIVATION_GROUPS =
    GEMV_VECTOR_SIZE / GEMV_PACK_CHUNK;
static constexpr int GEMV_MAX_WEIGHT_TILES =
    GEMV_MAX_ROW_TILES * GEMV_COL_TILES;
static constexpr int GEMV_MAX_WEIGHT_WORDS =
    GEMV_MAX_WEIGHT_TILES * GEMV_TILE_COLS;
static constexpr int GEMV_WEIGHT_SCALE_WORDS =
    GEMV_MAX_WEIGHT_TILES / GEMV_FLOATS_PER_WORD;
static constexpr int GEMV_MAX_OUTPUT_WORDS =
    GEMV_MAX_ROW_TILES * GEMV_OUTPUT_WORDS_PER_TILE;

// Compute-only top for one 128x256 tile.  Inputs and outputs are already
// packed into 512-bit local-memory words.
void gemv_tile_128x256(
    const gemv_weight_word_t weight_tile[GEMV_TILE_COLS],
    const gemv_activation_word_t activation_tile[GEMV_ACT_WORDS_PER_TILE],
    gemv_output_word_t output_tile[GEMV_OUTPUT_WORDS_PER_TILE]
);

// One-PE MVM top.  A persistent DDR reader and a two-tile-deep stream FIFO
// overlap weight traffic with the single compute instance.  Weight layout is:
//   weight_mem[row_tile][col_tile][k][row_pair]
// with row_pair packed as one byte (even row in bits 7:4, odd row in 3:0).
//
// All three pointers use one 512-bit AXI master, modelling one U250 DDR bank.
// row_tiles=1 computes 128x4096; row_tiles=32 computes 4096x4096.
void gemv_pe_1ddr(
    const gemv_weight_word_t* weight_mem,
    const gemv_activation_word_t* activation_mem,
    gemv_output_word_t* output_mem,
    int row_tiles
);

// Quantized one-PE top:
//   normalized FP32 activation -> online symmetric A15 quantization (G32)
//   -> packed A15 x INT4 MAC -> fused FP32 dequantization.
//
// weight_scale_mem stores one FP32 scale per 128x256 weight tile.  One
// 512-bit scale word corresponds to all 16 column tiles of one row tile.
// output_mem stores 16 FP32 results per 512-bit word.
void gemv_pe_1ddr_quantized(
    const gemv_weight_word_t* weight_mem,
    const gemv_float_word_t* activation_fp_mem,
    const gemv_float_word_t* weight_scale_mem,
    gemv_float_word_t* output_mem,
    int row_tiles
);
