#include "int4_decoder_multikernel.hpp"

#include "int4_decoder_blocks.hpp"
#include "int4_decoder_local.hpp"
#include "int4_decoder_schedule.hpp"
#include "int4_linear_controller.hpp"
#include "int4_model_layout.hpp"
#include "int4_task_control.hpp"
#include "swiftkv_attention.hpp"

template <int PE_ID>
static void int4_seed_local_position(
    ap_uint<12> position,
    hls::stream<int4_position_command_t>& position_stream) {
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1
    position_stream.write(position);
}

template <int CHANNEL_ID>
static void int4_relay_rms_schedule(
    hls::stream<float>& input,
    hls::stream<float>& output) {
#pragma HLS INLINE off
relay_rms_event_loop:
    for (int event = 0; event < INT4_DECODER_RMS_STAGES; ++event) {
#pragma HLS PIPELINE off
        output.write(input.read());
    }
}

enum Int4DecoderLinearRelayKind {
    INT4_RELAY_LINEAR_PARTIAL = 0,
    INT4_RELAY_LINEAR_PAIR_SUM = 1,
    INT4_RELAY_LINEAR_LOCAL_OUTPUT = 2
};

template <int CHANNEL_ID, int RELAY_KIND>
static void int4_relay_linear_schedule(
    hls::stream<int4_reduction_packet_t>& input,
    hls::stream<int4_reduction_packet_t>& output) {
#pragma HLS INLINE off
relay_linear_layer_loop:
    for (int schedule_layer = 0;
         schedule_layer < INT4_DECODER_SCHEDULE_LAYERS;
         ++schedule_layer) {
#pragma HLS LOOP_FLATTEN off
        const int stage_count = int4_decoder_stage_count(schedule_layer);
    relay_linear_stage_loop:
        for (int stage = 0; stage < stage_count; ++stage) {
            const int mode = (int)int4_decoder_stage_mode(
                schedule_layer, stage);
            const int output_tiles = int4_mode_output_tiles(mode);
            const int local_output_tiles =
                int4_mode_local_output_tiles(mode);
            const int packet_count = RELAY_KIND == INT4_RELAY_LINEAR_PARTIAL
                ? output_tiles * INT4_ROW_BLOCKS
                : (RELAY_KIND == INT4_RELAY_LINEAR_PAIR_SUM
                    ? 2 * local_output_tiles * INT4_ROW_BLOCKS
                    : local_output_tiles * INT4_ROW_BLOCKS);
        relay_linear_packet_loop:
            for (int packet = 0; packet < packet_count; ++packet) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=256 max=8064
                output.write(input.read());
            }
        }
    }
}

extern "C" void int4_decoder_pe0_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache,
    hls::stream<float>& rms_partial_to_pe1,
    hls::stream<float>& rms_reciprocal_from_pe1,
    hls::stream<int4_reduction_packet_t>& linear_partial_to_pe1,
    hls::stream<int4_reduction_packet_t>& linear_output_from_pe1) {
#pragma HLS INTERFACE m_axi port=model_bank bundle=gmem0 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=rope_lut bundle=gmem0 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=residual bundle=gmem0 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits bundle=gmem0 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=32 max_write_burst_length=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache bundle=gmem0 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2

#pragma HLS INTERFACE axis port=rms_partial_to_pe1 register_mode=both
#pragma HLS INTERFACE axis port=rms_reciprocal_from_pe1 register_mode=both
#pragma HLS INTERFACE axis port=linear_partial_to_pe1 register_mode=both
#pragma HLS INTERFACE axis port=linear_output_from_pe1 register_mode=both

#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut bundle=control
#pragma HLS INTERFACE s_axilite port=residual bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS STABLE variable=model_bank
#pragma HLS STABLE variable=rope_lut
#pragma HLS STABLE variable=residual
#pragma HLS STABLE variable=logits
#pragma HLS STABLE variable=kv_cache

    HLS_TASK_STREAM<int4_position_command_t> position_local;
    HLS_TASK_STREAM<float> rms_partial0;
    HLS_TASK_STREAM<float> rms_reciprocal0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output0;
    HLS_TASK_STREAM<int4_completion_token_t> completion;
#pragma HLS STREAM variable=position_local depth=2
#pragma HLS STREAM variable=rms_partial0 depth=4
#pragma HLS STREAM variable=rms_reciprocal0 depth=2
#pragma HLS STREAM variable=linear_partial0 depth=8
#pragma HLS STREAM variable=linear_output0 depth=32
#pragma HLS STREAM variable=completion depth=4
#pragma HLS BIND_STORAGE variable=position_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_output0 type=fifo impl=bram

    int4_seed_local_position<0>(position, position_local);
    HLS_TASK local_pe0(int4_decoder_local_pe_0,
        model_bank, rope_lut, residual, logits, kv_cache,
        position_local, rms_partial0, rms_reciprocal0,
        linear_partial0, linear_output0, completion);
    HLS_TASK relay_rms_partial0(int4_relay_rms_schedule<0>,
        rms_partial0, rms_partial_to_pe1);
    HLS_TASK relay_rms_reciprocal0(int4_relay_rms_schedule<1>,
        rms_reciprocal_from_pe1, rms_reciprocal0);
    HLS_TASK relay_linear_partial0(
        (int4_relay_linear_schedule<0, INT4_RELAY_LINEAR_PARTIAL>),
        linear_partial0, linear_partial_to_pe1);
    HLS_TASK relay_linear_output0(
        (int4_relay_linear_schedule<1, INT4_RELAY_LINEAR_LOCAL_OUTPUT>),
        linear_output_from_pe1, linear_output0);
    int4_wait_task_completion<400>(completion);
}

extern "C" void int4_decoder_pe1_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache,
    hls::stream<float>& rms_partial_from_pe0,
    hls::stream<float>& rms_reciprocal_to_pe0,
    hls::stream<float>& rms_sum_from_pe2,
    hls::stream<float>& rms_reciprocal_to_pe2,
    hls::stream<int4_reduction_packet_t>& linear_partial_from_pe0,
    hls::stream<int4_reduction_packet_t>& linear_output_to_pe0,
    hls::stream<int4_reduction_packet_t>& linear_sum_from_pe2,
    hls::stream<int4_reduction_packet_t>& linear_sum_to_pe2) {
#pragma HLS INTERFACE m_axi port=model_bank bundle=gmem1 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=rope_lut bundle=gmem1 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=residual bundle=gmem1 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits bundle=gmem1 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=32 max_write_burst_length=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache bundle=gmem1 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2

#pragma HLS INTERFACE axis port=rms_partial_from_pe0 register_mode=both
#pragma HLS INTERFACE axis port=rms_reciprocal_to_pe0 register_mode=both
#pragma HLS INTERFACE axis port=rms_sum_from_pe2 register_mode=both
#pragma HLS INTERFACE axis port=rms_reciprocal_to_pe2 register_mode=both
#pragma HLS INTERFACE axis port=linear_partial_from_pe0 register_mode=both
#pragma HLS INTERFACE axis port=linear_output_to_pe0 register_mode=both
#pragma HLS INTERFACE axis port=linear_sum_from_pe2 register_mode=both
#pragma HLS INTERFACE axis port=linear_sum_to_pe2 register_mode=both

#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut bundle=control
#pragma HLS INTERFACE s_axilite port=residual bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS STABLE variable=model_bank
#pragma HLS STABLE variable=rope_lut
#pragma HLS STABLE variable=residual
#pragma HLS STABLE variable=logits
#pragma HLS STABLE variable=kv_cache

    HLS_TASK_STREAM<int4_position_command_t> position_local;
    HLS_TASK_STREAM<float> rms_partial0;
    HLS_TASK_STREAM<float> rms_partial1;
    HLS_TASK_STREAM<float> rms_sum23;
    HLS_TASK_STREAM<float> rms_reciprocal0;
    HLS_TASK_STREAM<float> rms_reciprocal1;
    HLS_TASK_STREAM<float> rms_reciprocal23;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial1;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum01_local;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum01_remote;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum23_remote;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output0;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output1;
    HLS_TASK_STREAM<int4_completion_token_t> completion;
#pragma HLS STREAM variable=position_local depth=2
#pragma HLS STREAM variable=rms_partial0 depth=4
#pragma HLS STREAM variable=rms_partial1 depth=4
#pragma HLS STREAM variable=rms_sum23 depth=4
#pragma HLS STREAM variable=rms_reciprocal0 depth=2
#pragma HLS STREAM variable=rms_reciprocal1 depth=2
#pragma HLS STREAM variable=rms_reciprocal23 depth=4
#pragma HLS STREAM variable=linear_partial0 depth=8
#pragma HLS STREAM variable=linear_partial1 depth=8
#pragma HLS STREAM variable=linear_sum01_local depth=16
#pragma HLS STREAM variable=linear_sum01_remote depth=16
#pragma HLS STREAM variable=linear_sum23_remote depth=16
#pragma HLS STREAM variable=linear_output0 depth=32
#pragma HLS STREAM variable=linear_output1 depth=32
#pragma HLS STREAM variable=completion depth=4
#pragma HLS BIND_STORAGE variable=position_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_sum01_remote type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_sum23_remote type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_output0 type=fifo impl=bram

    int4_seed_local_position<1>(position, position_local);
    HLS_TASK local_pe1(int4_decoder_local_pe_1,
        model_bank, rope_lut, residual, logits, kv_cache,
        position_local, rms_partial1, rms_reciprocal1,
        linear_partial1, linear_output1, completion);
    HLS_TASK rms_pair01(int4_rms_pair01_schedule,
        rms_partial0, rms_partial1, rms_sum23,
        rms_reciprocal0, rms_reciprocal1, rms_reciprocal23);
    HLS_TASK reduce_pair01(int4_linear_reduce_pair01_schedule,
        linear_partial0, linear_partial1,
        linear_sum01_local, linear_sum01_remote);
    HLS_TASK finalize_pair01(int4_linear_finalize_pair01_schedule,
        linear_sum01_local, linear_sum23_remote,
        linear_output0, linear_output1);
    HLS_TASK relay_rms_partial0(int4_relay_rms_schedule<10>,
        rms_partial_from_pe0, rms_partial0);
    HLS_TASK relay_rms_reciprocal0(int4_relay_rms_schedule<11>,
        rms_reciprocal0, rms_reciprocal_to_pe0);
    HLS_TASK relay_rms_sum23(int4_relay_rms_schedule<12>,
        rms_sum_from_pe2, rms_sum23);
    HLS_TASK relay_rms_reciprocal23(int4_relay_rms_schedule<13>,
        rms_reciprocal23, rms_reciprocal_to_pe2);
    HLS_TASK relay_linear_partial0(
        (int4_relay_linear_schedule<10, INT4_RELAY_LINEAR_PARTIAL>),
        linear_partial_from_pe0, linear_partial0);
    HLS_TASK relay_linear_output0(
        (int4_relay_linear_schedule<11, INT4_RELAY_LINEAR_LOCAL_OUTPUT>),
        linear_output0, linear_output_to_pe0);
    HLS_TASK relay_linear_sum23(
        (int4_relay_linear_schedule<12, INT4_RELAY_LINEAR_PAIR_SUM>),
        linear_sum_from_pe2, linear_sum23_remote);
    HLS_TASK relay_linear_sum01(
        (int4_relay_linear_schedule<13, INT4_RELAY_LINEAR_PAIR_SUM>),
        linear_sum01_remote, linear_sum_to_pe2);
    int4_wait_task_completion<401>(completion);
}

extern "C" void int4_decoder_pe2_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache,
    hls::stream<float>& rms_reciprocal_from_pe1,
    hls::stream<float>& rms_sum_to_pe1,
    hls::stream<float>& rms_partial_from_pe3,
    hls::stream<float>& rms_reciprocal_to_pe3,
    hls::stream<int4_reduction_packet_t>& linear_sum_from_pe1,
    hls::stream<int4_reduction_packet_t>& linear_sum_to_pe1,
    hls::stream<int4_reduction_packet_t>& linear_partial_from_pe3,
    hls::stream<int4_reduction_packet_t>& linear_output_to_pe3) {
#pragma HLS INTERFACE m_axi port=model_bank bundle=gmem2 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=rope_lut bundle=gmem2 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=residual bundle=gmem2 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits bundle=gmem2 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=32 max_write_burst_length=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache bundle=gmem2 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2

#pragma HLS INTERFACE axis port=rms_reciprocal_from_pe1 register_mode=both
#pragma HLS INTERFACE axis port=rms_sum_to_pe1 register_mode=both
#pragma HLS INTERFACE axis port=rms_partial_from_pe3 register_mode=both
#pragma HLS INTERFACE axis port=rms_reciprocal_to_pe3 register_mode=both
#pragma HLS INTERFACE axis port=linear_sum_from_pe1 register_mode=both
#pragma HLS INTERFACE axis port=linear_sum_to_pe1 register_mode=both
#pragma HLS INTERFACE axis port=linear_partial_from_pe3 register_mode=both
#pragma HLS INTERFACE axis port=linear_output_to_pe3 register_mode=both

#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut bundle=control
#pragma HLS INTERFACE s_axilite port=residual bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS STABLE variable=model_bank
#pragma HLS STABLE variable=rope_lut
#pragma HLS STABLE variable=residual
#pragma HLS STABLE variable=logits
#pragma HLS STABLE variable=kv_cache

    HLS_TASK_STREAM<int4_position_command_t> position_local;
    HLS_TASK_STREAM<float> rms_partial2;
    HLS_TASK_STREAM<float> rms_partial3;
    HLS_TASK_STREAM<float> rms_reciprocal2;
    HLS_TASK_STREAM<float> rms_reciprocal3;
    HLS_TASK_STREAM<float> rms_sum23;
    HLS_TASK_STREAM<float> rms_reciprocal01;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial2;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial3;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum23_local;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum23_remote;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_sum01_remote;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output2;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output3;
    HLS_TASK_STREAM<int4_completion_token_t> completion;
#pragma HLS STREAM variable=position_local depth=2
#pragma HLS STREAM variable=rms_partial2 depth=4
#pragma HLS STREAM variable=rms_partial3 depth=4
#pragma HLS STREAM variable=rms_reciprocal2 depth=2
#pragma HLS STREAM variable=rms_reciprocal3 depth=2
#pragma HLS STREAM variable=rms_sum23 depth=4
#pragma HLS STREAM variable=rms_reciprocal01 depth=4
#pragma HLS STREAM variable=linear_partial2 depth=8
#pragma HLS STREAM variable=linear_partial3 depth=8
#pragma HLS STREAM variable=linear_sum23_local depth=16
#pragma HLS STREAM variable=linear_sum23_remote depth=16
#pragma HLS STREAM variable=linear_sum01_remote depth=16
#pragma HLS STREAM variable=linear_output2 depth=32
#pragma HLS STREAM variable=linear_output3 depth=32
#pragma HLS STREAM variable=completion depth=4
#pragma HLS BIND_STORAGE variable=position_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_sum23_remote type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_sum01_remote type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=linear_output3 type=fifo impl=bram

    int4_seed_local_position<2>(position, position_local);
    HLS_TASK local_pe2(int4_decoder_local_pe_2,
        model_bank, rope_lut, residual, logits, kv_cache,
        position_local, rms_partial2, rms_reciprocal2,
        linear_partial2, linear_output2, completion);
    HLS_TASK rms_pair23(int4_rms_pair23_schedule,
        rms_partial2, rms_partial3, rms_sum23,
        rms_reciprocal01, rms_reciprocal2, rms_reciprocal3);
    HLS_TASK reduce_pair23(int4_linear_reduce_pair23_schedule,
        linear_partial2, linear_partial3,
        linear_sum23_local, linear_sum23_remote);
    HLS_TASK finalize_pair23(int4_linear_finalize_pair23_schedule,
        linear_sum23_local, linear_sum01_remote,
        linear_output2, linear_output3);
    HLS_TASK relay_rms_reciprocal01(int4_relay_rms_schedule<20>,
        rms_reciprocal_from_pe1, rms_reciprocal01);
    HLS_TASK relay_rms_sum23(int4_relay_rms_schedule<21>,
        rms_sum23, rms_sum_to_pe1);
    HLS_TASK relay_rms_partial3(int4_relay_rms_schedule<22>,
        rms_partial_from_pe3, rms_partial3);
    HLS_TASK relay_rms_reciprocal3(int4_relay_rms_schedule<23>,
        rms_reciprocal3, rms_reciprocal_to_pe3);
    HLS_TASK relay_linear_sum01(
        (int4_relay_linear_schedule<20, INT4_RELAY_LINEAR_PAIR_SUM>),
        linear_sum_from_pe1, linear_sum01_remote);
    HLS_TASK relay_linear_sum23(
        (int4_relay_linear_schedule<21, INT4_RELAY_LINEAR_PAIR_SUM>),
        linear_sum23_remote, linear_sum_to_pe1);
    HLS_TASK relay_linear_partial3(
        (int4_relay_linear_schedule<22, INT4_RELAY_LINEAR_PARTIAL>),
        linear_partial_from_pe3, linear_partial3);
    HLS_TASK relay_linear_output3(
        (int4_relay_linear_schedule<23, INT4_RELAY_LINEAR_LOCAL_OUTPUT>),
        linear_output3, linear_output_to_pe3);
    int4_wait_task_completion<402>(completion);
}

extern "C" void int4_decoder_pe3_kernel(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank,
    const int4_output_word_t* rope_lut,
    int4_output_word_t* residual,
    int4_output_word_t* logits,
    int4_output_word_t* kv_cache,
    hls::stream<float>& rms_partial_to_pe2,
    hls::stream<float>& rms_reciprocal_from_pe2,
    hls::stream<int4_reduction_packet_t>& linear_partial_to_pe2,
    hls::stream<int4_reduction_packet_t>& linear_output_from_pe2) {
#pragma HLS INTERFACE m_axi port=model_bank bundle=gmem3 offset=slave depth=INT4_MODEL_WORDS_PER_DDR latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=rope_lut bundle=gmem3 offset=slave depth=SWIFTKV_ROPE_DDR_WORDS latency=32 max_read_burst_length=64 num_read_outstanding=2
#pragma HLS INTERFACE m_axi port=residual bundle=gmem3 offset=slave depth=INT4_VECTOR_WORDS_PER_PE latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=logits bundle=gmem3 offset=slave depth=INT4_LOGIT_WORDS_PER_PE latency=32 max_write_burst_length=16 num_write_outstanding=2
#pragma HLS INTERFACE m_axi port=kv_cache bundle=gmem3 offset=slave depth=SWIFTKV_KV_AXI_DEPTH latency=32 max_read_burst_length=64 max_write_burst_length=16 num_read_outstanding=2 num_write_outstanding=2

#pragma HLS INTERFACE axis port=rms_partial_to_pe2 register_mode=both
#pragma HLS INTERFACE axis port=rms_reciprocal_from_pe2 register_mode=both
#pragma HLS INTERFACE axis port=linear_partial_to_pe2 register_mode=both
#pragma HLS INTERFACE axis port=linear_output_from_pe2 register_mode=both

#pragma HLS INTERFACE s_axilite port=position bundle=control
#pragma HLS INTERFACE s_axilite port=model_bank bundle=control
#pragma HLS INTERFACE s_axilite port=rope_lut bundle=control
#pragma HLS INTERFACE s_axilite port=residual bundle=control
#pragma HLS INTERFACE s_axilite port=logits bundle=control
#pragma HLS INTERFACE s_axilite port=kv_cache bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

#pragma HLS DATAFLOW disable_start_propagation
#pragma HLS STABLE variable=model_bank
#pragma HLS STABLE variable=rope_lut
#pragma HLS STABLE variable=residual
#pragma HLS STABLE variable=logits
#pragma HLS STABLE variable=kv_cache

    HLS_TASK_STREAM<int4_position_command_t> position_local;
    HLS_TASK_STREAM<float> rms_partial3;
    HLS_TASK_STREAM<float> rms_reciprocal3;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_partial3;
    HLS_TASK_STREAM<int4_reduction_packet_t> linear_output3;
    HLS_TASK_STREAM<int4_completion_token_t> completion;
#pragma HLS STREAM variable=position_local depth=2
#pragma HLS STREAM variable=rms_partial3 depth=4
#pragma HLS STREAM variable=rms_reciprocal3 depth=2
#pragma HLS STREAM variable=linear_partial3 depth=8
#pragma HLS STREAM variable=linear_output3 depth=32
#pragma HLS STREAM variable=completion depth=4
#pragma HLS BIND_STORAGE variable=position_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=linear_output3 type=fifo impl=bram

    int4_seed_local_position<3>(position, position_local);
    HLS_TASK local_pe3(int4_decoder_local_pe_3,
        model_bank, rope_lut, residual, logits, kv_cache,
        position_local, rms_partial3, rms_reciprocal3,
        linear_partial3, linear_output3, completion);
    HLS_TASK relay_rms_partial3(int4_relay_rms_schedule<30>,
        rms_partial3, rms_partial_to_pe2);
    HLS_TASK relay_rms_reciprocal3(int4_relay_rms_schedule<31>,
        rms_reciprocal_from_pe2, rms_reciprocal3);
    HLS_TASK relay_linear_partial3(
        (int4_relay_linear_schedule<30, INT4_RELAY_LINEAR_PARTIAL>),
        linear_partial3, linear_partial_to_pe2);
    HLS_TASK relay_linear_output3(
        (int4_relay_linear_schedule<31, INT4_RELAY_LINEAR_LOCAL_OUTPUT>),
        linear_output_from_pe2, linear_output3);
    int4_wait_task_completion<403>(completion);
}
