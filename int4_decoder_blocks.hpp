#pragma once

#include <hls_stream.h>

#include "int4_linear_controller.hpp"

#include <ap_fixed.h>

// Shared fixed-point format used at the nonlinear/attention boundary.
// Q15.17 follows SwiftKV's 32-bit attention datapath while keeping a
// substantially wider range than the quantized A15 GEMV activation.
using int4_fxp32_t =
    ap_fixed<32, 15, AP_RND_CONV, AP_SAT>;

static constexpr int INT4_VECTOR_WORDS_PER_PE =
    (INT4_DIM / INT4_PE_COUNT) / INT4_OUTPUTS_PER_WORD;
static constexpr int INT4_GROUPS_PER_VECTOR =
    INT4_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_VECTOR_SCALE_WORDS =
    INT4_GROUPS_PER_VECTOR / INT4_SCALE_ROWS_PER_WORD;
static constexpr int INT4_HIDDEN_GROUPS =
    INT4_HIDDEN_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_HIDDEN_SCALE_WORDS =
    (INT4_HIDDEN_GROUPS + INT4_SCALE_ROWS_PER_WORD - 1) /
    INT4_SCALE_ROWS_PER_WORD;

static_assert(
    (INT4_DIM % (INT4_PE_COUNT * INT4_TILE_ROWS)) == 0,
    "row-striped RMSNorm assumes equal 128-row tiles per PE");
static_assert(
    INT4_GROUP_SIZE ==
        2 * INT4_OUTPUTS_PER_WORD,
    "one G32 activation must be exactly two 512-bit FP32 words");

// Fixed-shape RMSNorm + A15/G32 quantizer.
//
// input_peN and gamma_peN use the same row-tile striping as the linear
// engine's output:
//   global 128-row tile t -> PE (t % 4), local tile (t / 4).
//
// activation_q and activation_scale are emitted in global G32 order so the
// linear controller can load one copy and broadcast it to all four PEs.
// No dimension or tile-count argument is supplied at runtime.
void int4_rmsnorm_quantize_4pe(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    Int4Controller& controller
);

// Integrated controller path: produce global A15/G32 groups as streams so
// the first linear projection can start before the full normalized vector is
// materialized.  When run is false the process is idle; this lets one
// optional-RMS DATAFLOW wrapper serve every linear state.
void int4_rmsnorm_quantize_stream_4pe(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    bool run,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
);

// Integrated pair-local producer.  Each output contains only the groups
// owned by its adjacent PE pair; the controller exchanges the two halves
// once and assembles one full ordered activation stream inside each pair.
void int4_rmsnorm_quantize_pair_halves_4pe(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    bool run,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
);

// In-place residual add for O projection and FFN-down outputs.  Both operands
// use the same row-striped four-bank layout.  The controller selects which
// successor is enabled, including layer advance and final RMSNorm.
void int4_residual_add_4pe(
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    const int4_output_word_t* branch_pe0,
    const int4_output_word_t* branch_pe1,
    const int4_output_word_t* branch_pe2,
    const int4_output_word_t* branch_pe3,
    Int4Controller& controller
);

// SiLU(gate) * up followed immediately by A15/G32 quantization for the DOWN
// projection.  Gate/up use the linear engine's uneven 86-tile row striping;
// output is gathered to one global activation stream.
void int4_swiglu_quantize_4pe(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    Int4Controller& controller
);

// Streaming integrated path used by the fused SwiGLU -> DOWN state.  Groups
// are emitted in global hidden-dimension order and are also materialized by
// the linear broadcaster for any subsequent replay.
void int4_swiglu_quantize_stream_4pe(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    bool run,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
);

void int4_swiglu_quantize_pair_halves_4pe(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    bool run,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
);
