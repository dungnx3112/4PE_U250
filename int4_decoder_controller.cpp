#include "int4_decoder_controller.hpp"
#include "int4_decoder_blocks.hpp"
#include "int4_decoder_schedule.hpp"
#include "int4_task_control.hpp"

static constexpr int INT4_PROJECTION_SCRATCH_WORDS =
    INT4_MAX_LOCAL_OUTPUT_WORDS;
using int4_position_command_t = ap_uint<12>;

static void int4_seed_position_chain(
    ap_uint<12> position,
    hls::stream<int4_position_command_t>& position_pe0,
    hls::stream<int4_position_command_t>& position_01) {
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1
    position_pe0.write(position);
    position_01.write(position);
}

template <int PE_ID>
static void int4_relay_position(
    hls::stream<int4_position_command_t>& position_in,
    hls::stream<int4_position_command_t>& position_local,
    hls::stream<int4_position_command_t>& position_out) {
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1
    const int4_position_command_t position = position_in.read();
    position_local.write(position);
    position_out.write(position);
}

static void int4_terminate_position_chain(
    hls::stream<int4_position_command_t>& position_in,
    hls::stream<int4_position_command_t>& position_pe3) {
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1
    position_pe3.write(position_in.read());
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
        : INT4_VECTOR_WORDS_PER_PE;
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

// Four copies of this local scheduler are synthesized. Each copy owns its
// local memories, address generation, AXI requesters and mode/state registers.
#define INT4_DEFINE_LOCAL_DECODER_PE(                                  \
    PE, RMS_STAGE, LINEAR_STAGE, ATTENTION_STAGE,                      \
    SWIGLU_STAGE, RESIDUAL_ADD)                                        \
static void int4_decoder_local_pe_##PE(                                \
    const int4_weight_word_t* model_bank,                              \
    const int4_output_word_t* rope_lut,                                \
    int4_output_word_t* external_residual,                            \
    int4_output_word_t* logits,                                       \
    int4_output_word_t* kv_cache,                                     \
    hls::stream<int4_position_command_t>& position_stream,            \
    hls::stream<float>& rms_partial,                                  \
    hls::stream<float>& rms_reciprocal,                               \
    hls::stream<int4_reduction_packet_t>& linear_partial,             \
    hls::stream<int4_reduction_packet_t>& linear_completed,           \
    hls::stream<int4_completion_token_t>& completion_stream) {        \
    _Pragma("HLS INLINE off")                                         \
    static int4_weight_scale_word_t scale_cache[                       \
        INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];                         \
    static int4_output_word_t norm_cache[                              \
        INT4_TOTAL_NORM_WORDS_PER_PE];                                 \
    int4_output_word_t residual[INT4_VECTOR_WORDS_PER_PE];            \
    int4_output_word_t projection[INT4_PROJECTION_SCRATCH_WORDS];     \
    int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE];                   \
    int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE];                   \
    int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE];                   \
    int4_output_word_t gate[INT4_HIDDEN_WORDS_PER_PE];                \
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS];            \
    float activation_scale[INT4_MAX_LOCAL_GROUPS];                    \
    _Pragma("HLS BIND_STORAGE variable=scale_cache type=ram_2p impl=uram") \
    _Pragma("HLS BIND_STORAGE variable=norm_cache type=ram_2p impl=uram") \
    _Pragma("HLS BIND_STORAGE variable=residual type=ram_2p impl=bram") \
    _Pragma("HLS BIND_STORAGE variable=projection type=ram_2p impl=bram") \
    _Pragma("HLS BIND_STORAGE variable=q type=ram_2p impl=bram")       \
    _Pragma("HLS BIND_STORAGE variable=k type=ram_2p impl=bram")       \
    _Pragma("HLS BIND_STORAGE variable=v type=ram_2p impl=bram")       \
    _Pragma("HLS BIND_STORAGE variable=gate type=ram_2p impl=bram")    \
    _Pragma("HLS BIND_STORAGE variable=activation_q type=ram_2p impl=bram") \
    _Pragma("HLS BIND_STORAGE variable=activation_scale type=ram_2p impl=bram") \
    const ap_uint<12> local_position = position_stream.read();         \
    if (local_position == 0) {                                        \
        int4_preload_local_metadata<PE>(                              \
            model_bank, scale_cache, norm_cache);                     \
    }                                                                 \
    int4_load_local_residual<PE>(external_residual, residual);        \
    const int4_weight_word_t* weight_mem =                            \
        model_bank + INT4_MODEL_WEIGHT_BASE_WORD;                     \
local_projection_layer_loop_##PE:                                     \
    for (int schedule_layer = 0;                                     \
         schedule_layer < INT4_DECODER_SCHEDULE_LAYERS;               \
         ++schedule_layer) {                                          \
        _Pragma("HLS LOOP_FLATTEN off")                               \
        _Pragma("HLS LOOP_TRIPCOUNT min=33 max=33")                   \
        const int stage_count =                                      \
            int4_decoder_stage_count(schedule_layer);                 \
    local_projection_stage_loop_##PE:                                 \
        for (int stage = 0; stage < stage_count; ++stage) {           \
            _Pragma("HLS LOOP_TRIPCOUNT min=1 max=7")                 \
            const ap_uint<3> mode = int4_decoder_stage_mode(          \
                schedule_layer, stage);                               \
            const int layer =                                        \
                int4_decoder_model_layer(schedule_layer);             \
            if (mode == INT4_LINEAR_Q ||                              \
                mode == INT4_LINEAR_GATE ||                           \
                mode == INT4_LINEAR_LOGITS) {                         \
                const int norm_mode = mode == INT4_LINEAR_Q           \
                    ? INT4_RMSNORM_ATTENTION                          \
                    : (mode == INT4_LINEAR_GATE                       \
                        ? INT4_RMSNORM_FFN                            \
                        : INT4_RMSNORM_FINAL);                        \
                RMS_STAGE(                                            \
                    residual, norm_cache,                             \
                    activation_q, activation_scale,                   \
                    int4_norm_offset(layer, norm_mode),               \
                    rms_partial, rms_reciprocal);                     \
            } else if (mode == INT4_LINEAR_O) {                       \
                ATTENTION_STAGE(                                      \
                    q, k, v, kv_cache, rope_lut,                      \
                    activation_q, activation_scale,                   \
                    (ap_uint<6>)layer, local_position);                \
            } else if (mode == INT4_LINEAR_DOWN) {                    \
                SWIGLU_STAGE(                                         \
                    gate, projection,                                \
                    activation_q, activation_scale);                  \
            }                                                         \
            LINEAR_STAGE(                                             \
                weight_mem, scale_cache,                              \
                activation_q, activation_scale, projection,           \
                mode,                                                 \
                (ap_uint<24>)int4_weight_offset(layer, (int)mode),    \
                (ap_uint<16>)int4_weight_scale_offset(                \
                    layer, (int)mode),                                \
                linear_partial, linear_completed);                    \
            if (mode == INT4_LINEAR_Q || mode == INT4_LINEAR_K ||    \
                mode == INT4_LINEAR_V ||                              \
                mode == INT4_LINEAR_GATE) {                           \
                int4_save_local_projection<PE>(                       \
                    projection, q, k, v, gate, mode);                 \
            } else if (mode == INT4_LINEAR_O ||                       \
                       mode == INT4_LINEAR_DOWN) {                    \
                RESIDUAL_ADD(residual, projection);                   \
            } else {                                                  \
                int4_store_local_logits<PE>(projection, logits);      \
            }                                                         \
        }                                                             \
    }                                                                 \
    int4_store_local_residual<PE>(residual, external_residual);       \
    completion_stream.write(1);                                       \
}

INT4_DEFINE_LOCAL_DECODER_PE(
    0, int4_local_rms_stage_pe0, int4_linear_local_stage_pe0,
    int4_swiftkv_attention_pe0, int4_local_swiglu_stage_pe0,
    int4_local_residual_add_pe0)
INT4_DEFINE_LOCAL_DECODER_PE(
    1, int4_local_rms_stage_pe1, int4_linear_local_stage_pe1,
    int4_swiftkv_attention_pe1, int4_local_swiglu_stage_pe1,
    int4_local_residual_add_pe1)
INT4_DEFINE_LOCAL_DECODER_PE(
    2, int4_local_rms_stage_pe2, int4_linear_local_stage_pe2,
    int4_swiftkv_attention_pe2, int4_local_swiglu_stage_pe2,
    int4_local_residual_add_pe2)
INT4_DEFINE_LOCAL_DECODER_PE(
    3, int4_local_rms_stage_pe3, int4_linear_local_stage_pe3,
    int4_swiftkv_attention_pe3, int4_local_swiglu_stage_pe3,
    int4_local_residual_add_pe3)

#undef INT4_DEFINE_LOCAL_DECODER_PE

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
#pragma HLS INTERFACE m_axi port=model_bank0 bundle=gmem0 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=64 num_read_outstanding=4
#pragma HLS INTERFACE m_axi port=rope_lut_pe0 bundle=gmem0 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe0 bundle=gmem0 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe0 bundle=gmem0 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank1 bundle=gmem1 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=64 num_read_outstanding=4
#pragma HLS INTERFACE m_axi port=rope_lut_pe1 bundle=gmem1 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe1 bundle=gmem1 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe1 bundle=gmem1 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank2 bundle=gmem2 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=64 num_read_outstanding=4
#pragma HLS INTERFACE m_axi port=rope_lut_pe2 bundle=gmem2 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe2 bundle=gmem2 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe2 bundle=gmem2 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=model_bank3 bundle=gmem3 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=64 max_read_burst_length=64 num_read_outstanding=4
#pragma HLS INTERFACE m_axi port=rope_lut_pe3 bundle=gmem3 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe3 bundle=gmem3 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits_pe3 bundle=gmem3 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=64 max_read_burst_length=64 max_write_burst_length=64 num_read_outstanding=4 num_write_outstanding=2

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

#pragma HLS DATAFLOW disable_start_propagation
    // AXI base addresses do not change during one kernel invocation. Marking
    // them stable lets the four ap_ctrl_none local-controller tasks own their
    // non-FIFO memory ports while all transaction ordering remains explicit in
    // the FIFO graph. Vitis HLS 2023.2 emits one 20-input entry gate for these
    // values; patch_partitioned_entry_proc.tcl replaces only that generated
    // gate with four atomic five-address PE launchers before RTL use/export.
#pragma HLS STABLE variable=model_bank0
#pragma HLS STABLE variable=model_bank1
#pragma HLS STABLE variable=model_bank2
#pragma HLS STABLE variable=model_bank3
#pragma HLS STABLE variable=rope_lut_pe0
#pragma HLS STABLE variable=rope_lut_pe1
#pragma HLS STABLE variable=rope_lut_pe2
#pragma HLS STABLE variable=rope_lut_pe3
#pragma HLS STABLE variable=residual_pe0
#pragma HLS STABLE variable=residual_pe1
#pragma HLS STABLE variable=residual_pe2
#pragma HLS STABLE variable=residual_pe3
#pragma HLS STABLE variable=logits_pe0
#pragma HLS STABLE variable=logits_pe1
#pragma HLS STABLE variable=logits_pe2
#pragma HLS STABLE variable=logits_pe3
#pragma HLS STABLE variable=kv_cache_pe0
#pragma HLS STABLE variable=kv_cache_pe1
#pragma HLS STABLE variable=kv_cache_pe2
#pragma HLS STABLE variable=kv_cache_pe3

    HLS_TASK_STREAM<int4_position_command_t> position_pe0, position_pe1;
    HLS_TASK_STREAM<int4_position_command_t> position_pe2, position_pe3;
    HLS_TASK_STREAM<int4_position_command_t> position_01, position_12;
    HLS_TASK_STREAM<int4_position_command_t> position_23;
    HLS_TASK_STREAM<float> rms_partial0, rms_partial1;
    HLS_TASK_STREAM<float> rms_partial2, rms_partial3;
    HLS_TASK_STREAM<float> rms_reciprocal0, rms_reciprocal1;
    HLS_TASK_STREAM<float> rms_reciprocal2, rms_reciprocal3;
    HLS_TASK_STREAM<float> rms_sum23_to01, rms_reciprocal01_to23;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial1;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial2;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial3;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum01_local;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum01_to23;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum23_local;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum23_to01;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output1;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output2;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output3;
    HLS_TASK_STREAM<int4_completion_token_t> completion0, completion1;
    HLS_TASK_STREAM<int4_completion_token_t> completion2, completion3;
    HLS_TASK_STREAM<int4_completion_token_t> completion01, completion23;

#pragma HLS STREAM variable=position_pe0 depth=2
#pragma HLS STREAM variable=position_pe1 depth=2
#pragma HLS STREAM variable=position_pe2 depth=2
#pragma HLS STREAM variable=position_pe3 depth=2
#pragma HLS STREAM variable=position_01 depth=2
#pragma HLS STREAM variable=position_12 depth=2
#pragma HLS STREAM variable=position_23 depth=2
#pragma HLS BIND_STORAGE variable=position_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=position_23 type=fifo impl=srl
#pragma HLS STREAM variable=rms_partial0 depth=4
#pragma HLS STREAM variable=rms_partial1 depth=4
#pragma HLS STREAM variable=rms_partial2 depth=4
#pragma HLS STREAM variable=rms_partial3 depth=4
#pragma HLS STREAM variable=rms_reciprocal0 depth=2
#pragma HLS STREAM variable=rms_reciprocal1 depth=2
#pragma HLS STREAM variable=rms_reciprocal2 depth=2
#pragma HLS STREAM variable=rms_reciprocal3 depth=2
#pragma HLS STREAM variable=rms_sum23_to01 depth=4
#pragma HLS STREAM variable=rms_reciprocal01_to23 depth=4
#pragma HLS STREAM variable=linear_partial0 depth=8
#pragma HLS STREAM variable=linear_partial1 depth=8
#pragma HLS STREAM variable=linear_partial2 depth=8
#pragma HLS STREAM variable=linear_partial3 depth=8
#pragma HLS STREAM variable=linear_sum01_local depth=16
#pragma HLS STREAM variable=linear_sum01_to23 depth=16
#pragma HLS STREAM variable=linear_sum23_local depth=16
#pragma HLS STREAM variable=linear_sum23_to01 depth=16
#pragma HLS STREAM variable=linear_output0 depth=32
#pragma HLS STREAM variable=linear_output1 depth=32
#pragma HLS STREAM variable=linear_output2 depth=32
#pragma HLS STREAM variable=linear_output3 depth=32
#pragma HLS BIND_STORAGE variable=linear_sum01_to23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_sum23_to01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_output0 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_output3 type=fifo impl=bram
#pragma HLS STREAM variable=completion0 depth=4
#pragma HLS STREAM variable=completion1 depth=4
#pragma HLS STREAM variable=completion2 depth=4
#pragma HLS STREAM variable=completion3 depth=4
#pragma HLS STREAM variable=completion01 depth=4
#pragma HLS STREAM variable=completion23 depth=4

    int4_seed_position_chain(position, position_pe0, position_01);
    HLS_TASK relay_position1(int4_relay_position<1>,
        position_01, position_pe1, position_12);
    HLS_TASK relay_position2(int4_relay_position<2>,
        position_12, position_pe2, position_23);
    HLS_TASK terminate_position(int4_terminate_position_chain,
        position_23, position_pe3);
    HLS_TASK local_pe0(int4_decoder_local_pe_0,
        model_bank0, rope_lut_pe0, residual_pe0, logits_pe0, kv_cache_pe0,
        position_pe0, rms_partial0, rms_reciprocal0,
        linear_partial0, linear_output0, completion0);
    HLS_TASK local_pe1(int4_decoder_local_pe_1,
        model_bank1, rope_lut_pe1, residual_pe1, logits_pe1, kv_cache_pe1,
        position_pe1, rms_partial1, rms_reciprocal1,
        linear_partial1, linear_output1, completion1);
    HLS_TASK local_pe2(int4_decoder_local_pe_2,
        model_bank2, rope_lut_pe2, residual_pe2, logits_pe2, kv_cache_pe2,
        position_pe2, rms_partial2, rms_reciprocal2,
        linear_partial2, linear_output2, completion2);
    HLS_TASK local_pe3(int4_decoder_local_pe_3,
        model_bank3, rope_lut_pe3, residual_pe3, logits_pe3, kv_cache_pe3,
        position_pe3, rms_partial3, rms_reciprocal3,
        linear_partial3, linear_output3, completion3);
    HLS_TASK rms_pair01(int4_rms_pair01_schedule,
        rms_partial0, rms_partial1, rms_sum23_to01,
        rms_reciprocal0, rms_reciprocal1, rms_reciprocal01_to23);
    HLS_TASK rms_pair23(int4_rms_pair23_schedule,
        rms_partial2, rms_partial3, rms_sum23_to01,
        rms_reciprocal01_to23, rms_reciprocal2, rms_reciprocal3);
    HLS_TASK reduce_pair01(int4_linear_reduce_pair01_schedule,
        linear_partial0, linear_partial1,
        linear_sum01_local, linear_sum01_to23);
    HLS_TASK reduce_pair23(int4_linear_reduce_pair23_schedule,
        linear_partial2, linear_partial3,
        linear_sum23_local, linear_sum23_to01);
    HLS_TASK finalize_pair01(int4_linear_finalize_pair01_schedule,
        linear_sum01_local, linear_sum23_to01,
        linear_output0, linear_output1);
    HLS_TASK finalize_pair23(int4_linear_finalize_pair23_schedule,
        linear_sum23_local, linear_sum01_to23,
        linear_output2, linear_output3);
    HLS_TASK join01(int4_join_task_completion_pair<300>,
        completion0, completion1, completion01);
    HLS_TASK join23(int4_join_task_completion_pair<301>,
        completion2, completion3, completion23);
    int4_wait_task_completion_pairs<300>(completion01, completion23);
}
