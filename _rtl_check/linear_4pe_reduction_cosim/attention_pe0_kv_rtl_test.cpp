#define SWIFTKV_COSIM_SHORT_SEQUENCE
#define SWIFTKV_COSIM_LAYER_DEPTH
#include "swiftkv_attention.cpp"

extern "C" void attn0kv(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t kv_cache[SWIFTKV_KV_AXI_DEPTH],
    const int4_output_word_t rope_lut[SWIFTKV_ROPE_DDR_WORDS],
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<12> position) {
#pragma HLS INTERFACE m_axi port=q bundle=gmem_q depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=k bundle=gmem_k depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=v bundle=gmem_v depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=kv_cache bundle=gmem_kv depth=SWIFTKV_KV_AXI_DEPTH
#pragma HLS INTERFACE m_axi port=rope_lut bundle=gmem_rope depth=SWIFTKV_ROPE_DDR_WORDS
#pragma HLS INTERFACE m_axi port=activation_q bundle=gmem_aq depth=INT4_MAX_LOCAL_GROUPS
#pragma HLS INTERFACE m_axi port=activation_scale bundle=gmem_as depth=INT4_MAX_LOCAL_GROUPS
#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    int4_swiftkv_attention_pe0(
        q, k, v, kv_cache, rope_lut,
        activation_q, activation_scale,
        (ap_uint<6>)0, position);
}
