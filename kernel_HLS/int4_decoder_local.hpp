#pragma once

#include "int4_types.hpp"

#include <hls_stream.h>

// Public boundary between the PE-local decoder datapath and either control
// plane: the original monolithic kernel or the four-CU AXI-Stream design.
// Keeping this boundary free of global commands is the key locality invariant.
using int4_position_command_t = ap_uint<12>;

#ifdef INT4_ENABLE_LAYER_TRACE
#define INT4_LOCAL_TRACE_DECL                                         \
    , int4_output_word_t* layer_trace                                 \
    , ap_uint<6> trace_layer                                          \
    , ap_uint<3> trace_mode
#else
#define INT4_LOCAL_TRACE_DECL
#endif

#define INT4_DECLARE_LOCAL_DECODER_PE(PE)                              \
void int4_decoder_local_pe_##PE(                                      \
    const int4_weight_word_t* model_bank,                             \
    const int4_output_word_t* rope_lut,                               \
    int4_output_word_t* external_residual,                            \
    int4_output_word_t* logits,                                       \
    int4_output_word_t* kv_cache INT4_LOCAL_TRACE_DECL,               \
    hls::stream<int4_position_command_t>& position_stream,            \
    hls::stream<float>& rms_partial,                                  \
    hls::stream<float>& rms_reciprocal,                               \
    hls::stream<int4_reduction_packet_t>& linear_partial,             \
    hls::stream<int4_reduction_packet_t>& linear_completed)

INT4_DECLARE_LOCAL_DECODER_PE(0);
INT4_DECLARE_LOCAL_DECODER_PE(1);
INT4_DECLARE_LOCAL_DECODER_PE(2);
INT4_DECLARE_LOCAL_DECODER_PE(3);

#undef INT4_DECLARE_LOCAL_DECODER_PE
#undef INT4_LOCAL_TRACE_DECL
