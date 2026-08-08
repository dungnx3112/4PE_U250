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

static void int4_rms_sumsq_pe(
    const int4_output_word_t* input,
    hls::stream<float>& result
) {
#pragma HLS INLINE off

    float lane_accumulator[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=lane_accumulator complete

initialize_sumsq_lane_loop:
    for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
        lane_accumulator[lane] = 0;
    }

sumsq_word_loop:
    for (int word_index = 0;
         word_index < INT4_VECTOR_WORDS_PER_PE;
         ++word_index) {
        ap_uint<32> packed_lanes[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=packed_lanes complete
        int4_block_unpack_fp32_lanes(
            input[word_index], packed_lanes);

    sumsq_lane_loop:
        for (int lane = 0;
             lane < INT4_OUTPUTS_PER_WORD;
             ++lane) {
#pragma HLS PIPELINE II=1
            const float value = int4_block_bits_to_float(
                packed_lanes[lane]);
            lane_accumulator[lane] += value * value;
        }
    }

    float merged = 0.0f;
merge_sumsq_lane_loop:
    for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS PIPELINE II=1
        merged += lane_accumulator[lane];
    }
    result.write(merged);
}

static void int4_rms_merge_and_rsqrt(
    hls::stream<float>& partial_0,
    hls::stream<float>& partial_1,
    hls::stream<float>& partial_2,
    hls::stream<float>& partial_3,
    float& reciprocal_rms
) {
#pragma HLS INLINE off
    const float total =
        partial_0.read() + partial_1.read() +
        partial_2.read() + partial_3.read();
    const float mean_square =
        total * (1.0f / (float)INT4_DIM) + 1.0e-5f;
    reciprocal_rms = hls::rsqrtf(mean_square);
}

static void int4_rms_normalize_quantize_pe(
    const int4_output_word_t* input,
    const int4_output_word_t* gamma,
    float reciprocal_rms,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

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

static void int4_rms_gather_outputs(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off

gather_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
        int4_scale_word_t packed_scales = 0;

    gather_pe_loop:
        for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        gather_group_loop:
            for (int group = 0;
                 group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
                 ++group) {
#pragma HLS PIPELINE II=1
                int4_quant_word_t quantized = 0;
                float scale = 0.0f;
                if (pe == 0) {
                    quantized = quantized_pe0.read();
                    scale = scale_pe0.read();
                } else if (pe == 1) {
                    quantized = quantized_pe1.read();
                    scale = scale_pe1.read();
                } else if (pe == 2) {
                    quantized = quantized_pe2.read();
                    scale = scale_pe2.read();
                } else {
                    quantized = quantized_pe3.read();
                    scale = scale_pe3.read();
                }

                const int lane =
                    pe * (INT4_TILE_ROWS / INT4_GROUP_SIZE) + group;
                const int global_group =
                    local_tile * INT4_SCALE_ROWS_PER_WORD + lane;
                activation_q[global_group] = quantized;
                packed_scales >>= 32;
                packed_scales.range(511, 480) =
                    int4_block_float_to_bits(scale);
            }
        }
        activation_scale[local_tile] = packed_scales;
    }
}

static void int4_rms_gather_streams(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

rms_stream_local_tile_loop:
    for (int local_tile = 0;
         local_tile < INT4_DIM /
             (INT4_PE_COUNT * INT4_TILE_ROWS);
         ++local_tile) {
    rms_stream_pe_loop:
        for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        rms_stream_group_loop:
            for (int group = 0;
                 group < INT4_TILE_ROWS / INT4_GROUP_SIZE;
                 ++group) {
#pragma HLS PIPELINE II=1
                int4_quant_word_t quantized = 0;
                float scale = 0.0f;
                if (pe == 0) {
                    quantized = quantized_pe0.read();
                    scale = scale_pe0.read();
                } else if (pe == 1) {
                    quantized = quantized_pe1.read();
                    scale = scale_pe1.read();
                } else if (pe == 2) {
                    quantized = quantized_pe2.read();
                    scale = scale_pe2.read();
                } else {
                    quantized = quantized_pe3.read();
                    scale = scale_pe3.read();
                }
                quantized_stream.write(quantized);
                scale_stream.write(scale);
            }
        }
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
#pragma HLS STREAM variable=partial_0 depth=2
#pragma HLS STREAM variable=partial_1 depth=2
#pragma HLS STREAM variable=partial_2 depth=2
#pragma HLS STREAM variable=partial_3 depth=2

    int4_rms_sumsq_pe(input_pe0, partial_0);
    int4_rms_sumsq_pe(input_pe1, partial_1);
    int4_rms_sumsq_pe(input_pe2, partial_2);
    int4_rms_sumsq_pe(input_pe3, partial_3);
    int4_rms_merge_and_rsqrt(
        partial_0, partial_1, partial_2, partial_3,
        reciprocal_rms);
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
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram

    int4_rms_normalize_quantize_pe(
        input_pe0, gamma_pe0, reciprocal_rms,
        quantized_pe0, scale_pe0);
    int4_rms_normalize_quantize_pe(
        input_pe1, gamma_pe1, reciprocal_rms,
        quantized_pe1, scale_pe1);
    int4_rms_normalize_quantize_pe(
        input_pe2, gamma_pe2, reciprocal_rms,
        quantized_pe2, scale_pe2);
    int4_rms_normalize_quantize_pe(
        input_pe3, gamma_pe3, reciprocal_rms,
        quantized_pe3, scale_pe3);
    int4_rms_gather_outputs(
        quantized_pe0, quantized_pe1,
        quantized_pe2, quantized_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
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
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
    // Each quantized word is 480 bits.  An SRL FIFO duplicates the full/empty
    // enable across hundreds of LUT/FF cells and was one of the routed timing
    // failures; BRAM provides a registered, local control boundary.
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram

    int4_rms_normalize_quantize_pe(
        input_pe0, gamma_pe0, reciprocal_rms,
        quantized_pe0, scale_pe0);
    int4_rms_normalize_quantize_pe(
        input_pe1, gamma_pe1, reciprocal_rms,
        quantized_pe1, scale_pe1);
    int4_rms_normalize_quantize_pe(
        input_pe2, gamma_pe2, reciprocal_rms,
        quantized_pe2, scale_pe2);
    int4_rms_normalize_quantize_pe(
        input_pe3, gamma_pe3, reciprocal_rms,
        quantized_pe3, scale_pe3);
    int4_rms_gather_streams(
        quantized_pe0, quantized_pe1,
        quantized_pe2, quantized_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        quantized_stream, scale_stream);
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

static void int4_swiglu_gather_outputs(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off

    int global_group = 0;
    int scale_word_index = 0;
    int scale_lane = 0;
    int4_scale_word_t packed_scales = 0;

swiglu_gather_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) /
                 INT4_PE_COUNT;
         ++local_tile) {
    swiglu_gather_pe_loop:
        for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
            const int global_tile =
                local_tile * INT4_PE_COUNT + pe;
            if (global_tile <
                INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
            swiglu_gather_group_loop:
                for (int group = 0;
                     group <
                         INT4_TILE_ROWS / INT4_GROUP_SIZE;
                     ++group) {
#pragma HLS PIPELINE II=1
                    int4_quant_word_t quantized = 0;
                    float scale = 0.0f;
                    if (pe == 0) {
                        quantized = quantized_pe0.read();
                        scale = scale_pe0.read();
                    } else if (pe == 1) {
                        quantized = quantized_pe1.read();
                        scale = scale_pe1.read();
                    } else if (pe == 2) {
                        quantized = quantized_pe2.read();
                        scale = scale_pe2.read();
                    } else {
                        quantized = quantized_pe3.read();
                        scale = scale_pe3.read();
                    }

                    activation_q[global_group] = quantized;
                    packed_scales >>= 32;
                    packed_scales.range(511, 480) =
                        int4_block_float_to_bits(scale);
                    ++global_group;
                    ++scale_lane;
                    if (scale_lane == INT4_SCALE_ROWS_PER_WORD) {
                        activation_scale[scale_word_index] =
                            packed_scales;
                        ++scale_word_index;
                        scale_lane = 0;
                        packed_scales = 0;
                    }
                }
            }
        }
    }

    if (scale_lane != 0) {
        // INT4_HIDDEN_GROUPS = 344 leaves eight valid scale lanes.
        // Move those lanes from the upper half to lanes [0..7].
        packed_scales >>= 32 *
            (INT4_SCALE_ROWS_PER_WORD -
             (INT4_HIDDEN_GROUPS % INT4_SCALE_ROWS_PER_WORD));
        activation_scale[scale_word_index] = packed_scales;
    }
}

static void int4_swiglu_gather_streams(
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

swiglu_stream_local_tile_loop:
    for (int local_tile = 0;
         local_tile <
             (INT4_HIDDEN_DIM / INT4_TILE_ROWS +
              INT4_PE_COUNT - 1) /
                 INT4_PE_COUNT;
         ++local_tile) {
    swiglu_stream_pe_loop:
        for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
            const int global_tile =
                local_tile * INT4_PE_COUNT + pe;
            if (global_tile <
                INT4_HIDDEN_DIM / INT4_TILE_ROWS) {
            swiglu_stream_group_loop:
                for (int group = 0;
                     group <
                         INT4_TILE_ROWS / INT4_GROUP_SIZE;
                     ++group) {
#pragma HLS PIPELINE II=1
                    int4_quant_word_t quantized = 0;
                    float scale = 0.0f;
                    if (pe == 0) {
                        quantized = quantized_pe0.read();
                        scale = scale_pe0.read();
                    } else if (pe == 1) {
                        quantized = quantized_pe1.read();
                        scale = scale_pe1.read();
                    } else if (pe == 2) {
                        quantized = quantized_pe2.read();
                        scale = scale_pe2.read();
                    } else {
                        quantized = quantized_pe3.read();
                        scale = scale_pe3.read();
                    }
                    quantized_stream.write(quantized);
                    scale_stream.write(scale);
                }
            }
        }
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
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl

    int4_swiglu_quantize_pe0(
        gate_pe0, up_pe0, quantized_pe0, scale_pe0);
    int4_swiglu_quantize_pe1(
        gate_pe1, up_pe1, quantized_pe1, scale_pe1);
    int4_swiglu_quantize_pe2(
        gate_pe2, up_pe2, quantized_pe2, scale_pe2);
    int4_swiglu_quantize_pe3(
        gate_pe3, up_pe3, quantized_pe3, scale_pe3);
    int4_swiglu_gather_outputs(
        quantized_pe0, quantized_pe1,
        quantized_pe2, quantized_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
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
#pragma HLS STREAM variable=quantized_pe0 depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3 depth=4
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl

    int4_swiglu_quantize_pe0(
        gate_pe0, up_pe0, quantized_pe0, scale_pe0);
    int4_swiglu_quantize_pe1(
        gate_pe1, up_pe1, quantized_pe1, scale_pe1);
    int4_swiglu_quantize_pe2(
        gate_pe2, up_pe2, quantized_pe2, scale_pe2);
    int4_swiglu_quantize_pe3(
        gate_pe3, up_pe3, quantized_pe3, scale_pe3);
    int4_swiglu_gather_streams(
        quantized_pe0, quantized_pe1,
        quantized_pe2, quantized_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        quantized_stream, scale_stream);
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
