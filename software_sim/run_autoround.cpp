#include <iostream>
#include <vector>
#include <cmath>
#include <cstdint>
#include <iomanip>
#include <chrono>
#include <algorithm>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <cstdio>
#include <cstdlib>
#include <cctype>
#include <random>
#include <numeric>

#ifdef _OPENMP
#include <omp.h>
#endif

// ============================================================================
// Model Architecture Configurations for LLaMA-2-7B AutoRound W4G128
// ============================================================================
static constexpr int DIM = 4096;
static constexpr int HIDDEN_DIM = 11008;
static constexpr int VOCAB_SIZE = 32000;
static constexpr int NUM_LAYERS = 32;
static constexpr int NUM_HEADS = 32;
static constexpr int HEAD_DIM = 128; // 4096 / 32
static constexpr int GROUP_SIZE = 128; // AutoRound W4G128
static constexpr int MAX_SEQ_LEN = 2048;

// ============================================================================
// Data Structures
// ============================================================================
struct QuantizedWeightW4G128 {
    int rows; // M (output dimension)
    int cols; // K (input dimension)
    int num_groups; // K / 128
    std::vector<uint8_t> packed_weights; // M * (K / 2) bytes (2 nibbles per byte)
    std::vector<float> scales;           // M * (K / 128) float32
};

struct DecoderLayer {
    std::vector<float> attn_norm; // [DIM]
    QuantizedWeightW4G128 w_q;    // [DIM, DIM]
    QuantizedWeightW4G128 w_k;    // [DIM, DIM]
    QuantizedWeightW4G128 w_v;    // [DIM, DIM]
    QuantizedWeightW4G128 w_o;    // [DIM, DIM]
    
    std::vector<float> ffn_norm;  // [DIM]
    QuantizedWeightW4G128 w_gate; // [HIDDEN_DIM, DIM]
    QuantizedWeightW4G128 w_up;   // [HIDDEN_DIM, DIM]
    QuantizedWeightW4G128 w_down; // [DIM, HIDDEN_DIM]
};

struct AutoRoundModel {
    std::vector<float> token_embeddings; // [VOCAB_SIZE, DIM]
    std::vector<DecoderLayer> layers;    // 32 layers
    std::vector<float> final_norm;       // [DIM]
    std::vector<float> lm_head;          // [VOCAB_SIZE, DIM]
};

// ============================================================================
// Fast GEMV Kernels
// ============================================================================

// GEMV for AutoRound W4G128: y = W * x
void gemv_w4g128(
    const QuantizedWeightW4G128& mat,
    const float* __restrict__ x,
    float* __restrict__ y
) {
    const int M = mat.rows;
    const int K = mat.cols;
    const int num_groups = mat.num_groups;
    const uint8_t* __restrict__ weights = mat.packed_weights.data();
    const float* __restrict__ scales = mat.scales.data();

    #pragma omp parallel for schedule(static)
    for (int m = 0; m < M; ++m) {
        const uint8_t* w_row = weights + m * (K / 2);
        const float* s_row = scales + m * num_groups;
        float acc = 0.0f;

        for (int g = 0; g < num_groups; ++g) {
            const float scale = s_row[g];
            const int start_k = g * 128;
            const uint8_t* w_grp = w_row + (start_k / 2);
            const float* x_grp = x + start_k;

            float grp_sum = 0.0f;
            #pragma GCC unroll 4
            for (int i = 0; i < 64; ++i) {
                const uint8_t byte = w_grp[i];
                const int8_t w0 = static_cast<int8_t>(byte & 0x0F) - 8;
                const int8_t w1 = static_cast<int8_t>(byte >> 4) - 8;
                grp_sum += static_cast<float>(w0) * x_grp[2 * i]
                         + static_cast<float>(w1) * x_grp[2 * i + 1];
            }
            acc += grp_sum * scale;
        }
        y[m] = acc;
    }
}

// GEMV for FP32 weights (lm_head): logits = lm_head * x
void gemv_fp32(
    int M, int K,
    const float* __restrict__ weights,
    const float* __restrict__ x,
    float* __restrict__ y
) {
    #pragma omp parallel for schedule(static)
    for (int m = 0; m < M; ++m) {
        const float* w_row = weights + m * K;
        float acc = 0.0f;
        #pragma GCC unroll 8
        for (int k = 0; k < K; ++k) {
            acc += w_row[k] * x[k];
        }
        y[m] = acc;
    }
}

// ============================================================================
// Transformer Primitives
// ============================================================================

void rmsnorm(const float* __restrict__ input, const float* __restrict__ gamma, int size, float* __restrict__ output) {
    float sum_sq = 0.0f;
    for (int i = 0; i < size; ++i) {
        sum_sq += input[i] * input[i];
    }
    const float rsqrt = 1.0f / std::sqrt((sum_sq / static_cast<float>(size)) + 1e-5f);
    for (int i = 0; i < size; ++i) {
        output[i] = input[i] * rsqrt * gamma[i];
    }
}

void apply_rope(float* __restrict__ q, float* __restrict__ k, int pos) {
    const int half = HEAD_DIM / 2; // 64
    for (int h = 0; h < NUM_HEADS; ++h) {
        float* q_ptr = q + h * HEAD_DIM;
        float* k_ptr = k + h * HEAD_DIM;
        for (int p = 0; p < half; ++p) {
            const float freq = 1.0f / std::pow(10000.0f, static_cast<float>(2 * p) / static_cast<float>(HEAD_DIM));
            const float angle = static_cast<float>(pos) * freq;
            const float cos_val = std::cos(angle);
            const float sin_val = std::sin(angle);

            // HuggingFace Llama RoPE: split-half (first 64 and second 64)
            const float q0 = q_ptr[p];
            const float q1 = q_ptr[p + half];
            q_ptr[p]        = q0 * cos_val - q1 * sin_val;
            q_ptr[p + half] = q1 * cos_val + q0 * sin_val;

            const float k0 = k_ptr[p];
            const float k1 = k_ptr[p + half];
            k_ptr[p]        = k0 * cos_val - k1 * sin_val;
            k_ptr[p + half] = k1 * cos_val + k0 * sin_val;
        }
    }
}

void swiglu(const float* __restrict__ gate, const float* __restrict__ up, int size, float* __restrict__ output) {
    for (int i = 0; i < size; ++i) {
        const float g = gate[i];
        const float sigmoid = 1.0f / (1.0f + std::exp(-g));
        output[i] = (g * sigmoid) * up[i];
    }
}

// ============================================================================
// Key-Value Cache
// ============================================================================
struct KVCache {
    std::vector<float> k_cache;
    std::vector<float> v_cache;

    void init(int num_layers, int max_seq_len, int dim) {
        k_cache.assign(num_layers * max_seq_len * dim, 0.0f);
        v_cache.assign(num_layers * max_seq_len * dim, 0.0f);
    }
};

// ============================================================================
// Model Forward Pass
// ============================================================================
void forward(
    const AutoRoundModel& model,
    KVCache& kv,
    int token,
    int pos,
    std::vector<float>& residual,
    std::vector<float>& logits
) {
    const float* emb_ptr = model.token_embeddings.data() + token * DIM;
    std::copy(emb_ptr, emb_ptr + DIM, residual.begin());

    std::vector<float> normed(DIM);
    std::vector<float> q(DIM), k(DIM), v(DIM);
    std::vector<float> attn_out(DIM);
    std::vector<float> proj_o(DIM);
    std::vector<float> gate(HIDDEN_DIM), up(HIDDEN_DIM);
    std::vector<float> swiglu_out(HIDDEN_DIM);
    std::vector<float> proj_down(DIM);

    const float attn_scale = 1.0f / std::sqrt(static_cast<float>(HEAD_DIM));

    for (int l = 0; l < NUM_LAYERS; ++l) {
        const DecoderLayer& layer = model.layers[l];

        // 1. Attn Norm
        rmsnorm(residual.data(), layer.attn_norm.data(), DIM, normed.data());

        // 2. Q, K, V
        gemv_w4g128(layer.w_q, normed.data(), q.data());
        gemv_w4g128(layer.w_k, normed.data(), k.data());
        gemv_w4g128(layer.w_v, normed.data(), v.data());

        // 3. RoPE
        apply_rope(q.data(), k.data(), pos);

        // 4. Update KV cache
        const int kv_layer_offset = l * MAX_SEQ_LEN * DIM;
        const int kv_pos_offset = kv_layer_offset + pos * DIM;
        std::copy(k.begin(), k.end(), kv.k_cache.begin() + kv_pos_offset);
        std::copy(v.begin(), v.end(), kv.v_cache.begin() + kv_pos_offset);

        // 5. Multi-head Attention
        #pragma omp parallel for schedule(static)
        for (int h = 0; h < NUM_HEADS; ++h) {
            const float* q_h = q.data() + h * HEAD_DIM;
            float* out_h = attn_out.data() + h * HEAD_DIM;

            std::vector<float> scores(pos + 1);
            float max_score = -1e30f;

            for (int t = 0; t <= pos; ++t) {
                const float* k_t = kv.k_cache.data() + kv_layer_offset + t * DIM + h * HEAD_DIM;
                float dot = 0.0f;
                for (int d = 0; d < HEAD_DIM; ++d) {
                    dot += q_h[d] * k_t[d];
                }
                const float score = dot * attn_scale;
                scores[t] = score;
                if (score > max_score) max_score = score;
            }

            float sum_exp = 0.0f;
            for (int t = 0; t <= pos; ++t) {
                scores[t] = std::exp(scores[t] - max_score);
                sum_exp += scores[t];
            }
            const float inv_sum = 1.0f / sum_exp;
            for (int t = 0; t <= pos; ++t) {
                scores[t] *= inv_sum;
            }

            std::fill(out_h, out_h + HEAD_DIM, 0.0f);
            for (int t = 0; t <= pos; ++t) {
                const float* v_t = kv.v_cache.data() + kv_layer_offset + t * DIM + h * HEAD_DIM;
                const float score = scores[t];
                for (int d = 0; d < HEAD_DIM; ++d) {
                    out_h[d] += score * v_t[d];
                }
            }
        }

        // 6. O proj & residual
        gemv_w4g128(layer.w_o, attn_out.data(), proj_o.data());
        for (int i = 0; i < DIM; ++i) residual[i] += proj_o[i];

        // 7. FFN Norm
        rmsnorm(residual.data(), layer.ffn_norm.data(), DIM, normed.data());

        // 8. Gate & Up
        gemv_w4g128(layer.w_gate, normed.data(), gate.data());
        gemv_w4g128(layer.w_up, normed.data(), up.data());

        // 9. SwiGLU
        swiglu(gate.data(), up.data(), HIDDEN_DIM, swiglu_out.data());

        // 10. Down & residual
        gemv_w4g128(layer.w_down, swiglu_out.data(), proj_down.data());
        for (int i = 0; i < DIM; ++i) residual[i] += proj_down[i];
    }

    // Final RMSNorm & LM Head Logits
    rmsnorm(residual.data(), model.final_norm.data(), DIM, normed.data());
    logits.resize(VOCAB_SIZE);
    gemv_fp32(VOCAB_SIZE, DIM, model.lm_head.data(), normed.data(), logits.data());
}

// ============================================================================
// Model Weight Loader
// ============================================================================

void read_quantized_matrix(std::ifstream& f, int M, int K, QuantizedWeightW4G128& mat) {
    mat.rows = M;
    mat.cols = K;
    mat.num_groups = K / GROUP_SIZE;
    
    const size_t w_bytes = static_cast<size_t>(M) * (K / 2);
    mat.packed_weights.resize(w_bytes);
    f.read(reinterpret_cast<char*>(mat.packed_weights.data()), w_bytes);

    const size_t s_count = static_cast<size_t>(M) * mat.num_groups;
    mat.scales.resize(s_count);
    f.read(reinterpret_cast<char*>(mat.scales.data()), s_count * sizeof(float));
}

bool load_autoround_model(const std::string& bin_path, AutoRoundModel& model) {
    std::cout << "[Loader] Opening binary model: " << bin_path << " ..." << std::endl;
    std::ifstream f(bin_path, std::ios::binary);
    if (!f.is_open()) {
        std::cerr << "Error: Could not open " << bin_path << std::endl;
        return false;
    }

    char header[256];
    f.read(header, 256);
    if (std::memcmp(header, "AR4\0", 4) != 0) {
        std::cerr << "Error: Invalid magic header in " << bin_path << std::endl;
        return false;
    }

    // 1. Token Embeddings: [32000, 4096] float32
    model.token_embeddings.resize(VOCAB_SIZE * DIM);
    f.read(reinterpret_cast<char*>(model.token_embeddings.data()), model.token_embeddings.size() * sizeof(float));

    // 2. 32 Layers
    model.layers.resize(NUM_LAYERS);
    for (int l = 0; l < NUM_LAYERS; ++l) {
        DecoderLayer& layer = model.layers[l];

        layer.attn_norm.resize(DIM);
        f.read(reinterpret_cast<char*>(layer.attn_norm.data()), DIM * sizeof(float));

        read_quantized_matrix(f, DIM, DIM, layer.w_q);
        read_quantized_matrix(f, DIM, DIM, layer.w_k);
        read_quantized_matrix(f, DIM, DIM, layer.w_v);
        read_quantized_matrix(f, DIM, DIM, layer.w_o);

        layer.ffn_norm.resize(DIM);
        f.read(reinterpret_cast<char*>(layer.ffn_norm.data()), DIM * sizeof(float));

        read_quantized_matrix(f, HIDDEN_DIM, DIM, layer.w_gate);
        read_quantized_matrix(f, HIDDEN_DIM, DIM, layer.w_up);
        read_quantized_matrix(f, DIM, HIDDEN_DIM, layer.w_down);
    }

    // 3. Final Norm: [DIM] float32
    model.final_norm.resize(DIM);
    f.read(reinterpret_cast<char*>(model.final_norm.data()), DIM * sizeof(float));

    // 4. LM Head: [VOCAB_SIZE, DIM] float32
    model.lm_head.resize(VOCAB_SIZE * DIM);
    f.read(reinterpret_cast<char*>(model.lm_head.data()), model.lm_head.size() * sizeof(float));

    return true;
}

// ============================================================================
// BPE Tokenizer
// ============================================================================
struct TokenIndex {
    char *str;
    int id;
};

struct Tokenizer {
    char** vocab;
    float* vocab_scores;
    TokenIndex *sorted_vocab;
    int vocab_size;
    unsigned int max_token_length;
    unsigned char byte_pieces[512];
};

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
    if (!file) file = fopen("software_sim/tokenizer.bin", "rb");
    if (!file) {
        fprintf(stderr, "couldn't load tokenizer from %s\n", tokenizer_path);
        exit(EXIT_FAILURE);
    }
    if (fread(&t->max_token_length, sizeof(int), 1, file) != 1) { exit(EXIT_FAILURE); }
    int len;
    for (int i = 0; i < vocab_size; i++) {
        if (fread(t->vocab_scores + i, sizeof(float), 1, file) != 1) { exit(EXIT_FAILURE); }
        if (fread(&len, sizeof(int), 1, file) != 1) { exit(EXIT_FAILURE); }
        t->vocab[i] = (char *)malloc(len + 1);
        if (fread(t->vocab[i], len, 1, file) != 1) { exit(EXIT_FAILURE); }
        t->vocab[i][len] = '\0';
    }
    fclose(file);
}

int str_lookup(char *str, TokenIndex *sorted_vocab, int vocab_size) {
    TokenIndex tok = { .str = str };
    TokenIndex *res = (TokenIndex*) bsearch(&tok, sorted_vocab, vocab_size, sizeof(TokenIndex), compare_tokens);
    return res != NULL ? res->id : -1;
}

void encode(Tokenizer* t, const char *text, int8_t bos, int8_t eos, int *tokens, int *n_tokens) {
    if (text == NULL) { *n_tokens = 0; return; }

    if (t->sorted_vocab == NULL) {
        t->sorted_vocab = (TokenIndex*)malloc(t->vocab_size * sizeof(TokenIndex));
        for (int i = 0; i < t->vocab_size; i++) {
            t->sorted_vocab[i].str = t->vocab[i];
            t->sorted_vocab[i].id = i;
        }
        qsort(t->sorted_vocab, t->vocab_size, sizeof(TokenIndex), compare_tokens);
    }

    char* str_buffer = (char*)malloc((t->max_token_length*2 + 1 + 2) * sizeof(char));
    size_t str_len = 0;

    *n_tokens = 0;
    if (bos) tokens[(*n_tokens)++] = 1; // 1 = <s>

    if (text[0] != '\0') {
        int dummy_prefix = str_lookup((char*)" ", t->sorted_vocab, t->vocab_size);
        tokens[(*n_tokens)++] = dummy_prefix;
    }

    for (const char *c = text; *c != '\0'; c++) {
        if ((*c & 0xC0) != 0x80) {
            str_len = 0;
        }
        str_buffer[str_len++] = *c;
        str_buffer[str_len] = '\0';

        if ((*(c+1) & 0xC0) == 0x80 && str_len < 4) {
            continue;
        }

        int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
        if (id != -1) {
            tokens[(*n_tokens)++] = id;
        } else {
            for (int i = 0; i < (int)str_len; i++) {
                tokens[(*n_tokens)++] = (unsigned char)str_buffer[i] + 3;
            }
        }
        str_len = 0;
    }

    while (1) {
        float best_score = -1e10;
        int best_id = -1;
        int best_idx = -1;

        for (int i = 0; i < (*n_tokens - 1); i++) {
            sprintf(str_buffer, "%s%s", t->vocab[tokens[i]], t->vocab[tokens[i+1]]);
            int id = str_lookup(str_buffer, t->sorted_vocab, t->vocab_size);
            if (id != -1 && t->vocab_scores[id] > best_score) {
                best_score = t->vocab_scores[id];
                best_id = id;
                best_idx = i;
            }
        }

        if (best_idx == -1) break;

        tokens[best_idx] = best_id;
        for (int i = best_idx + 1; i < (*n_tokens - 1); i++) {
            tokens[i] = tokens[i + 1];
        }
        (*n_tokens)--;
    }

    if (eos) tokens[(*n_tokens)++] = 2;
    free(str_buffer);
}

char* decode(Tokenizer* t, int prev_token, int token) {
    char *piece = t->vocab[token];
    if (prev_token == 1 && piece[0] == ' ') { piece++; }
    unsigned char byte_val;
    if (sscanf(piece, "<0x%02hhX>", &byte_val) == 1) {
        piece = (char*)t->byte_pieces + byte_val * 2;
    }
    return piece;
}

// ============================================================================
// Sampler (100% identical flow to llama2.c/runq.c)
// ============================================================================

struct ProbIndex {
    float prob;
    int index;
};

struct Sampler {
    int vocab_size;
    float temperature;
    float topp;
    unsigned long long rng_state;
    ProbIndex *probindex;
};

int sample_argmax(const float* logits, int vocab_size) {
    int max_i = 0;
    float max_val = logits[0];
    for (int i = 1; i < vocab_size; ++i) {
        if (logits[i] > max_val) {
            max_val = logits[i];
            max_i = i;
        }
    }
    return max_i;
}

int sample_mult(float* probabilities, int n, float coin) {
    float cdf = 0.0f;
    for (int i = 0; i < n; i++) {
        cdf += probabilities[i];
        if (coin < cdf) {
            return i;
        }
    }
    return n - 1; // in case of rounding errors
}

int compare_probindex(const void* a, const void* b) {
    ProbIndex* a_ = (ProbIndex*) a;
    ProbIndex* b_ = (ProbIndex*) b;
    if (a_->prob > b_->prob) return -1;
    if (a_->prob < b_->prob) return 1;
    return 0;
}

int sample_topp(float* probabilities, int n, float topp, ProbIndex* probindex, float coin) {
    int n0 = 0;
    const float cutoff = (1.0f - topp) / (n - 1);
    for (int i = 0; i < n; i++) {
        if (probabilities[i] >= cutoff) {
            probindex[n0].index = i;
            probindex[n0].prob = probabilities[i];
            n0++;
        }
    }
    qsort(probindex, n0, sizeof(ProbIndex), compare_probindex);

    float cumulative_prob = 0.0f;
    int last_idx = n0 - 1;
    for (int i = 0; i < n0; i++) {
        cumulative_prob += probindex[i].prob;
        if (cumulative_prob > topp) {
            last_idx = i;
            break;
        }
    }

    float r = coin * cumulative_prob;
    float cdf = 0.0f;
    for (int i = 0; i <= last_idx; i++) {
        cdf += probindex[i].prob;
        if (r < cdf) {
            return probindex[i].index;
        }
    }
    return probindex[last_idx].index;
}

void build_sampler(Sampler* sampler, int vocab_size, float temperature, float topp, unsigned long long rng_seed) {
    sampler->vocab_size = vocab_size;
    sampler->temperature = temperature;
    sampler->topp = topp;
    sampler->rng_state = rng_seed;
    sampler->probindex = (ProbIndex*)malloc(sampler->vocab_size * sizeof(ProbIndex));
}

void free_sampler(Sampler* sampler) {
    if (sampler->probindex) {
        free(sampler->probindex);
        sampler->probindex = NULL;
    }
}

unsigned int random_u32(unsigned long long *state) {
    *state ^= *state >> 12;
    *state ^= *state << 25;
    *state ^= *state >> 27;
    return (*state * 0x2545F4914F6CDD1Dull) >> 32;
}

float random_f32(unsigned long long *state) {
    return (random_u32(state) >> 8) / 16777216.0f;
}

void softmax_logits(float* x, int size) {
    float max_val = x[0];
    for (int i = 1; i < size; i++) {
        if (x[i] > max_val) {
            max_val = x[i];
        }
    }
    float sum = 0.0f;
    for (int i = 0; i < size; i++) {
        x[i] = expf(x[i] - max_val);
        sum += x[i];
    }
    for (int i = 0; i < size; i++) {
        x[i] /= sum;
    }
}

int sample(Sampler* sampler, float* logits) {
    int next;
    if (sampler->temperature == 0.0f) {
        next = sample_argmax(logits, sampler->vocab_size);
    } else {
        for (int q = 0; q < sampler->vocab_size; q++) {
            logits[q] /= sampler->temperature;
        }
        softmax_logits(logits, sampler->vocab_size);
        float coin = random_f32(&sampler->rng_state);
        if (sampler->topp <= 0 || sampler->topp >= 1) {
            next = sample_mult(logits, sampler->vocab_size, coin);
        } else {
            next = sample_topp(logits, sampler->vocab_size, sampler->topp, sampler->probindex, coin);
        }
    }
    return next;
}

// ============================================================================
// Perplexity (PPL) Evaluation Mode
// ============================================================================
// Perplexity Evaluation (Standard Causal LM Loss on WikiText-2)
// ============================================================================

void calculate_perplexity(
    const AutoRoundModel& model,
    Tokenizer* tokenizer,
    const std::string& path_or_text,
    int max_tokens = 512
) {
    std::cout << "\n==========================================================" << std::endl;
    std::cout << "  CALCULATING PERPLEXITY (PPL) ON WIKITEXT-2              " << std::endl;
    std::cout << "==========================================================" << std::endl;

    std::vector<int> all_tokens;

    // Check if input is a binary pre-tokenized file (.bin)
    if (path_or_text.size() >= 4 && path_or_text.substr(path_or_text.size() - 4) == ".bin") {
        std::ifstream bf(path_or_text, std::ios::binary);
        if (bf.is_open()) {
            bf.seekg(0, std::ios::end);
            size_t bytes = bf.tellg();
            bf.seekg(0, std::ios::beg);
            size_t count = bytes / sizeof(int);
            all_tokens.resize(count);
            bf.read(reinterpret_cast<char*>(all_tokens.data()), bytes);
            std::cout << "Loaded " << count << " pre-tokenized tokens from " << path_or_text << std::endl;
        } else {
            std::cerr << "Failed to open token binary file: " << path_or_text << std::endl;
            return;
        }
    } else {
        std::string text = path_or_text;
        std::ifstream tf(path_or_text);
        if (tf.is_open()) {
            std::stringstream ss;
            ss << tf.rdbuf();
            text = ss.str();
        }
        all_tokens.resize(text.size() + 16);
        int n_all_tokens = 0;
        encode(tokenizer, text.c_str(), 1, 0, all_tokens.data(), &n_all_tokens);
        all_tokens.resize(n_all_tokens);
    }

    if (all_tokens.size() < 2) {
        std::cerr << "Text too short for PPL evaluation (needs >= 2 tokens)" << std::endl;
        return;
    }

    int eval_limit = (int)all_tokens.size();
    if (max_tokens > 0 && max_tokens < eval_limit) {
        eval_limit = max_tokens;
    }

    std::cout << "Total dataset tokens : " << all_tokens.size() << std::endl;
    std::cout << "Evaluating on        : " << eval_limit << " tokens" << std::endl;

    double total_nll = 0.0;
    int eval_count = 0;
    auto t0 = std::chrono::high_resolution_clock::now();

    int chunk_size = MAX_SEQ_LEN;
    int num_chunks = (eval_limit + chunk_size - 1) / chunk_size;

    KVCache kv;
    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    for (int chunk = 0; chunk < num_chunks; ++chunk) {
        int chunk_start = chunk * chunk_size;
        int chunk_end = std::min(eval_limit, chunk_start + chunk_size);
        if (chunk_end - chunk_start < 2) break;

        kv.init(NUM_LAYERS, MAX_SEQ_LEN, DIM);

        for (int pos = 0; pos < chunk_end - chunk_start - 1; ++pos) {
            int cur_token = all_tokens[chunk_start + pos];
            int target_token = all_tokens[chunk_start + pos + 1];

            forward(model, kv, cur_token, pos, residual, logits);

            float max_l = logits[0];
            for (int i = 1; i < VOCAB_SIZE; ++i) {
                if (logits[i] > max_l) max_l = logits[i];
            }

            float sum_exp = 0.0f;
            for (int i = 0; i < VOCAB_SIZE; ++i) {
                sum_exp += std::exp(logits[i] - max_l);
            }
            double log_sum_exp = max_l + std::log(sum_exp);
            double log_prob = logits[target_token] - log_sum_exp;

            total_nll += -log_prob;
            eval_count++;

            if (eval_count % 25 == 0 || eval_count == eval_limit - 1) {
                double current_loss = total_nll / eval_count;
                double current_ppl = std::exp(current_loss);
                std::cout << "  Processed " << std::setw(4) << eval_count << "/" << (eval_limit - 1)
                          << " tokens | Avg Loss: " << std::fixed << std::setprecision(4) << current_loss
                          << " | Current PPL: " << std::fixed << std::setprecision(2) << current_ppl << std::endl;
            }
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    double elapsed_sec = std::chrono::duration<double>(t1 - t0).count();

    const double final_loss = total_nll / eval_count;
    const double final_ppl = std::exp(final_loss);

    std::cout << "\n----------------------------------------------------------" << std::endl;
    std::cout << "  WIKITEXT-2 EVALUATION RESULTS:                          " << std::endl;
    std::cout << "----------------------------------------------------------" << std::endl;
    std::cout << "Total Tokens Evaluated : " << eval_count << std::endl;
    std::cout << "Average Cross-Entropy  : " << std::fixed << std::setprecision(4) << final_loss << std::endl;
    std::cout << "Perplexity (PPL)       : " << std::fixed << std::setprecision(2) << final_ppl << std::endl;
    std::cout << "Time Elapsed           : " << std::fixed << std::setprecision(2) << elapsed_sec << " s ("
              << (eval_count / elapsed_sec) << " tok/s)" << std::endl;
    std::cout << "----------------------------------------------------------" << std::endl;
    std::cout << "Reference Benchmarks (LLaMA-2-7B):" << std::endl;
    std::cout << "  - FP16 Base Model       : PPL ~ 5.4 - 5.8" << std::endl;
    std::cout << "  - AutoRound W4G128      : PPL ~ 5.6 - 6.2 (Excellent preservation)" << std::endl;
    std::cout << "  - Corrupted/Degraded    : PPL > 50.0" << std::endl;
    std::cout << "==========================================================\n" << std::endl;
}

void read_stdin(const char* guide, char* buffer, size_t bufsize) {
    // read a line from stdin, up to but not including \n
    printf("%s", guide);
    fflush(stdout);
    if (fgets(buffer, bufsize, stdin) != NULL) {
        size_t len = strlen(buffer);
        while (len > 0 && (buffer[len - 1] == '\n' || buffer[len - 1] == '\r')) {
            buffer[--len] = '\0'; // strip newline and carriage return
        }
    }
}

void safe_printf(const char *piece) {
    if (piece == NULL) { return; }
    if (piece[0] == '\0') { return; }
    if (piece[1] == '\0') {
        unsigned char byte_val = piece[0];
        if (byte_val < 0x80 && !(isprint(byte_val) || isspace(byte_val))) {
            return;
        }
    }
    printf("%s", piece);
}

// ----------------------------------------------------------------------------
// chat loop (Directly from llama2.c/runq.c)
// ----------------------------------------------------------------------------

void chat(
    const AutoRoundModel& model,
    Tokenizer* tokenizer,
    Sampler* sampler,
    const char* cli_user_prompt,
    const char* cli_system_prompt,
    int steps
) {
    // buffers for reading the system prompt and user prompt from stdin
    char system_prompt[1024] = {0};
    char user_prompt[1024] = {0};
    char rendered_prompt[2400] = {0};
    int num_prompt_tokens = 0;
    std::vector<int> prompt_tokens(MAX_SEQ_LEN);
    int user_idx = 0;

    // start the main loop
    int8_t user_turn = 1; // user starts
    int next = 0;        // will store the next token in the sequence
    int token = 0;       // stores the current token to feed into the transformer
    int pos = 0;         // position in the sequence
    int assistant_tokens = 0;

    KVCache kv;
    kv.init(NUM_LAYERS, MAX_SEQ_LEN, DIM);
    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    while (pos < steps) {

        // when it is the user's turn to contribute tokens to the dialog...
        if (user_turn) {

            // get the (optional) system prompt at position 0
            if (pos == 0) {
                if (cli_system_prompt != NULL && cli_system_prompt[0] != '\0') {
                    strncpy(system_prompt, cli_system_prompt, sizeof(system_prompt) - 1);
                } else if (cli_user_prompt == NULL) {
                    read_stdin("Enter system prompt (optional): ", system_prompt, sizeof(system_prompt));
                } else {
                    system_prompt[0] = '\0';
                }
            }
            // get the user prompt
            if (pos == 0 && cli_user_prompt != NULL && cli_user_prompt[0] != '\0') {
                // user prompt for position 0 was passed in, use it
                strncpy(user_prompt, cli_user_prompt, sizeof(user_prompt) - 1);
            } else {
                // otherwise get user prompt from stdin
                read_stdin("User: ", user_prompt, sizeof(user_prompt));
            }
            // exit if user typed quit, exit, or EOF
            if (feof(stdin) || strcmp(user_prompt, "quit") == 0 || strcmp(user_prompt, "exit") == 0) {
                break;
            }
            if (user_prompt[0] == '\0') {
                continue;
            }

            // render user/system prompts into the Llama 2 Chat schema (matching runq.c)
            if (pos == 0 && system_prompt[0] != '\0') {
                char system_template[] = "[INST] <<SYS>>\n%s\n<</SYS>>\n\n%s [/INST] ";
                snprintf(rendered_prompt, sizeof(rendered_prompt), system_template, system_prompt, user_prompt);
            } else {
                char user_template[] = "[INST] %s [/INST] ";
                snprintf(rendered_prompt, sizeof(rendered_prompt), user_template, user_prompt);
            }
            // encode the rendered prompt into tokens
            encode(tokenizer, rendered_prompt, 1, 0, prompt_tokens.data(), &num_prompt_tokens);
            user_idx = 0; // reset the user index
            user_turn = 0;
            assistant_tokens = 0;
            printf("Assistant: ");
            fflush(stdout);
        }

        // determine the token to pass into the transformer next (matching runq.c)
        if (user_idx < num_prompt_tokens) {
            // if we are still processing the input prompt, force the next prompt token
            token = prompt_tokens[user_idx++];
        } else {
            // otherwise use the next token sampled from previous turn
            token = next;
        }
        // EOS (=2) token ends the Assistant turn
        if (token == 2) { user_turn = 1; }

        // forward the transformer to get logits for the next token
        forward(model, kv, token, pos, residual, logits);
        next = sample(sampler, logits.data());
        pos++;

        if (user_idx >= num_prompt_tokens) {
            // If the model produces EOS (=2) or begins a new [INST] turn after responding
            if (next == 2 || (assistant_tokens > 0 && (token == 518 || token == 29961) && next == 25580)) {
                user_turn = 1;
                printf("\n");
            } else if (assistant_tokens > 0 && (next == 518 || next == 29961)) {
                // Buffer the '[' token to check if 'INST' follows
            } else {
                if (assistant_tokens > 0 && (token == 518 || token == 29961)) {
                    safe_printf((token == 518) ? " [" : "[");
                }
                char* piece = decode(tokenizer, token, next);
                safe_printf(piece); // same as printf("%s", piece), but skips "unsafe" bytes
                fflush(stdout);
                assistant_tokens++;
            }
        }
        if (next == 2) { printf("\n"); }
    }
    printf("\n");
}

// ----------------------------------------------------------------------------
// generation loop matching runq.c
// ----------------------------------------------------------------------------

void generate(
    const AutoRoundModel& model,
    Tokenizer* tokenizer,
    Sampler* sampler,
    const char* prompt,
    int steps
) {
    char empty_prompt[] = "";
    if (prompt == NULL) { prompt = empty_prompt; }

    std::vector<int> prompt_tokens(MAX_SEQ_LEN);
    int num_prompt_tokens = 0;
    encode(tokenizer, prompt, 1, 0, prompt_tokens.data(), &num_prompt_tokens);
    if (num_prompt_tokens < 1) {
        fprintf(stderr, "something is wrong, expected at least 1 prompt token\n");
        return;
    }

    std::cout << "\n--- GENERATED OUTPUT ---\n" << std::endl;
    std::cout << prompt << std::flush;

    KVCache kv;
    kv.init(NUM_LAYERS, MAX_SEQ_LEN, DIM);
    std::vector<float> residual(DIM, 0.0f);
    std::vector<float> logits(VOCAB_SIZE, 0.0f);

    int next = 0;
    int token = prompt_tokens[0];
    int pos = 0;
    int generated_count = 0;
    auto t_start = std::chrono::high_resolution_clock::now();

    while (pos < steps) {
        forward(model, kv, token, pos, residual, logits);

        if (pos < num_prompt_tokens - 1) {
            next = prompt_tokens[pos + 1];
        } else {
            next = sample(sampler, logits.data());
        }
        pos++;

        if (next == 1 || next == 2) { break; }

        if (pos >= num_prompt_tokens) {
            char* piece = decode(tokenizer, token, next);
            safe_printf(piece);
            fflush(stdout);
            generated_count++;
        }
        token = next;
    }
    printf("\n");

    auto t_end = std::chrono::high_resolution_clock::now();
    double gen_sec = std::chrono::duration<double>(t_end - t_start).count();
    std::cout << "\n\n==========================================================" << std::endl;
    std::cout << "Generation finished: " << generated_count << " tokens generated in " 
              << std::fixed << std::setprecision(2) << gen_sec << " s ("
              << (gen_sec > 0 ? generated_count / gen_sec : 0.0) << " tokens/s)" << std::endl;
    std::cout << "==========================================================" << std::endl;
}

// ----------------------------------------------------------------------------
// Quantize weight scales to Q1.15 signed fixed-point (Hardware emulation)
// ----------------------------------------------------------------------------
void quantize_model_scales_to_q115(AutoRoundModel& model) {
    auto quantize_vec = [](std::vector<float>& scales) {
        for (float& s : scales) {
            int16_t q = static_cast<int16_t>(std::clamp(std::round(s * 32768.0f), -32768.0f, 32767.0f));
            s = static_cast<float>(q) / 32768.0f;
        }
    };
    for (auto& layer : model.layers) {
        quantize_vec(layer.w_q.scales);
        quantize_vec(layer.w_k.scales);
        quantize_vec(layer.w_v.scales);
        quantize_vec(layer.w_o.scales);
        quantize_vec(layer.w_gate.scales);
        quantize_vec(layer.w_up.scales);
        quantize_vec(layer.w_down.scales);
    }
}

// ----------------------------------------------------------------------------
// CLI and main matching runq.c
// ----------------------------------------------------------------------------

void error_usage() {
    fprintf(stderr, "Usage:   run <checkpoint> [options]\n");
    fprintf(stderr, "Example: run autoround_w4g128.bin -m chat\n");
    fprintf(stderr, "         run autoround_w4g128.bin -n 256 -i \"Once upon a time\"\n");
    fprintf(stderr, "Options:\n");
    fprintf(stderr, "  -t <float>  temperature in [0,inf], default 0.0 (0.0 = greedy argmax)\n");
    fprintf(stderr, "  -p <float>  p value in top-p (nucleus) sampling in [0,1], default 0.9\n");
    fprintf(stderr, "  -s <int>    random seed, default time(NULL)\n");
    fprintf(stderr, "  -n <int>    number of steps to run for, default 256. 0 = max_seq_len\n");
    fprintf(stderr, "  -i <string> input prompt\n");
    fprintf(stderr, "  -z <string> optional path to custom tokenizer, default tokenizer.bin\n");
    fprintf(stderr, "  -m <string> mode: generate|chat, default: generate\n");
    fprintf(stderr, "  -y <string> (optional) system prompt in chat mode\n");
    fprintf(stderr, "  --ppl <file> evaluate perplexity on text file\n");
    fprintf(stderr, "  --q115      emulate Q1.15 fixed-point weight scales (ap_int<16>)\n");
    exit(EXIT_FAILURE);
}

int main_entry(int argc, char* argv[]) {
    // default parameters matching runq.c
    const char *checkpoint_path = "autoround_w4g128.bin";
    const char *tokenizer_path = "tokenizer.bin";
    float temperature = 0.0f; // default 0.0 = greedy argmax
    float topp = 0.9f;        // default 0.9 matching runq.c
    unsigned long long rng_seed = 0;
    int steps = 256;
    const char *prompt = NULL;
    const char *mode = "generate"; // generate|chat
    const char *system_prompt = NULL;
    bool is_ppl_mode = false;
    std::string ppl_text_path = "";

    // Parse command line arguments
    for (int i = 1; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "-h" || arg == "--help") {
            error_usage();
        } else if (arg == "--ppl" && i + 1 < argc) {
            is_ppl_mode = true;
            ppl_text_path = argv[++i];
        } else if (arg == "-m" && i + 1 < argc) {
            mode = argv[++i];
        } else if (arg == "-i" && i + 1 < argc) {
            prompt = argv[++i];
        } else if (arg == "-y" && i + 1 < argc) {
            system_prompt = argv[++i];
        } else if (arg == "-t" && i + 1 < argc) {
            temperature = std::atof(argv[++i]);
        } else if (arg == "-p" && i + 1 < argc) {
            topp = std::atof(argv[++i]);
        } else if (arg == "-s" && i + 1 < argc) {
            rng_seed = std::atoll(argv[++i]);
        } else if (arg == "-n" && i + 1 < argc) {
            steps = std::atoi(argv[++i]);
        } else if (arg == "-z" && i + 1 < argc) {
            tokenizer_path = argv[++i];
        } else if (arg[0] != '-') {
            if (arg.size() >= 4 && (arg.substr(arg.size() - 4) == ".bin" || (arg.size() >= 12 && arg.substr(arg.size() - 12) == ".safetensors"))) {
                checkpoint_path = argv[i];
            } else {
                prompt = argv[i];
            }
        }
    }

    if (rng_seed <= 0) rng_seed = (unsigned int)time(NULL);
    if (temperature < 0.0f) temperature = 0.0f;
    if (topp < 0.0f || topp > 1.0f) topp = 0.9f;
    if (steps <= 0 || steps > MAX_SEQ_LEN) {
        steps = MAX_SEQ_LEN;
    }

    // 1. Build Tokenizer
    Tokenizer tokenizer;
    build_tokenizer(&tokenizer, tokenizer_path, VOCAB_SIZE);

    // 2. Load AutoRound Model
    AutoRoundModel model;
    auto t_load_start = std::chrono::high_resolution_clock::now();
    if (!load_autoround_model(checkpoint_path, model)) {
        return 1;
    }
    auto t_load_end = std::chrono::high_resolution_clock::now();
    double load_sec = std::chrono::duration<double>(t_load_end - t_load_start).count();
    std::cout << "[Timer] Model loaded into RAM in " << std::fixed << std::setprecision(2) << load_sec << " seconds." << std::endl;

    // 3. PPL Mode
    if (is_ppl_mode) {
        calculate_perplexity(model, &tokenizer, ppl_text_path, steps);
        return 0;
    }

    // 4. Build Sampler
    Sampler sampler;
    build_sampler(&sampler, VOCAB_SIZE, temperature, topp, rng_seed);

    // 5. Run mode
    if (strcmp(mode, "chat") == 0) {
        chat(model, &tokenizer, &sampler, prompt, system_prompt, steps);
    } else if (strcmp(mode, "generate") == 0) {
        if (prompt == NULL) {
            prompt = "The capital of France is";
        }
        generate(model, &tokenizer, &sampler, prompt, steps);
    } else {
        fprintf(stderr, "unknown mode: %s\n", mode);
        error_usage();
    }

    free_sampler(&sampler);
    return 0;
}

#ifndef BUILD_DLL
int main(int argc, char* argv[]) {
    return main_entry(argc, argv);
}
#endif

extern "C" __declspec(dllexport) int run_main(int argc, char** argv) {
    return main_entry(argc, argv);
}

