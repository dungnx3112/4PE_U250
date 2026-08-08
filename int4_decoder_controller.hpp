#pragma once

#include "int4_model_layout.hpp"
#include "swiftkv_attention.hpp"

static constexpr int INT4_DECODER_MAX_STEPS =
    INT4_NUM_LAYERS * 8 + 1;
static_assert(
    INT4_DECODER_MAX_STEPS == 257,
    "controller tripcount must match 8 fused states/layer plus final RMS/logits");

// One hardware invocation performs the complete 32-layer decoder for one
// already-embedded token.  Only token position is input data; layer, block,
// matrix shape, offsets and successor selection are owned by Int4Controller.
void int4_decoder_token_controller(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    const int4_output_word_t* rope_lut_ddr,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    int4_output_word_t* logits_pe0,
    int4_output_word_t* logits_pe1,
    int4_output_word_t* logits_pe2,
    int4_output_word_t* logits_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3
);
