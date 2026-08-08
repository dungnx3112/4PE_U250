#pragma once

#include <ap_int.h>
#include <hls_stream.h>

// Controller-driven INT4 linear engine for the fixed Llama2-7B shapes used by
// the decoder.  Matrix dimensions are selected from Int4LinearMode; they are
// never supplied as runtime n/m/row_tiles arguments by the host.

using int4_weight_word_t = ap_uint<512>;
using int4_weight_scale_word_t = ap_uint<512>;
using int4_scale_word_t = ap_uint<512>;
using int4_output_word_t = ap_uint<512>;
using int4_quant_word_t = ap_uint<480>;
static constexpr int INT4_ACTIVATION_BITS = 15;
static constexpr int INT4_PACKED_WEIGHT_BITS = 27;
using int4_activation_t = ap_int<INT4_ACTIVATION_BITS>;
using int4_weight_t = ap_int<4>;
using int4_group_acc_t = ap_int<23>;
using int4_packed_product_t =
    ap_int<INT4_PACKED_WEIGHT_BITS + INT4_ACTIVATION_BITS>;
using int4_packed_acc_t = ap_int<46>;
using int4_group_block_t = ap_uint<92>;

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
static constexpr int INT4_ROW_BLOCK = 4;
static constexpr int INT4_ROW_BLOCKS =
    INT4_TILE_ROWS / INT4_ROW_BLOCK;
// Weight quantization is performed offline per complete 128x256 tile.  One
// FP16 scale belongs to one tile; 32 scales are packed in a 512-bit DDR word.
// Activation scales remain FP32/G32 and continue to use int4_scale_word_t.
static constexpr int INT4_WEIGHT_SCALE_BITS = 16;
static constexpr int INT4_WEIGHT_SCALES_PER_WORD =
    512 / INT4_WEIGHT_SCALE_BITS;
static constexpr int INT4_SCALE_ROWS_PER_WORD = 16;
static constexpr int INT4_WEIGHT_WORDS_PER_TILE = INT4_TILE_COLS;
static constexpr int INT4_OUTPUTS_PER_WORD = 16;
static constexpr int INT4_OUTPUT_WORDS_PER_TILE =
    INT4_TILE_ROWS / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_MAX_INPUT_GROUPS =
    INT4_HIDDEN_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_MAX_OUTPUT_TILES =
    (INT4_VOCAB_SIZE + INT4_TILE_ROWS - 1) / INT4_TILE_ROWS;
static constexpr int INT4_MAX_LOCAL_TILES =
    (INT4_MAX_OUTPUT_TILES + INT4_PE_COUNT - 1) / INT4_PE_COUNT;
static constexpr int INT4_MAX_LOCAL_OUTPUT_WORDS =
    INT4_MAX_LOCAL_TILES * INT4_OUTPUT_WORDS_PER_TILE;
static constexpr int INT4_MAX_INPUT_TILES =
    INT4_HIDDEN_DIM / INT4_TILE_COLS;
// The largest supported matrix on one PE is the padded LM head:
// 63 local row tiles x 16 input tiles.
static constexpr int INT4_MAX_LOCAL_MATRIX_TILES =
    INT4_MAX_LOCAL_TILES * (INT4_DIM / INT4_TILE_COLS);
static constexpr int INT4_MAX_LOCAL_WEIGHT_WORDS =
    INT4_MAX_LOCAL_MATRIX_TILES *
    INT4_WEIGHT_WORDS_PER_TILE;
static constexpr int INT4_MAX_LOCAL_SCALE_WORDS =
    (INT4_MAX_LOCAL_MATRIX_TILES +
     INT4_WEIGHT_SCALES_PER_WORD - 1) /
    INT4_WEIGHT_SCALES_PER_WORD;
static constexpr int INT4_MAX_ACTIVATION_SCALE_WORDS =
    (INT4_MAX_INPUT_GROUPS + INT4_OUTPUTS_PER_WORD - 1) /
    INT4_OUTPUTS_PER_WORD;

static_assert((INT4_DIM % INT4_TILE_COLS) == 0,
              "dim must be tiled exactly by INT4_TILE_COLS");
static_assert((INT4_HIDDEN_DIM % INT4_TILE_COLS) == 0,
              "hidden_dim must be tiled exactly by INT4_TILE_COLS");
static_assert((INT4_VOCAB_SIZE % INT4_TILE_ROWS) == 0,
              "vocab_size must be tiled exactly by INT4_TILE_ROWS");
static_assert(INT4_ROW_BLOCK == 4,
              "group block packing is specialized for four rows");
static_assert((1LL << 22) >
                  1LL * INT4_GROUP_SIZE * 16383 * 7,
              "signed G32 accumulator is too narrow");
static_assert(
              INT4_PACKED_WEIGHT_BITS <= 27 &&
                  INT4_ACTIVATION_BITS <= 18,
              "packed W4x2 by A15 must fit one DSP48E2 27x18 multiplier");

enum Int4RunState {
    INT4_LAZY = 0,
    INT4_RUN = 1
};

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

enum Int4AccumulateMode {
    INT4_ACCUMULATE_ATTENTION = 0,
    INT4_ACCUMULATE_FFN = 1
};

enum Int4RmsNormMode {
    INT4_RMSNORM_ATTENTION = 0,
    INT4_RMSNORM_FFN = 1,
    INT4_RMSNORM_FINAL = 2
};

struct Int4Controller {
    ap_uint<1> run_rmsnorm;
    ap_uint<2> rmsnorm_mode;
    ap_uint<1> run_linear;
    ap_uint<4> linear_mode;
    ap_uint<1> run_rope;
    ap_uint<1> run_attention;
    ap_uint<1> run_accumulate;
    ap_uint<1> accumulate_mode;
    ap_uint<1> run_swiglu;
    ap_uint<6> layer_index;
    ap_uint<12> position;
    // Model payload is laid out in exactly the controller execution order.
    // Carry the current offsets as FSM state instead of rebuilding
    // layer*stride independently for all four identical DDR banks.
    ap_uint<24> weight_word_offset;
    ap_uint<11> weight_scale_word_offset;
    ap_uint<1> exit;

    Int4Controller()
        : run_rmsnorm(INT4_LAZY),
          rmsnorm_mode(INT4_RMSNORM_ATTENTION),
          run_linear(INT4_LAZY),
          linear_mode(INT4_LINEAR_Q),
          run_rope(INT4_LAZY),
          run_attention(INT4_LAZY),
          run_accumulate(INT4_LAZY),
          accumulate_mode(INT4_ACCUMULATE_ATTENTION),
          run_swiglu(INT4_LAZY),
          layer_index(0),
          position(0),
          weight_word_offset(0),
          weight_scale_word_offset(0),
          exit(INT4_LAZY) {}
};

struct Int4LinearShape {
    int output_rows;
    int input_cols;
    int output_tiles;
    int input_tiles;
};

Int4LinearShape int4_linear_shape_from_controller(
    const Int4Controller& controller
);

int int4_local_tile_count(int output_tiles, int pe_id);

// Per-PE DDR layout for the currently selected matrix:
//
//   weight_mem[local_row_tile][col_tile][group][row_block]
//   scale_mem [ceil(local_row_tile * col_tile / 32)]
//
// Each weight word contains four output rows by 32 input columns:
//   2 packed row pairs x 32 INT4 pairs = 512 bits.
// Each scale word contains 32 FP16 values.  A single FP16 value scales the
// complete 128x256 weight tile, so scale traffic is negligible and the 256
// weight words of every tile form one full AXI burst.
//
// Global output row tile t belongs to PE (t % 4), local tile (t / 4).
// output_peN stores its local tiles contiguously, sixteen 32-bit lanes/word:
// Q/K/V lanes are raw Q15.17 for SwiftKV; all other modes are FP32.
void int4_linear_4pe(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    const int4_quant_word_t* activation_q,
    const int4_scale_word_t* activation_scale,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    Int4Controller& controller
);

// Integrated controller entry: optionally fuses the preceding RMSNorm into
// the activation broadcaster.  Only one copy of the four linear PEs is used
// for both the fused first projection and all subsequent projections.
void int4_linear_4pe_optional_rms(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    bool fuse_rms,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    Int4Controller& controller
);

// Single shared linear-engine entry for controller-level producer fusion.
// If stream_activation is true, the first local output tile consumes groups
// from the producer streams while filling the on-chip A15/scale replay RAMs.
void int4_linear_4pe_from_stream(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    Int4Controller& controller
);
