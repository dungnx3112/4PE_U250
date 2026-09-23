#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <chrono>
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <thread>
#include <windows.h>

#include "int4_decoder_multikernel.hpp"
#include "int4_types.hpp"
#include "int4_model_layout.hpp"
#include "swiftkv_attention.hpp"

// HLS Math wrappers for C-simulation outside Vitis HLS compiler
namespace hls {
    float ldexpf(float x, int exp) { return std::ldexp(x, exp); }
    float frexpf(float x, int* exp) { return std::frexpf(x, exp); }
    float rsqrtf(float x) { return 1.0f / std::sqrt(x); }
    float expf(float x) { return std::exp(x); }
}

static constexpr int NUM_PES           = 4;
static constexpr int DIM               = 4096;
static constexpr int VOCAB_SIZE        = 32000;
static constexpr int PADDED_VOCAB_SIZE = 32256;
static constexpr int NUM_LAYERS        = 32;
static constexpr int MAX_SEQ_LEN       = 4096;

static constexpr int OUTPUTS_PER_WORD  = 16;
static constexpr int DDR_WORD_BYTES    = 64;

static constexpr size_t MODEL_BANK_BYTES = (size_t)INT4_MODEL_WORDS_PER_DDR * DDR_WORD_BYTES;
static constexpr size_t ROPE_LUT_BYTES   = 32768ULL * DDR_WORD_BYTES; // 2,097,152
static constexpr size_t LOCAL_HEADS      = 8;
static constexpr int KV_WORDS_PER_TOKEN_HEAD = 5;
static constexpr size_t KV_WORDS_PER_PE  = (size_t)NUM_LAYERS * LOCAL_HEADS * MAX_SEQ_LEN * KV_WORDS_PER_TOKEN_HEAD;
static constexpr size_t KV_BYTES_PER_PE  = KV_WORDS_PER_PE * DDR_WORD_BYTES;

// Memory mapping helper
struct MappedFile {
    HANDLE hFile = INVALID_HANDLE_VALUE;
    HANDLE hMap  = NULL;
    void*  ptr   = nullptr;
    size_t size  = 0;

    bool open_and_map(const char* filepath, size_t expected_size) {
        size = expected_size;
        hFile = CreateFileA(filepath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
        if (hFile == INVALID_HANDLE_VALUE) {
            std::cerr << "[-] Failed to open: " << filepath << " (Error: " << GetLastError() << ")\n";
            return false;
        }
        hMap = CreateFileMappingA(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
        if (!hMap) {
            std::cerr << "[-] Failed to create map for: " << filepath << "\n";
            CloseHandle(hFile);
            return false;
        }
        ptr = MapViewOfFile(hMap, FILE_MAP_READ, 0, 0, 0);
        if (!ptr) {
            std::cerr << "[-] Failed to map view for: " << filepath << "\n";
            CloseHandle(hMap);
            CloseHandle(hFile);
            return false;
        }
        std::cout << "[+] Memory-mapped: " << filepath << " (" << expected_size / (1024 * 1024) << " MB)\n";
        return true;
    }

    void close() {
        if (ptr) UnmapViewOfFile(ptr);
        if (hMap) CloseHandle(hMap);
        if (hFile != INVALID_HANDLE_VALUE) CloseHandle(hFile);
        ptr = nullptr;
    }

    ~MappedFile() { close(); }
};

int main(int argc, char** argv) {
    std::cout << "=========================================================\n";
    std::cout << "   LLaMA-2 7B 4-CU Multi-Kernel Concurrent Hardware Testbench\n";
    std::cout << "=========================================================\n\n";

    // 1. Map weights
    MappedFile mb[4];
    for (int p = 0; p < 4; ++p) {
        char path[64];
        snprintf(path, sizeof(path), "model_bank%d.bin", p);
        if (!mb[p].open_and_map(path, MODEL_BANK_BYTES)) return 1;
    }
    MappedFile rope_f;
    if (!rope_f.open_and_map("rope_lut.bin", ROPE_LUT_BYTES)) return 1;

    MappedFile emb_f;
    if (!emb_f.open_and_map("embeddings.bin", (size_t)VOCAB_SIZE * DIM * sizeof(float))) return 1;

    const int4_weight_word_t* model_bank_pe[4] = {
        (const int4_weight_word_t*)mb[0].ptr,
        (const int4_weight_word_t*)mb[1].ptr,
        (const int4_weight_word_t*)mb[2].ptr,
        (const int4_weight_word_t*)mb[3].ptr
    };
    const int4_output_word_t* rope_lut_pe[4] = {
        (const int4_output_word_t*)rope_f.ptr,
        (const int4_output_word_t*)rope_f.ptr,
        (const int4_output_word_t*)rope_f.ptr,
        (const int4_output_word_t*)rope_f.ptr
    };
    const float* embedding_table = (const float*)emb_f.ptr;

    // 2. Allocate buffers
    int4_output_word_t residual_pe[4][INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t logits_pe[4][INT4_LOGIT_WORDS_PER_PE];
    int4_output_word_t* kv_cache_pe[4];
    for (int p = 0; p < 4; ++p) {
        kv_cache_pe[p] = (int4_output_word_t*)calloc(KV_WORDS_PER_PE, sizeof(int4_output_word_t));
        assert(kv_cache_pe[p] != nullptr);
    }

    std::cout << "[+] Buffers allocated.\n";

    // 3. Prepare token 1 (BOS) at pos = 0
    int token = 1;
    int position = 0;
    const float* emb = embedding_table + token * DIM;
    for (int p = 0; p < 4; ++p) {
        for (int w = 0; w < INT4_VECTOR_WORDS_PER_PE; ++w) {
            int4_output_word_t word = 0;
            for (int lane = 0; lane < 16; ++lane) {
                int dim_idx = p * 1024 + w * 16 + lane;
                float val = emb[dim_idx];
                uint32_t bits;
                std::memcpy(&bits, &val, 4);
                word.range(lane * 32 + 31, lane * 32) = bits;
            }
            residual_pe[p][w] = word;
        }
    }

    std::cout << "[+] Running pos=0, token=" << token << " across 4 CUs in parallel...\n";

    // 4. Create the 6 inter-SLR streams
    hls::stream<float> rms_pe0_to_pe1("rms_pe0_to_pe1");
    hls::stream<float> rms_pe1_to_pe0("rms_pe1_to_pe0");
    hls::stream<float> rms_pe2_to_pe1("rms_pe2_to_pe1");
    hls::stream<float> rms_pe1_to_pe2("rms_pe1_to_pe2");
    hls::stream<float> rms_pe3_to_pe2("rms_pe3_to_pe2");
    hls::stream<float> rms_pe2_to_pe3("rms_pe2_to_pe3");

    hls::stream<int4_reduction_packet_t> linear_partial_pe0_to_pe1("linear_partial_pe0_to_pe1");
    hls::stream<int4_reduction_packet_t> linear_output_pe1_to_pe0("linear_output_pe1_to_pe0");
    hls::stream<int4_reduction_packet_t> linear_sum_pe1_to_pe2("linear_sum_pe1_to_pe2");
    hls::stream<int4_reduction_packet_t> linear_sum_pe2_to_pe1("linear_sum_pe2_to_pe1");
    hls::stream<int4_reduction_packet_t> linear_partial_pe3_to_pe2("linear_partial_pe3_to_pe2");
    hls::stream<int4_reduction_packet_t> linear_output_pe2_to_pe3("linear_output_pe2_to_pe3");

    auto t0 = std::chrono::high_resolution_clock::now();

    std::thread th0([&]() {
        std::cout << "  [PE0] thread started\n";
        int4_decoder_pe0_kernel(
            position, model_bank_pe[0], rope_lut_pe[0], residual_pe[0], logits_pe[0], kv_cache_pe[0],
            rms_pe0_to_pe1, rms_pe1_to_pe0,
            linear_partial_pe0_to_pe1, linear_output_pe1_to_pe0);
        std::cout << "  [PE0] thread DONE\n";
    });

    std::thread th1([&]() {
        std::cout << "  [PE1] thread started\n";
        int4_decoder_pe1_kernel(
            position, model_bank_pe[1], rope_lut_pe[1], residual_pe[1], logits_pe[1], kv_cache_pe[1],
            rms_pe0_to_pe1, rms_pe1_to_pe0,
            rms_pe2_to_pe1, rms_pe1_to_pe2,
            linear_partial_pe0_to_pe1, linear_output_pe1_to_pe0,
            linear_sum_pe2_to_pe1, linear_sum_pe1_to_pe2);
        std::cout << "  [PE1] thread DONE\n";
    });

    std::thread th2([&]() {
        std::cout << "  [PE2] thread started\n";
        int4_decoder_pe2_kernel(
            position, model_bank_pe[2], rope_lut_pe[2], residual_pe[2], logits_pe[2], kv_cache_pe[2],
            rms_pe1_to_pe2, rms_pe2_to_pe1,
            rms_pe3_to_pe2, rms_pe2_to_pe3,
            linear_sum_pe1_to_pe2, linear_sum_pe2_to_pe1,
            linear_partial_pe3_to_pe2, linear_output_pe2_to_pe3);
        std::cout << "  [PE2] thread DONE\n";
    });

    std::thread th3([&]() {
        std::cout << "  [PE3] thread started\n";
        int4_decoder_pe3_kernel(
            position, model_bank_pe[3], rope_lut_pe[3], residual_pe[3], logits_pe[3], kv_cache_pe[3],
            rms_pe3_to_pe2, rms_pe2_to_pe3,
            linear_partial_pe3_to_pe2, linear_output_pe2_to_pe3);
        std::cout << "  [PE3] thread DONE\n";
    });

    th0.join();
    th1.join();
    th2.join();
    th3.join();

    auto t1 = std::chrono::high_resolution_clock::now();
    double dt = std::chrono::duration<double>(t1 - t0).count();
    std::cout << "\n[+] All 4 CUs completed in " << dt << " seconds!\n";
    std::cout << "[Streams Remaining]:\n";
    std::cout << "  rms_pe0_to_pe1: " << rms_pe0_to_pe1.size() << "\n";
    std::cout << "  rms_pe1_to_pe0: " << rms_pe1_to_pe0.size() << "\n";
    std::cout << "  rms_pe2_to_pe1: " << rms_pe2_to_pe1.size() << "\n";
    std::cout << "  rms_pe1_to_pe2: " << rms_pe1_to_pe2.size() << "\n";
    std::cout << "  rms_pe3_to_pe2: " << rms_pe3_to_pe2.size() << "\n";
    std::cout << "  rms_pe2_to_pe3: " << rms_pe2_to_pe3.size() << "\n";
    std::cout << "  linear_partial_pe0_to_pe1: " << linear_partial_pe0_to_pe1.size() << "\n";
    std::cout << "  linear_output_pe1_to_pe0: " << linear_output_pe1_to_pe0.size() << "\n";
    std::cout << "  linear_sum_pe1_to_pe2: " << linear_sum_pe1_to_pe2.size() << "\n";
    std::cout << "  linear_sum_pe2_to_pe1: " << linear_sum_pe2_to_pe1.size() << "\n";
    std::cout << "  linear_partial_pe3_to_pe2: " << linear_partial_pe3_to_pe2.size() << "\n";
    std::cout << "  linear_output_pe2_to_pe3: " << linear_output_pe2_to_pe3.size() << "\n";
    std::cout.flush();

    // 5. Check logits
    std::vector<float> logits(VOCAB_SIZE, 0.0f);
    for (int p = 0; p < 4; ++p) {
        for (int w = 0; w < INT4_LOGIT_WORDS_PER_PE; ++w) {
            for (int lane = 0; lane < 16; ++lane) {
                int idx = p * 8064 + w * 16 + lane;
                if (idx < VOCAB_SIZE) {
                    uint32_t u = logits_pe[p][w].range(lane * 32 + 31, lane * 32).to_uint();
                    union { uint32_t u; float f; } un;
                    un.u = u;
                    logits[idx] = un.f;
                }
            }
        }
    }

    int next_token = 0;
    float max_l = -1e9f;
    for (int i = 0; i < VOCAB_SIZE; ++i) {
        if (logits[i] > max_l) {
            max_l = logits[i];
            next_token = i;
        }
    }
    std::cout << "[+] Top token: " << next_token << " (logit=" << max_l << ")\n";

    for (int p = 0; p < 4; ++p) free(kv_cache_pe[p]);
    return 0;
}
