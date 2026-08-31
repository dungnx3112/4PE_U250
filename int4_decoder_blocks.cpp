#include "int4_decoder_blocks.hpp"
#include "int4_task_control.hpp"

#include <cstdint>
#include <hls_math.h>

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

static void int4_seed_rms_offset_chain(
    int norm_offset,
    hls::stream<int>& offset_pe0,
    hls::stream<int>& offset_01) {
#pragma HLS INLINE off
    offset_pe0.write(norm_offset);
    offset_01.write(norm_offset);
}

template <int PE_ID>
static void int4_relay_rms_offset(
    hls::stream<int>& offset_in,
    hls::stream<int>& offset_local,
    hls::stream<int>& offset_out) {
#pragma HLS INLINE off
    const int offset = offset_in.read();
    offset_local.write(offset);
    offset_out.write(offset);
}

static void int4_terminate_rms_offset(
    hls::stream<int>& offset_in,
    hls::stream<int>& offset_pe3) {
#pragma HLS INLINE off
    offset_pe3.write(offset_in.read());
}

template <int PE_ID>
static void int4_local_rms_normalize_quantize(
    const int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma[INT4_VECTOR_WORDS_PER_PE],
    hls::stream<float>& reciprocal_stream,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    hls::stream<int4_completion_token_t>& completion_stream) {
#pragma HLS INLINE off
    const float reciprocal = reciprocal_stream.read();
    float values[INT4_GROUP_SIZE];
#pragma HLS BIND_STORAGE variable=values type=ram_1p impl=bram latency=1

local_rms_group_loop:
    for (int group = 0; group < INT4_LOCAL_GROUPS_DIM; ++group) {
#pragma HLS LOOP_FLATTEN off
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
    completion_stream.write(1);
}

template <int PE_ID>
static void int4_local_rms_task(
    const int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t norm_cache[INT4_TOTAL_NORM_WORDS_PER_PE],
    hls::stream<int>& offset_stream,
    hls::stream<float>& partial_stream,
    hls::stream<float>& reciprocal_stream,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    hls::stream<int4_completion_token_t>& completion_stream) {
#pragma HLS INLINE off
    // One task owns each PE-local residual RAM.  Splitting sumsq and
    // normalize into separate tasks makes HLS insert a non-FIFO memory
    // sharing process, which is illegal inside an ap_ctrl_none KPN.
    int4_local_sumsq<PE_ID>(residual, partial_stream);
    const int norm_offset = offset_stream.read();
    int4_local_rms_normalize_quantize<PE_ID>(
        residual, norm_cache + norm_offset, reciprocal_stream,
        activation_q, activation_scale, completion_stream);
}

void int4_rmsnorm_quantize_shards(
    const int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t norm_cache0[INT4_TOTAL_NORM_WORDS_PER_PE],
    const int4_output_word_t norm_cache1[INT4_TOTAL_NORM_WORDS_PER_PE],
    const int4_output_word_t norm_cache2[INT4_TOTAL_NORM_WORDS_PER_PE],
    const int4_output_word_t norm_cache3[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    float activation_scale3[INT4_MAX_LOCAL_GROUPS],
    int norm_offset) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS STABLE variable=residual0
#pragma HLS STABLE variable=residual1
#pragma HLS STABLE variable=residual2
#pragma HLS STABLE variable=residual3
#pragma HLS STABLE variable=norm_cache0
#pragma HLS STABLE variable=norm_cache1
#pragma HLS STABLE variable=norm_cache2
#pragma HLS STABLE variable=norm_cache3
#pragma HLS STABLE variable=activation_q0
#pragma HLS STABLE variable=activation_q1
#pragma HLS STABLE variable=activation_q2
#pragma HLS STABLE variable=activation_q3
#pragma HLS STABLE variable=activation_scale0
#pragma HLS STABLE variable=activation_scale1
#pragma HLS STABLE variable=activation_scale2
#pragma HLS STABLE variable=activation_scale3
    HLS_TASK_STREAM<float> partial0, partial1, partial2, partial3;
    HLS_TASK_STREAM<float> sum01, sum23;
    HLS_TASK_STREAM<float> reciprocal0, reciprocal1;
    HLS_TASK_STREAM<float> reciprocal2, reciprocal3;
    HLS_TASK_STREAM<float> reciprocal12, reciprocal23;
    HLS_TASK_STREAM<int> offset_pe0, offset_pe1, offset_pe2, offset_pe3;
    HLS_TASK_STREAM<int> offset_01, offset_12, offset_23;
    HLS_TASK_STREAM<int4_completion_token_t> completion0, completion1;
    HLS_TASK_STREAM<int4_completion_token_t> completion2, completion3;
    HLS_TASK_STREAM<int4_completion_token_t> completion01, completion23;
#pragma HLS STREAM variable=partial0 depth=4
#pragma HLS STREAM variable=partial1 depth=4
#pragma HLS STREAM variable=partial2 depth=4
#pragma HLS STREAM variable=partial3 depth=4
#pragma HLS STREAM variable=sum01 depth=4
#pragma HLS STREAM variable=sum23 depth=4
#pragma HLS STREAM variable=reciprocal0 depth=2
#pragma HLS STREAM variable=reciprocal1 depth=2
#pragma HLS STREAM variable=reciprocal2 depth=2
#pragma HLS STREAM variable=reciprocal3 depth=2
#pragma HLS STREAM variable=reciprocal12 depth=2
#pragma HLS STREAM variable=reciprocal23 depth=2
#pragma HLS STREAM variable=offset_pe0 depth=2
#pragma HLS STREAM variable=offset_pe1 depth=2
#pragma HLS STREAM variable=offset_pe2 depth=2
#pragma HLS STREAM variable=offset_pe3 depth=2
#pragma HLS STREAM variable=offset_01 depth=2
#pragma HLS STREAM variable=offset_12 depth=2
#pragma HLS STREAM variable=offset_23 depth=2
#pragma HLS STREAM variable=completion0 depth=4
#pragma HLS STREAM variable=completion1 depth=4
#pragma HLS STREAM variable=completion2 depth=4
#pragma HLS STREAM variable=completion3 depth=4
#pragma HLS STREAM variable=completion01 depth=4
#pragma HLS STREAM variable=completion23 depth=4

    int4_seed_rms_offset_chain(norm_offset, offset_pe0, offset_01);
    HLS_TASK offset_relay1(int4_relay_rms_offset<1>,
        offset_01, offset_pe1, offset_12);
    HLS_TASK offset_relay2(int4_relay_rms_offset<2>,
        offset_12, offset_pe2, offset_23);
    HLS_TASK offset_terminate(int4_terminate_rms_offset,
        offset_23, offset_pe3);
    HLS_TASK local0(int4_local_rms_task<0>,
        residual0, norm_cache0, offset_pe0, partial0, reciprocal0,
        activation_q0, activation_scale0, completion0);
    HLS_TASK local1(int4_local_rms_task<1>,
        residual1, norm_cache1, offset_pe1, partial1, reciprocal1,
        activation_q1, activation_scale1, completion1);
    HLS_TASK local2(int4_local_rms_task<2>,
        residual2, norm_cache2, offset_pe2, partial2, reciprocal2,
        activation_q2, activation_scale2, completion2);
    HLS_TASK local3(int4_local_rms_task<3>,
        residual3, norm_cache3, offset_pe3, partial3, reciprocal3,
        activation_q3, activation_scale3, completion3);
    HLS_TASK merge01(int4_merge_rms_pair<0>, partial0, partial1, sum01);
    HLS_TASK merge23(int4_merge_rms_pair<1>, partial2, partial3, sum23);
    HLS_TASK finalize(int4_finalize_rms_and_seed_chain,
        sum01, sum23, reciprocal0, reciprocal1, reciprocal12);
    HLS_TASK relay2(int4_relay_rms_reciprocal<2>,
        reciprocal12, reciprocal2, reciprocal23);
    HLS_TASK terminate(int4_terminate_rms_reciprocal,
        reciprocal23, reciprocal3);
    HLS_TASK join01(int4_join_task_completion_pair<200>,
        completion0, completion1, completion01);
    HLS_TASK join23(int4_join_task_completion_pair<201>,
        completion2, completion3, completion23);
    int4_wait_task_completion_pairs<200>(completion01, completion23);
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
    hls::stream<int4_block_token_t>& token_stream,
    hls::stream<int4_completion_token_t>& completion_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_local_residual_add<PE_ID>(residual, branch);
    completion_stream.write(1);
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
#pragma HLS STABLE variable=residual0
#pragma HLS STABLE variable=residual1
#pragma HLS STABLE variable=residual2
#pragma HLS STABLE variable=residual3
#pragma HLS STABLE variable=branch0
#pragma HLS STABLE variable=branch1
#pragma HLS STABLE variable=branch2
#pragma HLS STABLE variable=branch3
    HLS_TASK_STREAM<int4_block_token_t> token_pe0, token_pe1;
    HLS_TASK_STREAM<int4_block_token_t> token_pe2, token_pe3;
    HLS_TASK_STREAM<int4_block_token_t> token_01, token_12, token_23;
    HLS_TASK_STREAM<int4_completion_token_t> completion0, completion1;
    HLS_TASK_STREAM<int4_completion_token_t> completion2, completion3;
    HLS_TASK_STREAM<int4_completion_token_t> completion01, completion23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS STREAM variable=completion0 depth=4
#pragma HLS STREAM variable=completion1 depth=4
#pragma HLS STREAM variable=completion2 depth=4
#pragma HLS STREAM variable=completion3 depth=4
#pragma HLS STREAM variable=completion01 depth=4
#pragma HLS STREAM variable=completion23 depth=4
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_block_token_chain(token_pe0, token_01);
    HLS_TASK relay1(int4_relay_block_token<1>,
        token_01, token_pe1, token_12);
    HLS_TASK relay2(int4_relay_block_token<2>,
        token_12, token_pe2, token_23);
    HLS_TASK terminate(int4_terminate_block_token,
        token_23, token_pe3);
    HLS_TASK add0(int4_local_residual_add_commanded<0>,
        residual0, branch0, token_pe0, completion0);
    HLS_TASK add1(int4_local_residual_add_commanded<1>,
        residual1, branch1, token_pe1, completion1);
    HLS_TASK add2(int4_local_residual_add_commanded<2>,
        residual2, branch2, token_pe2, completion2);
    HLS_TASK add3(int4_local_residual_add_commanded<3>,
        residual3, branch3, token_pe3, completion3);
    HLS_TASK join01(int4_join_task_completion_pair<210>,
        completion0, completion1, completion01);
    HLS_TASK join23(int4_join_task_completion_pair<211>,
        completion2, completion3, completion23);
    int4_wait_task_completion_pairs<210>(completion01, completion23);
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
#pragma HLS LOOP_FLATTEN off
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
    hls::stream<int4_block_token_t>& token_stream,
    hls::stream<int4_completion_token_t>& completion_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_local_swiglu_quantize<PE_ID>(
        gate, up, activation_q, activation_scale);
    completion_stream.write(1);
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
#pragma HLS STABLE variable=gate0
#pragma HLS STABLE variable=gate1
#pragma HLS STABLE variable=gate2
#pragma HLS STABLE variable=gate3
#pragma HLS STABLE variable=up0
#pragma HLS STABLE variable=up1
#pragma HLS STABLE variable=up2
#pragma HLS STABLE variable=up3
#pragma HLS STABLE variable=activation_q0
#pragma HLS STABLE variable=activation_q1
#pragma HLS STABLE variable=activation_q2
#pragma HLS STABLE variable=activation_q3
#pragma HLS STABLE variable=activation_scale0
#pragma HLS STABLE variable=activation_scale1
#pragma HLS STABLE variable=activation_scale2
#pragma HLS STABLE variable=activation_scale3
    HLS_TASK_STREAM<int4_block_token_t> token_pe0, token_pe1;
    HLS_TASK_STREAM<int4_block_token_t> token_pe2, token_pe3;
    HLS_TASK_STREAM<int4_block_token_t> token_01, token_12, token_23;
    HLS_TASK_STREAM<int4_completion_token_t> completion0, completion1;
    HLS_TASK_STREAM<int4_completion_token_t> completion2, completion3;
    HLS_TASK_STREAM<int4_completion_token_t> completion01, completion23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS STREAM variable=completion0 depth=4
#pragma HLS STREAM variable=completion1 depth=4
#pragma HLS STREAM variable=completion2 depth=4
#pragma HLS STREAM variable=completion3 depth=4
#pragma HLS STREAM variable=completion01 depth=4
#pragma HLS STREAM variable=completion23 depth=4
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_block_token_chain(token_pe0, token_01);
    HLS_TASK relay1(int4_relay_block_token<1>,
        token_01, token_pe1, token_12);
    HLS_TASK relay2(int4_relay_block_token<2>,
        token_12, token_pe2, token_23);
    HLS_TASK terminate(int4_terminate_block_token,
        token_23, token_pe3);
    HLS_TASK swiglu0(int4_local_swiglu_quantize_commanded<0>,
        gate0, up0, activation_q0, activation_scale0,
        token_pe0, completion0);
    HLS_TASK swiglu1(int4_local_swiglu_quantize_commanded<1>,
        gate1, up1, activation_q1, activation_scale1,
        token_pe1, completion1);
    HLS_TASK swiglu2(int4_local_swiglu_quantize_commanded<2>,
        gate2, up2, activation_q2, activation_scale2,
        token_pe2, completion2);
    HLS_TASK swiglu3(int4_local_swiglu_quantize_commanded<3>,
        gate3, up3, activation_q3, activation_scale3,
        token_pe3, completion3);
    HLS_TASK join01(int4_join_task_completion_pair<220>,
        completion0, completion1, completion01);
    HLS_TASK join23(int4_join_task_completion_pair<221>,
        completion2, completion3, completion23);
    int4_wait_task_completion_pairs<220>(completion01, completion23);
}
