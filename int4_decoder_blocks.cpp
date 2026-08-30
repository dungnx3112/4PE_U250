#include "int4_decoder_blocks.hpp"

#include <cstdint>
#include <hls_math.h>
#include <hls_stream.h>

union int4_block_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static float int4_block_bits_to_float(ap_uint<32> bits) {
#pragma HLS INLINE
    int4_block_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<32> int4_block_float_to_bits(float value) {
#pragma HLS INLINE
    int4_block_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static void int4_quantize_g32(
    const float values[INT4_GROUP_SIZE],
    int4_quant_word_t& quantized_word,
    float& output_scale) {
#pragma HLS INLINE off
    ap_uint<32> max_abs_bits = 0;
find_group_max_loop:
    for (int lane = 0; lane < INT4_GROUP_SIZE; ++lane) {
#pragma HLS PIPELINE II=1
        const ap_uint<32> magnitude =
            int4_block_float_to_bits(values[lane]) & 0x7fffffffU;
        if (magnitude > max_abs_bits) {
            max_abs_bits = magnitude;
        }
    }

    const float max_abs = int4_block_bits_to_float(max_abs_bits);
    output_scale =
        max_abs == 0.0f ? 0.0f : max_abs * (1.0f / 16383.0f);
    const float inverse_scale =
        max_abs == 0.0f ? 0.0f : 16383.0f / max_abs;
    quantized_word = 0;
quantize_group_reverse_loop:
    for (int lane = INT4_GROUP_SIZE - 1; lane >= 0; --lane) {
#pragma HLS PIPELINE II=1
        const float scaled = values[lane] * inverse_scale;
        float rounded = scaled >= 0.0f ? scaled + 0.5f : scaled - 0.5f;
        if (rounded > 16383.0f) rounded = 16383.0f;
        if (rounded < -16383.0f) rounded = -16383.0f;
        quantized_word =
            (quantized_word << INT4_ACTIVATION_BITS) |
            (ap_uint<INT4_ACTIVATION_BITS>)(
                ap_int<INT4_ACTIVATION_BITS>)(int)rounded;
    }
}

template <int PE_ID>
static void int4_local_sumsq(
    const int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    hls::stream<float>& partial_stream) {
#pragma HLS INLINE off
    float accumulator0 = 0.0f;
    float accumulator1 = 0.0f;
    float accumulator2 = 0.0f;
    float accumulator3 = 0.0f;

local_sumsq_word_loop:
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
        int4_output_word_t packed = residual[word];
    local_sumsq_block_loop:
        for (int block = 0;
             block < INT4_OUTPUTS_PER_WORD / INT4_REDUCTION_LANES;
             ++block) {
#pragma HLS PIPELINE II=4
            const float value0 = int4_block_bits_to_float(
                packed.range(31, 0));
            const float value1 = int4_block_bits_to_float(
                packed.range(63, 32));
            const float value2 = int4_block_bits_to_float(
                packed.range(95, 64));
            const float value3 = int4_block_bits_to_float(
                packed.range(127, 96));
            accumulator0 += value0 * value0;
            accumulator1 += value1 * value1;
            accumulator2 += value2 * value2;
            accumulator3 += value3 * value3;
            packed >>= 128;
        }
    }
    partial_stream.write(
        (accumulator0 + accumulator1) +
        (accumulator2 + accumulator3));
}

template <int PAIR_ID>
static void int4_merge_rms_pair(
    hls::stream<float>& first,
    hls::stream<float>& second,
    hls::stream<float>& pair_sum) {
#pragma HLS INLINE off
    pair_sum.write(first.read() + second.read());
}

static void int4_finalize_rms_and_seed_chain(
    hls::stream<float>& sum01,
    hls::stream<float>& sum23,
    hls::stream<float>& reciprocal0,
    hls::stream<float>& reciprocal1,
    hls::stream<float>& reciprocal12) {
#pragma HLS INLINE off
    const float total = sum01.read() + sum23.read();
    const float reciprocal = hls::rsqrtf(
        total * (1.0f / (float)INT4_DIM) + 1.0e-5f);
    reciprocal0.write(reciprocal);
    reciprocal1.write(reciprocal);
    reciprocal12.write(reciprocal);
}

template <int PE_ID>
static void int4_relay_rms_reciprocal(
    hls::stream<float>& reciprocal_in,
    hls::stream<float>& reciprocal_local,
    hls::stream<float>& reciprocal_out) {
#pragma HLS INLINE off
    const float reciprocal = reciprocal_in.read();
    reciprocal_local.write(reciprocal);
    reciprocal_out.write(reciprocal);
}

static void int4_terminate_rms_reciprocal(
    hls::stream<float>& reciprocal_in,
    hls::stream<float>& reciprocal3) {
#pragma HLS INLINE off
    reciprocal3.write(reciprocal_in.read());
}

template <int PE_ID>
static void int4_local_rms_normalize_quantize(
    const int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma[INT4_VECTOR_WORDS_PER_PE],
    hls::stream<float>& reciprocal_stream,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS]) {
#pragma HLS INLINE off
    const float reciprocal = reciprocal_stream.read();
    float values[INT4_GROUP_SIZE];
#pragma HLS BIND_STORAGE variable=values type=ram_1p impl=bram latency=1

local_rms_group_loop:
    for (int group = 0; group < INT4_LOCAL_GROUPS_DIM; ++group) {
    local_rms_word_loop:
        for (int word_in_group = 0; word_in_group < 2; ++word_in_group) {
            const int word_index = group * 2 + word_in_group;
            const int4_output_word_t input_word = residual[word_index];
            const int4_output_word_t gamma_word = gamma[word_index];
        local_rms_lane_loop:
            for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS PIPELINE II=1
                const float x = int4_block_bits_to_float(
                    input_word.range(32 * lane + 31, 32 * lane));
                const float weight = int4_block_bits_to_float(
                    gamma_word.range(32 * lane + 31, 32 * lane));
                values[word_in_group * INT4_OUTPUTS_PER_WORD + lane] =
                    (x * reciprocal) * weight;
            }
        }
        int4_quantize_g32(
            values, activation_q[group], activation_scale[group]);
    }
}

void int4_rmsnorm_quantize_shards(
    const int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma3[INT4_VECTOR_WORDS_PER_PE],
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    float activation_scale3[INT4_MAX_LOCAL_GROUPS]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<float> partial0, partial1, partial2, partial3;
    hls::stream<float> sum01, sum23;
    hls::stream<float> reciprocal0, reciprocal1;
    hls::stream<float> reciprocal2, reciprocal3;
    hls::stream<float> reciprocal12, reciprocal23;
#pragma HLS STREAM variable=partial0 depth=2
#pragma HLS STREAM variable=partial1 depth=2
#pragma HLS STREAM variable=partial2 depth=2
#pragma HLS STREAM variable=partial3 depth=2
#pragma HLS STREAM variable=sum01 depth=2
#pragma HLS STREAM variable=sum23 depth=2
#pragma HLS STREAM variable=reciprocal0 depth=2
#pragma HLS STREAM variable=reciprocal1 depth=2
#pragma HLS STREAM variable=reciprocal2 depth=2
#pragma HLS STREAM variable=reciprocal3 depth=2
#pragma HLS STREAM variable=reciprocal12 depth=2
#pragma HLS STREAM variable=reciprocal23 depth=2

    int4_local_sumsq<0>(residual0, partial0);
    int4_local_sumsq<1>(residual1, partial1);
    int4_local_sumsq<2>(residual2, partial2);
    int4_local_sumsq<3>(residual3, partial3);
    int4_merge_rms_pair<0>(partial0, partial1, sum01);
    int4_merge_rms_pair<1>(partial2, partial3, sum23);
    int4_finalize_rms_and_seed_chain(
        sum01, sum23, reciprocal0, reciprocal1, reciprocal12);
    int4_relay_rms_reciprocal<2>(
        reciprocal12, reciprocal2, reciprocal23);
    int4_terminate_rms_reciprocal(reciprocal23, reciprocal3);
    int4_local_rms_normalize_quantize<0>(
        residual0, gamma0, reciprocal0,
        activation_q0, activation_scale0);
    int4_local_rms_normalize_quantize<1>(
        residual1, gamma1, reciprocal1,
        activation_q1, activation_scale1);
    int4_local_rms_normalize_quantize<2>(
        residual2, gamma2, reciprocal2,
        activation_q2, activation_scale2);
    int4_local_rms_normalize_quantize<3>(
        residual3, gamma3, reciprocal3,
        activation_q3, activation_scale3);
}

typedef ap_uint<1> int4_block_token_t;

static void int4_seed_block_token_chain(
    hls::stream<int4_block_token_t>& token_pe0,
    hls::stream<int4_block_token_t>& token_01) {
#pragma HLS INLINE off
    token_pe0.write(1);
    token_01.write(1);
}

template <int PE_ID>
static void int4_relay_block_token(
    hls::stream<int4_block_token_t>& token_in,
    hls::stream<int4_block_token_t>& token_local,
    hls::stream<int4_block_token_t>& token_out) {
#pragma HLS INLINE off
    const int4_block_token_t token = token_in.read();
    token_local.write(token);
    token_out.write(token);
}

static void int4_terminate_block_token(
    hls::stream<int4_block_token_t>& token_in,
    hls::stream<int4_block_token_t>& token_pe3) {
#pragma HLS INLINE off
    token_pe3.write(token_in.read());
}

template <int PE_ID>
static void int4_local_residual_add(
    int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch[INT4_VECTOR_WORDS_PER_PE]) {
#pragma HLS INLINE off
local_residual_word_loop:
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
        const int4_output_word_t residual_word = residual[word];
        const int4_output_word_t branch_word = branch[word];
        float sums[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=sums complete
    local_residual_add_lane_loop:
        for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS PIPELINE II=1
            sums[lane] =
                int4_block_bits_to_float(
                    residual_word.range(32 * lane + 31, 32 * lane)) +
                int4_block_bits_to_float(
                    branch_word.range(32 * lane + 31, 32 * lane));
        }
        int4_output_word_t output = 0;
        for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
            output.range(32 * lane + 31, 32 * lane) =
                int4_block_float_to_bits(sums[lane]);
        }
        residual[word] = output;
    }
}

template <int PE_ID>
static void int4_local_residual_add_commanded(
    int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch[INT4_VECTOR_WORDS_PER_PE],
    hls::stream<int4_block_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_local_residual_add<PE_ID>(residual, branch);
}

void int4_residual_add_shards(
    int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch3[INT4_VECTOR_WORDS_PER_PE]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_block_token_t> token_pe0, token_pe1;
    hls::stream<int4_block_token_t> token_pe2, token_pe3;
    hls::stream<int4_block_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_block_token_chain(token_pe0, token_01);
    int4_relay_block_token<1>(token_01, token_pe1, token_12);
    int4_relay_block_token<2>(token_12, token_pe2, token_23);
    int4_terminate_block_token(token_23, token_pe3);
    int4_local_residual_add_commanded<0>(residual0, branch0, token_pe0);
    int4_local_residual_add_commanded<1>(residual1, branch1, token_pe1);
    int4_local_residual_add_commanded<2>(residual2, branch2, token_pe2);
    int4_local_residual_add_commanded<3>(residual3, branch3, token_pe3);
}

template <int PE_ID>
static void int4_local_swiglu_quantize(
    const int4_output_word_t gate[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up[INT4_HIDDEN_WORDS_PER_PE],
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS]) {
#pragma HLS INLINE off
    float values[INT4_GROUP_SIZE];
#pragma HLS BIND_STORAGE variable=values type=ram_1p impl=bram latency=1
local_swiglu_group_loop:
    for (int group = 0; group < INT4_LOCAL_GROUPS_HIDDEN; ++group) {
    local_swiglu_word_loop:
        for (int word_in_group = 0; word_in_group < 2; ++word_in_group) {
            const int word_index = group * 2 + word_in_group;
            const int4_output_word_t gate_word = gate[word_index];
            const int4_output_word_t up_word = up[word_index];
        local_swiglu_lane_loop:
            for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS PIPELINE II=1
                const float gate_value = int4_block_bits_to_float(
                    gate_word.range(32 * lane + 31, 32 * lane));
                const float up_value = int4_block_bits_to_float(
                    up_word.range(32 * lane + 31, 32 * lane));
                const float sigmoid =
                    1.0f / (1.0f + hls::expf(-gate_value));
                values[word_in_group * INT4_OUTPUTS_PER_WORD + lane] =
                    (gate_value * sigmoid) * up_value;
            }
        }
        int4_quantize_g32(
            values, activation_q[group], activation_scale[group]);
    }
}

template <int PE_ID>
static void int4_local_swiglu_quantize_commanded(
    const int4_output_word_t gate[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up[INT4_HIDDEN_WORDS_PER_PE],
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    hls::stream<int4_block_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_local_swiglu_quantize<PE_ID>(
        gate, up, activation_q, activation_scale);
}

void int4_swiglu_quantize_shards(
    const int4_output_word_t gate0[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t gate1[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t gate2[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t gate3[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up0[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up1[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up2[INT4_HIDDEN_WORDS_PER_PE],
    const int4_output_word_t up3[INT4_HIDDEN_WORDS_PER_PE],
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    float activation_scale3[INT4_MAX_LOCAL_GROUPS]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_block_token_t> token_pe0, token_pe1;
    hls::stream<int4_block_token_t> token_pe2, token_pe3;
    hls::stream<int4_block_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_block_token_chain(token_pe0, token_01);
    int4_relay_block_token<1>(token_01, token_pe1, token_12);
    int4_relay_block_token<2>(token_12, token_pe2, token_23);
    int4_terminate_block_token(token_23, token_pe3);
    int4_local_swiglu_quantize_commanded<0>(
        gate0, up0, activation_q0, activation_scale0, token_pe0);
    int4_local_swiglu_quantize_commanded<1>(
        gate1, up1, activation_q1, activation_scale1, token_pe1);
    int4_local_swiglu_quantize_commanded<2>(
        gate2, up2, activation_q2, activation_scale2, token_pe2);
    int4_local_swiglu_quantize_commanded<3>(
        gate3, up3, activation_q3, activation_scale3, token_pe3);
}
