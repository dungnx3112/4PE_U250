#pragma once

#include "int4_linear_controller.hpp"

#include <ap_fixed.h>

using int4_fxp32_t = ap_fixed<32, 15, AP_RND_CONV, AP_SAT>;

static constexpr int INT4_GROUPS_PER_VECTOR = INT4_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_VECTOR_SCALE_WORDS =
    INT4_GROUPS_PER_VECTOR / INT4_SCALE_ROWS_PER_WORD;
static constexpr int INT4_HIDDEN_GROUPS =
    INT4_HIDDEN_DIM / INT4_GROUP_SIZE;
static constexpr int INT4_HIDDEN_SCALE_WORDS =
    (INT4_HIDDEN_GROUPS + INT4_SCALE_ROWS_PER_WORD - 1) /
    INT4_SCALE_ROWS_PER_WORD;

// The only cross-SLR operation in RMSNorm is a four-float sum followed by a
// 32-bit reciprocal broadcast through registered neighbour FIFOs.
void int4_rmsnorm_quantize_shards(
    const int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t gamma3[INT4_VECTOR_WORDS_PER_PE],
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    float activation_scale3[INT4_MAX_LOCAL_GROUPS]
);

// Local-only elementwise blocks. No data or control signal from one PE
// addresses a memory or arithmetic module in another PE.
void int4_residual_add_shards(
    int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t branch3[INT4_VECTOR_WORDS_PER_PE]
);

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
    float activation_scale3[INT4_MAX_LOCAL_GROUPS]
);
