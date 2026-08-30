#pragma once

#include "int4_decoder_blocks.hpp"

static constexpr int SWIFTKV_HEADS = 32;
static constexpr int SWIFTKV_HEAD_SIZE = 128;
static constexpr int SWIFTKV_LOCAL_HEADS =
    SWIFTKV_HEADS / INT4_PE_COUNT;
static constexpr int SWIFTKV_WORDS_PER_HEAD =
    SWIFTKV_HEAD_SIZE / INT4_OUTPUTS_PER_WORD;
static constexpr int SWIFTKV_KV_CACHE_BITS = 8;
static constexpr int SWIFTKV_KV_GROUP_SIZE = 32;
static constexpr int SWIFTKV_KV_GROUPS_PER_HEAD =
    SWIFTKV_HEAD_SIZE / SWIFTKV_KV_GROUP_SIZE;
static constexpr int SWIFTKV_KV_VALUES_PER_WORD =
    512 / SWIFTKV_KV_CACHE_BITS;
static constexpr int SWIFTKV_KV_DATA_WORDS_PER_VECTOR =
    SWIFTKV_HEAD_SIZE / SWIFTKV_KV_VALUES_PER_WORD;
static constexpr int SWIFTKV_KV_SCALE_SHIFT_BITS = 5;
static constexpr int SWIFTKV_KV_METADATA_WORDS = 1;
static constexpr int SWIFTKV_KV_WORDS_PER_TOKEN_HEAD =
    SWIFTKV_KV_METADATA_WORDS +
    2 * SWIFTKV_KV_DATA_WORDS_PER_VECTOR;
static constexpr int SWIFTKV_EXPANDED_KV_WORDS_PER_TOKEN_HEAD =
    2 * SWIFTKV_WORDS_PER_HEAD;
#ifdef SWIFTKV_COSIM_SHORT_SEQUENCE
static constexpr int SWIFTKV_MAX_SEQ_LEN = 3;
#else
static constexpr int SWIFTKV_MAX_SEQ_LEN = 4096;
#endif
static constexpr int SWIFTKV_KV_WORDS_PER_HEAD =
    SWIFTKV_MAX_SEQ_LEN * SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
static constexpr int SWIFTKV_KV_WORDS_PER_LAYER_BANK =
    SWIFTKV_LOCAL_HEADS * SWIFTKV_KV_WORDS_PER_HEAD;
static constexpr int SWIFTKV_KV_WORDS_PER_BANK =
    INT4_NUM_LAYERS * SWIFTKV_KV_WORDS_PER_LAYER_BANK;
// All compressed K/V records reside in the PE-local external DDR bank.  The
// current token is also forwarded directly into the online-attention stream,
// so a token is written once but is not read back or counted twice in the
// same invocation.  This DDR-only policy avoids replicating a full-model hot
// prefix cache in URAM beside each of the four independent PE datapaths.
static constexpr int SWIFTKV_KV_TILE_TOKENS = 32;
static constexpr int SWIFTKV_KV_TILE_WORDS =
    SWIFTKV_KV_TILE_TOKENS * SWIFTKV_KV_WORDS_PER_TOKEN_HEAD;
#ifdef SWIFTKV_COSIM_LAYER_DEPTH
// RTL co-simulation only exercises layer zero.  Keeping the interface depth
// to one layer prevents the HLS wrapper from allocating four full-model
// (multi-gigabyte) host buffers.  Production builds retain the full depth.
static constexpr int SWIFTKV_KV_AXI_DEPTH =
    SWIFTKV_KV_WORDS_PER_LAYER_BANK;
#else
static constexpr int SWIFTKV_KV_AXI_DEPTH =
    SWIFTKV_KV_WORDS_PER_BANK;
#endif
static constexpr int SWIFTKV_ROPE_PAIRS =
    SWIFTKV_HEAD_SIZE / 2;
static constexpr int SWIFTKV_ROPE_POSITIONS = 4096;
static constexpr int SWIFTKV_ROPE_PAIRS_PER_LUT_WORD = 16;
static constexpr int SWIFTKV_ROPE_LUT_WORDS_PER_POSITION =
    SWIFTKV_ROPE_PAIRS / SWIFTKV_ROPE_PAIRS_PER_LUT_WORD;
static constexpr int SWIFTKV_ROPE_BANKS =
    SWIFTKV_ROPE_LUT_WORDS_PER_POSITION;
static constexpr int SWIFTKV_ROPE_BANK_WORDS =
    SWIFTKV_ROPE_POSITIONS;
static constexpr int SWIFTKV_ROPE_LUT_WORDS =
    SWIFTKV_ROPE_POSITIONS * SWIFTKV_ROPE_LUT_WORDS_PER_POSITION;
static constexpr int SWIFTKV_ROPE_LUT_WORD_BITS =
    SWIFTKV_ROPE_PAIRS_PER_LUT_WORD * 2 * 19;
static constexpr int SWIFTKV_ROPE_LUT_BEAT_BITS = 2 * 19;
static constexpr int SWIFTKV_ROPE_LUT_BEATS_PER_WORD =
    SWIFTKV_ROPE_LUT_WORD_BITS / SWIFTKV_ROPE_LUT_BEAT_BITS;
static constexpr int SWIFTKV_ROPE_DDR_WORDS_PER_LUT_WORD = 2;
static constexpr int SWIFTKV_ROPE_DDR_WORDS =
    SWIFTKV_ROPE_LUT_WORDS *
    SWIFTKV_ROPE_DDR_WORDS_PER_LUT_WORD;

using swiftkv_rope_raw_t = ap_int<19>;
using swiftkv_rope_lut_word_t =
    ap_uint<SWIFTKV_ROPE_LUT_WORD_BITS>;
using swiftkv_rope_lut_beat_t =
    ap_uint<SWIFTKV_ROPE_LUT_BEAT_BITS>;

static_assert(
    SWIFTKV_ROPE_LUT_WORD_BITS ==
        SWIFTKV_ROPE_LUT_BEATS_PER_WORD * SWIFTKV_ROPE_LUT_BEAT_BITS,
    "RoPE LUT words must contain a whole number of cosine/sine beats");

static_assert(
    SWIFTKV_HEAD_SIZE == INT4_TILE_ROWS,
    "one Llama attention head must map to one row tile");
static_assert(
    SWIFTKV_HEADS % INT4_PE_COUNT == 0,
    "heads must be evenly time-multiplexed over four DDR engines");
static_assert(
    SWIFTKV_KV_WORDS_PER_TOKEN_HEAD == 5,
    "INT8/G32 KV record must be metadata,K0,K1,V0,V1");

// U250 mapping of SwiftKV:
//   - exact single-pass online (mu, Z, Y) recurrence;
//   - one (K,V) read per cached token, no score materialization;
//   - Q15.17 Q/K/V/score/exp boundary;
//   - base-2 5-bit LUT + linear interpolation exp;
//   - full 4096-position RoPE table preloaded by the controller into URAM;
//   - four DDR-aligned KV banks, each with its own independent arithmetic
//     engine so that PE0..PE3 can be placed locally in SLR0..SLR3.
//
// KV cache layout per DDR bank:
//   [layer][local_head][token][metadata, K0, K1, V0, V1].
//
// The attention result is fused with A15/G32 quantization for O projection.
void swiftkv_preload_rope_lut(
    const int4_output_word_t* rope_lut_ddr,
    swiftkv_rope_lut_word_t rope_lut_bank0[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank1[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank2[SWIFTKV_ROPE_BANK_WORDS],
    swiftkv_rope_lut_word_t rope_lut_bank3[SWIFTKV_ROPE_BANK_WORDS]
);

void swiftkv_load_rope_bank0(
    const swiftkv_rope_lut_word_t
        rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
);

void swiftkv_load_rope_bank1(
    const swiftkv_rope_lut_word_t
        rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
);

void swiftkv_load_rope_bank2(
    const swiftkv_rope_lut_word_t
        rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
);

void swiftkv_load_rope_bank3(
    const swiftkv_rope_lut_word_t
        rope_lut_bank[SWIFTKV_ROPE_BANK_WORDS],
    ap_uint<12> position,
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS]
);

// New local-ownership entry points.  Each PE consumes only its local Q/K/V
// shard, RoPE image and KV cache.  The 64 RoPE pairs for the current token are
// fetched from that PE's DDR inside the local hierarchy (eight 512-bit reads),
// so no table, address or wide control bus is broadcast between SLRs.
void int4_swiftkv_attention_pe0(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position);

void int4_swiftkv_attention_pe1(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position);

void int4_swiftkv_attention_pe2(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position);

void int4_swiftkv_attention_pe3(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache,
    const int4_output_word_t* rope_lut_ddr,
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    float activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer_index,
    ap_uint<12> position);

// Integrated dispatcher entry.  The global decoder controller terminates at
// the caller; SwiftKV receives only the registered layer/position command.
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
);
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
);

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
);
#endif

#ifdef SWIFTKV_LATENCY_VERIFY_TOP
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
);
#endif
