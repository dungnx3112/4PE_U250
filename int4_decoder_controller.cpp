#include "int4_decoder_controller.hpp"

enum Int4PreprocessMode {
    INT4_PREPROCESS_NONE = 0,
    INT4_PREPROCESS_RMS = 1,
    INT4_PREPROCESS_ATTENTION = 2,
    INT4_PREPROCESS_SWIGLU = 3
};

static void int4_preprocess_activation_stream(
    int preprocess_mode,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    hls::stream<int4_quant_word_t>& quantized_stream,
    hls::stream<float>& scale_stream
) {
#pragma HLS INLINE off
    if (preprocess_mode == INT4_PREPROCESS_RMS) {
        int4_rmsnorm_quantize_stream_4pe(
            rms_input_pe0, rms_input_pe1,
            rms_input_pe2, rms_input_pe3,
            gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
            true, quantized_stream, scale_stream);
    } else if (preprocess_mode == INT4_PREPROCESS_SWIGLU) {
        int4_swiglu_quantize_stream_4pe(
            gate_pe0, gate_pe1, gate_pe2, gate_pe3,
            up_pe0, up_pe1, up_pe2, up_pe3,
            true, quantized_stream, scale_stream);
    }
}

static void int4_run_preprocess_and_linear(
    const int4_weight_word_t* weight_bank0,
    const int4_weight_word_t* weight_bank1,
    const int4_weight_word_t* weight_bank2,
    const int4_weight_word_t* weight_bank3,
    const int4_weight_scale_word_t* scale_bank0,
    const int4_weight_scale_word_t* scale_bank1,
    const int4_weight_scale_word_t* scale_bank2,
    const int4_weight_scale_word_t* scale_bank3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    const int4_output_word_t* gate_pe0,
    const int4_output_word_t* gate_pe1,
    const int4_output_word_t* gate_pe2,
    const int4_output_word_t* gate_pe3,
    const int4_output_word_t* up_pe0,
    const int4_output_word_t* up_pe1,
    const int4_output_word_t* up_pe2,
    const int4_output_word_t* up_pe3,
    int preprocess_mode,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    Int4Controller& controller
) {
#pragma HLS INLINE off
    // This is an explicit producer/FIFO/consumer architecture.  Do not let
    // HLS synthesize a combinational ap_start/ap_ready propagation chain
    // across the nested SwiGLU engines and the outer controller FSM.
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_stream;
    hls::stream<float> scale_stream;
#pragma HLS STREAM variable=quantized_stream depth=4
#pragma HLS STREAM variable=scale_stream depth=4
    // The 480-bit producer/consumer boundary must not become a distributed
    // SRL.  Post-route timing showed scale_pe1.empty_n driving hundreds of
    // SRL CE bits across SLRs (5.189 ns data delay, 90.7% routing).  A BRAM
    // FIFO gives the wide payload a local registered memory boundary while
    // preserving the stream protocol and one-word/cycle throughput.
#pragma HLS BIND_STORAGE variable=quantized_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_stream type=fifo impl=srl

    int4_preprocess_activation_stream(
        preprocess_mode,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        quantized_stream, scale_stream);
    int4_linear_4pe_from_stream(
        weight_bank0, weight_bank1,
        weight_bank2, weight_bank3,
        scale_bank0, scale_bank1,
        scale_bank2, scale_bank3,
        activation_q, activation_scale,
        quantized_stream, scale_stream,
        preprocess_mode != INT4_PREPROCESS_NONE,
        output_pe0, output_pe1, output_pe2, output_pe3,
        controller);
}

using int4_dispatch_command_t = ap_uint<2>;

// Select the projection before entering the wide copy loop.  Keeping the
// seven possible destinations inside one pipelined switch made one FSM state
// drive more than 12k RAM-port loads.  ROUTE_ID gives every projection a
// distinct HLS module with only four active destination memories.
template <int ROUTE_ID>
static void int4_route_linear_projection(
    const int4_output_word_t* linear_stage0,
    const int4_output_word_t* linear_stage1,
    const int4_output_word_t* linear_stage2,
    const int4_output_word_t* linear_stage3,
    int4_output_word_t* output0,
    int4_output_word_t* output1,
    int4_output_word_t* output2,
    int4_output_word_t* output3
) {
#pragma HLS INLINE off

    static constexpr int output_rows =
        ROUTE_ID == INT4_LINEAR_GATE || ROUTE_ID == INT4_LINEAR_UP
            ? INT4_HIDDEN_DIM
            : (ROUTE_ID == INT4_LINEAR_LOGITS
                   ? INT4_VOCAB_SIZE
                   : ((ROUTE_ID == INT4_LINEAR_K ||
                       ROUTE_ID == INT4_LINEAR_V)
                          ? INT4_KV_DIM : INT4_DIM));
    static constexpr int rounded_output_tiles =
        (((output_rows + INT4_TILE_ROWS - 1) / INT4_TILE_ROWS) +
         INT4_PE_COUNT - 1) /
        INT4_PE_COUNT * INT4_PE_COUNT;
    static constexpr int output_words =
        (rounded_output_tiles / INT4_PE_COUNT) *
        INT4_OUTPUT_WORDS_PER_TILE;
    static_assert(
        (rounded_output_tiles % INT4_PE_COUNT) == 0,
        "projection routing requires equal row-tile counts per PE");

route_linear_projection_loop:
    for (int word = 0; word < output_words; ++word) {
#pragma HLS PIPELINE II=1
        output0[word] = linear_stage0[word];
        output1[word] = linear_stage1[word];
        output2[word] = linear_stage2[word];
        output3[word] = linear_stage3[word];
    }
}

static void int4_execute_dispatch_linear(
    const int4_weight_word_t* weight_bank0,
    const int4_weight_word_t* weight_bank1,
    const int4_weight_word_t* weight_bank2,
    const int4_weight_word_t* weight_bank3,
    const int4_weight_scale_word_t* scale_bank0,
    const int4_weight_scale_word_t* scale_bank1,
    const int4_weight_scale_word_t* scale_bank2,
    const int4_weight_scale_word_t* scale_bank3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    hls::stream<int4_dispatch_command_t>& command_stream,
    int4_output_word_t* linear_stage0,
    int4_output_word_t* linear_stage1,
    int4_output_word_t* linear_stage2,
    int4_output_word_t* linear_stage3,
    int4_output_word_t* q_pe0,
    int4_output_word_t* q_pe1,
    int4_output_word_t* q_pe2,
    int4_output_word_t* q_pe3,
    int4_output_word_t* k_pe0,
    int4_output_word_t* k_pe1,
    int4_output_word_t* k_pe2,
    int4_output_word_t* k_pe3,
    int4_output_word_t* v_pe0,
    int4_output_word_t* v_pe1,
    int4_output_word_t* v_pe2,
    int4_output_word_t* v_pe3,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    int4_output_word_t* gate_pe0,
    int4_output_word_t* gate_pe1,
    int4_output_word_t* gate_pe2,
    int4_output_word_t* gate_pe3,
    int4_output_word_t* up_pe0,
    int4_output_word_t* up_pe1,
    int4_output_word_t* up_pe2,
    int4_output_word_t* up_pe3,
    int4_output_word_t* logits_pe0,
    int4_output_word_t* logits_pe1,
    int4_output_word_t* logits_pe2,
    int4_output_word_t* logits_pe3,
    Int4Controller& controller
) {
#pragma HLS INLINE off
    const int preprocess_mode = (int)command_stream.read();
    const int mode = (int)controller.linear_mode;
    const int weight_offset =
        (int)controller.weight_word_offset;
    const int scale_offset =
        (int)controller.weight_scale_word_offset;
    const bool fuse_residual =
        mode == INT4_LINEAR_O || mode == INT4_LINEAR_DOWN;

    // The fused writer reads its output memory as the residual source.  Seed
    // the fixed staging RAMs first so the linear engine never receives a
    // run-time-selected pointer.
    if (fuse_residual) {
    seed_linear_stage_with_residual_loop:
        for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
            linear_stage0[word] = residual_pe0[word];
            linear_stage1[word] = residual_pe1[word];
            linear_stage2[word] = residual_pe2[word];
            linear_stage3[word] = residual_pe3[word];
        }
    }

    int4_run_preprocess_and_linear(
        weight_bank0 + weight_offset,
        weight_bank1 + weight_offset,
        weight_bank2 + weight_offset,
        weight_bank3 + weight_offset,
        scale_bank0 + scale_offset,
        scale_bank1 + scale_offset,
        scale_bank2 + scale_offset,
        scale_bank3 + scale_offset,
        activation_q, activation_scale,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        preprocess_mode,
        linear_stage0, linear_stage1,
        linear_stage2, linear_stage3,
        controller);

    // Route every projection from the shared staging RAM.  UP gets its own
    // small BRAM because the fused SwiGLU -> DOWN state must read UP while
    // the staging RAM is pre-seeded with the residual for DOWN.
#define INT4_ROUTE_PROJECTION(ROUTE, OUT0, OUT1, OUT2, OUT3) \
    int4_route_linear_projection<ROUTE>( \
        linear_stage0, linear_stage1, linear_stage2, linear_stage3, \
        OUT0, OUT1, OUT2, OUT3)
    switch (mode) {
    case INT4_LINEAR_Q:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_Q, q_pe0, q_pe1, q_pe2, q_pe3);
        break;
    case INT4_LINEAR_K:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_K, k_pe0, k_pe1, k_pe2, k_pe3);
        break;
    case INT4_LINEAR_V:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_V, v_pe0, v_pe1, v_pe2, v_pe3);
        break;
    case INT4_LINEAR_GATE:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_GATE,
            gate_pe0, gate_pe1, gate_pe2, gate_pe3);
        break;
    case INT4_LINEAR_UP:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_UP, up_pe0, up_pe1, up_pe2, up_pe3);
        break;
    case INT4_LINEAR_LOGITS:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_LOGITS,
            logits_pe0, logits_pe1, logits_pe2, logits_pe3);
        break;
    case INT4_LINEAR_O:
    case INT4_LINEAR_DOWN:
    default:
        INT4_ROUTE_PROJECTION(
            INT4_LINEAR_DOWN,
            residual_pe0, residual_pe1,
            residual_pe2, residual_pe3);
        break;
    }
#undef INT4_ROUTE_PROJECTION
}

// Insert a real FIFO/register boundary between the global decoder FSM and
// the AXI-owning linear engine.  In the routed U250 design the old direct
// conditional call produced a controller_run_swiglu -> gmem0 full_n path of
// 5.103 ns, 92.9% of which was routing.  With start propagation disabled,
// only this tiny producer is enabled by the global FSM; the AXI-side consumer
// starts from the local command FIFO and no longer sees the raw controller
// predicate as a combinational enable.
static void int4_dispatch_linear_registered(
    const int4_weight_word_t* weight_bank0,
    const int4_weight_word_t* weight_bank1,
    const int4_weight_word_t* weight_bank2,
    const int4_weight_word_t* weight_bank3,
    const int4_weight_scale_word_t* scale_bank0,
    const int4_weight_scale_word_t* scale_bank1,
    const int4_weight_scale_word_t* scale_bank2,
    const int4_weight_scale_word_t* scale_bank3,
    int4_quant_word_t* activation_q,
    int4_scale_word_t* activation_scale,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    int preprocess_mode,
    int4_output_word_t* linear_stage0,
    int4_output_word_t* linear_stage1,
    int4_output_word_t* linear_stage2,
    int4_output_word_t* linear_stage3,
    int4_output_word_t* q_pe0,
    int4_output_word_t* q_pe1,
    int4_output_word_t* q_pe2,
    int4_output_word_t* q_pe3,
    int4_output_word_t* k_pe0,
    int4_output_word_t* k_pe1,
    int4_output_word_t* k_pe2,
    int4_output_word_t* k_pe3,
    int4_output_word_t* v_pe0,
    int4_output_word_t* v_pe1,
    int4_output_word_t* v_pe2,
    int4_output_word_t* v_pe3,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    int4_output_word_t* gate_pe0,
    int4_output_word_t* gate_pe1,
    int4_output_word_t* gate_pe2,
    int4_output_word_t* gate_pe3,
    int4_output_word_t* up_pe0,
    int4_output_word_t* up_pe1,
    int4_output_word_t* up_pe2,
    int4_output_word_t* up_pe3,
    int4_output_word_t* logits_pe0,
    int4_output_word_t* logits_pe1,
    int4_output_word_t* logits_pe2,
    int4_output_word_t* logits_pe3,
    Int4Controller& controller
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_dispatch_command_t> command_stream;
#pragma HLS STREAM variable=command_stream depth=2
#pragma HLS BIND_STORAGE variable=command_stream type=fifo impl=srl

    // The DATAFLOW entry process performs this write.  Keeping a separate
    // two-bit producer function only added an extra FSM and did not add a
    // register beyond the FIFO itself.
    command_stream.write((int4_dispatch_command_t)preprocess_mode);
    int4_execute_dispatch_linear(
        weight_bank0, weight_bank1,
        weight_bank2, weight_bank3,
        scale_bank0, scale_bank1,
        scale_bank2, scale_bank3,
        activation_q, activation_scale,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        command_stream,
        linear_stage0, linear_stage1,
        linear_stage2, linear_stage3,
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        residual_pe0, residual_pe1,
        residual_pe2, residual_pe3,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        logits_pe0, logits_pe1, logits_pe2, logits_pe3,
        controller);
}

static void int4_preload_model_prefix_4ddr(
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    int4_weight_scale_word_t
        scale_cache0[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t
        scale_cache1[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t
        scale_cache2[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_weight_scale_word_t
        scale_cache3[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_output_word_t
        norm_cache0[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t
        norm_cache1[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t
        norm_cache2[INT4_TOTAL_NORM_WORDS_PER_PE],
    int4_output_word_t
        norm_cache3[INT4_TOTAL_NORM_WORDS_PER_PE]
) {
#pragma HLS INLINE off

// One controller drives four independent AXI bundles.  The previous four
// template instances duplicated loop/address control in LUTs even though all
// banks always use the same offset.  Four reads are still issued each cycle.
preload_model_prefix_word_loop:
    for (int word = 0;
         word < INT4_MODEL_WEIGHT_BASE_WORD;
         ++word) {
#pragma HLS PIPELINE II=1
        const int4_weight_word_t value0 = model_bank0[word];
        const int4_weight_word_t value1 = model_bank1[word];
        const int4_weight_word_t value2 = model_bank2[word];
        const int4_weight_word_t value3 = model_bank3[word];
        if (word < INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE) {
            scale_cache0[word] = value0;
            scale_cache1[word] = value1;
            scale_cache2[word] = value2;
            scale_cache3[word] = value3;
        } else {
            const int norm_word =
                word - INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE;
            norm_cache0[norm_word] = value0;
            norm_cache1[norm_word] = value1;
            norm_cache2[norm_word] = value2;
            norm_cache3[norm_word] = value3;
        }
    }
}

static void int4_load_residual_4ddr(
    const int4_output_word_t* residual_pe0,
    const int4_output_word_t* residual_pe1,
    const int4_output_word_t* residual_pe2,
    const int4_output_word_t* residual_pe3,
    int4_output_word_t residual_buffer0[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual_buffer1[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual_buffer2[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t residual_buffer3[INT4_VECTOR_WORDS_PER_PE]
) {
#pragma HLS INLINE off

load_residual_word_loop:
    for (int word = 0;
         word < INT4_VECTOR_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1
        residual_buffer0[word] = residual_pe0[word];
        residual_buffer1[word] = residual_pe1[word];
        residual_buffer2[word] = residual_pe2[word];
        residual_buffer3[word] = residual_pe3[word];
    }
}

static void int4_store_residual_4ddr(
    const int4_output_word_t
        residual_buffer0[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t
        residual_buffer1[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t
        residual_buffer2[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t
        residual_buffer3[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3
) {
#pragma HLS INLINE off

store_residual_word_loop:
    for (int word = 0;
         word < INT4_VECTOR_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1
        residual_pe0[word] = residual_buffer0[word];
        residual_pe1[word] = residual_buffer1[word];
        residual_pe2[word] = residual_buffer2[word];
        residual_pe3[word] = residual_buffer3[word];
    }
}

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
) {
#pragma HLS INTERFACE m_axi port=model_bank0 bundle=gmem0 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=rope_lut_ddr bundle=gmem0 offset=slave \
    depth=SWIFTKV_ROPE_DDR_WORDS latency=64 \
    max_read_burst_length=256 num_read_outstanding=8
#pragma HLS INTERFACE m_axi port=residual_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=logits_pe0 bundle=gmem0 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS
#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH

#pragma HLS INTERFACE m_axi port=model_bank1 bundle=gmem1 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=logits_pe1 bundle=gmem1 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH

#pragma HLS INTERFACE m_axi port=model_bank2 bundle=gmem2 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=logits_pe2 bundle=gmem2 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH

#pragma HLS INTERFACE m_axi port=model_bank3 bundle=gmem3 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=8 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=residual_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE
#pragma HLS INTERFACE m_axi port=logits_pe3 bundle=gmem3 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH

#pragma HLS INTERFACE s_axilite port=model_bank0 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank1 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank2 bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank3 bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut_ddr bundle=control
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
#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // SwiftKV's Global Buffer is on chip: residual, Q/K/V and the two FFN
    // branches are reused throughout the controller invocation.  Keeping
    // intermediates off AXI removes redundant DDR traffic and twenty pointer
    // clients from the four physical memory masters.
    int4_output_word_t
        residual_buffer0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t
        residual_buffer1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t
        residual_buffer2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t
        residual_buffer3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t linear_stage0[INT4_MAX_LOCAL_OUTPUT_WORDS];
    int4_output_word_t linear_stage1[INT4_MAX_LOCAL_OUTPUT_WORDS];
    int4_output_word_t linear_stage2[INT4_MAX_LOCAL_OUTPUT_WORDS];
    int4_output_word_t linear_stage3[INT4_MAX_LOCAL_OUTPUT_WORDS];
    int4_output_word_t q_pe0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q_pe1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q_pe2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t q_pe3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k_pe0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k_pe1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k_pe2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t k_pe3[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v_pe0[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v_pe1[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v_pe2[INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t v_pe3[INT4_VECTOR_WORDS_PER_PE];
    static constexpr int INT4_FFN_WORDS_PER_PE =
        22 * INT4_OUTPUT_WORDS_PER_TILE;
    int4_output_word_t gate_pe0[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t gate_pe1[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t gate_pe2[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t gate_pe3[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t up_pe0[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t up_pe1[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t up_pe2[INT4_FFN_WORDS_PER_PE];
    int4_output_word_t up_pe3[INT4_FFN_WORDS_PER_PE];
#pragma HLS BIND_STORAGE variable=q_pe0 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=q_pe1 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=q_pe2 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=q_pe3 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=k_pe0 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=k_pe1 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=k_pe2 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=k_pe3 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=v_pe0 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=v_pe1 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=v_pe2 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=v_pe3 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=gate_pe0 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=gate_pe1 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=gate_pe2 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=gate_pe3 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=up_pe0 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=up_pe1 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=up_pe2 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=up_pe3 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=residual_buffer0 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual_buffer1 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual_buffer2 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=residual_buffer3 type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=linear_stage0 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=linear_stage1 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=linear_stage2 type=ram_2p impl=uram
#pragma HLS BIND_STORAGE variable=linear_stage3 type=ram_2p impl=uram

    // Cache scale and RMSNorm regions in separate URAMs.  During a fused
    // RMSNorm -> linear state, RMSNorm reads gamma while the linear weight
    // reader independently consumes tile scales.  Splitting the two regions
    // gives DATAFLOW one physical reader per memory without adding DDR ports.
    static int4_weight_scale_word_t
        model_scale_cache0[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t
        model_scale_cache1[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t
        model_scale_cache2[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_weight_scale_word_t
        model_scale_cache3[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE];
    static int4_output_word_t
        model_norm_cache0[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t
        model_norm_cache1[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t
        model_norm_cache2[INT4_TOTAL_NORM_WORDS_PER_PE];
    static int4_output_word_t
        model_norm_cache3[INT4_TOTAL_NORM_WORDS_PER_PE];
#pragma HLS BIND_STORAGE variable=model_scale_cache0 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_scale_cache1 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_scale_cache2 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_scale_cache3 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_norm_cache0 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_norm_cache1 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_norm_cache2 type=ram_1p impl=uram
#pragma HLS BIND_STORAGE variable=model_norm_cache3 type=ram_1p impl=uram

    // Online activation quantization stays entirely on chip.  Each G32 is
    // packed as 32 signed A15 values; its FP32 scale is stored in the matching
    // BRAM word and reused by all four linear PEs.
    int4_quant_word_t activation_q[INT4_MAX_INPUT_GROUPS];
    int4_scale_word_t
        activation_scale[INT4_MAX_ACTIVATION_SCALE_WORDS];
#pragma HLS BIND_STORAGE variable=activation_q type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale type=ram_1p impl=bram

    // The complete 4096-position table is packed offline as two 512-bit DDR
    // words per 608-bit row.  It shares gmem0, so the whole design still owns
    // exactly four AXI masters.  Both RoPE and the model scale/norm prefix are
    // persistent across token invocations and are fetched only at sequence
    // start.  From token one onward prefix traffic disappears; each bank
    // alternates only between its long INT4 weight bursts and the mandatory
    // compressed-KV/residual/logit transactions selected by the controller.
    static swiftkv_rope_lut_word_t
        rope_lut[SWIFTKV_ROPE_LUT_WORDS];
    swiftkv_rope_raw_t current_cos[SWIFTKV_ROPE_PAIRS];
    swiftkv_rope_raw_t current_sin[SWIFTKV_ROPE_PAIRS];
#pragma HLS BIND_STORAGE variable=rope_lut type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=current_cos type=ram_1p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=current_sin type=ram_1p impl=bram latency=1

    if (position == 0) {
        swiftkv_preload_rope_lut(rope_lut_ddr, rope_lut);
        int4_preload_model_prefix_4ddr(
            model_bank0, model_bank1, model_bank2, model_bank3,
            model_scale_cache0, model_scale_cache1,
            model_scale_cache2, model_scale_cache3,
            model_norm_cache0, model_norm_cache1,
            model_norm_cache2, model_norm_cache3);
    }
    swiftkv_load_rope_position(
        rope_lut, position, current_cos, current_sin);
    int4_load_residual_4ddr(
        residual_pe0, residual_pe1, residual_pe2, residual_pe3,
        residual_buffer0, residual_buffer1,
        residual_buffer2, residual_buffer3);

    const int4_weight_word_t* weight_bank0 =
        int4_model_weight_base(model_bank0);
    const int4_weight_word_t* weight_bank1 =
        int4_model_weight_base(model_bank1);
    const int4_weight_word_t* weight_bank2 =
        int4_model_weight_base(model_bank2);
    const int4_weight_word_t* weight_bank3 =
        int4_model_weight_base(model_bank3);
    const int4_weight_scale_word_t* scale_bank0 =
        model_scale_cache0;
    const int4_weight_scale_word_t* scale_bank1 =
        model_scale_cache1;
    const int4_weight_scale_word_t* scale_bank2 =
        model_scale_cache2;
    const int4_weight_scale_word_t* scale_bank3 =
        model_scale_cache3;
    const int4_output_word_t* norm_bank0 =
        model_norm_cache0;
    const int4_output_word_t* norm_bank1 =
        model_norm_cache1;
    const int4_output_word_t* norm_bank2 =
        model_norm_cache2;
    const int4_output_word_t* norm_bank3 =
        model_norm_cache3;

    Int4Controller controller;
    controller.position = position;
    controller.layer_index = 0;
    controller.rmsnorm_mode = INT4_RMSNORM_ATTENTION;
    controller.run_rmsnorm = INT4_RUN;

decoder_controller_loop:
    for (int step = 0; step < INT4_DECODER_MAX_STEPS; ++step) {
#pragma HLS LOOP_TRIPCOUNT min=257 max=257
        if (controller.run_rmsnorm == INT4_RUN ||
            controller.run_linear == INT4_RUN ||
            controller.run_swiglu == INT4_RUN) {
            int preprocess_mode = INT4_PREPROCESS_NONE;
            int norm_offset = 0;
            if (controller.run_rmsnorm == INT4_RUN) {
                preprocess_mode = INT4_PREPROCESS_RMS;
                norm_offset =
                    int4_norm_offset(
                        (int)controller.layer_index,
                        (int)controller.rmsnorm_mode);
                controller.run_rmsnorm = INT4_LAZY;
                controller.run_linear = INT4_RUN;
                if (controller.rmsnorm_mode ==
                    INT4_RMSNORM_ATTENTION) {
                    controller.linear_mode = INT4_LINEAR_Q;
                } else if (controller.rmsnorm_mode ==
                           INT4_RMSNORM_FFN) {
                    controller.linear_mode = INT4_LINEAR_GATE;
                } else {
                    controller.linear_mode = INT4_LINEAR_LOGITS;
                }
            } else if (controller.run_swiglu == INT4_RUN) {
                preprocess_mode = INT4_PREPROCESS_SWIGLU;
                controller.run_swiglu = INT4_LAZY;
                controller.run_linear = INT4_RUN;
                controller.linear_mode = INT4_LINEAR_DOWN;
            }
            int4_dispatch_linear_registered(
                weight_bank0, weight_bank1,
                weight_bank2, weight_bank3,
                scale_bank0, scale_bank1,
                scale_bank2, scale_bank3,
                activation_q, activation_scale,
                residual_buffer0, residual_buffer1,
                residual_buffer2, residual_buffer3,
                norm_bank0 + norm_offset,
                norm_bank1 + norm_offset,
                norm_bank2 + norm_offset,
                norm_bank3 + norm_offset,
                preprocess_mode,
                linear_stage0, linear_stage1,
                linear_stage2, linear_stage3,
                q_pe0, q_pe1, q_pe2, q_pe3,
                k_pe0, k_pe1, k_pe2, k_pe3,
                v_pe0, v_pe1, v_pe2, v_pe3,
                residual_buffer0, residual_buffer1,
                residual_buffer2, residual_buffer3,
                gate_pe0, gate_pe1, gate_pe2, gate_pe3,
                up_pe0, up_pe1, up_pe2, up_pe3,
                logits_pe0, logits_pe1,
                logits_pe2, logits_pe3,
                controller);
        } else if (controller.run_rope == INT4_RUN) {
            int4_swiftkv_attention_4pe(
                q_pe0, q_pe1, q_pe2, q_pe3,
                k_pe0, k_pe1, k_pe2, k_pe3,
                v_pe0, v_pe1, v_pe2, v_pe3,
                kv_cache_pe0, kv_cache_pe1,
                kv_cache_pe2, kv_cache_pe3,
                current_cos, current_sin,
                activation_q, activation_scale,
                controller);
        }

        if (controller.exit == INT4_RUN) {
            break;
        }
    }

    int4_store_residual_4ddr(
        residual_buffer0, residual_buffer1,
        residual_buffer2, residual_buffer3,
        residual_pe0, residual_pe1, residual_pe2, residual_pe3);
}
