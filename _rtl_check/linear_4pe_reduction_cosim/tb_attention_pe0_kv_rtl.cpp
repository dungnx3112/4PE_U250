#define SWIFTKV_COSIM_SHORT_SEQUENCE
#define SWIFTKV_COSIM_LAYER_DEPTH
#include "swiftkv_attention.hpp"

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>

extern "C" void attn0kv(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],
    int4_output_word_t kv_cache[SWIFTKV_KV_AXI_DEPTH],
    const int4_output_word_t rope_lut[SWIFTKV_ROPE_DDR_WORDS],
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],
    int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS],
    ap_uint<12> position);

static int4_output_word_t pack_fxp(unsigned seed, int position) {
    int4_output_word_t word = 0;
    for (int lane = 0; lane < INT4_OUTPUTS_PER_WORD; ++lane) {
        const int index = position * INT4_OUTPUTS_PER_WORD + lane;
        // Deterministic signed Q15.17 values in roughly [-1.75, 1.75].
        int32_t raw = (int32_t)((index * (37U + seed) + seed * 101U) % 458753U)
                    - 229376;
        word.range(32 * lane + 31, 32 * lane) = (uint32_t)raw;
    }
    return word;
}

static bool read_word512(FILE* file, int4_output_word_t& word) {
    uint64_t lanes[8];
    if (std::fread(lanes, sizeof(uint64_t), 8, file) != 8) return false;
    word = 0;
    for (int lane = 0; lane < 8; ++lane)
        word.range(64 * lane + 63, 64 * lane) = lanes[lane];
    return true;
}

static uint64_t hash_output(
    const int4_quant_word_t q[INT4_MAX_LOCAL_GROUPS],
    const int4_act_scale_t s[INT4_MAX_LOCAL_GROUPS]) {
    const int groups = SWIFTKV_LOCAL_HEADS *
        (SWIFTKV_HEAD_SIZE / INT4_GROUP_SIZE);
    uint64_t hash = 1469598103934665603ULL;
    for (int group = 0; group < groups; ++group) {
        for (int lane = 0; lane < 7; ++lane) {
            const uint64_t bits = q[group].range(64 * lane + 63, 64 * lane).to_uint64();
            hash ^= bits;
            hash *= 1099511628211ULL;
        }
        hash ^= (uint8_t)s[group];
        hash *= 1099511628211ULL;
    }
    return hash;
}

int main() {
    const char* directory = std::getenv("ATTN_REAL_VECTOR_DIR");
    if (!directory || !directory[0]) return 2;

    static int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE];
    static int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE];
    static int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE];
    static int4_output_word_t kv_cache[SWIFTKV_KV_AXI_DEPTH];
    static int4_output_word_t rope_lut[SWIFTKV_ROPE_DDR_WORDS];
    static int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS];
    static int4_act_scale_t activation_scale[INT4_MAX_LOCAL_GROUPS];

    const std::string path = std::string(directory) + "/rope_lut.bin";
    FILE* file = std::fopen(path.c_str(), "rb");
    if (!file) return 3;
    for (int word = 0; word < SWIFTKV_ROPE_DDR_WORDS; ++word)
        if (!read_word512(file, rope_lut[word])) return 4;
    std::fclose(file);

    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
        q[word] = pack_fxp(3, word);
        k[word] = pack_fxp(11, word);
        v[word] = pack_fxp(29, word);
    }
    std::memset(kv_cache, 0, sizeof(kv_cache));
    std::memset(activation_q, 0, sizeof(activation_q));
    std::memset(activation_scale, 0, sizeof(activation_scale));

    attn0kv(q, k, v, kv_cache, rope_lut,
            activation_q, activation_scale, (ap_uint<12>)0);
    const uint64_t hash0 = hash_output(activation_q, activation_scale);

    // Use different current-token Q/K/V. Position 1 must combine this record
    // with the position-0 record already stored in external KV memory.
    for (int word = 0; word < INT4_VECTOR_WORDS_PER_PE; ++word) {
        q[word] = pack_fxp(43, word);
        k[word] = pack_fxp(61, word);
        v[word] = pack_fxp(79, word);
    }
    attn0kv(q, k, v, kv_cache, rope_lut,
            activation_q, activation_scale, (ap_uint<12>)1);
    const uint64_t hash1 = hash_output(activation_q, activation_scale);

    std::printf("PASS: PE0 attention+KV pos0=%016llx pos1=%016llx\n",
        (unsigned long long)hash0, (unsigned long long)hash1);
    // Fixed C-model oracle.  Vitis' automatic pointer comparison can miss a
    // state error spanning two top-level transactions, because kv_cache is
    // both an input and an output.  These hashes make that mismatch fatal in
    // the post-check executable as well.
    const uint64_t expected0 = 0xf93d262d08160f1bULL;
    const uint64_t expected1 = 0x79a79ee8fe403198ULL;
    if (hash0 != expected0 || hash1 != expected1) {
        std::fprintf(stderr,
            "ERROR: attention/KV hash mismatch: got %016llx/%016llx expected %016llx/%016llx\n",
            (unsigned long long)hash0, (unsigned long long)hash1,
            (unsigned long long)expected0, (unsigned long long)expected1);
        return 5;
    }
    return 0;
}
