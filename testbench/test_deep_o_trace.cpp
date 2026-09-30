#include "int4_linear_controller.hpp"
#include "int4_model_layout.hpp"

#include <iostream>
#include <vector>

static bool expect_zero(
    const std::vector<int4_output_word_t>& trace,
    int first, int words, const char* region, int mode) {
    for (int word = 0; word < words; ++word) {
        if (trace[INT4_STAGE_TRACE_BASE_WORD + first + word] != 0) {
            std::cerr << "mode " << mode << " deep trace " << region
                      << " was not drained at word " << word << "\n";
            return false;
        }
    }
    return true;
}

static bool expect_written(
    const std::vector<int4_output_word_t>& trace,
    int first, int words, const char* region, int mode) {
    const int4_output_word_t sentinel = ~int4_output_word_t(0);
    for (int word = 0; word < words; ++word) {
        if (trace[INT4_STAGE_TRACE_BASE_WORD + first + word] == sentinel) {
            std::cerr << "mode " << mode << " deep trace " << region
                      << " was not written at word " << word << "\n";
            return false;
        }
    }
    return true;
}

static bool run_mode(int mode) {
    // Address zero is sufficient for this producer/drain/layout test and
    // avoids allocating every matrix that precedes the selected operation.
    const int weight_offset = 0;
    const int matrix_weight_words = int4_matrix_data_words(mode);
    // Keep the pointer allocation equal to the depth declared by the RTL
    // co-sim wrapper for every transaction, including the smaller modes.
    const int weight_words = INT4_LOGITS_DATA_WORDS_PER_PE;
    std::vector<int4_weight_word_t> weights(weight_words);
    std::vector<int4_output_word_t> trace(INT4_LAYER_TRACE_WORDS_PER_PE);
    for (std::size_t word = 0; word < trace.size(); ++word) {
        trace[word] = ~int4_output_word_t(0);
    }

    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS] = {};
    int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS] = {};
#ifdef INT4_RTL_COSIM_STIMULUS
    // Non-zero, deterministic operands make C/RTL co-simulation exercise the
    // packed MAC, scale multiply, accumulation and every dynamic trace size.
    for (int word = 0; word < matrix_weight_words; ++word) {
        for (int byte = 0; byte < 64; ++byte) {
            weights[word].range(8 * byte + 7, 8 * byte) =
                (ap_uint<8>)(0x11U + ((word + byte) & 0x22U));
        }
    }
    for (int group = 0; group < INT4_MAX_LOCAL_GROUPS; ++group) {
        int4_quant_word_t packed = 0;
        for (int lane = 0; lane < INT4_GROUP_SIZE; ++lane) {
            const ap_int<INT4_ACTIVATION_BITS> value =
                (ap_int<INT4_ACTIVATION_BITS>)
                    (((group * 3 + lane * 5) % 31) - 15);
            packed.range(
                INT4_ACTIVATION_BITS * lane + INT4_ACTIVATION_BITS - 1,
                INT4_ACTIVATION_BITS * lane) = value;
        }
        activation_q[group] = packed;
        activation_scale[group] = (int4_act_scale_t)(124 + group % 7);
    }
#endif
    int4_output_word_t output[INT4_MAX_LOCAL_OUTPUT_WORDS] = {};
    hls::stream<int4_reduction_packet_t> partial;
    hls::stream<int4_reduction_packet_t> completed;

    const int completed_packets =
        int4_mode_local_output_tiles(mode) * INT4_ROW_BLOCKS;
    for (int packet = 0; packet < completed_packets; ++packet) {
        completed.write(0);
    }

    int4_linear_local_stage_pe0(
        weights.data(), activation_q, activation_scale, output,
        (ap_uint<3>)mode, (ap_uint<24>)weight_offset, true,
        partial, completed, trace.data());

    const int expected_partial_packets =
        int4_mode_output_tiles(mode) * INT4_ROW_BLOCKS;
    if ((int)partial.size() != expected_partial_packets) {
        std::cerr << "mode " << mode << " partial packet count mismatch\n";
        return false;
    }
    for (int packet = 0; packet < expected_partial_packets; ++packet) {
        (void)partial.read();
    }

    const int groups = int4_mode_local_groups(mode);
    const int audit_words =
        groups * INT4_Q_DEEP_ROWS / INT4_OUTPUTS_PER_WORD;
    const int partial_words =
        int4_mode_padded_output_rows(mode) / INT4_OUTPUTS_PER_WORD;
#ifdef INT4_RTL_COSIM_STIMULUS
    if (!expect_written(trace, INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD,
                        partial_words, "local partial", mode) ||
        !expect_written(trace, INT4_STAGE_TRACE_Q_GROUP_DOT_WORD,
                        audit_words, "group dot", mode) ||
        !expect_written(trace, INT4_STAGE_TRACE_Q_WEIGHT_SCALE_WORD,
                        audit_words, "weight scale", mode) ||
        !expect_written(trace, INT4_STAGE_TRACE_Q_CUMULATIVE_WORD,
                        audit_words, "cumulative", mode) ||
        !expect_written(trace, INT4_STAGE_TRACE_Q_ACTIVATION_WORD,
                        groups, "activation", mode) ||
        !expect_written(trace, INT4_STAGE_TRACE_Q_WEIGHT_WORD,
                        groups, "weight", mode)) {
        return false;
    }
#else
    if (!expect_zero(trace, INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD,
                     partial_words, "local partial", mode) ||
        !expect_zero(trace, INT4_STAGE_TRACE_Q_GROUP_DOT_WORD,
                     audit_words, "group dot", mode) ||
        !expect_zero(trace, INT4_STAGE_TRACE_Q_WEIGHT_SCALE_WORD,
                     audit_words, "weight scale", mode) ||
        !expect_zero(trace, INT4_STAGE_TRACE_Q_CUMULATIVE_WORD,
                     audit_words, "cumulative", mode) ||
        !expect_zero(trace, INT4_STAGE_TRACE_Q_ACTIVATION_WORD,
                     groups, "activation", mode) ||
        !expect_zero(trace, INT4_STAGE_TRACE_Q_WEIGHT_WORD,
                     groups, "weight", mode)) {
        return false;
    }
#endif

    // Unused capacity must remain untouched; otherwise one selector can hide
    // an overrun that corrupts the next region for a smaller operation.
    if (partial_words < INT4_Q_LOCAL_PARTIAL_WORDS &&
        trace[INT4_STAGE_TRACE_BASE_WORD +
              INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD + partial_words] !=
            ~int4_output_word_t(0)) {
        std::cerr << "mode " << mode << " local-partial capacity overrun\n";
        return false;
    }
    if (groups < INT4_DEEP_MAX_LOCAL_GROUPS &&
        trace[INT4_STAGE_TRACE_BASE_WORD +
              INT4_STAGE_TRACE_Q_ACTIVATION_WORD + groups] !=
            ~int4_output_word_t(0)) {
        std::cerr << "mode " << mode << " activation capacity overrun\n";
        return false;
    }
    return true;
}

int main() {
    const int modes[] = {
        INT4_LINEAR_Q,
        INT4_LINEAR_K,
        INT4_LINEAR_V,
        INT4_LINEAR_O,
        INT4_LINEAR_GATE,
        INT4_LINEAR_UP,
        INT4_LINEAR_DOWN,
        INT4_LINEAR_LOGITS,
    };
    for (unsigned int index = 0;
         index < sizeof(modes) / sizeof(modes[0]); ++index) {
        if (!run_mode(modes[index])) return 1;
    }
    std::cout << "runtime-selectable deep linear trace test passed\n";
    return 0;
}
