#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <chrono>
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <windows.h>

#include "int4_decoder_controller.hpp"
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

static constexpr size_t MODEL_BANK_BYTES = 838967296ULL;
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

// Simple BPE Tokenizer matching llama2.c
typedef struct {
    char *str;
    int id;
} TokenIndex;

typedef struct {
    char** vocab;
    float* vocab_scores;
    TokenIndex *sorted_vocab;
    int vocab_size;
    unsigned int max_token_length;
    unsigned char byte_pieces[512];
} Tokenizer;

int compare_tokens(const void *a, const void *b) {
    return strcmp(((TokenIndex*)a)->str, ((TokenIndex*)b)->str);
}

void build_tokenizer(Tokenizer* t, const char* tokenizer_path, int vocab_size) {
    t->vocab_size = vocab_size;
    t->vocab = (char**)malloc(vocab_size * sizeof(char*));
    t->vocab_scores = (float*)malloc(vocab_size * sizeof(float));
    t->sorted_vocab = NULL;
    for (int i = 0; i < 256; i++) {
        t->byte_pieces[i * 2] = (unsigned char)i;
        t->byte_pieces[i * 2 + 1] = '\0';
    }

    FILE *file = fopen(tokenizer_path, "rb");
    if (!file) file = fopen("tokenizer.bin", "rb");
    if (!file) file = fopen("C:/KLTN/4PE_U250/tokenizer.bin", "rb");
    if (!file) { fprintf(stderr, "couldn't load %s\n", tokenizer_path); exit(EXIT_FAILURE); }
    if (fread(&t->max_token_length, sizeof(int), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
    int len;
    for (int i = 0; i < vocab_size; i++) {
        if (fread(t->vocab_scores + i, sizeof(float), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        if (fread(&len, sizeof(int), 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        t->vocab[i] = (char *)malloc(len + 1);
        if (fread(t->vocab[i], len, 1, file) != 1) { fprintf(stderr, "failed read\n"); exit(EXIT_FAILURE); }
        t->vocab[i][len] = '\0';
    }
    fclose(file);
}

void free_tokenizer(Tokenizer* t) {
    for (int i = 0; i < t->vocab_size; i++) { free(t->vocab[i]); }
    free(t->vocab);
    free(t->vocab_scores);
    if (t->sorted_vocab) free(t->sorted_vocab);
}

char* decode_token(Tokenizer* t, int prev_token, int token) {
    char *piece = t->vocab[token];
    if (prev_token == 1 && piece[0] == ' ') { piece++; }
    unsigned char byte_val;
    if (sscanf(piece, "<0x%02hhX>", &byte_val) == 1) {
        piece = (char*)t->byte_pieces + byte_val * 2;
    }
    return piece;
}

int str_lookup(char *str, TokenIndex *sorted_vocab, int vocab_size) {
    TokenIndex tok = { str, -1 };
    TokenIndex *res = (TokenIndex*) bsearch(&tok, sorted_vocab, vocab_size, sizeof(TokenIndex), compare_tokens);
    return res != NULL ? res->id : -1;
}

void encode_prompt(Tokenizer* t, const char *text, int8_t bos, int8_t eos, int *tokens, int *n_tokens) {
    if (text == NULL) { fprintf(stderr, "cannot encode NULL text\n"); exit(EXIT_FAILURE); }
    if (t->sorted_vocab == NULL) {
        t->sorted_vocab = (TokenIndex*)malloc(t->vocab_size * sizeof(TokenIndex));
        for (int i = 0; i < t->vocab_size; i++) {
            t->sorted_vocab[i].str = t->vocab[i];
            t->sorted_vocab[i].id = i;
        }
        qsort(t->sorted_vocab, t->vocab_size, sizeof(TokenIndex), compare_tokens);
    }

    size_t str_len = strlen(text);
    char* str_buffer = (char*)malloc((str_len * 3 + 3));
    size_t str_len_clean = 0;

    if (bos) tokens[(*n_tokens)++] = 1;

    if (text[0] != '\0') {
        int dummy_prefix = str_lookup((char*)" ", t->sorted_vocab, t->vocab_size);
        tokens[(*n_tokens)++] = dummy_prefix;
    }

    for (const char *c = text; *c != '\0'; c++) {
        sprintf(str_buffer + str_len_clean, "%c", *c);
        str_len_clean = strlen(str_buffer);
    }

    for (size_t i = 0; i < str_len_clean; i++) {
        char single_char[2] = { str_buffer[i], '\0' };
        int id = str_lookup(single_char, t->sorted_vocab, t->vocab_size);
        if (id != -1) {
            tokens[(*n_tokens)++] = id;
        } else {
            char byte_dummy[10];
            sprintf(byte_dummy, "<0x%02hhX>", (unsigned char)str_buffer[i]);
            id = str_lookup(byte_dummy, t->sorted_vocab, t->vocab_size);
            tokens[(*n_tokens)++] = id;
        }
    }

    while (1) {
        float best_score = -1e10;
        int best_id = -1;
        int best_idx = -1;

        for (int i = 0; i < (*n_tokens) - 1; i++) {
            char str_merge[512];
            sprintf(str_merge, "%s%s", t->vocab[tokens[i]], t->vocab[tokens[i+1]]);
            int id = str_lookup(str_merge, t->sorted_vocab, t->vocab_size);
            if (id != -1 && t->vocab_scores[id] > best_score) {
                best_score = t->vocab_scores[id];
                best_id = id;
                best_idx = i;
            }
        }

        if (best_idx == -1) break;

        tokens[best_idx] = best_id;
        for (int i = best_idx + 1; i < (*n_tokens) - 1; i++) {
            tokens[i] = tokens[i + 1];
        }
        (*n_tokens)--;
    }

    if (eos) tokens[(*n_tokens)++] = 2;
    free(str_buffer);
}

int main(int argc, char** argv) {
    std::cout << "==================================================================\n";
    std::cout << "  4-PE LLaMA-2 INT4 Decoder Token Generation Testbench (HLS CSIM)\n";
    std::cout << "==================================================================\n\n";

    const char* prompt = "The capital of France is";
    int max_new_tokens = 5;
    if (argc > 1) prompt = argv[1];
    if (argc > 2) max_new_tokens = std::atoi(argv[2]);

    // 1. Memory-map the 4 DDR bank files
    MappedFile bank0, bank1, bank2, bank3;
    if (!bank0.open_and_map("model_bank0.bin", MODEL_BANK_BYTES)) return 1;
    if (!bank1.open_and_map("model_bank1.bin", MODEL_BANK_BYTES)) return 1;
    if (!bank2.open_and_map("model_bank2.bin", MODEL_BANK_BYTES)) return 1;
    if (!bank3.open_and_map("model_bank3.bin", MODEL_BANK_BYTES)) return 1;

    // 2. Memory-map RoPE LUT
    MappedFile rope_lut_file;
    if (!rope_lut_file.open_and_map("rope_lut.bin", ROPE_LUT_BYTES)) return 1;
    const int4_output_word_t* rope_lut_ptr = (const int4_output_word_t*)rope_lut_file.ptr;

    // 3. Load Embeddings
    std::cout << "[Init] Loading embeddings.bin ...\n";
    FILE* f_emb = fopen("embeddings.bin", "rb");
    if (!f_emb) {
        std::cerr << "[-] Error opening embeddings.bin\n";
        return 1;
    }
    std::vector<float> embeddings(VOCAB_SIZE * DIM);
    size_t r_emb = fread(embeddings.data(), sizeof(float), VOCAB_SIZE * DIM, f_emb);
    fclose(f_emb);
    if (r_emb != VOCAB_SIZE * DIM) {
        std::cerr << "[-] Failed reading all embeddings\n";
        return 1;
    }
    std::cout << "[+] Loaded embeddings (" << embeddings.size() * sizeof(float) / (1024 * 1024) << " MB)\n";

    // 4. Initialize Tokenizer
    Tokenizer tokenizer;
    build_tokenizer(&tokenizer, "tokenizer.bin", VOCAB_SIZE);
    std::cout << "[+] Loaded tokenizer.bin (vocab size: " << tokenizer.vocab_size << ")\n";

    // 5. Allocate KV Caches
    std::cout << "[Init] Allocating KV caches for 4 PEs (~" << (KV_BYTES_PER_PE * 4) / (1024 * 1024) << " MB total) ...\n";
    int4_output_word_t* kv_cache_pe[4];
    for (int p = 0; p < 4; ++p) {
        kv_cache_pe[p] = (int4_output_word_t*)calloc(KV_WORDS_PER_PE, sizeof(int4_output_word_t));
        if (!kv_cache_pe[p]) {
            std::cerr << "[-] Failed allocating KV cache for PE " << p << "\n";
            return 1;
        }
    }

    // 6. Allocate IO buffers
    int4_output_word_t residual_pe[4][INT4_VECTOR_WORDS_PER_PE];
    int4_output_word_t logits_pe[4][INT4_LOGIT_WORDS_PER_PE];

    // 7. Tokenize prompt
    int prompt_tokens[512];
    int n_prompt_tokens = 0;
    encode_prompt(&tokenizer, prompt, 1, 0, prompt_tokens, &n_prompt_tokens);

    std::cout << "\n[Prompt]: \"" << prompt << "\"\n";
    std::cout << "[Prompt Tokens]: (" << n_prompt_tokens << " tokens): [";
    for (int i = 0; i < n_prompt_tokens; ++i) {
        std::cout << prompt_tokens[i] << (i + 1 < n_prompt_tokens ? ", " : "");
    }
    std::cout << "]\n\n";

    // Lambda to step a single token through HLS hardware
    auto run_hw_step = [&](int token_id, int pos, std::vector<float>& out_logits) {
        // Pack residual shards: 1024 floats per PE, 16 floats per 512-bit word
        const float* emb = &embeddings[token_id * DIM];
        for (int p = 0; p < 4; ++p) {
            for (int w = 0; w < INT4_VECTOR_WORDS_PER_PE; ++w) {
                int4_output_word_t word = 0;
                for (int lane = 0; lane < 16; ++lane) {
                    int col = w * 16 + lane;
                    float val = emb[p * 1024 + col];
                    union { float f; uint32_t u; } un;
                    un.f = val;
                    word.range(lane * 32 + 31, lane * 32) = un.u;
                }
                residual_pe[p][w] = word;
            }
        }

        // Call the Top-Level HLS Decoder Controller!
        int4_decoder_token_controller(
            (ap_uint<12>)pos,
            (const int4_weight_word_t*)bank0.ptr,
            (const int4_weight_word_t*)bank1.ptr,
            (const int4_weight_word_t*)bank2.ptr,
            (const int4_weight_word_t*)bank3.ptr,
            rope_lut_ptr, rope_lut_ptr, rope_lut_ptr, rope_lut_ptr,
            residual_pe[0], residual_pe[1], residual_pe[2], residual_pe[3],
            logits_pe[0], logits_pe[1], logits_pe[2], logits_pe[3],
            kv_cache_pe[0], kv_cache_pe[1], kv_cache_pe[2], kv_cache_pe[3]
        );

        // Unpack logits: 8064 floats per PE, 16 floats per word
        out_logits.resize(VOCAB_SIZE);
        for (int p = 0; p < 4; ++p) {
            for (int w = 0; w < INT4_LOGIT_WORDS_PER_PE; ++w) {
                for (int lane = 0; lane < 16; ++lane) {
                    int idx = p * 8064 + w * 16 + lane;
                    if (idx < VOCAB_SIZE) {
                        uint32_t u = logits_pe[p][w].range(lane * 32 + 31, lane * 32).to_uint();
                        union { uint32_t u; float f; } un;
                        un.u = u;
                        out_logits[idx] = un.f;
                    }
                }
            }
        }
    };

    // 8. Prefill prompt
    std::cout << "--- [Stage 1: Prefill Prompt] ---\n";
    std::vector<float> logits;
    int pos = 0;
    auto t_prefill_start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < n_prompt_tokens; ++i) {
        auto t0 = std::chrono::high_resolution_clock::now();
        int tok = prompt_tokens[i];
        run_hw_step(tok, pos++, logits);
        auto t1 = std::chrono::high_resolution_clock::now();
        double dt = std::chrono::duration<double>(t1 - t0).count();
        std::cout << "  Prefill pos " << pos - 1 << " (token " << tok << "): " << dt << "s\n";
    }
    auto t_prefill_end = std::chrono::high_resolution_clock::now();
    double prefill_sec = std::chrono::duration<double>(t_prefill_end - t_prefill_start).count();
    std::cout << "[+] Prefill completed in " << prefill_sec << "s (" << (double)n_prompt_tokens / prefill_sec << " tok/s)\n\n";

    // 9. Autoregressive Generation
    std::cout << "--- [Stage 2: Autoregressive Decode] ---\n";
    std::cout << "[Generated Output]: " << prompt;
    std::cout.flush();

    int next_token = 0;
    float max_logit = -1e9f;
    for (int i = 0; i < VOCAB_SIZE; ++i) {
        if (logits[i] > max_logit) {
            max_logit = logits[i];
            next_token = i;
        }
    }

    int prev_token = prompt_tokens[n_prompt_tokens - 1];
    auto t_gen_start = std::chrono::high_resolution_clock::now();

    for (int gen = 0; gen < max_new_tokens; ++gen) {
        char* piece = decode_token(&tokenizer, prev_token, next_token);
        std::cout << piece;
        std::cout.flush();

        if (next_token == 2) break; // EOS

        prev_token = next_token;
        run_hw_step(next_token, pos++, logits);

        max_logit = -1e9f;
        for (int i = 0; i < VOCAB_SIZE; ++i) {
            if (logits[i] > max_logit) {
                max_logit = logits[i];
                next_token = i;
            }
        }
    }
    std::cout << "\n\n";
    auto t_gen_end = std::chrono::high_resolution_clock::now();
    double gen_sec = std::chrono::duration<double>(t_gen_end - t_gen_start).count();
    std::cout << "[+] Decode throughput: " << (double)max_new_tokens / gen_sec << " tok/s\n";

    // Cleanup
    for (int p = 0; p < 4; ++p) free(kv_cache_pe[p]);
    free_tokenizer(&tokenizer);
    std::cout << "\n[SUCCESS] Testbench completed successfully!\n";
    return 0;
}
