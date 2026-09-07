#pragma once

#include "int4_types.hpp"

#include <hls_stream.h>

// Four-SLR SwiftKV-style tensor-parallel linear engine.
//
// Architectural invariant:
//   * PE n owns DDR n and only the local input-column shard.
//   * Every PE computes a partial value for the same output rows.
//   * Only 128-bit registered partial-result streams leave a PE.
//   * Reduction scatters each completed output shard directly to its owner;
//     an activation is never broadcast back across all SLRs.

// Legacy four-PE dispatcher retained only for standalone experiments.  The
// production decoder uses the local PE stages and pair services below.
#ifdef INT4_ENABLE_LEGACY_GLOBAL_API
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
#endif

// Local linear stages. Each function owns exactly one PE's DDR reader,
// command register, MAC pipeline and projection writer. The only data leaving
// the hierarchy is a 128-bit partial stream; the completed 128-bit stream
// returns directly to the same PE.
#define INT4_DECLARE_LOCAL_LINEAR_STAGE(PE)                             \
void int4_linear_local_stage_pe##PE(                                   \
    const int4_weight_word_t* weight_mem,                              \
    const int4_weight_scale_word_t* scale_mem,                         \
    const int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],       \
    const float activation_scale[INT4_MAX_LOCAL_GROUPS],               \
    int4_output_word_t output_mem[INT4_MAX_LOCAL_OUTPUT_WORDS],        \
    ap_uint<3> mode,                                                   \
    ap_uint<24> weight_word_offset,                                    \
    ap_uint<16> weight_scale_word_offset,                              \
    hls::stream<int4_reduction_packet_t>& partial_stream,              \
    hls::stream<int4_reduction_packet_t>& completed_stream)

INT4_DECLARE_LOCAL_LINEAR_STAGE(0);
INT4_DECLARE_LOCAL_LINEAR_STAGE(1);
INT4_DECLARE_LOCAL_LINEAR_STAGE(2);
INT4_DECLARE_LOCAL_LINEAR_STAGE(3);

#undef INT4_DECLARE_LOCAL_LINEAR_STAGE

// Long-lived pair services walk the fixed decoder schedule locally. They do
// not receive a global mode/state signal. Only the pair sums cross the central
// SLR boundary.
void int4_linear_reduce_pair01_schedule(
    hls::stream<int4_reduction_packet_t>& partial0,
    hls::stream<int4_reduction_packet_t>& partial1,
    hls::stream<int4_reduction_packet_t>& local_sum,
    hls::stream<int4_reduction_packet_t>& remote_sum);

void int4_linear_reduce_pair23_schedule(
    hls::stream<int4_reduction_packet_t>& partial2,
    hls::stream<int4_reduction_packet_t>& partial3,
    hls::stream<int4_reduction_packet_t>& local_sum,
    hls::stream<int4_reduction_packet_t>& remote_sum);

void int4_linear_finalize_pair01_schedule(
    hls::stream<int4_reduction_packet_t>& local_sum,
    hls::stream<int4_reduction_packet_t>& remote_sum,
    hls::stream<int4_reduction_packet_t>& output0,
    hls::stream<int4_reduction_packet_t>& output1);

void int4_linear_finalize_pair23_schedule(
    hls::stream<int4_reduction_packet_t>& local_sum,
    hls::stream<int4_reduction_packet_t>& remote_sum,
    hls::stream<int4_reduction_packet_t>& output2,
    hls::stream<int4_reduction_packet_t>& output3);
