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
    hls::stream<int4_quant_word_t>& attention_quantized_stream,
    hls::stream<float>& attention_scale_stream,
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
    } else if (preprocess_mode == INT4_PREPROCESS_ATTENTION) {
    attention_forward_group_loop:
        for (int group = 0;
             group < INT4_GROUPS_PER_VECTOR;
             ++group) {
#pragma HLS PIPELINE II=1
            quantized_stream.write(attention_quantized_stream.read());
            scale_stream.write(attention_scale_stream.read());
        }
    } else if (preprocess_mode == INT4_PREPROCESS_SWIGLU) {
        int4_swiglu_quantize_stream_4pe(
            gate_pe0, gate_pe1, gate_pe2, gate_pe3,
            up_pe0, up_pe1, up_pe2, up_pe3,
            true, quantized_stream, scale_stream);
    }
}

template <int FIRST_PE>
static void int4_forward_attention_half_body(
    hls::stream<int4_quant_word_t>& attention_quantized_half_stream,
    hls::stream<float>& attention_scale_half_stream,
    hls::stream<int4_quant_word_t>& quantized_half_stream,
    hls::stream<float>& scale_half_stream
) {
#pragma HLS INLINE
forward_attention_half_group_loop:
    for (int group = 0;
         group < INT4_GROUPS_PER_VECTOR / 2;
         ++group) {
#pragma HLS PIPELINE II=1
        quantized_half_stream.write(
            attention_quantized_half_stream.read());
        scale_half_stream.write(attention_scale_half_stream.read());
    }
}

static void int4_forward_attention_half_pair01(
    hls::stream<int4_quant_word_t>& attention_quantized_half01_stream,
    hls::stream<float>& attention_scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream
) {
#pragma HLS INLINE off
    int4_forward_attention_half_body<0>(
        attention_quantized_half01_stream,
        attention_scale_half01_stream,
        quantized_half01_stream, scale_half01_stream);
}

static void int4_forward_attention_half_pair23(
    hls::stream<int4_quant_word_t>& attention_quantized_half23_stream,
    hls::stream<float>& attention_scale_half23_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
) {
#pragma HLS INLINE off
    int4_forward_attention_half_body<2>(
        attention_quantized_half23_stream,
        attention_scale_half23_stream,
        quantized_half23_stream, scale_half23_stream);
}

// Keep the two 480-bit attention paths in separate pair-local processes.  A
// single loop with both outputs let its write mux/control be placed between
// SLR1 and SLR2 even when the two endpoint FIFOs themselves were constrained.
static void int4_forward_attention_pair_halves(
    hls::stream<int4_quant_word_t>& attention_quantized_half01_stream,
    hls::stream<float>& attention_scale_half01_stream,
    hls::stream<int4_quant_word_t>& attention_quantized_half23_stream,
    hls::stream<float>& attention_scale_half23_stream,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    int4_forward_attention_half_pair01(
        attention_quantized_half01_stream,
        attention_scale_half01_stream,
        quantized_half01_stream, scale_half01_stream);
    int4_forward_attention_half_pair23(
        attention_quantized_half23_stream,
        attention_scale_half23_stream,
        quantized_half23_stream, scale_half23_stream);
}

static void int4_preprocess_activation_pair_halves(
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
    hls::stream<int4_quant_word_t>& attention_quantized_half01_stream,
    hls::stream<float>& attention_scale_half01_stream,
    hls::stream<int4_quant_word_t>& attention_quantized_half23_stream,
    hls::stream<float>& attention_scale_half23_stream,
    hls::stream<int4_quant_word_t>& quantized_half01_stream,
    hls::stream<float>& scale_half01_stream,
    hls::stream<int4_quant_word_t>& quantized_half23_stream,
    hls::stream<float>& scale_half23_stream
) {
#pragma HLS INLINE off
    if (preprocess_mode == INT4_PREPROCESS_RMS) {
        int4_rmsnorm_quantize_pair_halves_4pe(
            rms_input_pe0, rms_input_pe1,
            rms_input_pe2, rms_input_pe3,
            gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
            true,
            quantized_half01_stream, scale_half01_stream,
            quantized_half23_stream, scale_half23_stream);
    } else if (preprocess_mode == INT4_PREPROCESS_ATTENTION) {
        int4_forward_attention_pair_halves(
            attention_quantized_half01_stream,
            attention_scale_half01_stream,
            attention_quantized_half23_stream,
            attention_scale_half23_stream,
            quantized_half01_stream, scale_half01_stream,
            quantized_half23_stream, scale_half23_stream);
    } else if (preprocess_mode == INT4_PREPROCESS_SWIGLU) {
        int4_swiglu_quantize_pair_halves_4pe(
            gate_pe0, gate_pe1, gate_pe2, gate_pe3,
            up_pe0, up_pe1, up_pe2, up_pe3,
            true,
            quantized_half01_stream, scale_half01_stream,
            quantized_half23_stream, scale_half23_stream);
    }
}

template <int FIRST_PE>
static void int4_exchange_activation_half_body(
    hls::stream<int4_quant_word_t>& quantized_half,
    hls::stream<float>& scale_half,
    hls::stream<int4_quant_word_t>& quantized_local,
    hls::stream<float>& scale_local,
    hls::stream<int4_activation_beat_t>& quantized_remote,
    hls::stream<float>& scale_remote,
    bool run,
    int input_tiles
) {
#pragma HLS INLINE
    if (!run) {
        return;
    }
exchange_activation_half_tile_loop:
    for (int global_tile = FIRST_PE;
         global_tile < input_tiles;
         global_tile += INT4_PE_COUNT) {
    exchange_activation_half_first_group_loop:
        for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
#pragma HLS LOOP_FLATTEN off
            const int4_quant_word_t q = quantized_half.read();
            const float sx = scale_half.read();
            quantized_local.write(q);
            scale_local.write(sx);
            scale_remote.write(sx);
            int4_quant_word_t remaining = q;
        exchange_activation_half_first_beat_loop:
            for (int beat = 0;
                 beat < INT4_ACTIVATION_BEATS_PER_WORD;
                 ++beat) {
#pragma HLS PIPELINE II=1
                // A variable part-select synthesizes a 480-bit barrel mux
                // (2.515 ns in the 300 MHz HLS schedule).  A constant shift
                // makes every stage a fixed wiring permutation instead.
                quantized_remote.write(
                    (int4_activation_beat_t)remaining.range(
                        INT4_ACTIVATION_BEAT_BITS - 1, 0));
                remaining >>= INT4_ACTIVATION_BEAT_BITS;
            }
        }
        const int second_tile = global_tile + 1;
        if (second_tile < input_tiles) {
        exchange_activation_half_second_group_loop:
            for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
#pragma HLS LOOP_FLATTEN off
                const int4_quant_word_t q = quantized_half.read();
                const float sx = scale_half.read();
                quantized_local.write(q);
                scale_local.write(sx);
                scale_remote.write(sx);
                int4_quant_word_t remaining = q;
            exchange_activation_half_second_beat_loop:
                for (int beat = 0;
                     beat < INT4_ACTIVATION_BEATS_PER_WORD;
                     ++beat) {
#pragma HLS PIPELINE II=1
                    quantized_remote.write(
                        (int4_activation_beat_t)remaining.range(
                            INT4_ACTIVATION_BEAT_BITS - 1, 0));
                    remaining >>= INT4_ACTIVATION_BEAT_BITS;
                }
            }
        }
    }
}

static void int4_exchange_activation_half_pair01(
    hls::stream<int4_quant_word_t>& quantized_half01,
    hls::stream<float>& scale_half01,
    hls::stream<int4_quant_word_t>& quantized_half01_local,
    hls::stream<float>& scale_half01_local,
    hls::stream<int4_activation_beat_t>& quantized_half01_to23,
    hls::stream<float>& scale_half01_to23,
    bool run,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_exchange_activation_half_body<0>(
        quantized_half01, scale_half01,
        quantized_half01_local, scale_half01_local,
        quantized_half01_to23, scale_half01_to23,
        run, input_tiles);
}

static void int4_exchange_activation_half_pair23(
    hls::stream<int4_quant_word_t>& quantized_half23,
    hls::stream<float>& scale_half23,
    hls::stream<int4_quant_word_t>& quantized_half23_local,
    hls::stream<float>& scale_half23_local,
    hls::stream<int4_activation_beat_t>& quantized_half23_to01,
    hls::stream<float>& scale_half23_to01,
    bool run,
    int input_tiles
) {
#pragma HLS INLINE off
    int4_exchange_activation_half_body<2>(
        quantized_half23, scale_half23,
        quantized_half23_local, scale_half23_local,
        quantized_half23_to01, scale_half23_to01,
        run, input_tiles);
}

static void int4_assemble_activation_pair01(
    hls::stream<int4_quant_word_t>& quantized_half01_local,
    hls::stream<float>& scale_half01_local,
    hls::stream<int4_activation_beat_t>& quantized_half23_to01,
    hls::stream<float>& scale_half23_to01,
    hls::stream<int4_quant_word_t>& quantized_pair01_stream,
    hls::stream<float>& scale_pair01_stream,
    bool run,
    int input_tiles
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }
assemble_activation_pair01_tile_loop:
    for (int tile = 0; tile < input_tiles; ++tile) {
    assemble_activation_pair01_group_loop:
        for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
#pragma HLS LOOP_FLATTEN off
            if ((tile & 3) < 2) {
                quantized_pair01_stream.write(
                    quantized_half01_local.read());
                scale_pair01_stream.write(scale_half01_local.read());
            } else {
                int4_quant_word_t q = 0;
            assemble_activation_pair01_remote_beat_loop:
                for (int beat = 0;
                     beat < INT4_ACTIVATION_BEATS_PER_WORD;
                     ++beat) {
#pragma HLS PIPELINE II=1
                    const int4_activation_beat_t beat_value =
                        quantized_half23_to01.read();
                    q >>= INT4_ACTIVATION_BEAT_BITS;
                    q.range(
                        INT4_QUANT_WORD_BITS - 1,
                        INT4_QUANT_WORD_BITS -
                            INT4_ACTIVATION_BEAT_BITS) = beat_value;
                }
                quantized_pair01_stream.write(q);
                scale_pair01_stream.write(scale_half23_to01.read());
            }
        }
    }
}

static void int4_assemble_activation_pair23(
    hls::stream<int4_activation_beat_t>& quantized_half01_to23,
    hls::stream<float>& scale_half01_to23,
    hls::stream<int4_quant_word_t>& quantized_half23_local,
    hls::stream<float>& scale_half23_local,
    hls::stream<int4_quant_word_t>& quantized_pair23_stream,
    hls::stream<float>& scale_pair23_stream,
    bool run,
    int input_tiles
) {
#pragma HLS INLINE off
    if (!run) {
        return;
    }
assemble_activation_pair23_tile_loop:
    for (int tile = 0; tile < input_tiles; ++tile) {
    assemble_activation_pair23_group_loop:
        for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
#pragma HLS LOOP_FLATTEN off
            if ((tile & 3) < 2) {
                int4_quant_word_t q = 0;
            assemble_activation_pair23_remote_beat_loop:
                for (int beat = 0;
                     beat < INT4_ACTIVATION_BEATS_PER_WORD;
                     ++beat) {
#pragma HLS PIPELINE II=1
                    const int4_activation_beat_t beat_value =
                        quantized_half01_to23.read();
                    q >>= INT4_ACTIVATION_BEAT_BITS;
                    q.range(
                        INT4_QUANT_WORD_BITS - 1,
                        INT4_QUANT_WORD_BITS -
                            INT4_ACTIVATION_BEAT_BITS) = beat_value;
                }
                quantized_pair23_stream.write(q);
                scale_pair23_stream.write(scale_half01_to23.read());
            } else {
                quantized_pair23_stream.write(
                    quantized_half23_local.read());
                scale_pair23_stream.write(scale_half23_local.read());
            }
        }
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
    int4_quant_word_t* activation_q_pair01,
    int4_scale_word_t* activation_scale_pair01,
    int4_quant_word_t* activation_q_pair23,
    int4_scale_word_t* activation_scale_pair23,
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
    hls::stream<int4_quant_word_t>& attention_quantized_half01_stream,
    hls::stream<float>& attention_scale_half01_stream,
    hls::stream<int4_quant_word_t>& attention_quantized_half23_stream,
    hls::stream<float>& attention_scale_half23_stream,
    int preprocess_mode,
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset
) {
#pragma HLS INLINE off
    // This is an explicit producer/FIFO/consumer architecture.  Do not let
    // HLS synthesize a combinational ap_start/ap_ready propagation chain
    // across the nested SwiGLU engines and the outer controller FSM.
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_quant_word_t> quantized_half01_stream;
    hls::stream<float> scale_half01_stream;
    hls::stream<int4_quant_word_t> quantized_half23_stream;
    hls::stream<float> scale_half23_stream;
    hls::stream<int4_quant_word_t> quantized_half01_local;
    hls::stream<float> scale_half01_local;
    hls::stream<int4_activation_beat_t> quantized_half01_to23;
    hls::stream<float> scale_half01_to23;
    hls::stream<int4_quant_word_t> quantized_half23_local;
    hls::stream<float> scale_half23_local;
    hls::stream<int4_activation_beat_t> quantized_half23_to01;
    hls::stream<float> scale_half23_to01;
    hls::stream<int4_quant_word_t> quantized_pair01_stream;
    hls::stream<float> scale_pair01_stream;
    hls::stream<int4_quant_word_t> quantized_pair23_stream;
    hls::stream<float> scale_pair23_stream;
    const bool stream_activation =
        preprocess_mode != INT4_PREPROCESS_NONE;
    const int input_tiles =
        preprocess_mode == INT4_PREPROCESS_SWIGLU
            ? INT4_HIDDEN_DIM / INT4_TILE_ROWS
            : INT4_DIM / INT4_TILE_ROWS;
    // Only Q and GATE are consumed twice (Q->K/V and GATE->UP).  Attention,
    // SwiGLU and final RMSNorm feed their next projection exactly once, so
    // suppress the former shared activation BRAM write/read round trip.
    const bool cache_stream_activation =
        stream_activation &&
        (linear_mode == INT4_LINEAR_Q ||
         linear_mode == INT4_LINEAR_GATE);
#pragma HLS STREAM variable=quantized_half01_stream depth=2
#pragma HLS STREAM variable=quantized_half23_stream depth=2
#pragma HLS STREAM variable=scale_half01_stream depth=2
#pragma HLS STREAM variable=scale_half23_stream depth=2
#pragma HLS STREAM variable=quantized_half01_local depth=8
#pragma HLS STREAM variable=quantized_half01_to23 depth=128
#pragma HLS STREAM variable=quantized_half23_local depth=8
#pragma HLS STREAM variable=quantized_half23_to01 depth=128
#pragma HLS STREAM variable=scale_half01_local depth=8
#pragma HLS STREAM variable=scale_half01_to23 depth=8
#pragma HLS STREAM variable=scale_half23_local depth=8
#pragma HLS STREAM variable=scale_half23_to01 depth=8
#pragma HLS STREAM variable=quantized_pair01_stream depth=4
#pragma HLS STREAM variable=quantized_pair23_stream depth=4
#pragma HLS STREAM variable=scale_pair01_stream depth=4
#pragma HLS STREAM variable=scale_pair23_stream depth=4
    // These two 480-bit ingress FIFOs sit on the producer/consumer boundary.
    // A LUTRAM implementation makes full_n drive the write-enable cone of
    // every distributed-RAM slice.  In the routed U250 checkpoint that cone
    // accounted for 177 of the 500 worst setup paths and more than 90% of its
    // delay was routing.  Use BRAM here to collapse the wide enable cone; the
    // Pair-local queues use BRAM as well.  The ingress queues need only the
    // mandatory two-slot DATAFLOW elasticity: reducing depth eight to two
    // removes the pointer bits that appeared on the routed critical paths
    // without changing the steady-state service rate.  The queues that cross
    // SLR1/SLR2 are serialized to 16x30-bit beats; depth 128 preserves the
    // same eight-word elasticity without routing a 480-wire bundle through
    // the SLL columns.
#pragma HLS BIND_STORAGE variable=quantized_half01_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_half23_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_half01_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_half01_to23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_half23_local type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_half23_to01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pair01_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=quantized_pair23_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=scale_half01_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half23_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half01_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half01_to23 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half23_local type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_half23_to01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair01_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=scale_pair23_stream type=fifo impl=srl

    int4_preprocess_activation_pair_halves(
        preprocess_mode,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        attention_quantized_half01_stream,
        attention_scale_half01_stream,
        attention_quantized_half23_stream,
        attention_scale_half23_stream,
        quantized_half01_stream, scale_half01_stream,
        quantized_half23_stream, scale_half23_stream);
    int4_exchange_activation_half_pair01(
        quantized_half01_stream, scale_half01_stream,
        quantized_half01_local, scale_half01_local,
        quantized_half01_to23, scale_half01_to23,
        stream_activation, input_tiles);
    int4_exchange_activation_half_pair23(
        quantized_half23_stream, scale_half23_stream,
        quantized_half23_local, scale_half23_local,
        quantized_half23_to01, scale_half23_to01,
        stream_activation, input_tiles);
    int4_assemble_activation_pair01(
        quantized_half01_local, scale_half01_local,
        quantized_half23_to01, scale_half23_to01,
        quantized_pair01_stream, scale_pair01_stream,
        stream_activation, input_tiles);
    int4_assemble_activation_pair23(
        quantized_half01_to23, scale_half01_to23,
        quantized_half23_local, scale_half23_local,
        quantized_pair23_stream, scale_pair23_stream,
        stream_activation, input_tiles);
    int4_linear_4pe_from_pair_streams_command(
        weight_bank0, weight_bank1,
        weight_bank2, weight_bank3,
        scale_bank0, scale_bank1,
        scale_bank2, scale_bank3,
        activation_q_pair01, activation_scale_pair01,
        activation_q_pair23, activation_scale_pair23,
        quantized_pair01_stream, scale_pair01_stream,
        quantized_pair23_stream, scale_pair23_stream,
        stream_activation, cache_stream_activation,
        output_pe0, output_pe1, output_pe2, output_pe3,
        linear_mode,
        weight_word_offset,
        weight_scale_word_offset);
}

// The decoder FSM ends at this registered descriptor.  Only this packet is
// allowed to enter the shared preprocess/linear hierarchy; the complete
// Int4Controller object must never be propagated into the PE datapaths.
//
//   [1:0]   preprocess mode
//   [4:2]   linear mode
//   [28:5]  PE-local weight-word offset
//   [39:29] PE-local scale-word offset
//   [52:40] norm-cache offset (used only by fused RMSNorm states)
using int4_dispatch_command_t = ap_uint<53>;
// SwiftKV receives its own narrow registered command.  Keeping layer and
// position out of the linear descriptor prevents the ordinary linear PE
// hierarchy from inheriting two unrelated high-fanout control fields.
using int4_swift_dispatch_command_t = ap_uint<18>;

static int4_dispatch_command_t int4_pack_dispatch_command(
    ap_uint<2> preprocess_mode,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset,
    ap_uint<13> norm_word_offset
) {
#pragma HLS INLINE
    int4_dispatch_command_t command = 0;
    command.range(1, 0) = preprocess_mode;
    command.range(4, 2) = linear_mode;
    command.range(28, 5) = weight_word_offset;
    command.range(39, 29) = weight_scale_word_offset;
    command.range(52, 40) = norm_word_offset;
    return command;
}

static int4_swift_dispatch_command_t int4_pack_swift_dispatch_command(
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE
    int4_swift_dispatch_command_t command = 0;
    command.range(5, 0) = layer_index;
    command.range(17, 6) = position;
    return command;
}

// Keep every operation in the outer DATAFLOW region as an explicit process.
// Besides satisfying the canonical DATAFLOW form, this producer is the only
// process driven directly by the global decoder state; the wide linear and
// SwiftKV hierarchies start from registered FIFO commands.
static void int4_emit_dispatch_commands(
    hls::stream<int4_dispatch_command_t>& command_stream,
    hls::stream<int4_swift_dispatch_command_t>& swift_command_stream,
    int preprocess_mode,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset,
    ap_uint<13> norm_word_offset,
    ap_uint<6> layer_index,
    ap_uint<12> position
) {
#pragma HLS INLINE off
    command_stream.write(int4_pack_dispatch_command(
        (ap_uint<2>)preprocess_mode,
        linear_mode,
        weight_word_offset,
        weight_scale_word_offset,
        norm_word_offset));
    swift_command_stream.write(
        int4_pack_swift_dispatch_command(layer_index, position));
}

// Select the projection before entering the wide copy loop.  Keeping all four
// PEs and seven destinations under one dispatcher FSM state made that state
// drive more than 12k RAM-port loads.  ROUTE_ID specializes each local loop so
// its datapath terminates at exactly one destination RAM in the owning SLR.
template <int ROUTE_ID>
static void int4_route_linear_projection_pe_body(
    const int4_output_word_t* linear_stage,
    int4_output_word_t* output
) {
#pragma HLS INLINE

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
        output[word] = linear_stage[word];
    }
}

template <int PE_ID>
static void int4_route_projection_local_pe(
    const int4_output_word_t* linear_stage,
    int4_output_word_t* q,
    int4_output_word_t* k,
    int4_output_word_t* v,
    int4_output_word_t* residual,
    int4_output_word_t* gate,
    int4_output_word_t* up,
    int4_output_word_t* logits,
    hls::stream<ap_uint<3> >& start_token,
    hls::stream<ap_uint<3> >& done_token
) {
#pragma HLS INLINE off
    // Mode is registered at this PE boundary.  No central mode decoder drives
    // destination selects in more than one SLR.
    const ap_uint<3> mode = start_token.read();
    switch ((int)mode) {
    case INT4_LINEAR_Q:
        int4_route_linear_projection_pe_body<INT4_LINEAR_Q>(linear_stage, q);
        break;
    case INT4_LINEAR_K:
        int4_route_linear_projection_pe_body<INT4_LINEAR_K>(linear_stage, k);
        break;
    case INT4_LINEAR_V:
        int4_route_linear_projection_pe_body<INT4_LINEAR_V>(linear_stage, v);
        break;
    case INT4_LINEAR_GATE:
        int4_route_linear_projection_pe_body<INT4_LINEAR_GATE>(linear_stage, gate);
        break;
    case INT4_LINEAR_UP:
        int4_route_linear_projection_pe_body<INT4_LINEAR_UP>(linear_stage, up);
        break;
    case INT4_LINEAR_LOGITS:
        int4_route_linear_projection_pe_body<INT4_LINEAR_LOGITS>(linear_stage, logits);
        break;
    case INT4_LINEAR_O:
    case INT4_LINEAR_DOWN:
    default:
        int4_route_linear_projection_pe_body<INT4_LINEAR_DOWN>(
            linear_stage, residual);
        break;
    }
    done_token.write(mode);
}

template <int PE_ID>
static void int4_seed_linear_stage_pe(
    const int4_output_word_t* residual,
    int4_output_word_t* linear_stage
) {
#pragma HLS INLINE off

seed_linear_stage_pe_word_loop:
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
#pragma HLS PIPELINE II=1
        linear_stage[word] = residual[word];
    }
}

static void int4_seed_linear_stages_4pe(
    const int4_output_word_t* residual_pe0,
    const int4_output_word_t* residual_pe1,
    const int4_output_word_t* residual_pe2,
    const int4_output_word_t* residual_pe3,
    int4_output_word_t* linear_stage0,
    int4_output_word_t* linear_stage1,
    int4_output_word_t* linear_stage2,
    int4_output_word_t* linear_stage3
) {
#pragma HLS INLINE off
    // A DATAFLOW wrapper around four independent copies generated a global
    // ap_done/ap_sync join spanning SLR3 -> SLR0 -> SLR2 -> SLR0.  The copy is
    // only 64 words per PE and is negligible beside GEMV, so serialize these
    // calls and let each function boundary register completion locally.
    int4_seed_linear_stage_pe<0>(residual_pe0, linear_stage0);
    int4_seed_linear_stage_pe<1>(residual_pe1, linear_stage1);
    int4_seed_linear_stage_pe<2>(residual_pe2, linear_stage2);
    int4_seed_linear_stage_pe<3>(residual_pe3, linear_stage3);
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
    int4_quant_word_t* activation_q_pair01,
    int4_scale_word_t* activation_scale_pair01,
    int4_quant_word_t* activation_q_pair23,
    int4_scale_word_t* activation_scale_pair23,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS],
    hls::stream<int4_dispatch_command_t>& command_stream,
    hls::stream<int4_swift_dispatch_command_t>& swift_command_stream,
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
    int4_output_word_t* logits_pe3
) {
#pragma HLS INLINE off
    const int4_dispatch_command_t command = command_stream.read();
    const int preprocess_mode = (int)command.range(1, 0);
    const ap_uint<3> linear_mode = command.range(4, 2);
    const ap_uint<24> weight_word_offset = command.range(28, 5);
    const ap_uint<11> weight_scale_word_offset = command.range(39, 29);
    const ap_uint<13> norm_word_offset = command.range(52, 40);
    const int4_swift_dispatch_command_t swift_command =
        swift_command_stream.read();
    const ap_uint<6> layer_index = swift_command.range(5, 0);
    const ap_uint<12> position = swift_command.range(17, 6);
    const int mode = (int)linear_mode;
    const bool fuse_residual =
        mode == INT4_LINEAR_O || mode == INT4_LINEAR_DOWN;
    // SwiftKV and the O projection share the same per-PE AXI master.  Vitis
    // HLS therefore cannot legally run their m_axi readers as two concurrent
    // DATAFLOW processes.  Buffer exactly one 4096-value attention vector in
    // registered FIFOs, then let the common producer/linear DATAFLOW drain
    // it.  This removes the addressable global activation gather while
    // preserving the mandatory KV-before-weight AXI ordering.
    hls::stream<int4_quant_word_t> attention_quantized_half01_stream;
    hls::stream<float> attention_scale_half01_stream;
    hls::stream<int4_quant_word_t> attention_quantized_half23_stream;
    hls::stream<float> attention_scale_half23_stream;
#pragma HLS STREAM variable=attention_quantized_half01_stream depth=INT4_GROUPS_PER_VECTOR/2
#pragma HLS STREAM variable=attention_scale_half01_stream depth=INT4_GROUPS_PER_VECTOR/2
#pragma HLS STREAM variable=attention_quantized_half23_stream depth=INT4_GROUPS_PER_VECTOR/2
#pragma HLS STREAM variable=attention_scale_half23_stream depth=INT4_GROUPS_PER_VECTOR/2
#pragma HLS BIND_STORAGE variable=attention_quantized_half01_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=attention_scale_half01_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=attention_quantized_half23_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=attention_scale_half23_stream type=fifo impl=bram
    if (preprocess_mode == INT4_PREPROCESS_ATTENTION) {
        int4_swiftkv_attention_4pe_pair_halves_command(
            q_pe0, q_pe1, q_pe2, q_pe3,
            k_pe0, k_pe1, k_pe2, k_pe3,
            v_pe0, v_pe1, v_pe2, v_pe3,
            kv_cache_pe0, kv_cache_pe1,
            kv_cache_pe2, kv_cache_pe3,
            current_cos_pair01, current_sin_pair01,
            current_cos_pair23, current_sin_pair23,
            attention_quantized_half01_stream,
            attention_scale_half01_stream,
            attention_quantized_half23_stream,
            attention_scale_half23_stream,
            layer_index, position);
    }

    // O and DOWN add their branch output to the current residual.  Keep the
    // source in the fixed PE-local staging RAM so the linear core never sees a
    // run-time-selected memory pointer.
    if (fuse_residual) {
        int4_seed_linear_stages_4pe(
            residual_pe0, residual_pe1,
            residual_pe2, residual_pe3,
            linear_stage0, linear_stage1,
            linear_stage2, linear_stage3);
    }

    int4_run_preprocess_and_linear(
        weight_bank0, weight_bank1,
        weight_bank2, weight_bank3,
        scale_bank0, scale_bank1,
        scale_bank2, scale_bank3,
        activation_q_pair01, activation_scale_pair01,
        activation_q_pair23, activation_scale_pair23,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0 + (int)norm_word_offset,
        gamma_pe1 + (int)norm_word_offset,
        gamma_pe2 + (int)norm_word_offset,
        gamma_pe3 + (int)norm_word_offset,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        attention_quantized_half01_stream,
        attention_scale_half01_stream,
        attention_quantized_half23_stream,
        attention_scale_half23_stream,
        preprocess_mode,
        linear_stage0, linear_stage1,
        linear_stage2, linear_stage3,
        linear_mode,
        weight_word_offset,
        weight_scale_word_offset);

    // Serialize only the short staging copy with a registered 3-bit token.
    // Each PE receives and decodes its own mode, writes only its local RAMs,
    // then forwards the token to the next adjacent SLR.
    hls::stream<ap_uint<3> > route_token0;
    hls::stream<ap_uint<3> > route_token1;
    hls::stream<ap_uint<3> > route_token2;
    hls::stream<ap_uint<3> > route_token3;
    hls::stream<ap_uint<3> > route_token4;
#pragma HLS STREAM variable=route_token0 depth=2
#pragma HLS STREAM variable=route_token1 depth=2
#pragma HLS STREAM variable=route_token2 depth=2
#pragma HLS STREAM variable=route_token3 depth=2
#pragma HLS STREAM variable=route_token4 depth=2
#pragma HLS BIND_STORAGE variable=route_token0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=route_token1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=route_token2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=route_token3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=route_token4 type=fifo impl=srl
    route_token0.write(linear_mode);
    int4_route_projection_local_pe<0>(
        linear_stage0, q_pe0, k_pe0, v_pe0, residual_pe0,
        gate_pe0, up_pe0, logits_pe0, route_token0, route_token1);
    int4_route_projection_local_pe<1>(
        linear_stage1, q_pe1, k_pe1, v_pe1, residual_pe1,
        gate_pe1, up_pe1, logits_pe1, route_token1, route_token2);
    int4_route_projection_local_pe<2>(
        linear_stage2, q_pe2, k_pe2, v_pe2, residual_pe2,
        gate_pe2, up_pe2, logits_pe2, route_token2, route_token3);
    int4_route_projection_local_pe<3>(
        linear_stage3, q_pe3, k_pe3, v_pe3, residual_pe3,
        gate_pe3, up_pe3, logits_pe3, route_token3, route_token4);
    const ap_uint<3> completed_mode = route_token4.read();
    if (completed_mode != linear_mode) {
        return;
    }
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
    int4_quant_word_t* activation_q_pair01,
    int4_scale_word_t* activation_scale_pair01,
    int4_quant_word_t* activation_q_pair23,
    int4_scale_word_t* activation_scale_pair23,
    const int4_output_word_t* rms_input_pe0,
    const int4_output_word_t* rms_input_pe1,
    const int4_output_word_t* rms_input_pe2,
    const int4_output_word_t* rms_input_pe3,
    const int4_output_word_t* gamma_pe0,
    const int4_output_word_t* gamma_pe1,
    const int4_output_word_t* gamma_pe2,
    const int4_output_word_t* gamma_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3,
    const swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS],
    const swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS],
    int preprocess_mode,
    ap_uint<3> linear_mode,
    ap_uint<24> weight_word_offset,
    ap_uint<11> weight_scale_word_offset,
    ap_uint<13> norm_word_offset,
    ap_uint<6> layer_index,
    ap_uint<12> position,
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
    int4_output_word_t* logits_pe3
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_dispatch_command_t> command_stream;
    hls::stream<int4_swift_dispatch_command_t> swift_command_stream;
#pragma HLS STREAM variable=command_stream depth=2
#pragma HLS STREAM variable=swift_command_stream depth=2
#pragma HLS BIND_STORAGE variable=command_stream type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=swift_command_stream type=fifo impl=srl

    int4_emit_dispatch_commands(
        command_stream,
        swift_command_stream,
        preprocess_mode,
        linear_mode,
        weight_word_offset,
        weight_scale_word_offset,
        norm_word_offset,
        layer_index,
        position);
    int4_execute_dispatch_linear(
        weight_bank0, weight_bank1,
        weight_bank2, weight_bank3,
        scale_bank0, scale_bank1,
        scale_bank2, scale_bank3,
        activation_q_pair01, activation_scale_pair01,
        activation_q_pair23, activation_scale_pair23,
        rms_input_pe0, rms_input_pe1,
        rms_input_pe2, rms_input_pe3,
        gamma_pe0, gamma_pe1, gamma_pe2, gamma_pe3,
        kv_cache_pe0, kv_cache_pe1,
        kv_cache_pe2, kv_cache_pe3,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23,
        command_stream, swift_command_stream,
        linear_stage0, linear_stage1,
        linear_stage2, linear_stage3,
        q_pe0, q_pe1, q_pe2, q_pe3,
        k_pe0, k_pe1, k_pe2, k_pe3,
        v_pe0, v_pe1, v_pe2, v_pe3,
        residual_pe0, residual_pe1,
        residual_pe2, residual_pe3,
        gate_pe0, gate_pe1, gate_pe2, gate_pe3,
        up_pe0, up_pe1, up_pe2, up_pe3,
        logits_pe0, logits_pe1, logits_pe2, logits_pe3);
}

template <int PE_ID>
static void int4_preload_model_prefix_pe(
    const int4_weight_word_t* model_bank,
    int4_weight_scale_word_t
        scale_cache[INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE],
    int4_output_word_t
        norm_cache[INT4_TOTAL_NORM_WORDS_PER_PE]
) {
#pragma HLS INLINE off

    // Split the scale and norm ranges into fixed-destination bursts.  The
    // routed DCP showed ap_block_pp0_stage0_subdone with about 700 sinks in
    // two preload PEs because the old loop condition selected between two
    // 512-bit memories on every beat.
preload_model_scale_pe_word_loop:
    for (int word = 0;
         word < INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1 style=frp
        const int4_weight_word_t value = model_bank[word];
        scale_cache[word] = value;
    }

preload_model_norm_pe_word_loop:
    for (int norm_word = 0;
         norm_word < INT4_TOTAL_NORM_WORDS_PER_PE;
         ++norm_word) {
#pragma HLS PIPELINE II=1 style=frp
        const int4_weight_word_t value = model_bank[
            INT4_MODEL_NORM_BASE_WORD + norm_word];
        norm_cache[norm_word] = value;
    }
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
    // Keep the four AXI engines as separate functions, but do not combine
    // their completion pins in a cross-SLR DATAFLOW control cone.  Preload is
    // performed once per invocation, so registered sequential completion is
    // a small latency cost and a large routing win.
    int4_preload_model_prefix_pe<0>(
        model_bank0, scale_cache0, norm_cache0);
    int4_preload_model_prefix_pe<1>(
        model_bank1, scale_cache1, norm_cache1);
    int4_preload_model_prefix_pe<2>(
        model_bank2, scale_cache2, norm_cache2);
    int4_preload_model_prefix_pe<3>(
        model_bank3, scale_cache3, norm_cache3);
}

template <int PE_ID>
static void int4_load_residual_pe(
    const int4_output_word_t* residual_pe,
    int4_output_word_t residual_buffer[INT4_VECTOR_WORDS_PER_PE]
) {
#pragma HLS INLINE off

load_residual_pe_word_loop:
    for (int word = 0;
         word < INT4_VECTOR_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1 style=frp
        residual_buffer[word] = residual_pe[word];
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
    // Avoid the four-way ap_ready/ap_done cone seen in the failed DCP.
    int4_load_residual_pe<0>(residual_pe0, residual_buffer0);
    int4_load_residual_pe<1>(residual_pe1, residual_buffer1);
    int4_load_residual_pe<2>(residual_pe2, residual_buffer2);
    int4_load_residual_pe<3>(residual_pe3, residual_buffer3);
}

template <int PE_ID>
static void int4_store_residual_pe(
    const int4_output_word_t
        residual_buffer[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t* residual_pe
) {
#pragma HLS INLINE off

store_residual_pe_word_loop:
    for (int word = 0;
         word < INT4_VECTOR_WORDS_PER_PE;
         ++word) {
#pragma HLS PIPELINE II=1 style=frp
        residual_pe[word] = residual_buffer[word];
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
    // Avoid the four-way ap_ready/ap_done cone seen in the failed DCP.
    int4_store_residual_pe<0>(residual_buffer0, residual_pe0);
    int4_store_residual_pe<1>(residual_buffer1, residual_pe1);
    int4_store_residual_pe<2>(residual_buffer2, residual_pe2);
    int4_store_residual_pe<3>(residual_buffer3, residual_pe3);
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
    // Two outstanding 256-beat reads cover the declared 64-cycle latency
    // without building the former eight-burst AXI read window.  This shrinks
    // bus_read/fifo_burst control and buffering on every local DDR master.
    // Allow only one write transaction per DDR master.  The routed gmem0/1/2
    // write-FIFO push controls had 1,170 sinks; two outstanding writes duplicated
    // the 512-bit buffering cone without helping these sequential writers.
#pragma HLS INTERFACE m_axi port=model_bank0 bundle=gmem0 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=rope_lut_ddr bundle=gmem0 offset=slave \
    depth=SWIFTKV_ROPE_DDR_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=residual_pe0 bundle=gmem0 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=logits_pe0 bundle=gmem0 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=kv_cache_pe0 bundle=gmem0 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=model_bank1 bundle=gmem1 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=residual_pe1 bundle=gmem1 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=logits_pe1 bundle=gmem1 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=kv_cache_pe1 bundle=gmem1 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=model_bank2 bundle=gmem2 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=residual_pe2 bundle=gmem2 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=logits_pe2 bundle=gmem2 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=kv_cache_pe2 bundle=gmem2 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1

#pragma HLS INTERFACE m_axi port=model_bank3 bundle=gmem3 offset=slave \
    depth=INT4_MODEL_WORDS_PER_DDR \
    latency=64 max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=residual_pe3 bundle=gmem3 offset=slave \
    depth=INT4_VECTOR_WORDS_PER_PE latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=logits_pe3 bundle=gmem3 offset=slave \
    depth=INT4_MAX_LOCAL_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port=kv_cache_pe3 bundle=gmem3 offset=slave \
    depth=SWIFTKV_KV_AXI_DEPTH latency=64 \
    max_read_burst_length=256 max_write_burst_length=64 \
    num_read_outstanding=2 num_write_outstanding=1

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
#pragma HLS BIND_STORAGE variable=residual_buffer0 type=ram_2p impl=bram latency=2
#pragma HLS BIND_STORAGE variable=residual_buffer1 type=ram_2p impl=bram latency=2
#pragma HLS BIND_STORAGE variable=residual_buffer2 type=ram_2p impl=bram latency=2
#pragma HLS BIND_STORAGE variable=residual_buffer3 type=ram_2p impl=bram latency=2
#pragma HLS BIND_STORAGE variable=linear_stage0 type=ram_2p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=linear_stage1 type=ram_2p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=linear_stage2 type=ram_2p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=linear_stage3 type=ram_2p impl=uram latency=2

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
#pragma HLS BIND_STORAGE variable=model_scale_cache0 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_scale_cache1 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_scale_cache2 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_scale_cache3 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_norm_cache0 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_norm_cache1 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_norm_cache2 type=ram_1p impl=uram latency=2
#pragma HLS BIND_STORAGE variable=model_norm_cache3 type=ram_1p impl=uram latency=2

    // Keep one replay cache in each pair island.  This costs one extra copy
    // of the compact A15/G32 activation but removes the last shared BRAM read
    // and its 480-bit Q->K/V or GATE->UP return path across SLR1/SLR2.
    int4_quant_word_t activation_q_pair01[INT4_MAX_INPUT_GROUPS];
    int4_scale_word_t
        activation_scale_pair01[INT4_MAX_ACTIVATION_SCALE_WORDS];
    int4_quant_word_t activation_q_pair23[INT4_MAX_INPUT_GROUPS];
    int4_scale_word_t
        activation_scale_pair23[INT4_MAX_ACTIVATION_SCALE_WORDS];
#pragma HLS BIND_STORAGE variable=activation_q_pair01 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pair01 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=activation_q_pair23 type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_pair23 type=ram_1p impl=bram

    // The complete 4096-position table is packed offline as two 512-bit DDR
    // words per 608-bit row.  It shares gmem0, so the whole design still owns
    // exactly four AXI masters.  Both RoPE and the model scale/norm prefix are
    // persistent across token invocations and are fetched only at sequence
    // start.  From token one onward prefix traffic disappears; each bank
    // alternates only between its long INT4 weight bursts and the mandatory
    // compressed-KV/residual/logit transactions selected by the controller.
    static swiftkv_rope_lut_word_t
        rope_lut_bank0[SWIFTKV_ROPE_BANK_WORDS];
    static swiftkv_rope_lut_word_t
        rope_lut_bank1[SWIFTKV_ROPE_BANK_WORDS];
    static swiftkv_rope_lut_word_t
        rope_lut_bank2[SWIFTKV_ROPE_BANK_WORDS];
    static swiftkv_rope_lut_word_t
        rope_lut_bank3[SWIFTKV_ROPE_BANK_WORDS];
    swiftkv_rope_raw_t current_cos_pair01[SWIFTKV_ROPE_PAIRS];
    swiftkv_rope_raw_t current_sin_pair01[SWIFTKV_ROPE_PAIRS];
    swiftkv_rope_raw_t current_cos_pair23[SWIFTKV_ROPE_PAIRS];
    swiftkv_rope_raw_t current_sin_pair23[SWIFTKV_ROPE_PAIRS];
#pragma HLS BIND_STORAGE variable=rope_lut_bank0 type=ram_1p impl=uram latency=3
#pragma HLS BIND_STORAGE variable=rope_lut_bank1 type=ram_1p impl=uram latency=3
#pragma HLS BIND_STORAGE variable=rope_lut_bank2 type=ram_1p impl=uram latency=3
#pragma HLS BIND_STORAGE variable=rope_lut_bank3 type=ram_1p impl=uram latency=3
#pragma HLS BIND_STORAGE variable=current_cos_pair01 type=ram_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=current_sin_pair01 type=ram_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=current_cos_pair23 type=ram_1p impl=lutram latency=1
#pragma HLS BIND_STORAGE variable=current_sin_pair23 type=ram_1p impl=lutram latency=1

    if (position == 0) {
        swiftkv_preload_rope_lut(
            rope_lut_ddr,
            rope_lut_bank0, rope_lut_bank1,
            rope_lut_bank2, rope_lut_bank3);
        int4_preload_model_prefix_4ddr(
            model_bank0, model_bank1, model_bank2, model_bank3,
            model_scale_cache0, model_scale_cache1,
            model_scale_cache2, model_scale_cache3,
            model_norm_cache0, model_norm_cache1,
            model_norm_cache2, model_norm_cache3);
    }
    swiftkv_load_rope_bank0(
        rope_lut_bank0, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
    swiftkv_load_rope_bank1(
        rope_lut_bank1, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
    swiftkv_load_rope_bank2(
        rope_lut_bank2, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
    swiftkv_load_rope_bank3(
        rope_lut_bank3, position,
        current_cos_pair01, current_sin_pair01,
        current_cos_pair23, current_sin_pair23);
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
        int preprocess_mode = INT4_PREPROCESS_NONE;
        int norm_offset = 0;
        bool dispatch_linear = false;
        if (controller.run_rmsnorm == INT4_RUN ||
            controller.run_linear == INT4_RUN ||
            controller.run_swiglu == INT4_RUN) {
            dispatch_linear = true;
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
        } else if (controller.run_rope == INT4_RUN) {
            // Hummingbird-style direct hand-off: SwiftKV's ordered G32
            // output stream is the activation producer for O projection in
            // the same DATAFLOW region.  No global attention-result buffer
            // is written and then reread by the linear broadcaster.
            preprocess_mode = INT4_PREPROCESS_ATTENTION;
            dispatch_linear = true;
            controller.run_rope = INT4_LAZY;
            controller.run_attention = INT4_LAZY;
            controller.run_linear = INT4_RUN;
            controller.linear_mode = INT4_LINEAR_O;
        }

        // One C++ call site is deliberate: HLS otherwise instantiates one
        // complete four-PE linear engine for the ordinary path and a second
        // copy for Attention->O.  The registered preprocess field selects
        // the producer while all projections reuse this single datapath.
        if (dispatch_linear) {
            int4_dispatch_linear_registered(
                weight_bank0, weight_bank1,
                weight_bank2, weight_bank3,
                scale_bank0, scale_bank1,
                scale_bank2, scale_bank3,
                activation_q_pair01, activation_scale_pair01,
                activation_q_pair23, activation_scale_pair23,
                residual_buffer0, residual_buffer1,
                residual_buffer2, residual_buffer3,
                norm_bank0, norm_bank1,
                norm_bank2, norm_bank3,
                kv_cache_pe0, kv_cache_pe1,
                kv_cache_pe2, kv_cache_pe3,
                current_cos_pair01, current_sin_pair01,
                current_cos_pair23, current_sin_pair23,
                preprocess_mode,
                (ap_uint<3>)controller.linear_mode,
                controller.weight_word_offset,
                controller.weight_scale_word_offset,
                (ap_uint<13>)norm_offset,
                controller.layer_index,
                controller.position,
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
                logits_pe2, logits_pe3);
            // The global controller is a dispatcher only.  It advances after
            // the registered local command has completed; no datapath module
            // receives or writes the global state object.
            int4_complete_linear_dispatch(controller);
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
