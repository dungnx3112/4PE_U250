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
#include "int4_decoder_blocks.hpp"
#include "int4_decoder_local.hpp"
#include "int4_linear_controller.hpp"
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

    // 4. Native C simulation of the controller DATAFLOW graph. HLS schedules
    // these processes concurrently in RTL; std::thread provides the same
    // blocking-stream semantics when this testbench is compiled with g++.
    hls::stream<int4_position_command_t> position_pe0("position_pe0");
    hls::stream<int4_position_command_t> position_pe1("position_pe1");
    hls::stream<int4_position_command_t> position_pe2("position_pe2");
    hls::stream<int4_position_command_t> position_pe3("position_pe3");
    position_pe0.write(position);
    position_pe1.write(position);
    position_pe2.write(position);
    position_pe3.write(position);

    hls::stream<float> rms_partial0("rms_partial0");
    hls::stream<float> rms_partial1("rms_partial1");
    hls::stream<float> rms_partial2("rms_partial2");
    hls::stream<float> rms_partial3("rms_partial3");
    hls::stream<float> rms_reciprocal0("rms_reciprocal0");
    hls::stream<float> rms_reciprocal1("rms_reciprocal1");
    hls::stream<float> rms_reciprocal2("rms_reciprocal2");
    hls::stream<float> rms_reciprocal3("rms_reciprocal3");
    hls::stream<float> rms_sum23_to01("rms_sum23_to01");
    hls::stream<float> rms_reciprocal01_to23("rms_reciprocal01_to23");

    hls::stream<int4_reduction_packet_t> linear_partial0("linear_partial0");
    hls::stream<int4_reduction_packet_t> linear_partial1("linear_partial1");
    hls::stream<int4_reduction_packet_t> linear_partial2("linear_partial2");
    hls::stream<int4_reduction_packet_t> linear_partial3("linear_partial3");
    hls::stream<int4_reduction_packet_t> linear_sum01_local("linear_sum01_local");
    hls::stream<int4_reduction_packet_t> linear_sum01_to23("linear_sum01_to23");
    hls::stream<int4_reduction_packet_t> linear_sum23_local("linear_sum23_local");
    hls::stream<int4_reduction_packet_t> linear_sum23_to01("linear_sum23_to01");
    hls::stream<int4_reduction_packet_t> linear_output0("linear_output0");
    hls::stream<int4_reduction_packet_t> linear_output1("linear_output1");
    hls::stream<int4_reduction_packet_t> linear_output2("linear_output2");
    hls::stream<int4_reduction_packet_t> linear_output3("linear_output3");

    auto t0 = std::chrono::high_resolution_clock::now();

    std::thread th0([&]() {
        std::cout << "  [PE0] thread started\n";
        int4_decoder_local_pe_0(
            model_bank_pe[0], rope_lut_pe[0], residual_pe[0], logits_pe[0], kv_cache_pe[0],
            position_pe0, rms_partial0, rms_reciprocal0,
            linear_partial0, linear_output0);
        std::cout << "  [PE0] thread DONE\n";
    });

    std::thread th1([&]() {
        std::cout << "  [PE1] thread started\n";
        int4_decoder_local_pe_1(
            model_bank_pe[1], rope_lut_pe[1], residual_pe[1], logits_pe[1], kv_cache_pe[1],
            position_pe1, rms_partial1, rms_reciprocal1,
            linear_partial1, linear_output1);
        std::cout << "  [PE1] thread DONE\n";
    });

    std::thread th2([&]() {
        std::cout << "  [PE2] thread started\n";
        int4_decoder_local_pe_2(
            model_bank_pe[2], rope_lut_pe[2], residual_pe[2], logits_pe[2], kv_cache_pe[2],
            position_pe2, rms_partial2, rms_reciprocal2,
            linear_partial2, linear_output2);
        std::cout << "  [PE2] thread DONE\n";
    });

    std::thread th3([&]() {
        std::cout << "  [PE3] thread started\n";
        int4_decoder_local_pe_3(
            model_bank_pe[3], rope_lut_pe[3], residual_pe[3], logits_pe[3], kv_cache_pe[3],
            position_pe3, rms_partial3, rms_reciprocal3,
            linear_partial3, linear_output3);
        std::cout << "  [PE3] thread DONE\n";
    });

    std::thread rms01([&]() {
        int4_rms_pair01_schedule(
            rms_partial0, rms_partial1, rms_sum23_to01,
            rms_reciprocal0, rms_reciprocal1, rms_reciprocal01_to23);
    });
    std::thread rms23_reduce([&]() {
        int4_rms_pair23_reduce_schedule(
            rms_partial2, rms_partial3, rms_sum23_to01);
    });
    std::thread rms23_distribute([&]() {
        int4_rms_pair23_distribute_schedule(
            rms_reciprocal01_to23, rms_reciprocal2, rms_reciprocal3);
    });
    std::thread linear01_reduce([&]() {
        int4_linear_reduce_pair01_schedule(
            linear_partial0, linear_partial1,
            linear_sum01_local, linear_sum01_to23);
    });
    std::thread linear23_reduce([&]() {
        int4_linear_reduce_pair23_schedule(
            linear_partial2, linear_partial3,
            linear_sum23_local, linear_sum23_to01);
    });
    std::thread linear01_finalize([&]() {
        int4_linear_finalize_pair01_schedule(
            linear_sum01_local, linear_sum23_to01,
            linear_output0, linear_output1);
    });
    std::thread linear23_finalize([&]() {
        int4_linear_finalize_pair23_schedule(
            linear_sum23_local, linear_sum01_to23,
            linear_output2, linear_output3);
    });

    th0.join();
    th1.join();
    th2.join();
    th3.join();
    rms01.join();
    rms23_reduce.join();
    rms23_distribute.join();
    linear01_reduce.join();
    linear23_reduce.join();
    linear01_finalize.join();
    linear23_finalize.join();

    auto t1 = std::chrono::high_resolution_clock::now();
    double dt = std::chrono::duration<double>(t1 - t0).count();
    std::cout << "\n[+] All 4 CUs completed in " << dt << " seconds!\n";
    std::cout << "[Streams Remaining]:\n";
    std::cout << "  rms: "
              << rms_partial0.size() + rms_partial1.size()
                   + rms_partial2.size() + rms_partial3.size()
                   + rms_reciprocal0.size() + rms_reciprocal1.size()
                   + rms_reciprocal2.size() + rms_reciprocal3.size()
                   + rms_sum23_to01.size() + rms_reciprocal01_to23.size()
              << "\n";
    std::cout << "  linear: "
              << linear_partial0.size() + linear_partial1.size()
                   + linear_partial2.size() + linear_partial3.size()
                   + linear_sum01_local.size() + linear_sum01_to23.size()
                   + linear_sum23_local.size() + linear_sum23_to01.size()
                   + linear_output0.size() + linear_output1.size()
                   + linear_output2.size() + linear_output3.size()
              << "\n";
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
