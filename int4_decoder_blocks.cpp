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

template <int PE_ID>
static void int4_serialize_activation_edge_body(
    hls::stream<int4_quant_word_t>& quantized_local,
    hls::stream<int4_activation_beat_t>& quantized_edge,
    int word_count
) {
#pragma HLS INLINE
serialize_activation_edge_word_loop:
    for (int word = 0; word < word_count; ++word) {
        int4_quant_word_t remaining = quantized_local.read();
    serialize_activation_edge_beat_loop:
        for (int beat = 0;
             beat < INT4_ACTIVATION_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            quantized_edge.write(
                (int4_activation_beat_t)remaining.range(
                    INT4_ACTIVATION_BEAT_BITS - 1, 0));
            remaining >>= INT4_ACTIVATION_BEAT_BITS;
        }
    }
}

static void int4_serialize_activation_pe0_to_pair01(
    hls::stream<int4_quant_word_t>& quantized_pe0_local,
    hls::stream<int4_activation_beat_t>& quantized_pe0_to_pair01,
    int word_count
) {
#pragma HLS INLINE off
    int4_serialize_activation_edge_body<0>(
        quantized_pe0_local, quantized_pe0_to_pair01, word_count);
}

static void int4_serialize_activation_pe3_to_pair23(
    hls::stream<int4_quant_word_t>& quantized_pe3_local,
    hls::stream<int4_activation_beat_t>& quantized_pe3_to_pair23,
    int word_count
) {
#pragma HLS INLINE off
    int4_serialize_activation_edge_body<3>(
        quantized_pe3_local, quantized_pe3_to_pair23, word_count);
}

template <int PE_ID>
static int4_quant_word_t int4_deserialize_activation_edge(
    hls::stream<int4_activation_beat_t>& quantized_edge
) {
#pragma HLS INLINE
    int4_quant_word_t q = 0;
deserialize_activation_edge_beat_loop:
    for (int beat = 0;
         beat < INT4_ACTIVATION_BEATS_PER_WORD;
         ++beat) {
#pragma HLS PIPELINE II=1
        const int4_activation_beat_t beat_value = quantized_edge.read();
        q >>= INT4_ACTIVATION_BEAT_BITS;
        q.range(
            INT4_QUANT_WORD_BITS - 1,
            INT4_QUANT_WORD_BITS - INT4_ACTIVATION_BEAT_BITS) =
                beat_value;
    }
    return q;
}

static void int4_block_unpack_fp32_lanes(
    const int4_output_word_t& packed,
    ap_uint<32> lanes[INT4_OUTPUTS_PER_WORD]
) {
#pragma HLS INLINE
#pragma HLS ARRAY_PARTITION variable=lanes complete

unpack_fp32_lane_loop:
    for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
        lanes[lane] = packed.range(32 * lane + 31, 32 * lane);
    }
}

template <int PE_ID>
static void int4_rms_sumsq_pe(
    const int4_output_word_t* input,
    hls::stream<float>& result
) {
#pragma HLS INLINE off

    // Four independent reductions consume four FP32 lanes every four clocks.
    // This sustains one lane/clock while matching the four-cycle FP-add
    // recurrence, without the dynamic 16-way accumulator mux that HLS
    // conservatively scheduled at II=4.
    float accumulator0 = 0.0f;
    float accumulator1 = 0.0f;
    float accumulator2 = 0.0f;
    float accumulator3 = 0.0f;

sumsq_word_loop:
    for (int word_index = 0;
         word_index < INT4_VECTOR_WORDS_PER_PE;
         ++word_index) {
        int4_output_word_t packed = input[word_index];
    sumsq_lane_block_loop:
        for (int block = 0;
             block < INT4_OUTPUTS_PER_WORD / 4;
             ++block) {
#pragma HLS LOOP_FLATTEN off
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

    const float merged =
        (accumulator0 + accumulator1) +
        (accumulator2 + accumulator3);
    result.write(merged);
}

static void int4_rms_merge_partial01(
    hls::stream<float>& partial_0,
    hls::stream<float>& partial_1,
    hls::stream<float>& merged_01
) {
#pragma HLS INLINE off
    merged_01.write(partial_0.read() + partial_1.read());
}

static void int4_rms_merge_partial2(
    hls::stream<float>& merged_01,
    hls::stream<float>& partial_2,
    hls::stream<float>& merged_012
) {
#pragma HLS INLINE off
    merged_012.write(merged_01.read() + partial_2.read());
}

static void int4_rms_merge_partial3_and_rsqrt(
    hls::stream<float>& merged_012,
    hls::stream<float>& partial_3,
    float& reciprocal_rms
) {
#pragma HLS INLINE off
    // Preserve the exact former C association:
    // (((partial_0 + partial_1) + partial_2) + partial_3).
    const float total = merged_012.read() + partial_3.read();
    const float mean_square =
        total * (1.0f / (float)INT4_DIM) + 1.0e-5f;
    reciprocal_rms = hls::rsqrtf(mean_square);
}

template <int PE_ID>
static void int4_rms_normalize_quantize_pe(
    const int4_output_word_t* input,
    const int4_output_word_t* gamma,
    hls::stream<float>& reciprocal_rms_stream,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

    // The reciprocal terminates in a PE-local FIFO/register before driving
    // the normalization loops in this SLR.
    const float reciprocal_rms = reciprocal_rms_stream.read();

    float normalized[INT4_GROUP_SIZE];
    // This scratchpad is accessed sequentially and does not benefit from
    // distributed RAM.  One BRAM removes LUT/FF pressure without changing
    // its one-cycle read latency or the quantization schedule.
#pragma HLS BIND_STORAGE variable=normalized type=ram_1p impl=bram latency=1

normalize_group_loop:
    for (int group = 0;
         group < INT4_GROUPS_PER_VECTOR / INT4_PE_COUNT;
         ++group) {
        ap_uint<32> max_abs_bits = 0;

    normalize_word_loop:
        for (int word_in_group = 0;
             word_in_group < 2;
             ++word_in_group) {
            const int word_index = group * 2 + word_in_group;
            ap_uint<32> input_lanes[INT4_OUTPUTS_PER_WORD];
            ap_uint<32> gamma_lanes[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=input_lanes complete
#pragma HLS ARRAY_PARTITION variable=gamma_lanes complete
            int4_block_unpack_fp32_lanes(
                input[word_index], input_lanes);
            int4_block_unpack_fp32_lanes(
                gamma[word_index], gamma_lanes);

        normalize_lane_loop:
            for (int packed_lane = 0;
                 packed_lane < INT4_OUTPUTS_PER_WORD;
                 ++packed_lane) {
#pragma HLS LOOP_FLATTEN off
#pragma HLS PIPELINE II=1
                const int group_lane =
                    word_in_group * INT4_OUTPUTS_PER_WORD +
                    packed_lane;
                const float x = int4_block_bits_to_float(
                    input_lanes[packed_lane]);
                const float weight = int4_block_bits_to_float(
                    gamma_lanes[packed_lane]);
                const float value =
                    (x * reciprocal_rms) * weight;
                normalized[group_lane] = value;
                const ap_uint<32> value_bits =
                    int4_block_float_to_bits(value);
                const ap_uint<32> magnitude_bits =
                    value_bits & 0x7fffffffU;
                if (magnitude_bits > max_abs_bits) {
                    max_abs_bits = magnitude_bits;
                }
            }
        }

        const float max_abs =
            int4_block_bits_to_float(max_abs_bits);
        const float output_scale =
            max_abs == 0.0f
                ? 0.0f
                : max_abs * (1.0f / 16383.0f);
        scale_stream.write(output_scale);

        const float inverse_scale =
            max_abs == 0.0f ? 0.0f : 16383.0f / max_abs;

        int4_quant_word_t quantized_word = 0;
    quantize_reverse_loop:
        for (int index = INT4_GROUP_SIZE - 1;
             index >= 0;
             --index) {
#pragma HLS PIPELINE II=1
            const float scaled = normalized[index] * inverse_scale;
            float rounded =
                scaled >= 0.0f ? scaled + 0.5f : scaled - 0.5f;
            if (rounded > 16383.0f) {
                rounded = 16383.0f;
            }
            if (rounded < -16383.0f) {
                rounded = -16383.0f;
            }
            const ap_int<15> quantized =
                (ap_int<15>)(int)rounded;
            quantized_word =
                (quantized_word << 15) |
                (ap_uint<15>)quantized;
        }
        quantized_stream.write(quantized_word);
    }
}

template <int PE_ID>
static void int4_rms_forward_pe_groups(
    hls::stream<int4_quant_word_t>& quantized_pe,
    hls::stream<float>& scale_pe,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE
rms_forward_group_loop:
    for (int group = 0;
         group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
         ++group) {
#pragma HLS PIPELINE II=1
        quantized_stream.write(quantized_pe.read());
        scale_stream.write(scale_pe.read());
    }
}

static void int4_rms_broadcast_reciprocal_pair01(
    float reciprocal_rms,
    hls::stream<float>& reciprocal_pe0,
    hls::stream<float>& reciprocal_pe1
) {
#pragma HLS INLINE off
    reciprocal_pe0.write(reciprocal_rms);
    reciprocal_pe1.write(reciprocal_rms);
}

static void int4_rms_broadcast_reciprocal_pair23(
    float reciprocal_rms,
    hls::stream<float>& reciprocal_pe2,
    hls::stream<float>& reciprocal_pe3
) {
#pragma HLS INLINE off
    reciprocal_pe2.write(reciprocal_rms);
    reciprocal_pe3.write(reciprocal_rms);
}

template <int FIRST_PE>
static void int4_rms_gather_pair_body(
    hls::stream<int4_quant_word_t>& quantized_first,
    hls::stream<int4_quant_word_t>& quantized_second,
    hls::stream<float>& scale_first,
    hls::stream<float>& scale_second,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE

rms_pair_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
        int4_rms_forward_pe_groups<FIRST_PE>(
            quantized_first, scale_first,
            quantized_pair, scale_pair);
        int4_rms_forward_pe_groups<FIRST_PE + 1>(
            quantized_second, scale_second,
            quantized_pair, scale_pair);
    }
}

static void int4_rms_gather_pair01(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<float>& scale_pair01
) {
#pragma HLS INLINE off
    int4_rms_gather_pair_body<0>(
        quantized_pe0, quantized_pe1,
        scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
}

static void int4_rms_gather_pair23(
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair23
) {
#pragma HLS INLINE off
    int4_rms_gather_pair_body<2>(
        quantized_pe2, quantized_pe3,
        scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
}

template <int PE_ID>
static void int4_rms_forward_edge_groups(
    hls::stream<int4_activation_beat_t>& quantized_edge,
    hls::stream<float>& scale_edge,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
rms_forward_edge_group_loop:
    for (int group = 0;
         group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
         ++group) {
        quantized_pair.write(
            int4_deserialize_activation_edge<PE_ID>(quantized_edge));
        scale_pair.write(scale_edge.read());
    }
}

static void int4_rms_gather_pair01_edge(
    hls::stream<int4_activation_beat_t>& quantized_pe0_to_pair01,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<float>& scale_pair01
) {
#pragma HLS INLINE off
rms_pair01_edge_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
        int4_rms_forward_edge_groups<0>(
            quantized_pe0_to_pair01, scale_pe0,
            quantized_pair01, scale_pair01);
        int4_rms_forward_pe_groups<1>(
            quantized_pe1, scale_pe1,
            quantized_pair01, scale_pair01);
    }
}

static void int4_rms_gather_pair23_edge(
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_activation_beat_t>& quantized_pe3_to_pair23,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair23
) {
#pragma HLS INLINE off
rms_pair23_edge_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
        int4_rms_forward_pe_groups<2>(
            quantized_pe2, scale_pe2,
            quantized_pair23, scale_pair23);
        int4_rms_forward_edge_groups<3>(
            quantized_pe3_to_pair23, scale_pe3,
            quantized_pair23, scale_pair23);
    }
}

static void int4_rms_merge_pair_streams(
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

rms_merge_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
    rms_merge_pair01_loop:
        for (int group = 0;
             group < 2 * INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            quantized_stream.write(quantized_pair01.read());
            scale_stream.write(scale_pair01.read());
        }
    rms_merge_pair23_loop:
        for (int group = 0;
             group < 2 * INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            quantized_stream.write(quantized_pair23.read());
            scale_stream.write(scale_pair23.read());
        }
    }
}

static void int4_rms_merge_pair_outputs(
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off

rms_merge_output_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
        int4_scale_word_t packed_scales = 0;
    rms_merge_output_pair01_loop:
        for (int group = 0;
             group < 2 * INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            activation_q[
                local_tile * INT4_SCALE_ROWS_PER_WORD + group] =
                    quantized_pair01.read();
            packed_scales >>= 32;
            packed_scales.range(511, 480) =
                int4_block_float_to_bits(scale_pair01.read());
        }
    rms_merge_output_pair23_loop:
        for (int group = 0;
             group < 2 * INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            activation_q[
                local_tile * INT4_SCALE_ROWS_PER_WORD +
                2 * INT4_TILE_ROWS / INT4_GROUP_SIZE + group] =
                    quantized_pair23.read();
            packed_scales >>= 32;
            packed_scales.range(511, 480) =
                int4_block_float_to_bits(scale_pair23.read());
        }
        activation_scale[local_tile] = packed_scales;
    }
}

static void int4_rms_sumsq_four_pes(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    float& reciprocal_rms
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<float> partial_0;
    hls::stream<float> partial_1;
    hls::stream<float> partial_2;
    hls::stream<float> partial_3;
    hls::stream<float> merged_01;
    hls::stream<float> merged_012;
#pragma HLS STREAM variable=partial_0 depth=2
#pragma HLS STREAM variable=partial_1 depth=2
#pragma HLS STREAM variable=partial_2 depth=2
#pragma HLS STREAM variable=partial_3 depth=2
#pragma HLS STREAM variable=merged_01 depth=2
#pragma HLS STREAM variable=merged_012 depth=2
#pragma HLS BIND_STORAGE variable=partial_0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=partial_1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=partial_2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=partial_3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=merged_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=merged_012 type=fifo impl=srl

    int4_rms_sumsq_pe<0>(input_pe0, partial_0);
    int4_rms_sumsq_pe<1>(input_pe1, partial_1);
    int4_rms_sumsq_pe<2>(input_pe2, partial_2);
    int4_rms_sumsq_pe<3>(input_pe3, partial_3);
    int4_rms_merge_partial01(partial_0, partial_1, merged_01);
    int4_rms_merge_partial2(merged_01, partial_2, merged_012);
    int4_rms_merge_partial3_and_rsqrt(
        merged_012, partial_3, reciprocal_rms);
}

static void int4_rms_normalize_quantize_four_pes(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    float reciprocal_rms,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_pe0;
    hls::stream<int4_quant_word_t> quantized_pe1;
    hls::stream<int4_quant_word_t> quantized_pe2;
    hls::stream<int4_quant_word_t> quantized_pe3;
    hls::stream<float> scale_pe0;
    hls::stream<float> scale_pe1;
    hls::stream<float> scale_pe2;
    hls::stream<float> scale_pe3;
    hls::stream<float> reciprocal_pe0;
    hls::stream<float> reciprocal_pe1;
    hls::stream<float> reciprocal_pe2;
    hls::stream<float> reciprocal_pe3;
    hls::stream<int4_quant_word_t> quantized_pair01, quantized_pair23;
    hls::stream<float> scale_pair01, scale_pair23;
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=reciprocal_pe0 depth=2
#pragma HLS STREAM variable=reciprocal_pe1 depth=2
#pragma HLS STREAM variable=reciprocal_pe2 depth=2
#pragma HLS STREAM variable=reciprocal_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair01 depth=8
#pragma HLS STREAM variable=quantized_pair23 depth=8
#pragma HLS STREAM variable=scale_pair01 depth=8
#pragma HLS STREAM variable=scale_pair23 depth=8
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pair01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair23 type=fifo impl=srl

    int4_rms_broadcast_reciprocal_pair01(
        reciprocal_rms, reciprocal_pe0, reciprocal_pe1);
    int4_rms_broadcast_reciprocal_pair23(
        reciprocal_rms, reciprocal_pe2, reciprocal_pe3);
    int4_rms_normalize_quantize_pe<0>(
        input_pe0, gamma_pe0, reciprocal_pe0,
        quantized_pe0, scale_pe0);
    int4_rms_normalize_quantize_pe<1>(
        input_pe1, gamma_pe1, reciprocal_pe1,
        quantized_pe1, scale_pe1);
    int4_rms_normalize_quantize_pe<2>(
        input_pe2, gamma_pe2, reciprocal_pe2,
        quantized_pe2, scale_pe2);
    int4_rms_normalize_quantize_pe<3>(
        input_pe3, gamma_pe3, reciprocal_pe3,
        quantized_pe3, scale_pe3);
    int4_rms_gather_pair01(
        quantized_pe0, quantized_pe1, scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
    int4_rms_gather_pair23(
        quantized_pe2, quantized_pe3, scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
    int4_rms_merge_pair_outputs(
        quantized_pair01, quantized_pair23,
        scale_pair01, scale_pair23,
        activation_q, activation_scale);
}

static void int4_rms_normalize_quantize_four_pes_stream(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    float reciprocal_rms,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t>
        quantized_pe0, quantized_pe1, quantized_pe2, quantized_pe3;
    hls::stream<float> scale_pe0, scale_pe1, scale_pe2, scale_pe3;
    hls::stream<float>
        reciprocal_pe0, reciprocal_pe1, reciprocal_pe2, reciprocal_pe3;
    hls::stream<int4_quant_word_t> quantized_pair01, quantized_pair23;
    hls::stream<float> scale_pair01, scale_pair23;
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=reciprocal_pe0 depth=2
#pragma HLS STREAM variable=reciprocal_pe1 depth=2
#pragma HLS STREAM variable=reciprocal_pe2 depth=2
#pragma HLS STREAM variable=reciprocal_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair01 depth=8
#pragma HLS STREAM variable=quantized_pair23 depth=8
#pragma HLS STREAM variable=scale_pair01 depth=8
#pragma HLS STREAM variable=scale_pair23 depth=8
    // These FIFOs are only four 480-bit words deep. LUTRAM avoids banking the
    // wide word across fixed BRAM sites, which was routing-dominated at 300 MHz.
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pair01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair23 type=fifo impl=srl

    int4_rms_broadcast_reciprocal_pair01(
        reciprocal_rms, reciprocal_pe0, reciprocal_pe1);
    int4_rms_broadcast_reciprocal_pair23(
        reciprocal_rms, reciprocal_pe2, reciprocal_pe3);
    int4_rms_normalize_quantize_pe<0>(
        input_pe0, gamma_pe0, reciprocal_pe0,
        quantized_pe0, scale_pe0);
    int4_rms_normalize_quantize_pe<1>(
        input_pe1, gamma_pe1, reciprocal_pe1,
        quantized_pe1, scale_pe1);
    int4_rms_normalize_quantize_pe<2>(
        input_pe2, gamma_pe2, reciprocal_pe2,
        quantized_pe2, scale_pe2);
    int4_rms_normalize_quantize_pe<3>(
        input_pe3, gamma_pe3, reciprocal_pe3,
        quantized_pe3, scale_pe3);
    int4_rms_gather_pair01(
        quantized_pe0, quantized_pe1, scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
    int4_rms_gather_pair23(
        quantized_pe2, quantized_pe3, scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
    int4_rms_merge_pair_streams(
        quantized_pair01, quantized_pair23,
        scale_pair01, scale_pair23,
        quantized_stream, scale_stream);
}

static void int4_rms_normalize_quantize_four_pes_pair_halves(
    const int4_output_word_t* input_pe0,
    const int4_output_word_t* input_pe1,
    const int4_output_word_t* input_pe2,
    const int4_output_word_t* input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    float reciprocal_rms,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t>
        quantized_pe0_local, quantized_pe1,
        quantized_pe2, quantized_pe3_local;
    hls::stream<int4_activation_beat_t>
        quantized_pe0_to_pair01, quantized_pe3_to_pair23;
    hls::stream<float> scale_pe0, scale_pe1, scale_pe2, scale_pe3;
    hls::stream<float>
        reciprocal_pe0, reciprocal_pe1, reciprocal_pe2, reciprocal_pe3;
#pragma HLS STREAM variable=quantized_pe0_local depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3_local depth=4
#pragma HLS STREAM variable=quantized_pe0_to_pair01 depth=64
#pragma HLS STREAM variable=quantized_pe3_to_pair23 depth=64
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=reciprocal_pe0 depth=2
#pragma HLS STREAM variable=reciprocal_pe1 depth=2
#pragma HLS STREAM variable=reciprocal_pe2 depth=2
#pragma HLS STREAM variable=reciprocal_pe3 depth=2
    // These 480-bit producer FIFOs are explicitly anchored with their owning
    // PE by timing_300mhz_pre_place.tcl.  BRAM removes the distributed
    // full_n/write-enable cone without creating a remote hard-block path.
#pragma HLS BIND_STORAGE variable=quantized_pe0_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe0_to_pair01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_to_pair23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=reciprocal_pe3 type=fifo impl=srl

    int4_rms_broadcast_reciprocal_pair01(
        reciprocal_rms, reciprocal_pe0, reciprocal_pe1);
    int4_rms_broadcast_reciprocal_pair23(
        reciprocal_rms, reciprocal_pe2, reciprocal_pe3);
    int4_rms_normalize_quantize_pe<0>(
        input_pe0, gamma_pe0, reciprocal_pe0,
        quantized_pe0_local, scale_pe0);
    int4_rms_normalize_quantize_pe<1>(
        input_pe1, gamma_pe1, reciprocal_pe1,
        quantized_pe1, scale_pe1);
    int4_rms_normalize_quantize_pe<2>(
        input_pe2, gamma_pe2, reciprocal_pe2,
        quantized_pe2, scale_pe2);
    int4_rms_normalize_quantize_pe<3>(
        input_pe3, gamma_pe3, reciprocal_pe3,
        quantized_pe3_local, scale_pe3);
    int4_serialize_activation_pe0_to_pair01(
        quantized_pe0_local, quantized_pe0_to_pair01,
        INT4_GROUPS_PER_VECTOR / INT4_PE_COUNT);
    int4_serialize_activation_pe3_to_pair23(
        quantized_pe3_local, quantized_pe3_to_pair23,
        INT4_GROUPS_PER_VECTOR / INT4_PE_COUNT);
    int4_rms_gather_pair01_edge(
        quantized_pe0_to_pair01, quantized_pe1, scale_pe0, scale_pe1,
        quantized_half01_stream, scale_half01_stream);
    int4_rms_gather_pair23_edge(
        quantized_pe2, quantized_pe3_to_pair23, scale_pe2, scale_pe3,
        quantized_half23_stream, scale_half23_stream);
}

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
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }

    float reciprocal_rms = 0.0f;
    int4_rms_sumsq_four_pes(
        input_pe0, input_pe1, input_pe2, input_pe3,
        reciprocal_rms);
    int4_rms_normalize_quantize_four_pes_stream(
        input_pe0, input_pe1, input_pe2, input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        reciprocal_rms, quantized_stream, scale_stream);
}

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
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }

    float reciprocal_rms = 0.0f;
    int4_rms_sumsq_four_pes(
        input_pe0, input_pe1, input_pe2, input_pe3,
        reciprocal_rms);
    int4_rms_normalize_quantize_four_pes_pair_halves(
        input_pe0, input_pe1, input_pe2, input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        reciprocal_rms,
        quantized_half01_stream, scale_half01_stream,
        quantized_half23_stream, scale_half23_stream);
}

static void int4_advance_controller_after_rmsnorm(
    Int4Controller& controller
) {
#pragma HLS INLINE
    controller.run_rmsnorm = INT4_LAZY;
    controller.run_linear = INT4_RUN;

    switch ((int)controller.rmsnorm_mode) {
    case INT4_RMSNORM_ATTENTION:
        controller.linear_mode = INT4_LINEAR_Q;
        break;
    case INT4_RMSNORM_FFN:
        controller.linear_mode = INT4_LINEAR_GATE;
        break;
    case INT4_RMSNORM_FINAL:
        controller.linear_mode = INT4_LINEAR_LOGITS;
        break;
    default:
        controller.run_linear = INT4_LAZY;
        break;
    }
}

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
) {
#pragma HLS INTERFACE m_axi port=input_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=gamma_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=activation_q bundle=gmem0 offset=slave \
    depth=INT4_GROUPS_PER_VECTOR
#pragma HLS INTERFACE m_axi port=activation_scale bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_SCALE_WORDS
#pragma HLS INTERFACE m_axi port=input_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=gamma_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=input_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=gamma_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=input_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=gamma_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE

#pragma HLS INTERFACE s_axilite port=input_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=input_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=input_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=input_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=gamma_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=gamma_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=gamma_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=gamma_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=activation_q bundle=control
#pragma HLS INTERFACE s_axilite port=activation_scale bundle=control
#pragma HLS INTERFACE s_axilite port=controller bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (controller.run_rmsnorm != INT4_RUN) {
        return;
    }

    float reciprocal_rms = 0.0f;
    int4_rms_sumsq_four_pes(
        input_pe0, input_pe1, input_pe2, input_pe3,
        reciprocal_rms);
    int4_rms_normalize_quantize_four_pes(
        input_pe0, input_pe1, input_pe2, input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        reciprocal_rms,
        activation_q, activation_scale);
    int4_advance_controller_after_rmsnorm(controller);
}

static void int4_residual_add_pe(
    int4_output_word_t* residual,
    const int4_output_word_t* branch
) {
#pragma HLS INLINE off

residual_word_loop:
    for (int word_index = 0;
         word_index < INT4_VECTOR_WORDS_PER_PE;
         ++word_index) {
        const int4_output_word_t residual_word = residual[word_index];
        const int4_output_word_t branch_word = branch[word_index];
        float residual_values[INT4_OUTPUTS_PER_WORD];
        float branch_values[INT4_OUTPUTS_PER_WORD];
        float sums[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=residual_values complete
#pragma HLS ARRAY_PARTITION variable=branch_values complete
#pragma HLS ARRAY_PARTITION variable=sums complete

    residual_unpack_loop:
        for (int lane = 0;
             lane < INT4_OUTPUTS_PER_WORD;
             ++lane) {
#pragma HLS UNROLL
            residual_values[lane] =
                int4_block_bits_to_float(
                    residual_word.range(
                        32 * lane + 31, 32 * lane));
            branch_values[lane] =
                int4_block_bits_to_float(
                    branch_word.range(
                        32 * lane + 31, 32 * lane));
        }

        // One fully pipelined FP32 adder per DDR engine is sufficient here.
        // Keeping the scalar values out of the 512-bit packed word prevents
        // HLS from building a large dynamic barrel-shift feedback path.
    residual_add_lane_loop:
        for (int lane = 0;
             lane < INT4_OUTPUTS_PER_WORD;
             ++lane) {
#pragma HLS PIPELINE II=1
            sums[lane] =
                residual_values[lane] + branch_values[lane];
        }

        int4_output_word_t output_word = 0;
    residual_pack_loop:
        for (int lane = 0;
             lane < INT4_OUTPUTS_PER_WORD;
             ++lane) {
#pragma HLS UNROLL
            output_word.range(32 * lane + 31, 32 * lane) =
                int4_block_float_to_bits(sums[lane]);
        }
        residual[word_index] = output_word;
    }
}

static void int4_residual_add_four_pes(
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    const int4_output_word_t* branch_pe0,
    const int4_output_word_t* branch_pe1,
    const int4_output_word_t* branch_pe2,
    const int4_output_word_t* branch_pe3
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    int4_residual_add_pe(residual_pe0, branch_pe0);
    int4_residual_add_pe(residual_pe1, branch_pe1);
    int4_residual_add_pe(residual_pe2, branch_pe2);
    int4_residual_add_pe(residual_pe3, branch_pe3);
}

static void int4_advance_controller_after_residual(
    Int4Controller& controller
) {
#pragma HLS INLINE
    controller.run_accumulate = INT4_LAZY;
    controller.run_rmsnorm = INT4_RUN;

    if (controller.accumulate_mode ==
        INT4_ACCUMULATE_ATTENTION) {
        controller.rmsnorm_mode = INT4_RMSNORM_FFN;
        return;
    }

    if ((int)controller.layer_index + 1 < INT4_NUM_LAYERS) {
        controller.layer_index =
            (ap_uint<6>)(controller.layer_index + 1);
        controller.rmsnorm_mode = INT4_RMSNORM_ATTENTION;
    } else {
        controller.layer_index = INT4_NUM_LAYERS;
        controller.rmsnorm_mode = INT4_RMSNORM_FINAL;
    }
}

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
) {
#pragma HLS INTERFACE m_axi port=residual_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=branch_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=residual_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=branch_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=residual_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=branch_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=residual_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=branch_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE

#pragma HLS INTERFACE s_axilite port=residual_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=branch_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=branch_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=branch_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=branch_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=controller bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (controller.run_accumulate != INT4_RUN) {
        return;
    }

    int4_residual_add_four_pes(
        residual_pe0, residual_pe1,
        residual_pe2, residual_pe3,
        branch_pe0, branch_pe1,
        branch_pe2, branch_pe3);
    int4_advance_controller_after_residual(controller);
}

template <int LOCAL_GROUPS>
static void int4_swiglu_quantize_pe(
    const int4_output_word_t* gate,
    const int4_output_word_t* up,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE

    float swiglu_group[INT4_GROUP_SIZE];
    // As in RMSNorm, G32 is a sequential scratchpad.  Keep it in a one-cycle
    // BRAM instead of spending LUTRAM in every PE instance.
#pragma HLS BIND_STORAGE variable=swiglu_group type=ram_1p impl=bram latency=1

swiglu_group_loop:
    for (int group = 0; group < LOCAL_GROUPS; ++group) {
        ap_uint<32> max_abs_bits = 0;

    swiglu_word_loop:
        for (int word_in_group = 0;
             word_in_group < 2;
             ++word_in_group) {
            const int word_index = group * 2 + word_in_group;
            ap_uint<32> gate_lanes[INT4_OUTPUTS_PER_WORD];
            ap_uint<32> up_lanes[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=gate_lanes complete
#pragma HLS ARRAY_PARTITION variable=up_lanes complete
            int4_block_unpack_fp32_lanes(
                gate[word_index], gate_lanes);
            int4_block_unpack_fp32_lanes(
                up[word_index], up_lanes);

        swiglu_lane_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
#pragma HLS LOOP_FLATTEN off
#pragma HLS PIPELINE II=1
                const int index =
                    word_in_group * INT4_OUTPUTS_PER_WORD + lane;
                const float gate_value = int4_block_bits_to_float(
                    gate_lanes[lane]);
                const float up_value = int4_block_bits_to_float(
                    up_lanes[lane]);
                const float sigmoid =
                    1.0f / (1.0f + hls::expf(-gate_value));
                const float value =
                    (gate_value * sigmoid) * up_value;
                swiglu_group[index] = value;

                const ap_uint<32> value_bits =
                    int4_block_float_to_bits(value);
                const ap_uint<32> magnitude_bits =
                    value_bits & 0x7fffffffU;
                if (magnitude_bits > max_abs_bits) {
                    max_abs_bits = magnitude_bits;
                }
            }
        }

        const float max_abs =
            int4_block_bits_to_float(max_abs_bits);
        const float output_scale =
            max_abs == 0.0f
                ? 0.0f
                : max_abs * (1.0f / 16383.0f);
        const float inverse_scale =
            max_abs == 0.0f ? 0.0f : 16383.0f / max_abs;
        scale_stream.write(output_scale);

        int4_quant_word_t quantized_word = 0;
    swiglu_quantize_reverse_loop:
        for (int index = INT4_GROUP_SIZE - 1;
             index >= 0;
             --index) {
#pragma HLS PIPELINE II=1
            const float scaled =
                swiglu_group[index] * inverse_scale;
            float rounded =
                scaled >= 0.0f ? scaled + 0.5f : scaled - 0.5f;
            if (rounded > 16383.0f) {
                rounded = 16383.0f;
            }
            if (rounded < -16383.0f) {
                rounded = -16383.0f;
            }
            const ap_int<15> quantized =
                (ap_int<15>)(int)rounded;
            quantized_word =
                (quantized_word << 15) |
                (ap_uint<15>)quantized;
        }
        quantized_stream.write(quantized_word);
    }
}

// Stable, PE-specific process names are part of the physical architecture.
// The implementation body above is inlined into these wrappers so the
// floorplan never has to infer PE ownership from ambiguous <88>/<84> template
// instance suffixes generated by HLS.
static void int4_swiglu_quantize_pe0(
    const int4_output_word_t* gate,
    const int4_output_word_t* up,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    int4_swiglu_quantize_pe<88>(
        gate, up, quantized_stream, scale_stream);
}

static void int4_swiglu_quantize_pe1(
    const int4_output_word_t* gate,
    const int4_output_word_t* up,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    int4_swiglu_quantize_pe<88>(
        gate, up, quantized_stream, scale_stream);
}

static void int4_swiglu_quantize_pe2(
    const int4_output_word_t* gate,
    const int4_output_word_t* up,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    int4_swiglu_quantize_pe<84>(
        gate, up, quantized_stream, scale_stream);
}

static void int4_swiglu_quantize_pe3(
    const int4_output_word_t* gate,
    const int4_output_word_t* up,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    int4_swiglu_quantize_pe<84>(
        gate, up, quantized_stream, scale_stream);
}

template <int PE_ID>
static void int4_swiglu_forward_pe_tile(
    int local_tile,
    hls::stream<int4_quant_word_t>& quantized_pe,
    hls::stream<float>& scale_pe,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
    const int global_tile = local_tile * INT4_PE_COUNT + PE_ID;
    if (global_tile < INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
    swiglu_pair_group_loop:
        for (int group = 0;
             group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            quantized_pair.write(quantized_pe.read());
            scale_pair.write(scale_pe.read());
        }
    }
}

template <int FIRST_PE>
static void int4_swiglu_gather_pair_body(
    hls::stream<int4_quant_word_t>& quantized_first,
    hls::stream<int4_quant_word_t>& quantized_second,
    hls::stream<float>& scale_first,
    hls::stream<float>& scale_second,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
swiglu_pair_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) / INT4_PE_COUNT;
         ++local_tile) {
        int4_swiglu_forward_pe_tile<FIRST_PE>(
            local_tile, quantized_first, scale_first,
            quantized_pair, scale_pair);
        int4_swiglu_forward_pe_tile<FIRST_PE + 1>(
            local_tile, quantized_second, scale_second,
            quantized_pair, scale_pair);
    }
}

static void int4_swiglu_gather_pair01(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<float>& scale_pair01
) {
#pragma HLS INLINE off
    int4_swiglu_gather_pair_body<0>(
        quantized_pe0, quantized_pe1, scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
}

static void int4_swiglu_gather_pair23(
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair23
) {
#pragma HLS INLINE off
    int4_swiglu_gather_pair_body<2>(
        quantized_pe2, quantized_pe3, scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
}

template <int PE_ID>
static void int4_swiglu_forward_edge_pe_tile(
    int local_tile,
    hls::stream<int4_activation_beat_t>& quantized_edge,
    hls::stream<float>& scale_edge,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
    const int global_tile = local_tile * INT4_PE_COUNT + PE_ID;
    if (global_tile < INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
    swiglu_edge_pair_group_loop:
        for (int group = 0;
             group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
            quantized_pair.write(
                int4_deserialize_activation_edge<PE_ID>(quantized_edge));
            scale_pair.write(scale_edge.read());
        }
    }
}

static void int4_swiglu_gather_pair01_edge(
    hls::stream<int4_activation_beat_t>& quantized_pe0_to_pair01,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<float>& scale_pair01
) {
#pragma HLS INLINE off
swiglu_pair01_edge_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) / INT4_PE_COUNT;
         ++local_tile) {
        int4_swiglu_forward_edge_pe_tile<0>(
            local_tile, quantized_pe0_to_pair01, scale_pe0,
            quantized_pair01, scale_pair01);
        int4_swiglu_forward_pe_tile<1>(
            local_tile, quantized_pe1, scale_pe1,
            quantized_pair01, scale_pair01);
    }
}

static void int4_swiglu_gather_pair23_edge(
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_activation_beat_t>& quantized_pe3_to_pair23,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair23
) {
#pragma HLS INLINE off
swiglu_pair23_edge_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) / INT4_PE_COUNT;
         ++local_tile) {
        int4_swiglu_forward_pe_tile<2>(
            local_tile, quantized_pe2, scale_pe2,
            quantized_pair23, scale_pair23);
        int4_swiglu_forward_edge_pe_tile<3>(
            local_tile, quantized_pe3_to_pair23, scale_pe3,
            quantized_pair23, scale_pair23);
    }
}

template <int PE_ID>
static void int4_swiglu_merge_pair_tile(
    int local_tile,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE
    const int global_tile = local_tile * INT4_PE_COUNT + PE_ID;
    if (global_tile < INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
    swiglu_merge_pair_group_loop:
        for (int group = 0;
             group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            quantized_stream.write(quantized_pair.read());
            scale_stream.write(scale_pair.read());
        }
    }
}

static void int4_swiglu_merge_pair_streams(
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
swiglu_merge_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) / INT4_PE_COUNT;
         ++local_tile) {
        int4_swiglu_merge_pair_tile<0>(
            local_tile, quantized_pair01, scale_pair01,
            quantized_stream, scale_stream);
        int4_swiglu_merge_pair_tile<1>(
            local_tile, quantized_pair01, scale_pair01,
            quantized_stream, scale_stream);
        int4_swiglu_merge_pair_tile<2>(
            local_tile, quantized_pair23, scale_pair23,
            quantized_stream, scale_stream);
        int4_swiglu_merge_pair_tile<3>(
            local_tile, quantized_pair23, scale_pair23,
            quantized_stream, scale_stream);
    }
}

template <int PE_ID>
static void int4_swiglu_store_pair_tile(
    int local_tile,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    int& global_group,
    int& scale_word_index,
    int& scale_lane,
    int4_scale_word_t& packed_scales
) {
#pragma HLS INLINE
    const int global_tile = local_tile * INT4_PE_COUNT + PE_ID;
    if (global_tile < INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
    swiglu_store_pair_group_loop:
        for (int group = 0;
             group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            activation_q[global_group] = quantized_pair.read();
            packed_scales >>= 32;
            packed_scales.range(511, 480) =
                int4_block_float_to_bits(scale_pair.read());
            ++global_group;
            ++scale_lane;
            if (scale_lane == INT4_SCALE_ROWS_PER_WORD) {
                activation_scale[scale_word_index] = packed_scales;
                ++scale_word_index;
                scale_lane = 0;
                packed_scales = 0;
            }
        }
    }
}

static void int4_swiglu_merge_pair_outputs(
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off
    int global_group = 0;
    int scale_word_index = 0;
    int scale_lane = 0;
    int4_scale_word_t packed_scales = 0;

swiglu_merge_output_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) / INT4_PE_COUNT;
         ++local_tile) {
        int4_swiglu_store_pair_tile<0>(
            local_tile, quantized_pair01, scale_pair01,
            activation_q, activation_scale,
            global_group, scale_word_index, scale_lane, packed_scales);
        int4_swiglu_store_pair_tile<1>(
            local_tile, quantized_pair01, scale_pair01,
            activation_q, activation_scale,
            global_group, scale_word_index, scale_lane, packed_scales);
        int4_swiglu_store_pair_tile<2>(
            local_tile, quantized_pair23, scale_pair23,
            activation_q, activation_scale,
            global_group, scale_word_index, scale_lane, packed_scales);
        int4_swiglu_store_pair_tile<3>(
            local_tile, quantized_pair23, scale_pair23,
            activation_q, activation_scale,
            global_group, scale_word_index, scale_lane, packed_scales);
    }

    if (scale_lane != 0) {
        // INT4_HIDDEN_GROUPS = 344 leaves eight valid scale lanes.
        packed_scales >>= 32 *
            (INT4_SCALE_ROWS_PER_WORD -
             (INT4_HIDDEN_GROUPS % INT4_SCALE_ROWS_PER_WORD));
        activation_scale[scale_word_index] = packed_scales;
    }
}

static void int4_swiglu_quantize_four_pes(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off
    // The four PEs are independent producers.  Completion is carried by the
    // explicit FIFOs below, not by a generated cross-PE start/ready chain.
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_pe0;
    hls::stream<int4_quant_word_t> quantized_pe1;
    hls::stream<int4_quant_word_t> quantized_pe2;
    hls::stream<int4_quant_word_t> quantized_pe3;
    hls::stream<float> scale_pe0;
    hls::stream<float> scale_pe1;
    hls::stream<float> scale_pe2;
    hls::stream<float> scale_pe3;
    hls::stream<int4_quant_word_t> quantized_pair01, quantized_pair23;
    hls::stream<float> scale_pair01, scale_pair23;
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=quantized_pair01 depth=8
#pragma HLS STREAM variable=quantized_pair23 depth=8
#pragma HLS STREAM variable=scale_pair01 depth=8
#pragma HLS STREAM variable=scale_pair23 depth=8
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pair01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair23 type=fifo impl=srl

    int4_swiglu_quantize_pe0(
        gate_pe0, up_pe0, quantized_pe0, scale_pe0);
    int4_swiglu_quantize_pe1(
        gate_pe1, up_pe1, quantized_pe1, scale_pe1);
    int4_swiglu_quantize_pe2(
        gate_pe2, up_pe2, quantized_pe2, scale_pe2);
    int4_swiglu_quantize_pe3(
        gate_pe3, up_pe3, quantized_pe3, scale_pe3);
    int4_swiglu_gather_pair01(
        quantized_pe0, quantized_pe1, scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
    int4_swiglu_gather_pair23(
        quantized_pe2, quantized_pe3, scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
    int4_swiglu_merge_pair_outputs(
        quantized_pair01, quantized_pair23,
        scale_pair01, scale_pair23,
        activation_q, activation_scale);
}

static void int4_swiglu_quantize_four_pes_stream(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    // Keep PE scheduling local.  The gather consumes only the registered
    // stream interfaces and must not feed ap_ready back through all four PEs.
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t>
        quantized_pe0, quantized_pe1, quantized_pe2, quantized_pe3;
    hls::stream<float> scale_pe0, scale_pe1, scale_pe2, scale_pe3;
    hls::stream<int4_quant_word_t> quantized_pair01, quantized_pair23;
    hls::stream<float> scale_pair01, scale_pair23;
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=quantized_pair01 depth=8
#pragma HLS STREAM variable=quantized_pair23 depth=8
#pragma HLS STREAM variable=scale_pair01 depth=8
#pragma HLS STREAM variable=scale_pair23 depth=8
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_pair01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair23 type=fifo impl=srl

    int4_swiglu_quantize_pe0(
        gate_pe0, up_pe0, quantized_pe0, scale_pe0);
    int4_swiglu_quantize_pe1(
        gate_pe1, up_pe1, quantized_pe1, scale_pe1);
    int4_swiglu_quantize_pe2(
        gate_pe2, up_pe2, quantized_pe2, scale_pe2);
    int4_swiglu_quantize_pe3(
        gate_pe3, up_pe3, quantized_pe3, scale_pe3);
    int4_swiglu_gather_pair01(
        quantized_pe0, quantized_pe1, scale_pe0, scale_pe1,
        quantized_pair01, scale_pair01);
    int4_swiglu_gather_pair23(
        quantized_pe2, quantized_pe3, scale_pe2, scale_pe3,
        quantized_pair23, scale_pair23);
    int4_swiglu_merge_pair_streams(
        quantized_pair01, quantized_pair23,
        scale_pair01, scale_pair23,
        quantized_stream, scale_stream);
}

static void int4_swiglu_quantize_four_pes_pair_halves(
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t>
        quantized_pe0_local, quantized_pe1,
        quantized_pe2, quantized_pe3_local;
    hls::stream<int4_activation_beat_t>
        quantized_pe0_to_pair01, quantized_pe3_to_pair23;
    hls::stream<float> scale_pe0, scale_pe1, scale_pe2, scale_pe3;
#pragma HLS STREAM variable=quantized_pe0_local depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3_local depth=4
#pragma HLS STREAM variable=quantized_pe0_to_pair01 depth=64
#pragma HLS STREAM variable=quantized_pe3_to_pair23 depth=64
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS BIND_STORAGE variable=quantized_pe0_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe0_to_pair01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_to_pair23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl

    int4_swiglu_quantize_pe0(
        gate_pe0, up_pe0, quantized_pe0_local, scale_pe0);
    int4_swiglu_quantize_pe1(
        gate_pe1, up_pe1, quantized_pe1, scale_pe1);
    int4_swiglu_quantize_pe2(
        gate_pe2, up_pe2, quantized_pe2, scale_pe2);
    int4_swiglu_quantize_pe3(
        gate_pe3, up_pe3, quantized_pe3_local, scale_pe3);
    int4_serialize_activation_pe0_to_pair01(
        quantized_pe0_local, quantized_pe0_to_pair01, 88);
    int4_serialize_activation_pe3_to_pair23(
        quantized_pe3_local, quantized_pe3_to_pair23, 84);
    int4_swiglu_gather_pair01_edge(
        quantized_pe0_to_pair01, quantized_pe1, scale_pe0, scale_pe1,
        quantized_half01_stream, scale_half01_stream);
    int4_swiglu_gather_pair23_edge(
        quantized_pe2, quantized_pe3_to_pair23, scale_pe2, scale_pe3,
        quantized_half23_stream, scale_half23_stream);
}

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
) {
#pragma HLS INTERFACE m_axi port=gate_pe0 bundle=gmem0 offset=slave
#pragma HLS INTERFACE m_axi port=up_pe0 bundle=gmem0 offset=slave
#pragma HLS INTERFACE m_axi port=activation_q bundle=gmem0 offset=slave \
    depth=INT4_HIDDEN_GROUPS
#pragma HLS INTERFACE m_axi port=activation_scale bundle=gmem0 offset=slave \
    depth=INT4_HIDDEN_SCALE_WORDS
#pragma HLS INTERFACE m_axi port=gate_pe1 bundle=gmem1 offset=slave
#pragma HLS INTERFACE m_axi port=up_pe1 bundle=gmem1 offset=slave
#pragma HLS INTERFACE m_axi port=gate_pe2 bundle=gmem2 offset=slave
#pragma HLS INTERFACE m_axi port=up_pe2 bundle=gmem2 offset=slave
#pragma HLS INTERFACE m_axi port=gate_pe3 bundle=gmem3 offset=slave
#pragma HLS INTERFACE m_axi port=up_pe3 bundle=gmem3 offset=slave

#pragma HLS INTERFACE s_axilite port=gate_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=gate_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=gate_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=gate_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=up_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=up_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=up_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=up_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=activation_q bundle=control
#pragma HLS INTERFACE s_axilite port=activation_scale bundle=control
#pragma HLS INTERFACE s_axilite port=controller bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (controller.run_swiglu != INT4_RUN) {
        return;
    }

    int4_swiglu_quantize_four_pes(
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        activation_q, activation_scale);
    controller.run_swiglu = INT4_LAZY;
    controller.run_linear = INT4_RUN;
    controller.linear_mode = INT4_LINEAR_DOWN;
}

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
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }

    int4_swiglu_quantize_four_pes_stream(
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        quantized_stream, scale_stream);
}

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
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }

    int4_swiglu_quantize_four_pes_pair_halves(
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        quantized_half01_stream, scale_half01_stream,
        quantized_half23_stream, scale_half23_stream);
}
