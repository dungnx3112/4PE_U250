#pragma once

#include "int4_types.hpp"

#include <hls_stream.h>

// Four independently controlled decoder compute units. Each CU owns one DDR
// bank and exchanges only RMS scalars and 128-bit linear-reduction packets
// with its immediate physical neighbour.

#ifdef INT4_ENABLE_LAYER_TRACE
#define INT4_KERNEL_TRACE_DECL , int4_output_word_t* layer_trace
#else
#define INT4_KERNEL_TRACE_DECL
#endif

extern "C" void int4_decoder_pe0_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache INT4_KERNEL_TRACE_DECL,
    hls::stream<float>& rms_partial_to_pe1,
    hls::stream<float>& rms_reciprocal_from_pe1,
    hls::stream<int4_reduction_packet_t>& linear_partial_to_pe1,
    hls::stream<int4_reduction_packet_t>& linear_output_from_pe1);

extern "C" void int4_decoder_pe1_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache INT4_KERNEL_TRACE_DECL,
    hls::stream<float>& rms_partial_from_pe0,
    hls::stream<float>& rms_reciprocal_to_pe0,
    hls::stream<float>& rms_sum_from_pe2,
    hls::stream<float>& rms_reciprocal_to_pe2,
    hls::stream<int4_reduction_packet_t>& linear_partial_from_pe0,
    hls::stream<int4_reduction_packet_t>& linear_output_to_pe0,
    hls::stream<int4_reduction_packet_t>& linear_sum_from_pe2,
    hls::stream<int4_reduction_packet_t>& linear_sum_to_pe2);

extern "C" void int4_decoder_pe2_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache INT4_KERNEL_TRACE_DECL,
    hls::stream<float>& rms_reciprocal_from_pe1,
    hls::stream<float>& rms_sum_to_pe1,
    hls::stream<float>& rms_partial_from_pe3,
    hls::stream<float>& rms_reciprocal_to_pe3,
    hls::stream<int4_reduction_packet_t>& linear_sum_from_pe1,
    hls::stream<int4_reduction_packet_t>& linear_sum_to_pe1,
    hls::stream<int4_reduction_packet_t>& linear_partial_from_pe3,
    hls::stream<int4_reduction_packet_t>& linear_output_to_pe3);

extern "C" void int4_decoder_pe3_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache INT4_KERNEL_TRACE_DECL,
    hls::stream<float>& rms_partial_to_pe2,
    hls::stream<float>& rms_reciprocal_from_pe2,
    hls::stream<int4_reduction_packet_t>& linear_partial_to_pe2,
    hls::stream<int4_reduction_packet_t>& linear_output_from_pe2);

#undef INT4_KERNEL_TRACE_DECL
