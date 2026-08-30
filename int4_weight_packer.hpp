#pragma once

#include "int4_model_layout.hpp"

// Host-side offline packer.  Destination arrays use the exact fixed offsets
// consumed by the controller.  Allocate INT4_MODEL_WORDS_PER_DDR words for
// each of the four physical DDR banks, then pass int4_model_scale_base(),
// int4_model_norm_base() and int4_model_weight_base() to the packing routines.
// Matrix data is row-major FP32.  Every bank receives all output rows but
// only its contiguous input-column shard.
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
    int4_weight_scale_word_t* scale_pe3
);

// Gamma is a global 4096-element FP32 vector.  PE n receives the contiguous
// 1024-value shard [n*1024, (n+1)*1024).
void int4_pack_norm_vector(
    const float* gamma,
    int layer,
    int norm_mode,
    int4_output_word_t* norm_pe0,
    int4_output_word_t* norm_pe1,
    int4_output_word_t* norm_pe2,
    int4_output_word_t* norm_pe3
);

// Pack the already-embedded token state into four contiguous local shards.
void int4_pack_input_residual(
    const float* input,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3
);

// Unpack an FP32 linear output (especially LOGITS) from contiguous shards.
// Q/K/V are raw Q15.17 and intentionally excluded from this FP32 helper.
void int4_unpack_fp32_linear_output(
    int mode,
    const int4_output_word_t* output_pe0,
    const int4_output_word_t* output_pe1,
    const int4_output_word_t* output_pe2,
    const int4_output_word_t* output_pe3,
    float* output
);

// Pack one local copy of the complete RoPE table.  Call this once for every
// PE/DDR rope buffer; no PE reads or forwards another SLR's table.
void int4_pack_rope_lut(
    int4_output_word_t* rope_lut_ddr
);
