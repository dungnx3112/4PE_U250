#include "int4_linear_controller.hpp"
#include "int4_model_layout.hpp"

#include <iostream>
#include <vector>

int main() {
    const int mode = INT4_LINEAR_O;
    const int weight_offset = int4_weight_offset(0, mode);
    const int weight_words = weight_offset + int4_matrix_data_words(mode);

    std::vector<int4_weight_word_t> weights(weight_words);
    std::vector<int4_output_word_t> trace(INT4_LAYER_TRACE_WORDS_PER_PE);
    for (std::size_t word = 0; word < trace.size(); ++word) {
        trace[word] = ~int4_output_word_t(0);
    }

    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS] = {};
    int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS] = {};
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
        (ap_uint<3>)mode, (ap_uint<24>)weight_offset,
        partial, completed, trace.data());

    const int expected_partial_packets =
        int4_mode_output_tiles(mode) * INT4_ROW_BLOCKS;
    if ((int)partial.size() != expected_partial_packets) {
        std::cerr << "partial packet count mismatch\n";
        return 1;
    }
    for (int packet = 0; packet < expected_partial_packets; ++packet) {
        (void)partial.read();
    }
    for (int word = INT4_STAGE_TRACE_Q_LOCAL_PARTIAL_WORD;
         word < INT4_STAGE_TRACE_WORDS_PER_PE;
         ++word) {
        if (trace[INT4_STAGE_TRACE_BASE_WORD + word] != 0) {
            std::cerr << "O deep trace was not drained at word " << word << "\n";
            return 1;
        }
    }

    std::cout << "deep O trace producer/drain test passed\n";
    return 0;
}
