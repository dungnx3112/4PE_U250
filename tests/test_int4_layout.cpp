#include "int4_decoder_schedule.hpp"
#include "int4_model_layout.hpp"
#include "int4_numeric.hpp"
#include "int4_weight_packer.hpp"

#include <cassert>
#include <iostream>

int int4_layout_test_top(int layer, int mode);

struct ExpectedShape {
    int valid_output_rows;
    int padded_output_rows;
    int valid_input_cols;
    int padded_input_cols;
    int output_tiles;
    int local_input_tiles;
    int local_output_tiles;
};

static void expect_shape(int mode, const ExpectedShape& expected) {
    const Int4LinearShape actual = int4_linear_shape(mode);
    assert(actual.valid_output_rows == expected.valid_output_rows);
    assert(actual.padded_output_rows == expected.padded_output_rows);
    assert(actual.valid_input_cols == expected.valid_input_cols);
    assert(actual.padded_input_cols == expected.padded_input_cols);
    assert(actual.output_tiles == expected.output_tiles);
    assert(actual.local_input_tiles == expected.local_input_tiles);
    assert(actual.local_output_tiles == expected.local_output_tiles);
}

static void test_shapes() {
    const ExpectedShape model_projection = {
        4096, 4096, 4096, 4096, 32, 4, 8};
    expect_shape(INT4_LINEAR_Q, model_projection);
    expect_shape(INT4_LINEAR_K, model_projection);
    expect_shape(INT4_LINEAR_V, model_projection);
    expect_shape(INT4_LINEAR_O, model_projection);

    const ExpectedShape hidden_projection = {
        11008, 11264, 4096, 4096, 88, 4, 22};
    expect_shape(INT4_LINEAR_GATE, hidden_projection);
    expect_shape(INT4_LINEAR_UP, hidden_projection);

    const ExpectedShape down_projection = {
        4096, 4096, 11008, 11264, 32, 11, 8};
    expect_shape(INT4_LINEAR_DOWN, down_projection);

    const ExpectedShape logits_projection = {
        32000, 32256, 4096, 4096, 252, 4, 63};
    expect_shape(INT4_LINEAR_LOGITS, logits_projection);
}

static void test_matrix_sizes() {
    int layer_tiles = 0;
    int layer_scale_words = 0;
    for (int mode = INT4_LINEAR_Q; mode <= INT4_LINEAR_DOWN; ++mode) {
        layer_tiles += int4_matrix_tile_count(mode);
        layer_scale_words += int4_matrix_scale_words(mode);
    }

    assert(layer_tiles == INT4_LAYER_MATRIX_TILES_PER_PE);
    assert(layer_scale_words == INT4_LAYER_WEIGHT_SCALE_WORDS_PER_PE);
    assert(int4_matrix_tile_count(INT4_LINEAR_LOGITS) ==
           INT4_LOGITS_MATRIX_TILES_PER_PE);
    assert(int4_matrix_scale_words(INT4_LINEAR_LOGITS) ==
           INT4_LOGITS_WEIGHT_SCALE_WORDS_PER_PE);
}

static void test_offsets() {
    for (int layer = 0; layer < INT4_NUM_LAYERS; ++layer) {
        int expected_weight = layer * int4_layer_weight_stride();
        int expected_scale = layer * int4_layer_scale_stride();
        for (int mode = INT4_LINEAR_Q; mode <= INT4_LINEAR_DOWN; ++mode) {
            assert(int4_weight_offset(layer, mode) == expected_weight);
            assert(int4_weight_scale_offset(layer, mode) == expected_scale);
            expected_weight += int4_matrix_weight_words(mode);
            expected_scale += int4_matrix_scale_words(mode);
        }
    }

    assert(int4_weight_offset(0, INT4_LINEAR_LOGITS) ==
           INT4_NUM_LAYERS * int4_layer_weight_stride());
    assert(int4_weight_scale_offset(0, INT4_LINEAR_LOGITS) ==
           INT4_NUM_LAYERS * int4_layer_scale_stride());
    assert(int4_norm_offset(0, INT4_RMSNORM_ATTENTION) == 0);
    assert(int4_norm_offset(0, INT4_RMSNORM_FFN) ==
           INT4_NORM_WORDS_PER_PE);
    assert(int4_norm_offset(0, INT4_RMSNORM_FINAL) ==
           INT4_NUM_LAYERS * INT4_NORM_WORDS_PER_LAYER_PE);
}

static void test_schedule() {
    int linear_stages = 0;
    int rms_stages = 0;
    for (int schedule_layer = 0;
         schedule_layer < INT4_DECODER_SCHEDULE_LAYERS;
         ++schedule_layer) {
        const int stage_count = int4_decoder_stage_count(schedule_layer);
        linear_stages += stage_count;
        for (int stage = 0; stage < stage_count; ++stage) {
            const int mode =
                (int)int4_decoder_stage_mode(schedule_layer, stage);
            if (mode == INT4_LINEAR_Q ||
                mode == INT4_LINEAR_GATE ||
                mode == INT4_LINEAR_LOGITS) {
                ++rms_stages;
            }
        }
    }
    assert(linear_stages == INT4_DECODER_LINEAR_STAGES);
    assert(rms_stages == INT4_DECODER_RMS_STAGES);
    assert(int4_decoder_stage_mode(INT4_NUM_LAYERS, 0) ==
           INT4_LINEAR_LOGITS);
}

static void test_numeric_boundaries() {
    assert(int4_fp32_to_bits(0.0f) == 0x00000000U);
    assert(int4_fp32_to_bits(1.0f) == 0x3f800000U);
    assert(int4_fp32_to_bits(-1.0f) == 0xbf800000U);
    assert(int4_fp32_from_bits((ap_uint<32>)0x3f000000U) == 0.5f);
}

static void test_input_residual_packing() {
    float input[INT4_DIM];
    int4_output_word_t packed[INT4_PE_COUNT][INT4_VECTOR_WORDS_PER_PE];
    for (int index = 0; index < INT4_DIM; ++index) {
        input[index] = (float)(index - 2048) * 0.25f;
    }

    int4_pack_input_residual(
        input, packed[0], packed[1], packed[2], packed[3]);

    for (int pe = 0; pe < INT4_PE_COUNT; ++pe) {
        const int local_indices[] = {0, 1, INT4_LOCAL_DIM - 1};
        for (int sample = 0; sample < 3; ++sample) {
            const int local_index = local_indices[sample];
            const int word = local_index / INT4_OUTPUTS_PER_WORD;
            const int lane = local_index % INT4_OUTPUTS_PER_WORD;
            const int global_index = pe * INT4_LOCAL_DIM + local_index;
            const ap_uint<32> actual = packed[pe][word].range(
                32 * lane + 31, 32 * lane);
            assert(actual == int4_fp32_to_bits(input[global_index]));
        }
    }
}

int main() {
    test_shapes();
    test_matrix_sizes();
    test_offsets();
    test_schedule();
    test_numeric_boundaries();
    test_input_residual_packing();

    // Exercise the synthesizable wrapper as part of the linked C model.
    assert(int4_layout_test_top(0, INT4_LINEAR_Q) >= 0);
    std::cout << "INT4 layout and schedule tests passed\n";
    return 0;
}
