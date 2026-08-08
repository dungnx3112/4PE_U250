#pragma once

#include "int4_model_layout.hpp"

// Host-side offline packer.  Destination arrays use the exact fixed offsets
// consumed by the controller.  Allocate INT4_MODEL_WORDS_PER_DDR words for
// each of the four physical DDR banks, then pass int4_model_scale_base(),
// int4_model_norm_base() and int4_model_weight_base() to the packing routines.
// The kernel itself receives only the four model-bank base pointers.
// Matrix data is row-major FP32.
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

// Gamma is a global 4096-element FP32 vector.  It is packed into the same
// row-striped bank order as residual/linear output.
void int4_pack_norm_vector(
    const float* gamma,
    int layer,
    int norm_mode,
    int4_output_word_t* norm_pe0,
    int4_output_word_t* norm_pe1,
    int4_output_word_t* norm_pe2,
    int4_output_word_t* norm_pe3
);

// Pack the already-embedded 4096-element token state into the row-striped
// residual buffers consumed by int4_decoder_token_controller.
void int4_pack_input_residual(
    const float* input,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3
);

// Unpack an FP32 linear output (especially LOGITS) from row-striped banks.
// Q/K/V are raw Q15.17 and intentionally excluded from this FP32 helper.
void int4_unpack_fp32_linear_output(
    int mode,
    const int4_output_word_t* output_pe0,
    const int4_output_word_t* output_pe1,
    const int4_output_word_t* output_pe2,
    const int4_output_word_t* output_pe3,
    float* output
);

// Pack the complete Llama-2 RoPE table offline.  Allocate
// SWIFTKV_ROPE_DDR_WORDS 512-bit words.  Each 608-bit table row is stored in
// two sequential words so the controller can issue a single long DDR0 read
// when position zero starts a new sequence.
void int4_pack_rope_lut(
    int4_output_word_t* rope_lut_ddr
);
