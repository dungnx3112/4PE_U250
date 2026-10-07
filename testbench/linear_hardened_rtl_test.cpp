// Full splitter -> scale block -> emitter -> buffer -> accumulator regression.
// Artificial input gaps and slow output consumption exercise backpressure.
#include "int4_linear_controller.cpp"

static const int HARDEN_MODEL_WORDS = 46464; // 16 output tiles * 11 input tiles
static const int HARDEN_PACKETS = 512;

static void hardened_seed(ap_uint<3> mode, ap_uint<8> output_tiles,
    hls::stream<int4_linear_command_t>& command_stream) {
#pragma HLS INLINE off
    int4_linear_command_t command = int4_pack_linear_command(mode, 0, 0);
    command.range(50, 43) = output_tiles;
    command_stream.write(command);
}

static void hardened_feed(const int4_weight_word_t model[HARDEN_MODEL_WORDS],
    bool gaps, hls::stream<int4_weight_request_t>& requests,
    hls::stream<int4_weight_word_t>& model_words) {
#pragma HLS INLINE off
    const int4_weight_request_t request = requests.read();
    const unsigned int base = request.range(23, 0);
    const unsigned int words =
        (unsigned int)request.range(39, 24) * INT4_SUPER_BLOCK_WORDS;
    unsigned int word = 0;
    ap_uint<6> phase = 0;
hardened_bursty_model_loop:
    while (word < words) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=4224 max=92928
        if (!gaps || phase < 32) {
            model_words.write(model[base + word]);
            ++word;
        }
        ++phase;
    }
}

static void hardened_drain(ap_uint<8> output_tiles, bool gaps,
    hls::stream<int4_reduction_packet_t>& partial_stream,
    int4_reduction_packet_t output[HARDEN_PACKETS]) {
#pragma HLS INLINE off
    const unsigned int packets = (unsigned int)output_tiles * INT4_ROW_BLOCKS;
    unsigned int packet = 0;
    ap_uint<7> phase = 0;
hardened_slow_output_loop:
    while (packet < packets) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=128 max=65536
        if (!gaps || phase == 0) {
            output[packet] = partial_stream.read();
            ++packet;
        }
        ++phase;
    }
}

static void hardened_dataflow(
    const int4_weight_word_t model[HARDEN_MODEL_WORDS],
    const int4_quant_word_t q[INT4_MAX_LOCAL_GROUPS],
    const int4_act_scale_t scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<3> mode, ap_uint<8> output_tiles, bool gaps,
    int4_reduction_packet_t output[HARDEN_PACKETS]) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_linear_command_t> command, reader_command, compute_command, emit_command;
    hls::stream<int4_weight_request_t> reader_request, split_request, buffer_request;
    hls::stream<int4_weight_request_t> scale_pack_request, scale_emit_request;
    hls::stream<int4_weight_word_t> model_word_stream, weight_ingress, weight_buffer;
    hls::stream<int4_weight_scale_word_t> scale_stream;
    hls::stream_of_blocks<int4_scale_tile_block_t> scale_blocks;
    hls::stream<int4_weight_scale_t> scale_lane0, scale_lane1, scale_lane2, scale_lane3;
    hls::stream_of_blocks<int4_partial_tile_block_t> partial_blocks;
    hls::stream<int4_reduction_packet_t> partial_stream;
#pragma HLS STREAM variable=command depth=2
#pragma HLS STREAM variable=reader_command depth=3
#pragma HLS STREAM variable=compute_command depth=7
#pragma HLS STREAM variable=emit_command depth=8
#pragma HLS STREAM variable=reader_request depth=2
#pragma HLS STREAM variable=split_request depth=3
#pragma HLS STREAM variable=buffer_request depth=4
#pragma HLS STREAM variable=scale_pack_request depth=4
#pragma HLS STREAM variable=scale_emit_request depth=5
#pragma HLS STREAM variable=model_word_stream depth=16
#pragma HLS STREAM variable=scale_stream depth=INT4_SCALE_WORDS_PER_BLOCK
#pragma HLS STREAM variable=weight_ingress depth=16
#pragma HLS STREAM variable=weight_buffer depth=2048
#pragma HLS STREAM variable=scale_lane0 depth=64
#pragma HLS STREAM variable=scale_lane1 depth=64
#pragma HLS STREAM variable=scale_lane2 depth=64
#pragma HLS STREAM variable=scale_lane3 depth=64
#pragma HLS STREAM variable=partial_stream depth=2
#pragma HLS BIND_STORAGE variable=scale_stream type=fifo impl=uram
#pragma HLS BIND_STORAGE variable=scale_blocks type=ram_2p impl=bram
#pragma HLS BIND_STORAGE variable=weight_buffer type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=partial_blocks type=ram_2p impl=bram
    hardened_seed(mode, output_tiles, command);
    int4_split_local_command(command, reader_command, compute_command, emit_command);
    int4_prepare_local_weight_request<0>(reader_command, reader_request, split_request,
        buffer_request, scale_pack_request, scale_emit_request);
    hardened_feed(model, gaps, reader_request, model_word_stream);
    int4_split_local_weight_words<0>(split_request, model_word_stream,
        scale_stream, weight_ingress);
    int4_pack_local_scale_tiles<0>(scale_pack_request, scale_stream, scale_blocks);
    int4_emit_local_scale_tiles<0>(scale_emit_request, scale_blocks,
        scale_lane0, scale_lane1, scale_lane2, scale_lane3);
    int4_buffer_local_weights<0>(buffer_request, weight_ingress, weight_buffer);
    int4_accumulate_local_partial_tiles<0>(q, scale, compute_command,
        scale_lane0, scale_lane1, scale_lane2, scale_lane3, weight_buffer, partial_blocks);
    int4_emit_local_partial_tiles<0>(emit_command, partial_blocks, partial_stream);
    hardened_drain(output_tiles, gaps, partial_stream, output);
}

extern "C" void linear_hardened_rtl_test(
    const int4_weight_word_t model[HARDEN_MODEL_WORDS],
    const int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    const int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<3> mode, ap_uint<8> output_tiles, bool gaps,
    int4_reduction_packet_t output[HARDEN_PACKETS]) {
#pragma HLS INTERFACE m_axi port=model offset=slave bundle=gmem0 depth=HARDEN_MODEL_WORDS
#pragma HLS INTERFACE m_axi port=output offset=slave bundle=gmem1 depth=HARDEN_PACKETS
#pragma HLS INTERFACE ap_memory port=activation_q
#pragma HLS INTERFACE ap_memory port=activation_scale
#pragma HLS INTERFACE s_axilite port=model
#pragma HLS INTERFACE s_axilite port=output
#pragma HLS INTERFACE s_axilite port=mode
#pragma HLS INTERFACE s_axilite port=output_tiles
#pragma HLS INTERFACE s_axilite port=gaps
#pragma HLS INTERFACE s_axilite port=return
    int4_quant_word_t q[INT4_MAX_LOCAL_GROUPS];
    int4_act_scale_t scale[INT4_MAX_LOCAL_GROUPS];
#pragma HLS BIND_STORAGE variable=q type=ram_2p impl=bram latency=1
#pragma HLS BIND_STORAGE variable=scale type=ram_2p impl=bram latency=1
    int4_snapshot_local_activation(activation_q, activation_scale, q, scale, mode);
    hardened_dataflow(model, q, scale, mode, output_tiles, gaps, output);
}
