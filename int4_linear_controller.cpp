#include "int4_linear_controller.hpp"

#include <ap_fixed.h>
#include <cstdint>
#include <hls_stream.h>

#include "int4_decoder_blocks.hpp"

union int4_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static float int4_bits_to_float(ap_uint<32> bits) {
#pragma HLS INLINE
    int4_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<32> int4_float_to_bits(float value) {
#pragma HLS INLINE
    int4_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static float int4_half_bits_to_float(ap_uint<16> bits) {
#pragma HLS INLINE
    const ap_uint<1> sign = bits[15];
    const ap_uint<5> exponent = bits.range(14, 10);
    const ap_uint<10> mantissa = bits.range(9, 0);
    ap_uint<32> fp32_bits = 0;

    if (exponent == 0) {
        if (mantissa == 0) {
            fp32_bits[31] = sign;
        } else {
            // Normalize the FP16 subnormal.  Weight scales in trained LLMs are
            // normally much larger than 2^-14, but handling this case keeps
            // the offline format fully IEEE-754 compatible.
            ap_uint<10> normalized = mantissa;
            ap_uint<4> shift = 0;
        half_normalize_loop:
            for (int bit = 9; bit >= 0; --bit) {
#pragma HLS UNROLL
                if (normalized[9] == 0) {
                    normalized <<= 1;
                    ++shift;
                }
            }
            const ap_uint<8> fp32_exponent =
                (ap_uint<8>)(112 - (int)shift);
            fp32_bits[31] = sign;
            fp32_bits.range(30, 23) = fp32_exponent;
            fp32_bits.range(22, 13) =
                normalized.range(8, 0) << 1;
        }
    } else if (exponent == 31) {
        fp32_bits[31] = sign;
        fp32_bits.range(30, 23) = 0xff;
        fp32_bits.range(22, 13) = mantissa;
    } else {
        fp32_bits[31] = sign;
        fp32_bits.range(30, 23) =
            (ap_uint<8>)((int)exponent - 15 + 127);
        fp32_bits.range(22, 13) = mantissa;
    }
    return int4_bits_to_float(fp32_bits);
}

static ap_uint<32> int4_float_to_fxp_bits(float value) {
#pragma HLS INLINE
    const ap_uint<32> bits = int4_float_to_bits(value);
    const bool negative = bits[31];
    const ap_uint<8> exponent = bits.range(30, 23);
    const ap_uint<23> fraction = bits.range(22, 0);

    // Q15.17 raw = IEEE significand * 2^(exponent - 133).
    // Decode the IEEE fields as integers so the four output packers do not
    // each instantiate a general float-to-fixed conversion core.
    if (exponent == 0 || exponent < 109) {
        return 0;
    }
    if (exponent >= 141) {
        return negative
            ? (ap_uint<32>)0x80000000U
            : (ap_uint<32>)0x7fffffffU;
    }

    const ap_uint<24> significand =
        ((ap_uint<24>)1 << 23) | fraction;
    ap_uint<32> magnitude = 0;
    if (exponent >= 133) {
        const ap_uint<4> left_shift =
            (ap_uint<4>)(exponent - 133);
        magnitude = (ap_uint<32>)significand << left_shift;
    } else {
        const ap_uint<5> right_shift =
            (ap_uint<5>)(133 - exponent);
        const ap_uint<24> quotient =
            significand >> right_shift;
        const ap_uint<25> remainder_mask =
            ((ap_uint<25>)1 << right_shift) - 1;
        const ap_uint<25> remainder =
            (ap_uint<25>)significand & remainder_mask;
        const ap_uint<25> halfway =
            (ap_uint<25>)1 << (right_shift - 1);
        const bool round_up =
            remainder > halfway ||
            (remainder == halfway && quotient[0]);
        magnitude =
            (ap_uint<32>)quotient + (round_up ? 1 : 0);
    }

    if (!negative) {
        return magnitude;
    }
    const ap_int<33> signed_raw = -(ap_int<33>)magnitude;
    return signed_raw.range(31, 0);
}

Int4LinearShape int4_linear_shape_from_controller(
    const Int4Controller& controller
) {
#pragma HLS INLINE
    Int4LinearShape shape;
    shape.output_rows = 0;
    shape.input_cols = 0;

    switch ((int)controller.linear_mode) {
    case INT4_LINEAR_Q:
    case INT4_LINEAR_O:
        shape.output_rows = INT4_DIM;
        shape.input_cols = INT4_DIM;
        break;
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
        shape.output_rows = INT4_KV_DIM;
        shape.input_cols = INT4_DIM;
        break;
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        shape.output_rows = INT4_HIDDEN_DIM;
        shape.input_cols = INT4_DIM;
        break;
    case INT4_LINEAR_DOWN:
        shape.output_rows = INT4_DIM;
        shape.input_cols = INT4_HIDDEN_DIM;
        break;
    case INT4_LINEAR_LOGITS:
        shape.output_rows = INT4_VOCAB_SIZE;
        shape.input_cols = INT4_DIM;
        break;
    default:
        break;
    }

    shape.output_tiles =
        (((shape.output_rows + INT4_TILE_ROWS - 1) /
          INT4_TILE_ROWS) +
         INT4_PE_COUNT - 1) /
        INT4_PE_COUNT * INT4_PE_COUNT;
    shape.input_tiles =
        (shape.input_cols + INT4_TILE_COLS - 1) / INT4_TILE_COLS;
    return shape;
}

int int4_local_tile_count(int output_tiles, int pe_id) {
#pragma HLS INLINE
    if (output_tiles <= pe_id) {
        return 0;
    }
    return (output_tiles + INT4_PE_COUNT - 1 - pe_id) /
           INT4_PE_COUNT;
}

static ap_int<27> int4_pack_two_weights(
    int4_weight_t high,
    int4_weight_t low
) {
#pragma HLS INLINE
    ap_int<27> high_wide = (ap_int<27>)high;
    ap_int<27> low_wide = (ap_int<27>)low;
    ap_int<27> packed_weight = (high_wide << 23) + low_wide;
    // Do not let HLS absorb this signed packing add into the DSP48E2
    // pre-adder.  That produced one 3.333 ns add->multiply stage with no
    // implementation margin.  A one-cycle fabric/register stage keeps the
    // paper's exact arithmetic while presenting a registered 27-bit operand
    // to the packed multiplier.
#pragma HLS BIND_OP variable=packed_weight op=add impl=fabric latency=1
    return packed_weight;
}

static void int4_unpack_pair_sum(
    int4_packed_acc_t packed,
    int4_group_acc_t& high,
    int4_group_acc_t& low
) {
#pragma HLS INLINE
    int4_group_acc_t low_value = packed.range(22, 0);
    int4_group_acc_t high_raw = packed.range(45, 23);
    ap_int<24> corrected =
        (ap_int<24>)high_raw + (low_value[22] ? 1 : 0);
    high = (int4_group_acc_t)corrected;
    low = low_value;
}

#ifndef INT4_INTEGRATED_TOP
static void int4_load_activation(
    const int4_quant_word_t* activation_q,
    const int4_scale_word_t* activation_scale,
    int4_quant_word_t quantized[INT4_MAX_INPUT_GROUPS],
    float scales[INT4_MAX_INPUT_GROUPS],
    int input_groups
) {
#pragma HLS INLINE off
    int4_scale_word_t cached_scale_word = 0;

load_activation_scale_loop:
    for (int group = 0; group < input_groups; ++group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
        const int lane = group & (INT4_OUTPUTS_PER_WORD - 1);
        if (lane == 0) {
            cached_scale_word =
                activation_scale[group / INT4_OUTPUTS_PER_WORD];
        }
        scales[group] = int4_bits_to_float(
            cached_scale_word.range(31, 0));
        cached_scale_word >>= 32;
    }

load_activation_quant_loop:
    for (int group = 0; group < input_groups; ++group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
        quantized[group] = activation_q[group];
    }
}
#endif

// Cross an SLR boundary exactly once per input G32.  The old implementation
// replayed the same 480-bit activation word once for every local output tile,
// turning a small shared input vector into the widest repeated inter-SLR
// traffic in the kernel.  Each destination PE now caches this seed stream and
// performs the tile replay locally.
static void int4_broadcast_activation(
#ifdef INT4_INTEGRATED_TOP
    int4_quant_word_t* quantized,
    int4_scale_word_t* packed_scales,
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
#else
    const int4_quant_word_t* quantized,
    const float* scales,
#endif
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    int local_tiles_0,
    int local_tiles_1,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles
) {
#pragma HLS INLINE off
#ifdef INT4_INTEGRATED_TOP
    int4_scale_word_t streamed_scale_word = 0;
    int4_scale_word_t cached_scale_word = 0;
#endif
    const bool active_0 = local_tiles_0 > 0;
    const bool active_1 = local_tiles_1 > 0;
    const bool active_2 = local_tiles_2 > 0;
    const bool active_3 = local_tiles_3 > 0;
    const int input_groups = input_tiles * INT4_GROUPS_PER_TILE;

broadcast_activation_seed_loop:
    for (int activation_group = 0;
         activation_group < input_groups;
         ++activation_group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
        int4_quant_word_t q = 0;
#ifdef INT4_INTEGRATED_TOP
        const int scale_lane =
            activation_group & (INT4_OUTPUTS_PER_WORD - 1);
        float sx = 0.0f;
        if (stream_activation) {
            q = input_quantized_stream.read();
            sx = input_scale_stream.read();
            quantized[activation_group] = q;
            streamed_scale_word >>= 32;
            streamed_scale_word.range(511, 480) =
                int4_float_to_bits(sx);
            if (scale_lane == INT4_OUTPUTS_PER_WORD - 1) {
                packed_scales[
                    activation_group / INT4_OUTPUTS_PER_WORD] =
                        streamed_scale_word;
            }
        } else {
            q = quantized[activation_group];
            if (scale_lane == 0) {
                cached_scale_word =
                    packed_scales[
                        activation_group / INT4_OUTPUTS_PER_WORD];
            }
            sx = int4_bits_to_float(
                cached_scale_word.range(31, 0));
            cached_scale_word >>= 32;
        }
#else
        q = quantized[activation_group];
        const float sx = scales[activation_group];
#endif
        if (active_0) {
            quantized_pe0.write(q);
            scale_pe0.write(sx);
        }
        if (active_1) {
            quantized_pe1.write(q);
            scale_pe1.write(sx);
        }
        if (active_2) {
            quantized_pe2.write(q);
            scale_pe2.write(sx);
        }
        if (active_3) {
            quantized_pe3.write(q);
            scale_pe3.write(sx);
        }
    }
#ifdef INT4_INTEGRATED_TOP
    // INT4_HIDDEN_DIM/G32 is 344, so the final packed scale word contains
    // only eight entries.  Align that partial word to the LSBs exactly as a
    // consumer that shifts right by 32 expects.
    const int remaining_scale_lanes =
        input_groups & (INT4_OUTPUTS_PER_WORD - 1);
    if (stream_activation && remaining_scale_lanes != 0) {
        streamed_scale_word >>=
            32 * (INT4_OUTPUTS_PER_WORD - remaining_scale_lanes);
        packed_scales[input_groups / INT4_OUTPUTS_PER_WORD] =
            streamed_scale_word;
    }
#endif
}

template <int PE_ID>
static void int4_cache_and_replay_activation(
    hls::stream<int4_quant_word_t>& seed_activation_stream,
    hls::stream<float>& seed_scale_stream,
    hls::stream<int4_quant_word_t>& replay_activation_stream,
    hls::stream<float>& replay_scale_stream,
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_quant_word_t activation_cache[INT4_MAX_INPUT_GROUPS];
    float scale_cache[INT4_MAX_INPUT_GROUPS];
#pragma HLS BIND_STORAGE variable=activation_cache type=ram_1p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=scale_cache type=ram_1p impl=bram latency=1

    const int input_groups = input_tiles * INT4_GROUPS_PER_TILE;

cache_local_activation_loop:
    for (int group = 0; group < input_groups; ++group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
        activation_cache[group] = seed_activation_stream.read();
        scale_cache[group] = seed_scale_stream.read();
    }

replay_local_activation_tile_loop:
    for (int local_tile = 0; local_tile < local_tiles; ++local_tile) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=63
    replay_local_activation_group_loop:
        for (int group = 0; group < input_groups; ++group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
            replay_activation_stream.write(activation_cache[group]);
            replay_scale_stream.write(scale_cache[group]);
        }
    }
}

static void int4_stream_pe_inputs(
    const int4_weight_word_t* weight_mem,
#ifndef INT4_INTEGRATED_TOP
    const int4_weight_scale_word_t* scale_mem,
    const int4_output_word_t* output_mem,
#endif
    hls::stream<int4_weight_word_t>& weight_stream,
#ifndef INT4_INTEGRATED_TOP
    hls::stream<int4_weight_scale_word_t>&
        packed_scale_stream,
    hls::stream<int4_output_word_t>& residual_stream,
#endif
    int tile_count
#ifndef INT4_INTEGRATED_TOP
    ,
    int output_words,
    bool fuse_residual
#endif
) {
#pragma HLS INLINE off
#ifndef INT4_INTEGRATED_TOP
    const int scale_words =
        (tile_count + INT4_WEIGHT_SCALES_PER_WORD - 1) /
        INT4_WEIGHT_SCALES_PER_WORD;

stream_scale_word_loop:
    for (int word = 0; word < scale_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=4 max=32
        packed_scale_stream.write(scale_mem[word]);
    }

    if (fuse_residual) {
    stream_residual_word_loop:
        for (int word = 0; word < output_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=64 max=64
            residual_stream.write(output_mem[word]);
        }
    }
#endif

    const int total_words =
        tile_count * INT4_WEIGHT_WORDS_PER_TILE;

// This is deliberately one flat, unit-stride loop.  Each 128x256 tile owns
// exactly 256 consecutive 512-bit words, matching max_read_burst_length=256.
stream_weight_word_loop:
    for (int word = 0; word < total_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=32768 max=258048
        weight_stream.write(weight_mem[word]);
    }
}

static void int4_stream_integer_blocks(
    hls::stream<int4_weight_word_t>& weight_stream,
    hls::stream<int4_quant_word_t>& activation_stream,
    hls::stream<int4_group_block_t>& group_stream,
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE off

integer_local_tile_loop:
    for (int local_tile = 0; local_tile < local_tiles; ++local_tile) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=63
        integer_col_tile_loop:
            for (int col_tile = 0;
                 col_tile < input_tiles;
                 ++col_tile) {
#pragma HLS LOOP_TRIPCOUNT min=16 max=43
                integer_group_loop:
                    for (int group = 0;
                         group < INT4_GROUPS_PER_TILE;
                         ++group) {
                        const int activation_group =
                            col_tile * INT4_GROUPS_PER_TILE + group;
                        int4_quant_word_t act_word =
                            activation_stream.read();

                    integer_row_block_loop:
                        for (int row_block = 0;
                             row_block < INT4_ROW_BLOCKS;
                             ++row_block) {
#pragma HLS PIPELINE II=1
                            int4_weight_word_t weight_word =
                                weight_stream.read();
                            int4_packed_acc_t pair_sum[2];
#pragma HLS ARRAY_PARTITION variable=pair_sum complete
                            pair_sum[0] = 0;
                            pair_sum[1] = 0;

                        integer_mac_lane_loop:
                            for (int lane = 0;
                                 lane < INT4_GROUP_SIZE;
                                 ++lane) {
#pragma HLS UNROLL
                                int4_activation_t activation =
                                    (int4_activation_t)act_word.range(
                                        15 * lane + 14,
                                        15 * lane);

                            integer_mac_pair_loop:
                                for (int pair = 0; pair < 2; ++pair) {
#pragma HLS UNROLL
                                    ap_uint<8> pair_bits =
                                        weight_word.range(
                                            16 * lane + 8 * pair + 7,
                                            16 * lane + 8 * pair);
                                    int4_weight_t high =
                                        (int4_weight_t)pair_bits.range(7, 4);
                                    int4_weight_t low =
                                        (int4_weight_t)pair_bits.range(3, 0);
                                    int4_packed_product_t packed_product =
                                        int4_pack_two_weights(high, low) *
                                        activation;
#pragma HLS BIND_OP variable=packed_product op=mul impl=dsp latency=4
                                    pair_sum[pair] += packed_product;
                                }
                            }

                            int4_group_acc_t r0, r1, r2, r3;
                            int4_unpack_pair_sum(pair_sum[0], r0, r1);
                            int4_unpack_pair_sum(pair_sum[1], r2, r3);

                            int4_group_block_t result = 0;
                            result.range(22, 0) =
                                (ap_uint<23>)r0;
                            result.range(45, 23) =
                                (ap_uint<23>)r1;
                            result.range(68, 46) =
                                (ap_uint<23>)r2;
                            result.range(91, 69) =
                                (ap_uint<23>)r3;
                            group_stream.write(result);
                        }
                    }
            }
    }
}

using int4_final_row_block_t = ap_uint<128>;

static void int4_dequantize_final_blocks(
    hls::stream<int4_group_block_t>& group_stream,
    hls::stream<float>& activation_scale_stream,
    hls::stream<int4_final_row_block_t>& final_block_stream,
#ifdef INT4_INTEGRATED_TOP
    const int4_weight_scale_word_t* scale_mem,
#else
    hls::stream<int4_weight_scale_word_t>&
        packed_scale_stream,
#endif
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE off

    float partial[INT4_TILE_ROWS];
#pragma HLS ARRAY_PARTITION variable=partial cyclic factor=4
    int4_weight_scale_word_t packed_scale_word = 0;
    ap_uint<6> scale_lane = 0;
#ifdef INT4_INTEGRATED_TOP
    int scale_word_index = 0;
#endif

dequant_local_tile_loop:
    for (int local_tile = 0; local_tile < local_tiles; ++local_tile) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=63
        const int block_count =
            input_tiles * INT4_WEIGHT_WORDS_PER_TILE;
        float weight_scale = 0.0f;
        float combined_scale = 0.0f;

    // One pipeline spans every col-tile, G32 and row-block belonging to an
    // output tile.  Keeping scale state across the flat loop removes the
    // fourteen-cycle pipeline drain previously paid at every 128x256 tile.
    dequant_flat_block_loop:
        for (int block_index = 0;
             block_index < block_count;
             ++block_index) {
#pragma HLS LOOP_TRIPCOUNT min=4096 max=11008
#pragma HLS BIND_OP variable=combined_scale op=mul impl=dsp
#pragma HLS PIPELINE II=1
            const int row_block =
                block_index & (INT4_ROW_BLOCKS - 1);
            const int group =
                (block_index / INT4_ROW_BLOCKS) &
                (INT4_GROUPS_PER_TILE - 1);
            const int col_tile =
                block_index / INT4_WEIGHT_WORDS_PER_TILE;
            if (row_block == 0) {
                if (group == 0) {
                    if (scale_lane == 0) {
#ifdef INT4_INTEGRATED_TOP
                        packed_scale_word =
                            scale_mem[scale_word_index];
                        ++scale_word_index;
#else
                        packed_scale_word =
                            packed_scale_stream.read();
#endif
                    }
                    weight_scale =
                        int4_half_bits_to_float(
                            packed_scale_word.range(15, 0));
                    packed_scale_word >>= INT4_WEIGHT_SCALE_BITS;
                    scale_lane =
                        (scale_lane ==
                         INT4_WEIGHT_SCALES_PER_WORD - 1)
                            ? (ap_uint<6>)0
                            : (ap_uint<6>)(scale_lane + 1);
                }
                const float sx =
                    activation_scale_stream.read();
                combined_scale = weight_scale * sx;
            }

            const bool initialize =
                (col_tile == 0) && (group == 0);
            const bool final_input_group =
                block_index >= block_count - INT4_ROW_BLOCKS;
            int4_group_block_t integer_block =
                group_stream.read();
            int4_final_row_block_t final_block = 0;

        dequant_lane_loop:
            for (int lane = 0;
                 lane < INT4_ROW_BLOCK;
                 ++lane) {
#pragma HLS UNROLL
                const int row =
                    row_block * INT4_ROW_BLOCK + lane;
                int4_group_acc_t integer_sum =
                    integer_block.range(
                        23 * lane + 22,
                        23 * lane);
                float contribution =
                    (float)integer_sum *
                    combined_scale;
#pragma HLS BIND_OP variable=contribution op=mul impl=dsp
                const float next_value =
                    initialize
                        ? contribution
                        : partial[row] + contribution;
                partial[row] = next_value;
                if (final_input_group) {
                    final_block.range(
                        32 * lane + 31,
                        32 * lane) =
                            int4_float_to_bits(next_value);
                }
            }
            if (final_input_group) {
                final_block_stream.write(final_block);
            }
        }
    }
}

static void int4_pack_dequantized_outputs(
    hls::stream<int4_final_row_block_t>& final_block_stream,
    hls::stream<int4_output_word_t>& output_stream,
    int local_tiles,
    bool output_fxp
) {
#pragma HLS INLINE off

    const int output_values = local_tiles * INT4_TILE_ROWS;
    int4_final_row_block_t final_block = 0;
    int4_output_word_t packed = 0;

pack_dequantized_value_loop:
    for (int value_index = 0;
         value_index < output_values;
         ++value_index) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1024 max=8064
        if ((value_index & (INT4_ROW_BLOCK - 1)) == 0) {
            final_block = final_block_stream.read();
        }
        const ap_uint<32> fp32_bits = final_block.range(31, 0);
        final_block >>= 32;
        packed >>= 32;
        packed.range(511, 480) =
            output_fxp
                ? int4_float_to_fxp_bits(
                      int4_bits_to_float(fp32_bits))
                : fp32_bits;
        if ((value_index & (INT4_OUTPUTS_PER_WORD - 1)) ==
            INT4_OUTPUTS_PER_WORD - 1) {
            output_stream.write(packed);
        }
    }
}

static void int4_write_outputs(
    hls::stream<int4_output_word_t>& output_stream,
#ifndef INT4_INTEGRATED_TOP
    hls::stream<int4_output_word_t>& residual_stream,
#endif
    int4_output_word_t* output_mem,
    int local_tiles,
    bool fuse_residual
) {
#pragma HLS INLINE off
    const int output_words =
        local_tiles * INT4_OUTPUT_WORDS_PER_TILE;

    if (!fuse_residual) {
    write_output_direct_loop:
        for (int word = 0; word < output_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=64 max=504
            const int4_output_word_t branch_word =
                output_stream.read();
            output_mem[word] = branch_word;
        }
    } else {
    write_output_fused_loop:
        for (int word = 0; word < output_words; ++word) {
#pragma HLS LOOP_FLATTEN off
#pragma HLS LOOP_TRIPCOUNT min=64 max=64
            const int4_output_word_t branch_word =
                output_stream.read();
            const int4_output_word_t residual_word =
#ifdef INT4_INTEGRATED_TOP
                output_mem[word];
#else
                residual_stream.read();
#endif
            float branch_values[INT4_OUTPUTS_PER_WORD];
            float residual_values[INT4_OUTPUTS_PER_WORD];
            float sums[INT4_OUTPUTS_PER_WORD];
#pragma HLS ARRAY_PARTITION variable=branch_values complete
#pragma HLS ARRAY_PARTITION variable=residual_values complete
#pragma HLS ARRAY_PARTITION variable=sums complete

        fused_residual_unpack_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
#pragma HLS UNROLL
                branch_values[lane] =
                    int4_bits_to_float(
                        branch_word.range(
                            32 * lane + 31, 32 * lane));
                residual_values[lane] =
                    int4_bits_to_float(
                        residual_word.range(
                            32 * lane + 31, 32 * lane));
            }

        fused_residual_add_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
#pragma HLS PIPELINE II=1
                sums[lane] =
                    residual_values[lane] + branch_values[lane];
            }

            int4_output_word_t sum_word = 0;
        fused_residual_pack_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
#pragma HLS UNROLL
                sum_word.range(32 * lane + 31, 32 * lane) =
                    int4_float_to_bits(sums[lane]);
            }
            output_mem[word] = sum_word;
        }
    }
}

// Only this compact, registered command is allowed to cross from the shared
// controller island into a linear PE.  Passing four C integers/booleans
// directly to every PE lets HLS create one high-fanout control cone spanning
// all SLRs.  The per-PE command FIFOs below make the crossing point explicit
// in both generated RTL and the post-synthesis floorplan.
typedef ap_uint<14> int4_linear_pe_command_t;

static int4_linear_pe_command_t int4_pack_linear_pe_command(
    int local_tiles,
    int input_tiles,
    bool output_fxp,
    bool fuse_residual
) {
#pragma HLS INLINE
    int4_linear_pe_command_t command = 0;
    command.range(5, 0) = (ap_uint<6>)local_tiles;
    command.range(11, 6) = (ap_uint<6>)input_tiles;
    command[12] = output_fxp;
    command[13] = fuse_residual;
    return command;
}

static void int4_broadcast_linear_commands(
    hls::stream<int4_linear_pe_command_t>& linear_command_pe0,
    hls::stream<int4_linear_pe_command_t>& linear_command_pe1,
    hls::stream<int4_linear_pe_command_t>& linear_command_pe2,
    hls::stream<int4_linear_pe_command_t>& linear_command_pe3,
    int local_tiles_0,
    int local_tiles_1,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles,
    bool output_fxp,
    bool fuse_residual
) {
#pragma HLS INLINE off
    linear_command_pe0.write(int4_pack_linear_pe_command(
        local_tiles_0, input_tiles, output_fxp, fuse_residual));
    linear_command_pe1.write(int4_pack_linear_pe_command(
        local_tiles_1, input_tiles, output_fxp, fuse_residual));
    linear_command_pe2.write(int4_pack_linear_pe_command(
        local_tiles_2, input_tiles, output_fxp, fuse_residual));
    linear_command_pe3.write(int4_pack_linear_pe_command(
        local_tiles_3, input_tiles, output_fxp, fuse_residual));
}

template <int PE_ID>
static void int4_run_pe_dataflow(
    const int4_weight_word_t* weight_mem,
    const int4_weight_scale_word_t* scale_mem,
    hls::stream<int4_quant_word_t>& activation_stream,
    hls::stream<float>& activation_scale_stream,
    hls::stream<int4_linear_pe_command_t>& command_stream,
    int4_output_word_t* output_mem
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    // The command FIFO is consumed by this PE's dataflow entry process.  This
    // preserves a registered SLR boundary without the extra ap_ctrl_hs
    // wrapper whose call path was estimated at 4.190 ns.
    const int4_linear_pe_command_t command = command_stream.read();
    const ap_uint<6> local_tiles = command.range(5, 0);
    const ap_uint<6> input_tiles = command.range(11, 6);
    const bool output_fxp = command[12];
    const bool fuse_residual = command[13];

    hls::stream<int4_weight_word_t> weight_stream;
#ifndef INT4_INTEGRATED_TOP
    hls::stream<int4_weight_scale_word_t>
        packed_scale_stream;
    hls::stream<int4_output_word_t> residual_stream;
#endif
    hls::stream<int4_group_block_t> group_stream;
    hls::stream<int4_quant_word_t> replay_activation_stream;
    hls::stream<float> replay_scale_stream;
    hls::stream<int4_final_row_block_t> final_block_stream;
    hls::stream<int4_output_word_t> output_stream;
#pragma HLS STREAM variable=weight_stream depth=16384
#ifndef INT4_INTEGRATED_TOP
#pragma HLS STREAM variable=packed_scale_stream depth=32
#pragma HLS STREAM variable=residual_stream depth=64
#endif
#pragma HLS STREAM variable=group_stream depth=64
#pragma HLS STREAM variable=replay_activation_stream depth=2
#pragma HLS STREAM variable=replay_scale_stream depth=2
#pragma HLS STREAM variable=final_block_stream depth=32
#pragma HLS STREAM variable=output_stream depth=16
#pragma HLS BIND_STORAGE variable=weight_stream type=fifo impl=uram
#ifndef INT4_INTEGRATED_TOP
#pragma HLS BIND_STORAGE variable=packed_scale_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=residual_stream type=fifo impl=bram
#endif
#pragma HLS BIND_STORAGE variable=group_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=replay_activation_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=replay_scale_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=final_block_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=output_stream type=fifo impl=bram
    const int tile_count = local_tiles * input_tiles;
#ifndef INT4_INTEGRATED_TOP
    const int output_words =
        local_tiles * INT4_OUTPUT_WORDS_PER_TILE;
#endif

    int4_stream_pe_inputs(
        weight_mem,
#ifndef INT4_INTEGRATED_TOP
        scale_mem,
        output_mem,
#endif
        weight_stream,
#ifndef INT4_INTEGRATED_TOP
        packed_scale_stream,
        residual_stream,
#endif
        tile_count
#ifndef INT4_INTEGRATED_TOP
        ,
        output_words, fuse_residual
#endif
    );
    int4_cache_and_replay_activation<PE_ID>(
        activation_stream,
        activation_scale_stream,
        replay_activation_stream,
        replay_scale_stream,
        local_tiles,
        input_tiles);
    int4_stream_integer_blocks(
        weight_stream,
        replay_activation_stream,
        group_stream,
        local_tiles,
        input_tiles);
    int4_dequantize_final_blocks(
        group_stream,
        replay_scale_stream,
        final_block_stream,
#ifdef INT4_INTEGRATED_TOP
        scale_mem,
#else
        packed_scale_stream,
#endif
        local_tiles,
        input_tiles);
    int4_pack_dequantized_outputs(
        final_block_stream,
        output_stream,
        local_tiles,
        output_fxp);
    int4_write_outputs(
        output_stream,
#ifndef INT4_INTEGRATED_TOP
        residual_stream,
#endif
        output_mem,
        (int)local_tiles, fuse_residual);
}

static void int4_run_four_pes(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
#ifdef INT4_INTEGRATED_TOP
    int4_quant_word_t quantized[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        packed_scales[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
#else
    const int4_quant_word_t quantized[INT4_MAX_INPUT_GROUPS],
    const float scales[INT4_MAX_INPUT_GROUPS],
#endif
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    int local_tiles_0,
    int local_tiles_1,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles,
    bool output_fxp,
    bool fuse_residual
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_pe0;
    hls::stream<int4_quant_word_t> quantized_pe1;
    hls::stream<int4_quant_word_t> quantized_pe2;
    hls::stream<int4_quant_word_t> quantized_pe3;
    hls::stream<float> activation_scale_pe0;
    hls::stream<float> activation_scale_pe1;
    hls::stream<float> activation_scale_pe2;
    hls::stream<float> activation_scale_pe3;
    hls::stream<int4_linear_pe_command_t> linear_command_pe0;
    hls::stream<int4_linear_pe_command_t> linear_command_pe1;
    hls::stream<int4_linear_pe_command_t> linear_command_pe2;
    hls::stream<int4_linear_pe_command_t> linear_command_pe3;
#pragma HLS STREAM variable=quantized_pe0 depth=2
#pragma HLS STREAM variable=quantized_pe1 depth=2
#pragma HLS STREAM variable=quantized_pe2 depth=2
#pragma HLS STREAM variable=quantized_pe3 depth=2
#pragma HLS STREAM variable=activation_scale_pe0 depth=2
#pragma HLS STREAM variable=activation_scale_pe1 depth=2
#pragma HLS STREAM variable=activation_scale_pe2 depth=2
#pragma HLS STREAM variable=activation_scale_pe3 depth=2
#pragma HLS STREAM variable=linear_command_pe0 depth=2
#pragma HLS STREAM variable=linear_command_pe1 depth=2
#pragma HLS STREAM variable=linear_command_pe2 depth=2
#pragma HLS STREAM variable=linear_command_pe3 depth=2
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe3 type=fifo impl=srl

    int4_broadcast_linear_commands(
        linear_command_pe0, linear_command_pe1,
        linear_command_pe2, linear_command_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        input_tiles, output_fxp, fuse_residual);

    int4_broadcast_activation(
#ifdef INT4_INTEGRATED_TOP
        quantized,
        packed_scales,
        input_quantized_stream, input_scale_stream,
        stream_activation,
#else
        quantized,
        scales,
#endif
        quantized_pe0, quantized_pe1,
        quantized_pe2, quantized_pe3,
        activation_scale_pe0, activation_scale_pe1,
        activation_scale_pe2, activation_scale_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        input_tiles);

    int4_run_pe_dataflow<0>(
        weight_pe0, scale_pe0,
        quantized_pe0, activation_scale_pe0,
        linear_command_pe0, output_pe0);
    int4_run_pe_dataflow<1>(
        weight_pe1, scale_pe1,
        quantized_pe1, activation_scale_pe1,
        linear_command_pe1, output_pe1);
    int4_run_pe_dataflow<2>(
        weight_pe2, scale_pe2,
        quantized_pe2, activation_scale_pe2,
        linear_command_pe2, output_pe2);
    int4_run_pe_dataflow<3>(
        weight_pe3, scale_pe3,
        quantized_pe3, activation_scale_pe3,
        linear_command_pe3, output_pe3);
}

static void int4_advance_controller_after_linear(
    Int4Controller& controller
) {
#pragma HLS INLINE
    switch ((int)controller.linear_mode) {
    case INT4_LINEAR_Q:
        controller.linear_mode = INT4_LINEAR_K;
        break;
    case INT4_LINEAR_K:
        controller.linear_mode = INT4_LINEAR_V;
        break;
    case INT4_LINEAR_V:
        controller.run_linear = INT4_LAZY;
        controller.run_rope = INT4_RUN;
        break;
    case INT4_LINEAR_O:
        controller.run_linear = INT4_LAZY;
        // The O projection writer has already added the branch to the
        // residual in place.  Continue directly with the FFN RMSNorm.
        controller.rmsnorm_mode = INT4_RMSNORM_FFN;
        controller.run_rmsnorm = INT4_RUN;
        break;
    case INT4_LINEAR_GATE:
        controller.linear_mode = INT4_LINEAR_UP;
        break;
    case INT4_LINEAR_UP:
        controller.run_linear = INT4_LAZY;
        controller.run_swiglu = INT4_RUN;
        break;
    case INT4_LINEAR_DOWN:
        controller.run_linear = INT4_LAZY;
        // DOWN is also accumulated in the linear output writer, eliminating
        // a separate DDR write/read residual pass.
        controller.run_rmsnorm = INT4_RUN;
        if ((int)controller.layer_index + 1 < INT4_NUM_LAYERS) {
            controller.layer_index =
                (ap_uint<6>)(controller.layer_index + 1);
            controller.rmsnorm_mode = INT4_RMSNORM_ATTENTION;
        } else {
            controller.layer_index = INT4_NUM_LAYERS;
            controller.rmsnorm_mode = INT4_RMSNORM_FINAL;
        }
        break;
    case INT4_LINEAR_LOGITS:
        controller.run_linear = INT4_LAZY;
        controller.exit = INT4_RUN;
        break;
    default:
        controller.run_linear = INT4_LAZY;
        break;
    }
}

static void int4_advance_model_offsets_after_linear(
    Int4Controller& controller
) {
#pragma HLS INLINE
    ap_uint<24> weight_words = 0;
    ap_uint<11> scale_words = 0;

    switch ((int)controller.linear_mode) {
    case INT4_LINEAR_Q:
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
    case INT4_LINEAR_O:
        weight_words = 8 * 16 * INT4_WEIGHT_WORDS_PER_TILE;
        scale_words = 4;
        break;
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        weight_words = 22 * 16 * INT4_WEIGHT_WORDS_PER_TILE;
        scale_words = 11;
        break;
    case INT4_LINEAR_DOWN:
        weight_words = 8 * 43 * INT4_WEIGHT_WORDS_PER_TILE;
        scale_words = 11;
        break;
    case INT4_LINEAR_LOGITS:
        weight_words = 63 * 16 * INT4_WEIGHT_WORDS_PER_TILE;
        scale_words = 32;
        break;
    default:
        break;
    }

    controller.weight_word_offset += weight_words;
    controller.weight_scale_word_offset += scale_words;
}

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
) {
#pragma HLS INTERFACE m_axi port=weight_pe0 bundle=gmem0 offset=slave \
    depth=INT4_MAX_LOCAL_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=scale_pe0 bundle=gmem0 offset=slave \
    depth=INT4_MAX_LOCAL_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=output_pe0 bundle=gmem0 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=activation_q bundle=gmem0 offset=slave \
    depth=INT4_MAX_INPUT_GROUPS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=activation_scale bundle=gmem0 offset=slave \
    depth=INT4_MAX_ACTIVATION_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=weight_pe1 bundle=gmem1 offset=slave \
    depth=INT4_MAX_LOCAL_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=scale_pe1 bundle=gmem1 offset=slave \
    depth=INT4_MAX_LOCAL_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=output_pe1 bundle=gmem1 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=weight_pe2 bundle=gmem2 offset=slave \
    depth=INT4_MAX_LOCAL_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=scale_pe2 bundle=gmem2 offset=slave \
    depth=INT4_MAX_LOCAL_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=output_pe2 bundle=gmem2 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=weight_pe3 bundle=gmem3 offset=slave \
    depth=INT4_MAX_LOCAL_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=scale_pe3 bundle=gmem3 offset=slave \
    depth=INT4_MAX_LOCAL_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=output_pe3 bundle=gmem3 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=1

#pragma HLS INTERFACE s_axilite port=weight_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=weight_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=weight_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=weight_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=scale_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=scale_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=scale_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=scale_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=activation_q bundle=control
#pragma HLS INTERFACE s_axilite port=activation_scale bundle=control
#pragma HLS INTERFACE s_axilite port=output_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=output_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=output_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=output_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=controller bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (controller.run_linear != INT4_RUN) {
        return;
    }

    const Int4LinearShape shape =
        int4_linear_shape_from_controller(controller);
    if (shape.output_tiles <= 0 || shape.input_tiles <= 0) {
        controller.run_linear = INT4_LAZY;
        return;
    }

    const bool output_fxp =
        controller.linear_mode == INT4_LINEAR_Q ||
        controller.linear_mode == INT4_LINEAR_K ||
        controller.linear_mode == INT4_LINEAR_V;
    const bool fuse_residual =
        controller.linear_mode == INT4_LINEAR_O ||
        controller.linear_mode == INT4_LINEAR_DOWN;
    const int local_tiles_0 =
        int4_local_tile_count(shape.output_tiles, 0);
    const int local_tiles_1 =
        int4_local_tile_count(shape.output_tiles, 1);
    const int local_tiles_2 =
        int4_local_tile_count(shape.output_tiles, 2);
    const int local_tiles_3 =
        int4_local_tile_count(shape.output_tiles, 3);

#ifndef INT4_INTEGRATED_TOP
    // A standalone linear top exposes activation and weight through gmem0.
    // Cache the activation before DATAFLOW so only the weight reader owns
    // that AXI master while the four PEs are running.
    static int4_quant_word_t quantized[INT4_MAX_INPUT_GROUPS];
    static float scales[INT4_MAX_INPUT_GROUPS];
#pragma HLS BIND_STORAGE variable=quantized type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=scales type=ram_1p impl=bram
    const int input_groups =
        shape.input_tiles * INT4_GROUPS_PER_TILE;
    int4_load_activation(
        activation_q, activation_scale,
        quantized, scales, input_groups);
#endif

    // The online A15/G32 buffers are already on chip in the integrated
    // controller.  Broadcast directly from them instead of first copying
    // all groups to a second BRAM cache.  The broadcaster is much faster
    // than the one-weight-word/cycle PE consumers, so these reads remain
    // completely hidden behind the INT4 stream.
#ifdef INT4_INTEGRATED_TOP
    hls::stream<int4_quant_word_t> unused_quantized_stream;
    hls::stream<float> unused_scale_stream;
#pragma HLS STREAM variable=unused_quantized_stream depth=2
#pragma HLS STREAM variable=unused_scale_stream depth=2
#endif
    int4_run_four_pes(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
#ifdef INT4_INTEGRATED_TOP
        const_cast<int4_quant_word_t*>(activation_q),
        const_cast<int4_scale_word_t*>(activation_scale),
        unused_quantized_stream, unused_scale_stream, false,
#else
        quantized, scales,
#endif
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles,
        output_fxp,
        fuse_residual);

    int4_advance_model_offsets_after_linear(controller);
    int4_advance_controller_after_linear(controller);
}

#ifdef INT4_INTEGRATED_TOP
static void int4_run_four_pes_optional_rms(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t activation_q[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        activation_scale[INT4_MAX_ACTIVATION_SCALE_WORDS],
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
    int local_tiles_0,
    int local_tiles_1,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles,
    bool output_fxp,
    bool fuse_residual
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> rms_quantized_stream;
    hls::stream<float> rms_scale_stream;
#pragma HLS STREAM variable=rms_quantized_stream depth=4
#pragma HLS STREAM variable=rms_scale_stream depth=4
#pragma HLS BIND_STORAGE variable=rms_quantized_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=rms_scale_stream type=fifo impl=srl

    int4_rmsnorm_quantize_stream_4pe(
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        fuse_rms, rms_quantized_stream, rms_scale_stream);
    int4_run_four_pes(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        activation_q, activation_scale,
        rms_quantized_stream, rms_scale_stream, fuse_rms,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        input_tiles, output_fxp, fuse_residual);
}

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
) {
#pragma HLS INLINE off
    if (controller.run_linear != INT4_RUN) {
        return;
    }

    const Int4LinearShape shape =
        int4_linear_shape_from_controller(controller);
    if (shape.output_tiles <= 0 || shape.input_tiles <= 0) {
        controller.run_linear = INT4_LAZY;
        return;
    }

    const bool output_fxp =
        controller.linear_mode == INT4_LINEAR_Q ||
        controller.linear_mode == INT4_LINEAR_K ||
        controller.linear_mode == INT4_LINEAR_V;
    const bool fuse_residual =
        controller.linear_mode == INT4_LINEAR_O ||
        controller.linear_mode == INT4_LINEAR_DOWN;
    const int local_tiles_0 =
        int4_local_tile_count(shape.output_tiles, 0);
    const int local_tiles_1 =
        int4_local_tile_count(shape.output_tiles, 1);
    const int local_tiles_2 =
        int4_local_tile_count(shape.output_tiles, 2);
    const int local_tiles_3 =
        int4_local_tile_count(shape.output_tiles, 3);

    int4_run_four_pes_optional_rms(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        activation_q, activation_scale,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        fuse_rms,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles, output_fxp, fuse_residual);

    int4_advance_model_offsets_after_linear(controller);
    int4_advance_controller_after_linear(controller);
}

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
) {
#pragma HLS INLINE off
    if (controller.run_linear != INT4_RUN) {
        return;
    }

    const Int4LinearShape shape =
        int4_linear_shape_from_controller(controller);
    if (shape.output_tiles <= 0 || shape.input_tiles <= 0) {
        controller.run_linear = INT4_LAZY;
        return;
    }

    const bool output_fxp =
        controller.linear_mode == INT4_LINEAR_Q ||
        controller.linear_mode == INT4_LINEAR_K ||
        controller.linear_mode == INT4_LINEAR_V;
    const bool fuse_residual =
        controller.linear_mode == INT4_LINEAR_O ||
        controller.linear_mode == INT4_LINEAR_DOWN;
    const int local_tiles_0 =
        int4_local_tile_count(shape.output_tiles, 0);
    const int local_tiles_1 =
        int4_local_tile_count(shape.output_tiles, 1);
    const int local_tiles_2 =
        int4_local_tile_count(shape.output_tiles, 2);
    const int local_tiles_3 =
        int4_local_tile_count(shape.output_tiles, 3);

    int4_run_four_pes(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        activation_q, activation_scale,
        input_quantized_stream, input_scale_stream,
        stream_activation,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles, output_fxp, fuse_residual);

    int4_advance_model_offsets_after_linear(controller);
    int4_advance_controller_after_linear(controller);
}
#endif
