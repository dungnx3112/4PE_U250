#include "int4_decoder_controller.hpp"

// A single max-sized output scratchpad is the destination of the only linear
// call-site. Q/K/V and Gate are copied only because they must survive a later
// projection; O, Up, Down and Logits are consumed directly from the scratch.
static constexpr int INT4_PROJECTION_SCRATCH_WORDS =
    INT4_MAX_LOCAL_OUTPUT_WORDS;

typedef ap_uint<18> int4_attention_command_t;
typedef ap_uint<3> int4_projection_command_t;
typedef ap_uint<1> int4_controller_token_t;

static void int4_seed_controller_token_chain(
    hls::stream<int4_controller_token_t>& token_pe0,
    hls::stream<int4_controller_token_t>& token_01) {
#pragma HLS INLINE off
    token_pe0.write(1);
    token_01.write(1);
}

template <int PE_ID>
static void int4_relay_controller_token(
    hls::stream<int4_controller_token_t>& token_in,
    hls::stream<int4_controller_token_t>& token_local,
    hls::stream<int4_controller_token_t>& token_out) {
#pragma HLS INLINE off
    const int4_controller_token_t token = token_in.read();
    token_local.write(token);
    token_out.write(token);
}

static void int4_terminate_controller_token(
    hls::stream<int4_controller_token_t>& token_in,
    hls::stream<int4_controller_token_t>& token_pe3) {
#pragma HLS INLINE off
    token_pe3.write(token_in.read());
}

template <int PE_ID>
static void int4_preload_local_metadata(
    const int4_weight_word_t* model_bank,
    int4_weight_scale_word_t scale_cache[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_output_word_t norm_cache[INT4_TOTAL_NORM_WORDS_PER_PE]) {
#pragma HLS INLINE off
preload_local_scale_loop:
    for (int word = 0;
         word < INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1
        scale_cache[word] = model_bank[INT4_MODEL_SCALE_BASE_WORD + word];
    }
preload_local_norm_loop:
    for (int word = 0; word < INT4_TOTAL_NORM_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
        norm_cache[word] = model_bank[INT4_MODEL_NORM_BASE_WORD + word];
    }
}

template <int PE_ID>
static void int4_preload_local_metadata_commanded(
    const int4_weight_word_t* model_bank,
    int4_weight_scale_word_t scale_cache[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_output_word_t norm_cache[INT4_TOTAL_NORM_WORDS_PER_PE],
    hls::stream<int4_controller_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_preload_local_metadata<PE_ID>(
        model_bank, scale_cache, norm_cache);
}

static void int4_preload_all_metadata(
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    int4_weight_scale_word_t scale_cache0[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t scale_cache1[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t scale_cache2[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t scale_cache3[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_output_word_t norm_cache0[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t norm_cache1[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t norm_cache2[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t norm_cache3[INT4_TOTAL_NORM_WORDS_PER_PE]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_controller_token_t> token_pe0, token_pe1;
    hls::stream<int4_controller_token_t> token_pe2, token_pe3;
    hls::stream<int4_controller_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_controller_token_chain(token_pe0, token_01);
    int4_relay_controller_token<1>(token_01, token_pe1, token_12);
    int4_relay_controller_token<2>(token_12, token_pe2, token_23);
    int4_terminate_controller_token(token_23, token_pe3);
    int4_preload_local_metadata_commanded<0>(
        model_bank0, scale_cache0, norm_cache0, token_pe0);
    int4_preload_local_metadata_commanded<1>(
        model_bank1, scale_cache1, norm_cache1, token_pe1);
    int4_preload_local_metadata_commanded<2>(
        model_bank2, scale_cache2, norm_cache2, token_pe2);
    int4_preload_local_metadata_commanded<3>(
        model_bank3, scale_cache3, norm_cache3, token_pe3);
}

template <int PE_ID>
static void int4_load_local_residual(
    const int4_output_word_t* external_residual,
    int4_output_word_t local_residual[INT4_VECTOR_WORDS_PER_PE]) {
#pragma HLS INLINE off
load_local_residual_loop:
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
        local_residual[word] = external_residual[word];
    }
}

template <int PE_ID>
static void int4_load_local_residual_commanded(
    const int4_output_word_t* external_residual,
    int4_output_word_t local_residual[INT4_VECTOR_WORDS_PER_PE],
    hls::stream<int4_controller_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_load_local_residual<PE_ID>(external_residual, local_residual);
}

static void int4_load_all_residuals(
    const int4_output_word_t* residual_pe0,
    const int4_output_word_t* residual_pe1,
    const int4_output_word_t* residual_pe2,
    const int4_output_word_t* residual_pe3,
    int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_controller_token_t> token_pe0, token_pe1;
    hls::stream<int4_controller_token_t> token_pe2, token_pe3;
    hls::stream<int4_controller_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_controller_token_chain(token_pe0, token_01);
    int4_relay_controller_token<1>(token_01, token_pe1, token_12);
    int4_relay_controller_token<2>(token_12, token_pe2, token_23);
    int4_terminate_controller_token(token_23, token_pe3);
    int4_load_local_residual_commanded<0>(residual_pe0, residual0, token_pe0);
    int4_load_local_residual_commanded<1>(residual_pe1, residual1, token_pe1);
    int4_load_local_residual_commanded<2>(residual_pe2, residual2, token_pe2);
    int4_load_local_residual_commanded<3>(residual_pe3, residual3, token_pe3);
}

template <int PE_ID>
static void int4_store_local_residual(
    const int4_output_word_t local_residual[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* external_residual) {
#pragma HLS INLINE off
store_local_residual_loop:
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
        external_residual[word] = local_residual[word];
    }
}

template <int PE_ID>
static void int4_store_local_residual_commanded(
    const int4_output_word_t local_residual[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* external_residual,
    hls::stream<int4_controller_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_store_local_residual<PE_ID>(local_residual, external_residual);
}

static void int4_store_all_residuals(
    const int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_controller_token_t> token_pe0, token_pe1;
    hls::stream<int4_controller_token_t> token_pe2, token_pe3;
    hls::stream<int4_controller_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_controller_token_chain(token_pe0, token_01);
    int4_relay_controller_token<1>(token_01, token_pe1, token_12);
    int4_relay_controller_token<2>(token_12, token_pe2, token_23);
    int4_terminate_controller_token(token_23, token_pe3);
    int4_store_local_residual_commanded<0>(residual0, residual_pe0, token_pe0);
    int4_store_local_residual_commanded<1>(residual1, residual_pe1, token_pe1);
    int4_store_local_residual_commanded<2>(residual2, residual_pe2, token_pe2);
    int4_store_local_residual_commanded<3>(residual3, residual_pe3, token_pe3);
}

static void int4_seed_attention_command_chain(
    ap_uint<6> layer,
    ap_uint<12> position,
    hls::stream<int4_attention_command_t>& command_pe0,
    hls::stream<int4_attention_command_t>& command_01) {
#pragma HLS INLINE off
    int4_attention_command_t command = 0;
    command.range(5, 0) = layer;
    command.range(17, 6) = position;
    command_pe0.write(command);
    command_01.write(command);
}

template <int PE_ID>
static void int4_relay_attention_command(
    hls::stream<int4_attention_command_t>& command_in,
    hls::stream<int4_attention_command_t>& command_local,
    hls::stream<int4_attention_command_t>& command_out) {
#pragma HLS INLINE off
    const int4_attention_command_t command = command_in.read();
    command_local.write(command);
    command_out.write(command);
}

static void int4_terminate_attention_command(
    hls::stream<int4_attention_command_t>& command_in,
    hls::stream<int4_attention_command_t>& command_pe3) {
#pragma HLS INLINE off
    command_pe3.write(command_in.read());
}

#define INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER(PE)                 \
static void int4_run_local_attention_commanded_##PE(                   \
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],              \
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],              \
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],              \
    int4_output_word_t* kv_cache,                                      \
    const int4_output_word_t* rope_lut,                                \
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],             \
    float activation_scale[INT4_MAX_LOCAL_GROUPS],                     \
    hls::stream<int4_attention_command_t>& command_stream) {           \
    _Pragma("HLS INLINE off")                                          \
    const int4_attention_command_t command = command_stream.read();    \
    int4_swiftkv_attention_pe##PE(                                     \
        q, k, v, kv_cache, rope_lut,                                   \
        activation_q, activation_scale,                               \
        (ap_uint<6>)command.range(5, 0),                               \
        (ap_uint<12>)command.range(17, 6));                            \
}

INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER(0)
INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER(1)
INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER(2)
INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER(3)

#undef INT4_DEFINE_LOCAL_ATTENTION_COMMAND_WRAPPER

static void int4_run_local_attention_4pe(
    const int4_output_word_t q0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t q1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t q2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t q3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k3[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const int4_output_word_t* rope_lut_pe0,
    const int4_output_word_t* rope_lut_pe1,
    const int4_output_word_t* rope_lut_pe2,
    const int4_output_word_t* rope_lut_pe3,
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    float activation_scale3[INT4_MAX_LOCAL_GROUPS],
    ap_uint<6> layer,
    ap_uint<12> position) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_attention_command_t> command_pe0;
    hls::stream<int4_attention_command_t> command_pe1;
    hls::stream<int4_attention_command_t> command_pe2;
    hls::stream<int4_attention_command_t> command_pe3;
    hls::stream<int4_attention_command_t> command_01;
    hls::stream<int4_attention_command_t> command_12;
    hls::stream<int4_attention_command_t> command_23;
#pragma HLS STREAM variable=command_pe0 depth=2
#pragma HLS STREAM variable=command_pe1 depth=2
#pragma HLS STREAM variable=command_pe2 depth=2
#pragma HLS STREAM variable=command_pe3 depth=2
#pragma HLS STREAM variable=command_01 depth=2
#pragma HLS STREAM variable=command_12 depth=2
#pragma HLS STREAM variable=command_23 depth=2
#pragma HLS BIND_STORAGE variable=command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_23 type=fifo impl=srl

    int4_seed_attention_command_chain(
        layer, position, command_pe0, command_01);
    int4_relay_attention_command<1>(
        command_01, command_pe1, command_12);
    int4_relay_attention_command<2>(
        command_12, command_pe2, command_23);
    int4_terminate_attention_command(command_23, command_pe3);

    int4_run_local_attention_commanded_0(
        q0, k0, v0, kv_cache_pe0, rope_lut_pe0,
        activation_q0, activation_scale0, command_pe0);
    int4_run_local_attention_commanded_1(
        q1, k1, v1, kv_cache_pe1, rope_lut_pe1,
        activation_q1, activation_scale1, command_pe1);
    int4_run_local_attention_commanded_2(
        q2, k2, v2, kv_cache_pe2, rope_lut_pe2,
        activation_q2, activation_scale2, command_pe2);
    int4_run_local_attention_commanded_3(
        q3, k3, v3, kv_cache_pe3, rope_lut_pe3,
        activation_q3, activation_scale3, command_pe3);
}

template <int PE_ID>
static void int4_save_local_projection(
    const int4_output_word_t scratch[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t gate[INT4_HIDDEN_WORDS_PER_PE],
    ap_uint<3> mode) {
#pragma HLS INLINE off
    const int words = mode == INT4_LINEAR_GATE
        ? INT4_HIDDEN_WORDS_PER_PE
        : ((mode == INT4_LINEAR_Q || mode == INT4_LINEAR_K ||
            mode == INT4_LINEAR_V) ? INT4_VECTOR_WORDS_PER_PE : 0);
save_local_projection_loop:
    for (int word = 0; word < words; ++word) {
#pragma HLS PIPELINE II=1
        const int4_output_word_t value = scratch[word];
        if (mode == INT4_LINEAR_Q) q[word] = value;
        else if (mode == INT4_LINEAR_K) k[word] = value;
        else if (mode == INT4_LINEAR_V) v[word] = value;
        else gate[word] = value;
    }
}

static void int4_seed_projection_command_chain(
    ap_uint<3> mode,
    hls::stream<int4_projection_command_t>& command_pe0,
    hls::stream<int4_projection_command_t>& command_01) {
#pragma HLS INLINE off
    command_pe0.write(mode);
    command_01.write(mode);
}

template <int PE_ID>
static void int4_relay_projection_command(
    hls::stream<int4_projection_command_t>& command_in,
    hls::stream<int4_projection_command_t>& command_local,
    hls::stream<int4_projection_command_t>& command_out) {
#pragma HLS INLINE off
    const int4_projection_command_t command = command_in.read();
    command_local.write(command);
    command_out.write(command);
}

static void int4_terminate_projection_command(
    hls::stream<int4_projection_command_t>& command_in,
    hls::stream<int4_projection_command_t>& command_pe3) {
#pragma HLS INLINE off
    command_pe3.write(command_in.read());
}

template <int PE_ID>
static void int4_save_local_projection_commanded(
    const int4_output_word_t scratch[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t gate[INT4_HIDDEN_WORDS_PER_PE],
    hls::stream<int4_projection_command_t>& command_stream) {
#pragma HLS INLINE off
    int4_save_local_projection<PE_ID>(
        scratch, q, k, v, gate, command_stream.read());
}

static void int4_save_projection_4pe(
    const int4_output_word_t scratch0[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch1[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch2[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch3[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t q0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t q1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t q2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t q3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t k3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t v3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t gate0[INT4_HIDDEN_WORDS_PER_PE],
    int4_output_word_t gate1[INT4_HIDDEN_WORDS_PER_PE],
    int4_output_word_t gate2[INT4_HIDDEN_WORDS_PER_PE],
    int4_output_word_t gate3[INT4_HIDDEN_WORDS_PER_PE],
    ap_uint<3> mode) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_projection_command_t> command_pe0;
    hls::stream<int4_projection_command_t> command_pe1;
    hls::stream<int4_projection_command_t> command_pe2;
    hls::stream<int4_projection_command_t> command_pe3;
    hls::stream<int4_projection_command_t> command_01;
    hls::stream<int4_projection_command_t> command_12;
    hls::stream<int4_projection_command_t> command_23;
#pragma HLS STREAM variable=command_pe0 depth=2
#pragma HLS STREAM variable=command_pe1 depth=2
#pragma HLS STREAM variable=command_pe2 depth=2
#pragma HLS STREAM variable=command_pe3 depth=2
#pragma HLS STREAM variable=command_01 depth=2
#pragma HLS STREAM variable=command_12 depth=2
#pragma HLS STREAM variable=command_23 depth=2
#pragma HLS BIND_STORAGE variable=command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_23 type=fifo impl=srl

    int4_seed_projection_command_chain(mode, command_pe0, command_01);
    int4_relay_projection_command<1>(
        command_01, command_pe1, command_12);
    int4_relay_projection_command<2>(
        command_12, command_pe2, command_23);
    int4_terminate_projection_command(command_23, command_pe3);

    int4_save_local_projection_commanded<0>(
        scratch0, q0, k0, v0, gate0, command_pe0);
    int4_save_local_projection_commanded<1>(
        scratch1, q1, k1, v1, gate1, command_pe1);
    int4_save_local_projection_commanded<2>(
        scratch2, q2, k2, v2, gate2, command_pe2);
    int4_save_local_projection_commanded<3>(
        scratch3, q3, k3, v3, gate3, command_pe3);
}

template <int PE_ID>
static void int4_store_local_logits(
    const int4_output_word_t scratch[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t* logits) {
#pragma HLS INLINE off
store_local_logits_loop:
    for (int word = 0; word < INT4_LOGIT_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
        logits[word] = scratch[word];
    }
}

template <int PE_ID>
static void int4_store_local_logits_commanded(
    const int4_output_word_t scratch[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t* logits,
    hls::stream<int4_controller_token_t>& token_stream) {
#pragma HLS INLINE off
    (void)token_stream.read();
    int4_store_local_logits<PE_ID>(scratch, logits);
}

static void int4_store_logits_4pe(
    const int4_output_word_t scratch0[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch1[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch2[INT4_PROJECTION_SCRATCH_WORDS],
    const int4_output_word_t scratch3[INT4_PROJECTION_SCRATCH_WORDS],
    int4_output_word_t* logits0,
    int4_output_word_t* logits1,
    int4_output_word_t* logits2,
    int4_output_word_t* logits3) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_controller_token_t> token_pe0, token_pe1;
    hls::stream<int4_controller_token_t> token_pe2, token_pe3;
    hls::stream<int4_controller_token_t> token_01, token_12, token_23;
#pragma HLS STREAM variable=token_pe0 depth=2
#pragma HLS STREAM variable=token_pe1 depth=2
#pragma HLS STREAM variable=token_pe2 depth=2
#pragma HLS STREAM variable=token_pe3 depth=2
#pragma HLS STREAM variable=token_01 depth=2
#pragma HLS STREAM variable=token_12 depth=2
#pragma HLS STREAM variable=token_23 depth=2
#pragma HLS BIND_STORAGE variable=token_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=token_23 type=fifo impl=srl
    int4_seed_controller_token_chain(token_pe0, token_01);
    int4_relay_controller_token<1>(token_01, token_pe1, token_12);
    int4_relay_controller_token<2>(token_12, token_pe2, token_23);
    int4_terminate_controller_token(token_23, token_pe3);
    int4_store_local_logits_commanded<0>(scratch0, logits0, token_pe0);
    int4_store_local_logits_commanded<1>(scratch1, logits1, token_pe1);
    int4_store_local_logits_commanded<2>(scratch2, logits2, token_pe2);
    int4_store_local_logits_commanded<3>(scratch3, logits3, token_pe3);
}

void int4_decoder_token_controller(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    const int4_output_word_t* rope_lut_pe0,
    const int4_output_word_t* rope_lut_pe1,
    const int4_output_word_t* rope_lut_pe2,
    const int4_output_word_t* rope_lut_pe3,
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
    int4_output_word_t* kv_cache_pe3) {
#pragma HLS INTERFACE m_axi port=model_bank0 bundle=gmem0 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=256 num_read_outstanding=16
#pragma HLS INTERFACE m_axi port=rope_lut_pe0 bundle=gmem0 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe0 bundle=gmem0 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe0 bundle=gmem0 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank1 bundle=gmem1 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=256 num_read_outstanding=16
#pragma HLS INTERFACE m_axi port=rope_lut_pe1 bundle=gmem1 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe1 bundle=gmem1 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe1 bundle=gmem1 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank2 bundle=gmem2 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=256 num_read_outstanding=16
#pragma HLS INTERFACE m_axi port=rope_lut_pe2 bundle=gmem2 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe2 bundle=gmem2 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe2 bundle=gmem2 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank3 bundle=gmem3 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=256 num_read_outstanding=16
#pragma HLS INTERFACE m_axi port=rope_lut_pe3 bundle=gmem3 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe3 bundle=gmem3 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe3 bundle=gmem3 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=256 max_write_burst_length=64 num_read_outstanding=16 num_write_outstanding=2

#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank0 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank1 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank2 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank3 bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=residual_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=logits_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=logits_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=logits_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=logits_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe0 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe1 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe2 bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache_pe3 bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // All Q/K/V/O/Gate/Up/Down/Logits calls share one four-PE linear engine.
#pragma HLS ALLOCATION function instances=int4_sharded_linear_4pe limit=1

    static int4_weight_scale_word_t scale_cache0[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t scale_cache1[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t scale_cache2[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t scale_cache3[
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_output_word_t norm_cache0[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t norm_cache1[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t norm_cache2[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t norm_cache3[INT4_TOTAL_NORM_WORDS_PER_PE];

    int4_output_word_t residual0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t residual1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t residual2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t residual3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t projection0[INT4_PROJECTION_SCRATCH_WORDS];
    int4_output_word_t projection1[INT4_PROJECTION_SCRATCH_WORDS];
    int4_output_word_t projection2[INT4_PROJECTION_SCRATCH_WORDS];
    int4_output_word_t projection3[INT4_PROJECTION_SCRATCH_WORDS];
    int4_output_word_t q0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t gate0[INT4_HIDDEN_WORDS_PER_PE];
    int4_output_word_t gate1[INT4_HIDDEN_WORDS_PER_PE];
    int4_output_word_t gate2[INT4_HIDDEN_WORDS_PER_PE];
    int4_output_word_t gate3[INT4_HIDDEN_WORDS_PER_PE];
    int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS];
    int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS];
    int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS];
    int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS];
    float activation_scale0[INT4_MAX_LOCAL_GROUPS];
    float activation_scale1[INT4_MAX_LOCAL_GROUPS];
    float activation_scale2[INT4_MAX_LOCAL_GROUPS];
    float activation_scale3[INT4_MAX_LOCAL_GROUPS];

#pragma HLS BIND_STORAGE variable=scale_cache0 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=scale_cache1 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=scale_cache2 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=scale_cache3 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=norm_cache0 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=norm_cache1 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=norm_cache2 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=norm_cache3 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=residual0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=projection0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=projection1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=projection2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=projection3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=q0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=q1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=q2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=q3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=k0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=k1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=k2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=k3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=v0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=v1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=v2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=v3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=gate0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=gate1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=gate2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=gate3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_q0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_q1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_q2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_q3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale3 type=ram_2p impl=bram

    if (position == 0) {
        int4_preload_all_metadata(
            model_bank0, model_bank1, model_bank2, model_bank3,
            scale_cache0, scale_cache1, scale_cache2, scale_cache3,
            norm_cache0, norm_cache1, norm_cache2, norm_cache3);
    }
    int4_load_all_residuals(
        residual_pe0, residual_pe1, residual_pe2, residual_pe3,
        residual0, residual1, residual2, residual3);

    const int4_weight_word_t* weight0 =
        model_bank0 + INT4_MODEL_WEIGHT_BASE_WORD;
    const int4_weight_word_t* weight1 =
        model_bank1 + INT4_MODEL_WEIGHT_BASE_WORD;
    const int4_weight_word_t* weight2 =
        model_bank2 + INT4_MODEL_WEIGHT_BASE_WORD;
    const int4_weight_word_t* weight3 =
        model_bank3 + INT4_MODEL_WEIGHT_BASE_WORD;

projection_layer_loop:
    for (int schedule_layer = 0;
         schedule_layer <= INT4_NUM_LAYERS;
         ++schedule_layer) {
#pragma HLS LOOP_TRIPCOUNT min=33 max=33
        const bool logits_stage = schedule_layer == INT4_NUM_LAYERS;
        const int stage_count = logits_stage ? 1 : 7;
    projection_stage_loop:
        for (int stage = 0; stage < stage_count; ++stage) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=7
            const ap_uint<3> mode = logits_stage
                ? (ap_uint<3>)INT4_LINEAR_LOGITS
                : (ap_uint<3>)stage;
            const int layer = logits_stage ? 0 : schedule_layer;

            if (mode == INT4_LINEAR_Q) {
                const int norm_offset =
                    int4_norm_offset(layer, INT4_RMSNORM_ATTENTION);
                int4_rmsnorm_quantize_shards(
                    residual0, residual1, residual2, residual3,
                    norm_cache0 + norm_offset,
                    norm_cache1 + norm_offset,
                    norm_cache2 + norm_offset,
                    norm_cache3 + norm_offset,
                    activation_q0, activation_q1,
                    activation_q2, activation_q3,
                    activation_scale0, activation_scale1,
                    activation_scale2, activation_scale3);
            } else if (mode == INT4_LINEAR_O) {
                int4_run_local_attention_4pe(
                    q0, q1, q2, q3,
                    k0, k1, k2, k3,
                    v0, v1, v2, v3,
                    kv_cache_pe0, kv_cache_pe1,
                    kv_cache_pe2, kv_cache_pe3,
                    rope_lut_pe0, rope_lut_pe1,
                    rope_lut_pe2, rope_lut_pe3,
                    activation_q0, activation_q1,
                    activation_q2, activation_q3,
                    activation_scale0, activation_scale1,
                    activation_scale2, activation_scale3,
                    (ap_uint<6>)layer, position);
            } else if (mode == INT4_LINEAR_GATE) {
                const int norm_offset =
                    int4_norm_offset(layer, INT4_RMSNORM_FFN);
                int4_rmsnorm_quantize_shards(
                    residual0, residual1, residual2, residual3,
                    norm_cache0 + norm_offset,
                    norm_cache1 + norm_offset,
                    norm_cache2 + norm_offset,
                    norm_cache3 + norm_offset,
                    activation_q0, activation_q1,
                    activation_q2, activation_q3,
                    activation_scale0, activation_scale1,
                    activation_scale2, activation_scale3);
            } else if (mode == INT4_LINEAR_DOWN) {
                int4_swiglu_quantize_shards(
                    gate0, gate1, gate2, gate3,
                    projection0, projection1, projection2, projection3,
                    activation_q0, activation_q1,
                    activation_q2, activation_q3,
                    activation_scale0, activation_scale1,
                    activation_scale2, activation_scale3);
            } else if (mode == INT4_LINEAR_LOGITS) {
                const int norm_offset =
                    int4_norm_offset(0, INT4_RMSNORM_FINAL);
                int4_rmsnorm_quantize_shards(
                    residual0, residual1, residual2, residual3,
                    norm_cache0 + norm_offset,
                    norm_cache1 + norm_offset,
                    norm_cache2 + norm_offset,
                    norm_cache3 + norm_offset,
                    activation_q0, activation_q1,
                    activation_q2, activation_q3,
                    activation_scale0, activation_scale1,
                    activation_scale2, activation_scale3);
            }

            // This is intentionally the sole call-site in the complete token
            // schedule. Dynamic mode and offsets force one time-shared RTL
            // linear pipeline instead of eight constant-specialized clones.
            int4_sharded_linear_4pe(
                weight0, weight1, weight2, weight3,
                scale_cache0, scale_cache1, scale_cache2, scale_cache3,
                activation_q0, activation_q1,
                activation_q2, activation_q3,
                activation_scale0, activation_scale1,
                activation_scale2, activation_scale3,
                projection0, projection1, projection2, projection3,
                mode,
                (ap_uint<24>)int4_weight_offset(layer, (int)mode),
                (ap_uint<16>)int4_weight_scale_offset(layer, (int)mode));

            if (mode == INT4_LINEAR_Q || mode == INT4_LINEAR_K ||
                mode == INT4_LINEAR_V || mode == INT4_LINEAR_GATE) {
                int4_save_projection_4pe(
                    projection0, projection1, projection2, projection3,
                    q0, q1, q2, q3, k0, k1, k2, k3,
                    v0, v1, v2, v3, gate0, gate1, gate2, gate3,
                    mode);
            } else if (mode == INT4_LINEAR_O ||
                       mode == INT4_LINEAR_DOWN) {
                int4_residual_add_shards(
                    residual0, residual1, residual2, residual3,
                    projection0, projection1, projection2, projection3);
            } else if (mode == INT4_LINEAR_LOGITS) {
                int4_store_logits_4pe(
                    projection0, projection1, projection2, projection3,
                    logits_pe0, logits_pe1, logits_pe2, logits_pe3);
            }
        }
    }

    int4_store_all_residuals(
        residual0, residual1, residual2, residual3,
        residual_pe0, residual_pe1, residual_pe2, residual_pe3);
}
