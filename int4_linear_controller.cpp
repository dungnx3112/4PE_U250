#include "int4_model_layout.hpp"

#include <cstdint>
#include <hls_stream.h>

union int4_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static float int4_bits_to_float(ap_uint<32> bits) {
#pragma HLS INLINE
    int4_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<32> int4_float_to_bits(float value) {
#pragma HLS INLINE
    int4_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static float int4_half_bits_to_float(ap_uint<16> bits) {
#pragma HLS INLINE
    const ap_uint<1> sign = bits[15];
    const ap_uint<5> exponent = bits.range(14, 10);
    const ap_uint<10> mantissa = bits.range(9, 0);
    ap_uint<32> fp32_bits = 0;

    if (exponent == 0) {
        if (mantissa == 0) {
            fp32_bits[31] = sign;
        } else {
            ap_uint<10> normalized = mantissa;
            ap_uint<4> shift = 0;
        half_normalize_loop:
            for (int bit = 9; bit >= 0; --bit) {
#pragma HLS UNROLL
                if (normalized[9] == 0) {
                    normalized <<= 1;
                    ++shift;
                }
            }
            fp32_bits[31] = sign;
            fp32_bits.range(30, 23) = (ap_uint<8>)(112 - (int)shift);
            fp32_bits.range(22, 13) = normalized.range(8, 0) << 1;
        }
    } else if (exponent == 31) {
        fp32_bits[31] = sign;
        fp32_bits.range(30, 23) = 0xff;
        fp32_bits.range(22, 13) = mantissa;
    } else {
        fp32_bits[31] = sign;
        fp32_bits.range(30, 23) =
            (ap_uint<8>)((int)exponent - 15 + 127);
        fp32_bits.range(22, 13) = mantissa;
    }
    return int4_bits_to_float(fp32_bits);
}

static ap_uint<32> int4_float_to_fxp_bits(float value) {
#pragma HLS INLINE
    const ap_uint<32> bits = int4_float_to_bits(value);
    const bool negative = bits[31];
    const ap_uint<8> exponent = bits.range(30, 23);
    const ap_uint<23> fraction = bits.range(22, 0);

    if (exponent == 0 || exponent < 109) {
        return 0;
    }
    if (exponent >= 141) {
        return negative
            ? (ap_uint<32>)0x80000000U
            : (ap_uint<32>)0x7fffffffU;
    }

    const ap_uint<24> significand =
        ((ap_uint<24>)1 << 23) | fraction;
    ap_uint<32> magnitude = 0;
    if (exponent >= 133) {
        magnitude =
            (ap_uint<32>)significand << (ap_uint<4>)(exponent - 133);
    } else {
        const ap_uint<5> right_shift = (ap_uint<5>)(133 - exponent);
        const ap_uint<24> quotient = significand >> right_shift;
        const ap_uint<25> remainder_mask =
            ((ap_uint<25>)1 << right_shift) - 1;
        const ap_uint<25> remainder =
            (ap_uint<25>)significand & remainder_mask;
        const ap_uint<25> halfway =
            (ap_uint<25>)1 << (right_shift - 1);
        const bool round_up =
            remainder > halfway ||
            (remainder == halfway && quotient[0]);
        magnitude =
            (ap_uint<32>)quotient + (round_up ? 1 : 0);
    }
    if (!negative) {
        return magnitude;
    }
    const ap_int<33> signed_raw = -(ap_int<33>)magnitude;
    return signed_raw.range(31, 0);
}

static ap_int<27> int4_pack_two_w4(
    int4_weight_t high,
    int4_weight_t low) {
#pragma HLS INLINE
    return ((ap_int<27>)high << 23) + (ap_int<27>)low;
}

static void int4_unpack_packed_acc(
    int4_packed_acc_t packed,
    int4_group_acc_t& high,
    int4_group_acc_t& low) {
#pragma HLS INLINE
    low = packed.range(22, 0);
    const int4_group_acc_t high_raw = packed.range(45, 23);
    high = (int4_group_acc_t)(
        (ap_int<24>)high_raw + (low[22] ? 1 : 0));
}

using int4_linear_command_t = ap_uint<64>;

static int4_linear_command_t int4_pack_linear_command(
    ap_uint<3> mode,
    ap_uint<24> weight_offset,
    ap_uint<16> scale_offset) {
#pragma HLS INLINE
    int output_tiles = 32;
    int local_input_tiles = 4;
    int local_output_tiles = 8;
    bool output_fxp = false;
    if (mode == INT4_LINEAR_GATE || mode == INT4_LINEAR_UP) {
        output_tiles = 88;
        local_output_tiles = 22;
    } else if (mode == INT4_LINEAR_DOWN) {
        local_input_tiles = 11;
    } else if (mode == INT4_LINEAR_LOGITS) {
        output_tiles = 252;
        local_output_tiles = 63;
    }
    if (mode == INT4_LINEAR_Q || mode == INT4_LINEAR_K ||
        mode == INT4_LINEAR_V) {
        output_fxp = true;
    }
    int4_linear_command_t command = 0;
    command.range(2, 0) = mode;
    command.range(26, 3) = weight_offset;
    command.range(42, 27) = scale_offset;
    command.range(50, 43) = output_tiles;
    command.range(54, 51) = local_input_tiles;
    command.range(60, 55) = local_output_tiles;
    command[61] = output_fxp;
    return command;
}

static int int4_command_output_tiles(int4_linear_command_t command) {
#pragma HLS INLINE
    return (int)command.range(50, 43);
}

static int int4_command_local_input_tiles(int4_linear_command_t command) {
#pragma HLS INLINE
    return (int)command.range(54, 51);
}

static int int4_command_local_output_tiles(int4_linear_command_t command) {
#pragma HLS INLINE
    return (int)command.range(60, 55);
}

static void int4_seed_linear_command_chain(
    ap_uint<3> mode,
    ap_uint<24> weight_offset,
    ap_uint<16> scale_offset,
    hls::stream<int4_linear_command_t>& command_pe0,
    hls::stream<int4_linear_command_t>& command_store0,
    hls::stream<int4_linear_command_t>& command_01) {
#pragma HLS INLINE off
#pragma HLS PIPELINE II=1
    const int4_linear_command_t command = int4_pack_linear_command(
        mode, weight_offset, scale_offset);
    command_pe0.write(command);
    command_store0.write(command);
    command_01.write(command);
}

template <int PAIR_ID>
static void int4_relay_pair_linear_command(
    hls::stream<int4_linear_command_t>& command_in,
    hls::stream<int4_linear_command_t>& command_local,
    hls::stream<int4_linear_command_t>& command_reduce,
    hls::stream<int4_linear_command_t>& command_finalize,
    hls::stream<int4_linear_command_t>& command_store,
    hls::stream<int4_linear_command_t>& command_out) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_in.read();
    command_local.write(command);
    command_reduce.write(command);
    command_finalize.write(command);
    command_store.write(command);
    command_out.write(command);
}

static void int4_terminate_linear_command(
    hls::stream<int4_linear_command_t>& command_in,
    hls::stream<int4_linear_command_t>& command_pe3,
    hls::stream<int4_linear_command_t>& command_store3) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_in.read();
    command_pe3.write(command);
    command_store3.write(command);
}

static void int4_split_local_command(
    hls::stream<int4_linear_command_t>& command_in,
    hls::stream<int4_linear_command_t>& reader_command,
    hls::stream<int4_linear_command_t>& compute_command) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_in.read();
    reader_command.write(command);
    compute_command.write(command);
}

template <int PE_ID>
static void int4_stream_local_weights(
    const int4_weight_word_t* weight_mem,
    hls::stream<int4_linear_command_t>& command_stream,
    hls::stream<int4_weight_word_t>& weight_stream) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_stream.read();
    const int output_tiles = int4_command_output_tiles(command);
    const int local_input_tiles = int4_command_local_input_tiles(command);
    const int total_words =
        output_tiles * local_input_tiles * INT4_WEIGHT_WORDS_PER_TILE;
    const int base = (int)command.range(26, 3);

stream_local_weight_loop:
    for (int word = 0; word < total_words; ++word) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=32768 max=258048
        weight_stream.write(weight_mem[base + word]);
    }
}

template <int PE_ID>
static void int4_compute_local_partials(
    const int4_weight_scale_word_t* scale_mem,
    const int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale[INT4_MAX_LOCAL_GROUPS],
    hls::stream<int4_linear_command_t>& command_stream,
    hls::stream<int4_weight_word_t>& weight_stream,
    hls::stream<int4_reduction_packet_t>& partial_stream) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_stream.read();
    const int output_tiles = int4_command_output_tiles(command);
    const int local_input_tiles = int4_command_local_input_tiles(command);
    const int scale_base = (int)command.range(42, 27);

    float partial[INT4_TILE_ROWS];
#pragma HLS ARRAY_PARTITION variable=partial cyclic factor=INT4_ROW_BLOCK
    int4_weight_scale_word_t packed_scales = 0;

local_partial_output_tile_loop:
    for (int output_tile = 0; output_tile < output_tiles; ++output_tile) {
#pragma HLS LOOP_TRIPCOUNT min=32 max=252
    local_partial_col_tile_loop:
        for (int local_col_tile = 0;
             local_col_tile < local_input_tiles;
             ++local_col_tile) {
#pragma HLS LOOP_TRIPCOUNT min=4 max=11
            const int matrix_tile =
                output_tile * local_input_tiles + local_col_tile;
            if ((matrix_tile & (INT4_WEIGHT_SCALES_PER_WORD - 1)) == 0) {
                packed_scales = scale_mem[
                    scale_base +
                    matrix_tile / INT4_WEIGHT_SCALES_PER_WORD];
            }
            const int scale_lane =
                matrix_tile & (INT4_WEIGHT_SCALES_PER_WORD - 1);
            const float weight_scale = int4_half_bits_to_float(
                packed_scales.range(
                    INT4_WEIGHT_SCALE_BITS * scale_lane +
                        INT4_WEIGHT_SCALE_BITS - 1,
                    INT4_WEIGHT_SCALE_BITS * scale_lane));

        local_partial_group_loop:
            for (int group = 0; group < INT4_GROUPS_PER_TILE; ++group) {
                const int local_group =
                    local_col_tile * INT4_GROUPS_PER_TILE + group;
                const int4_quant_word_t quantized = activation_q[local_group];
                const float combined_scale =
                    weight_scale * activation_scale[local_group];
#pragma HLS BIND_OP variable=combined_scale op=mul impl=dsp

            local_partial_row_block_loop:
                for (int row_block = 0;
                     row_block < INT4_ROW_BLOCKS;
                     ++row_block) {
#pragma HLS PIPELINE II=1 style=stp
                    const int4_weight_word_t weight = weight_stream.read();
                    int4_packed_acc_t packed_sum0 = 0;
                    int4_packed_acc_t packed_sum1 = 0;

                local_partial_mac_lane_loop:
                    for (int lane = 0; lane < INT4_GROUP_SIZE; ++lane) {
#pragma HLS UNROLL
                        const int4_activation_t activation =
                            (int4_activation_t)quantized.range(
                                INT4_ACTIVATION_BITS * lane +
                                    INT4_ACTIVATION_BITS - 1,
                                INT4_ACTIVATION_BITS * lane);
                        const ap_uint<8> pair0 = weight.range(
                            16 * lane + 7, 16 * lane);
                        const ap_uint<8> pair1 = weight.range(
                            16 * lane + 15, 16 * lane + 8);
                        packed_sum0 += int4_pack_two_w4(
                            (int4_weight_t)pair0.range(7, 4),
                            (int4_weight_t)pair0.range(3, 0)) * activation;
                        packed_sum1 += int4_pack_two_w4(
                            (int4_weight_t)pair1.range(7, 4),
                            (int4_weight_t)pair1.range(3, 0)) * activation;
                    }

                    int4_group_acc_t integer_sum[INT4_ROW_BLOCK];
#pragma HLS ARRAY_PARTITION variable=integer_sum complete
                    int4_unpack_packed_acc(
                        packed_sum0, integer_sum[0], integer_sum[1]);
                    int4_unpack_packed_acc(
                        packed_sum1, integer_sum[2], integer_sum[3]);

                local_partial_accumulate_lane_loop:
                    for (int lane = 0; lane < INT4_ROW_BLOCK; ++lane) {
#pragma HLS UNROLL
                        const int row = row_block * INT4_ROW_BLOCK + lane;
                        const float contribution =
                            (float)integer_sum[lane] * combined_scale;
#pragma HLS BIND_OP variable=contribution op=mul impl=dsp
                        partial[row] =
                            local_col_tile == 0 && group == 0
                                ? contribution
                                : partial[row] + contribution;
                    }
                }
            }
        }

    local_partial_emit_loop:
        for (int row_block = 0;
             row_block < INT4_ROW_BLOCKS;
             ++row_block) {
#pragma HLS PIPELINE II=1
            int4_reduction_packet_t packet = 0;
            for (int lane = 0; lane < INT4_ROW_BLOCK; ++lane) {
#pragma HLS UNROLL
                packet.range(32 * lane + 31, 32 * lane) =
                    int4_float_to_bits(
                        partial[row_block * INT4_ROW_BLOCK + lane]);
            }
            partial_stream.write(packet);
        }
    }
}

template <int PE_ID>
static void int4_run_local_pe(
    const int4_weight_word_t* weight_mem,
    const int4_weight_scale_word_t* scale_mem,
    const int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale[INT4_MAX_LOCAL_GROUPS],
    hls::stream<int4_linear_command_t>& command_stream,
    hls::stream<int4_reduction_packet_t>& partial_stream) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation
    hls::stream<int4_linear_command_t> reader_command;
    hls::stream<int4_linear_command_t> compute_command;
    hls::stream<int4_weight_word_t> weight_stream;
#pragma HLS STREAM variable=reader_command depth=3
#pragma HLS STREAM variable=compute_command depth=3
    // Two complete 128x256 tiles absorb one AXI command/latency bubble while
    // the reusable MAC consumes the previous tile at one 512-bit word/cycle.
#pragma HLS STREAM variable=weight_stream depth=512
#pragma HLS BIND_STORAGE variable=reader_command type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=compute_command type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=weight_stream type=fifo impl=bram

    int4_split_local_command(
        command_stream, reader_command, compute_command);
    int4_stream_local_weights<PE_ID>(
        weight_mem, reader_command, weight_stream);
    int4_compute_local_partials<PE_ID>(
        scale_mem, activation_q, activation_scale,
        compute_command, weight_stream, partial_stream);
}

static int4_reduction_packet_t int4_add_partial_packets(
    int4_reduction_packet_t first,
    int4_reduction_packet_t second) {
#pragma HLS INLINE
    int4_reduction_packet_t result = 0;
    for (int lane = 0; lane < INT4_REDUCTION_LANES; ++lane) {
#pragma HLS UNROLL
        const float a = int4_bits_to_float(
            first.range(32 * lane + 31, 32 * lane));
        const float b = int4_bits_to_float(
            second.range(32 * lane + 31, 32 * lane));
        result.range(32 * lane + 31, 32 * lane) =
            int4_float_to_bits(a + b);
    }
    return result;
}

template <int PAIR_ID>
static void int4_reduce_pair_and_route(
    hls::stream<int4_reduction_packet_t>& partial_first,
    hls::stream<int4_reduction_packet_t>& partial_second,
    hls::stream<int4_reduction_packet_t>& local_half,
    hls::stream<int4_reduction_packet_t>& remote_half,
    hls::stream<int4_linear_command_t>& command_stream) {
#pragma HLS INLINE off
    const int output_tiles = int4_command_output_tiles(
        command_stream.read());
    const int pair_tiles = output_tiles / 2;
    const int packet_count = output_tiles * INT4_ROW_BLOCKS;
reduce_pair_packet_loop:
    for (int packet_index = 0;
         packet_index < packet_count;
         ++packet_index) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=1024 max=8064
        const int4_reduction_packet_t pair_sum =
            int4_add_partial_packets(
                partial_first.read(), partial_second.read());
        const int output_tile = packet_index / INT4_ROW_BLOCKS;
        const bool belongs_to_pair01 = output_tile < pair_tiles;
        const bool local =
            PAIR_ID == 0 ? belongs_to_pair01 : !belongs_to_pair01;
        if (local) {
            local_half.write(pair_sum);
        } else {
            remote_half.write(pair_sum);
        }
    }
}

template <int PAIR_ID>
static void int4_finalize_pair_outputs(
    hls::stream<int4_reduction_packet_t>& local_pair_sum,
    hls::stream<int4_reduction_packet_t>& remote_pair_sum,
    hls::stream<int4_reduction_packet_t>& first_output,
    hls::stream<int4_reduction_packet_t>& second_output,
    hls::stream<int4_linear_command_t>& command_stream) {
#pragma HLS INLINE off
    const int4_linear_command_t command = command_stream.read();
    const int local_output_tiles =
        int4_command_local_output_tiles(command);
    const bool output_fxp = command[61];
    const int pair_packets =
        2 * local_output_tiles * INT4_ROW_BLOCKS;
    const int first_packets = local_output_tiles * INT4_ROW_BLOCKS;
finalize_pair_packet_loop:
    for (int packet_index = 0;
         packet_index < pair_packets;
         ++packet_index) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=512 max=4032
        int4_reduction_packet_t completed = int4_add_partial_packets(
            local_pair_sum.read(), remote_pair_sum.read());
        if (output_fxp) {
            for (int lane = 0; lane < INT4_REDUCTION_LANES; ++lane) {
#pragma HLS UNROLL
                completed.range(32 * lane + 31, 32 * lane) =
                    int4_float_to_fxp_bits(int4_bits_to_float(
                        completed.range(32 * lane + 31, 32 * lane)));
            }
        }
        if (packet_index < first_packets) {
            first_output.write(completed);
        } else {
            second_output.write(completed);
        }
    }
}

template <int PE_ID>
static void int4_store_local_output(
    hls::stream<int4_reduction_packet_t>& input_stream,
    int4_output_word_t* output_mem,
    hls::stream<int4_linear_command_t>& command_stream) {
#pragma HLS INLINE off
    const int local_output_tiles = int4_command_local_output_tiles(
        command_stream.read());
    const int output_words =
        local_output_tiles * INT4_OUTPUT_WORDS_PER_TILE;
store_local_output_word_loop:
    for (int word = 0; word < output_words; ++word) {
#pragma HLS LOOP_TRIPCOUNT min=64 max=504
        int4_output_word_t packed = 0;
    store_local_output_chunk_loop:
        for (int chunk = 0;
             chunk < INT4_OUTPUTS_PER_WORD / INT4_REDUCTION_LANES;
             ++chunk) {
#pragma HLS PIPELINE II=1
            packed.range(
                INT4_REDUCTION_PACKET_BITS * chunk +
                    INT4_REDUCTION_PACKET_BITS - 1,
                INT4_REDUCTION_PACKET_BITS * chunk) = input_stream.read();
        }
        output_mem[word] = packed;
    }
}

void int4_sharded_linear_4pe(
    const int4_weight_word_t* weight_pe0,
    const int4_weight_word_t* weight_pe1,
    const int4_weight_word_t* weight_pe2,
    const int4_weight_word_t* weight_pe3,
    const int4_weight_scale_word_t* scale_pe0,
    const int4_weight_scale_word_t* scale_pe1,
    const int4_weight_scale_word_t* scale_pe2,
    const int4_weight_scale_word_t* scale_pe3,
    const int4_quant_word_t activation_q0[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q1[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q2[INT4_MAX_LOCAL_GROUPS],
    const int4_quant_word_t activation_q3[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale0[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale1[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale2[INT4_MAX_LOCAL_GROUPS],
    const float activation_scale3[INT4_MAX_LOCAL_GROUPS],
    int4_output_word_t* output_pe0,
    int4_output_word_t* output_pe1,
    int4_output_word_t* output_pe2,
    int4_output_word_t* output_pe3,
    ap_uint<3> mode,
    ap_uint<24> weight_word_offset,
    ap_uint<16> weight_scale_word_offset) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW disable_start_propagation

    hls::stream<int4_linear_command_t> command_pe0;
    hls::stream<int4_linear_command_t> command_pe1;
    hls::stream<int4_linear_command_t> command_pe2;
    hls::stream<int4_linear_command_t> command_pe3;
    hls::stream<int4_linear_command_t> command_01;
    hls::stream<int4_linear_command_t> command_12;
    hls::stream<int4_linear_command_t> command_23;
    hls::stream<int4_linear_command_t> command_store0;
    hls::stream<int4_linear_command_t> command_store1;
    hls::stream<int4_linear_command_t> command_store2;
    hls::stream<int4_linear_command_t> command_store3;
    hls::stream<int4_linear_command_t> command_reduce01;
    hls::stream<int4_linear_command_t> command_finalize01;
    hls::stream<int4_linear_command_t> command_reduce23;
    hls::stream<int4_linear_command_t> command_finalize23;
    hls::stream<int4_reduction_packet_t> partial0;
    hls::stream<int4_reduction_packet_t> partial1;
    hls::stream<int4_reduction_packet_t> partial2;
    hls::stream<int4_reduction_packet_t> partial3;
    hls::stream<int4_reduction_packet_t> sum01_local;
    hls::stream<int4_reduction_packet_t> sum01_to23;
    hls::stream<int4_reduction_packet_t> sum23_local;
    hls::stream<int4_reduction_packet_t> sum23_to01;
    hls::stream<int4_reduction_packet_t> output0_stream;
    hls::stream<int4_reduction_packet_t> output1_stream;
    hls::stream<int4_reduction_packet_t> output2_stream;
    hls::stream<int4_reduction_packet_t> output3_stream;

#pragma HLS STREAM variable=command_pe0 depth=2
#pragma HLS STREAM variable=command_pe1 depth=2
#pragma HLS STREAM variable=command_pe2 depth=2
#pragma HLS STREAM variable=command_pe3 depth=2
#pragma HLS STREAM variable=command_01 depth=2
#pragma HLS STREAM variable=command_12 depth=2
#pragma HLS STREAM variable=command_23 depth=2
#pragma HLS STREAM variable=command_store0 depth=2
#pragma HLS STREAM variable=command_store1 depth=2
#pragma HLS STREAM variable=command_store2 depth=2
#pragma HLS STREAM variable=command_store3 depth=2
#pragma HLS STREAM variable=command_reduce01 depth=2
#pragma HLS STREAM variable=command_finalize01 depth=2
#pragma HLS STREAM variable=command_reduce23 depth=2
#pragma HLS STREAM variable=command_finalize23 depth=2
#pragma HLS STREAM variable=partial0 depth=8
#pragma HLS STREAM variable=partial1 depth=8
#pragma HLS STREAM variable=partial2 depth=8
#pragma HLS STREAM variable=partial3 depth=8
#pragma HLS STREAM variable=sum01_local depth=16
#pragma HLS STREAM variable=sum01_to23 depth=16
#pragma HLS STREAM variable=sum23_local depth=16
#pragma HLS STREAM variable=sum23_to01 depth=16
#pragma HLS STREAM variable=output0_stream depth=32
#pragma HLS STREAM variable=output1_stream depth=32
#pragma HLS STREAM variable=output2_stream depth=32
#pragma HLS STREAM variable=output3_stream depth=32
#pragma HLS BIND_STORAGE variable=command_pe0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_pe3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_12 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_23 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_store0 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_store1 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_store2 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_store3 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_reduce01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_finalize01 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_reduce23 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=command_finalize23 type=fifo impl=srl
#pragma HLS BIND_STORAGE variable=sum01_to23 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=sum23_to01 type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=output0_stream type=fifo impl=bram
#pragma HLS BIND_STORAGE variable=output3_stream type=fifo impl=bram

    // The command is registered and fanned out only inside the receiving SLR.
    // No wide top-level mode/shape signal drives all four data planes.
    int4_seed_linear_command_chain(
        mode, weight_word_offset, weight_scale_word_offset,
        command_pe0, command_store0, command_01);
    int4_relay_pair_linear_command<0>(
        command_01, command_pe1,
        command_reduce01, command_finalize01, command_store1,
        command_12);
    int4_relay_pair_linear_command<1>(
        command_12, command_pe2,
        command_reduce23, command_finalize23, command_store2,
        command_23);
    int4_terminate_linear_command(
        command_23, command_pe3, command_store3);

    int4_run_local_pe<0>(
        weight_pe0, scale_pe0,
        activation_q0, activation_scale0,
        command_pe0, partial0);
    int4_run_local_pe<1>(
        weight_pe1, scale_pe1,
        activation_q1, activation_scale1,
        command_pe1, partial1);
    int4_run_local_pe<2>(
        weight_pe2, scale_pe2,
        activation_q2, activation_scale2,
        command_pe2, partial2);
    int4_run_local_pe<3>(
        weight_pe3, scale_pe3,
        activation_q3, activation_scale3,
        command_pe3, partial3);

    // pair01 is physically rooted in SLR1 and pair23 in SLR2. Only the half
    // needed by the opposite pair crosses the central SLR boundary.
    int4_reduce_pair_and_route<0>(
        partial0, partial1, sum01_local, sum01_to23,
        command_reduce01);
    int4_reduce_pair_and_route<1>(
        partial2, partial3, sum23_local, sum23_to01,
        command_reduce23);
    int4_finalize_pair_outputs<0>(
        sum01_local, sum23_to01,
        output0_stream, output1_stream,
        command_finalize01);
    int4_finalize_pair_outputs<1>(
        sum23_local, sum01_to23,
        output2_stream, output3_stream,
        command_finalize23);

    int4_store_local_output<0>(
        output0_stream, output_pe0, command_store0);
    int4_store_local_output<1>(
        output1_stream, output_pe1, command_store1);
    int4_store_local_output<2>(
        output2_stream, output_pe2, command_store2);
    int4_store_local_output<3>(
        output3_stream, output_pe3, command_store3);
}
