#include "swiftkv_attention.hpp"

#include <cstdint>
#include <hls_stream.h>

union swiftkv_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static float swiftkv_bits_to_float(ap_uint<32> bits) {
#pragma HLS INLINE
    swiftkv_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<32> swiftkv_float_to_bits(float value) {
#pragma HLS INLINE
    swiftkv_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static int4_fxp32_t swiftkv_bits_to_fxp(ap_uint<32> bits) {
#pragma HLS INLINE
    int4_fxp32_t value;
    value.range(31, 0) = bits;
    return value;
}

static ap_uint<32> swiftkv_fxp_to_bits(int4_fxp32_t value) {
#pragma HLS INLINE
    return value.range(31, 0);
}

static ap_int<32> swiftkv_q17_mul_add_rope_raw(
    ap_int<32> a,
    swiftkv_rope_raw_t b,
    ap_int<32> c,
    swiftkv_rope_raw_t d,
    bool subtract
) {
#pragma HLS INLINE
    ap_int<51> product_0 = a * b;
    ap_int<51> product_1 = c * d;
#pragma HLS BIND_OP variable=product_0 op=mul impl=dsp latency=3
#pragma HLS BIND_OP variable=product_1 op=mul impl=dsp latency=3
    const ap_int<52> combined =
        subtract
            ? (ap_int<52>)product_0 -
                  (ap_int<52>)product_1
            : (ap_int<52>)product_0 +
                  (ap_int<52>)product_1;
    const ap_int<35> shifted =
        (ap_int<35>)(combined >> 17);
    const ap_int<35> maximum =
        ((ap_int<35>)1 << 31) - 1;
    const ap_int<35> minimum =
        -((ap_int<35>)1 << 31);
    if (shifted > maximum) {
        return (ap_int<32>)0x7fffffff;
    }
    if (shifted < minimum) {
        return (ap_int<32>)0x80000000;
    }
    return (ap_int<32>)shifted;
}

// Rotate one complete 512-bit Q or K word through a compact eight-phase
// engine.  The previous sixteen-phase loop multiplexed Q and K state under
// one phase bit; its loop-init/reset net drove roughly 1,463 loads in the
// routed checkpoint.  Reusing this child function for two sequential calls
// keeps the same multiplier count and sixteen issued pair operations per
// word; only a small pipeline-drain latency is added while Q and K gain the
// same branch-free local controller.
static int4_output_word_t swiftkv_rotate_rope_word(
    int4_output_word_t input_word,
    const swiftkv_rope_raw_t cosine[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t sine[SWIFTKV_ROPE_PAIRS],
    int word
) {
#pragma HLS INLINE off
    int4_output_word_t rotated_word = 0;

rotate_rope_word_pair_loop:
    for (int pair = 0; pair < 8; ++pair) {
#pragma HLS PIPELINE II=1 style=stp
#pragma HLS LOOP_TRIPCOUNT min=8 max=8
        const int index = word * 16 + pair * 2;
        const swiftkv_rope_raw_t pair_cosine = cosine[index >> 1];
        const swiftkv_rope_raw_t pair_sine = sine[index >> 1];
        const ap_int<32> input_0 =
            (ap_int<32>)input_word.range(31, 0);
        const ap_int<32> input_1 =
            (ap_int<32>)input_word.range(63, 32);
        int4_fxp32_t rotated_0;
        int4_fxp32_t rotated_1;
        rotated_0.range(31, 0) = swiftkv_q17_mul_add_rope_raw(
            input_0, pair_cosine, input_1, pair_sine, true);
        rotated_1.range(31, 0) = swiftkv_q17_mul_add_rope_raw(
            input_0, pair_sine, input_1, pair_cosine, false);

        ap_uint<64> rotated_pair = 0;
        rotated_pair.range(31, 0) = swiftkv_fxp_to_bits(rotated_0);
        rotated_pair.range(63, 32) = swiftkv_fxp_to_bits(rotated_1);
        input_word >>= 64;
        rotated_word >>= 64;
        rotated_word.range(511, 448) = rotated_pair;
    }
    return rotated_word;
}

using swiftkv_log2_t =
    ap_fixed<24, 7, AP_RND_CONV, AP_WRAP>;
using swiftkv_log2_coeff_t =
    ap_fixed<24, 3, AP_RND_CONV, AP_WRAP>;
using swiftkv_product_t =
    ap_fixed<44, 20, AP_RND_CONV, AP_WRAP>;
using swiftkv_dot_t =
    ap_fixed<44, 20, AP_RND_CONV, AP_WRAP>;
using swiftkv_state_t =
    ap_fixed<32, 15, AP_RND_CONV, AP_SAT>;
// Multiplication by a softmax coefficient in [0,1] cannot increase the
// magnitude.  Intermediate saturation is therefore redundant; retain AP_SAT
// only when the recurrence is committed back to swiftkv_state_t.
using swiftkv_state_product_t =
    ap_fixed<32, 15, AP_RND_CONV, AP_WRAP>;
// Z is non-negative and cannot exceed SWIFTKV_MAX_SEQ_LEN.  Q13.17 covers
// [0,8192) exactly, removing two unused sign/integer bits and all saturation
// logic from the recurrence.
using swiftkv_normalization_t =
    ap_ufixed<30, 13, AP_RND_CONV, AP_WRAP>;
static_assert(
    SWIFTKV_MAX_SEQ_LEN < (1 << 13),
    "Q13.17 normalization must cover the complete SwiftKV context");
// exp(score - max) is always in [0, 1].  Q15.17 stores it in 32 bits, but
// its upper fourteen integer bits are provably zero.  Q1.17 preserves every
// representable coefficient exactly while reducing the state multiplier
// from 32x32 to 32x18.
using swiftkv_coefficient_t =
    ap_ufixed<18, 1, AP_RND_CONV, AP_SAT>;
using swiftkv_update_control_t = ap_uint<19>;
using swiftkv_kv_shift_t =
    ap_uint<SWIFTKV_KV_SCALE_SHIFT_BITS>;
// Keep every state-update cone physically small while matching the eight-cycle
// QK service rate.  Four independent four-lane engines own disjoint state
// banks inside one SwiftKV PE.  Together they update sixteen dimensions per
// cycle and cover a 128-element V vector in eight phases.
static constexpr int SWIFTKV_UPDATE_ENGINES = 4;
static constexpr int SWIFTKV_UPDATE_ENGINE_LANES = 4;
static constexpr int SWIFTKV_UPDATE_LANES =
    SWIFTKV_UPDATE_ENGINES * SWIFTKV_UPDATE_ENGINE_LANES;
static constexpr int SWIFTKV_UPDATE_PHASES =
    SWIFTKV_HEAD_SIZE / SWIFTKV_UPDATE_LANES;
static constexpr int SWIFTKV_UPDATE_ENGINE_VALUES =
    SWIFTKV_HEAD_SIZE / SWIFTKV_UPDATE_ENGINES;
static constexpr int SWIFTKV_UPDATE_ENGINE_WORD_BITS =
    SWIFTKV_KV_VALUES_PER_WORD * SWIFTKV_KV_CACHE_BITS /
    SWIFTKV_UPDATE_ENGINES;
using swiftkv_update_engine_word_t =
    ap_uint<SWIFTKV_UPDATE_ENGINE_WORD_BITS>;
static constexpr int SWIFTKV_UPDATE_TOKEN_CONTROL_BITS = 40 + 19;
using swiftkv_update_token_control_t =
    ap_uint<SWIFTKV_UPDATE_TOKEN_CONTROL_BITS>;
static constexpr int SWIFTKV_UPDATE_ENGINE_VALUE_BITS =
    SWIFTKV_UPDATE_ENGINE_LANES * SWIFTKV_KV_CACHE_BITS;
static constexpr int SWIFTKV_UPDATE_ENGINE_PACKET_BITS =
    SWIFTKV_UPDATE_ENGINE_VALUE_BITS +
    SWIFTKV_KV_SCALE_SHIFT_BITS + 18 + 2;
static constexpr int SWIFTKV_UPDATE_ENGINE_SHIFT_LSB =
    SWIFTKV_UPDATE_ENGINE_VALUE_BITS;
static constexpr int SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB =
    SWIFTKV_UPDATE_ENGINE_SHIFT_LSB + SWIFTKV_KV_SCALE_SHIFT_BITS;
static constexpr int SWIFTKV_UPDATE_ENGINE_RESCALE_BIT =
    SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB + 18;
static constexpr int SWIFTKV_UPDATE_ENGINE_TOKEN_NONZERO_BIT =
    SWIFTKV_UPDATE_ENGINE_RESCALE_BIT + 1;
using swiftkv_update_engine_packet_t =
    ap_uint<SWIFTKV_UPDATE_ENGINE_PACKET_BITS>;
static_assert(
    SWIFTKV_HEAD_SIZE == 2 * SWIFTKV_KV_VALUES_PER_WORD &&
        (SWIFTKV_KV_VALUES_PER_WORD % SWIFTKV_UPDATE_LANES) == 0,
    "the SwiftKV update engine expects two equally sized packed V words");
static_assert(
    SWIFTKV_UPDATE_LANES ==
        SWIFTKV_UPDATE_ENGINES * SWIFTKV_UPDATE_ENGINE_LANES &&
        (SWIFTKV_UPDATE_PHASES & (SWIFTKV_UPDATE_PHASES - 1)) == 0,
    "the banked SwiftKV update engine requires a power-of-two phase count");

static const ap_uint<32> SWIFTKV_EXP2_LUT_Q30[33] = {
    1073741824U, 1097253708U, 1121280436U, 1145833280U,
    1170923762U, 1196563654U, 1222764986U, 1249540052U,
    1276901417U, 1304861917U, 1333434672U, 1362633090U,
    1392470869U, 1422962010U, 1454120821U, 1485961921U,
    1518500250U, 1551751076U, 1585730000U, 1620452965U,
    1655936265U, 1692196547U, 1729250827U, 1767116489U,
    1805811301U, 1845353420U, 1885761398U, 1927054196U,
    1969251188U, 2012372174U, 2056437387U, 2101467502U,
    2147483648U
};

// SwiftKV exp: exp(x) = 2^(x*log2(e)); the fractional power uses a
// 5-bit LUT and linear interpolation.  Attention only calls it for x <= 0.
static swiftkv_coefficient_t swiftkv_exp_negative(
    int4_fxp32_t x
) {
#pragma HLS INLINE
    if (x >= 0) {
        return (swiftkv_coefficient_t)1.0;
    }
    // Q15.17 cannot represent exp(x) below x=-32 at its output LSB.
    // Clamping here bounds log2(x) to [-47,0].  Q7.17 supplies exactly the
    // five LUT-index bits plus twelve interpolation bits used below; the
    // previous Q16.32 path carried unused bits through every interpolator
    // and dynamic shifter.
    if (x <= (int4_fxp32_t)-32.0) {
        return (swiftkv_coefficient_t)0.0;
    }

    const swiftkv_log2_coeff_t log2_e =
        (swiftkv_log2_coeff_t)1.4426950408889634;
    const swiftkv_log2_t log2_value =
        (swiftkv_log2_t)(x * log2_e);
    const ap_int<24> raw =
        (ap_int<24>)log2_value.range(23, 0);
    const ap_int<7> exponent =
        (ap_int<7>)(raw >> 17);
    const ap_int<24> floor_raw =
        (ap_int<24>)exponent << 17;
    // SwiftKV Eq. (10): five MS fractional bits select the LUT entry
    // and the remaining twelve bits drive linear interpolation.
    const ap_uint<17> fraction =
        (ap_uint<17>)(raw - floor_raw);
    const ap_uint<5> index = fraction.range(16, 12);
    const ap_uint<12> remainder = fraction.range(11, 0);

    const ap_uint<32> base =
        SWIFTKV_EXP2_LUT_Q30[(int)index];
    const ap_uint<32> next =
        SWIFTKV_EXP2_LUT_Q30[(int)index + 1];
    const ap_uint<32> delta = next - base;
    const ap_uint<44> interpolation_product =
        (ap_uint<44>)delta * (ap_uint<44>)remainder;
    const ap_uint<32> interpolated =
        base +
        (ap_uint<32>)(
            (interpolation_product + ((ap_uint<44>)1 << 11)) >>
            12);

    const int shift = 13 - (int)exponent;
    ap_uint<18> output_raw = 0;
    if (shift <= 0) {
        output_raw = (ap_uint<18>)(interpolated << (-shift));
    } else if (shift < 32) {
        output_raw =
            (ap_uint<18>)(
                (interpolated +
                 ((ap_uint<32>)1 << (shift - 1))) >>
                shift);
    }

    swiftkv_coefficient_t output = 0;
    output.range(17, 0) = output_raw;
    return output;
}

// normalization is positive Q15.17 and bounded by the sequence length
// (<= 4096).  Its Q15.17 reciprocal is:
//
//   round((1 / normalization) * 2^17)
//     = round(2^34 / normalization.raw).
//
// Keep this divider rolled.  It is used only once after a complete head, so
// 35 compare/subtract cycles are negligible next to the KV scan and avoid a
// generic FP32 divider plus two float/fixed conversion datapaths per PE.
static int4_fxp32_t swiftkv_reciprocal_normalization(
    const swiftkv_normalization_t normalization
) {
#pragma HLS INLINE off

    const ap_uint<32> denominator =
        (ap_uint<32>)normalization.range(29, 0);
    const ap_uint<36> numerator =
        ((ap_uint<36>)1 << 34) +
        ((ap_uint<36>)denominator >> 1);
    ap_uint<36> remainder = 0;
    ap_uint<18> quotient = 0;

reciprocal_divide_bit_loop:
    for (int bit = 34; bit >= 0; --bit) {
        remainder =
            (remainder << 1) |
            (ap_uint<1>)numerator[bit];
        if (remainder >= denominator) {
            remainder -= denominator;
            if (bit < 18) {
                quotient[bit] = 1;
            }
        }
    }

    int4_fxp32_t reciprocal = 0;
    reciprocal.range(17, 0) = quotient;
    return reciprocal;
}

static swiftkv_dot_t swiftkv_dot16(
    const int4_fxp32_t q_values[16],
    const int4_output_word_t& k_word
) {
#pragma HLS INLINE
    swiftkv_product_t product[16];
    swiftkv_dot_t level_8[8];
    swiftkv_dot_t level_4[4];
    swiftkv_dot_t level_2[2];
#pragma HLS ARRAY_PARTITION variable=product complete
#pragma HLS ARRAY_PARTITION variable=level_8 complete
#pragma HLS ARRAY_PARTITION variable=level_4 complete
#pragma HLS ARRAY_PARTITION variable=level_2 complete
#pragma HLS BIND_OP variable=product op=mul impl=dsp latency=4

dot_product_lane_loop:
    for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
        const int4_fxp32_t k =
            swiftkv_bits_to_fxp(
                k_word.range(32 * lane + 31, 32 * lane));
        product[lane] =
            (swiftkv_product_t)(q_values[lane] * k);
    }
dot_reduce_8_loop:
    for (int lane = 0; lane < 8; ++lane) {
#pragma HLS UNROLL
        level_8[lane] =
            (swiftkv_dot_t)product[2 * lane] +
            (swiftkv_dot_t)product[2 * lane + 1];
    }
dot_reduce_4_loop:
    for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
        level_4[lane] =
            level_8[2 * lane] + level_8[2 * lane + 1];
    }
dot_reduce_2_loop:
    for (int lane = 0; lane < 2; ++lane) {
#pragma HLS UNROLL
        level_2[lane] =
            level_4[2 * lane] + level_4[2 * lane + 1];
    }
    return level_2[0] + level_2[1];
}

static ap_uint<32> swiftkv_raw_magnitude(
    ap_int<32> raw
) {
#pragma HLS INLINE
    const ap_int<33> extended = (ap_int<33>)raw;
    return raw < 0
        ? (ap_uint<32>)(-extended)
        : (ap_uint<32>)extended;
}

static swiftkv_kv_shift_t swiftkv_kv_power2_shift(
    ap_uint<32> maximum
) {
#pragma HLS INLINE
    // Five fixed compare/shift stages form a logarithmic priority encoder.
    // The former fully-unrolled 31-iteration scan synthesized as a long
    // overwrite/select network every time this helper was used.
    ap_uint<32> probe = maximum;
    ap_uint<5> most_significant_bit = 0;
    if (probe >= ((ap_uint<32>)1 << 16)) {
        probe >>= 16;
        most_significant_bit += 16;
    }
    if (probe >= ((ap_uint<32>)1 << 8)) {
        probe >>= 8;
        most_significant_bit += 8;
    }
    if (probe >= ((ap_uint<32>)1 << 4)) {
        probe >>= 4;
        most_significant_bit += 4;
    }
    if (probe >= ((ap_uint<32>)1 << 2)) {
        probe >>= 2;
        most_significant_bit += 2;
    }
    if (probe >= ((ap_uint<32>)1 << 1)) {
        most_significant_bit += 1;
    }
    return maximum != 0 && most_significant_bit > 6
        ? (swiftkv_kv_shift_t)(most_significant_bit - 6)
        : (swiftkv_kv_shift_t)0;
}

static ap_int<8> swiftkv_quantize_kv_raw(
    ap_int<32> raw,
    swiftkv_kv_shift_t shift
) {
#pragma HLS INLINE
    const ap_uint<32> magnitude = swiftkv_raw_magnitude(raw);
    const ap_uint<32> rounding =
        shift == 0
            ? (ap_uint<32>)0
            : (ap_uint<32>)1 << ((int)shift - 1);
    const ap_uint<32> rounded_magnitude = magnitude + rounding;
#pragma HLS BIND_OP variable=rounded_magnitude op=add impl=fabric latency=1
    ap_uint<32> quantized_magnitude =
        rounded_magnitude >> (int)shift;
    if (quantized_magnitude > 127) {
        quantized_magnitude = 127;
    }
    ap_int<9> signed_quantized =
        (ap_int<9>)quantized_magnitude;
    if (raw < 0) {
        signed_quantized = (ap_int<9>)(-signed_quantized);
    }
    return (ap_int<8>)signed_quantized;
}

static ap_int<32> swiftkv_dequantize_kv_raw(
    ap_int<8> quantized,
    swiftkv_kv_shift_t shift
) {
#pragma HLS INLINE
    // The encoder chooses shift = msb(max)-6, hence |q|<=127 and shift<=25
    // for every signed 32-bit Q15.17 input.  The reconstructed value is
    // therefore provably inside int32; saturation logic is unreachable.
    return (ap_int<32>)quantized << (int)shift;
}

static void swiftkv_quantize_kv_record(
    const int4_output_word_t k_words[SWIFTKV_WORDS_PER_HEAD],
    const int4_output_word_t v_words[SWIFTKV_WORDS_PER_HEAD],
    int4_output_word_t record[SWIFTKV_KV_WORDS_PER_TOKEN_HEAD]
) {
#pragma HLS INLINE off
    int4_output_word_t metadata = 0;
    ap_uint<256> packed_k_group_all[SWIFTKV_KV_GROUPS_PER_HEAD];
    ap_uint<256> packed_v_group_all[SWIFTKV_KV_GROUPS_PER_HEAD];
#pragma HLS ARRAY_PARTITION variable=packed_k_group_all complete
#pragma HLS ARRAY_PARTITION variable=packed_v_group_all complete

quantize_kv_group_loop:
    for (int group = 0;
         group < SWIFTKV_KV_GROUPS_PER_HEAD;
         ++group) {
        ap_uint<32> maximum_k = 0;
        ap_uint<32> maximum_v = 0;
        ap_int<32> raw_k[SWIFTKV_KV_GROUP_SIZE];
        ap_int<32> raw_v[SWIFTKV_KV_GROUP_SIZE];
        ap_int<8> quantized_k_group[SWIFTKV_KV_GROUP_SIZE];
        ap_int<8> quantized_v_group[SWIFTKV_KV_GROUP_SIZE];
#pragma HLS ARRAY_PARTITION variable=raw_k complete
#pragma HLS ARRAY_PARTITION variable=raw_v complete
#pragma HLS ARRAY_PARTITION variable=quantized_k_group complete
#pragma HLS ARRAY_PARTITION variable=quantized_v_group complete
        const int4_output_word_t k_lower = k_words[2 * group];
        const int4_output_word_t k_upper = k_words[2 * group + 1];
        const int4_output_word_t v_lower = v_words[2 * group];
        const int4_output_word_t v_upper = v_words[2 * group + 1];

    unpack_kv_group_loop:
        for (int lane = 0;
             lane < SWIFTKV_KV_GROUP_SIZE;
             ++lane) {
#pragma HLS UNROLL
            const bool upper = lane >= INT4_OUTPUTS_PER_WORD;
            const int packed_lane =
                lane & (INT4_OUTPUTS_PER_WORD - 1);
            const ap_int<32> k_raw =
                upper
                    ? (ap_int<32>)k_upper.range(
                        32 * packed_lane + 31, 32 * packed_lane)
                    : (ap_int<32>)k_lower.range(
                        32 * packed_lane + 31, 32 * packed_lane);
            const ap_int<32> v_raw =
                upper
                    ? (ap_int<32>)v_upper.range(
                        32 * packed_lane + 31, 32 * packed_lane)
                    : (ap_int<32>)v_lower.range(
                        32 * packed_lane + 31, 32 * packed_lane);
            raw_k[lane] = k_raw;
            raw_v[lane] = v_raw;
        }

    find_kv_group_max_block_loop:
        for (int block = 0;
             block < SWIFTKV_KV_GROUP_SIZE / 4;
             ++block) {
#pragma HLS PIPELINE II=1
            ap_uint<32> magnitude_k[4];
            ap_uint<32> magnitude_v[4];
#pragma HLS ARRAY_PARTITION variable=magnitude_k complete
#pragma HLS ARRAY_PARTITION variable=magnitude_v complete
        find_kv_group_max_lane_loop:
            for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
                const int index = block * 4 + lane;
                magnitude_k[lane] =
                    swiftkv_raw_magnitude(raw_k[index]);
                magnitude_v[lane] =
                    swiftkv_raw_magnitude(raw_v[index]);
            }
            const ap_uint<32> max_k_01 =
                magnitude_k[0] > magnitude_k[1]
                    ? magnitude_k[0] : magnitude_k[1];
            const ap_uint<32> max_k_23 =
                magnitude_k[2] > magnitude_k[3]
                    ? magnitude_k[2] : magnitude_k[3];
            const ap_uint<32> block_max_k =
                max_k_01 > max_k_23 ? max_k_01 : max_k_23;
            const ap_uint<32> max_v_01 =
                magnitude_v[0] > magnitude_v[1]
                    ? magnitude_v[0] : magnitude_v[1];
            const ap_uint<32> max_v_23 =
                magnitude_v[2] > magnitude_v[3]
                    ? magnitude_v[2] : magnitude_v[3];
            const ap_uint<32> block_max_v =
                max_v_01 > max_v_23 ? max_v_01 : max_v_23;
            if (block_max_k > maximum_k) {
                maximum_k = block_max_k;
            }
            if (block_max_v > maximum_v) {
                maximum_v = block_max_v;
            }
        }

        const swiftkv_kv_shift_t shift_k =
            swiftkv_kv_power2_shift(maximum_k);
        const swiftkv_kv_shift_t shift_v =
            swiftkv_kv_power2_shift(maximum_v);
        metadata.range(
            group * SWIFTKV_KV_SCALE_SHIFT_BITS +
                SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
            group * SWIFTKV_KV_SCALE_SHIFT_BITS) = shift_k;
        const int v_shift_bit =
            SWIFTKV_KV_GROUPS_PER_HEAD *
                SWIFTKV_KV_SCALE_SHIFT_BITS +
            group * SWIFTKV_KV_SCALE_SHIFT_BITS;
        metadata.range(
            v_shift_bit + SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
            v_shift_bit) = shift_v;

        ap_uint<256> packed_k_group = 0;
        ap_uint<256> packed_v_group = 0;

    quantize_kv_group_block_loop:
        for (int block = 0;
             block < SWIFTKV_KV_GROUP_SIZE / 4;
             ++block) {
#pragma HLS PIPELINE II=1
        quantize_kv_group_lane_loop:
            for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
                const int index = block * 4 + lane;
                quantized_k_group[index] =
                    swiftkv_quantize_kv_raw(raw_k[index], shift_k);
                quantized_v_group[index] =
                    swiftkv_quantize_kv_raw(raw_v[index], shift_v);
            }
        }

    pack_quantized_kv_group_loop:
        for (int lane = 0;
             lane < SWIFTKV_KV_GROUP_SIZE;
             ++lane) {
#pragma HLS UNROLL
            packed_k_group.range(8 * lane + 7, 8 * lane) =
                (ap_uint<8>)quantized_k_group[lane];
            packed_v_group.range(8 * lane + 7, 8 * lane) =
                (ap_uint<8>)quantized_v_group[lane];
        }

        packed_k_group_all[group] = packed_k_group;
        packed_v_group_all[group] = packed_v_group;
    }

    record[0] = metadata;
    record[1].range(255, 0) = packed_k_group_all[0];
    record[1].range(511, 256) = packed_k_group_all[1];
    record[2].range(255, 0) = packed_k_group_all[2];
    record[2].range(511, 256) = packed_k_group_all[3];
    record[3].range(255, 0) = packed_v_group_all[0];
    record[3].range(511, 256) = packed_v_group_all[1];
    record[4].range(255, 0) = packed_v_group_all[2];
    record[4].range(511, 256) = packed_v_group_all[3];
}

static void swiftkv_split_update_word(
    const int4_output_word_t value,
    swiftkv_update_engine_word_t& engine0,
    swiftkv_update_engine_word_t& engine1,
    swiftkv_update_engine_word_t& engine2,
    swiftkv_update_engine_word_t& engine3
) {
#pragma HLS INLINE

split_update_word_phase_loop:
    for (int phase = 0;
         phase < SWIFTKV_KV_VALUES_PER_WORD /
                     SWIFTKV_UPDATE_LANES;
         ++phase) {
#pragma HLS UNROLL
    split_update_word_engine_loop:
        for (int engine = 0;
             engine < SWIFTKV_UPDATE_ENGINES;
             ++engine) {
#pragma HLS UNROLL
            const int source_bit =
                (phase * SWIFTKV_UPDATE_LANES +
                 engine * SWIFTKV_UPDATE_ENGINE_LANES) *
                SWIFTKV_KV_CACHE_BITS;
            const int destination_bit =
                phase * SWIFTKV_UPDATE_ENGINE_LANES *
                SWIFTKV_KV_CACHE_BITS;
            const ap_uint<SWIFTKV_UPDATE_ENGINE_VALUE_BITS> slice =
                value.range(
                    source_bit +
                        SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1,
                    source_bit);
            if (engine == 0) {
                engine0.range(
                    destination_bit +
                        SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1,
                    destination_bit) = slice;
            } else if (engine == 1) {
                engine1.range(
                    destination_bit +
                        SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1,
                    destination_bit) = slice;
            } else if (engine == 2) {
                engine2.range(
                    destination_bit +
                        SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1,
                    destination_bit) = slice;
            } else {
                engine3.range(
                    destination_bit +
                        SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1,
                    destination_bit) = slice;
            }
        }
    }
}

static void swiftkv_write_split_update_word(
    const int4_output_word_t value,
    hls::stream<swiftkv_update_engine_word_t>& engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& engine3_stream
) {
#pragma HLS INLINE
    swiftkv_update_engine_word_t engine0 = 0;
    swiftkv_update_engine_word_t engine1 = 0;
    swiftkv_update_engine_word_t engine2 = 0;
    swiftkv_update_engine_word_t engine3 = 0;
    swiftkv_split_update_word(
        value, engine0, engine1, engine2, engine3);
    engine0_stream.write(engine0);
    engine1_stream.write(engine1);
    engine2_stream.write(engine2);
    engine3_stream.write(engine3);
}

static void swiftkv_route_compressed_kv_word(
    int record_word,
    const int4_output_word_t value,
    hls::stream<ap_uint<40> >& key_metadata_stream,
    hls::stream<ap_uint<40> >& value_metadata_stream,
    hls::stream<int4_output_word_t>& key0_stream,
    hls::stream<int4_output_word_t>& key1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine3_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine3_stream
) {
#pragma HLS INLINE
    if (record_word == 0) {
        const ap_uint<40> metadata = value.range(39, 0);
        key_metadata_stream.write(metadata);
        value_metadata_stream.write(metadata);
    } else if (record_word == 1) {
        key0_stream.write(value);
    } else if (record_word == 2) {
        key1_stream.write(value);
    } else if (record_word == 3) {
        swiftkv_write_split_update_word(
            value,
            value0_engine0_stream, value0_engine1_stream,
            value0_engine2_stream, value0_engine3_stream);
    } else {
        swiftkv_write_split_update_word(
            value,
            value1_engine0_stream, value1_engine1_stream,
            value1_engine2_stream, value1_engine3_stream);
    }
}

// Keep the AXI read engine local to its DDR/SLR and terminate it at a narrow
// control boundary: a 512-bit BRAM FIFO.  The previous implementation read an
// AXI word and immediately routed it into one of six downstream K/V FIFOs in
// the same pipelined process.  Consequently downstream back-pressure and the
// record-word selector reached the AXI R channel, while RVALID/data also drove
// the distant K/V URAM FIFOs directly.  Splitting reader and router preserves
// one AXI beat/cycle but inserts a physical register/memory boundary between
// those two timing domains.
static void swiftkv_read_compressed_kv_cache(
    const int4_output_word_t* kv_cache,
    int head_base,
    ap_uint<12> position,
    hls::stream<int4_output_word_t>& cached_kv_word_stream
) {
#pragma HLS INLINE off
    const int cached_tokens = (int)position;
    const int cached_words =
        cached_tokens *
        SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;

read_compressed_kv_loop:
    for (int word = 0; word < cached_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=0 max=20475
        cached_kv_word_stream.write(kv_cache[head_base + word]);
    }
}

// Convert the five scalar words into a local FIFO inside the attention
// DATAFLOW region.  Passing the complete-partitioned array through the
// function boundary created a PIPO whose ap_ready/val_read controls drove
// roughly 1.8k loads per PE after placement.
static void swiftkv_emit_current_record(
    int4_output_word_t metadata,
    int4_output_word_t key0,
    int4_output_word_t key1,
    int4_output_word_t value0,
    int4_output_word_t value1,
    hls::stream<int4_output_word_t>& current_record_stream
) {
#pragma HLS INLINE off
    current_record_stream.write(metadata);
    current_record_stream.write(key0);
    current_record_stream.write(key1);
    current_record_stream.write(value0);
    current_record_stream.write(value1);
}

static void swiftkv_route_compressed_kv_cache(
    ap_uint<12> position,
    hls::stream<int4_output_word_t>& cached_kv_word_stream,
    hls::stream<int4_output_word_t>& current_record_stream,
    hls::stream<ap_uint<40> >& key_metadata_stream,
    hls::stream<ap_uint<40> >& value_metadata_stream,
    hls::stream<int4_output_word_t>& key0_stream,
    hls::stream<int4_output_word_t>& key1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine3_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine3_stream
) {
#pragma HLS INLINE off
    const int cached_tokens = (int)position;
    const int cached_words =
        cached_tokens *
        SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
    const int total_words =
        cached_words + SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
    ap_uint<3> record_word = 0;

// Keep one word/cycle, but use the normal stallable pipeline.  The former FRP
// implementation generated a 4,702-load initialization/control cone; its
// replicated ap_loop_init/ap_start registers became routed critical paths in
// PE3.  This loop has natural FIFO back-pressure, so FRP adds control without
// adding useful throughput.
route_all_compressed_kv_loop:
    for (int word = 0; word < total_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=5 max=20480
        const bool is_cached = word < cached_words;
        const int4_output_word_t value = is_cached
            ? cached_kv_word_stream.read()
            : current_record_stream.read();
        swiftkv_route_compressed_kv_word(
            (int)record_word, value,
            key_metadata_stream, value_metadata_stream,
            key0_stream, key1_stream,
            value0_engine0_stream, value0_engine1_stream,
            value0_engine2_stream, value0_engine3_stream,
            value1_engine0_stream, value1_engine1_stream,
            value1_engine2_stream, value1_engine3_stream);
        record_word =
            record_word == SWIFTKV_KV_WORDS_PER_TOKEN_HEAD - 1
                ? (ap_uint<3>)0
                : (ap_uint<3>)(record_word + 1);
    }
}

static void swiftkv_split_packed_key_word(
    const int4_output_word_t packed_key,
    hls::stream<swiftkv_update_engine_word_t>& chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk3_stream
) {
#pragma HLS INLINE
    chunk0_stream.write(packed_key.range(127, 0));
    chunk1_stream.write(packed_key.range(255, 128));
    chunk2_stream.write(packed_key.range(383, 256));
    chunk3_stream.write(packed_key.range(511, 384));
}

template <int KEY_WORD>
static void swiftkv_split_packed_key_stream_body(
    hls::stream<int4_output_word_t>& packed_key_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& chunk3_stream,
    ap_uint<12> position
) {
#pragma HLS INLINE
split_packed_key_token_loop:
    for (int token = 0; token <= (int)position; ++token) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1 max=SWIFTKV_MAX_SEQ_LEN
        swiftkv_split_packed_key_word(
            packed_key_stream.read(),
            chunk0_stream, chunk1_stream,
            chunk2_stream, chunk3_stream);
    }
}

static void swiftkv_split_packed_key0_stream(
    hls::stream<int4_output_word_t>& packed_key0_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk3_stream,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    swiftkv_split_packed_key_stream_body<0>(
        packed_key0_stream,
        key0_chunk0_stream, key0_chunk1_stream,
        key0_chunk2_stream, key0_chunk3_stream,
        position);
}

static void swiftkv_split_packed_key1_stream(
    hls::stream<int4_output_word_t>& packed_key1_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk3_stream,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    swiftkv_split_packed_key_stream_body<1>(
        packed_key1_stream,
        key1_chunk0_stream, key1_chunk1_stream,
        key1_chunk2_stream, key1_chunk3_stream,
        position);
}

static int4_output_word_t swiftkv_expand_kv_chunk(
    ap_uint<128> compressed,
    swiftkv_kv_shift_t shift
) {
#pragma HLS INLINE
    int4_output_word_t expanded = 0;
expand_kv_chunk_lane_loop:
    for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
        const ap_int<8> quantized =
            (ap_int<8>)compressed.range(
                lane * SWIFTKV_KV_CACHE_BITS +
                    SWIFTKV_KV_CACHE_BITS - 1,
                lane * SWIFTKV_KV_CACHE_BITS);
        expanded.range(32 * lane + 31, 32 * lane) =
            (ap_uint<32>)swiftkv_dequantize_kv_raw(
                quantized, shift);
    }
    return expanded;
}

// Dot directly against the INT8 block-floating K payload.  All sixteen
// Q15.17-by-INT8 products are accumulated before applying the shared G32
// power-of-two scale, so only one 44-bit dynamic shifter is required per
// active lane group instead of sixteen 32-bit dequantization shifters.
static swiftkv_dot_t swiftkv_dot16_int8(
    const int4_fxp32_t q_values[16],
    ap_uint<128> compressed,
    swiftkv_kv_shift_t shift
) {
#pragma HLS INLINE
    ap_int<40> product[16];
    ap_int<41> level_8[8];
    ap_int<42> level_4[4];
    ap_int<43> level_2[2];
#pragma HLS ARRAY_PARTITION variable=product complete
#pragma HLS ARRAY_PARTITION variable=level_8 complete
#pragma HLS ARRAY_PARTITION variable=level_4 complete
#pragma HLS ARRAY_PARTITION variable=level_2 complete
#pragma HLS BIND_OP variable=product op=mul impl=dsp latency=3

dot_int8_lane_loop:
    for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
        const ap_int<32> query_raw =
            (ap_int<32>)q_values[lane].range(31, 0);
        const ap_int<8> key =
            (ap_int<8>)compressed.range(8 * lane + 7, 8 * lane);
        product[lane] = query_raw * key;
    }
dot_int8_reduce_8_loop:
    for (int lane = 0; lane < 8; ++lane) {
#pragma HLS UNROLL
        level_8[lane] =
            (ap_int<41>)product[2 * lane] +
            (ap_int<41>)product[2 * lane + 1];
    }
dot_int8_reduce_4_loop:
    for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
        level_4[lane] =
            (ap_int<42>)level_8[2 * lane] +
            (ap_int<42>)level_8[2 * lane + 1];
    }
dot_int8_reduce_2_loop:
    for (int lane = 0; lane < 2; ++lane) {
#pragma HLS UNROLL
        level_2[lane] =
            (ap_int<43>)level_4[2 * lane] +
            (ap_int<43>)level_4[2 * lane + 1];
    }
    const ap_int<44> sum =
        (ap_int<44>)level_2[0] + (ap_int<44>)level_2[1];

    // swiftkv_dot_t has 24 fractional bits. Q_raw*K_q has 17 fractional
    // query bits and K_q represents raw K shifted by `shift`, so the exact
    // output conversion is 2^(shift-10).
    ap_int<60> scaled = sum;
    if (shift >= 10) {
        scaled <<= (int)shift - 10;
    } else {
        scaled >>= 10 - (int)shift;
    }
    swiftkv_dot_t output = 0;
    output.range(43, 0) = scaled.range(43, 0);
    return output;
}

// Consume one five-word compressed KV record per token, calculate QK without
// materializing Q15.17 K words, and forward only metadata+V (three words) to
// the online-softmax value recurrence.
static void swiftkv_process_compressed_kv(
    const int4_fxp32_t query[SWIFTKV_HEAD_SIZE],
    hls::stream<ap_uint<40> >& key_metadata_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& key0_chunk3_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk0_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk1_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk2_stream,
    hls::stream<swiftkv_update_engine_word_t>& key1_chunk3_stream,
    ap_uint<12> position,
    hls::stream<int4_fxp32_t>& score_stream
) {
#pragma HLS INLINE off
    const int4_fxp32_t score_scale =
        (int4_fxp32_t)0.08838834764831845;
    // The old single phase loop performed three blocking FIFO reads in phase
    // zero.  Its stall enable was consequently replicated into 1,044--1,097
    // arithmetic registers per PE in the routed DCP.  Read one complete key
    // record before starting a fixed, free-running eight-phase dot pipeline;
    // only the narrow record boundary can now stall.
compressed_dot_token_loop:
    for (int token = 0; token <= (int)position; ++token) {
#pragma HLS LOOP_FLATTEN off
#pragma HLS LOOP_TRIPCOUNT min=1 max=SWIFTKV_MAX_SEQ_LEN
        const ap_uint<40> metadata = key_metadata_stream.read();
        ap_uint<128> key_chunk[8];
        swiftkv_kv_shift_t key_shift[4];
#pragma HLS ARRAY_PARTITION variable=key_chunk complete
#pragma HLS ARRAY_PARTITION variable=key_shift complete
        key_chunk[0] = key0_chunk0_stream.read();
        key_chunk[1] = key0_chunk1_stream.read();
        key_chunk[2] = key0_chunk2_stream.read();
        key_chunk[3] = key0_chunk3_stream.read();
        key_chunk[4] = key1_chunk0_stream.read();
        key_chunk[5] = key1_chunk1_stream.read();
        key_chunk[6] = key1_chunk2_stream.read();
        key_chunk[7] = key1_chunk3_stream.read();
    extract_key_shift_loop:
        for (int group = 0;
             group < SWIFTKV_KV_GROUPS_PER_HEAD;
             ++group) {
#pragma HLS UNROLL
            key_shift[group] = metadata.range(
                group * SWIFTKV_KV_SCALE_SHIFT_BITS +
                    SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
                group * SWIFTKV_KV_SCALE_SHIFT_BITS);
        }

        swiftkv_dot_t group_first_half = 0;
        swiftkv_dot_t token_dot = 0;
    compressed_dot_phase_loop:
        for (int phase = 0; phase < 8; ++phase) {
// The record reads already sit outside this fixed phase loop.  FRP therefore
// adds no useful decoupling here, but HLS estimates a 7,360-load global
// control net for it.  The standard II=1 controller keeps backpressure local
// to score_stream and lets RTL synthesis replicate the small stage enables.
#pragma HLS PIPELINE II=1 style=stp
#pragma HLS LOOP_TRIPCOUNT min=8 max=8
            const int group = phase >> 1;
            const int half = phase & 1;
            int4_fxp32_t query_lanes[16];
#pragma HLS ARRAY_PARTITION variable=query_lanes complete
        load_compressed_dot_query_loop:
            for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
                query_lanes[lane] = query[
                    group * SWIFTKV_KV_GROUP_SIZE +
                    half * 16 + lane];
            }
            const swiftkv_dot_t partial = swiftkv_dot16_int8(
                query_lanes, key_chunk[phase], key_shift[group]);
            if (half == 0) {
                group_first_half = partial;
            } else {
                const swiftkv_dot_t group_dot =
                    (swiftkv_dot_t)(group_first_half + partial);
                const swiftkv_dot_t next_dot =
                    group == 0
                        ? group_dot
                        : (swiftkv_dot_t)(token_dot + group_dot);
                token_dot = next_dot;
                if (group == SWIFTKV_KV_GROUPS_PER_HEAD - 1) {
                    const int4_fxp32_t score =
                        (int4_fxp32_t)(next_dot * score_scale);
#pragma HLS BIND_OP variable=score op=mul impl=dsp latency=4
                    score_stream.write(score);
                }
            }
        }
    }
}

static void swiftkv_expand_compressed_kv(
    hls::stream<int4_output_word_t>& compressed_stream,
    ap_uint<12> position,
    hls::stream<int4_output_word_t>& kv_word_stream
) {
#pragma HLS INLINE off

expand_kv_token_loop:
    for (int token = 0; token <= (int)position; ++token) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=SWIFTKV_MAX_SEQ_LEN
        const int4_output_word_t metadata =
            compressed_stream.read();
        int4_output_word_t packed_k[
            SWIFTKV_KV_DATA_WORDS_PER_VECTOR];
        int4_output_word_t packed_v[
            SWIFTKV_KV_DATA_WORDS_PER_VECTOR];
#pragma HLS ARRAY_PARTITION variable=packed_k complete
#pragma HLS ARRAY_PARTITION variable=packed_v complete
    read_compressed_kv_data_loop:
        for (int word = 0;
             word < SWIFTKV_KV_DATA_WORDS_PER_VECTOR;
             ++word) {
#pragma HLS PIPELINE II=1
            packed_k[word] = compressed_stream.read();
        }
    read_compressed_v_data_loop:
        for (int word = 0;
             word < SWIFTKV_KV_DATA_WORDS_PER_VECTOR;
             ++word) {
#pragma HLS PIPELINE II=1
            packed_v[word] = compressed_stream.read();
        }

    expand_k_words_loop:
        for (int output_word = 0;
             output_word < SWIFTKV_WORDS_PER_HEAD;
             ++output_word) {
#pragma HLS PIPELINE II=1
            const int group = output_word >> 1;
            const int packed_word = output_word >> 2;
            const int quarter = output_word & 3;
            const swiftkv_kv_shift_t shift =
                metadata.range(
                    group * SWIFTKV_KV_SCALE_SHIFT_BITS +
                        SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
                    group * SWIFTKV_KV_SCALE_SHIFT_BITS);
            const ap_uint<128> chunk =
                packed_k[packed_word].range(
                    quarter * 128 + 127,
                    quarter * 128);
            kv_word_stream.write(
                swiftkv_expand_kv_chunk(chunk, shift));
        }

    expand_v_words_loop:
        for (int output_word = 0;
             output_word < SWIFTKV_WORDS_PER_HEAD;
             ++output_word) {
#pragma HLS PIPELINE II=1
            const int group = output_word >> 1;
            const int packed_word = output_word >> 2;
            const int quarter = output_word & 3;
            const int shift_bit =
                SWIFTKV_KV_GROUPS_PER_HEAD *
                    SWIFTKV_KV_SCALE_SHIFT_BITS +
                group * SWIFTKV_KV_SCALE_SHIFT_BITS;
            const swiftkv_kv_shift_t shift =
                metadata.range(
                    shift_bit + SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
                    shift_bit);
            const ap_uint<128> chunk =
                packed_v[packed_word].range(
                    quarter * 128 + 127,
                    quarter * 128);
            kv_word_stream.write(
                swiftkv_expand_kv_chunk(chunk, shift));
        }
    }
}

static void swiftkv_demux_kv_and_dot(
    const int4_fxp32_t query[SWIFTKV_HEAD_SIZE],
    hls::stream<int4_output_word_t>& kv_word_stream,
    ap_uint<12> position,
    hls::stream<swiftkv_dot_t>& dot_partial_stream,
    hls::stream<int4_output_word_t>& value_stream
) {
#pragma HLS INLINE off

    const int total_words =
        ((int)position + 1) *
        SWIFTKV_EXPANDED_KV_WORDS_PER_TOKEN_HEAD;

// Flatten the K8,V8 token records into one unit-stride II=1 pipeline.
// Dot-product latency is carried across following words instead of flushing
// an eight-word pipeline at every token boundary.
demux_kv_word_loop:
    for (int stream_word = 0;
         stream_word < total_words;
         ++stream_word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=16 max=65536
        const int phase =
            stream_word &
            (SWIFTKV_EXPANDED_KV_WORDS_PER_TOKEN_HEAD - 1);
        const int4_output_word_t kv_word = kv_word_stream.read();
        if (phase < SWIFTKV_WORDS_PER_HEAD) {
            int4_fxp32_t q_word[16];
#pragma HLS ARRAY_PARTITION variable=q_word complete
        demux_q_lane_loop:
            for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
                q_word[lane] =
                    query[phase * INT4_OUTPUTS_PER_WORD + lane];
            }
            dot_partial_stream.write(
                swiftkv_dot16(q_word, kv_word));
        } else {
            value_stream.write(kv_word);
        }
    }
}

static void swiftkv_reduce_dot_partials(
    hls::stream<swiftkv_dot_t>& dot_partial_stream,
    ap_uint<12> position,
    hls::stream<int4_fxp32_t>& score_stream
) {
#pragma HLS INLINE off

    const int partial_count =
        ((int)position + 1) * SWIFTKV_WORDS_PER_HEAD;
    swiftkv_dot_t accumulator = 0;
    const int4_fxp32_t score_scale =
        (int4_fxp32_t)0.08838834764831845;

reduce_dot_partial_loop:
    for (int partial_index = 0;
         partial_index < partial_count;
         ++partial_index) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=8 max=32768
        const int word =
            partial_index & (SWIFTKV_WORDS_PER_HEAD - 1);
        const swiftkv_dot_t partial = dot_partial_stream.read();
        const swiftkv_dot_t next_sum =
            word == 0
                ? partial
                : (swiftkv_dot_t)(accumulator + partial);
        if (word == SWIFTKV_WORDS_PER_HEAD - 1) {
            const int4_fxp32_t score =
                (int4_fxp32_t)(next_sum * score_scale);
#pragma HLS BIND_OP variable=score op=mul impl=dsp latency=4
            score_stream.write(score);
        }
        accumulator = next_sum;
    }
}

static void swiftkv_coefficient_producer(
    hls::stream<int4_fxp32_t>& score_stream,
    ap_uint<12> position,
    hls::stream<swiftkv_update_control_t>& control_stream,
    hls::stream<int4_fxp32_t>& inverse_normalization_stream
) {
#pragma HLS INLINE off

    int4_fxp32_t running_max = 0;
    swiftkv_normalization_t normalization = 0;

coefficient_token_loop:
    for (int token = 0; token <= (int)position; ++token) {
#pragma HLS PIPELINE II=6
#pragma HLS LOOP_TRIPCOUNT min=1 max=SWIFTKV_MAX_SEQ_LEN
        const int4_fxp32_t score = score_stream.read();
        swiftkv_coefficient_t coefficient = 1.0;
        bool rescale_history = false;

        if (token == 0) {
            running_max = score;
            normalization = 1.0;
        } else if (score <= running_max) {
            coefficient =
                swiftkv_exp_negative(score - running_max);
            normalization =
                (swiftkv_normalization_t)(
                    normalization +
                    (swiftkv_normalization_t)coefficient);
        } else {
            coefficient =
                swiftkv_exp_negative(running_max - score);
            const swiftkv_normalization_t scaled_normalization =
                (swiftkv_normalization_t)(
                    normalization * coefficient);
#pragma HLS BIND_OP variable=scaled_normalization op=mul impl=dsp latency=4
            normalization =
                (swiftkv_normalization_t)(
                    scaled_normalization +
                    (swiftkv_normalization_t)1.0);
            running_max = score;
            rescale_history = true;
        }

        swiftkv_update_control_t control = 0;
        control.range(17, 0) =
            (ap_uint<18>)coefficient.range(17, 0);
        control[18] = rescale_history;
        control_stream.write(control);
    }

    const int4_fxp32_t inverse_normalization =
        swiftkv_reciprocal_normalization(normalization);
    inverse_normalization_stream.write(inverse_normalization);
}

static void swiftkv_broadcast_update_controls(
    hls::stream<ap_uint<40> >& value_metadata_stream,
    hls::stream<swiftkv_update_control_t>& control_stream,
    ap_uint<12> position,
    hls::stream<swiftkv_update_token_control_t>& engine0_control_stream,
    hls::stream<swiftkv_update_token_control_t>& engine1_control_stream,
    hls::stream<swiftkv_update_token_control_t>& engine2_control_stream,
    hls::stream<swiftkv_update_token_control_t>& engine3_control_stream
) {
#pragma HLS INLINE off

broadcast_update_control_loop:
    for (int token = 0; token <= (int)position; ++token) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=SWIFTKV_MAX_SEQ_LEN
#pragma HLS PIPELINE II=1
        swiftkv_update_token_control_t token_control = 0;
        token_control.range(39, 0) = value_metadata_stream.read();
        token_control.range(58, 40) = control_stream.read();
        engine0_control_stream.write(token_control);
        engine1_control_stream.write(token_control);
        engine2_control_stream.write(token_control);
        engine3_control_stream.write(token_control);
    }
}

template<int ENGINE_ID>
static void swiftkv_prepare_update_engine_phases(
    hls::stream<swiftkv_update_token_control_t>& token_control_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_stream,
    ap_uint<12> position,
    hls::stream<swiftkv_update_engine_packet_t>& phase_stream
) {
#pragma HLS INLINE off

    const int update_phase_count =
        ((int)position + 1) * SWIFTKV_UPDATE_PHASES;
    swiftkv_coefficient_t coefficient = 1.0;
    bool rescale_history = false;
    swiftkv_kv_shift_t value_shift[SWIFTKV_KV_GROUPS_PER_HEAD];
    swiftkv_update_engine_word_t value_word = 0;
#pragma HLS ARRAY_PARTITION variable=value_shift complete

prepare_update_engine_phase_loop:
    for (int update_phase = 0;
         update_phase < update_phase_count;
         ++update_phase) {
#pragma HLS PIPELINE II=1
        const int phase =
            update_phase & (SWIFTKV_UPDATE_PHASES - 1);
        const int token = update_phase / SWIFTKV_UPDATE_PHASES;
        if (phase == 0) {
            const swiftkv_update_token_control_t token_control =
                token_control_stream.read();
            const ap_uint<40> metadata =
                token_control.range(39, 0);
            const swiftkv_update_control_t control =
                token_control.range(58, 40);
            coefficient.range(17, 0) = control.range(17, 0);
            rescale_history = control[18];
            value_word = value0_stream.read();
        extract_prepare_engine_value_shift_loop:
            for (int group = 0;
                 group < SWIFTKV_KV_GROUPS_PER_HEAD;
                 ++group) {
#pragma HLS UNROLL
                const int shift_bit =
                    SWIFTKV_KV_GROUPS_PER_HEAD *
                        SWIFTKV_KV_SCALE_SHIFT_BITS +
                    group * SWIFTKV_KV_SCALE_SHIFT_BITS;
                value_shift[group] = metadata.range(
                    shift_bit + SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
                    shift_bit);
            }
        }
        if (phase ==
            SWIFTKV_KV_VALUES_PER_WORD / SWIFTKV_UPDATE_LANES) {
            value_word = value1_stream.read();
        }
        const int group =
            phase /
            (SWIFTKV_KV_GROUP_SIZE / SWIFTKV_UPDATE_LANES);
        const ap_uint<SWIFTKV_UPDATE_ENGINE_VALUE_BITS> packed_values =
            value_word.range(SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1, 0);
        value_word >>= SWIFTKV_UPDATE_ENGINE_VALUE_BITS;

        swiftkv_update_engine_packet_t packet = 0;
        packet.range(SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1, 0) =
            packed_values;
        packet.range(
            SWIFTKV_UPDATE_ENGINE_SHIFT_LSB +
                SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
            SWIFTKV_UPDATE_ENGINE_SHIFT_LSB) = value_shift[group];
        packet.range(
            SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB + 17,
            SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB) =
            coefficient.range(17, 0);
        packet[SWIFTKV_UPDATE_ENGINE_RESCALE_BIT] = rescale_history;
        packet[SWIFTKV_UPDATE_ENGINE_TOKEN_NONZERO_BIT] = token != 0;
        phase_stream.write(packet);
    }
}

template<int ENGINE_ID>
static void swiftkv_update_value_engine(
    hls::stream<swiftkv_update_engine_packet_t>& phase_stream,
    ap_uint<12> position,
    swiftkv_state_t weighted_value[SWIFTKV_UPDATE_ENGINE_VALUES]
) {
#pragma HLS INLINE off

initialize_weighted_value_engine_phase_loop:
    for (int phase = 0; phase < SWIFTKV_UPDATE_PHASES; ++phase) {
#pragma HLS PIPELINE II=1
    initialize_weighted_value_engine_lane_loop:
        for (int lane = 0;
             lane < SWIFTKV_UPDATE_ENGINE_LANES;
             ++lane) {
#pragma HLS UNROLL
            weighted_value[
                phase * SWIFTKV_UPDATE_ENGINE_LANES + lane] = 0;
        }
    }

    const int update_phase_count =
        ((int)position + 1) * SWIFTKV_UPDATE_PHASES;

update_value_engine_phase_loop:
    for (int update_phase = 0;
         update_phase < update_phase_count;
         ++update_phase) {
#pragma HLS PIPELINE II=1
#pragma HLS DEPENDENCE variable=weighted_value inter false
        const swiftkv_update_engine_packet_t packet =
            phase_stream.read();
        const int phase =
            update_phase & (SWIFTKV_UPDATE_PHASES - 1);
        const ap_uint<SWIFTKV_UPDATE_ENGINE_VALUE_BITS> packed_values =
            packet.range(SWIFTKV_UPDATE_ENGINE_VALUE_BITS - 1, 0);
        const swiftkv_kv_shift_t value_shift = packet.range(
            SWIFTKV_UPDATE_ENGINE_SHIFT_LSB +
                SWIFTKV_KV_SCALE_SHIFT_BITS - 1,
            SWIFTKV_UPDATE_ENGINE_SHIFT_LSB);
        swiftkv_coefficient_t coefficient = 0;
        coefficient.range(17, 0) = packet.range(
            SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB + 17,
            SWIFTKV_UPDATE_ENGINE_COEFFICIENT_LSB);
        const bool rescale_history =
            packet[SWIFTKV_UPDATE_ENGINE_RESCALE_BIT];
        const bool token_nonzero =
            packet[SWIFTKV_UPDATE_ENGINE_TOKEN_NONZERO_BIT];

    update_value_engine_lane_loop:
        for (int lane = 0;
             lane < SWIFTKV_UPDATE_ENGINE_LANES;
             ++lane) {
#pragma HLS UNROLL
            const int index =
                phase * SWIFTKV_UPDATE_ENGINE_LANES + lane;
            const ap_int<8> quantized_value =
                (ap_int<8>)packed_values.range(
                    SWIFTKV_KV_CACHE_BITS * lane +
                        SWIFTKV_KV_CACHE_BITS - 1,
                    SWIFTKV_KV_CACHE_BITS * lane);
            int4_fxp32_t value = 0;
            value.range(31, 0) =
                swiftkv_dequantize_kv_raw(
                    quantized_value, value_shift);
            const swiftkv_state_t previous =
                weighted_value[index];
            swiftkv_state_t next_value =
                (swiftkv_state_t)value;
            if (token_nonzero) {
                const swiftkv_state_t multiply_operand =
                    rescale_history
                        ? previous
                        : (swiftkv_state_t)value;
                const swiftkv_state_product_t scaled_operand =
                    (swiftkv_state_product_t)(
                        multiply_operand * coefficient);
#pragma HLS BIND_OP variable=scaled_operand op=mul impl=dsp latency=4
                next_value =
                    rescale_history
                        ? (swiftkv_state_t)(
                              scaled_operand +
                              (swiftkv_state_t)value)
                        : (swiftkv_state_t)(
                               previous +
                               scaled_operand);
            }
            weighted_value[index] = next_value;
        }
    }
}

static void swiftkv_accumulate_values_split(
    hls::stream<ap_uint<40> >& value_metadata_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine3_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine3_stream,
    hls::stream<swiftkv_update_control_t>& control_stream,
    ap_uint<12> position,
    swiftkv_state_t weighted_value_engine0[SWIFTKV_UPDATE_ENGINE_VALUES],
    swiftkv_state_t weighted_value_engine1[SWIFTKV_UPDATE_ENGINE_VALUES],
    swiftkv_state_t weighted_value_engine2[SWIFTKV_UPDATE_ENGINE_VALUES],
    swiftkv_state_t weighted_value_engine3[SWIFTKV_UPDATE_ENGINE_VALUES]
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<swiftkv_update_token_control_t> engine0_control_stream;
    hls::stream<swiftkv_update_token_control_t> engine1_control_stream;
    hls::stream<swiftkv_update_token_control_t> engine2_control_stream;
    hls::stream<swiftkv_update_token_control_t> engine3_control_stream;
    hls::stream<swiftkv_update_engine_packet_t> engine0_phase_stream;
    hls::stream<swiftkv_update_engine_packet_t> engine1_phase_stream;
    hls::stream<swiftkv_update_engine_packet_t> engine2_phase_stream;
    hls::stream<swiftkv_update_engine_packet_t> engine3_phase_stream;
#pragma HLS STREAM variable=engine0_control_stream depth=4
#pragma HLS STREAM variable=engine1_control_stream depth=4
#pragma HLS STREAM variable=engine2_control_stream depth=4
#pragma HLS STREAM variable=engine3_control_stream depth=4
#pragma HLS STREAM variable=engine0_phase_stream depth=8
#pragma HLS STREAM variable=engine1_phase_stream depth=8
#pragma HLS STREAM variable=engine2_phase_stream depth=8
#pragma HLS STREAM variable=engine3_phase_stream depth=8
#pragma HLS BIND_STORAGE variable=engine0_control_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine1_control_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine2_control_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine3_control_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine0_phase_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine1_phase_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine2_phase_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=engine3_phase_stream type=fifo impl=srl

    swiftkv_broadcast_update_controls(
        value_metadata_stream,
        control_stream,
        position,
        engine0_control_stream,
        engine1_control_stream,
        engine2_control_stream,
        engine3_control_stream);
    swiftkv_prepare_update_engine_phases<0>(
        engine0_control_stream,
        value0_engine0_stream,
        value1_engine0_stream,
        position,
        engine0_phase_stream);
    swiftkv_prepare_update_engine_phases<1>(
        engine1_control_stream,
        value0_engine1_stream,
        value1_engine1_stream,
        position,
        engine1_phase_stream);
    swiftkv_prepare_update_engine_phases<2>(
        engine2_control_stream,
        value0_engine2_stream,
        value1_engine2_stream,
        position,
        engine2_phase_stream);
    swiftkv_prepare_update_engine_phases<3>(
        engine3_control_stream,
        value0_engine3_stream,
        value1_engine3_stream,
        position,
        engine3_phase_stream);
    swiftkv_update_value_engine<0>(
        engine0_phase_stream,
        position,
        weighted_value_engine0);
    swiftkv_update_value_engine<1>(
        engine1_phase_stream,
        position,
        weighted_value_engine1);
    swiftkv_update_value_engine<2>(
        engine2_phase_stream,
        position,
        weighted_value_engine2);
    swiftkv_update_value_engine<3>(
        engine3_phase_stream,
        position,
        weighted_value_engine3);
}

static void swiftkv_update_values_and_quantize(
    hls::stream<ap_uint<40> >& value_metadata_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value0_engine3_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine0_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine1_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine2_stream,
    hls::stream<swiftkv_update_engine_word_t>& value1_engine3_stream,
    hls::stream<swiftkv_update_control_t>& control_stream,
    hls::stream<int4_fxp32_t>& inverse_normalization_stream,
    ap_uint<12> position,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off

    // Four independent four-lane banks keep the recurrence local and make
    // sixteen updates/cycle without creating an eight- or sixteen-lane
    // control cone.  Each array owns exactly the dimensions of one engine.
    swiftkv_state_t
        weighted_value_engine0[SWIFTKV_UPDATE_ENGINE_VALUES];
    swiftkv_state_t
        weighted_value_engine1[SWIFTKV_UPDATE_ENGINE_VALUES];
    swiftkv_state_t
        weighted_value_engine2[SWIFTKV_UPDATE_ENGINE_VALUES];
    swiftkv_state_t
        weighted_value_engine3[SWIFTKV_UPDATE_ENGINE_VALUES];
#pragma HLS ARRAY_PARTITION variable=weighted_value_engine0 cyclic factor=SWIFTKV_UPDATE_ENGINE_LANES
#pragma HLS ARRAY_PARTITION variable=weighted_value_engine1 cyclic factor=SWIFTKV_UPDATE_ENGINE_LANES
#pragma HLS ARRAY_PARTITION variable=weighted_value_engine2 cyclic factor=SWIFTKV_UPDATE_ENGINE_LANES
#pragma HLS ARRAY_PARTITION variable=weighted_value_engine3 cyclic factor=SWIFTKV_UPDATE_ENGINE_LANES
#pragma HLS BIND_STORAGE variable=weighted_value_engine0 type=ram_2p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=weighted_value_engine1 type=ram_2p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=weighted_value_engine2 type=ram_2p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=weighted_value_engine3 type=ram_2p impl=bram latency=1

    swiftkv_accumulate_values_split(
        value_metadata_stream,
        value0_engine0_stream,
        value0_engine1_stream,
        value0_engine2_stream,
        value0_engine3_stream,
        value1_engine0_stream,
        value1_engine1_stream,
        value1_engine2_stream,
        value1_engine3_stream,
        control_stream,
        position,
        weighted_value_engine0,
        weighted_value_engine1,
        weighted_value_engine2,
        weighted_value_engine3);

    const int4_fxp32_t inverse_normalization =
        inverse_normalization_stream.read();
    int4_fxp32_t attention_group[INT4_GROUP_SIZE];
#pragma HLS BIND_STORAGE variable=attention_group type=ram_1p impl=bram

attention_quant_group_loop:
    for (int group = 0;
         group < SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
         ++group) {
        int4_fxp32_t max_abs = 0;

    attention_normalize_lane_loop:
        for (int lane = 0; lane < INT4_GROUP_SIZE; ++lane) {
#pragma HLS PIPELINE II=1
            const int index = group * INT4_GROUP_SIZE + lane;
            const int update_phase = index / SWIFTKV_UPDATE_LANES;
            const int update_lane = index & (SWIFTKV_UPDATE_LANES - 1);
            const int update_engine =
                update_lane / SWIFTKV_UPDATE_ENGINE_LANES;
            const int engine_index =
                update_phase * SWIFTKV_UPDATE_ENGINE_LANES +
                (update_lane &
                 (SWIFTKV_UPDATE_ENGINE_LANES - 1));
            swiftkv_state_t weighted_value = 0;
            if (update_engine == 0) {
                weighted_value = weighted_value_engine0[engine_index];
            } else if (update_engine == 1) {
                weighted_value = weighted_value_engine1[engine_index];
            } else if (update_engine == 2) {
                weighted_value = weighted_value_engine2[engine_index];
            } else {
                weighted_value = weighted_value_engine3[engine_index];
            }
            const swiftkv_state_product_t normalized_value =
                (swiftkv_state_product_t)(
                    weighted_value *
                    inverse_normalization);
#pragma HLS BIND_OP variable=normalized_value op=mul impl=dsp latency=4
            int4_fxp32_t value = 0;
            value.range(31, 0) =
                normalized_value.range(31, 0);
            attention_group[lane] = value;
            const int4_fxp32_t magnitude =
                value < 0 ? (int4_fxp32_t)(-value) : value;
            if (magnitude > max_abs) {
                max_abs = magnitude;
            }
        }

        const float max_float = (float)max_abs;
        const float output_scale =
            max_float == 0.0f
                ? 0.0f
                : max_float * (1.0f / 16383.0f);
        const float inverse_scale =
            max_float == 0.0f ? 0.0f : 16383.0f / max_float;
        scale_stream.write(output_scale);

        int4_quant_word_t quantized_word = 0;
    attention_quantize_reverse_loop:
        for (int lane = INT4_GROUP_SIZE - 1;
             lane >= 0;
             --lane) {
#pragma HLS PIPELINE II=1
            const float scaled =
                (float)attention_group[lane] * inverse_scale;
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

static void swiftkv_attention_head(
    const int4_fxp32_t query[SWIFTKV_HEAD_SIZE],
    const int4_output_word_t* kv_cache,
    int head_base,
    int4_output_word_t current_metadata,
    int4_output_word_t current_key0,
    int4_output_word_t current_key1,
    int4_output_word_t current_value0,
    int4_output_word_t current_value1,
    ap_uint<12> position,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_fxp32_t> score_stream;
    hls::stream<int4_output_word_t> cached_kv_word_stream;
    hls::stream<int4_output_word_t> current_record_stream;
    hls::stream<ap_uint<40> > key_metadata_stream;
    hls::stream<ap_uint<40> > value_metadata_stream;
    hls::stream<int4_output_word_t> packed_key0_stream;
    hls::stream<int4_output_word_t> packed_key1_stream;
    hls::stream<swiftkv_update_engine_word_t> key0_chunk0_stream;
    hls::stream<swiftkv_update_engine_word_t> key0_chunk1_stream;
    hls::stream<swiftkv_update_engine_word_t> key0_chunk2_stream;
    hls::stream<swiftkv_update_engine_word_t> key0_chunk3_stream;
    hls::stream<swiftkv_update_engine_word_t> key1_chunk0_stream;
    hls::stream<swiftkv_update_engine_word_t> key1_chunk1_stream;
    hls::stream<swiftkv_update_engine_word_t> key1_chunk2_stream;
    hls::stream<swiftkv_update_engine_word_t> key1_chunk3_stream;
    hls::stream<swiftkv_update_engine_word_t> value0_engine0_stream;
    hls::stream<swiftkv_update_engine_word_t> value0_engine1_stream;
    hls::stream<swiftkv_update_engine_word_t> value0_engine2_stream;
    hls::stream<swiftkv_update_engine_word_t> value0_engine3_stream;
    hls::stream<swiftkv_update_engine_word_t> value1_engine0_stream;
    hls::stream<swiftkv_update_engine_word_t> value1_engine1_stream;
    hls::stream<swiftkv_update_engine_word_t> value1_engine2_stream;
    hls::stream<swiftkv_update_engine_word_t> value1_engine3_stream;
    hls::stream<swiftkv_update_control_t> control_stream;
    hls::stream<int4_fxp32_t> inverse_normalization_stream;
#pragma HLS STREAM variable=score_stream depth=4
    // A 64-beat elastic window lets the AXI loop run independently of the
    // five-word record router.  BRAM is deliberate: an SRL FIFO this wide
    // would recreate the high-fanout LUT/FF control path seen after routing.
#pragma HLS STREAM variable=cached_kv_word_stream depth=64
#pragma HLS STREAM variable=current_record_stream depth=8
#pragma HLS STREAM variable=key_metadata_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value_metadata_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=packed_key0_stream depth=2
#pragma HLS STREAM variable=packed_key1_stream depth=2
#pragma HLS STREAM variable=key0_chunk0_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key0_chunk1_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key0_chunk2_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key0_chunk3_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key1_chunk0_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key1_chunk1_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key1_chunk2_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=key1_chunk3_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value0_engine0_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value0_engine1_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value0_engine2_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value0_engine3_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value1_engine0_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value1_engine1_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value1_engine2_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=value1_engine3_stream depth=SWIFTKV_KV_TILE_TOKENS
#pragma HLS STREAM variable=control_stream depth=16
#pragma HLS STREAM variable=inverse_normalization_stream depth=2
#pragma HLS BIND_STORAGE variable=score_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=cached_kv_word_stream type=fifo impl=bram
    // The routed checkpoint measured 605 sinks on each emitter push net and
    // -1.527 ns worst slack.  A 512-bit distributed FIFO replicates its
    // write-enable into hundreds of LUTRAM slices; BRAM terminates that cone
    // at a hard-block port while preserving the five-word record protocol.
#pragma HLS BIND_STORAGE variable=current_record_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key_metadata_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=value_metadata_stream type=fifo impl=srl
    // Terminate each packed K word at a two-entry local register boundary,
    // then split it into four 128-bit BRAM FIFOs.  This removes the routed
    // w512_d32 URAM port/control path while preserving the 32-token elasticity
    // and one-record-per-cycle splitter throughput.  The V path is already
    // split by update-engine ownership.
#pragma HLS BIND_STORAGE variable=packed_key0_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=packed_key1_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=key0_chunk0_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key0_chunk1_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key0_chunk2_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key0_chunk3_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key1_chunk0_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key1_chunk1_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key1_chunk2_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=key1_chunk3_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=value0_engine0_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value0_engine1_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value0_engine2_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value0_engine3_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value1_engine0_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value1_engine1_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value1_engine2_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=value1_engine3_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=control_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=inverse_normalization_stream type=fifo impl=srl

    swiftkv_emit_current_record(
        current_metadata, current_key0, current_key1,
        current_value0, current_value1,
        current_record_stream);
    swiftkv_read_compressed_kv_cache(
        kv_cache, head_base, position,
        cached_kv_word_stream);
    swiftkv_route_compressed_kv_cache(
        position, cached_kv_word_stream, current_record_stream,
        key_metadata_stream, value_metadata_stream,
        packed_key0_stream, packed_key1_stream,
        value0_engine0_stream, value0_engine1_stream,
        value0_engine2_stream, value0_engine3_stream,
        value1_engine0_stream, value1_engine1_stream,
        value1_engine2_stream, value1_engine3_stream);
    swiftkv_split_packed_key0_stream(
        packed_key0_stream,
        key0_chunk0_stream, key0_chunk1_stream,
        key0_chunk2_stream, key0_chunk3_stream,
        position);
    swiftkv_split_packed_key1_stream(
        packed_key1_stream,
        key1_chunk0_stream, key1_chunk1_stream,
        key1_chunk2_stream, key1_chunk3_stream,
        position);
    swiftkv_process_compressed_kv(
        query, key_metadata_stream,
        key0_chunk0_stream, key0_chunk1_stream,
        key0_chunk2_stream, key0_chunk3_stream,
        key1_chunk0_stream, key1_chunk1_stream,
        key1_chunk2_stream, key1_chunk3_stream,
        position, score_stream);
    swiftkv_coefficient_producer(
        score_stream, position,
        control_stream, inverse_normalization_stream);
    swiftkv_update_values_and_quantize(
        value_metadata_stream,
        value0_engine0_stream, value0_engine1_stream,
        value0_engine2_stream, value0_engine3_stream,
        value1_engine0_stream, value1_engine1_stream,
        value1_engine2_stream, value1_engine3_stream,
        control_stream,
        inverse_normalization_stream, position,
        quantized_stream, scale_stream);
}

static swiftkv_rope_lut_word_t swiftkv_read_rope_lut_word(
    const int4_output_word_t* rope_lut_ddr,
    int address
) {
#pragma HLS INLINE
    const int ddr_address =
        address * SWIFTKV_ROPE_DDR_WORDS_PER_LUT_WORD;
    const int4_output_word_t low = rope_lut_ddr[ddr_address];
    const int4_output_word_t high = rope_lut_ddr[ddr_address + 1];
    swiftkv_rope_lut_word_t packed = 0;
    packed.range(511, 0) = low;
    packed.range(SWIFTKV_ROPE_LUT_WORD_BITS - 1, 512) =
        high.range(SWIFTKV_ROPE_LUT_WORD_BITS - 513, 0);
    return packed;
}

static void swiftkv_preload_rope_reader_bank0(
    const int4_output_word_t* rope_lut_ddr,
    swiftkv_rope_lut_word_t rope_lut_bank0[SWIFTKV_ROPE_BANK_WORDS],
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream01
) {
#pragma HLS INLINE off
rope_preload_reader_position_loop:
    for (int rope_position = 0;
         rope_position < SWIFTKV_ROPE_BANK_WORDS;
         ++rope_position) {
    rope_preload_reader_bank_loop:
        for (int bank = 0; bank < SWIFTKV_ROPE_BANKS; ++bank) {
            const int address =
                rope_position * SWIFTKV_ROPE_BANKS + bank;
            swiftkv_rope_lut_word_t packed =
                swiftkv_read_rope_lut_word(rope_lut_ddr, address);
            if (bank == 0) {
                rope_lut_bank0[rope_position] = packed;
            } else {
            rope_preload_reader_serialize_loop:
                for (int beat = 0;
                     beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
                     ++beat) {
#pragma HLS PIPELINE II=1
                    rope_stream01.write(
                        (swiftkv_rope_lut_beat_t)packed.range(
                            SWIFTKV_ROPE_LUT_BEAT_BITS - 1, 0));
                    packed >>= SWIFTKV_ROPE_LUT_BEAT_BITS;
                }
            }
        }
    }
}

static void swiftkv_preload_rope_bank1_stage(
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream01,
    swiftkv_rope_lut_word_t rope_lut_bank1[SWIFTKV_ROPE_BANK_WORDS],
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream12
) {
#pragma HLS INLINE off
rope_preload_bank1_position_loop:
    for (int rope_position = 0;
         rope_position < SWIFTKV_ROPE_BANK_WORDS;
         ++rope_position) {
        swiftkv_rope_lut_word_t packed = 0;
    rope_preload_bank1_receive_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            packed >>= SWIFTKV_ROPE_LUT_BEAT_BITS;
            packed.range(
                SWIFTKV_ROPE_LUT_WORD_BITS - 1,
                SWIFTKV_ROPE_LUT_WORD_BITS -
                    SWIFTKV_ROPE_LUT_BEAT_BITS) = rope_stream01.read();
        }
        rope_lut_bank1[rope_position] = packed;
    rope_preload_bank1_forward_bank2_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            rope_stream12.write(rope_stream01.read());
        }
    rope_preload_bank1_forward_bank3_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            rope_stream12.write(rope_stream01.read());
        }
    }
}

static void swiftkv_preload_rope_bank2_stage(
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream12,
    swiftkv_rope_lut_word_t rope_lut_bank2[SWIFTKV_ROPE_BANK_WORDS],
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream23
) {
#pragma HLS INLINE off
rope_preload_bank2_position_loop:
    for (int rope_position = 0;
         rope_position < SWIFTKV_ROPE_BANK_WORDS;
         ++rope_position) {
        swiftkv_rope_lut_word_t packed = 0;
    rope_preload_bank2_receive_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            packed >>= SWIFTKV_ROPE_LUT_BEAT_BITS;
            packed.range(
                SWIFTKV_ROPE_LUT_WORD_BITS - 1,
                SWIFTKV_ROPE_LUT_WORD_BITS -
                    SWIFTKV_ROPE_LUT_BEAT_BITS) = rope_stream12.read();
        }
        rope_lut_bank2[rope_position] = packed;
    rope_preload_bank2_forward_bank3_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            rope_stream23.write(rope_stream12.read());
        }
    }
}

static void swiftkv_preload_rope_bank3_stage(
    hls::stream<swiftkv_rope_lut_beat_t>& rope_stream23,
    swiftkv_rope_lut_word_t rope_lut_bank3[SWIFTKV_ROPE_BANK_WORDS]
) {
#pragma HLS INLINE off
rope_preload_bank3_position_loop:
    for (int rope_position = 0;
         rope_position < SWIFTKV_ROPE_BANK_WORDS;
         ++rope_position) {
        swiftkv_rope_lut_word_t packed = 0;
    rope_preload_bank3_receive_loop:
        for (int beat = 0;
             beat < SWIFTKV_ROPE_LUT_BEATS_PER_WORD;
             ++beat) {
#pragma HLS PIPELINE II=1
            packed >>= SWIFTKV_ROPE_LUT_BEAT_BITS;
            packed.range(
                SWIFTKV_ROPE_LUT_WORD_BITS - 1,
                SWIFTKV_ROPE_LUT_WORD_BITS -
                    SWIFTKV_ROPE_LUT_BEAT_BITS) = rope_stream23.read();
        }
        rope_lut_bank3[rope_position] = packed;
    }
}

void swiftkv_preload_rope_lut(
    const int4_output_word_t* rope_lut_ddr,
    swiftkv_rope_lut_word_t rope_lut_bank0[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank1[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank2[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank3[SWIFTKV_ROPE_BANK_WORDS]
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    // The DDR image remains position-major and bit-for-bit compatible.  A
    // 38-bit beat contains one cosine/sine pair.  Only this narrow stream
    // crosses each adjacent SLR boundary; every destination reconstructs the
    // 608-bit LUT word locally before writing its own URAM bank.  Depth 128
    // preserves the bit capacity of the former eight-word 608-bit FIFOs.
    hls::stream<swiftkv_rope_lut_beat_t> rope_stream01;
    hls::stream<swiftkv_rope_lut_beat_t> rope_stream12;
    hls::stream<swiftkv_rope_lut_beat_t> rope_stream23;
#pragma HLS STREAM variable=rope_stream01 depth=128
#pragma HLS STREAM variable=rope_stream12 depth=128
#pragma HLS STREAM variable=rope_stream23 depth=128
#pragma HLS BIND_STORAGE variable=rope_stream01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=rope_stream12 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=rope_stream23 type=fifo impl=bram

    swiftkv_preload_rope_reader_bank0(
        rope_lut_ddr, rope_lut_bank0, rope_stream01);
    swiftkv_preload_rope_bank1_stage(
        rope_stream01, rope_lut_bank1, rope_stream12);
    swiftkv_preload_rope_bank2_stage(
        rope_stream12, rope_lut_bank2, rope_stream23);
    swiftkv_preload_rope_bank3_stage(
        rope_stream23, rope_lut_bank3);
}

template <int BANK_ID>
static void swiftkv_load_rope_bank_body(
    const swiftkv_rope_lut_word_t
        rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
) {
#pragma HLS INLINE
    ap_uint<SWIFTKV_ROPE_LUT_WORD_BITS> packed =
        rope_lut_bank[(int)position];
load_rope_bank_lane_loop:
    for (int lane = 0;
         lane < SWIFTKV_ROPE_PAIRS_PER_LUT_WORD;
         ++lane) {
#pragma HLS PIPELINE II=1
        const int index =
            BANK_ID * SWIFTKV_ROPE_PAIRS_PER_LUT_WORD + lane;
        const swiftkv_rope_raw_t cosine =
            (swiftkv_rope_raw_t)packed.range(18, 0);
        const swiftkv_rope_raw_t sine =
            (swiftkv_rope_raw_t)packed.range(37, 19);
        current_cos_pair01[index] = cosine;
        current_sin_pair01[index] = sine;
        current_cos_pair23[index] = cosine;
        current_sin_pair23[index] = sine;
        packed >>= 38;
    }
}

void swiftkv_load_rope_bank0(
    const swiftkv_rope_lut_word_t rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
) {
#pragma HLS INLINE off
    swiftkv_load_rope_bank_body<0>(
        rope_lut_bank, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
}

void swiftkv_load_rope_bank1(
    const swiftkv_rope_lut_word_t rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
) {
#pragma HLS INLINE off
    swiftkv_load_rope_bank_body<1>(
        rope_lut_bank, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
}

void swiftkv_load_rope_bank2(
    const swiftkv_rope_lut_word_t rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
) {
#pragma HLS INLINE off
    swiftkv_load_rope_bank_body<2>(
        rope_lut_bank, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
}

void swiftkv_load_rope_bank3(
    const swiftkv_rope_lut_word_t rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
) {
#pragma HLS INLINE off
    swiftkv_load_rope_bank_body<3>(
        rope_lut_bank, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
}

static void swiftkv_broadcast_rope_pair01(
    const swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    hls::stream<swiftkv_rope_raw_t>& cos_pe0,
    hls::stream<swiftkv_rope_raw_t>& cos_pe1,
    hls::stream<swiftkv_rope_raw_t>& sin_pe0,
    hls::stream<swiftkv_rope_raw_t>& sin_pe1
) {
#pragma HLS INLINE off
rope_broadcast_pair01_loop:
    for (int pair = 0; pair < SWIFTKV_ROPE_PAIRS; ++pair) {
#pragma HLS PIPELINE II=1
        const swiftkv_rope_raw_t cosine = current_cos_pair01[pair];
        const swiftkv_rope_raw_t sine = current_sin_pair01[pair];
        cos_pe0.write(cosine);
        cos_pe1.write(cosine);
        sin_pe0.write(sine);
        sin_pe1.write(sine);
    }
}

static void swiftkv_broadcast_rope_pair23(
    const swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS],
    hls::stream<swiftkv_rope_raw_t>& cos_pe2,
    hls::stream<swiftkv_rope_raw_t>& cos_pe3,
    hls::stream<swiftkv_rope_raw_t>& sin_pe2,
    hls::stream<swiftkv_rope_raw_t>& sin_pe3
) {
#pragma HLS INLINE off
rope_broadcast_pair23_loop:
    for (int pair = 0; pair < SWIFTKV_ROPE_PAIRS; ++pair) {
#pragma HLS PIPELINE II=1
        const swiftkv_rope_raw_t cosine = current_cos_pair23[pair];
        const swiftkv_rope_raw_t sine = current_sin_pair23[pair];
        cos_pe2.write(cosine);
        cos_pe3.write(cosine);
        sin_pe2.write(sine);
        sin_pe3.write(sine);
    }
}

// The global decoder controller is intentionally terminated in the shared
// SLR1 control island.  Each SwiftKV PE receives only one 18-bit command via
// its own FIFO, then uses PE-local layer/position registers for all address
// generation.  This prevents the controller register bank from becoming a
// four-SLR fanout root in generated RTL.
typedef ap_uint<18> swiftkv_pe_command_t;
typedef ap_uint<19> swiftkv_completion_t;

static swiftkv_pe_command_t swiftkv_pack_pe_command(
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE
    swiftkv_pe_command_t command = 0;
    command.range(5, 0) = layer_index;
    command.range(17, 6) = position;
    return command;
}

static void swiftkv_broadcast_pe_commands_pair01(
    hls::stream<swiftkv_pe_command_t>& swiftkv_command_pe0,
    hls::stream<swiftkv_pe_command_t>& swiftkv_command_pe1,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    const swiftkv_pe_command_t command =
        swiftkv_pack_pe_command(layer_index, position);
    swiftkv_command_pe0.write(command);
    swiftkv_command_pe1.write(command);
}

static void swiftkv_broadcast_pe_commands_pair23(
    hls::stream<swiftkv_pe_command_t>& swiftkv_command_pe2,
    hls::stream<swiftkv_pe_command_t>& swiftkv_command_pe3,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    const swiftkv_pe_command_t command =
        swiftkv_pack_pe_command(layer_index, position);
    swiftkv_command_pe2.write(command);
    swiftkv_command_pe3.write(command);
}

static void swiftkv_run_bank(
    const int4_output_word_t* q,
    const int4_output_word_t* k,
    const int4_output_word_t* v,
    int4_output_word_t* kv_cache,
    hls::stream<swiftkv_rope_raw_t>& cosine_stream,
    hls::stream<swiftkv_rope_raw_t>& sine_stream,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
#pragma HLS ALLOCATION function instances=swiftkv_rotate_rope_word limit=1

    swiftkv_rope_raw_t local_cosine[SWIFTKV_ROPE_PAIRS];
    swiftkv_rope_raw_t local_sine[SWIFTKV_ROPE_PAIRS];
#pragma HLS BIND_STORAGE variable=local_cosine type=ram_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=local_sine type=ram_1p impl=lutram latency=1

pe_cache_rope_pair_loop:
    for (int pair = 0; pair < SWIFTKV_ROPE_PAIRS; ++pair) {
#pragma HLS PIPELINE II=1
        local_cosine[pair] = cosine_stream.read();
        local_sine[pair] = sine_stream.read();
    }

pe_head_loop:
    for (int local_head = 0;
         local_head < SWIFTKV_LOCAL_HEADS;
         ++local_head) {
        int4_fxp32_t query[SWIFTKV_HEAD_SIZE];
        int4_output_word_t q_words[SWIFTKV_WORDS_PER_HEAD];
        int4_output_word_t k_words[SWIFTKV_WORDS_PER_HEAD];
        int4_output_word_t v_words[SWIFTKV_WORDS_PER_HEAD];
        int4_output_word_t rotated_k_words[SWIFTKV_WORDS_PER_HEAD];
        int4_output_word_t
            compressed_kv_record[SWIFTKV_KV_WORDS_PER_TOKEN_HEAD];
#pragma HLS ARRAY_PARTITION variable=query cyclic factor=16
#pragma HLS BIND_STORAGE variable=query type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=q_words type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=k_words type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=v_words type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=rotated_k_words type=ram_1p impl=bram
#pragma HLS ARRAY_PARTITION variable=compressed_kv_record complete
        const int cache_head_base =
            ((int)layer_index * SWIFTKV_LOCAL_HEADS +
             local_head) *
            SWIFTKV_KV_WORDS_PER_HEAD;
        const int current_token_base =
            cache_head_base +
            (int)position *
                SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
        // Keep AXI transactions out of the pipelined RoPE datapath.  Besides
        // eliminating the artificial read-after-write II constraint, this
        // gives the DSP multiply/add/saturate chain an actual register
        // boundary before the KV-cache write.
        // q/k/v are independent AXI address ranges on the shared PE bank.
        // Three separate sequential loops let HLS form three eight-beat
        // bursts; a single loop issues three reads/iteration and is forced
        // to II=3 by the shared master.
    pe_load_q_word_loop:
        for (int word = 0;
             word < SWIFTKV_WORDS_PER_HEAD;
             ++word) {
#pragma HLS PIPELINE II=1
            const int local_word =
                local_head * SWIFTKV_WORDS_PER_HEAD + word;
            q_words[word] = q[local_word];
        }

    pe_load_k_word_loop:
        for (int word = 0;
             word < SWIFTKV_WORDS_PER_HEAD;
             ++word) {
#pragma HLS PIPELINE II=1
            const int local_word =
                local_head * SWIFTKV_WORDS_PER_HEAD + word;
            k_words[word] = k[local_word];
        }

    pe_load_v_word_loop:
        for (int word = 0;
             word < SWIFTKV_WORDS_PER_HEAD;
             ++word) {
#pragma HLS PIPELINE II=1
            const int local_word =
                local_head * SWIFTKV_WORDS_PER_HEAD + word;
            v_words[word] = v[local_word];
        }

    pe_rope_word_loop:
        for (int word = 0;
             word < SWIFTKV_WORDS_PER_HEAD;
             ++word) {
            const int4_output_word_t rotated_q_word =
                swiftkv_rotate_rope_word(
                    q_words[word], local_cosine, local_sine, word);
            const int4_output_word_t rotated_k_word =
                swiftkv_rotate_rope_word(
                    k_words[word], local_cosine, local_sine, word);
        pe_unpack_rotated_query_lane_loop:
            for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
                int4_fxp32_t rotated_query;
                rotated_query.range(31, 0) = rotated_q_word.range(
                    32 * lane + 31, 32 * lane);
                query[word * 16 + lane] = rotated_query;
            }
            rotated_k_words[word] = rotated_k_word;
        }

        swiftkv_quantize_kv_record(
            rotated_k_words, v_words, compressed_kv_record);

    pe_write_kv_word_loop:
        for (int word = 0;
             word < SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
             ++word) {
#pragma HLS PIPELINE II=1
            kv_cache[current_token_base + word] =
                compressed_kv_record[word];
        }

        swiftkv_attention_head(
            query, kv_cache, cache_head_base,
            compressed_kv_record[0],
            compressed_kv_record[1],
            compressed_kv_record[2],
            compressed_kv_record[3],
            compressed_kv_record[4],
            position,
            quantized_stream, scale_stream);
    }
}

template <int PE_ID>
static void swiftkv_run_pe(
    const int4_output_word_t* q,
    const int4_output_word_t* k,
    const int4_output_word_t* v,
    int4_output_word_t* kv_cache,
    hls::stream<swiftkv_rope_raw_t>& cosine_stream,
    hls::stream<swiftkv_rope_raw_t>& sine_stream,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream,
    hls::stream<swiftkv_pe_command_t>& command_stream,
    hls::stream<swiftkv_completion_t>& done_stream
) {
#pragma HLS INLINE off
    // PE_ID creates four distinct hierarchy instances.  Each instance owns
    // one arithmetic engine and one DDR master path.  Keeping the complete
    // bank datapath in a single hierarchy lets the U250 floorplan bind PE N
    // wholly to SLR N instead of routing a shared engine across an SLR
    // boundary.  All persistent compressed K/V records remain in that PE's
    // external DDR bank.

    const swiftkv_pe_command_t command = command_stream.read();
    const ap_uint<6> layer_index = command.range(5, 0);
    const ap_uint<12> position = command.range(17, 6);

    swiftkv_run_bank(
        q, k, v, kv_cache,
        cosine_stream, sine_stream,
        quantized_stream, scale_stream,
        layer_index, position);
    swiftkv_completion_t completion = 0;
    completion[18] = 1;
    completion.range(17, 0) = command;
    done_stream.write(completion);
}

// Completion follows the physical SLR chain instead of letting one generated
// pf_all_done cone directly observe all four PE FSMs.  The token echoes the
// local 18-bit command, so the join also detects a stale/mismatched worker.
static void swiftkv_join_done01(
    hls::stream<swiftkv_completion_t>& done0,
    hls::stream<swiftkv_completion_t>& done1,
    hls::stream<swiftkv_completion_t>& done01
) {
#pragma HLS INLINE off
    const swiftkv_completion_t token0 = done0.read();
    const swiftkv_completion_t token1 = done1.read();
    done01.write(
        token0 == token1 ? token0 : (swiftkv_completion_t)0);
}

static void swiftkv_join_done23(
    hls::stream<swiftkv_completion_t>& done2,
    hls::stream<swiftkv_completion_t>& done3,
    hls::stream<swiftkv_completion_t>& done23
) {
#pragma HLS INLINE off
    const swiftkv_completion_t token2 = done2.read();
    const swiftkv_completion_t token3 = done3.read();
    done23.write(
        token2 == token3 ? token2 : (swiftkv_completion_t)0);
}

static void swiftkv_join_all_done(
    hls::stream<swiftkv_completion_t>& done01,
    hls::stream<swiftkv_completion_t>& done23,
    ap_uint<6> layer_index,
    ap_uint<12> position,
    ap_uint<1>& all_done
) {
#pragma HLS INLINE off
    const swiftkv_completion_t token01 = done01.read();
    const swiftkv_completion_t token23 = done23.read();
    const swiftkv_pe_command_t expected =
        swiftkv_pack_pe_command(layer_index, position);
    swiftkv_completion_t expected_completion = 0;
    expected_completion[18] = 1;
    expected_completion.range(17, 0) = expected;
    all_done = token01 == expected_completion &&
               token23 == expected_completion;
}

template <int PE_ID>
static void swiftkv_collect_pe_output(
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream,
    int4_quant_word_t quantized_buffer[
        SWIFTKV_LOCAL_HEADS *
        (SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE)],
    float scale_buffer[
        SWIFTKV_LOCAL_HEADS *
        (SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE)]
) {
#pragma HLS INLINE off

collect_pe_group_loop:
    for (int group = 0;
         group <
             SWIFTKV_LOCAL_HEADS *
             (SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE);
         ++group) {
#pragma HLS PIPELINE II=1
        quantized_buffer[group] = quantized_stream.read();
        scale_buffer[group] = scale_stream.read();
    }
}

// The new decoder never materializes or broadcasts a complete RoPE row.
// Every PE reads the eight 512-bit beats for its current position and turns
// them directly into two local 19-bit streams.  This read is tiny compared to
// the KV and weight traffic and avoids four 4096x608-bit on-chip replicas.
template <int PE_ID>
static void swiftkv_seed_local_pe(
    const int4_output_word_t* rope_lut_ddr,
    ap_uint<6> layer_index,
    ap_uint<12> position,
    hls::stream<swiftkv_rope_raw_t>& cosine_stream,
    hls::stream<swiftkv_rope_raw_t>& sine_stream,
    hls::stream<swiftkv_pe_command_t>& command_stream) {
#pragma HLS INLINE off
local_rope_bank_loop:
    for (int bank = 0; bank < SWIFTKV_ROPE_BANKS; ++bank) {
        const int address = (int)position * SWIFTKV_ROPE_BANKS + bank;
        swiftkv_rope_lut_word_t packed =
            swiftkv_read_rope_lut_word(rope_lut_ddr, address);
    local_rope_lane_loop:
        for (int lane = 0;
             lane < SWIFTKV_ROPE_PAIRS_PER_LUT_WORD;
             ++lane) {
#pragma HLS PIPELINE II=2
            cosine_stream.write(
                (swiftkv_rope_raw_t)packed.range(18, 0));
            sine_stream.write(
                (swiftkv_rope_raw_t)packed.range(37, 19));
            packed >>= SWIFTKV_ROPE_LUT_BEAT_BITS;
        }
    }
    command_stream.write(
        swiftkv_pack_pe_command(layer_index, position));
}

template <int PE_ID>
static void swiftkv_consume_local_done(
    hls::stream<swiftkv_completion_t>& done_stream) {
#pragma HLS INLINE off
    (void)done_stream.read();
}

template <int PE_ID>
static void int4_swiftkv_attention_local_body(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position) {
#pragma HLS INLINE off
    // RoPE and KV share one PE-local AXI master, so their reads are ordered
    // inside this wrapper. The four PE wrappers still run concurrently in
    // int4_run_local_attention_4pe; only this tiny local phase is sequential.
    hls::stream<swiftkv_rope_raw_t> cosine_stream;
    hls::stream<swiftkv_rope_raw_t> sine_stream;
    hls::stream<int4_quant_word_t> quantized_stream;
    hls::stream<float> scale_stream;
    hls::stream<swiftkv_pe_command_t> command_stream;
    hls::stream<swiftkv_completion_t> done_stream;
#pragma HLS STREAM variable=cosine_stream depth=64
#pragma HLS STREAM variable=sine_stream depth=64
#pragma HLS STREAM variable=quantized_stream depth=64
#pragma HLS STREAM variable=scale_stream depth=64
#pragma HLS STREAM variable=command_stream depth=2
#pragma HLS STREAM variable=done_stream depth=2
#pragma HLS BIND_STORAGE variable=cosine_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sine_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=quantized_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=done_stream type=fifo impl=srl

    swiftkv_seed_local_pe<PE_ID>(
        rope_lut_ddr, layer_index, position,
        cosine_stream, sine_stream, command_stream);
    swiftkv_run_pe<PE_ID>(
        q, k, v, kv_cache,
        cosine_stream, sine_stream,
        quantized_stream, scale_stream,
        command_stream, done_stream);
    swiftkv_collect_pe_output<PE_ID>(
        quantized_stream, scale_stream,
        activation_q, activation_scale);
    swiftkv_consume_local_done<PE_ID>(done_stream);
}

void int4_swiftkv_attention_pe0(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position) {
#pragma HLS INLINE off
    int4_swiftkv_attention_local_body<0>(
        q, k, v, kv_cache, rope_lut_ddr,
        activation_q, activation_scale, layer_index, position);
}

void int4_swiftkv_attention_pe1(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position) {
#pragma HLS INLINE off
    int4_swiftkv_attention_local_body<1>(
        q, k, v, kv_cache, rope_lut_ddr,
        activation_q, activation_scale, layer_index, position);
}

void int4_swiftkv_attention_pe2(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position) {
#pragma HLS INLINE off
    int4_swiftkv_attention_local_body<2>(
        q, k, v, kv_cache, rope_lut_ddr,
        activation_q, activation_scale, layer_index, position);
}

void int4_swiftkv_attention_pe3(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position) {
#pragma HLS INLINE off
    int4_swiftkv_attention_local_body<3>(
        q, k, v, kv_cache, rope_lut_ddr,
        activation_q, activation_scale, layer_index, position);
}

static void swiftkv_gather_attention_buffers(
    const int4_quant_word_t quantized_pe0[32],
    const int4_quant_word_t quantized_pe1[32],
    const int4_quant_word_t quantized_pe2[32],
    const int4_quant_word_t quantized_pe3[32],
    const float scale_pe0[32],
    const float scale_pe1[32],
    const float scale_pe2[32],
    const float scale_pe3[32],
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off

attention_gather_local_head_loop:
    for (int local_head = 0;
         local_head < SWIFTKV_LOCAL_HEADS;
         ++local_head) {
        int4_scale_word_t packed_scales = 0;
    attention_gather_pe_loop:
        for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        attention_gather_group_loop:
            for (int group = 0;
                 group < SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
                 ++group) {
#pragma HLS PIPELINE II=1
                int4_quant_word_t quantized = 0;
                float scale = 0.0f;
                const int local_group = local_head * 4 + group;
                if (pe == 0) {
                    quantized = quantized_pe0[local_group];
                    scale = scale_pe0[local_group];
                } else if (pe == 1) {
                    quantized = quantized_pe1[local_group];
                    scale = scale_pe1[local_group];
                } else if (pe == 2) {
                    quantized = quantized_pe2[local_group];
                    scale = scale_pe2[local_group];
                } else {
                    quantized = quantized_pe3[local_group];
                    scale = scale_pe3[local_group];
                }
                const int lane = pe * 4 + group;
                const int global_group =
                    local_head * INT4_SCALE_ROWS_PER_WORD + lane;
                activation_q[global_group] = quantized;
                packed_scales >>= 32;
                packed_scales.range(511, 480) =
                    swiftkv_float_to_bits(scale);
            }
        }
        activation_scale[local_head] = packed_scales;
    }
}

#ifdef SWIFTKV_INTEGRATED_TOP
template <int PE_ID>
static void swiftkv_serialize_attention_edge_body(
    hls::stream<int4_quant_word_t>& quantized_local,
    hls::stream<int4_activation_beat_t>& quantized_edge
) {
#pragma HLS INLINE
swiftkv_serialize_edge_word_loop:
    for (int word = 0;
         word < SWIFTKV_LOCAL_HEADS *
             (SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE);
         ++word) {
        int4_quant_word_t remaining = quantized_local.read();
    swiftkv_serialize_edge_beat_loop:
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

static void swiftkv_serialize_attention_pe0_to_pair01(
    hls::stream<int4_quant_word_t>& quantized_pe0_local,
    hls::stream<int4_activation_beat_t>& quantized_pe0_to_pair01
) {
#pragma HLS INLINE off
    swiftkv_serialize_attention_edge_body<0>(
        quantized_pe0_local, quantized_pe0_to_pair01);
}

static void swiftkv_serialize_attention_pe3_to_pair23(
    hls::stream<int4_quant_word_t>& quantized_pe3_local,
    hls::stream<int4_activation_beat_t>& quantized_pe3_to_pair23
) {
#pragma HLS INLINE off
    swiftkv_serialize_attention_edge_body<3>(
        quantized_pe3_local, quantized_pe3_to_pair23);
}

template <int PE_ID>
static int4_quant_word_t swiftkv_deserialize_attention_edge(
    hls::stream<int4_activation_beat_t>& quantized_edge
) {
#pragma HLS INLINE
    int4_quant_word_t q = 0;
swiftkv_deserialize_edge_beat_loop:
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

static void swiftkv_forward_attention_pe(
    hls::stream<int4_quant_word_t>& quantized_pe,
    hls::stream<float>& scale_pe,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
swiftkv_forward_attention_group_loop:
    for (int group = 0;
         group < SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
         ++group) {
#pragma HLS PIPELINE II=1
        quantized_pair.write(quantized_pe.read());
        scale_pair.write(scale_pe.read());
    }
}

template <int PE_ID>
static void swiftkv_forward_attention_edge(
    hls::stream<int4_activation_beat_t>& quantized_edge,
    hls::stream<float>& scale_edge,
    hls::stream<int4_quant_word_t>& quantized_pair,
    hls::stream<float>& scale_pair
) {
#pragma HLS INLINE
swiftkv_forward_attention_edge_group_loop:
    for (int group = 0;
         group < SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
         ++group) {
        quantized_pair.write(
            swiftkv_deserialize_attention_edge<PE_ID>(quantized_edge));
        scale_pair.write(scale_edge.read());
    }
}

static void swiftkv_gather_attention_pair01(
    hls::stream<int4_activation_beat_t>& quantized_pe0_to_pair01,
    hls::stream<int4_quant_word_t>& quantized_pe1,
    hls::stream<float>& scale_pe0,
    hls::stream<float>& scale_pe1,
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<float>& scale_pair01
) {
#pragma HLS INLINE off
swiftkv_gather_pair01_head_loop:
    for (int local_head = 0;
         local_head < SWIFTKV_LOCAL_HEADS;
         ++local_head) {
        swiftkv_forward_attention_edge<0>(
            quantized_pe0_to_pair01, scale_pe0,
            quantized_pair01, scale_pair01);
        swiftkv_forward_attention_pe(
            quantized_pe1, scale_pe1,
            quantized_pair01, scale_pair01);
    }
}

static void swiftkv_gather_attention_pair23(
    hls::stream<int4_quant_word_t>& quantized_pe2,
    hls::stream<int4_activation_beat_t>& quantized_pe3_to_pair23,
    hls::stream<float>& scale_pe2,
    hls::stream<float>& scale_pe3,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair23
) {
#pragma HLS INLINE off
swiftkv_gather_pair23_head_loop:
    for (int local_head = 0;
         local_head < SWIFTKV_LOCAL_HEADS;
         ++local_head) {
        swiftkv_forward_attention_pe(
            quantized_pe2, scale_pe2,
            quantized_pair23, scale_pair23);
        swiftkv_forward_attention_edge<3>(
            quantized_pe3_to_pair23, scale_pe3,
            quantized_pair23, scale_pair23);
    }
}

// Preserve global G32 order, but expose only two registered pair interfaces
// to the shared O-projection path.  The 4-way ready/control cone is gone.
static void swiftkv_merge_attention_pair_streams(
    hls::stream<int4_quant_word_t>& quantized_pair01,
    hls::stream<int4_quant_word_t>& quantized_pair23,
    hls::stream<float>& scale_pair01,
    hls::stream<float>& scale_pair23,
    hls::stream<int4_quant_word_t>& merged_quantized_stream,
    hls::stream<float>& merged_scale_stream
) {
#pragma HLS INLINE off
swiftkv_merge_pair_head_loop:
    for (int local_head = 0;
         local_head < SWIFTKV_LOCAL_HEADS;
         ++local_head) {
    swiftkv_merge_pair01_group_loop:
        for (int group = 0;
             group < 2 * SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            merged_quantized_stream.write(quantized_pair01.read());
            merged_scale_stream.write(scale_pair01.read());
        }
    swiftkv_merge_pair23_group_loop:
        for (int group = 0;
             group < 2 * SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE;
             ++group) {
#pragma HLS PIPELINE II=1
            merged_quantized_stream.write(quantized_pair23.read());
            merged_scale_stream.write(scale_pair23.read());
        }
    }
}

// Compatibility sink for the standalone SwiftKV top.  The integrated decoder
// bypasses this function and connects the merged stream directly to the O
// projection, so this shared-memory write/read path is absent from its RTL.
static void swiftkv_store_attention_streams(
    hls::stream<int4_quant_word_t>& merged_quantized_stream,
    hls::stream<float>& merged_scale_stream,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale
) {
#pragma HLS INLINE off
    int4_scale_word_t packed_scales = 0;

store_attention_group_loop:
    for (int global_group = 0;
         global_group < INT4_GROUPS_PER_VECTOR;
         ++global_group) {
#pragma HLS PIPELINE II=1
        const int scale_lane =
            global_group & (INT4_OUTPUTS_PER_WORD - 1);
        activation_q[global_group] =
            merged_quantized_stream.read();
        packed_scales >>= 32;
        packed_scales.range(511, 480) =
            swiftkv_float_to_bits(merged_scale_stream.read());
        if (scale_lane == INT4_OUTPUTS_PER_WORD - 1) {
            activation_scale[
                global_group / INT4_OUTPUTS_PER_WORD] =
                    packed_scales;
        }
    }
}
#endif

static void swiftkv_run_four_pes(
    const int4_output_word_t* q_pe0,
    const int4_output_word_t* q_pe1,
    const int4_output_word_t* q_pe2,
    const int4_output_word_t* q_pe3,
    const int4_output_word_t* k_pe0,
    const int4_output_word_t* k_pe1,
    const int4_output_word_t* k_pe2,
    const int4_output_word_t* k_pe3,
    const int4_output_word_t* v_pe0,
    const int4_output_word_t* v_pe1,
    const int4_output_word_t* v_pe2,
    const int4_output_word_t* v_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS],
#ifdef SWIFTKV_INTEGRATED_TOP
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream,
#else
    int4_quant_word_t quantized_buffer_pe0[32],
    int4_quant_word_t quantized_buffer_pe1[32],
    int4_quant_word_t quantized_buffer_pe2[32],
    int4_quant_word_t quantized_buffer_pe3[32],
    float scale_buffer_pe0[32],
    float scale_buffer_pe1[32],
    float scale_buffer_pe2[32],
    float scale_buffer_pe3[32],
#endif
    ap_uint<6> layer_index,
    ap_uint<12> position,
    ap_uint<1>& all_done
) {
#pragma HLS INLINE off
    // Each PE and the gather are decoupled by explicitly sized FIFOs below.
    // Disable HLS start propagation so the gather cannot create the observed
    // SLR2->SLR1->SLR2 start/ready control loop.
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<swiftkv_rope_raw_t> cos_pe0, cos_pe1, cos_pe2, cos_pe3;
    hls::stream<swiftkv_rope_raw_t> sin_pe0, sin_pe1, sin_pe2, sin_pe3;
    hls::stream<int4_quant_word_t> quantized_pe0_local;
    hls::stream<int4_quant_word_t> quantized_pe1;
    hls::stream<int4_quant_word_t> quantized_pe2;
    hls::stream<int4_quant_word_t> quantized_pe3_local;
#ifdef SWIFTKV_INTEGRATED_TOP
    hls::stream<int4_activation_beat_t> quantized_pe0_to_pair01;
    hls::stream<int4_activation_beat_t> quantized_pe3_to_pair23;
#endif
    hls::stream<float> scale_pe0, scale_pe1, scale_pe2, scale_pe3;
    hls::stream<swiftkv_pe_command_t> swiftkv_command_pe0;
    hls::stream<swiftkv_pe_command_t> swiftkv_command_pe1;
    hls::stream<swiftkv_pe_command_t> swiftkv_command_pe2;
    hls::stream<swiftkv_pe_command_t> swiftkv_command_pe3;
    hls::stream<swiftkv_completion_t> swiftkv_done_pe0;
    hls::stream<swiftkv_completion_t> swiftkv_done_pe1;
    hls::stream<swiftkv_completion_t> swiftkv_done_pe2;
    hls::stream<swiftkv_completion_t> swiftkv_done_pe3;
    hls::stream<swiftkv_completion_t> swiftkv_done01;
    hls::stream<swiftkv_completion_t> swiftkv_done23;
#pragma HLS STREAM variable=cos_pe0 depth=4
#pragma HLS STREAM variable=cos_pe1 depth=4
#pragma HLS STREAM variable=cos_pe2 depth=4
#pragma HLS STREAM variable=cos_pe3 depth=4
#pragma HLS STREAM variable=sin_pe0 depth=4
#pragma HLS STREAM variable=sin_pe1 depth=4
#pragma HLS STREAM variable=sin_pe2 depth=4
#pragma HLS STREAM variable=sin_pe3 depth=4
// Each PE now has its own producer.  Four entries cover one complete head
// burst while allowing the interleaved gather to visit the other PEs.
#pragma HLS STREAM variable=quantized_pe0_local depth=4
#pragma HLS STREAM variable=quantized_pe1 depth=4
#pragma HLS STREAM variable=quantized_pe2 depth=4
#pragma HLS STREAM variable=quantized_pe3_local depth=4
#ifdef SWIFTKV_INTEGRATED_TOP
#pragma HLS STREAM variable=quantized_pe0_to_pair01 depth=64
#pragma HLS STREAM variable=quantized_pe3_to_pair23 depth=64
#endif
#pragma HLS STREAM variable=scale_pe0 depth=4
#pragma HLS STREAM variable=scale_pe1 depth=4
#pragma HLS STREAM variable=scale_pe2 depth=4
#pragma HLS STREAM variable=scale_pe3 depth=4
#pragma HLS STREAM variable=swiftkv_command_pe0 depth=2
#pragma HLS STREAM variable=swiftkv_command_pe1 depth=2
#pragma HLS STREAM variable=swiftkv_command_pe2 depth=2
#pragma HLS STREAM variable=swiftkv_command_pe3 depth=2
#pragma HLS STREAM variable=swiftkv_done_pe0 depth=2
#pragma HLS STREAM variable=swiftkv_done_pe1 depth=2
#pragma HLS STREAM variable=swiftkv_done_pe2 depth=2
#pragma HLS STREAM variable=swiftkv_done_pe3 depth=2
#pragma HLS STREAM variable=swiftkv_done01 depth=2
#pragma HLS STREAM variable=swiftkv_done23 depth=2
#pragma HLS BIND_STORAGE variable=cos_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=cos_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=cos_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=cos_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sin_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sin_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sin_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sin_pe3 type=fifo impl=srl
// The earlier unconstrained build could place a BRAM FIFO remotely and created
// a -1.949 ns SLR2->SLR3 path.  The mandatory floorplan now anchors each wide
// FIFO with its SwiftKV PE and places only the serialized 30-bit edge FIFO at
// the receiving pair, so BRAM remains local to its producer/consumer boundary.
#pragma HLS BIND_STORAGE variable=quantized_pe0_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe1 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe2 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_local type=fifo impl=bram
#ifdef SWIFTKV_INTEGRATED_TOP
#pragma HLS BIND_STORAGE variable=quantized_pe0_to_pair01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pe3_to_pair23 type=fifo impl=bram
#endif
#pragma HLS BIND_STORAGE variable=scale_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_command_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swiftkv_done23 type=fifo impl=srl

    swiftkv_broadcast_pe_commands_pair01(
        swiftkv_command_pe0, swiftkv_command_pe1,
        layer_index, position);
    swiftkv_broadcast_pe_commands_pair23(
        swiftkv_command_pe2, swiftkv_command_pe3,
        layer_index, position);
    swiftkv_broadcast_rope_pair01(
        current_cos_pair01, current_sin_pair01,
        cos_pe0, cos_pe1, sin_pe0, sin_pe1);
    swiftkv_broadcast_rope_pair23(
        current_cos_pair23, current_sin_pair23,
        cos_pe2, cos_pe3, sin_pe2, sin_pe3);
    swiftkv_run_pe<0>(
        q_pe0, k_pe0, v_pe0, kv_cache_pe0,
        cos_pe0, sin_pe0,
        quantized_pe0_local, scale_pe0,
        swiftkv_command_pe0, swiftkv_done_pe0);
    swiftkv_run_pe<1>(
        q_pe1, k_pe1, v_pe1, kv_cache_pe1,
        cos_pe1, sin_pe1,
        quantized_pe1, scale_pe1,
        swiftkv_command_pe1, swiftkv_done_pe1);
    swiftkv_run_pe<2>(
        q_pe2, k_pe2, v_pe2, kv_cache_pe2,
        cos_pe2, sin_pe2,
        quantized_pe2, scale_pe2,
        swiftkv_command_pe2, swiftkv_done_pe2);
    swiftkv_run_pe<3>(
        q_pe3, k_pe3, v_pe3, kv_cache_pe3,
        cos_pe3, sin_pe3,
        quantized_pe3_local, scale_pe3,
        swiftkv_command_pe3, swiftkv_done_pe3);
    swiftkv_join_done01(
        swiftkv_done_pe0, swiftkv_done_pe1, swiftkv_done01);
    swiftkv_join_done23(
        swiftkv_done_pe2, swiftkv_done_pe3, swiftkv_done23);
    swiftkv_join_all_done(
        swiftkv_done01, swiftkv_done23,
        layer_index, position, all_done);
#ifdef SWIFTKV_INTEGRATED_TOP
    swiftkv_serialize_attention_pe0_to_pair01(
        quantized_pe0_local, quantized_pe0_to_pair01);
    swiftkv_serialize_attention_pe3_to_pair23(
        quantized_pe3_local, quantized_pe3_to_pair23);
    swiftkv_gather_attention_pair01(
        quantized_pe0_to_pair01, quantized_pe1, scale_pe0, scale_pe1,
        quantized_half01_stream, scale_half01_stream);
    swiftkv_gather_attention_pair23(
        quantized_pe2, quantized_pe3_to_pair23, scale_pe2, scale_pe3,
        quantized_half23_stream, scale_half23_stream);
#else
    swiftkv_collect_pe_output<0>(
        quantized_pe0_local, scale_pe0,
        quantized_buffer_pe0, scale_buffer_pe0);
    swiftkv_collect_pe_output<1>(
        quantized_pe1, scale_pe1,
        quantized_buffer_pe1, scale_buffer_pe1);
    swiftkv_collect_pe_output<2>(
        quantized_pe2, scale_pe2,
        quantized_buffer_pe2, scale_buffer_pe2);
    swiftkv_collect_pe_output<3>(
        quantized_pe3_local, scale_pe3,
        quantized_buffer_pe3, scale_buffer_pe3);
#endif
}

#ifdef SWIFTKV_INTEGRATED_TOP
void int4_swiftkv_attention_4pe_pair_halves_command(
    const int4_output_word_t* q_pe0,
    const int4_output_word_t* q_pe1,
    const int4_output_word_t* q_pe2,
    const int4_output_word_t* q_pe3,
    const int4_output_word_t* k_pe0,
    const int4_output_word_t* k_pe1,
    const int4_output_word_t* k_pe2,
    const int4_output_word_t* k_pe3,
    const int4_output_word_t* v_pe0,
    const int4_output_word_t* v_pe1,
    const int4_output_word_t* v_pe2,
    const int4_output_word_t* v_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS],
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    ap_uint<1> swiftkv_all_done = 0;
    swiftkv_run_four_pes(
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23,
        quantized_half01_stream, scale_half01_stream,
        quantized_half23_stream, scale_half23_stream,
        layer_index, position, swiftkv_all_done);
}
#endif

void int4_swiftkv_attention_4pe_command(
    const int4_output_word_t* q_pe0,
    const int4_output_word_t* q_pe1,
    const int4_output_word_t* q_pe2,
    const int4_output_word_t* q_pe3,
    const int4_output_word_t* k_pe0,
    const int4_output_word_t* k_pe1,
    const int4_output_word_t* k_pe2,
    const int4_output_word_t* k_pe3,
    const int4_output_word_t* v_pe0,
    const int4_output_word_t* v_pe1,
    const int4_output_word_t* v_pe2,
    const int4_output_word_t* v_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin[SWIFTKV_ROPE_PAIRS],
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
#ifdef SWIFTKV_INTEGRATED_TOP
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_quant_word_t> quantized_half01_stream;
    hls::stream<int4_quant_word_t> quantized_half23_stream;
    hls::stream<float> scale_half01_stream;
    hls::stream<float> scale_half23_stream;
    hls::stream<int4_quant_word_t> merged_quantized_stream;
    hls::stream<float> merged_scale_stream;
#pragma HLS STREAM variable=quantized_half01_stream depth=8
#pragma HLS STREAM variable=quantized_half23_stream depth=8
#pragma HLS STREAM variable=scale_half01_stream depth=8
#pragma HLS STREAM variable=scale_half23_stream depth=8
#pragma HLS STREAM variable=merged_quantized_stream depth=4
#pragma HLS STREAM variable=merged_scale_stream depth=4
#pragma HLS BIND_STORAGE variable=quantized_half01_stream type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_half23_stream type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=scale_half01_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half23_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=merged_quantized_stream type=fifo impl=lutram
#pragma HLS BIND_STORAGE variable=merged_scale_stream type=fifo impl=srl

    int4_swiftkv_attention_4pe_pair_halves_command(
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos, current_sin,
        current_cos, current_sin,
        quantized_half01_stream, scale_half01_stream,
        quantized_half23_stream, scale_half23_stream,
        layer_index, position);
    swiftkv_merge_attention_pair_streams(
        quantized_half01_stream, quantized_half23_stream,
        scale_half01_stream, scale_half23_stream,
        merged_quantized_stream, merged_scale_stream);
    swiftkv_store_attention_streams(
        merged_quantized_stream, merged_scale_stream,
        activation_q, activation_scale);
#else
    int4_quant_word_t quantized_buffer_pe0[32];
    int4_quant_word_t quantized_buffer_pe1[32];
    int4_quant_word_t quantized_buffer_pe2[32];
    int4_quant_word_t quantized_buffer_pe3[32];
    float scale_buffer_pe0[32];
    float scale_buffer_pe1[32];
    float scale_buffer_pe2[32];
    float scale_buffer_pe3[32];
#pragma HLS BIND_STORAGE variable=quantized_buffer_pe0 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_buffer_pe1 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_buffer_pe2 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=quantized_buffer_pe3 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=scale_buffer_pe0 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=scale_buffer_pe1 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=scale_buffer_pe2 type=ram_1p impl=lutram
#pragma HLS BIND_STORAGE variable=scale_buffer_pe3 type=ram_1p impl=lutram
    ap_uint<1> swiftkv_all_done = 0;
    swiftkv_run_four_pes(
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos, current_sin,
        current_cos, current_sin,
        quantized_buffer_pe0, quantized_buffer_pe1,
        quantized_buffer_pe2, quantized_buffer_pe3,
        scale_buffer_pe0, scale_buffer_pe1,
        scale_buffer_pe2, scale_buffer_pe3,
        layer_index, position, swiftkv_all_done);
    if (!swiftkv_all_done) {
        return;
    }
    swiftkv_gather_attention_buffers(
        quantized_buffer_pe0, quantized_buffer_pe1,
        quantized_buffer_pe2, quantized_buffer_pe3,
        scale_buffer_pe0, scale_buffer_pe1,
        scale_buffer_pe2, scale_buffer_pe3,
        activation_q, activation_scale);
#endif
}

#ifdef INT4_LEGACY_CONTROLLER
void int4_swiftkv_attention_4pe(
    const int4_output_word_t* q_pe0,
    const int4_output_word_t* q_pe1,
    const int4_output_word_t* q_pe2,
    const int4_output_word_t* q_pe3,
    const int4_output_word_t* k_pe0,
    const int4_output_word_t* k_pe1,
    const int4_output_word_t* k_pe2,
    const int4_output_word_t* k_pe3,
    const int4_output_word_t* v_pe0,
    const int4_output_word_t* v_pe1,
    const int4_output_word_t* v_pe2,
    const int4_output_word_t* v_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin[SWIFTKV_ROPE_PAIRS],
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    Int4Controller& controller
) {
#pragma HLS INTERFACE m_axi port=q_pe0 bundle=gmem0 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=k_pe0 bundle=gmem0 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=v_pe0 bundle=gmem0 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=activation_q bundle=gmem0 offset=slave \
    depth=INT4_GROUPS_PER_VECTOR
#pragma HLS INTERFACE m_axi port=activation_scale bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_SCALE_WORDS

#pragma HLS INTERFACE m_axi port=q_pe1 bundle=gmem1 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=k_pe1 bundle=gmem1 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=v_pe1 bundle=gmem1 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=q_pe2 bundle=gmem2 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=k_pe2 bundle=gmem2 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=v_pe2 bundle=gmem2 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=q_pe3 bundle=gmem3 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=k_pe3 bundle=gmem3 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=v_pe3 bundle=gmem3 offset=slave depth=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2

#pragma HLS INTERFACE bram port=current_cos depth=SWIFTKV_ROPE_PAIRS
#pragma HLS INTERFACE bram port=current_sin depth=SWIFTKV_ROPE_PAIRS

#pragma HLS INTERFACE s_axilite port=q_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=q_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=q_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=q_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=k_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=k_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=k_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=k_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=v_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=v_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=v_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=v_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=current_cos bundle=control
#pragma HLS INTERFACE s_axilite port=current_sin bundle=control
#pragma HLS INTERFACE s_axilite port=activation_q bundle=control
#pragma HLS INTERFACE s_axilite port=activation_scale bundle=control
#pragma HLS INTERFACE s_axilite port=controller bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (controller.run_rope != INT4_RUN) {
        return;
    }

    int4_swiftkv_attention_4pe_command(
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos, current_sin,
        activation_q, activation_scale,
        controller.layer_index, controller.position);

    controller.run_rope = INT4_LAZY;
    controller.run_attention = INT4_LAZY;
    controller.run_linear = INT4_RUN;
    controller.linear_mode = INT4_LINEAR_O;
}
#endif

#ifdef SWIFTKV_LATENCY_VERIFY_TOP
// Diagnostic top that matches the integrated decoder memory topology:
// Q/K/V, RoPE and activation buffers are on-chip memories, while only the
// KV cache remains behind the four external AXI masters.
void swiftkv_attention_latency_verify(
    const int4_output_word_t* q_pe0,
    const int4_output_word_t* q_pe1,
    const int4_output_word_t* q_pe2,
    const int4_output_word_t* q_pe3,
    const int4_output_word_t* k_pe0,
    const int4_output_word_t* k_pe1,
    const int4_output_word_t* k_pe2,
    const int4_output_word_t* k_pe3,
    const int4_output_word_t* v_pe0,
    const int4_output_word_t* v_pe1,
    const int4_output_word_t* v_pe2,
    const int4_output_word_t* v_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin[SWIFTKV_ROPE_PAIRS],
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    ap_uint<12> position
) {
#pragma HLS INTERFACE bram port=q_pe0 depth=64
#pragma HLS INTERFACE bram port=q_pe1 depth=64
#pragma HLS INTERFACE bram port=q_pe2 depth=64
#pragma HLS INTERFACE bram port=q_pe3 depth=64
#pragma HLS INTERFACE bram port=k_pe0 depth=64
#pragma HLS INTERFACE bram port=k_pe1 depth=64
#pragma HLS INTERFACE bram port=k_pe2 depth=64
#pragma HLS INTERFACE bram port=k_pe3 depth=64
#pragma HLS INTERFACE bram port=v_pe0 depth=64
#pragma HLS INTERFACE bram port=v_pe1 depth=64
#pragma HLS INTERFACE bram port=v_pe2 depth=64
#pragma HLS INTERFACE bram port=v_pe3 depth=64

#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64

#pragma HLS INTERFACE bram port=current_cos depth=SWIFTKV_ROPE_PAIRS
#pragma HLS INTERFACE bram port=current_sin depth=SWIFTKV_ROPE_PAIRS
#pragma HLS INTERFACE bram port=activation_q depth=128
#pragma HLS INTERFACE bram port=activation_scale depth=8
#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    int4_swiftkv_attention_4pe_command(
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos, current_sin,
        activation_q, activation_scale,
        0, position);
}
#endif
