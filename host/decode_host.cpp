/**
 * decode_host.cpp
 * ===============
 * XRT host driver for the 4-PE LLaMA-2 INT4 decoder on AMD Alveo U250.
 *
 * Overview
 * --------
 * - Loads xclbin onto the FPGA via the XRT Native API.
 * - Allocates and fills 4 sets of DDR buffers (one set per PE / DDR bank):
 *     model_bank{0..3}.bin  → weight + scale + RMSNorm data  (~800 MB each)
 *     rope_lut.bin          → precomputed cos/sin Q1.17 LUT   (~2 MB each)
 *     kv_cache              → per-PE KV cache (grows with context)
 *     residual              → input embedding shard  (4 KB each)
 *     logits                → output logit shard    (32 KB each)
 * - Runs the token generation loop:
 *     prefill → decode until EOS or max_new_tokens
 *
 * Build (on a Linux host with Vitis 2023.2 or later):
 *   g++ -std=c++17 -O2 -I$XILINX_XRT/include \
 *       decode_host.cpp -o decode_host \
 *       -L$XILINX_XRT/lib -lxrt_coreutil -lxrt_core
 *
 * Usage:
 *   ./decode_host \
 *       --xclbin   decoder_300mhz.xclbin \
 *       --banks    /path/to/model_bank_dir \
 *       --rope     /path/to/rope_lut.bin  \
 *       --tokenizer /path/to/tokenizer.bin \
 *       --prompt   "Once upon a time" \
 *       --max-tokens 256
 */

#include <algorithm>
#include <cassert>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

// XRT Native API (Vitis 2022.x+)
#include "xrt/xrt_bo.h"
#include "xrt/xrt_device.h"
#include "xrt/xrt_kernel.h"

// ── Model / hardware constants (must match kernel_HLS) ────────────────────────
static constexpr int NUM_PES              = 4;
static constexpr int DIM                  = 4096;
static constexpr int HIDDEN_DIM           = 11008;
static constexpr int VOCAB_SIZE           = 32000;
static constexpr int PADDED_VOCAB_SIZE    = 32256;   // INT4_LOCAL_VOCAB_SIZE * 4
static constexpr int NUM_HEADS            = 32;
static constexpr int HEAD_DIM             = 128;
static constexpr int NUM_LAYERS           = 32;
static constexpr int MAX_SEQ_LEN          = 4096;
static constexpr int GROUP_SIZE           = 32;

// DDR word = 512 bits = 64 bytes
static constexpr int DDR_WORD_BYTES       = 64;
static constexpr int OUTPUTS_PER_WORD     = 16;      // floats packed per DDR word

// Buffer sizes (bytes per PE)
static constexpr size_t MODEL_BANK_BYTES  = 838967296ULL;  // ~800 MB (autoround_pack output)
static constexpr size_t ROPE_LUT_BYTES    = 32768ULL * DDR_WORD_BYTES;  // 2 MB
static constexpr size_t RESIDUAL_WORDS    = (DIM / NUM_PES) / OUTPUTS_PER_WORD;   // 64
static constexpr size_t RESIDUAL_BYTES    = RESIDUAL_WORDS * DDR_WORD_BYTES;       // 4096
static constexpr size_t LOGIT_WORDS       = (PADDED_VOCAB_SIZE / NUM_PES) / OUTPUTS_PER_WORD; // 504
static constexpr size_t LOGIT_BYTES       = LOGIT_WORDS * DDR_WORD_BYTES;

// KV cache: 32 layers × 8 heads × 4096 tokens × 5 words/record × 64 B
static constexpr int    LOCAL_HEADS       = NUM_HEADS / NUM_PES;   // 8
static constexpr int    KV_WORDS_PER_TOKEN_HEAD = 5;
static constexpr size_t KV_WORDS_PER_PE   =
    (size_t)NUM_LAYERS * LOCAL_HEADS * MAX_SEQ_LEN * KV_WORDS_PER_TOKEN_HEAD;
static constexpr size_t KV_BYTES          = KV_WORDS_PER_PE * DDR_WORD_BYTES;  // ~320 MB

// ── Simple BPE tokenizer (llama2.c-compatible tokenizer.bin) ─────────────────
struct Tokenizer {
    std::vector<std::string> vocab;
    std::vector<float>       scores;
    int vocab_size = 0;

    bool load(const std::string& path) {
        std::ifstream f(path, std::ios::binary);
        if (!f) { std::cerr << "Cannot open tokenizer: " << path << "\n"; return false; }
        int max_token_length;
        f.read(reinterpret_cast<char*>(&max_token_length), 4);
        f.read(reinterpret_cast<char*>(&vocab_size), 4);
        vocab.resize(vocab_size);
        scores.resize(vocab_size);
        for (int i = 0; i < vocab_size; ++i) {
            f.read(reinterpret_cast<char*>(&scores[i]), 4);
            int len; f.read(reinterpret_cast<char*>(&len), 4);
            vocab[i].resize(len);
            f.read(&vocab[i][0], len);
        }
        return true;
    }

    // Naive BPE encode: split on spaces, return token ids (simplified)
    std::vector<int> encode(const std::string& text) const {
        std::vector<int> ids;
        ids.push_back(1);  // BOS token
        // Character-level fallback: look up each char
        for (char c : text) {
            std::string s(1, c);
            int id = -1;
            for (int i = 0; i < vocab_size; ++i) {
                if (vocab[i] == s) { id = i; break; }
            }
            if (id != -1) ids.push_back(id);
        }
        return ids;
    }

    std::string decode(int id) const {
        if (id < 0 || id >= vocab_size) return "";
        return vocab[id];
    }
};

// ── Embedding table helpers ────────────────────────────────────────────────────
// Embeddings are stored as float32 in the model_bank0.bin norm/embedding region.
// For the host driver we load them separately from model_bank0.bin at offset 0
// (byte 0 of norm/embed area — see autoround_pack script for layout).
// Alternatively, load from the raw HuggingFace safetensors. Here we read from
// the model_bank0.bin embedding section directly.

static std::vector<float> load_embeddings(const std::string& bank0_path) {
    // In model_bank layout (autoround_pack_llama2_u250.py):
    //   SCALE_BASE_WORD =    0  → 1600 words (scale cache)
    //   NORM_BASE_WORD  = 1600  → 4160 words (norm+embed area)
    //   WEIGHT_BASE_WORD= 5760  → weights
    // The embedding table is NOT in model_bank (it's in autoround_w4g128.bin).
    // We store embeddings as raw float32 in a companion file: embeddings.bin
    std::string emb_path = bank0_path.substr(0, bank0_path.rfind('/') + 1) + "embeddings.bin";
    std::ifstream f(emb_path, std::ios::binary);
    if (!f) {
        std::cerr << "[WARN] embeddings.bin not found at " << emb_path
                  << "\n       Create it with: python scripts/export_embeddings.py\n";
        return {};
    }
    std::vector<float> emb(VOCAB_SIZE * DIM);
    f.read(reinterpret_cast<char*>(emb.data()), emb.size() * sizeof(float));
    std::cout << "[Init] Loaded " << VOCAB_SIZE << " x " << DIM
              << " embedding table from " << emb_path << "\n";
    return emb;
}

// ── Residual packing: float[DIM] → 4 shards of int4_output_word_t[] ──────────
// Each PE gets a shard of DIM/4 = 1024 floats, packed as 16 floats per 512-bit word.
static void pack_residual(
    const float* residual,      // float[DIM]
    float* shard0,              // float[DIM/4] (already aligned to 64B boundary)
    float* shard1,
    float* shard2,
    float* shard3
) {
    const int local_dim = DIM / NUM_PES;  // 1024
    for (int i = 0; i < local_dim; ++i) {
        shard0[i] = residual[i];
        shard1[i] = residual[local_dim + i];
        shard2[i] = residual[2 * local_dim + i];
        shard3[i] = residual[3 * local_dim + i];
    }
}

// ── Logits unpacking: 4 shards → float[VOCAB_SIZE] ────────────────────────────
static void unpack_logits(
    const float* shard0,   // float[PADDED_VOCAB/4]
    const float* shard1,
    const float* shard2,
    const float* shard3,
    float* logits          // float[VOCAB_SIZE]
) {
    const int local_vocab = PADDED_VOCAB_SIZE / NUM_PES;  // 8064
    for (int i = 0; i < local_vocab; ++i) {
        const int global_id = i;
        if (global_id               < VOCAB_SIZE) logits[global_id]               = shard0[i];
        if (global_id + local_vocab < VOCAB_SIZE) logits[global_id + local_vocab] = shard1[i];
        if (global_id + 2*local_vocab < VOCAB_SIZE) logits[global_id + 2*local_vocab] = shard2[i];
        if (global_id + 3*local_vocab < VOCAB_SIZE) logits[global_id + 3*local_vocab] = shard3[i];
    }
}

// ── Greedy sampler ─────────────────────────────────────────────────────────────
static int argmax(const float* logits, int size) {
    int best = 0;
    for (int i = 1; i < size; ++i)
        if (logits[i] > logits[best]) best = i;
    return best;
}

// ── Load binary file into pre-allocated XRT BO ─────────────────────────────────
static bool load_file_into_bo(
    const std::string& path,
    xrt::bo& bo,
    size_t expected_bytes
) {
    std::ifstream f(path, std::ios::binary | std::ios::ate);
    if (!f) { std::cerr << "Cannot open: " << path << "\n"; return false; }
    const size_t file_size = f.tellg();
    if (file_size != expected_bytes) {
        std::cerr << "Size mismatch for " << path
                  << ": expected " << expected_bytes
                  << " bytes, got " << file_size << " bytes\n";
        return false;
    }
    f.seekg(0);
    char* ptr = bo.map<char*>();
    f.read(ptr, file_size);
    bo.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::cout << "  Loaded " << path << " (" << file_size / (1024*1024) << " MB)\n";
    return true;
}

// ── CLI argument parsing ───────────────────────────────────────────────────────
struct Config {
    std::string xclbin       = "decoder_300mhz.xclbin";
    std::string banks_dir    = ".";
    std::string rope_lut     = "rope_lut.bin";
    std::string tokenizer    = "tokenizer.bin";
    std::string prompt       = "Once upon a time";
    int         max_tokens   = 256;
    int         device_index = 0;
};

static Config parse_args(int argc, char** argv) {
    Config c;
    for (int i = 1; i < argc; ++i) {
        std::string a = argv[i];
        auto next = [&]() -> std::string {
            if (i + 1 >= argc) { std::cerr << "Missing value for " << a << "\n"; exit(1); }
            return argv[++i];
        };
        if      (a == "--xclbin")     c.xclbin      = next();
        else if (a == "--banks")      c.banks_dir   = next();
        else if (a == "--rope")       c.rope_lut    = next();
        else if (a == "--tokenizer")  c.tokenizer   = next();
        else if (a == "--prompt")     c.prompt      = next();
        else if (a == "--max-tokens") c.max_tokens  = std::stoi(next());
        else if (a == "--device")     c.device_index= std::stoi(next());
        else { std::cerr << "Unknown argument: " << a << "\n"; exit(1); }
    }
    return c;
}

// ══════════════════════════════════════════════════════════════════════════════
int main(int argc, char** argv)
{
    const Config cfg = parse_args(argc, argv);

    // ── 1. Open FPGA device and load xclbin ───────────────────────────────────
    std::cout << "[Init] Opening device " << cfg.device_index << " ...\n";
    xrt::device device(cfg.device_index);

    std::cout << "[Init] Loading " << cfg.xclbin << " ...\n";
    auto uuid = device.load_xclbin(cfg.xclbin);
    std::cout << "[Init] xclbin loaded OK.\n";

    // ── 2. Instantiate the 4 kernel objects ───────────────────────────────────
    xrt::kernel k0(device, uuid, "int4_decoder_pe0_kernel");
    xrt::kernel k1(device, uuid, "int4_decoder_pe1_kernel");
    xrt::kernel k2(device, uuid, "int4_decoder_pe2_kernel");
    xrt::kernel k3(device, uuid, "int4_decoder_pe3_kernel");

    // ── 3. Allocate DDR buffers ────────────────────────────────────────────────
    std::cout << "[Init] Allocating DDR buffers ...\n";

    // model_bank: read-only, each PE maps to its own DDR bank via gmem0..3
    xrt::bo bo_model0(device, MODEL_BANK_BYTES, k0.group_id(1));  // port=model_bank
    xrt::bo bo_model1(device, MODEL_BANK_BYTES, k1.group_id(1));
    xrt::bo bo_model2(device, MODEL_BANK_BYTES, k2.group_id(1));
    xrt::bo bo_model3(device, MODEL_BANK_BYTES, k3.group_id(1));

    // rope_lut: read-only, same content on each PE's DDR bank
    xrt::bo bo_rope0(device, ROPE_LUT_BYTES, k0.group_id(2));     // port=rope_lut
    xrt::bo bo_rope1(device, ROPE_LUT_BYTES, k1.group_id(2));
    xrt::bo bo_rope2(device, ROPE_LUT_BYTES, k2.group_id(2));
    xrt::bo bo_rope3(device, ROPE_LUT_BYTES, k3.group_id(2));

    // residual: read-write, small (4 KB per PE)
    xrt::bo bo_res0(device, RESIDUAL_BYTES, k0.group_id(3));      // port=residual
    xrt::bo bo_res1(device, RESIDUAL_BYTES, k1.group_id(3));
    xrt::bo bo_res2(device, RESIDUAL_BYTES, k2.group_id(3));
    xrt::bo bo_res3(device, RESIDUAL_BYTES, k3.group_id(3));

    // logits: write-only from kernel perspective (32 KB per PE)
    xrt::bo bo_log0(device, LOGIT_BYTES, k0.group_id(4));         // port=logits
    xrt::bo bo_log1(device, LOGIT_BYTES, k1.group_id(4));
    xrt::bo bo_log2(device, LOGIT_BYTES, k2.group_id(4));
    xrt::bo bo_log3(device, LOGIT_BYTES, k3.group_id(4));

    // kv_cache: read-write, large (~320 MB per PE)
    xrt::bo bo_kv0(device, KV_BYTES, k0.group_id(5));             // port=kv_cache
    xrt::bo bo_kv1(device, KV_BYTES, k1.group_id(5));
    xrt::bo bo_kv2(device, KV_BYTES, k2.group_id(5));
    xrt::bo bo_kv3(device, KV_BYTES, k3.group_id(5));

    // ── 4. Load static data (model weights, rope LUT) ─────────────────────────
    std::cout << "[Init] Loading model banks ...\n";
    auto bank_path = [&](int p) {
        return cfg.banks_dir + "/model_bank" + std::to_string(p) + ".bin";
    };
    if (!load_file_into_bo(bank_path(0), bo_model0, MODEL_BANK_BYTES)) return 1;
    if (!load_file_into_bo(bank_path(1), bo_model1, MODEL_BANK_BYTES)) return 1;
    if (!load_file_into_bo(bank_path(2), bo_model2, MODEL_BANK_BYTES)) return 1;
    if (!load_file_into_bo(bank_path(3), bo_model3, MODEL_BANK_BYTES)) return 1;

    std::cout << "[Init] Loading rope LUT ...\n";
    if (!load_file_into_bo(cfg.rope_lut, bo_rope0, ROPE_LUT_BYTES)) return 1;
    if (!load_file_into_bo(cfg.rope_lut, bo_rope1, ROPE_LUT_BYTES)) return 1;
    if (!load_file_into_bo(cfg.rope_lut, bo_rope2, ROPE_LUT_BYTES)) return 1;
    if (!load_file_into_bo(cfg.rope_lut, bo_rope3, ROPE_LUT_BYTES)) return 1;

    // Zero KV cache (fresh context)
    std::memset(bo_kv0.map<char*>(), 0, KV_BYTES); bo_kv0.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::memset(bo_kv1.map<char*>(), 0, KV_BYTES); bo_kv1.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::memset(bo_kv2.map<char*>(), 0, KV_BYTES); bo_kv2.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::memset(bo_kv3.map<char*>(), 0, KV_BYTES); bo_kv3.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    // ── 5. Load tokenizer & embeddings ────────────────────────────────────────
    Tokenizer tokenizer;
    if (!tokenizer.load(cfg.tokenizer)) return 1;

    std::vector<float> embeddings = load_embeddings(bank_path(0));
    if (embeddings.empty()) return 1;

    // ── 6. Tokenize prompt ────────────────────────────────────────────────────
    const std::vector<int> prompt_tokens = tokenizer.encode(cfg.prompt);
    std::cout << "[Prompt] \"" << cfg.prompt << "\"\n";
    std::cout << "[Tokens] " << prompt_tokens.size() << " tokens\n";

    // Residual mapped pointers (float* views into XRT BOs)
    float* res_ptr0 = bo_res0.map<float*>();
    float* res_ptr1 = bo_res1.map<float*>();
    float* res_ptr2 = bo_res2.map<float*>();
    float* res_ptr3 = bo_res3.map<float*>();

    float* log_ptr0 = bo_log0.map<float*>();
    float* log_ptr1 = bo_log1.map<float*>();
    float* log_ptr2 = bo_log2.map<float*>();
    float* log_ptr3 = bo_log3.map<float*>();

    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    // ── Helper: run one token step ────────────────────────────────────────────
    auto run_step = [&](int token_id, int position) {
        // Embed
        const float* emb = embeddings.data() + token_id * DIM;
        pack_residual(emb, res_ptr0, res_ptr1, res_ptr2, res_ptr3);

        // Sync residual to device
        bo_res0.sync(XCL_BO_SYNC_BO_TO_DEVICE);
        bo_res1.sync(XCL_BO_SYNC_BO_TO_DEVICE);
        bo_res2.sync(XCL_BO_SYNC_BO_TO_DEVICE);
        bo_res3.sync(XCL_BO_SYNC_BO_TO_DEVICE);

        // Launch all 4 kernels
        // Argument order: position, model_bank, rope_lut, residual, logits, kv_cache
        // (AXIS ports are connected via link.cfg, not host-side arguments)
        auto r0 = xrt::run(k0);
        r0.set_arg(0, (uint32_t)position);
        r0.set_arg(1, bo_model0);
        r0.set_arg(2, bo_rope0);
        r0.set_arg(3, bo_res0);
        r0.set_arg(4, bo_log0);
        r0.set_arg(5, bo_kv0);
        r0.start();

        auto r1 = xrt::run(k1);
        r1.set_arg(0, (uint32_t)position);
        r1.set_arg(1, bo_model1);
        r1.set_arg(2, bo_rope1);
        r1.set_arg(3, bo_res1);
        r1.set_arg(4, bo_log1);
        r1.set_arg(5, bo_kv1);
        r1.start();

        auto r2 = xrt::run(k2);
        r2.set_arg(0, (uint32_t)position);
        r2.set_arg(1, bo_model2);
        r2.set_arg(2, bo_rope2);
        r2.set_arg(3, bo_res2);
        r2.set_arg(4, bo_log2);
        r2.set_arg(5, bo_kv2);
        r2.start();

        auto r3 = xrt::run(k3);
        r3.set_arg(0, (uint32_t)position);
        r3.set_arg(1, bo_model3);
        r3.set_arg(2, bo_rope3);
        r3.set_arg(3, bo_res3);
        r3.set_arg(4, bo_log3);
        r3.set_arg(5, bo_kv3);
        r3.start();

        // Wait for all 4 to finish
        r0.wait();
        r1.wait();
        r2.wait();
        r3.wait();

        // Read logits back
        bo_log0.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
        bo_log1.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
        bo_log2.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
        bo_log3.sync(XCL_BO_SYNC_BO_FROM_DEVICE);

        unpack_logits(log_ptr0, log_ptr1, log_ptr2, log_ptr3, logits.data());
    };

    // ── 7. Prefill ────────────────────────────────────────────────────────────
    auto t_start = std::chrono::steady_clock::now();
    std::cout << "[Prefill] Processing " << prompt_tokens.size() << " tokens ...\n";
    for (int pos = 0; pos < (int)prompt_tokens.size(); ++pos) {
        run_step(prompt_tokens[pos], pos);
    }
    auto t_prefill = std::chrono::steady_clock::now();

    // ── 8. Decode loop ────────────────────────────────────────────────────────
    std::cout << "[Generate]";
    // Print the prompt first
    for (int t : prompt_tokens) std::cout << tokenizer.decode(t);
    std::cout.flush();

    int position = (int)prompt_tokens.size();
    int next_token = argmax(logits.data(), VOCAB_SIZE);
    std::vector<int> generated_tokens;

    for (int step = 0; step < cfg.max_tokens; ++step) {
        const std::string word = tokenizer.decode(next_token);
        std::cout << word;
        std::cout.flush();

        if (next_token == 2) break;  // EOS token

        generated_tokens.push_back(next_token);
        run_step(next_token, position++);
        next_token = argmax(logits.data(), VOCAB_SIZE);
    }
    std::cout << "\n";

    // ── 9. Stats ──────────────────────────────────────────────────────────────
    auto t_end = std::chrono::steady_clock::now();
    double prefill_ms  = std::chrono::duration<double,std::milli>(t_prefill - t_start).count();
    double decode_ms   = std::chrono::duration<double,std::milli>(t_end - t_prefill).count();
    int    gen_toks    = (int)generated_tokens.size();

    std::printf("\n[Stats]\n");
    std::printf("  Prefill : %d tokens in %.1f ms (%.1f ms/tok)\n",
                (int)prompt_tokens.size(), prefill_ms,
                prefill_ms / prompt_tokens.size());
    std::printf("  Decode  : %d tokens in %.1f ms (%.1f ms/tok  =  %.1f tok/s)\n",
                gen_toks, decode_ms,
                gen_toks > 0 ? decode_ms / gen_toks : 0.0,
                gen_toks > 0 ? 1000.0 * gen_toks / decode_ms : 0.0);

    return 0;
}
