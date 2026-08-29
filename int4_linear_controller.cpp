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

static Int4LinearShape int4_linear_shape_from_mode(
    ap_uint<3> linear_mode
) {
#pragma HLS INLINE
    Int4LinearShape shape;
    shape.output_rows = 0;
    shape.input_cols = 0;

    switch ((int)linear_mode) {
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

Int4LinearShape int4_linear_shape_from_controller(
    const Int4Controller& controller
) {
#pragma HLS INLINE
    return int4_linear_shape_from_mode(
        (ap_uint<3>)controller.linear_mode);
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
static void int4_distribute_activation_pairs(
#ifdef INT4_INTEGRATED_TOP
    int4_quant_word_t* quantized,
    int4_scale_word_t* packed_scales,
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
    bool cache_stream_activation,
#else
    const int4_quant_word_t* quantized,
    const float* scales,
#endif
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
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
    const bool active_01 = local_tiles_0 > 0 || local_tiles_1 > 0;
    const bool active_23 = local_tiles_2 > 0 || local_tiles_3 > 0;
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
            if (cache_stream_activation) {
                quantized[activation_group] = q;
                streamed_scale_word >>= 32;
                streamed_scale_word.range(511, 480) =
                    int4_float_to_bits(sx);
                if (scale_lane == INT4_OUTPUTS_PER_WORD - 1) {
                    packed_scales[
                        activation_group / INT4_OUTPUTS_PER_WORD] =
                            streamed_scale_word;
                }
            }
        } else {
            q = quantized[activation_group];
            if (scale_lane == 0) {
                cached_scale_word =
                    packed_scales[
                        activation_group / INT4_OUTPUTS_PER_WORD];
            }
            const float sx = int4_bits_to_float(
                cached_scale_word.range(31, 0));
            cached_scale_word >>= 32;
        }
#else
        q = quantized[activation_group];
        const float sx = scales[activation_group];
#endif
        if (active_01) {
            quantized_pair01.write(q);
            scale_pair01.write(sx);
        }
        if (active_23) {
            quantized_pair23.write(q);
            scale_pair23.write(sx);
        }
    }
#ifdef INT4_INTEGRATED_TOP
    // INT4_HIDDEN_DIM/G32 is 344, so the final packed scale word contains
    // only eight entries.  Align that partial word to the LSBs exactly as a
    // consumer that shifts right by 32 expects.
    const int remaining_scale_lanes =
        input_groups & (INT4_OUTPUTS_PER_WORD - 1);
    if (stream_activation && cache_stream_activation &&
        remaining_scale_lanes != 0) {
        streamed_scale_word >>=
            32 * (INT4_OUTPUTS_PER_WORD - remaining_scale_lanes);
        packed_scales[input_groups / INT4_OUTPUTS_PER_WORD] =
            streamed_scale_word;
    }
#endif
}

#ifdef INT4_INTEGRATED_TOP
// Terminate one complete activation stream at each pair.  Both replay caches
// are local copies, so Q->K/V and GATE->UP no longer return to a shared BRAM
// island.  For streamed activations each pair consumes only its own already
// assembled stream; there is no 480-bit central distributor.
template <int FIRST_PE>
static void int4_prepare_activation_pair_body(
    int4_quant_word_t quantized_cache[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        scale_cache[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
    bool cache_stream_activation,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    int local_tiles_first,
    int local_tiles_second,
    int input_tiles
) {
#pragma HLS INLINE
    const bool active =
        local_tiles_first > 0 || local_tiles_second > 0;
    const int input_groups = input_tiles * INT4_GROUPS_PER_TILE;

    // Hoist the stream/cache selection outside the pipelined body.  In the
    // routed checkpoint the old per-iteration mux generated a sequential-init
    // control with 984 sinks (two 480-bit data cones).  Each loop below now
    // has one unconditional source and one pair-local destination.
    if (stream_activation) {
        int4_scale_word_t streamed_scale_word = 0;
    prepare_activation_pair_stream_loop:
        for (int activation_group = 0;
             activation_group < input_groups;
             ++activation_group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
            const int scale_lane =
                activation_group & (INT4_OUTPUTS_PER_WORD - 1);
            const int4_quant_word_t q = input_quantized_stream.read();
            const float sx = input_scale_stream.read();
            if (cache_stream_activation) {
                quantized_cache[activation_group] = q;
                streamed_scale_word >>= 32;
                streamed_scale_word.range(511, 480) =
                    int4_float_to_bits(sx);
                if (scale_lane == INT4_OUTPUTS_PER_WORD - 1) {
                    scale_cache[
                        activation_group / INT4_OUTPUTS_PER_WORD] =
                            streamed_scale_word;
                }
            }
            if (active) {
                quantized_pair.write(q);
                scale_pair.write(sx);
            }
        }

        const int remaining_scale_lanes =
            input_groups & (INT4_OUTPUTS_PER_WORD - 1);
        if (cache_stream_activation && remaining_scale_lanes != 0) {
            streamed_scale_word >>= 32 *
                (INT4_OUTPUTS_PER_WORD - remaining_scale_lanes);
            scale_cache[input_groups / INT4_OUTPUTS_PER_WORD] =
                streamed_scale_word;
        }
    } else if (active) {
        int4_scale_word_t cached_scale_word = 0;
    prepare_activation_pair_cache_loop:
        for (int activation_group = 0;
             activation_group < input_groups;
             ++activation_group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
            const int scale_lane =
                activation_group & (INT4_OUTPUTS_PER_WORD - 1);
            const int4_quant_word_t q =
                quantized_cache[activation_group];
            if (scale_lane == 0) {
                cached_scale_word =
                    scale_cache[
                        activation_group / INT4_OUTPUTS_PER_WORD];
            }
            const float sx = int4_bits_to_float(
                cached_scale_word.range(31, 0));
            cached_scale_word >>= 32;
            quantized_pair.write(q);
            scale_pair.write(sx);
        }
    }
}

static void int4_prepare_activation_pair01(
    int4_quant_word_t quantized_cache[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t scale_cache[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
    bool cache_stream_activation,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    int local_tiles_0,
    int local_tiles_1,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_prepare_activation_pair_body<0>(
        quantized_cache, scale_cache,
        input_quantized_stream, input_scale_stream,
        stream_activation, cache_stream_activation,
        quantized_pair, scale_pair,
        local_tiles_0, local_tiles_1, input_tiles);
}

static void int4_prepare_activation_pair23(
    int4_quant_word_t quantized_cache[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t scale_cache[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_stream,
    hls::stream<float>& input_scale_stream,
    bool stream_activation,
    bool cache_stream_activation,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_prepare_activation_pair_body<2>(
        quantized_cache, scale_cache,
        input_quantized_stream, input_scale_stream,
        stream_activation, cache_stream_activation,
        quantized_pair, scale_pair,
        local_tiles_2, local_tiles_3, input_tiles);
}
#endif

// Keep the architectural 480-bit word inside the pair island and the local
// PE.  The edge PE is reached through sixteen 30-bit registered beats, so the
// pair01->PE0 and pair23->PE3 links do not consume a 480-wire SLL bundle.
template <int EDGE_PE>
static void int4_broadcast_activation_pair_body(
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    hls::stream<int4_quant_word_t>& quantized_local,
    hls::stream<int4_activation_beat_t>& quantized_edge,
    hls::stream<float>& scale_local,
    hls::stream<float>& scale_edge,
    int local_tiles_local,
    int local_tiles_edge,
    int input_tiles
) {
#pragma HLS INLINE
    const bool active_local = local_tiles_local > 0;
    const bool active_edge = local_tiles_edge > 0;
    const int input_groups = input_tiles * INT4_GROUPS_PER_TILE;

broadcast_activation_pair_loop:
    for (int activation_group = 0;
         activation_group < input_groups;
         ++activation_group) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
        int4_quant_word_t q = 0;
        float sx = 0.0f;
        if (active_local || active_edge) {
            q = quantized_pair.read();
            sx = scale_pair.read();
        }
        if (active_local) {
            quantized_local.write(q);
            scale_local.write(sx);
        }
        if (active_edge) {
            scale_edge.write(sx);
            int4_quant_word_t remaining = q;
        broadcast_activation_edge_beat_loop:
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
}

static void int4_broadcast_activation_pair01(
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    hls::stream<int4_activation_beat_t>& quantized_pair01_to_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pair01_to_pe0,
    hls::stream<float>& scale_pe1,
    int local_tiles_0,
    int local_tiles_1,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_broadcast_activation_pair_body<0>(
        quantized_pair, scale_pair,
        quantized_pe1, quantized_pair01_to_pe0,
        scale_pe1, scale_pair01_to_pe0,
        local_tiles_1, local_tiles_0, input_tiles);
}

static void int4_broadcast_activation_pair23(
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair,
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_activation_beat_t>& quantized_pair23_to_pe3,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pair23_to_pe3,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_broadcast_activation_pair_body<3>(
        quantized_pair, scale_pair,
        quantized_pe2, quantized_pair23_to_pe3,
        scale_pe2, scale_pair23_to_pe3,
        local_tiles_2, local_tiles_3, input_tiles);
}

template <int PE_ID>
static void int4_deserialize_activation_edge_body(
    hls::stream<int4_activation_beat_t>& quantized_edge,
    hls::stream<float>& scale_edge,
    hls::stream<int4_quant_word_t>& quantized_local,
    hls::stream<float>& scale_local,
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE
    if (local_tiles <= 0) {
        return;
    }
    const int input_groups = input_tiles * INT4_GROUPS_PER_TILE;
deserialize_activation_edge_group_loop:
    for (int group = 0; group < input_groups; ++group) {
        const float sx = scale_edge.read();
        int4_quant_word_t q = 0;
    deserialize_activation_edge_beat_loop:
        for (int beat = 0;
             beat < INT4_ACTIVATION_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            const int4_activation_beat_t beat_value =
                quantized_edge.read();
            q >>= INT4_ACTIVATION_BEAT_BITS;
            q.range(
                INT4_QUANT_WORD_BITS - 1,
                INT4_QUANT_WORD_BITS - INT4_ACTIVATION_BEAT_BITS) =
                    beat_value;
        }
        quantized_local.write(q);
        scale_local.write(sx);
    }
}

static void int4_deserialize_activation_pe0(
    hls::stream<int4_activation_beat_t>& quantized_pair01_to_pe0,
    hls::stream<float>& scale_pair01_to_pe0,
    hls::stream<int4_quant_word_t>& quantized_pe0,
    hls::stream<float>& scale_pe0,
    int local_tiles_0,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_deserialize_activation_edge_body<0>(
        quantized_pair01_to_pe0, scale_pair01_to_pe0,
        quantized_pe0, scale_pe0,
        local_tiles_0, input_tiles);
}

static void int4_deserialize_activation_pe3(
    hls::stream<int4_activation_beat_t>& quantized_pair23_to_pe3,
    hls::stream<float>& scale_pair23_to_pe3,
    hls::stream<int4_quant_word_t>& quantized_pe3,
    hls::stream<float>& scale_pe3,
    int local_tiles_3,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_deserialize_activation_edge_body<3>(
        quantized_pair23_to_pe3, scale_pair23_to_pe3,
        quantized_pe3, scale_pe3,
        local_tiles_3, input_tiles);
}

template <int PE_ID>
static void int4_pe_activation_slice(
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
#pragma HLS BIND_STORAGE variable=activation_cache type=ram_1p impl=bram latency=2
#pragma HLS BIND_STORAGE variable=scale_cache type=ram_1p impl=bram latency=2

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
#pragma HLS LOOP_FLATTEN off
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=344
            replay_activation_stream.write(activation_cache[group]);
            replay_scale_stream.write(scale_cache[group]);
        }
    }
}

template <int PE_ID>
static void int4_pe_weight_slice(
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
// The routed design showed ap_block_pp0_stage0_subdone driving more than
// 640 loads in every PE.  This process is a DATAFLOW child with blocking
// stream I/O, so an FRP pipeline removes the distributed stall-enable tree.
#pragma HLS PIPELINE II=1 style=frp
#pragma HLS LOOP_TRIPCOUNT min=32768 max=258048
        weight_stream.write(weight_mem[word]);
    }
}

// The old monolithic MAC pipeline put all 64 packed multipliers and the
// complete reduction tree behind one stall/enable net.  Vitis HLS estimated
// more than five thousand loads on that net.  Four independent eight-lane
// engines preserve the same 64-way arithmetic and one-row-block-per-cycle
// throughput, but each controller is now local to one quarter of the cone.
static constexpr int INT4_MAC_ENGINES = 4;
static constexpr int INT4_MAC_LANES_PER_ENGINE =
    INT4_GROUP_SIZE / INT4_MAC_ENGINES;
static constexpr int INT4_MAC_ENGINE_ACTIVATION_BITS =
    INT4_MAC_LANES_PER_ENGINE * 15;
static constexpr int INT4_MAC_ENGINE_WEIGHT_BITS =
    INT4_MAC_LANES_PER_ENGINE * 16;
using int4_mac_engine_packet_t = ap_uint<
    INT4_MAC_ENGINE_ACTIVATION_BITS + INT4_MAC_ENGINE_WEIGHT_BITS>;
using int4_mac_engine_partial_t = ap_uint<2 * 46>;

static_assert(INT4_GROUP_SIZE % INT4_MAC_ENGINES == 0,
              "INT4 MAC lanes must partition evenly across local engines");

template <int ENGINE_ID>
static int4_mac_engine_packet_t int4_make_mac_engine_packet(
    int4_quant_word_t activation_word,
    int4_weight_word_t weight_word
) {
#pragma HLS INLINE
    int4_mac_engine_packet_t packet = 0;
    packet.range(INT4_MAC_ENGINE_ACTIVATION_BITS - 1, 0) =
        activation_word.range(
            (ENGINE_ID + 1) * INT4_MAC_ENGINE_ACTIVATION_BITS - 1,
            ENGINE_ID * INT4_MAC_ENGINE_ACTIVATION_BITS);
    packet.range(
        INT4_MAC_ENGINE_ACTIVATION_BITS +
            INT4_MAC_ENGINE_WEIGHT_BITS - 1,
        INT4_MAC_ENGINE_ACTIVATION_BITS) =
        weight_word.range(
            (ENGINE_ID + 1) * INT4_MAC_ENGINE_WEIGHT_BITS - 1,
            ENGINE_ID * INT4_MAC_ENGINE_WEIGHT_BITS);
    return packet;
}

static void int4_dispatch_mac_engines(
    hls::stream<int4_weight_word_t>& weight_stream,
    hls::stream<int4_quant_word_t>& activation_stream,
    hls::stream<int4_mac_engine_packet_t>& engine0_stream,
    hls::stream<int4_mac_engine_packet_t>& engine1_stream,
    hls::stream<int4_mac_engine_packet_t>& engine2_stream,
    hls::stream<int4_mac_engine_packet_t>& engine3_stream,
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE off

dispatch_mac_local_tile_loop:
    for (int local_tile = 0; local_tile < local_tiles; ++local_tile) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=63
    dispatch_mac_col_tile_loop:
        for (int col_tile = 0; col_tile < input_tiles; ++col_tile) {
#pragma HLS LOOP_TRIPCOUNT min=16 max=43
        dispatch_mac_group_loop:
            for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
                const int4_quant_word_t activation_word =
                    activation_stream.read();
            dispatch_mac_row_block_loop:
                for (int row_block = 0;
                     row_block < INT4_ROW_BLOCKS;
                     ++row_block) {
#pragma HLS PIPELINE II=1
                    const int4_weight_word_t weight_word =
                        weight_stream.read();
                    engine0_stream.write(
                        int4_make_mac_engine_packet<0>(
                            activation_word, weight_word));
                    engine1_stream.write(
                        int4_make_mac_engine_packet<1>(
                            activation_word, weight_word));
                    engine2_stream.write(
                        int4_make_mac_engine_packet<2>(
                            activation_word, weight_word));
                    engine3_stream.write(
                        int4_make_mac_engine_packet<3>(
                            activation_word, weight_word));
                }
            }
        }
    }
}

template <int ENGINE_ID>
static void int4_mac_engine(
    hls::stream<int4_mac_engine_packet_t>& packet_stream,
    hls::stream<int4_mac_engine_partial_t>& partial_stream,
    int block_count
) {
#pragma HLS INLINE off

mac_engine_block_loop:
    for (int block = 0; block < block_count; ++block) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=32768 max=258048
        const int4_mac_engine_packet_t packet = packet_stream.read();
        const ap_uint<INT4_MAC_ENGINE_ACTIVATION_BITS> activation_bits =
            packet.range(INT4_MAC_ENGINE_ACTIVATION_BITS - 1, 0);
        const ap_uint<INT4_MAC_ENGINE_WEIGHT_BITS> weight_bits =
            packet.range(
                INT4_MAC_ENGINE_ACTIVATION_BITS +
                    INT4_MAC_ENGINE_WEIGHT_BITS - 1,
                INT4_MAC_ENGINE_ACTIVATION_BITS);

        int4_packed_acc_t products[2][INT4_MAC_LANES_PER_ENGINE];
        int4_packed_acc_t reduce_l1[2][4];
        int4_packed_acc_t reduce_l2[2][2];
#pragma HLS ARRAY_PARTITION variable=products complete
#pragma HLS ARRAY_PARTITION variable=reduce_l1 complete
#pragma HLS ARRAY_PARTITION variable=reduce_l2 complete

    mac_engine_lane_loop:
        for (int lane = 0;
             lane < INT4_MAC_LANES_PER_ENGINE;
             ++lane) {
#pragma HLS UNROLL
            const int4_activation_t activation =
                (int4_activation_t)activation_bits.range(
                    15 * lane + 14, 15 * lane);
        mac_engine_pair_loop:
            for (int pair = 0; pair < 2; ++pair) {
#pragma HLS UNROLL
                const ap_uint<8> pair_bits = weight_bits.range(
                    16 * lane + 8 * pair + 7,
                    16 * lane + 8 * pair);
                const int4_weight_t high =
                    (int4_weight_t)pair_bits.range(7, 4);
                const int4_weight_t low =
                    (int4_weight_t)pair_bits.range(3, 0);
                const int4_packed_product_t packed_product =
                    int4_pack_two_weights(high, low) * activation;
#pragma HLS BIND_OP variable=packed_product op=mul impl=dsp latency=4
                products[pair][lane] = packed_product;
            }
        }

    mac_engine_reduce_l1_pair_loop:
        for (int pair = 0; pair < 2; ++pair) {
#pragma HLS UNROLL
        mac_engine_reduce_l1_lane_loop:
            for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
                reduce_l1[pair][lane] =
                    products[pair][2 * lane] +
                    products[pair][2 * lane + 1];
            }
        }
    mac_engine_reduce_l2_pair_loop:
        for (int pair = 0; pair < 2; ++pair) {
#pragma HLS UNROLL
        mac_engine_reduce_l2_lane_loop:
            for (int lane = 0; lane < 2; ++lane) {
#pragma HLS UNROLL
                reduce_l2[pair][lane] =
                    reduce_l1[pair][2 * lane] +
                    reduce_l1[pair][2 * lane + 1];
            }
        }

        const int4_packed_acc_t pair_sum0 =
            reduce_l2[0][0] + reduce_l2[0][1];
        const int4_packed_acc_t pair_sum1 =
            reduce_l2[1][0] + reduce_l2[1][1];
        int4_mac_engine_partial_t partial = 0;
        partial.range(45, 0) = (ap_uint<46>)pair_sum0;
        partial.range(91, 46) = (ap_uint<46>)pair_sum1;
        partial_stream.write(partial);
    }
}

template <int PAIR>
static int4_packed_acc_t int4_get_mac_engine_partial(
    int4_mac_engine_partial_t partial
) {
#pragma HLS INLINE
    int4_packed_acc_t value = 0;
    value.range(45, 0) = partial.range(46 * PAIR + 45, 46 * PAIR);
    return value;
}

static void int4_gather_mac_engines(
    hls::stream<int4_mac_engine_partial_t>& engine0_stream,
    hls::stream<int4_mac_engine_partial_t>& engine1_stream,
    hls::stream<int4_mac_engine_partial_t>& engine2_stream,
    hls::stream<int4_mac_engine_partial_t>& engine3_stream,
    hls::stream<int4_group_block_t>& group_stream,
    int block_count
) {
#pragma HLS INLINE off

gather_mac_block_loop:
    for (int block = 0; block < block_count; ++block) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=32768 max=258048
        const int4_mac_engine_partial_t engine0 = engine0_stream.read();
        const int4_mac_engine_partial_t engine1 = engine1_stream.read();
        const int4_mac_engine_partial_t engine2 = engine2_stream.read();
        const int4_mac_engine_partial_t engine3 = engine3_stream.read();

        const int4_packed_acc_t pair0_left =
            int4_get_mac_engine_partial<0>(engine0) +
            int4_get_mac_engine_partial<0>(engine1);
        const int4_packed_acc_t pair0_right =
            int4_get_mac_engine_partial<0>(engine2) +
            int4_get_mac_engine_partial<0>(engine3);
        const int4_packed_acc_t pair1_left =
            int4_get_mac_engine_partial<1>(engine0) +
            int4_get_mac_engine_partial<1>(engine1);
        const int4_packed_acc_t pair1_right =
            int4_get_mac_engine_partial<1>(engine2) +
            int4_get_mac_engine_partial<1>(engine3);
        const int4_packed_acc_t pair_sum0 = pair0_left + pair0_right;
        const int4_packed_acc_t pair_sum1 = pair1_left + pair1_right;
#pragma HLS BIND_OP variable=pair_sum0 op=add impl=dsp latency=1
#pragma HLS BIND_OP variable=pair_sum1 op=add impl=dsp latency=1

        int4_group_acc_t r0, r1, r2, r3;
        int4_unpack_pair_sum(pair_sum0, r0, r1);
        int4_unpack_pair_sum(pair_sum1, r2, r3);

        int4_group_block_t result = 0;
        result.range(22, 0) = (ap_uint<23>)r0;
        result.range(45, 23) = (ap_uint<23>)r1;
        result.range(68, 46) = (ap_uint<23>)r2;
        result.range(91, 69) = (ap_uint<23>)r3;
        group_stream.write(result);
    }
}

template <int PE_ID>
static void int4_pe_mac_slice(
    hls::stream<int4_weight_word_t>& weight_stream,
    hls::stream<int4_quant_word_t>& activation_stream,
    hls::stream<int4_group_block_t>& group_stream,
    int local_tiles,
    int input_tiles
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_mac_engine_packet_t> engine0_packet_stream;
    hls::stream<int4_mac_engine_packet_t> engine1_packet_stream;
    hls::stream<int4_mac_engine_packet_t> engine2_packet_stream;
    hls::stream<int4_mac_engine_packet_t> engine3_packet_stream;
    hls::stream<int4_mac_engine_partial_t> engine0_partial_stream;
    hls::stream<int4_mac_engine_partial_t> engine1_partial_stream;
    hls::stream<int4_mac_engine_partial_t> engine2_partial_stream;
    hls::stream<int4_mac_engine_partial_t> engine3_partial_stream;
#pragma HLS STREAM variable=engine0_packet_stream depth=4
#pragma HLS STREAM variable=engine1_packet_stream depth=4
#pragma HLS STREAM variable=engine2_packet_stream depth=4
#pragma HLS STREAM variable=engine3_packet_stream depth=4
#pragma HLS STREAM variable=engine0_partial_stream depth=4
#pragma HLS STREAM variable=engine1_partial_stream depth=4
#pragma HLS STREAM variable=engine2_partial_stream depth=4
#pragma HLS STREAM variable=engine3_partial_stream depth=4
#pragma HLS BIND_STORAGE variable=engine0_packet_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine1_packet_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine2_packet_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine3_packet_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine0_partial_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine1_partial_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine2_partial_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine3_partial_stream type=fifo impl=srl

    const int block_count =
        local_tiles * input_tiles *
        INT4_GROUPS_PER_TILE * INT4_ROW_BLOCKS;

    int4_dispatch_mac_engines(
        weight_stream, activation_stream,
        engine0_packet_stream, engine1_packet_stream,
        engine2_packet_stream, engine3_packet_stream,
        local_tiles, input_tiles);
    int4_mac_engine<0>(
        engine0_packet_stream, engine0_partial_stream, block_count);
    int4_mac_engine<1>(
        engine1_packet_stream, engine1_partial_stream, block_count);
    int4_mac_engine<2>(
        engine2_packet_stream, engine2_partial_stream, block_count);
    int4_mac_engine<3>(
        engine3_packet_stream, engine3_partial_stream, block_count);
    int4_gather_mac_engines(
        engine0_partial_stream, engine1_partial_stream,
        engine2_partial_stream, engine3_partial_stream,
        group_stream, block_count);
}

using int4_final_row_block_t = ap_uint<128>;

template <int PE_ID>
static void int4_pe_dequant_slice(
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
    ap_uint<5> scale_lane = 0;
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
#pragma HLS LOOP_FLATTEN off
#pragma HLS LOOP_TRIPCOUNT min=4096 max=11008
#pragma HLS BIND_OP variable=combined_scale op=mul impl=dsp
// Automatic FRP raises the estimated global control fanout to 5,515 loads in
// every PE.  Force a stallable II=1 pipeline: its group/scale FIFO stalls stay
// within this PE and Vivado can replicate the per-stage enables locally.
#pragma HLS PIPELINE II=1 style=stp
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
                    // There are exactly 32 FP16 scales per packed word, so a
                    // five-bit counter wraps naturally without a compare/mux
                    // on the II=1 dequantization path.
                    ++scale_lane;
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

template <int PE_ID>
static void int4_pe_pack_slice(
    hls::stream<int4_final_row_block_t>& final_block_stream,
    hls::stream<int4_output_value_t>& output_value_stream,
    int local_tiles,
    bool output_fxp
) {
#pragma HLS INLINE off

    const int output_values = local_tiles * INT4_TILE_ROWS;
    int4_final_row_block_t final_block = 0;

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
        const int4_output_value_t output_value =
            output_fxp
                ? int4_float_to_fxp_bits(
                      int4_bits_to_float(fp32_bits))
                : fp32_bits;
        output_value_stream.write(output_value);
    }
}

template <int PE_ID>
static void int4_pe_output_slice(
    hls::stream<int4_output_value_t>& output_value_stream,
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
#pragma HLS LOOP_FLATTEN off
#pragma HLS LOOP_TRIPCOUNT min=64 max=504
            int4_output_word_t packed = 0;
        write_output_direct_lane_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
#pragma HLS PIPELINE II=1
                packed >>= 32;
                packed.range(511, 480) =
                    output_value_stream.read();
            }
            output_mem[word] = packed;
        }
    } else {
    write_output_fused_loop:
        for (int word = 0; word < output_words; ++word) {
#pragma HLS LOOP_FLATTEN off
#pragma HLS LOOP_TRIPCOUNT min=64 max=64
            int4_output_word_t residual_word =
#ifdef INT4_INTEGRATED_TOP
                output_mem[word];
#else
                residual_stream.read();
#endif
            int4_output_word_t sum_word = 0;
        fused_residual_lane_loop:
            for (int lane = 0;
                 lane < INT4_OUTPUTS_PER_WORD;
                 ++lane) {
// HLS otherwise promotes this fixed loop to FRP and reports a 7,678-load
// control net.  A stallable controller preserves one FP add per cycle and
// keeps residual/output backpressure local to this packer.
#pragma HLS PIPELINE II=1 style=stp
                const float branch_value = int4_bits_to_float(
                    output_value_stream.read());
                const float residual_value = int4_bits_to_float(
                    residual_word.range(31, 0));
                const float sum = residual_value + branch_value;
                residual_word >>= 32;
                sum_word >>= 32;
                sum_word.range(511, 480) = int4_float_to_bits(sum);
            }
            output_mem[word] = sum_word;
        }
    }
}


// Only this compact, registered command is allowed to cross from the shared
// controller island into a linear PE.  Passing C integers/booleans or a
// controller-computed address directly to every PE lets HLS create one
// high-fanout control cone spanning all SLRs.  The per-PE command FIFOs below
// make the crossing point explicit in both generated RTL and the
// post-synthesis floorplan.  Matrix shape and output policy are decoded from
// the three-bit mode after that boundary; the two model offsets are also
// registered there, so each PE forms its own gmem/scale address locally.
typedef ap_uint<38> int4_linear_pe_command_t;

static void int4_decode_linear_pe_mode(
    ap_uint<3> linear_mode,
    ap_uint<6>& local_tiles,
    ap_uint<6>& input_tiles,
    bool& output_fxp,
    bool& fuse_residual
) {
#pragma HLS INLINE
    local_tiles = 0;
    input_tiles = 0;
    output_fxp = false;
    fuse_residual = false;

    switch ((int)linear_mode) {
    case INT4_LINEAR_Q:
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
        local_tiles =
            INT4_DIM / (INT4_PE_COUNT * INT4_TILE_ROWS);
        input_tiles = INT4_DIM / INT4_TILE_COLS;
        output_fxp = true;
        break;
    case INT4_LINEAR_O:
        local_tiles =
            INT4_DIM / (INT4_PE_COUNT * INT4_TILE_ROWS);
        input_tiles = INT4_DIM / INT4_TILE_COLS;
        fuse_residual = true;
        break;
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        local_tiles =
            (INT4_HIDDEN_DIM +
             INT4_PE_COUNT * INT4_TILE_ROWS - 1) /
            (INT4_PE_COUNT * INT4_TILE_ROWS);
        input_tiles = INT4_DIM / INT4_TILE_COLS;
        break;
    case INT4_LINEAR_DOWN:
        local_tiles =
            INT4_DIM / (INT4_PE_COUNT * INT4_TILE_ROWS);
        input_tiles = INT4_HIDDEN_DIM / INT4_TILE_COLS;
        fuse_residual = true;
        break;
    case INT4_LINEAR_LOGITS:
        local_tiles =
            (INT4_VOCAB_SIZE +
             INT4_PE_COUNT * INT4_TILE_ROWS - 1) /
            (INT4_PE_COUNT * INT4_TILE_ROWS);
        input_tiles = INT4_DIM / INT4_TILE_COLS;
        break;
    default:
        break;
    }
}

static int4_linear_pe_command_t int4_pack_linear_pe_command(
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE
    int4_linear_pe_command_t command = 0;
    command.range(2, 0) = linear_mode;
    command.range(26, 3) = weight_word_offset;
    command.range(37, 27) = weight_scale_word_offset;
    return command;
}

static void int4_broadcast_linear_commands_pair01(
    hls::stream<int4_linear_pe_command_t>& linear_command_pe0,
    hls::stream<int4_linear_pe_command_t>& linear_command_pe1,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command =
        int4_pack_linear_pe_command(
            linear_mode,
            weight_word_offset,
            weight_scale_word_offset);
    linear_command_pe0.write(command);
    linear_command_pe1.write(command);
}

static void int4_broadcast_linear_commands_pair23(
    hls::stream<int4_linear_pe_command_t>& linear_command_pe2,
    hls::stream<int4_linear_pe_command_t>& linear_command_pe3,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command =
        int4_pack_linear_pe_command(
            linear_mode,
            weight_word_offset,
            weight_scale_word_offset);
    linear_command_pe2.write(command);
    linear_command_pe3.write(command);
}

// Once a command reaches a PE, give every DATAFLOW child its own registered
// copy.  Decoding one shared set of loop bounds in int4_run_pe_dataflow made
// local_tiles/input_tiles feed several independently placed controllers.  It
// also violates the canonical DATAFLOW form because those local scalars are
// consumed by multiple processes.  Six tiny PE-local channels cost far less
// routing than one shared control cone and do not change any datapath II.
template <int PE_ID>
static void int4_broadcast_pe_stage_commands(
    hls::stream<int4_linear_pe_command_t>& command_stream,
    hls::stream<int4_linear_pe_command_t>& weight_command_stream,
    hls::stream<int4_linear_pe_command_t>& activation_command_stream,
    hls::stream<int4_linear_pe_command_t>& mac_command_stream,
    hls::stream<int4_linear_pe_command_t>& dequant_command_stream,
    hls::stream<int4_linear_pe_command_t>& pack_command_stream,
    hls::stream<int4_linear_pe_command_t>& output_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = command_stream.read();
    weight_command_stream.write(command);
    activation_command_stream.write(command);
    mac_command_stream.write(command);
    dequant_command_stream.write(command);
    pack_command_stream.write(command);
    output_command_stream.write(command);
}

template <int PE_ID>
static void int4_pe_weight_commanded(
    const int4_weight_word_t* weight_mem,
#ifndef INT4_INTEGRATED_TOP
    const int4_weight_scale_word_t* scale_mem,
    const int4_output_word_t* output_mem,
#endif
    hls::stream<int4_weight_word_t>& weight_stream,
#ifndef INT4_INTEGRATED_TOP
    hls::stream<int4_weight_scale_word_t>& packed_scale_stream,
    hls::stream<int4_output_word_t>& residual_stream,
#endif
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);

    const int tile_count = (int)local_tiles * (int)input_tiles;
    const int4_weight_word_t* local_weight_mem =
        weight_mem + (int)command.range(26, 3);
#ifndef INT4_INTEGRATED_TOP
    const int output_words =
        (int)local_tiles * INT4_OUTPUT_WORDS_PER_TILE;
    const int4_weight_scale_word_t* local_scale_mem =
        scale_mem + (int)command.range(37, 27);
    int4_pe_weight_slice<PE_ID>(
        local_weight_mem, local_scale_mem, output_mem,
        weight_stream, packed_scale_stream, residual_stream,
        tile_count, output_words, fuse_residual);
#else
    int4_pe_weight_slice<PE_ID>(
        local_weight_mem, weight_stream, tile_count);
#endif
}

template <int PE_ID>
static void int4_pe_activation_commanded(
    hls::stream<int4_quant_word_t>& seed_activation_stream,
    hls::stream<float>& seed_scale_stream,
    hls::stream<int4_quant_word_t>& replay_activation_stream,
    hls::stream<float>& replay_scale_stream,
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);
    int4_pe_activation_slice<PE_ID>(
        seed_activation_stream, seed_scale_stream,
        replay_activation_stream, replay_scale_stream,
        (int)local_tiles, (int)input_tiles);
}

template <int PE_ID>
static void int4_pe_mac_commanded(
    hls::stream<int4_weight_word_t>& weight_stream,
    hls::stream<int4_quant_word_t>& activation_stream,
    hls::stream<int4_group_block_t>& group_stream,
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);
    int4_pe_mac_slice<PE_ID>(
        weight_stream, activation_stream, group_stream,
        (int)local_tiles, (int)input_tiles);
}

template <int PE_ID>
static void int4_pe_dequant_commanded(
    hls::stream<int4_group_block_t>& group_stream,
    hls::stream<float>& activation_scale_stream,
    hls::stream<int4_final_row_block_t>& final_block_stream,
#ifdef INT4_INTEGRATED_TOP
    const int4_weight_scale_word_t* scale_mem,
#else
    hls::stream<int4_weight_scale_word_t>& packed_scale_stream,
#endif
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);
#ifdef INT4_INTEGRATED_TOP
    const int4_weight_scale_word_t* local_scale_mem =
        scale_mem + (int)command.range(37, 27);
    int4_pe_dequant_slice<PE_ID>(
        group_stream, activation_scale_stream, final_block_stream,
        local_scale_mem, (int)local_tiles, (int)input_tiles);
#else
    int4_pe_dequant_slice<PE_ID>(
        group_stream, activation_scale_stream, final_block_stream,
        packed_scale_stream, (int)local_tiles, (int)input_tiles);
#endif
}

template <int PE_ID>
static void int4_pe_pack_commanded(
    hls::stream<int4_final_row_block_t>& final_block_stream,
    hls::stream<int4_output_value_t>& output_value_stream,
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);
    int4_pe_pack_slice<PE_ID>(
        final_block_stream, output_value_stream,
        (int)local_tiles, output_fxp);
}

template <int PE_ID>
static void int4_pe_output_commanded(
    hls::stream<int4_output_value_t>& output_value_stream,
#ifndef INT4_INTEGRATED_TOP
    hls::stream<int4_output_word_t>& residual_stream,
#endif
    int4_output_word_t* output_mem,
    hls::stream<int4_linear_pe_command_t>& stage_command_stream
) {
#pragma HLS INLINE off
    const int4_linear_pe_command_t command = stage_command_stream.read();
    ap_uint<6> local_tiles;
    ap_uint<6> input_tiles;
    bool output_fxp;
    bool fuse_residual;
    int4_decode_linear_pe_mode(
        command.range(2, 0),
        local_tiles, input_tiles,
        output_fxp, fuse_residual);
    int4_pe_output_slice<PE_ID>(
        output_value_stream,
#ifndef INT4_INTEGRATED_TOP
        residual_stream,
#endif
        output_mem, (int)local_tiles, fuse_residual);
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
    hls::stream<int4_output_value_t> output_value_stream;
    hls::stream<int4_linear_pe_command_t> weight_command_stream;
    hls::stream<int4_linear_pe_command_t> activation_command_stream;
    hls::stream<int4_linear_pe_command_t> mac_command_stream;
    hls::stream<int4_linear_pe_command_t> dequant_command_stream;
    hls::stream<int4_linear_pe_command_t> pack_command_stream;
    hls::stream<int4_linear_pe_command_t> output_command_stream;
    // Two complete 256-word AXI bursts are enough to hide activation-cache
    // warm-up and normal consumer backpressure.  The former depth 16384
    // allocated roughly 32 URAM per PE although this acyclic channel may
    // safely block.
#pragma HLS STREAM variable=weight_stream depth=512
#ifndef INT4_INTEGRATED_TOP
#pragma HLS STREAM variable=packed_scale_stream depth=32
#pragma HLS STREAM variable=residual_stream depth=64
#endif
#pragma HLS STREAM variable=group_stream depth=64
#pragma HLS STREAM variable=replay_activation_stream depth=2
#pragma HLS STREAM variable=replay_scale_stream depth=3
#pragma HLS STREAM variable=final_block_stream depth=32
#pragma HLS STREAM variable=output_value_stream depth=64
#pragma HLS STREAM variable=weight_command_stream depth=2
#pragma HLS STREAM variable=activation_command_stream depth=2
#pragma HLS STREAM variable=mac_command_stream depth=3
#pragma HLS STREAM variable=dequant_command_stream depth=4
#pragma HLS STREAM variable=pack_command_stream depth=5
#pragma HLS STREAM variable=output_command_stream depth=6
#pragma HLS BIND_STORAGE variable=weight_stream type=fifo impl=uram
#ifndef INT4_INTEGRATED_TOP
#pragma HLS BIND_STORAGE variable=packed_scale_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=residual_stream type=fifo impl=bram
#endif
#pragma HLS BIND_STORAGE variable=group_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=replay_activation_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=replay_scale_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=final_block_stream type=fifo impl=bram
    // The routed DCP showed output_stream.dout_vld driving 1,024 loads.
    // Packing already emits one FP32 lane/cycle, so a 32-bit FIFO preserves
    // throughput and moves the only 512-bit assembly next to output_mem.
#pragma HLS BIND_STORAGE variable=output_value_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=weight_command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=mac_command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=dequant_command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=pack_command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=output_command_stream type=fifo impl=srl

    int4_broadcast_pe_stage_commands<PE_ID>(
        command_stream,
        weight_command_stream, activation_command_stream,
        mac_command_stream, dequant_command_stream,
        pack_command_stream, output_command_stream);
    int4_pe_weight_commanded<PE_ID>(
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
        weight_command_stream);
    int4_pe_activation_commanded<PE_ID>(
        activation_stream,
        activation_scale_stream,
        replay_activation_stream,
        replay_scale_stream,
        activation_command_stream);
    int4_pe_mac_commanded<PE_ID>(
        weight_stream,
        replay_activation_stream,
        group_stream,
        mac_command_stream);
    int4_pe_dequant_commanded<PE_ID>(
        group_stream,
        replay_scale_stream,
        final_block_stream,
#ifdef INT4_INTEGRATED_TOP
        scale_mem,
#else
        packed_scale_stream,
#endif
        dequant_command_stream);
    int4_pe_pack_commanded<PE_ID>(
        final_block_stream,
        output_value_stream,
        pack_command_stream);
    int4_pe_output_commanded<PE_ID>(
        output_value_stream,
#ifndef INT4_INTEGRATED_TOP
        residual_stream,
#endif
        output_mem,
        output_command_stream);
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
    bool cache_stream_activation,
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
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_pe0;
    hls::stream<int4_quant_word_t> quantized_pe1;
    hls::stream<int4_quant_word_t> quantized_pe2;
    hls::stream<int4_quant_word_t> quantized_pe3;
    hls::stream<int4_activation_beat_t> quantized_pair01_to_pe0;
    hls::stream<int4_activation_beat_t> quantized_pair23_to_pe3;
    hls::stream<float> activation_scale_pe0;
    hls::stream<float> activation_scale_pe1;
    hls::stream<float> activation_scale_pe2;
    hls::stream<float> activation_scale_pe3;
    hls::stream<float> activation_scale_pair01_to_pe0;
    hls::stream<float> activation_scale_pair23_to_pe3;
    hls::stream<int4_quant_word_t> quantized_pair01;
    hls::stream<int4_quant_word_t> quantized_pair23;
    hls::stream<float> activation_scale_pair01;
    hls::stream<float> activation_scale_pair23;
    hls::stream<int4_linear_pe_command_t> linear_command_pe0;
    hls::stream<int4_linear_pe_command_t> linear_command_pe1;
    hls::stream<int4_linear_pe_command_t> linear_command_pe2;
    hls::stream<int4_linear_pe_command_t> linear_command_pe3;
#pragma HLS STREAM variable=quantized_pe0 depth=2
#pragma HLS STREAM variable=quantized_pe1 depth=2
#pragma HLS STREAM variable=quantized_pe2 depth=2
#pragma HLS STREAM variable=quantized_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair01_to_pe0 depth=32
#pragma HLS STREAM variable=quantized_pair23_to_pe3 depth=32
#pragma HLS STREAM variable=activation_scale_pe0 depth=2
#pragma HLS STREAM variable=activation_scale_pe1 depth=2
#pragma HLS STREAM variable=activation_scale_pe2 depth=2
#pragma HLS STREAM variable=activation_scale_pe3 depth=2
#pragma HLS STREAM variable=activation_scale_pair01_to_pe0 depth=2
#pragma HLS STREAM variable=activation_scale_pair23_to_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair01 depth=2
#pragma HLS STREAM variable=quantized_pair23 depth=2
#pragma HLS STREAM variable=activation_scale_pair01 depth=2
#pragma HLS STREAM variable=activation_scale_pair23 depth=2
#pragma HLS STREAM variable=linear_command_pe0 depth=4
#pragma HLS STREAM variable=linear_command_pe1 depth=3
#pragma HLS STREAM variable=linear_command_pe2 depth=3
#pragma HLS STREAM variable=linear_command_pe3 depth=4
    // A four-entry, 480-bit FIFO is cheaper and much more placeable in LUTRAM;
    // BRAM banking created fixed-site, routing-dominated paths in the DCP.
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair01_to_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pair23_to_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pair01_to_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pair23_to_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=activation_scale_pair01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pair23 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe3 type=fifo impl=srl

    // Keep command fanout inside the same two pair-local islands used by the
    // 480-bit activation tree.  No generated control node drives four SLRs.
    int4_broadcast_linear_commands_pair01(
        linear_command_pe0, linear_command_pe1,
        linear_mode,
        weight_word_offset, weight_scale_word_offset);
    int4_broadcast_linear_commands_pair23(
        linear_command_pe2, linear_command_pe3,
        linear_mode,
        weight_word_offset, weight_scale_word_offset);

    int4_distribute_activation_pairs(
#ifdef INT4_INTEGRATED_TOP
        quantized,
        packed_scales,
        input_quantized_stream, input_scale_stream,
        stream_activation, cache_stream_activation,
#else
        quantized,
        scales,
#endif
        quantized_pair01, quantized_pair23,
        activation_scale_pair01, activation_scale_pair23,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        input_tiles);

    int4_broadcast_activation_pair01(
        quantized_pair01, activation_scale_pair01,
        quantized_pair01_to_pe0, quantized_pe1,
        activation_scale_pair01_to_pe0, activation_scale_pe1,
        local_tiles_0, local_tiles_1, input_tiles);
    int4_broadcast_activation_pair23(
        quantized_pair23, activation_scale_pair23,
        quantized_pe2, quantized_pair23_to_pe3,
        activation_scale_pe2, activation_scale_pair23_to_pe3,
        local_tiles_2, local_tiles_3, input_tiles);

    int4_deserialize_activation_pe0(
        quantized_pair01_to_pe0, activation_scale_pair01_to_pe0,
        quantized_pe0, activation_scale_pe0,
        local_tiles_0, input_tiles);
    int4_deserialize_activation_pe3(
        quantized_pair23_to_pe3, activation_scale_pair23_to_pe3,
        quantized_pe3, activation_scale_pe3,
        local_tiles_3, input_tiles);

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

#ifdef INT4_INTEGRATED_TOP
static void int4_run_linear_pair01(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    int4_quant_word_t activation_q_pair01[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        activation_scale_pair01[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_pair01_stream,
    hls::stream<float>& input_scale_pair01_stream,
    bool stream_activation,
    bool cache_stream_activation,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int local_tiles_0,
    int local_tiles_1,
    int input_tiles,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_quant_word_t> quantized_pe0, quantized_pe1;
    hls::stream<int4_activation_beat_t> quantized_pair01_to_pe0;
    hls::stream<float> activation_scale_pe0, activation_scale_pe1;
    hls::stream<float> activation_scale_pair01_to_pe0;
    hls::stream<int4_quant_word_t> quantized_pair01;
    hls::stream<float> activation_scale_pair01_stream;
    hls::stream<int4_linear_pe_command_t>
        linear_command_pe0, linear_command_pe1;
#pragma HLS STREAM variable=quantized_pe0 depth=2
#pragma HLS STREAM variable=quantized_pe1 depth=2
#pragma HLS STREAM variable=quantized_pair01_to_pe0 depth=32
#pragma HLS STREAM variable=activation_scale_pe0 depth=2
#pragma HLS STREAM variable=activation_scale_pe1 depth=2
#pragma HLS STREAM variable=activation_scale_pair01_to_pe0 depth=2
#pragma HLS STREAM variable=quantized_pair01 depth=2
#pragma HLS STREAM variable=activation_scale_pair01_stream depth=2
#pragma HLS STREAM variable=linear_command_pe0 depth=4
#pragma HLS STREAM variable=linear_command_pe1 depth=3
#pragma HLS BIND_STORAGE variable=quantized_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pair01_to_pe0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pair01_to_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pair01_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe1 type=fifo impl=srl

    int4_broadcast_linear_commands_pair01(
        linear_command_pe0, linear_command_pe1,
        linear_mode, weight_word_offset, weight_scale_word_offset);
    int4_prepare_activation_pair01(
        activation_q_pair01, activation_scale_pair01,
        input_quantized_pair01_stream, input_scale_pair01_stream,
        stream_activation, cache_stream_activation,
        quantized_pair01, activation_scale_pair01_stream,
        local_tiles_0, local_tiles_1, input_tiles);
    int4_broadcast_activation_pair01(
        quantized_pair01, activation_scale_pair01_stream,
        quantized_pair01_to_pe0, quantized_pe1,
        activation_scale_pair01_to_pe0, activation_scale_pe1,
        local_tiles_0, local_tiles_1, input_tiles);
    int4_deserialize_activation_pe0(
        quantized_pair01_to_pe0, activation_scale_pair01_to_pe0,
        quantized_pe0, activation_scale_pe0,
        local_tiles_0, input_tiles);
    int4_run_pe_dataflow<0>(
        weight_pe0, scale_pe0,
        quantized_pe0, activation_scale_pe0,
        linear_command_pe0, output_pe0);
    int4_run_pe_dataflow<1>(
        weight_pe1, scale_pe1,
        quantized_pe1, activation_scale_pe1,
        linear_command_pe1, output_pe1);
}

static void int4_run_linear_pair23(
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t activation_q_pair23[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        activation_scale_pair23[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_pair23_stream,
    hls::stream<float>& input_scale_pair23_stream,
    bool stream_activation,
    bool cache_stream_activation,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_quant_word_t> quantized_pe2, quantized_pe3;
    hls::stream<int4_activation_beat_t> quantized_pair23_to_pe3;
    hls::stream<float> activation_scale_pe2, activation_scale_pe3;
    hls::stream<float> activation_scale_pair23_to_pe3;
    hls::stream<int4_quant_word_t> quantized_pair23;
    hls::stream<float> activation_scale_pair23_stream;
    hls::stream<int4_linear_pe_command_t>
        linear_command_pe2, linear_command_pe3;
#pragma HLS STREAM variable=quantized_pe2 depth=2
#pragma HLS STREAM variable=quantized_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair23_to_pe3 depth=32
#pragma HLS STREAM variable=activation_scale_pe2 depth=2
#pragma HLS STREAM variable=activation_scale_pe3 depth=2
#pragma HLS STREAM variable=activation_scale_pair23_to_pe3 depth=2
#pragma HLS STREAM variable=quantized_pair23 depth=2
#pragma HLS STREAM variable=activation_scale_pair23_stream depth=2
#pragma HLS STREAM variable=linear_command_pe2 depth=3
#pragma HLS STREAM variable=linear_command_pe3 depth=4
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pair23_to_pe3 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=activation_scale_pair23_to_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_pair23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pair23_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_command_pe3 type=fifo impl=srl

    int4_broadcast_linear_commands_pair23(
        linear_command_pe2, linear_command_pe3,
        linear_mode, weight_word_offset, weight_scale_word_offset);
    int4_prepare_activation_pair23(
        activation_q_pair23, activation_scale_pair23,
        input_quantized_pair23_stream, input_scale_pair23_stream,
        stream_activation, cache_stream_activation,
        quantized_pair23, activation_scale_pair23_stream,
        local_tiles_2, local_tiles_3, input_tiles);
    int4_broadcast_activation_pair23(
        quantized_pair23, activation_scale_pair23_stream,
        quantized_pe2, quantized_pair23_to_pe3,
        activation_scale_pe2, activation_scale_pair23_to_pe3,
        local_tiles_2, local_tiles_3, input_tiles);
    int4_deserialize_activation_pe3(
        quantized_pair23_to_pe3, activation_scale_pair23_to_pe3,
        quantized_pe3, activation_scale_pe3,
        local_tiles_3, input_tiles);
    int4_run_pe_dataflow<2>(
        weight_pe2, scale_pe2,
        quantized_pe2, activation_scale_pe2,
        linear_command_pe2, output_pe2);
    int4_run_pe_dataflow<3>(
        weight_pe3, scale_pe3,
        quantized_pe3, activation_scale_pe3,
        linear_command_pe3, output_pe3);
}

static void int4_run_four_pes_pair_streams(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t activation_q_pair01[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        activation_scale_pair01[INT4_MAX_ACTIVATION_SCALE_WORDS],
    int4_quant_word_t activation_q_pair23[INT4_MAX_INPUT_GROUPS],
    int4_scale_word_t
        activation_scale_pair23[INT4_MAX_ACTIVATION_SCALE_WORDS],
    hls::stream<int4_quant_word_t>& input_quantized_pair01_stream,
    hls::stream<float>& input_scale_pair01_stream,
    hls::stream<int4_quant_word_t>& input_quantized_pair23_stream,
    hls::stream<float>& input_scale_pair23_stream,
    bool stream_activation,
    bool cache_stream_activation,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    int local_tiles_0,
    int local_tiles_1,
    int local_tiles_2,
    int local_tiles_3,
    int input_tiles,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    // Register completion at the pair boundary.  The failed RTL connected
    // PE3 output completion directly into the four-PE and outer controller
    // FSMs, producing several SLR3 -> SLR0 timing paths.
    int4_run_linear_pair01(
        weight_pe0, weight_pe1, scale_pe0, scale_pe1,
        activation_q_pair01, activation_scale_pair01,
        input_quantized_pair01_stream, input_scale_pair01_stream,
        stream_activation, cache_stream_activation,
        output_pe0, output_pe1,
        local_tiles_0, local_tiles_1, input_tiles,
        linear_mode, weight_word_offset, weight_scale_word_offset);
    int4_run_linear_pair23(
        weight_pe2, weight_pe3, scale_pe2, scale_pe3,
        activation_q_pair23, activation_scale_pair23,
        input_quantized_pair23_stream, input_scale_pair23_stream,
        stream_activation, cache_stream_activation,
        output_pe2, output_pe3,
        local_tiles_2, local_tiles_3, input_tiles,
        linear_mode, weight_word_offset, weight_scale_word_offset);
}
#endif

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

void int4_complete_linear_dispatch(Int4Controller& controller) {
#pragma HLS INLINE
    int4_advance_model_offsets_after_linear(controller);
    int4_advance_controller_after_linear(controller);
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
        unused_quantized_stream, unused_scale_stream,
        false, false,
#else
        quantized, scales,
#endif
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles,
        (ap_uint<3>)controller.linear_mode,
        (ap_uint<24>)0,
        (ap_uint<11>)0);

    int4_complete_linear_dispatch(controller);
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
    ap_uint<3> linear_mode,
    bool cache_rms_activation,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
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
        cache_rms_activation,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        input_tiles, linear_mode,
        weight_word_offset,
        weight_scale_word_offset);
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

    const int local_tiles_0 =
        int4_local_tile_count(shape.output_tiles, 0);
    const int local_tiles_1 =
        int4_local_tile_count(shape.output_tiles, 1);
    const int local_tiles_2 =
        int4_local_tile_count(shape.output_tiles, 2);
    const int local_tiles_3 =
        int4_local_tile_count(shape.output_tiles, 3);
    const bool cache_rms_activation =
        fuse_rms &&
        (controller.linear_mode == INT4_LINEAR_Q ||
         controller.linear_mode == INT4_LINEAR_GATE);

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
        shape.input_tiles,
        (ap_uint<3>)controller.linear_mode,
        cache_rms_activation,
        (ap_uint<24>)0,
        (ap_uint<11>)0);

    int4_complete_linear_dispatch(controller);
}

void int4_linear_4pe_from_stream_command(
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
    bool cache_stream_activation,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
    const Int4LinearShape shape =
        int4_linear_shape_from_mode(linear_mode);
    if (shape.output_tiles <= 0 || shape.input_tiles <= 0) {
        return;
    }

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
        stream_activation, cache_stream_activation,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles,
        linear_mode,
        weight_word_offset,
        weight_scale_word_offset);
}

void int4_linear_4pe_from_pair_streams_command(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    int4_quant_word_t* activation_q_pair01,
    int4_scale_word_t* activation_scale_pair01,
    int4_quant_word_t* activation_q_pair23,
    int4_scale_word_t* activation_scale_pair23,
    hls::stream<int4_quant_word_t>& input_quantized_pair01_stream,
    hls::stream<float>& input_scale_pair01_stream,
    hls::stream<int4_quant_word_t>& input_quantized_pair23_stream,
    hls::stream<float>& input_scale_pair23_stream,
    bool stream_activation,
    bool cache_stream_activation,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
    const Int4LinearShape shape =
        int4_linear_shape_from_mode(linear_mode);
    if (shape.output_tiles <= 0 || shape.input_tiles <= 0) {
        return;
    }

    const int local_tiles_0 =
        int4_local_tile_count(shape.output_tiles, 0);
    const int local_tiles_1 =
        int4_local_tile_count(shape.output_tiles, 1);
    const int local_tiles_2 =
        int4_local_tile_count(shape.output_tiles, 2);
    const int local_tiles_3 =
        int4_local_tile_count(shape.output_tiles, 3);

    int4_run_four_pes_pair_streams(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        activation_q_pair01, activation_scale_pair01,
        activation_q_pair23, activation_scale_pair23,
        input_quantized_pair01_stream, input_scale_pair01_stream,
        input_quantized_pair23_stream, input_scale_pair23_stream,
        stream_activation, cache_stream_activation,
        output_pe0, output_pe1, output_pe2, output_pe3,
        local_tiles_0, local_tiles_1,
        local_tiles_2, local_tiles_3,
        shape.input_tiles, linear_mode,
        weight_word_offset, weight_scale_word_offset);
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

    int4_linear_4pe_from_stream_command(
        weight_pe0, weight_pe1, weight_pe2, weight_pe3,
        scale_pe0, scale_pe1, scale_pe2, scale_pe3,
        activation_q, activation_scale,
        input_quantized_stream, input_scale_stream,
        stream_activation, true,
        output_pe0, output_pe1, output_pe2, output_pe3,
        (ap_uint<3>)controller.linear_mode,
        controller.weight_word_offset,
        controller.weight_scale_word_offset);

    int4_complete_linear_dispatch(controller);
}
#endif
