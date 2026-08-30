#include "int4_weight_packer.hpp"
#include "swiftkv_attention.hpp"

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <limits>

union int4_packer_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static ap_uint<32> int4_packer_float_to_bits(float value) {
    int4_packer_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static float int4_packer_bits_to_float(ap_uint<32> bits) {
    int4_packer_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<16> int4_packer_float_to_half_bits(float value) {
    int4_packer_fp32_bits_t converter;
    converter.value = value;
    const std::uint32_t bits = converter.bits;
    const std::uint32_t sign = (bits >> 16) & 0x8000U;
    const int exponent = (int)((bits >> 23) & 0xffU) - 127 + 15;
    std::uint32_t mantissa = bits & 0x7fffffU;

    if (((bits >> 23) & 0xffU) == 0xffU) {
        return (ap_uint<16>)(
            sign | (mantissa == 0 ? 0x7c00U : 0x7e00U));
    }
    if (exponent >= 31) {
        return (ap_uint<16>)(sign | 0x7c00U);
    }
    if (exponent <= 0) {
        if (exponent < -10) {
            return (ap_uint<16>)sign;
        }
        mantissa |= 0x800000U;
        const int shift = 14 - exponent;
        const std::uint32_t halfway = 1U << (shift - 1);
        const std::uint32_t rounded =
            (mantissa + halfway - 1U +
             ((mantissa >> shift) & 1U)) >> shift;
        return (ap_uint<16>)(sign | rounded);
    }

    mantissa += 0xfffU + ((mantissa >> 13) & 1U);
    int rounded_exponent = exponent;
    if (mantissa & 0x800000U) {
        mantissa = 0;
        ++rounded_exponent;
        if (rounded_exponent >= 31) {
            return (ap_uint<16>)(sign | 0x7c00U);
        }
    }
    return (ap_uint<16>)(
        sign |
        ((std::uint32_t)rounded_exponent << 10) |
        (mantissa >> 13));
}

static float int4_packer_half_bits_to_float(ap_uint<16> half_bits) {
    const std::uint16_t bits = (std::uint16_t)half_bits;
    const bool negative = (bits & 0x8000U) != 0;
    const int exponent = (bits >> 10) & 0x1f;
    const int mantissa = bits & 0x3ff;
    float value = 0.0f;
    if (exponent == 0) {
        value = std::ldexp((float)mantissa, -24);
    } else if (exponent == 31) {
        value = mantissa == 0
            ? INFINITY
            : std::numeric_limits<float>::quiet_NaN();
    } else {
        value = std::ldexp(
            1.0f + (float)mantissa * (1.0f / 1024.0f),
            exponent - 15);
    }
    return negative ? -value : value;
}

static ap_uint<32> int4_packer_float_to_q17_bits(float value) {
    int4_fxp32_t fixed_value = value;
    return fixed_value.range(31, 0);
}

static int int4_quantize_weight(float value, float scale) {
    if (scale == 0.0f) {
        return 0;
    }
    int quantized = (int)std::round(value / scale);
    quantized = std::max(-7, std::min(7, quantized));
    return quantized;
}

static int4_weight_word_t* int4_select_weight_bank(
    int pe,
    int4_weight_word_t* bank0,
    int4_weight_word_t* bank1,
    int4_weight_word_t* bank2,
    int4_weight_word_t* bank3) {
    if (pe == 0) return bank0;
    if (pe == 1) return bank1;
    if (pe == 2) return bank2;
    return bank3;
}

static int4_weight_scale_word_t* int4_select_scale_bank(
    int pe,
    int4_weight_scale_word_t* bank0,
    int4_weight_scale_word_t* bank1,
    int4_weight_scale_word_t* bank2,
    int4_weight_scale_word_t* bank3) {
    if (pe == 0) return bank0;
    if (pe == 1) return bank1;
    if (pe == 2) return bank2;
    return bank3;
}

void int4_pack_linear_matrix(
    const float* matrix,
    int layer,
    int mode,
    int4_weight_word_t* weight_pe0,
    int4_weight_word_t* weight_pe1,
    int4_weight_word_t* weight_pe2,
    int4_weight_word_t* weight_pe3,
    int4_weight_scale_word_t* scale_pe0,
    int4_weight_scale_word_t* scale_pe1,
    int4_weight_scale_word_t* scale_pe2,
    int4_weight_scale_word_t* scale_pe3) {
    const Int4LinearShape shape = int4_linear_shape(mode);
    const int weight_base = int4_weight_offset(layer, mode);
    const int scale_base = int4_weight_scale_offset(layer, mode);
    const int matrix_scale_words = int4_matrix_scale_words(mode);

    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        int4_weight_scale_word_t* scale_bank =
            int4_select_scale_bank(
                pe, scale_pe0, scale_pe1, scale_pe2, scale_pe3);
        for (int word = 0; word < matrix_scale_words; ++word) {
            scale_bank[scale_base + word] = 0;
        }
    }

    // All four banks walk output tiles in the same order. PE ownership exists
    // only on the input-column axis, so no activation broadcast is required.
    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        int4_weight_word_t* weight_bank =
            int4_select_weight_bank(
                pe, weight_pe0, weight_pe1, weight_pe2, weight_pe3);
        int4_weight_scale_word_t* scale_bank =
            int4_select_scale_bank(
                pe, scale_pe0, scale_pe1, scale_pe2, scale_pe3);

        for (int output_tile = 0;
             output_tile < shape.output_tiles;
             ++output_tile) {
            for (int local_col_tile = 0;
                 local_col_tile < shape.local_input_tiles;
                 ++local_col_tile) {
                const int global_col_tile =
                    pe * shape.local_input_tiles + local_col_tile;
                const int matrix_tile =
                    output_tile * shape.local_input_tiles + local_col_tile;
                const int weight_tile_base =
                    weight_base + matrix_tile * INT4_WEIGHT_WORDS_PER_TILE;
                const int scale_word_index =
                    scale_base + matrix_tile / INT4_WEIGHT_SCALES_PER_WORD;
                const int scale_lane =
                    matrix_tile & (INT4_WEIGHT_SCALES_PER_WORD - 1);

                float max_abs = 0.0f;
                for (int row = 0; row < INT4_TILE_ROWS; ++row) {
                    const int global_row =
                        output_tile * INT4_TILE_ROWS + row;
                    for (int col_in_tile = 0;
                         col_in_tile < INT4_TILE_COLS;
                         ++col_in_tile) {
                        const int global_col =
                            global_col_tile * INT4_TILE_COLS + col_in_tile;
                        const float value =
                            global_row < shape.valid_output_rows &&
                            global_col < shape.valid_input_cols
                                ? matrix[
                                      global_row * shape.valid_input_cols +
                                      global_col]
                                : 0.0f;
                        const float magnitude = std::fabs(value);
                        if (magnitude > max_abs) {
                            max_abs = magnitude;
                        }
                    }
                }

                const float fp32_scale =
                    max_abs == 0.0f ? 0.0f : max_abs / 7.0f;
                const ap_uint<16> fp16_scale_bits =
                    int4_packer_float_to_half_bits(fp32_scale);
                const float stored_scale =
                    int4_packer_half_bits_to_float(fp16_scale_bits);
                int4_weight_scale_word_t packed_scales =
                    scale_bank[scale_word_index];
                packed_scales.range(
                    INT4_WEIGHT_SCALE_BITS * scale_lane +
                        INT4_WEIGHT_SCALE_BITS - 1,
                    INT4_WEIGHT_SCALE_BITS * scale_lane) = fp16_scale_bits;
                scale_bank[scale_word_index] = packed_scales;

                for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
                    for (int row_block = 0;
                         row_block < INT4_ROW_BLOCKS;
                         ++row_block) {
                        int4_weight_word_t packed_weight = 0;
                        for (int lane = 0; lane < INT4_GROUP_SIZE; ++lane) {
                            const int global_col =
                                global_col_tile * INT4_TILE_COLS +
                                group * INT4_GROUP_SIZE + lane;
                            for (int row_in_block = 0;
                                 row_in_block < INT4_ROW_BLOCK;
                                 ++row_in_block) {
                                const int global_row =
                                    output_tile * INT4_TILE_ROWS +
                                    row_block * INT4_ROW_BLOCK + row_in_block;
                                const float value =
                                    global_row < shape.valid_output_rows &&
                                    global_col < shape.valid_input_cols
                                        ? matrix[
                                              global_row * shape.valid_input_cols +
                                              global_col]
                                        : 0.0f;
                                const int quantized =
                                    int4_quantize_weight(value, stored_scale);
                                const int pair = row_in_block / 2;
                                const int nibble =
                                    (row_in_block & 1) ? 0 : 4;
                                const int bit = 16 * lane + 8 * pair + nibble;
                                packed_weight.range(bit + 3, bit) =
                                    (ap_uint<4>)(ap_int<4>)quantized;
                            }
                        }
                        weight_bank[
                            weight_tile_base +
                            group * INT4_ROW_BLOCKS + row_block] =
                                packed_weight;
                    }
                }
            }
        }
    }
}

static int4_output_word_t* int4_select_output_bank(
    int pe,
    int4_output_word_t* bank0,
    int4_output_word_t* bank1,
    int4_output_word_t* bank2,
    int4_output_word_t* bank3) {
    if (pe == 0) return bank0;
    if (pe == 1) return bank1;
    if (pe == 2) return bank2;
    return bank3;
}

void int4_pack_norm_vector(
    const float* gamma,
    int layer,
    int norm_mode,
    int4_output_word_t* norm_pe0,
    int4_output_word_t* norm_pe1,
    int4_output_word_t* norm_pe2,
    int4_output_word_t* norm_pe3) {
    const int base = int4_norm_offset(layer, norm_mode);
    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        int4_output_word_t* bank = int4_select_output_bank(
            pe, norm_pe0, norm_pe1, norm_pe2, norm_pe3);
        for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
            int4_output_word_t packed = 0;
            for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
                const int global_index =
                    pe * INT4_LOCAL_DIM +
                    word * INT4_OUTPUTS_PER_WORD + lane;
                packed.range(32 * lane + 31, 32 * lane) =
                    int4_packer_float_to_bits(gamma[global_index]);
            }
            bank[base + word] = packed;
        }
    }
}

void int4_pack_input_residual(
    const float* input,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3) {
    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        int4_output_word_t* bank = int4_select_output_bank(
            pe, residual_pe0, residual_pe1, residual_pe2, residual_pe3);
        for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
            int4_output_word_t packed = 0;
            for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
                const int global_index =
                    pe * INT4_LOCAL_DIM +
                    word * INT4_OUTPUTS_PER_WORD + lane;
                packed.range(32 * lane + 31, 32 * lane) =
                    int4_packer_float_to_bits(input[global_index]);
            }
            bank[word] = packed;
        }
    }
}

void int4_unpack_fp32_linear_output(
    int mode,
    const int4_output_word_t* output_pe0,
    const int4_output_word_t* output_pe1,
    const int4_output_word_t* output_pe2,
    const int4_output_word_t* output_pe3,
    float* output) {
    const int4_output_word_t* banks[INT4_PE_COUNT] = {
        output_pe0, output_pe1, output_pe2, output_pe3
    };
    const int valid_rows = int4_mode_valid_output_rows(mode);
    const int local_rows =
        int4_mode_padded_output_rows(mode) / INT4_PE_COUNT;
    const int local_words = local_rows / INT4_OUTPUTS_PER_WORD;
    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        for (int word = 0; word < local_words; ++word) {
            const int4_output_word_t packed = banks[pe][word];
            for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
                const int global_index =
                    pe * local_rows +
                    word * INT4_OUTPUTS_PER_WORD + lane;
                if (global_index < valid_rows) {
                    output[global_index] = int4_packer_bits_to_float(
                        packed.range(32 * lane + 31, 32 * lane));
                }
            }
        }
    }
}

void int4_pack_rope_lut(int4_output_word_t* rope_lut_ddr) {
    for (int position = 0; position < SWIFTKV_ROPE_POSITIONS; ++position) {
        for (int group = 0;
             group < SWIFTKV_ROPE_LUT_WORDS_PER_POSITION;
             ++group) {
            swiftkv_rope_lut_word_t packed = 0;
            for (int lane = 0;
                 lane < SWIFTKV_ROPE_PAIRS_PER_LUT_WORD;
                 ++lane) {
                const int pair =
                    group * SWIFTKV_ROPE_PAIRS_PER_LUT_WORD + lane;
                const float frequency = std::pow(
                    10000.0f,
                    -(float)pair / (float)SWIFTKV_ROPE_PAIRS);
                const float angle = (float)position * frequency;
                const ap_uint<32> cosine_q17 =
                    int4_packer_float_to_q17_bits(std::cos(angle));
                const ap_uint<32> sine_q17 =
                    int4_packer_float_to_q17_bits(std::sin(angle));
                const int bit = lane * 38;
                packed.range(bit + 18, bit) = cosine_q17.range(18, 0);
                packed.range(bit + 37, bit + 19) = sine_q17.range(18, 0);
            }

            const int lut_address =
                position * SWIFTKV_ROPE_LUT_WORDS_PER_POSITION + group;
            const int ddr_address =
                lut_address * SWIFTKV_ROPE_DDR_WORDS_PER_LUT_WORD;
            int4_output_word_t low = packed.range(511, 0);
            int4_output_word_t high = 0;
            high.range(SWIFTKV_ROPE_LUT_WORD_BITS - 513, 0) =
                packed.range(SWIFTKV_ROPE_LUT_WORD_BITS - 1, 512);
            rope_lut_ddr[ddr_address] = low;
            rope_lut_ddr[ddr_address + 1] = high;
        }
    }
}
