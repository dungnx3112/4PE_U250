#include "int4_types.hpp"
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <vector>

extern "C" void linear_hardened_rtl_test(
    const int4_weight_word_t model[46464],
    const int4_quant_word_t q[INT4_MAX_LOCAL_GROUPS],
    const int4_act_scale_t scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<3> mode, ap_uint<8> output_tiles, bool gaps,
    int4_reduction_packet_t output[512]);

#ifdef INT4_DEBUG_NATIVE_MATH
namespace hls { float ldexpf(float x, int n) { return std::ldexp(x, n); } }
#endif

static int q_value(int group, int column, int pattern) {
    if (pattern == 1) return -8192;
    if (pattern == 2) return 0;
    return ((group * 137 + column * 719 + 31) & 16383) - 8192;
}
static int weight_value(int tile, int group, int row, int lane, int column, int pattern) {
    if (pattern == 1) return -8;
    return ((tile * 5 + group * 3 + row * 7 + lane * 11 + column * 13) & 15) - 8;
}
static int scale_value(int tile, int row, int lane, int g128, int pattern) {
    if (pattern == 2) return lane & 1 ? -32768 : 32767;
    return ((tile * 997 + row * 1009 + lane * 8191 + g128 * 313 + 19) & 65535) - 32768;
}
static uint32_t bits(float x) {
    uint32_t result;
    std::memcpy(&result, &x, sizeof(result));
    return result;
}

static int run_case(int mode, int output_tiles, bool gaps, int pattern) {
    const int input_tiles = mode == INT4_LINEAR_DOWN ? 11 : 4;
    const int groups = input_tiles * 8;
    const int tiles = output_tiles * input_tiles;
    std::vector<int4_weight_word_t> model(46464);
    std::vector<int4_quant_word_t> q(INT4_MAX_LOCAL_GROUPS);
    std::vector<int4_act_scale_t> scale(INT4_MAX_LOCAL_GROUPS);
    std::vector<int4_reduction_packet_t> output(512);
    for (int group = 0; group < groups; ++group) {
        scale[group] = 118 + group % 12;
        for (int column = 0; column < 32; ++column)
            q[group].range(14 * column + 13, 14 * column) =
                int4_activation_t(q_value(group, column, pattern));
    }
    for (int tile = 0; tile < tiles; ++tile) {
        const int block_base = (tile / 16) * 4224;
        for (int row = 0; row < 32; ++row) {
            int4_weight_word_t& packed_scales = model[block_base + (tile % 16) * 8 + row / 4];
            for (int lane = 0; lane < 4; ++lane)
                for (int g128 = 0; g128 < 2; ++g128) {
                    const int scalar = (row % 4) * 8 + lane * 2 + g128;
                    packed_scales.range(16 * scalar + 15, 16 * scalar) =
                        int4_weight_scale_t(scale_value(tile, row, lane, g128, pattern));
                }
        }
        for (int group = 0; group < 8; ++group)
            for (int row = 0; row < 32; ++row) {
                int4_weight_word_t& word = model[block_base + 128 + (tile % 16) * 256 + group * 32 + row];
                const int nibble[4] = {1, 0, 3, 2};
                for (int lane = 0; lane < 4; ++lane)
                    for (int column = 0; column < 32; ++column) {
                        const int offset = column * 16 + nibble[lane] * 4;
                        word.range(offset + 3, offset) = int4_weight_t(
                            weight_value(tile, group, row, lane, column, pattern));
                    }
            }
    }
    linear_hardened_rtl_test(model.data(), q.data(), scale.data(),
        mode, output_tiles, gaps, output.data());
    int failures = 0;
    for (int ot = 0; ot < output_tiles; ++ot)
        for (int row = 0; row < 32; ++row)
            for (int lane = 0; lane < 4; ++lane) {
                float expected = 0;
                for (int group = 0; group < groups; ++group) {
                    const int tile = ot * input_tiles + group / 8;
                    int sum = 0;
                    for (int column = 0; column < 32; ++column)
                        sum += q_value(group, column, pattern) *
                            weight_value(tile, group % 8, row, lane, column, pattern);
                    const float ws = float(scale_value(tile, row, lane, (group % 8) / 4, pattern)) / 32768.0f;
                    const float as = std::ldexp(1.0f, int(scale[group]) - 140);
                    const float combined = ws * as;
                    const float contribution = float(sum) * combined;
                    expected = group == 0 ? contribution : expected + contribution;
                }
                const uint32_t actual = output[ot * 32 + row].range(32 * lane + 31, 32 * lane);
                if (actual != bits(expected)) {
                    if (failures < 3) std::printf("MISMATCH tile=%d row=%d lane=%d expected=%08x actual=%08x\n",
                        ot, row, lane, bits(expected), actual);
                    ++failures;
                }
            }
    std::printf("%s mode=%d output_tiles=%d groups=%d gaps=%d pattern=%d checked=%d failures=%d\n",
        failures ? "FAIL" : "PASS", mode, output_tiles, groups, int(gaps), pattern,
        output_tiles * 128, failures);
    return failures;
}

int main() {
    int failures = 0;
    failures += run_case(INT4_LINEAR_O, 4, true, 0);
    failures += run_case(INT4_LINEAR_DOWN, 16, true, 1);
    failures += run_case(INT4_LINEAR_O, 4, false, 2);
    // Sustained nonzero input with no artificial gaps exposes pipeline
    // recurrence bugs and provides a comparable RTL throughput measurement.
    failures += run_case(INT4_LINEAR_O, 16, false, 0);
    std::printf("%s LINEAR_HARDENED_FULL_PATH checked=5120_fp32_lanes failures=%d\n",
        failures ? "FAIL" : "PASS", failures);
    return failures ? 1 : 0;
}
