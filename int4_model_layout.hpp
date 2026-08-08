#pragma once

#include "int4_decoder_blocks.hpp"

// Fixed, controller-addressed model layout.  The host never supplies matrix
// dimensions to hardware; mode + layer select one of these precomputed spans.

inline int int4_mode_valid_output_tiles(int mode) {
    switch (mode) {
    case INT4_LINEAR_Q:
    case INT4_LINEAR_K:
    case INT4_LINEAR_V:
    case INT4_LINEAR_O:
    case INT4_LINEAR_DOWN:
        return INT4_DIM / INT4_TILE_ROWS;
    case INT4_LINEAR_GATE:
    case INT4_LINEAR_UP:
        return INT4_HIDDEN_DIM / INT4_TILE_ROWS;
    case INT4_LINEAR_LOGITS:
        return INT4_VOCAB_SIZE / INT4_TILE_ROWS;
    default:
        return 0;
    }
}

// Pad row tiles to a multiple of the four physical PE/DDR/SLR partitions.
// Invalid tail rows are packed as zero.  This makes every matrix consume the
// same number of 512-bit words on all four DDR channels.
inline int int4_mode_output_tiles(int mode) {
    const int valid_tiles = int4_mode_valid_output_tiles(mode);
    return ((valid_tiles + INT4_PE_COUNT - 1) / INT4_PE_COUNT) *
           INT4_PE_COUNT;
}

inline int int4_mode_input_tiles(int mode) {
    return mode == INT4_LINEAR_DOWN
        ? INT4_HIDDEN_DIM / INT4_TILE_COLS
        : INT4_DIM / INT4_TILE_COLS;
}

inline int int4_mode_local_tiles(int mode, int pe) {
    const int output_tiles = int4_mode_output_tiles(mode);
    return output_tiles <= pe
        ? 0
        : (output_tiles + INT4_PE_COUNT - 1 - pe) /
              INT4_PE_COUNT;
}

inline int int4_matrix_weight_words(int mode, int pe) {
    return int4_mode_local_tiles(mode, pe) *
           int4_mode_input_tiles(mode) *
           INT4_WEIGHT_WORDS_PER_TILE;
}

inline int int4_matrix_scale_words(int mode, int pe) {
    const int tile_count =
        int4_mode_local_tiles(mode, pe) *
        int4_mode_input_tiles(mode);
    return (tile_count + INT4_WEIGHT_SCALES_PER_WORD - 1) /
           INT4_WEIGHT_SCALES_PER_WORD;
}

inline int int4_layer_weight_stride(int pe) {
    int words = 0;
    for (int mode = INT4_LINEAR_Q;
         mode <= INT4_LINEAR_DOWN;
         ++mode) {
        words += int4_matrix_weight_words(mode, pe);
    }
    return words;
}

inline int int4_layer_scale_stride(int pe) {
    int words = 0;
    for (int mode = INT4_LINEAR_Q;
         mode <= INT4_LINEAR_DOWN;
         ++mode) {
        words += int4_matrix_scale_words(mode, pe);
    }
    return words;
}

inline int int4_weight_offset(int layer, int mode, int pe) {
    if (mode == INT4_LINEAR_LOGITS) {
        return INT4_NUM_LAYERS * int4_layer_weight_stride(pe);
    }
    int offset = layer * int4_layer_weight_stride(pe);
    for (int prior = INT4_LINEAR_Q; prior < mode; ++prior) {
        offset += int4_matrix_weight_words(prior, pe);
    }
    return offset;
}

inline int int4_weight_scale_offset(int layer, int mode, int pe) {
    if (mode == INT4_LINEAR_LOGITS) {
        return INT4_NUM_LAYERS * int4_layer_scale_stride(pe);
    }
    int offset = layer * int4_layer_scale_stride(pe);
    for (int prior = INT4_LINEAR_Q; prior < mode; ++prior) {
        offset += int4_matrix_scale_words(prior, pe);
    }
    return offset;
}

inline int int4_total_weight_words(int pe) {
    return INT4_NUM_LAYERS * int4_layer_weight_stride(pe) +
           int4_matrix_weight_words(INT4_LINEAR_LOGITS, pe);
}

inline int int4_total_weight_scale_words(int pe) {
    return INT4_NUM_LAYERS * int4_layer_scale_stride(pe) +
           int4_matrix_scale_words(INT4_LINEAR_LOGITS, pe);
}

static constexpr int INT4_NORM_WORDS_PER_PE =
    INT4_VECTOR_WORDS_PER_PE;
static constexpr int INT4_NORM_WORDS_PER_LAYER_PE =
    2 * INT4_NORM_WORDS_PER_PE;
static constexpr int INT4_TOTAL_NORM_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_NORM_WORDS_PER_LAYER_PE +
    INT4_NORM_WORDS_PER_PE;

// One contiguous image is stored in each physical DDR:
//   [all packed FP16 tile scales][all RMSNorm gamma][all INT4 weights]
//
// Padding every matrix to four output-tile stripes makes these constants
// identical for PE/DDR 0..3.  Keeping scale at offset zero permits one long
// preload burst before the controller starts issuing matrix operations.
static constexpr int INT4_LAYER_WEIGHT_WORDS_PER_PE =
    4 * (8 * 16 * INT4_WEIGHT_WORDS_PER_TILE) +
    2 * (22 * 16 * INT4_WEIGHT_WORDS_PER_TILE) +
    1 * (8 * 43 * INT4_WEIGHT_WORDS_PER_TILE);
static constexpr int INT4_LOGITS_WEIGHT_WORDS_PER_PE =
    63 * 16 * INT4_WEIGHT_WORDS_PER_TILE;
static constexpr int INT4_TOTAL_WEIGHT_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_LAYER_WEIGHT_WORDS_PER_PE +
    INT4_LOGITS_WEIGHT_WORDS_PER_PE;

static constexpr int INT4_LAYER_WEIGHT_SCALE_WORDS_PER_PE =
    4 * 4 + 2 * 11 + 11;
static constexpr int INT4_LOGITS_WEIGHT_SCALE_WORDS_PER_PE = 32;
static constexpr int INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE =
    INT4_NUM_LAYERS * INT4_LAYER_WEIGHT_SCALE_WORDS_PER_PE +
    INT4_LOGITS_WEIGHT_SCALE_WORDS_PER_PE;

static constexpr int INT4_MODEL_SCALE_BASE_WORD = 0;
static constexpr int INT4_MODEL_NORM_BASE_WORD =
    INT4_MODEL_SCALE_BASE_WORD +
    INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE;
static constexpr int INT4_MODEL_WEIGHT_BASE_WORD =
    INT4_MODEL_NORM_BASE_WORD +
    INT4_TOTAL_NORM_WORDS_PER_PE;
static constexpr int INT4_MODEL_WORDS_PER_DDR =
    INT4_MODEL_WEIGHT_BASE_WORD +
    INT4_TOTAL_WEIGHT_WORDS_PER_PE;

static_assert(INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE == 1600,
              "the four DDR scale preloads must be exactly balanced");
static_assert(INT4_TOTAL_NORM_WORDS_PER_PE == 4160,
              "unexpected RMSNorm bank layout");
static_assert(INT4_TOTAL_WEIGHT_WORDS_PER_PE == 13037568,
              "unexpected INT4 weight bank layout");
static_assert(INT4_MODEL_WORDS_PER_DDR == 13043328,
              "unexpected complete per-DDR model image size");

inline int4_weight_scale_word_t* int4_model_scale_base(
    int4_weight_word_t* model_bank
) {
    return model_bank + INT4_MODEL_SCALE_BASE_WORD;
}

inline int4_output_word_t* int4_model_norm_base(
    int4_weight_word_t* model_bank
) {
    return model_bank + INT4_MODEL_NORM_BASE_WORD;
}

inline int4_weight_word_t* int4_model_weight_base(
    int4_weight_word_t* model_bank
) {
    return model_bank + INT4_MODEL_WEIGHT_BASE_WORD;
}

inline const int4_weight_scale_word_t* int4_model_scale_base(
    const int4_weight_word_t* model_bank
) {
    return model_bank + INT4_MODEL_SCALE_BASE_WORD;
}

inline const int4_output_word_t* int4_model_norm_base(
    const int4_weight_word_t* model_bank
) {
    return model_bank + INT4_MODEL_NORM_BASE_WORD;
}

inline const int4_weight_word_t* int4_model_weight_base(
    const int4_weight_word_t* model_bank
) {
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
