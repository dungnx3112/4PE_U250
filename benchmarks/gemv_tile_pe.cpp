#include "gemv_tile_pe.hpp"
#include <cstdint>
#include <hls_stream.h>

static_assert(GEMV_ROW_PAIRS == 64, "A 128-row tile must contain 64 row pairs.");
static_assert(GEMV_CHUNKS_PER_TILE == 8, "A 256-column tile must contain 8 G32 chunks.");
static_assert(GEMV_ACT_WORDS_PER_TILE == 8, "A tile must consume 8 packed activation words.");
static_assert(
    (1LL << (GEMV_GROUP_ACC_BITS - 1)) >
        1LL * GEMV_PACK_CHUNK * 16383 * 7,
    "The signed G32 accumulator is too narrow."
);
static_assert(
    (1LL << 45) >
        1LL * GEMV_PACK_CHUNK * 16383 * 7 *
            ((1LL << GEMV_GROUP_ACC_BITS) + 1),
    "The signed packed accumulator is too narrow."
);
static_assert(
    (1LL << 29) >
        1LL * GEMV_VECTOR_SIZE * 16383 * 7,
    "The signed full-vector integer accumulator is too narrow."
);
static_assert(
    GEMV_GROUP_BLOCKS * GEMV_GROUP_BLOCK_ROWS ==
        GEMV_TILE_ROWS,
    "Serialized G32 blocks must contain all 128 row results."
);

static ap_int<27> pack_two_w4_tile(
    gemv_w4_t w_hi,
    gemv_w4_t w_lo
) {
#pragma HLS INLINE

    ap_int<27> hi = (ap_int<27>)w_hi;
    ap_int<27> lo = (ap_int<27>)w_lo;
    return (hi << 23) + lo;
}

static void unpack_acc23_tile(
    gemv_packed_acc_t packed_acc,
    gemv_group_acc_t& hi_out,
    gemv_group_acc_t& lo_out
) {
#pragma HLS INLINE

    gemv_group_acc_t lo = packed_acc.range(22, 0);
    gemv_group_acc_t hi_raw = packed_acc.range(45, 23);
    ap_int<24> hi_corrected =
        (ap_int<24>)hi_raw + (lo[22] ? 1 : 0);

    hi_out = (gemv_group_acc_t)hi_corrected;
    lo_out = lo;
}

// One tile consumes exactly 256 weight words.  The transposed G32 layout
// stores each word as 2 packed pairs x 32 k-positions (= 4 rows x 32 cols
// = 512 bits).  Words are ordered chunk-major:
//   word[chunk * GEMV_GROUP_BLOCKS + qr]
// The fully-unrolled kk loop creates 32 parallel packed A15x(2xW4) multiply
// lanes per pair.  An adder tree reduces the 32 products to one packed sum,
// which is unpacked and accumulated into partial[].
static void compute_tile_accumulate(
    const gemv_weight_word_t weight_buf[GEMV_TILE_COLS],
    const gemv_activation_word_t activation_words[GEMV_ACTIVATION_WORDS],
    int activation_word_base,
    gemv_partial_t partial[GEMV_TILE_ROWS],
    bool initialize_partial
) {
#pragma HLS INLINE off

    gemv_act_t x_local[GEMV_TILE_COLS];
#pragma HLS ARRAY_PARTITION variable=x_local cyclic factor=GEMV_PACK_CHUNK

preload_activation_loop:
    for (int chunk = 0; chunk < GEMV_CHUNKS_PER_TILE; ++chunk) {
        gemv_activation_word_t activation_word =
            activation_words[activation_word_base + chunk];

    preload_activation_lane_loop:
        for (int lane = 0; lane < GEMV_ACTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
            ap_int<16> stored =
                (ap_int<16>)activation_word.range(
                    16 * lane + 15, 16 * lane);
            x_local[chunk * GEMV_ACTS_PER_WORD + lane] =
                (gemv_act_t)stored;
        }
    }

tile_compute_loop:
    for (int w = 0; w < GEMV_TILE_COLS; ++w) {
#pragma HLS PIPELINE II=1
        const int chunk = w / GEMV_GROUP_BLOCKS;
        const int qr = w % GEMV_GROUP_BLOCKS;

        gemv_weight_word_t word = weight_buf[w];

        gemv_packed_acc_t chunk_sum[GEMV_PAIRS_PER_QUAD];
#pragma HLS ARRAY_PARTITION variable=chunk_sum complete

    init_chunk_sum_loop:
        for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
            chunk_sum[pair] = 0;
        }

    parallel_mac_loop:
        for (int kk = 0; kk < GEMV_PACK_CHUNK; ++kk) {
#pragma HLS UNROLL
            const int col = chunk * GEMV_PACK_CHUNK + kk;
            gemv_act_t x = x_local[col];

        pair_mac_loop:
            for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
                ap_uint<8> pair_bits =
                    word.range(
                        16 * kk + 8 * pair + 7,
                        16 * kk + 8 * pair);
                gemv_w4_t w_hi =
                    (gemv_w4_t)pair_bits.range(7, 4);
                gemv_w4_t w_lo =
                    (gemv_w4_t)pair_bits.range(3, 0);
                ap_int<27> packed_w =
                    pack_two_w4_tile(w_hi, w_lo);
                chunk_sum[pair] += packed_w * x;
            }
        }

    unpack_and_accumulate_loop:
        for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
            gemv_group_acc_t hi_part;
            gemv_group_acc_t lo_part;
            unpack_acc23_tile(chunk_sum[pair], hi_part, lo_part);
            const int r0 =
                qr * GEMV_GROUP_BLOCK_ROWS + 2 * pair;
            if (initialize_partial && chunk == 0) {
                partial[r0] = (gemv_partial_t)hi_part;
                partial[r0 + 1] = (gemv_partial_t)lo_part;
            } else {
                partial[r0] += (gemv_partial_t)hi_part;
                partial[r0 + 1] += (gemv_partial_t)lo_part;
            }
        }
    }
}

static void pack_output_tile(
    const gemv_partial_t partial[GEMV_TILE_ROWS],
    gemv_output_word_t output_tile[GEMV_OUTPUT_WORDS_PER_TILE]
) {
#pragma HLS INLINE off

pack_output_word_loop:
    for (int word_index = 0;
         word_index < GEMV_OUTPUT_WORDS_PER_TILE;
         ++word_index) {
#pragma HLS PIPELINE II=1
        gemv_output_word_t word = 0;

    pack_output_lane_loop:
        for (int lane = 0; lane < GEMV_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
            const int row = word_index * GEMV_OUTPUTS_PER_WORD + lane;
            ap_int<32> value = (ap_int<32>)partial[row];
            word.range(32 * lane + 31, 32 * lane) =
                (ap_uint<32>)value;
        }

        output_tile[word_index] = word;
    }
}

void gemv_tile_128x256(
    const gemv_weight_word_t weight_tile[GEMV_TILE_COLS],
    const gemv_activation_word_t activation_tile[GEMV_ACT_WORDS_PER_TILE],
    gemv_output_word_t output_tile[GEMV_OUTPUT_WORDS_PER_TILE]
) {
#pragma HLS INTERFACE ap_memory port=weight_tile
#pragma HLS INTERFACE ap_memory port=activation_tile
#pragma HLS INTERFACE ap_memory port=output_tile
#pragma HLS INTERFACE ap_ctrl_hs port=return

    gemv_partial_t partial[GEMV_TILE_ROWS];
#pragma HLS ARRAY_PARTITION variable=partial complete

    compute_tile_accumulate(
        weight_tile,
        activation_tile,
        0,
        partial,
        true
    );
    pack_output_tile(partial, output_tile);
}

static void load_activation_cache(
    const gemv_activation_word_t* activation_mem,
    gemv_activation_word_t activation_cache[GEMV_ACTIVATION_WORDS]
) {
#pragma HLS INLINE off

load_activation_loop:
    for (int word = 0; word < GEMV_ACTIVATION_WORDS; ++word) {
#pragma HLS PIPELINE II=1
        activation_cache[word] = activation_mem[word];
    }
}

static void stream_weight_tiles(
    const gemv_weight_word_t* weight_mem,
    hls::stream<gemv_weight_word_t>& weight_stream,
    int total_tiles
) {
#pragma HLS INLINE off

    const int total_words = total_tiles * GEMV_TILE_COLS;

stream_weight_loop:
    for (int word = 0; word < total_words; ++word) {
#pragma HLS PIPELINE II=1
        weight_stream.write(weight_mem[word]);
    }
}

static void compute_stream_tile_accumulate(
    hls::stream<gemv_weight_word_t>& weight_stream,
    const gemv_activation_word_t activation_cache[GEMV_ACTIVATION_WORDS],
    int activation_word_base,
    gemv_partial_t partial[GEMV_TILE_ROWS],
    bool initialize_partial
) {
#pragma HLS INLINE off

    gemv_act_t x_local[GEMV_TILE_COLS];
#pragma HLS ARRAY_PARTITION variable=x_local cyclic factor=GEMV_PACK_CHUNK

stream_preload_activation_loop:
    for (int chunk = 0; chunk < GEMV_CHUNKS_PER_TILE; ++chunk) {
        gemv_activation_word_t activation_word =
            activation_cache[activation_word_base + chunk];

    stream_preload_activation_lane_loop:
        for (int lane = 0; lane < GEMV_ACTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
            ap_int<16> stored =
                (ap_int<16>)activation_word.range(
                    16 * lane + 15, 16 * lane);
            x_local[chunk * GEMV_ACTS_PER_WORD + lane] =
                (gemv_act_t)stored;
        }
    }

stream_tile_compute_loop:
    for (int w = 0; w < GEMV_TILE_COLS; ++w) {
#pragma HLS PIPELINE II=1
        const int chunk = w / GEMV_GROUP_BLOCKS;
        const int qr = w % GEMV_GROUP_BLOCKS;

        gemv_weight_word_t word = weight_stream.read();

        gemv_packed_acc_t chunk_sum[GEMV_PAIRS_PER_QUAD];
#pragma HLS ARRAY_PARTITION variable=chunk_sum complete

    stream_init_chunk_sum_loop:
        for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
            chunk_sum[pair] = 0;
        }

    stream_parallel_mac_loop:
        for (int kk = 0; kk < GEMV_PACK_CHUNK; ++kk) {
#pragma HLS UNROLL
            const int col = chunk * GEMV_PACK_CHUNK + kk;
            gemv_act_t x = x_local[col];

        stream_pair_mac_loop:
            for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
                ap_uint<8> pair_bits =
                    word.range(
                        16 * kk + 8 * pair + 7,
                        16 * kk + 8 * pair);
                gemv_w4_t w_hi =
                    (gemv_w4_t)pair_bits.range(7, 4);
                gemv_w4_t w_lo =
                    (gemv_w4_t)pair_bits.range(3, 0);
                ap_int<27> packed_w =
                    pack_two_w4_tile(w_hi, w_lo);
                chunk_sum[pair] += packed_w * x;
            }
        }

    stream_unpack_and_accumulate_loop:
        for (int pair = 0; pair < GEMV_PAIRS_PER_QUAD; ++pair) {
#pragma HLS UNROLL
            gemv_group_acc_t hi_part;
            gemv_group_acc_t lo_part;
            unpack_acc23_tile(chunk_sum[pair], hi_part, lo_part);
            const int r0 =
                qr * GEMV_GROUP_BLOCK_ROWS + 2 * pair;
            if (initialize_partial && chunk == 0) {
                partial[r0] = (gemv_partial_t)hi_part;
                partial[r0 + 1] = (gemv_partial_t)lo_part;
            } else {
                partial[r0] += (gemv_partial_t)hi_part;
                partial[r0 + 1] += (gemv_partial_t)lo_part;
            }
        }
    }
}

static void stream_output_block(
    const gemv_partial_t partial[GEMV_TILE_ROWS],
    hls::stream<gemv_output_word_t>& output_stream
) {
#pragma HLS INLINE off

stream_output_word_loop:
    for (int word = 0; word < GEMV_OUTPUT_WORDS_PER_TILE; ++word) {
#pragma HLS PIPELINE II=1
        gemv_output_word_t packed_word = 0;

    stream_output_lane_loop:
        for (int lane = 0; lane < GEMV_OUTPUTS_PER_WORD; ++lane) {
#pragma HLS UNROLL
            const int row = word * GEMV_OUTPUTS_PER_WORD + lane;
            ap_int<32> value = (ap_int<32>)partial[row];
            packed_word.range(32 * lane + 31, 32 * lane) =
                (ap_uint<32>)value;
        }

        output_stream.write(packed_word);
    }
}

static void compute_streamed_mvm(
    hls::stream<gemv_weight_word_t>& weight_stream,
    const gemv_activation_word_t activation_cache[GEMV_ACTIVATION_WORDS],
    hls::stream<gemv_output_word_t>& output_stream,
    int row_tiles
) {
#pragma HLS INLINE off

    gemv_partial_t partial[GEMV_TILE_ROWS];
#pragma HLS ARRAY_PARTITION variable=partial complete

stream_row_tile_loop:
    for (int row_tile = 0; row_tile < row_tiles; ++row_tile) {
#pragma HLS LOOP_TRIPCOUNT min=1 max=GEMV_MAX_ROW_TILES
    stream_col_tile_loop:
        for (int col_tile = 0; col_tile < GEMV_COL_TILES; ++col_tile) {
#pragma HLS LOOP_TRIPCOUNT min=GEMV_COL_TILES max=GEMV_COL_TILES
            const int activation_word_base =
                col_tile * GEMV_ACT_WORDS_PER_TILE;
            compute_stream_tile_accumulate(
                weight_stream,
                activation_cache,
                activation_word_base,
                partial,
                col_tile == 0
            );
        }

        stream_output_block(partial, output_stream);
    }
}

static void write_output_stream(
    hls::stream<gemv_output_word_t>& output_stream,
    gemv_output_word_t* output_mem,
    int row_tiles
) {
#pragma HLS INLINE off

    const int total_words = row_tiles * GEMV_OUTPUT_WORDS_PER_TILE;

write_output_stream_loop:
    for (int word = 0; word < total_words; ++word) {
#pragma HLS PIPELINE II=1
        output_mem[word] = output_stream.read();
    }
}

static void run_streamed_pe(
    const gemv_weight_word_t* weight_mem,
    const gemv_activation_word_t activation_cache[GEMV_ACTIVATION_WORDS],
    gemv_output_word_t* output_mem,
    int row_tiles
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW

    // 512 words = two complete 128x256 INT4 tiles.  This elastic buffer
    // decouples DDR burst jitter from the II=1 packed compute loop.
    hls::stream<gemv_weight_word_t> weight_stream;
#pragma HLS STREAM variable=weight_stream depth=512

    // Two complete output row blocks let the AXI writer run independently
    // while the compute stage immediately starts consuming the next tile.
    hls::stream<gemv_output_word_t> output_stream;
#pragma HLS STREAM variable=output_stream depth=16

    const int total_tiles = row_tiles * GEMV_COL_TILES;
    stream_weight_tiles(weight_mem, weight_stream, total_tiles);
    compute_streamed_mvm(
        weight_stream,
        activation_cache,
        output_stream,
        row_tiles
    );
    write_output_stream(output_stream, output_mem, row_tiles);
}

void gemv_pe_1ddr(
    const gemv_weight_word_t* weight_mem,
    const gemv_activation_word_t* activation_mem,
    gemv_output_word_t* output_mem,
    int row_tiles
) {
#pragma HLS INTERFACE m_axi port=weight_mem offset=slave bundle=gmem0 \
    depth=GEMV_MAX_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE m_axi port=activation_mem offset=slave bundle=gmem0 \
    depth=GEMV_ACTIVATION_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE m_axi port=output_mem offset=slave bundle=gmem0 \
    depth=GEMV_MAX_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE s_axilite port=weight_mem bundle=control
#pragma HLS INTERFACE s_axilite port=activation_mem bundle=control
#pragma HLS INTERFACE s_axilite port=output_mem bundle=control
#pragma HLS INTERFACE s_axilite port=row_tiles bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (row_tiles <= 0) {
        return;
    }
    if (row_tiles > GEMV_MAX_ROW_TILES) {
        row_tiles = GEMV_MAX_ROW_TILES;
    }

    gemv_activation_word_t activation_cache[GEMV_ACTIVATION_WORDS];

#pragma HLS BIND_STORAGE variable=activation_cache type=ram_1p impl=bram

    load_activation_cache(activation_mem, activation_cache);
    run_streamed_pe(
        weight_mem,
        activation_cache,
        output_mem,
        row_tiles
    );
}

union gemv_fp32_bits_t {
    std::uint32_t bits;
    float value;
};

static float gemv_bits_to_float(ap_uint<32> bits) {
#pragma HLS INLINE

    gemv_fp32_bits_t converter;
    converter.bits = (std::uint32_t)bits;
    return converter.value;
}

static ap_uint<32> gemv_float_to_bits(float value) {
#pragma HLS INLINE

    gemv_fp32_bits_t converter;
    converter.value = value;
    return (ap_uint<32>)converter.bits;
}

static float reduce_max_abs_g32(
    const float values[GEMV_PACK_CHUNK]
) {
#pragma HLS INLINE

    float level_16[16];
    float level_8[8];
    float level_4[4];
    float level_2[2];
#pragma HLS ARRAY_PARTITION variable=level_16 complete
#pragma HLS ARRAY_PARTITION variable=level_8 complete
#pragma HLS ARRAY_PARTITION variable=level_4 complete
#pragma HLS ARRAY_PARTITION variable=level_2 complete

reduce_abs_level_16:
    for (int lane = 0; lane < 16; ++lane) {
#pragma HLS UNROLL
        float a = values[2 * lane];
        float b = values[2 * lane + 1];
        float abs_a = (a < 0.0f) ? -a : a;
        float abs_b = (b < 0.0f) ? -b : b;
        level_16[lane] = (abs_a > abs_b) ? abs_a : abs_b;
    }

reduce_abs_level_8:
    for (int lane = 0; lane < 8; ++lane) {
#pragma HLS UNROLL
        level_8[lane] =
            (level_16[2 * lane] > level_16[2 * lane + 1])
                ? level_16[2 * lane]
                : level_16[2 * lane + 1];
    }

reduce_abs_level_4:
    for (int lane = 0; lane < 4; ++lane) {
#pragma HLS UNROLL
        level_4[lane] =
            (level_8[2 * lane] > level_8[2 * lane + 1])
                ? level_8[2 * lane]
                : level_8[2 * lane + 1];
    }

reduce_abs_level_2:
    for (int lane = 0; lane < 2; ++lane) {
#pragma HLS UNROLL
        level_2[lane] =
            (level_4[2 * lane] > level_4[2 * lane + 1])
                ? level_4[2 * lane]
                : level_4[2 * lane + 1];
    }

    return (level_2[0] > level_2[1])
        ? level_2[0]
        : level_2[1];
}

// The input of this stage is the normalized FP32 vector produced by
// RMSNorm (or another activation producer).  A group is buffered because
// its maximum magnitude must be known before the A15 values can be emitted.
static void quantize_activation_g32(
    const gemv_float_word_t* activation_fp_mem,
    gemv_quant_activation_word_t
        activation_cache[GEMV_ACTIVATION_GROUPS],
    float activation_scale_cache[GEMV_ACTIVATION_GROUPS]
) {
#pragma HLS INLINE off

    float group_values[GEMV_PACK_CHUNK];
#pragma HLS ARRAY_PARTITION variable=group_values complete

quantize_group_loop:
    for (int group = 0; group < GEMV_ACTIVATION_GROUPS; ++group) {
    load_fp32_group_loop:
        for (int beat = 0; beat < 2; ++beat) {
#pragma HLS PIPELINE II=1
            gemv_float_word_t word =
                activation_fp_mem[2 * group + beat];

        unpack_fp32_group_loop:
            for (int lane = 0; lane < GEMV_FLOATS_PER_WORD; ++lane) {
#pragma HLS UNROLL
                ap_uint<32> bits =
                    word.range(32 * lane + 31, 32 * lane);
                group_values[
                    beat * GEMV_FLOATS_PER_WORD + lane
                ] = gemv_bits_to_float(bits);
            }
        }

        float max_abs = reduce_max_abs_g32(group_values);
        float scale =
            (max_abs > 0.0f) ? (max_abs / 16383.0f) : 0.0f;
        float inverse_scale =
            (max_abs > 0.0f) ? (16383.0f / max_abs) : 0.0f;
        activation_scale_cache[group] = scale;

        gemv_quant_activation_word_t quantized_word = 0;

    quantize_group_block_loop:
        for (int block =
                 GEMV_PACK_CHUNK / GEMV_QUANT_LANES;
             block > 0;
             --block) {
#pragma HLS PIPELINE II=1
            const int block_index = block - 1;
            ap_uint<
                GEMV_QUANT_ACT_BITS * GEMV_QUANT_LANES
            > packed_block = 0;

        quantize_group_lane_loop:
            for (int lane = 0; lane < GEMV_QUANT_LANES; ++lane) {
#pragma HLS UNROLL
                const int index =
                    block_index * GEMV_QUANT_LANES + lane;
                float scaled = group_values[index] * inverse_scale;
                float rounded =
                    (scaled >= 0.0f)
                        ? (scaled + 0.5f)
                        : (scaled - 0.5f);
                if (rounded > 16383.0f) {
                    rounded = 16383.0f;
                }
                if (rounded < -16383.0f) {
                    rounded = -16383.0f;
                }

                gemv_act_t stored = (gemv_act_t)rounded;
                packed_block.range(
                    GEMV_QUANT_ACT_BITS * lane +
                        GEMV_QUANT_ACT_BITS - 1,
                    GEMV_QUANT_ACT_BITS * lane
                ) = (ap_uint<GEMV_QUANT_ACT_BITS>)stored;
            }

            quantized_word =
                (quantized_word <<
                    (GEMV_QUANT_ACT_BITS * GEMV_QUANT_LANES)) |
                packed_block;
        }

        activation_cache[group] = quantized_word;
    }
}

static void load_weight_scale_cache(
    const gemv_float_word_t* weight_scale_mem,
    float weight_scale_cache[GEMV_MAX_WEIGHT_TILES],
    int row_tiles
) {
#pragma HLS INLINE off

load_weight_scale_word_loop:
    for (int row_tile = 0; row_tile < row_tiles; ++row_tile) {
        gemv_float_word_t word = weight_scale_mem[row_tile];

    unpack_weight_scale_word_loop:
        for (int col_tile = 0; col_tile < GEMV_COL_TILES; ++col_tile) {
#pragma HLS PIPELINE II=1
            ap_uint<32> bits = word.range(31, 0);
            weight_scale_cache[
                row_tile * GEMV_COL_TILES + col_tile
            ] = gemv_bits_to_float(bits);
            word >>= 32;
        }
    }
}

static void stream_combined_scales(
    const float activation_scale_cache[GEMV_ACTIVATION_GROUPS],
    const float weight_scale_cache[GEMV_MAX_WEIGHT_TILES],
    hls::stream<float>& combined_scale_stream,
    int row_tiles
) {
#pragma HLS INLINE off

combined_scale_row_loop:
    for (int row_tile = 0; row_tile < row_tiles; ++row_tile) {
    combined_scale_col_loop:
        for (int col_tile = 0; col_tile < GEMV_COL_TILES; ++col_tile) {
            float weight_scale =
                weight_scale_cache[
                    row_tile * GEMV_COL_TILES + col_tile
                ];

        combined_scale_group_loop:
            for (int group = 0;
                 group < GEMV_CHUNKS_PER_TILE;
                 ++group) {
                float activation_scale =
                    activation_scale_cache[
                        col_tile * GEMV_CHUNKS_PER_TILE + group
                    ];
                combined_scale_stream.write(
                    weight_scale * activation_scale
                );
            }
        }
    }
}

// Transposed G32 layout: each weight word contains 2 packed pairs x 32
// k-positions.  Every word independently produces one 92-bit group block
// via 32 parallel packed multiplies, an adder-tree reduction, and an unpack.
// No accumulator state persists across iterations; the flat II=1 pipeline
// achieves exactly 256 compute cycles per tile with zero overhead.
static void stream_integer_group_blocks(
    hls::stream<gemv_weight_word_t>& weight_stream,
    const gemv_quant_activation_word_t
        activation_cache[GEMV_ACTIVATION_GROUPS],
    hls::stream<gemv_group_block_t>& group_block_stream,
    int row_tiles
) {
#pragma HLS INLINE off

    const int total_words =
        row_tiles * GEMV_COL_TILES * GEMV_TILE_COLS;

    int act_group = 0;
    int qr = 0;

integer_flat_loop:
    for (int w = 0; w < total_words; ++w) {
#pragma HLS PIPELINE II=1
#pragma HLS LOOP_TRIPCOUNT min=4096 max=131072

        gemv_quant_activation_word_t act_word =
            activation_cache[act_group];

        gemv_weight_word_t weight_word = weight_stream.read();

        gemv_packed_acc_t chunk_sum[GEMV_PAIRS_PER_QUAD];
#pragma HLS ARRAY_PARTITION variable=chunk_sum complete
        chunk_sum[0] = 0;
        chunk_sum[1] = 0;

    integer_parallel_mac_loop:
        for (int kk = 0; kk < GEMV_PACK_CHUNK; ++kk) {
#pragma HLS UNROLL
            gemv_act_t x =
                (gemv_act_t)act_word.range(
                    GEMV_QUANT_ACT_BITS * kk +
                        GEMV_QUANT_ACT_BITS - 1,
                    GEMV_QUANT_ACT_BITS * kk
                );

        integer_pair_mac_loop:
            for (int pair = 0;
                 pair < GEMV_PAIRS_PER_QUAD;
                 ++pair) {
#pragma HLS UNROLL
                ap_uint<8> pair_bits =
                    weight_word.range(
                        16 * kk + 8 * pair + 7,
                        16 * kk + 8 * pair
                    );
                gemv_w4_t w_hi =
                    (gemv_w4_t)pair_bits.range(7, 4);
                gemv_w4_t w_lo =
                    (gemv_w4_t)pair_bits.range(3, 0);
                ap_int<27> packed_w =
                    pack_two_w4_tile(w_hi, w_lo);
                chunk_sum[pair] += packed_w * x;
            }
        }

        gemv_group_acc_t row_0, row_1, row_2, row_3;
        unpack_acc23_tile(chunk_sum[0], row_0, row_1);
        unpack_acc23_tile(chunk_sum[1], row_2, row_3);

        gemv_group_block_t block = 0;
        block.range(22, 0) =
            (ap_uint<GEMV_GROUP_ACC_BITS>)row_0;
        block.range(45, 23) =
            (ap_uint<GEMV_GROUP_ACC_BITS>)row_1;
        block.range(68, 46) =
            (ap_uint<GEMV_GROUP_ACC_BITS>)row_2;
        block.range(91, 69) =
            (ap_uint<GEMV_GROUP_ACC_BITS>)row_3;
        group_block_stream.write(block);

        if (qr == GEMV_GROUP_BLOCKS - 1) {
            qr = 0;
            if (act_group == GEMV_ACTIVATION_GROUPS - 1) {
                act_group = 0;
            } else {
                ++act_group;
            }
        } else {
            ++qr;
        }
    }
}

static void dequantize_group_blocks(
    hls::stream<gemv_group_block_t>& group_block_stream,
    hls::stream<float>& combined_scale_stream,
    hls::stream<gemv_output_word_t>& output_stream,
    int row_tiles
) {
#pragma HLS INLINE off

    float partial[GEMV_TILE_ROWS];
#pragma HLS ARRAY_PARTITION variable=partial cyclic factor=GEMV_DEQUANT_LANES

dequant_row_tile_loop:
    for (int row_tile = 0; row_tile < row_tiles; ++row_tile) {
    dequant_col_tile_loop:
        for (int col_tile = 0; col_tile < GEMV_COL_TILES; ++col_tile) {
        dequant_group_loop:
            for (int group = 0;
                 group < GEMV_CHUNKS_PER_TILE;
                 ++group) {
                float combined_scale =
                    combined_scale_stream.read();
                const bool initialize_partial =
                    (col_tile == 0) && (group == 0);

            dequant_row_block_loop:
                for (int block = 0;
                     block < GEMV_TILE_ROWS / GEMV_DEQUANT_LANES;
                     ++block) {
#pragma HLS PIPELINE II=1
                    gemv_group_block_t completed_block =
                        group_block_stream.read();

                dequant_lane_loop:
                    for (int lane = 0;
                         lane < GEMV_DEQUANT_LANES;
                         ++lane) {
#pragma HLS UNROLL
                        const int row =
                            block * GEMV_DEQUANT_LANES + lane;
                        gemv_group_acc_t integer_sum =
                            completed_block.range(
                                GEMV_GROUP_ACC_BITS * lane +
                                    GEMV_GROUP_ACC_BITS - 1,
                                GEMV_GROUP_ACC_BITS * lane
                            );
                        float contribution =
                            (float)integer_sum * combined_scale;
                        if (initialize_partial) {
                            partial[row] = contribution;
                        } else {
                            partial[row] += contribution;
                        }
                    }
                }
            }
        }

    pack_dequant_output_word_loop:
        for (int word_index = 0;
             word_index < GEMV_OUTPUT_WORDS_PER_TILE;
             ++word_index) {
            gemv_output_word_t packed_word = 0;

        pack_dequant_output_quarter_loop:
            for (int quarter =
                     GEMV_OUTPUTS_PER_WORD / GEMV_DEQUANT_LANES;
                 quarter > 0;
                 --quarter) {
#pragma HLS PIPELINE II=1
                const int quarter_index = quarter - 1;
                ap_uint<
                    32 * GEMV_DEQUANT_LANES
                > packed_quarter = 0;

            pack_dequant_output_lane_loop:
                for (int lane = 0;
                     lane < GEMV_DEQUANT_LANES;
                     ++lane) {
#pragma HLS UNROLL
                    const int output_lane =
                        quarter_index * GEMV_DEQUANT_LANES +
                        lane;
                    const int row =
                        word_index * GEMV_OUTPUTS_PER_WORD +
                        output_lane;
                    packed_quarter.range(
                        32 * lane + 31,
                        32 * lane
                    ) = gemv_float_to_bits(partial[row]);
                }

                packed_word =
                    (packed_word << (32 * GEMV_DEQUANT_LANES)) |
                    packed_quarter;
            }

            output_stream.write(packed_word);
        }
    }
}

static void run_quantized_streamed_pe(
    const gemv_weight_word_t* weight_mem,
    const gemv_quant_activation_word_t
        activation_cache[GEMV_ACTIVATION_GROUPS],
    const float activation_scale_cache[GEMV_ACTIVATION_GROUPS],
    const float weight_scale_cache[GEMV_MAX_WEIGHT_TILES],
    gemv_output_word_t* output_mem,
    int row_tiles
) {
#pragma HLS INLINE off
#pragma HLS DATAFLOW

    hls::stream<gemv_weight_word_t> weight_stream;
#pragma HLS STREAM variable=weight_stream depth=512

    hls::stream<gemv_group_block_t> group_block_stream;
#pragma HLS STREAM variable=group_block_stream depth=64
#pragma HLS BIND_STORAGE variable=group_block_stream type=fifo impl=bram

    hls::stream<float> combined_scale_stream;
#pragma HLS STREAM variable=combined_scale_stream depth=16

    hls::stream<gemv_output_word_t> output_stream;
#pragma HLS STREAM variable=output_stream depth=8

    const int total_tiles = row_tiles * GEMV_COL_TILES;
    stream_weight_tiles(weight_mem, weight_stream, total_tiles);
    stream_combined_scales(
        activation_scale_cache,
        weight_scale_cache,
        combined_scale_stream,
        row_tiles
    );
    stream_integer_group_blocks(
        weight_stream,
        activation_cache,
        group_block_stream,
        row_tiles
    );
    dequantize_group_blocks(
        group_block_stream,
        combined_scale_stream,
        output_stream,
        row_tiles
    );
    write_output_stream(output_stream, output_mem, row_tiles);
}

void gemv_pe_1ddr_quantized(
    const gemv_weight_word_t* weight_mem,
    const gemv_float_word_t* activation_fp_mem,
    const gemv_float_word_t* weight_scale_mem,
    gemv_float_word_t* output_mem,
    int row_tiles
) {
#pragma HLS INTERFACE m_axi port=weight_mem offset=slave bundle=gmem0 \
    depth=GEMV_MAX_WEIGHT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE m_axi port=activation_fp_mem offset=slave bundle=gmem0 \
    depth=GEMV_ACTIVATION_FP_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE m_axi port=weight_scale_mem offset=slave bundle=gmem0 \
    depth=GEMV_WEIGHT_SCALE_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE m_axi port=output_mem offset=slave bundle=gmem0 \
    depth=GEMV_MAX_OUTPUT_WORDS latency=64 \
    max_read_burst_length=256 max_write_burst_length=256 \
    num_read_outstanding=4 num_write_outstanding=4
#pragma HLS INTERFACE s_axilite port=weight_mem bundle=control
#pragma HLS INTERFACE s_axilite port=activation_fp_mem bundle=control
#pragma HLS INTERFACE s_axilite port=weight_scale_mem bundle=control
#pragma HLS INTERFACE s_axilite port=output_mem bundle=control
#pragma HLS INTERFACE s_axilite port=row_tiles bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    if (row_tiles <= 0) {
        return;
    }
    if (row_tiles > GEMV_MAX_ROW_TILES) {
        row_tiles = GEMV_MAX_ROW_TILES;
    }

    gemv_quant_activation_word_t
        activation_cache[GEMV_ACTIVATION_GROUPS];
    float activation_scale_cache[GEMV_ACTIVATION_GROUPS];
    float weight_scale_cache[GEMV_MAX_WEIGHT_TILES];

#pragma HLS BIND_STORAGE variable=activation_cache type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=activation_scale_cache type=ram_1p impl=bram
#pragma HLS BIND_STORAGE variable=weight_scale_cache type=ram_1p impl=bram

    quantize_activation_g32(
        activation_fp_mem,
        activation_cache,
        activation_scale_cache
    );
    load_weight_scale_cache(
        weight_scale_mem,
        weight_scale_cache,
        row_tiles
    );
    run_quantized_streamed_pe(
        weight_mem,
        activation_cache,
        activation_scale_cache,
        weight_scale_cache,
        output_mem,
        row_tiles
    );
}
