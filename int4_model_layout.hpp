#pragma once

#include "int4_linear_controller.hpp"

// Input-column-sharded model layout. Every DDR contains the columns consumed
// by its local PE for every global output tile. Matrix spans are identical in
// all four banks, so a narrow command carries one common offset.

inline int int4_mode_valid_output_rows(int mode) {
    switch (mode) {
    case INT4_LINEAR_Q:
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
    case INT4_LINEAR_O:
    case INT4_LINEAR_DOWN:
        return INT4_DIM;
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        return INT4_HIDDEN_DIM;
    case INT4_LINEAR_LOGITS:
        return INT4_VOCAB_SIZE;
    default:
        return 0;
    }
}

inline int int4_mode_padded_output_rows(int mode) {
    switch (mode) {
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        return INT4_PADDED_HIDDEN_DIM;
    case INT4_LINEAR_LOGITS:
        return INT4_PADDED_VOCAB_SIZE;
    case INT4_LINEAR_Q:
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
    case INT4_LINEAR_O:
    case INT4_LINEAR_DOWN:
        return INT4_PADDED_DIM;
    default:
        return 0;
    }
}

inline int int4_mode_valid_input_cols(int mode) {
    return mode == INT4_LINEAR_DOWN ? INT4_HIDDEN_DIM : INT4_DIM;
}

inline int int4_mode_padded_input_cols(int mode) {
    return mode == INT4_LINEAR_DOWN
        ? INT4_PADDED_HIDDEN_DIM
        : INT4_PADDED_DIM;
}

inline int int4_mode_output_tiles(int mode) {
    return int4_mode_padded_output_rows(mode) / INT4_TILE_ROWS;
}

inline int int4_mode_local_input_tiles(int mode) {
    return int4_mode_padded_input_cols(mode) /
           (INT4_PE_COUNT * INT4_TILE_COLS);
}

inline int int4_mode_local_output_tiles(int mode) {
    return int4_mode_output_tiles(mode) / INT4_PE_COUNT;
}

inline int int4_mode_local_groups(int mode) {
    return int4_mode_padded_input_cols(mode) /
           (INT4_PE_COUNT * INT4_GROUP_SIZE);
}

inline bool int4_mode_output_is_fxp(int mode) {
    return mode == INT4_LINEAR_Q ||
           mode == INT4_LINEAR_K ||
           mode == INT4_LINEAR_V;
}

inline Int4LinearShape int4_linear_shape(int mode) {
    Int4LinearShape shape;
    shape.valid_output_rows = int4_mode_valid_output_rows(mode);
    shape.padded_output_rows = int4_mode_padded_output_rows(mode);
    shape.valid_input_cols = int4_mode_valid_input_cols(mode);
    shape.padded_input_cols = int4_mode_padded_input_cols(mode);
    shape.output_tiles = int4_mode_output_tiles(mode);
    shape.local_input_tiles = int4_mode_local_input_tiles(mode);
    shape.local_output_tiles = int4_mode_local_output_tiles(mode);
    return shape;
}

inline int int4_matrix_tile_count(int mode) {
    return int4_mode_output_tiles(mode) *
           int4_mode_local_input_tiles(mode);
}

inline int int4_matrix_weight_words(int mode) {
    return int4_matrix_tile_count(mode) * INT4_WEIGHT_WORDS_PER_TILE;
}

inline int int4_matrix_scale_words(int mode) {
    return (int4_matrix_tile_count(mode) +
            INT4_WEIGHT_SCALES_PER_WORD - 1) /
           INT4_WEIGHT_SCALES_PER_WORD;
}

inline int int4_layer_weight_stride() {
    int words = 0;
    for (int mode = INT4_LINEAR_Q; mode <= INT4_LINEAR_DOWN; ++mode) {
        words += int4_matrix_weight_words(mode);
    }
    return words;
}

inline int int4_layer_scale_stride() {
    int words = 0;
    for (int mode = INT4_LINEAR_Q; mode <= INT4_LINEAR_DOWN; ++mode) {
        words += int4_matrix_scale_words(mode);
    }
    return words;
}

inline int int4_weight_offset(int layer, int mode) {
    if (mode == INT4_LINEAR_LOGITS) {
        return INT4_NUM_LAYERS * int4_layer_weight_stride();
    }
    int offset = layer * int4_layer_weight_stride();
    for (int prior = INT4_LINEAR_Q; prior < mode; ++prior) {
        offset += int4_matrix_weight_words(prior);
    }
    return offset;
}

inline int int4_weight_scale_offset(int layer, int mode) {
    if (mode == INT4_LINEAR_LOGITS) {
        return INT4_NUM_LAYERS * int4_layer_scale_stride();
    }
    int offset = layer * int4_layer_scale_stride();
    for (int prior = INT4_LINEAR_Q; prior < mode; ++prior) {
        offset += int4_matrix_scale_words(prior);
    }
    return offset;
}

static constexpr int INT4_NORM_WORDS_PER_PE = INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_NORM_WORDS_PER_LAYER_PE =
    2 * INT4_NORM_WORDS_PER_PE;
static constexpr int INT4_TOTAL_NORM_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_NORM_WORDS_PER_LAYER_PE +
    INT4_NORM_WORDS_PER_PE;

// Per-bank sizes after changing O/DOWN and all other projections to a common
// input-column layout. DOWN pads 43 input tiles to 44, increasing each PE by
// only eight 128x256 tiles per layer while balancing all four DDR readers.
static constexpr int INT4_LAYER_MATRIX_TILES_PER_PE = 1568;
static constexpr int INT4_LOGITS_MATRIX_TILES_PER_PE = 1008;
static constexpr int INT4_LAYER_WEIGHT_WORDS_PER_PE =
    INT4_LAYER_MATRIX_TILES_PER_PE * INT4_WEIGHT_WORDS_PER_TILE;
static constexpr int INT4_LOGITS_WEIGHT_WORDS_PER_PE =
    INT4_LOGITS_MATRIX_TILES_PER_PE * INT4_WEIGHT_WORDS_PER_TILE;
static constexpr int INT4_TOTAL_WEIGHT_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_LAYER_WEIGHT_WORDS_PER_PE +
    INT4_LOGITS_WEIGHT_WORDS_PER_PE;

static constexpr int INT4_LAYER_WEIGHT_SCALE_WORDS_PER_PE = 49;
static constexpr int INT4_LOGITS_WEIGHT_SCALE_WORDS_PER_PE = 32;
static constexpr int INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_LAYER_WEIGHT_SCALE_WORDS_PER_PE +
    INT4_LOGITS_WEIGHT_SCALE_WORDS_PER_PE;

static constexpr int INT4_MODEL_SCALE_BASE_WORD = 0;
static constexpr int INT4_MODEL_NORM_BASE_WORD =
    INT4_MODEL_SCALE_BASE_WORD + INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE;
static constexpr int INT4_MODEL_WEIGHT_BASE_WORD =
    INT4_MODEL_NORM_BASE_WORD + INT4_TOTAL_NORM_WORDS_PER_PE;
static constexpr int INT4_MODEL_WORDS_PER_DDR =
    INT4_MODEL_WEIGHT_BASE_WORD + INT4_TOTAL_WEIGHT_WORDS_PER_PE;

static_assert(INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE == 1600,
              "unexpected input-sharded scale image size");
static_assert(INT4_TOTAL_NORM_WORDS_PER_PE == 4160,
              "unexpected local RMSNorm image size");
static_assert(INT4_TOTAL_WEIGHT_WORDS_PER_PE == 13103104,
              "unexpected input-column-sharded weight image size");
static_assert(INT4_MODEL_WORDS_PER_DDR == 13108864,
              "unexpected complete per-DDR model image size");

inline int4_weight_scale_word_t* int4_model_scale_base(
    int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_SCALE_BASE_WORD;
}

inline int4_output_word_t* int4_model_norm_base(
    int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_NORM_BASE_WORD;
}

inline int4_weight_word_t* int4_model_weight_base(
    int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_WEIGHT_BASE_WORD;
}

inline const int4_weight_scale_word_t* int4_model_scale_base(
    const int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_SCALE_BASE_WORD;
}

inline const int4_output_word_t* int4_model_norm_base(
    const int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_NORM_BASE_WORD;
}

inline const int4_weight_word_t* int4_model_weight_base(
    const int4_weight_word_t* model_bank) {
    return model_bank + INT4_MODEL_WEIGHT_BASE_WORD;
}

inline int int4_norm_offset(int layer, int norm_mode) {
    if (norm_mode == INT4_RMSNORM_FINAL) {
        return INT4_NUM_LAYERS * INT4_NORM_WORDS_PER_LAYER_PE;
    }
    return layer * INT4_NORM_WORDS_PER_LAYER_PE +
           (norm_mode == INT4_RMSNORM_FFN
                ? INT4_NORM_WORDS_PER_PE
                : 0);
}
