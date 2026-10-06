/**
 * XRT host for the four-CU INT4 LLaMA-2 decoder on Alveo U250.
 *
 * The tokenizer and generation flow follow DA2_DD/host_u280.cpp, while the
 * buffer layout and launch protocol match the four-PE U250 kernel ABI.
 */

#include <algorithm>
#include <array>
#include <chrono>
#include <cctype>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <numeric>
#include <sstream>
#include <stdexcept>
#include <string>
#include <future>
#include <thread>
#include <vector>

#ifndef __has_include
#define __has_include(x) 0
#endif

#if __has_include(<xrt/xrt_bo.h>)
#include <xrt/xrt_bo.h>
#include <xrt/xrt_device.h>
#include <xrt/xrt_kernel.h>
#if __has_include(<xrt/xrt_ip.h>)
#include <xrt/xrt_ip.h>
#define HAS_XRT_IP 1
#elif __has_include(<experimental/xrt_ip.h>)
#include <experimental/xrt_ip.h>
#define HAS_XRT_IP 1
#endif
#elif __has_include(<experimental/xrt_bo.h>)
#include <experimental/xrt_bo.h>
#include <experimental/xrt_device.h>
#include <experimental/xrt_kernel.h>
#if __has_include(<experimental/xrt_ip.h>)
#include <experimental/xrt_ip.h>
#define HAS_XRT_IP 1
#elif __has_include(<xrt/xrt_ip.h>)
#include <xrt/xrt_ip.h>
#define HAS_XRT_IP 1
#endif
#else
#error "XRT C++ headers were not found. Source /opt/xilinx/xrt/setup.sh before building."
#endif

namespace {

constexpr int NUM_PES = 4;
constexpr int DIM = 4096;
constexpr int VOCAB_SIZE = 32000;
constexpr int PADDED_VOCAB_SIZE = 32256;
constexpr int NUM_HEADS = 32;
constexpr int NUM_LAYERS = 32;
constexpr int MAX_SEQ_LEN = 4096;
constexpr int OUTPUTS_PER_WORD = 16;
constexpr int DDR_WORD_BYTES = 64;

constexpr std::size_t MODEL_BANK_WORDS_LEGACY = 13926208ULL;
constexpr std::size_t MODEL_BANK_BYTES_LEGACY =
    MODEL_BANK_WORDS_LEGACY * DDR_WORD_BYTES;
constexpr std::size_t MODEL_BANK_WORDS_DENSE = 13516736ULL;
constexpr std::size_t MODEL_BANK_BYTES_DENSE =
    MODEL_BANK_WORDS_DENSE * DDR_WORD_BYTES;
constexpr std::size_t MODEL_BANK_WORDS = MODEL_BANK_WORDS_LEGACY;
constexpr std::size_t MODEL_BANK_BYTES = MODEL_BANK_BYTES_LEGACY;
constexpr std::size_t MODEL_DATA_BASE_WORD = 4160ULL;
constexpr std::size_t LINEAR_MATRIX_WORDS = 33792ULL;
constexpr std::size_t O_PROJECTION_WORD_OFFSET =
    MODEL_DATA_BASE_WORD + 3ULL * LINEAR_MATRIX_WORDS;
constexpr std::size_t O_PROJECTION_SUPERBLOCK_WORDS = 4224ULL;
constexpr std::size_t O_PROJECTION_BYTE_OFFSET =
    O_PROJECTION_WORD_OFFSET * DDR_WORD_BYTES;
constexpr std::size_t O_PROJECTION_SUPERBLOCK_BYTES =
    O_PROJECTION_SUPERBLOCK_WORDS * DDR_WORD_BYTES;
constexpr std::size_t ROPE_LUT_WORDS = 32768ULL;
constexpr std::size_t ROPE_LUT_BYTES = ROPE_LUT_WORDS * DDR_WORD_BYTES;
constexpr std::size_t RESIDUAL_WORDS = (DIM / NUM_PES) / OUTPUTS_PER_WORD;
constexpr std::size_t RESIDUAL_BYTES = RESIDUAL_WORDS * DDR_WORD_BYTES;
constexpr std::size_t LOGIT_WORDS =
    (PADDED_VOCAB_SIZE / NUM_PES) / OUTPUTS_PER_WORD;
constexpr std::size_t LOGIT_BYTES = LOGIT_WORDS * DDR_WORD_BYTES;

constexpr int LOCAL_HEADS = NUM_HEADS / NUM_PES;
constexpr int KV_WORDS_PER_TOKEN_HEAD = 5;
constexpr std::size_t KV_WORDS_PER_PE =
    std::size_t(NUM_LAYERS) * LOCAL_HEADS * MAX_SEQ_LEN *
    KV_WORDS_PER_TOKEN_HEAD;
constexpr std::size_t KV_BYTES = KV_WORDS_PER_PE * DDR_WORD_BYTES;
constexpr std::size_t EMBEDDING_BYTES =
    std::size_t(VOCAB_SIZE) * DIM * sizeof(float);
constexpr unsigned int RUN_TIMEOUT_MS = 10000;

static_assert(MODEL_BANK_BYTES_LEGACY == 891277312ULL,
              "legacy model bank size must match 13926208 words");
static_assert(MODEL_BANK_BYTES_DENSE == 865071104ULL,
              "dense model bank size must match 13516736 words");
static_assert(ROPE_LUT_BYTES == 2097152ULL,
              "RoPE LUT size must match swiftkv_attention.hpp");
static_assert(RESIDUAL_BYTES == 4096ULL,
              "residual shard size must match the kernel ABI");
static_assert(LOGIT_BYTES == 32256ULL,
              "logit shard size must match the kernel ABI");
static_assert(KV_BYTES == 335544320ULL,
              "KV cache size must match swiftkv_attention.hpp");

using Clock = std::chrono::steady_clock;

double elapsed_ms(Clock::time_point begin, Clock::time_point end) {
    return std::chrono::duration<double, std::milli>(end - begin).count();
}

std::string join_path(const std::string& dir, const std::string& file) {
    if (dir.empty()) {
        return file;
    }
    const char last = dir.back();
    if (last == '/' || last == '\\') {
        return dir + file;
    }
    return dir + "/" + file;
}

std::size_t file_size(const std::string& path) {
    std::ifstream in(path, std::ios::binary | std::ios::ate);
    if (!in) {
        throw std::runtime_error("cannot open " + path);
    }
    const std::streampos end = in.tellg();
    if (end < 0) {
        throw std::runtime_error("cannot determine size of " + path);
    }
    return static_cast<std::size_t>(end);
}

void read_exact_file(const std::string& path, void* destination,
                     std::size_t expected_bytes) {
    const std::size_t actual_bytes = file_size(path);
    if (actual_bytes != expected_bytes) {
        std::ostringstream message;
        message << "size mismatch for " << path << ": expected "
                << expected_bytes << " bytes, got " << actual_bytes;
        throw std::runtime_error(message.str());
    }

    std::ifstream in(path, std::ios::binary);
    if (!in) {
        throw std::runtime_error("cannot open " + path);
    }

    auto* output = static_cast<char*>(destination);
    std::size_t done = 0;
    constexpr std::size_t CHUNK_BYTES = 64ULL * 1024ULL * 1024ULL;
    while (done < expected_bytes) {
        const std::size_t count =
            std::min(CHUNK_BYTES, expected_bytes - done);
        in.read(output + done, static_cast<std::streamsize>(count));
        if (static_cast<std::size_t>(in.gcount()) != count) {
            throw std::runtime_error("short read in " + path);
        }
        done += count;
    }
}

void load_bo_from_file(xrt::bo& bo, const std::string& path,
                       std::size_t bytes, bool verbose) {
    if (verbose) {
        std::cout << "[Init] Reading " << path << " ("
                  << bytes / (1024 * 1024) << " MiB) ..." << std::endl;
    }
    const auto read_begin = Clock::now();
    auto* mapped = bo.map<std::uint8_t*>();
    read_exact_file(path, mapped, bytes);
    const auto read_end = Clock::now();

    if (verbose) {
        std::cout << "[Init] Syncing " << path << " to device ..."
                  << std::endl;
    }
    bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, bytes, 0);
    const auto sync_end = Clock::now();

    if (verbose) {
        std::cout << "[Init] Loaded " << path
                  << " (read=" << std::fixed << std::setprecision(1)
                  << elapsed_ms(read_begin, read_end) << " ms, sync="
                  << elapsed_ms(read_end, sync_end) << " ms)" << std::endl;
    }
}

void verify_o_projection_device_region(
    xrt::bo& bo, const std::string& path, int pe) {
    std::vector<std::uint8_t> expected(O_PROJECTION_SUPERBLOCK_BYTES);
    std::ifstream input(path, std::ios::binary);
    if (!input) {
        throw std::runtime_error("cannot open " + path);
    }
    input.seekg(static_cast<std::streamoff>(O_PROJECTION_BYTE_OFFSET));
    if (!input) {
        throw std::runtime_error("cannot seek O-projection region in " + path);
    }
    input.read(reinterpret_cast<char*>(expected.data()),
               static_cast<std::streamsize>(expected.size()));
    if (static_cast<std::size_t>(input.gcount()) != expected.size()) {
        throw std::runtime_error("short O-projection region read in " + path);
    }

    const auto begin = Clock::now();
    bo.sync(XCL_BO_SYNC_BO_FROM_DEVICE,
            O_PROJECTION_SUPERBLOCK_BYTES,
            O_PROJECTION_BYTE_OFFSET);
    const auto end = Clock::now();
    const auto* actual = bo.map<std::uint8_t*>();
    const auto mismatch = std::mismatch(
        expected.begin(), expected.end(),
        actual + O_PROJECTION_BYTE_OFFSET);
    if (mismatch.first != expected.end()) {
        const std::size_t byte_in_region =
            static_cast<std::size_t>(mismatch.first - expected.begin());
        const std::size_t absolute_byte =
            O_PROJECTION_BYTE_OFFSET + byte_in_region;
        std::ostringstream message;
        message << "PE" << pe << " O-projection DDR readback mismatch"
                << " at absolute byte " << absolute_byte
                << " (word " << absolute_byte / DDR_WORD_BYTES
                << ", byte-in-word " << absolute_byte % DDR_WORD_BYTES
                << "): file=0x" << std::hex
                << static_cast<unsigned int>(*mismatch.first)
                << " device=0x"
                << static_cast<unsigned int>(
                       actual[O_PROJECTION_BYTE_OFFSET + byte_in_region]);
        throw std::runtime_error(message.str());
    }
    std::cout << "[Verify] PASS PE" << pe
              << " O-projection DDR readback: "
              << O_PROJECTION_SUPERBLOCK_BYTES << " bytes match ("
              << std::fixed << std::setprecision(1)
              << elapsed_ms(begin, end) << " ms)" << std::endl;
}

std::vector<float> load_embeddings(const std::string& path, bool verbose) {
    if (verbose) {
        std::cout << "[Init] Reading " << path << " ("
                  << EMBEDDING_BYTES / (1024 * 1024) << " MiB) ..."
                  << std::endl;
    }
    const auto begin = Clock::now();
    std::vector<float> embeddings(std::size_t(VOCAB_SIZE) * DIM);
    read_exact_file(path, embeddings.data(), EMBEDDING_BYTES);
    const auto end = Clock::now();
    if (verbose) {
        std::cout << "[Init] Loaded " << VOCAB_SIZE << " x " << DIM
                  << " embedding table in " << std::fixed
                  << std::setprecision(1) << elapsed_ms(begin, end)
                  << " ms" << std::endl;
    }
    return embeddings;
}

struct TokenIndex {
    char* text = nullptr;
    int id = 0;
};

int compare_tokens(const void* lhs, const void* rhs) {
    return std::strcmp(static_cast<const TokenIndex*>(lhs)->text,
                       static_cast<const TokenIndex*>(rhs)->text);
}

struct Tokenizer {
    std::vector<std::string> vocab;
    std::vector<float> scores;
    std::vector<TokenIndex> sorted_vocab;
    unsigned int max_token_length = 0;
    std::array<std::array<char, 2>, 256> byte_pieces{};

    void load(const std::string& path) {
        std::ifstream in(path, std::ios::binary);
        if (!in) {
            throw std::runtime_error("cannot open tokenizer: " + path);
        }

        in.read(reinterpret_cast<char*>(&max_token_length),
                sizeof(max_token_length));
        if (!in || max_token_length == 0 || max_token_length > (1U << 20)) {
            throw std::runtime_error("invalid tokenizer header in " + path);
        }

        vocab.resize(VOCAB_SIZE);
        scores.resize(VOCAB_SIZE);
        for (int i = 0; i < VOCAB_SIZE; ++i) {
            int length = 0;
            in.read(reinterpret_cast<char*>(&scores[i]), sizeof(scores[i]));
            in.read(reinterpret_cast<char*>(&length), sizeof(length));
            if (!in || length < 0 ||
                static_cast<unsigned int>(length) > max_token_length) {
                throw std::runtime_error(
                    "invalid tokenizer entry " + std::to_string(i));
            }
            vocab[i].resize(static_cast<std::size_t>(length));
            if (length > 0) {
                in.read(&vocab[i][0], length);
            }
            if (!in) {
                throw std::runtime_error(
                    "short tokenizer entry " + std::to_string(i));
            }
        }

        for (int i = 0; i < 256; ++i) {
            byte_pieces[i][0] = static_cast<char>(i);
            byte_pieces[i][1] = '\0';
        }

        sorted_vocab.resize(VOCAB_SIZE);
        for (int i = 0; i < VOCAB_SIZE; ++i) {
            sorted_vocab[i].text = const_cast<char*>(vocab[i].c_str());
            sorted_vocab[i].id = i;
        }
        std::qsort(sorted_vocab.data(), sorted_vocab.size(),
                   sizeof(TokenIndex), compare_tokens);
    }

    int lookup(const char* text) const {
        TokenIndex key{const_cast<char*>(text), 0};
        const auto* result = static_cast<const TokenIndex*>(std::bsearch(
            &key, sorted_vocab.data(), sorted_vocab.size(),
            sizeof(TokenIndex), compare_tokens));
        return result == nullptr ? -1 : result->id;
    }

    std::vector<int> encode(const std::string& text, bool bos,
                            bool eos) const {
        std::vector<char> buffer(std::size_t(max_token_length) * 2 + 3, 0);
        std::vector<int> tokens;
        tokens.reserve(text.size() + 2);

        if (bos) {
            tokens.push_back(1);
        }
        if (!text.empty()) {
            const int dummy_prefix = lookup(" ");
            if (dummy_prefix < 0) {
                throw std::runtime_error(
                    "tokenizer does not contain the dummy space token");
            }
            tokens.push_back(dummy_prefix);
        }

        std::size_t utf8_length = 0;
        for (const char* cursor = text.c_str(); *cursor != '\0'; ++cursor) {
            if ((static_cast<unsigned char>(*cursor) & 0xC0U) != 0x80U) {
                utf8_length = 0;
            }

            if (utf8_length + 1 >= buffer.size()) {
                throw std::runtime_error("UTF-8 token exceeds tokenizer buffer");
            }
            buffer[utf8_length++] = *cursor;
            buffer[utf8_length] = '\0';

            if ((static_cast<unsigned char>(*(cursor + 1)) & 0xC0U) ==
                    0x80U &&
                utf8_length < 4) {
                continue;
            }

            const int id = lookup(buffer.data());
            if (id >= 0) {
                tokens.push_back(id);
            } else {
                for (std::size_t i = 0; i < utf8_length; ++i) {
                    tokens.push_back(
                        static_cast<unsigned char>(buffer[i]) + 3);
                }
            }
            utf8_length = 0;
        }

        while (tokens.size() >= 2) {
            float best_score = -std::numeric_limits<float>::infinity();
            int best_id = -1;
            std::size_t best_index = 0;

            for (std::size_t i = 0; i + 1 < tokens.size(); ++i) {
                const std::string merged =
                    vocab[tokens[i]] + vocab[tokens[i + 1]];
                const int id = lookup(merged.c_str());
                if (id >= 0 && scores[id] > best_score) {
                    best_score = scores[id];
                    best_id = id;
                    best_index = i;
                }
            }

            if (best_id < 0) {
                break;
            }
            tokens[best_index] = best_id;
            tokens.erase(tokens.begin() +
                         static_cast<std::ptrdiff_t>(best_index + 1));
        }

        if (eos) {
            tokens.push_back(2);
        }
        return tokens;
    }

    std::string decode_piece(int previous_token, int token) const {
        if (token < 0 || token >= VOCAB_SIZE) {
            throw std::runtime_error("token id out of range: " +
                                     std::to_string(token));
        }

        const char* piece = vocab[token].c_str();
        if (previous_token == 1 && piece[0] == ' ') {
            ++piece;
        }

        unsigned int byte_value = 0;
        if (std::sscanf(piece, "<0x%02X>", &byte_value) == 1 &&
            byte_value < 256) {
            piece = byte_pieces[byte_value].data();
        }

        std::string output(piece);
        if (output.size() == 1) {
            const unsigned char value =
                static_cast<unsigned char>(output[0]);
            if (!(std::isprint(value) || std::isspace(value))) {
                output.clear();
            }
        }
        return output;
    }
};

void print_tokens(const char* label, const std::vector<int>& tokens) {
    std::cout << label << ':';
    for (int token : tokens) {
        std::cout << ' ' << token;
    }
    std::cout << std::endl;
}

std::string escape_text(const std::string& text) {
    std::ostringstream output;
    for (unsigned char value : text) {
        switch (value) {
            case '\n': output << "\\n"; break;
            case '\r': output << "\\r"; break;
            case '\t': output << "\\t"; break;
            case '\\': output << "\\\\"; break;
            case '"': output << "\\\""; break;
            default:
                if (std::isprint(value) || value >= 0x80) {
                    output << static_cast<char>(value);
                } else {
                    output << "\\x" << std::hex << std::setw(2)
                           << std::setfill('0') << static_cast<int>(value)
                           << std::dec << std::setfill(' ');
                }
        }
    }
    return output.str();
}

void prepare_dump_directory(const std::string& directory,
                            const char* dump_name) {
    std::error_code error;
    std::filesystem::create_directories(directory, error);
    if (error || !std::filesystem::is_directory(directory)) {
        throw std::runtime_error(
            std::string("cannot create ") + dump_name +
            " dump directory " + directory +
            (error ? ": " + error.message() : ""));
    }
}

std::string dump_logits(const std::string& directory, int position,
                        int token_id, const float* logits) {
    std::ostringstream name;
    name << "logits_pos" << std::setw(4) << std::setfill('0') << position
         << "_token" << std::setw(5) << std::setfill('0') << token_id
         << ".bin";
    const std::string path = join_path(directory, name.str());
    std::ofstream out(path, std::ios::binary | std::ios::trunc);
    if (!out) {
        throw std::runtime_error("cannot create logits dump " + path);
    }
    out.write(reinterpret_cast<const char*>(logits),
              std::size_t(PADDED_VOCAB_SIZE) * sizeof(float));
    if (!out) {
        throw std::runtime_error("cannot write logits dump " + path);
    }
    return path;
}

std::string dump_residuals(const std::string& directory, int position,
                           int token_id, const float* residuals) {
    std::ostringstream name;
    name << "residual_pos" << std::setw(4) << std::setfill('0') << position
         << "_token" << std::setw(5) << std::setfill('0') << token_id
         << ".bin";
    const std::string path = join_path(directory, name.str());
    std::ofstream out(path, std::ios::binary | std::ios::trunc);
    if (!out) {
        throw std::runtime_error("cannot create residual dump " + path);
    }
    out.write(reinterpret_cast<const char*>(residuals),
              std::size_t(DIM) * sizeof(float));
    if (!out) {
        throw std::runtime_error("cannot write residual dump " + path);
    }
    return path;
}

void print_residual_diagnostics(const float* residuals, int position) {
    int finite_count = 0;
    int nan_count = 0;
    int positive_inf_count = 0;
    int negative_inf_count = 0;
    float minimum = std::numeric_limits<float>::infinity();
    float maximum = -std::numeric_limits<float>::infinity();
    double sum_squares = 0.0;
    for (int index = 0; index < DIM; ++index) {
        const float value = residuals[index];
        if (std::isnan(value)) {
            ++nan_count;
        } else if (std::isinf(value)) {
            if (std::signbit(value)) {
                ++negative_inf_count;
            } else {
                ++positive_inf_count;
            }
        } else {
            ++finite_count;
            minimum = std::min(minimum, value);
            maximum = std::max(maximum, value);
            sum_squares += double(value) * double(value);
        }
    }

    const auto old_flags = std::cout.flags();
    const auto old_precision = std::cout.precision();
    std::cout << "[Residual] pos=" << position
              << " finite=" << finite_count
              << " nan=" << nan_count
              << " +inf=" << positive_inf_count
              << " -inf=" << negative_inf_count;
    if (finite_count > 0) {
        std::cout << " min=" << std::scientific << std::setprecision(7)
                  << minimum << " max=" << maximum
                  << " l2=" << std::sqrt(sum_squares);
    }
    std::cout << std::endl;
    std::cout.flags(old_flags);
    std::cout.precision(old_precision);
}

void print_logit_diagnostics(const float* logits, int top_k, int position,
                             const Tokenizer& tokenizer) {
    int finite_count = 0;
    int nan_count = 0;
    int positive_inf_count = 0;
    int negative_inf_count = 0;
    float minimum = std::numeric_limits<float>::infinity();
    float maximum = -std::numeric_limits<float>::infinity();
    for (int token = 0; token < VOCAB_SIZE; ++token) {
        const float value = logits[token];
        if (std::isnan(value)) {
            ++nan_count;
        } else if (std::isinf(value)) {
            if (std::signbit(value)) {
                ++negative_inf_count;
            } else {
                ++positive_inf_count;
            }
        } else {
            ++finite_count;
            minimum = std::min(minimum, value);
            maximum = std::max(maximum, value);
        }
    }

    int padded_nonzero = 0;
    int padded_nonfinite = 0;
    float padded_max_abs = 0.0f;
    for (int token = VOCAB_SIZE; token < PADDED_VOCAB_SIZE; ++token) {
        const float value = logits[token];
        if (!std::isfinite(value)) {
            ++padded_nonfinite;
        } else {
            if (value != 0.0f) {
                ++padded_nonzero;
            }
            padded_max_abs = std::max(padded_max_abs, std::fabs(value));
        }
    }

    const auto old_flags = std::cout.flags();
    const auto old_precision = std::cout.precision();
    std::cout << "[Logits] pos=" << position
              << " valid_finite=" << finite_count
              << " nan=" << nan_count
              << " +inf=" << positive_inf_count
              << " -inf=" << negative_inf_count;
    if (finite_count > 0) {
        std::cout << " min=" << std::scientific << std::setprecision(7)
                  << minimum << " max=" << maximum;
    }
    std::cout << " padded_nonzero=" << padded_nonzero
              << " padded_nonfinite=" << padded_nonfinite
              << " padded_max_abs=" << std::scientific
              << std::setprecision(7) << padded_max_abs << std::endl;

    if (top_k > 0) {
        std::vector<int> indices(VOCAB_SIZE);
        std::iota(indices.begin(), indices.end(), 0);
        const auto better = [&](int lhs, int rhs) {
            const bool lhs_nan = std::isnan(logits[lhs]);
            const bool rhs_nan = std::isnan(logits[rhs]);
            if (lhs_nan != rhs_nan) {
                return !lhs_nan;
            }
            if (lhs_nan) {
                return lhs < rhs;
            }
            if (logits[lhs] != logits[rhs]) {
                return logits[lhs] > logits[rhs];
            }
            return lhs < rhs;
        };
        std::partial_sort(indices.begin(), indices.begin() + top_k,
                          indices.end(), better);
        for (int rank = 0; rank < top_k; ++rank) {
            const int token = indices[rank];
            std::cout << "[TopK] pos=" << position
                      << " rank=" << rank + 1
                      << " token=" << token
                      << " logit=" << std::scientific
                      << std::setprecision(9) << logits[token]
                      << " piece=\"" << escape_text(tokenizer.vocab[token])
                      << "\"" << std::endl;
        }
    }
    std::cout.flags(old_flags);
    std::cout.precision(old_precision);
}

void pack_residual(const float* embedding, float* shard0, float* shard1,
                   float* shard2, float* shard3) {
    constexpr int LOCAL_DIM = DIM / NUM_PES;
    std::memcpy(shard0, embedding, LOCAL_DIM * sizeof(float));
    std::memcpy(shard1, embedding + LOCAL_DIM,
                LOCAL_DIM * sizeof(float));
    std::memcpy(shard2, embedding + 2 * LOCAL_DIM,
                LOCAL_DIM * sizeof(float));
    std::memcpy(shard3, embedding + 3 * LOCAL_DIM,
                LOCAL_DIM * sizeof(float));
}

void unpack_residual(const float* shard0, const float* shard1,
                     const float* shard2, const float* shard3,
                     float* residual) {
    constexpr int LOCAL_DIM = DIM / NUM_PES;
    const std::array<const float*, NUM_PES> shards = {
        shard0, shard1, shard2, shard3};
    for (int pe = 0; pe < NUM_PES; ++pe) {
        std::memcpy(residual + pe * LOCAL_DIM, shards[pe],
                    std::size_t(LOCAL_DIM) * sizeof(float));
    }
}

void unpack_logits(const float* shard0, const float* shard1,
                   const float* shard2, const float* shard3,
                   float* logits) {
    constexpr int LOCAL_VOCAB = PADDED_VOCAB_SIZE / NUM_PES;
    const std::array<const float*, NUM_PES> shards = {
        shard0, shard1, shard2, shard3};
    for (int pe = 0; pe < NUM_PES; ++pe) {
        const int begin = pe * LOCAL_VOCAB;
        std::memcpy(logits + begin, shards[pe],
                    std::size_t(LOCAL_VOCAB) * sizeof(float));
    }
}

int argmax_logits(const float* logits) {
    int best = -1;
    for (int i = 0; i < VOCAB_SIZE; ++i) {
        if (std::isnan(logits[i])) {
            continue;
        }
        if (best < 0 || logits[i] > logits[best]) {
            best = i;
        }
    }
    if (best < 0) {
        throw std::runtime_error("all valid-vocabulary logits are NaN");
    }
    return best;
}

struct ProbIndex {
    float probability = 0.0f;
    int index = 0;
};

class Sampler {
public:
    Sampler(float temperature, float top_p, float repeat_penalty,
            std::uint64_t seed)
        : temperature_(temperature),
          top_p_(top_p),
          repeat_penalty_(repeat_penalty),
          rng_state_(seed == 0 ? 1 : seed),
          probabilities_(VOCAB_SIZE),
          penalized_(VOCAB_SIZE, false) {
        candidates_.reserve(VOCAB_SIZE);
    }

    int select(const float* logits, const std::vector<int>& token_history) {
        if (temperature_ == 0.0f && repeat_penalty_ == 1.0f) {
            return argmax_logits(logits);
        }

        std::copy(logits, logits + VOCAB_SIZE, probabilities_.begin());
        apply_repeat_penalty(token_history);

        if (temperature_ == 0.0f) {
            return argmax_logits(probabilities_.data());
        }

        float maximum = -std::numeric_limits<float>::infinity();
        for (float value : probabilities_) {
            if (std::isfinite(value)) {
                maximum = std::max(maximum, value);
            }
        }
        if (!std::isfinite(maximum)) {
            throw std::runtime_error(
                "all valid-vocabulary logits are non-finite");
        }

        float sum = 0.0f;
        for (float& value : probabilities_) {
            value = std::isfinite(value)
                ? std::exp((value - maximum) / temperature_)
                : 0.0f;
            sum += value;
        }
        if (!(sum > 0.0f) || !std::isfinite(sum)) {
            throw std::runtime_error("invalid probability sum during sampling");
        }
        for (float& value : probabilities_) {
            value /= sum;
        }

        const float coin = random_f32();
        if (top_p_ <= 0.0f || top_p_ >= 1.0f) {
            return sample_multinomial(coin);
        }
        return sample_top_p(coin);
    }

private:
    void apply_repeat_penalty(const std::vector<int>& token_history) {
        if (repeat_penalty_ == 1.0f) {
            return;
        }
        std::fill(penalized_.begin(), penalized_.end(), false);
        for (int token : token_history) {
            if (token < 0 || token >= VOCAB_SIZE || penalized_[token]) {
                continue;
            }
            float& logit = probabilities_[token];
            if (std::isfinite(logit)) {
                logit = logit < 0.0f
                    ? logit * repeat_penalty_
                    : logit / repeat_penalty_;
            }
            penalized_[token] = true;
        }
    }

    std::uint32_t random_u32() {
        rng_state_ ^= rng_state_ >> 12;
        rng_state_ ^= rng_state_ << 25;
        rng_state_ ^= rng_state_ >> 27;
        return static_cast<std::uint32_t>(
            (rng_state_ * 0x2545F4914F6CDD1DULL) >> 32);
    }

    float random_f32() {
        return (random_u32() >> 8) / 16777216.0f;
    }

    int sample_multinomial(float coin) const {
        float cumulative = 0.0f;
        for (int token = 0; token < VOCAB_SIZE; ++token) {
            cumulative += probabilities_[token];
            if (coin < cumulative) {
                return token;
            }
        }
        return VOCAB_SIZE - 1;
    }

    int sample_top_p(float coin) {
        candidates_.clear();
        const float cutoff = (1.0f - top_p_) / (VOCAB_SIZE - 1);
        for (int token = 0; token < VOCAB_SIZE; ++token) {
            if (probabilities_[token] >= cutoff) {
                candidates_.push_back({probabilities_[token], token});
            }
        }
        if (candidates_.empty()) {
            return argmax_logits(probabilities_.data());
        }
        std::sort(candidates_.begin(), candidates_.end(),
                  [](const ProbIndex& lhs, const ProbIndex& rhs) {
                      return lhs.probability > rhs.probability;
                  });

        float nucleus_sum = 0.0f;
        std::size_t last = 0;
        for (; last < candidates_.size(); ++last) {
            nucleus_sum += candidates_[last].probability;
            if (nucleus_sum >= top_p_) {
                break;
            }
        }
        last = std::min(last, candidates_.size() - 1);

        const float target = coin * nucleus_sum;
        float cumulative = 0.0f;
        for (std::size_t i = 0; i <= last; ++i) {
            cumulative += candidates_[i].probability;
            if (target < cumulative) {
                return candidates_[i].index;
            }
        }
        return candidates_[last].index;
    }

    float temperature_;
    float top_p_;
    float repeat_penalty_;
    std::uint64_t rng_state_;
    std::vector<float> probabilities_;
    std::vector<bool> penalized_;
    std::vector<ProbIndex> candidates_;
};

struct Config {
    std::string xclbin = "int4_decoder_multikernel_300mhz.xclbin";
    std::string banks_dir = ".";
    std::string rope_lut;
    std::string tokenizer;
    std::string embeddings;
    std::string prompt = "Once upon a time";
    std::string device_id = "0000:13:00.0";
    std::string dump_logits_dir;
    std::string dump_residuals_dir;
    int max_tokens = 256;
    int top_k = 0;
    float temperature = 0.0f;
    float top_p = 0.9f;
    float repeat_penalty = 1.0f;
    std::uint64_t seed = 42;
    bool tokenize_only = false;
    bool pause_after_load = false;
    bool verify_device_model = false;
    bool verbose = false;
};

void print_usage(const char* program) {
    std::cout
        << "Usage: " << program << " [options]\n"
        << "  --xclbin PATH       decoder xclbin\n"
        << "  --banks DIR         directory containing model_bank0..3.bin\n"
        << "  --rope PATH         rope_lut.bin (default: BANKS/rope_lut.bin)\n"
        << "  --tokenizer PATH    tokenizer.bin (default: BANKS/tokenizer.bin)\n"
        << "  --embeddings PATH   embeddings.bin (default: BANKS/embeddings.bin)\n"
        << "  --prompt TEXT       prompt text\n"
        << "  --max-tokens N      maximum number of new tokens\n"
        << "  --temperature F     sampling temperature (default: 0 = greedy)\n"
        << "  --top-p F           nucleus sampling probability in [0,1] (default: 0.9)\n"
        << "  --repeat-penalty F  token repetition penalty > 0 (default: 1.0)\n"
        << "  --seed N            sampling RNG seed (default: 42)\n"
        << "  --top-k N           print the N highest valid-vocabulary logits per step\n"
        << "  --dump-logits DIR   dump all 32256 raw FP32 logits for every step\n"
        << "  --dump-residuals DIR dump the final 4096-value FP32 residual for every step\n"
        << "  --device ID         BDF or numeric XRT device index\n"
        << "  --pause-after-load  wait after loading xclbin so hardware ILAs can be armed\n"
        << "  --verify-device-model read back each PE's first O-projection superblock\n"
        << "  --verbose           print initialization, per-PE timing, token IDs, and statistics\n"
        << "  --tokenize-only     print prompt token IDs without loading FPGA\n";
}

int parse_positive_int(const std::string& text, const char* name) {
    std::size_t consumed = 0;
    const long value = std::stol(text, &consumed, 10);
    if (consumed != text.size() || value <= 0 ||
        value > std::numeric_limits<int>::max()) {
        throw std::runtime_error(std::string("invalid ") + name + ": " + text);
    }
    return static_cast<int>(value);
}

float parse_finite_float(const std::string& text, const char* name) {
    std::size_t consumed = 0;
    const float value = std::stof(text, &consumed);
    if (consumed != text.size() || !std::isfinite(value)) {
        throw std::runtime_error(std::string("invalid ") + name + ": " +
                                 text);
    }
    return value;
}

std::uint64_t parse_seed(const std::string& text) {
    if (text.empty() || text.front() == '-') {
        throw std::runtime_error("invalid --seed: " + text);
    }
    std::size_t consumed = 0;
    const unsigned long long value = std::stoull(text, &consumed, 10);
    if (consumed != text.size()) {
        throw std::runtime_error("invalid --seed: " + text);
    }
    return static_cast<std::uint64_t>(value);
}

int parse_device_index(const std::string& text) {
    std::size_t consumed = 0;
    const long value = std::stol(text, &consumed, 10);
    if (consumed != text.size() || value < 0 ||
        value > std::numeric_limits<int>::max()) {
        throw std::runtime_error("invalid --device: " + text);
    }
    return static_cast<int>(value);
}

Config parse_args(int argc, char** argv) {
    Config config;
    for (int i = 1; i < argc; ++i) {
        const std::string argument = argv[i];
        auto next = [&]() -> std::string {
            if (i + 1 >= argc) {
                throw std::runtime_error("missing value for " + argument);
            }
            return argv[++i];
        };

        if (argument == "--xclbin") config.xclbin = next();
        else if (argument == "--banks") config.banks_dir = next();
        else if (argument == "--rope") config.rope_lut = next();
        else if (argument == "--tokenizer") config.tokenizer = next();
        else if (argument == "--embeddings") config.embeddings = next();
        else if (argument == "--prompt") config.prompt = next();
        else if (argument == "--tokenize-only") config.tokenize_only = true;
        else if (argument == "--pause-after-load") config.pause_after_load = true;
        else if (argument == "--verify-device-model") {
            config.verify_device_model = true;
        }
        else if (argument == "--verbose") config.verbose = true;
        else if (argument == "--max-tokens") {
            config.max_tokens = parse_positive_int(next(), "--max-tokens");
        } else if (argument == "--temperature") {
            config.temperature =
                parse_finite_float(next(), "--temperature");
            if (config.temperature < 0.0f) {
                throw std::runtime_error("--temperature must be >= 0");
            }
        } else if (argument == "--top-p") {
            config.top_p = parse_finite_float(next(), "--top-p");
            if (config.top_p < 0.0f || config.top_p > 1.0f) {
                throw std::runtime_error("--top-p must be in [0,1]");
            }
        } else if (argument == "--repeat-penalty") {
            config.repeat_penalty =
                parse_finite_float(next(), "--repeat-penalty");
            if (config.repeat_penalty <= 0.0f) {
                throw std::runtime_error("--repeat-penalty must be > 0");
            }
        } else if (argument == "--seed") {
            config.seed = parse_seed(next());
        } else if (argument == "--top-k") {
            config.top_k = parse_positive_int(next(), "--top-k");
            if (config.top_k > VOCAB_SIZE) {
                throw std::runtime_error("--top-k exceeds vocabulary size");
            }
        } else if (argument == "--dump-logits") {
            config.dump_logits_dir = next();
            if (config.dump_logits_dir.empty()) {
                throw std::runtime_error("--dump-logits directory is empty");
            }
        } else if (argument == "--dump-residuals") {
            config.dump_residuals_dir = next();
            if (config.dump_residuals_dir.empty()) {
                throw std::runtime_error(
                    "--dump-residuals directory is empty");
            }
        } else if (argument == "--device") config.device_id = next();
        else if (argument == "--help" || argument == "-h") {
            print_usage(argv[0]);
            std::exit(0);
        } else {
            throw std::runtime_error("unknown argument: " + argument);
        }
    }

    if (config.embeddings.empty()) {
        config.embeddings = join_path(config.banks_dir, "embeddings.bin");
    }
    if (config.rope_lut.empty()) {
        config.rope_lut = join_path(config.banks_dir, "rope_lut.bin");
    }
    if (config.tokenizer.empty()) {
        config.tokenizer = join_path(config.banks_dir, "tokenizer.bin");
    }
    return config;
}

template <typename Uuid>
xrt::kernel open_kernel(xrt::device& device, const Uuid& uuid,
                        const std::string& kernel_name,
                        const std::string& instance_name) {
    const std::array<std::string, 2> candidates = {
        kernel_name + ":{" + instance_name + "}", kernel_name};
    std::string last_error;
    for (const auto& candidate : candidates) {
        try {
            return xrt::kernel(device, uuid, candidate);
        } catch (const std::exception& error) {
            last_error = error.what();
        }
    }
    throw std::runtime_error("cannot open kernel " + kernel_name +
                             ": " + last_error);
}

void zero_bo(xrt::bo& bo, std::size_t bytes, int pe, bool verbose) {
    if (verbose) {
        std::cout << "[Init] Clearing PE" << pe << " KV cache ("
                  << bytes / (1024 * 1024) << " MiB) ..." << std::endl;
    }
    const auto begin = Clock::now();
    std::memset(bo.map<std::uint8_t*>(), 0, bytes);
    bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, bytes, 0);
    const auto end = Clock::now();
    if (verbose) {
        std::cout << "[Init] Cleared PE" << pe << " KV cache in "
                  << std::fixed << std::setprecision(1)
                  << elapsed_ms(begin, end) << " ms" << std::endl;
    }
}

#ifdef HAS_XRT_IP
template <typename Uuid>
void dump_pe_registers(xrt::device& device, const Uuid& uuid) {
    std::cerr << "\n========== [HARDWARE DIAGNOSTIC - REGISTER DUMP] ==========\n";
    const std::array<const char*, NUM_PES> pe_kernel_names = {
        "int4_decoder_pe0_kernel",
        "int4_decoder_pe1_kernel",
        "int4_decoder_pe2_kernel",
        "int4_decoder_pe3_kernel"
    };
    const std::array<const char*, NUM_PES> pe_inst_names = {"pe0", "pe1", "pe2", "pe3"};

    for (int i = 0; i < NUM_PES; ++i) {
        const std::array<std::string, 4> candidates = {
            std::string(pe_inst_names[i]),
            std::string(pe_kernel_names[i]) + ":{" + pe_inst_names[i] + "}",
            std::string(pe_kernel_names[i]) + "_1",
            std::string(pe_kernel_names[i])
        };
        bool opened = false;
        std::string last_err;
        for (const auto& candidate : candidates) {
            try {
                xrt::ip ip(device, uuid, candidate);
                opened = true;
                const uint32_t ap_ctrl = ip.read_register(0x00);
                const uint32_t pos_reg = ip.read_register(0x10);

                const bool ap_start = (ap_ctrl >> 0) & 1;
                const bool ap_done  = (ap_ctrl >> 1) & 1;
                const bool ap_idle  = (ap_ctrl >> 2) & 1;
                const bool ap_ready = (ap_ctrl >> 3) & 1;

                std::cerr << "  [" << pe_inst_names[i] << "] (IP: " << candidate << ") AP_CTRL: 0x"
                          << std::hex << std::setw(2) << std::setfill('0') << ap_ctrl << std::dec
                          << " (start=" << ap_start
                          << ", done=" << ap_done
                          << ", idle=" << ap_idle
                          << ", ready=" << ap_ready << ")"
                          << " | pos_arg_reg=0x" << std::hex << pos_reg << std::dec << "\n";
                break;
            } catch (const std::exception& e) {
                last_err = e.what();
            }
        }
        if (!opened) {
            std::cerr << "  [" << pe_inst_names[i] << "] Cannot open IP to read registers: " << last_err << "\n";
        }
    }
    std::cerr << "===========================================================\n" << std::endl;
}
#endif

struct TokenRunResult {
    int next_token = 0;
    double step_ms = 0.0;
};

}  // namespace

int main(int argc, char** argv) {
    try {
        const Config config = parse_args(argc, argv);

        if (config.tokenize_only) {
            Tokenizer tokenizer;
            tokenizer.load(config.tokenizer);
            const std::vector<int> tokens =
                tokenizer.encode(config.prompt, true, false);
            std::cout << "[Prompt] \"" << escape_text(config.prompt) << "\""
                      << std::endl;
            std::cout << "[Token count] " << tokens.size() << std::endl;
            print_tokens("[Tokens]", tokens);
            return 0;
        }

        if (!config.dump_logits_dir.empty()) {
            prepare_dump_directory(config.dump_logits_dir, "logits");
            std::cout << "[Init] Logits dumps: "
                      << std::filesystem::absolute(config.dump_logits_dir)
                      << " (32256 FP32 values per step)" << std::endl;
        }
        if (!config.dump_residuals_dir.empty()) {
            prepare_dump_directory(config.dump_residuals_dir, "residual");
            std::cout << "[Init] Residual dumps: "
                      << std::filesystem::absolute(config.dump_residuals_dir)
                      << " (4096 FP32 values per step)" << std::endl;
        }

        std::string effective_device_id = config.device_id;
        const char* emu_env = std::getenv("XCL_EMULATION_MODE");
        if (emu_env && (std::strcmp(emu_env, "hw_emu") == 0 || std::strcmp(emu_env, "sw_emu") == 0)) {
            if (effective_device_id.find(':') != std::string::npos) {
                if (config.verbose) {
                    std::cout << "[Init] Emulation mode (" << emu_env
                              << ") detected: overriding physical BDF "
                              << effective_device_id
                              << " with device index 0" << std::endl;
                }
                effective_device_id = "0";
            }
        }

        if (config.verbose) {
            std::cout << "[Init] Opening device " << effective_device_id
                      << " ..." << std::endl;
        }
        xrt::device device =
            effective_device_id.find(':') != std::string::npos
                ? xrt::device(effective_device_id)
                : xrt::device(parse_device_index(effective_device_id));

        if (config.verbose) {
            std::cout << "[Init] Loading " << config.xclbin << " ..."
                      << std::endl;
        }
        const auto uuid = device.load_xclbin(config.xclbin);
        if (config.verbose) {
            std::cout << "[Init] xclbin loaded OK." << std::endl;
        }
        if (config.pause_after_load) {
            std::cout
                << "[ILA] XCLBIN loaded. Refresh Vivado Hardware Manager, "
                   "arm both ILAs, then press ENTER to continue..."
                << std::flush;
            std::string ignored;
            std::getline(std::cin, ignored);
        }

        auto kernel0 = open_kernel(device, uuid,
            "int4_decoder_pe0_kernel", "pe0");
        auto kernel1 = open_kernel(device, uuid,
            "int4_decoder_pe1_kernel", "pe1");
        auto kernel2 = open_kernel(device, uuid,
            "int4_decoder_pe2_kernel", "pe2");
        auto kernel3 = open_kernel(device, uuid,
            "int4_decoder_pe3_kernel", "pe3");

        const auto bank_path = [&](int pe) {
            return join_path(config.banks_dir,
                             "model_bank" + std::to_string(pe) + ".bin");
        };

        const std::string probe_bank0 = bank_path(0);
        const std::size_t detected_model_bytes = file_size(probe_bank0);
        if (detected_model_bytes != MODEL_BANK_BYTES_LEGACY &&
            detected_model_bytes != MODEL_BANK_BYTES_DENSE) {
            std::ostringstream message;
            message << "Unexpected model bank size for " << probe_bank0
                    << ": got " << detected_model_bytes
                    << " bytes; expected " << MODEL_BANK_BYTES_LEGACY
                    << " (891 MiB legacy) or " << MODEL_BANK_BYTES_DENSE
                    << " (865 MiB dense)";
            throw std::runtime_error(message.str());
        }

        if (config.verbose) {
            std::cout << "[Init] Allocating DDR buffers ("
                      << (detected_model_bytes == MODEL_BANK_BYTES_LEGACY
                              ? "891 MiB legacy"
                              : "865 MiB dense")
                      << " model banks) ..." << std::endl;
        }
        xrt::bo model0(device, detected_model_bytes, kernel0.group_id(1));
        xrt::bo model1(device, detected_model_bytes, kernel1.group_id(1));
        xrt::bo model2(device, detected_model_bytes, kernel2.group_id(1));
        xrt::bo model3(device, detected_model_bytes, kernel3.group_id(1));

        xrt::bo rope0(device, ROPE_LUT_BYTES, kernel0.group_id(2));
        xrt::bo rope1(device, ROPE_LUT_BYTES, kernel1.group_id(2));
        xrt::bo rope2(device, ROPE_LUT_BYTES, kernel2.group_id(2));
        xrt::bo rope3(device, ROPE_LUT_BYTES, kernel3.group_id(2));

        xrt::bo residual0(device, RESIDUAL_BYTES, kernel0.group_id(3));
        xrt::bo residual1(device, RESIDUAL_BYTES, kernel1.group_id(3));
        xrt::bo residual2(device, RESIDUAL_BYTES, kernel2.group_id(3));
        xrt::bo residual3(device, RESIDUAL_BYTES, kernel3.group_id(3));

        xrt::bo logits0(device, LOGIT_BYTES, kernel0.group_id(4));
        xrt::bo logits1(device, LOGIT_BYTES, kernel1.group_id(4));
        xrt::bo logits2(device, LOGIT_BYTES, kernel2.group_id(4));
        xrt::bo logits3(device, LOGIT_BYTES, kernel3.group_id(4));

        xrt::bo kv0(device, KV_BYTES, kernel0.group_id(5));
        xrt::bo kv1(device, KV_BYTES, kernel1.group_id(5));
        xrt::bo kv2(device, KV_BYTES, kernel2.group_id(5));
        xrt::bo kv3(device, KV_BYTES, kernel3.group_id(5));

        load_bo_from_file(model0, bank_path(0), detected_model_bytes,
                          config.verbose);
        load_bo_from_file(model1, bank_path(1), detected_model_bytes,
                          config.verbose);
        load_bo_from_file(model2, bank_path(2), detected_model_bytes,
                          config.verbose);
        load_bo_from_file(model3, bank_path(3), detected_model_bytes,
                          config.verbose);

        if (config.verify_device_model) {
            if (detected_model_bytes != MODEL_BANK_BYTES_DENSE) {
                throw std::runtime_error(
                    "--verify-device-model requires dense 865071104-byte banks");
            }
            verify_o_projection_device_region(model0, bank_path(0), 0);
            verify_o_projection_device_region(model1, bank_path(1), 1);
            verify_o_projection_device_region(model2, bank_path(2), 2);
            verify_o_projection_device_region(model3, bank_path(3), 3);
            std::cout << "PASS DEVICE_MODEL_READBACK" << std::endl;
        }

        load_bo_from_file(rope0, config.rope_lut, ROPE_LUT_BYTES,
                          config.verbose);
        load_bo_from_file(rope1, config.rope_lut, ROPE_LUT_BYTES,
                          config.verbose);
        load_bo_from_file(rope2, config.rope_lut, ROPE_LUT_BYTES,
                          config.verbose);
        load_bo_from_file(rope3, config.rope_lut, ROPE_LUT_BYTES,
                          config.verbose);

        zero_bo(kv0, KV_BYTES, 0, config.verbose);
        zero_bo(kv1, KV_BYTES, 1, config.verbose);
        zero_bo(kv2, KV_BYTES, 2, config.verbose);
        zero_bo(kv3, KV_BYTES, 3, config.verbose);

        std::vector<float> embeddings =
            load_embeddings(config.embeddings, config.verbose);
        Tokenizer tokenizer;
        if (config.verbose) {
            std::cout << "[Init] Loading tokenizer " << config.tokenizer
                      << " ..." << std::endl;
        }
        tokenizer.load(config.tokenizer);
        if (config.verbose) {
            std::cout << "[Init] Tokenizer loaded (" << VOCAB_SIZE
                      << " entries)." << std::endl;
        }

        const std::vector<int> prompt_tokens =
            tokenizer.encode(config.prompt, true, false);
        if (prompt_tokens.empty()) {
            throw std::runtime_error("prompt produced no tokens");
        }
        if (prompt_tokens.size() > std::size_t(MAX_SEQ_LEN)) {
            throw std::runtime_error("encoded prompt exceeds MAX_SEQ_LEN");
        }

        if (config.verbose) {
            std::cout << "[Prompt] \"" << escape_text(config.prompt)
                      << "\"" << std::endl;
            print_tokens("[Tokens]", prompt_tokens);
        }

        auto* residual_map0 = residual0.map<float*>();
        auto* residual_map1 = residual1.map<float*>();
        auto* residual_map2 = residual2.map<float*>();
        auto* residual_map3 = residual3.map<float*>();
        auto* logits_map0 = logits0.map<float*>();
        auto* logits_map1 = logits1.map<float*>();
        auto* logits_map2 = logits2.map<float*>();
        auto* logits_map3 = logits3.map<float*>();
        std::vector<float> combined_logits(PADDED_VOCAB_SIZE, 0.0f);
        std::vector<float> combined_residual(DIM, 0.0f);
        std::vector<int> token_history = prompt_tokens;
        token_history.reserve(
            prompt_tokens.size() + static_cast<std::size_t>(config.max_tokens));
        Sampler sampler(config.temperature, config.top_p,
                        config.repeat_penalty, config.seed);

        auto run_one_token = [&](int position, int token_id,
                                 bool select_next_token) {
            if (position < 0 || position >= MAX_SEQ_LEN) {
                throw std::runtime_error("position out of range: " +
                                         std::to_string(position));
            }
            if (token_id < 0 || token_id >= VOCAB_SIZE) {
                throw std::runtime_error("token id out of range: " +
                                         std::to_string(token_id));
            }

            const auto begin = Clock::now();
            const float* embedding = embeddings.data() +
                std::size_t(token_id) * DIM;
            pack_residual(embedding, residual_map0, residual_map1,
                          residual_map2, residual_map3);
            const auto t_pack = Clock::now();

            // Fire all 4 PCIe DMA writes in parallel (different DDR banks).
            {
                auto s0 = std::async(std::launch::async, [&]{
                    residual0.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0); });
                auto s1 = std::async(std::launch::async, [&]{
                    residual1.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0); });
                auto s2 = std::async(std::launch::async, [&]{
                    residual2.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0); });
                auto s3 = std::async(std::launch::async, [&]{
                    residual3.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0); });
                s0.get(); s1.get(); s2.get(); s3.get();
            }
            const auto t_res_sync = Clock::now();

            if (config.verbose) {
                std::cout << "[Run] pos=" << position
                          << " token=" << token_id
                          << " submit PE1,PE2,PE0,PE3" << std::endl;
            }

            auto run1 = kernel1(
                static_cast<std::uint32_t>(position), model1, rope1,
                residual1, logits1, kv1);
            if (config.verbose) {
                std::cout << "[Run] PE1 submitted state="
                          << static_cast<int>(run1.state()) << std::endl;
            }
            auto run2 = kernel2(
                static_cast<std::uint32_t>(position), model2, rope2,
                residual2, logits2, kv2);
            if (config.verbose) {
                std::cout << "[Run] PE2 submitted state="
                          << static_cast<int>(run2.state()) << std::endl;
            }
            auto run0 = kernel0(
                static_cast<std::uint32_t>(position), model0, rope0,
                residual0, logits0, kv0);
            if (config.verbose) {
                std::cout << "[Run] PE0 submitted state="
                          << static_cast<int>(run0.state()) << std::endl;
            }
            auto run3 = kernel3(
                static_cast<std::uint32_t>(position), model3, rope3,
                residual3, logits3, kv3);
            if (config.verbose) {
                std::cout << "[Run] PE3 submitted state="
                          << static_cast<int>(run3.state())
                          << "; waiting for completion" << std::endl;
            }

            const auto t_submit = Clock::now();
            const auto wait_start = Clock::now();
            bool pe_done[NUM_PES] = {false, false, false, false};
            xrt::run* pe_runs[NUM_PES] = {&run0, &run1, &run2, &run3};
            const char* pe_names[NUM_PES] = {"PE0", "PE1", "PE2", "PE3"};
            int completed_pes = 0;

            while (completed_pes < NUM_PES) {
                for (int i = 0; i < NUM_PES; ++i) {
                    if (!pe_done[i]) {
                        const auto state = pe_runs[i]->wait(std::chrono::milliseconds(20));
                        if (state == ERT_CMD_STATE_COMPLETED) {
                            pe_done[i] = true;
                            completed_pes++;
                            if (config.verbose) {
                                std::cout << "[Run] " << pe_names[i]
                                          << " completed in " << std::fixed
                                          << std::setprecision(2)
                                          << elapsed_ms(wait_start,
                                                        Clock::now())
                                          << " ms" << std::endl;
                            }
                        }
                    }
                }
                if (elapsed_ms(wait_start, Clock::now()) > RUN_TIMEOUT_MS) {
#ifdef HAS_XRT_IP
                    dump_pe_registers(device, uuid);
#endif
                    std::ostringstream message;
                    message << "Hardware timeout after " << RUN_TIMEOUT_MS
                            << " ms; PE states: "
                            << "PE0=" << (pe_done[0] ? "DONE" : std::to_string(static_cast<int>(run0.state()))) << ' '
                            << "PE1=" << (pe_done[1] ? "DONE" : std::to_string(static_cast<int>(run1.state()))) << ' '
                            << "PE2=" << (pe_done[2] ? "DONE" : std::to_string(static_cast<int>(run2.state()))) << ' '
                            << "PE3=" << (pe_done[3] ? "DONE" : std::to_string(static_cast<int>(run3.state())));

                    // Do not let live run handles reach their destructors.  XRT
                    // otherwise tries to close each CU context while the other
                    // stream-connected CUs are still running, which can turn
                    // the original timeout into four slow "CU hangs" teardown
                    // failures and may leave the card requiring a reset.
                    for (int i = 0; i < NUM_PES; ++i) {
                        if (pe_done[i]) {
                            continue;
                        }
                        try {
                            const auto abort_state = pe_runs[i]->abort();
                            std::cerr << "[Run] " << pe_names[i]
                                      << " abort state="
                                      << static_cast<int>(abort_state)
                                      << std::endl;
                        } catch (const std::exception& error) {
                            std::cerr << "[Run] " << pe_names[i]
                                      << " abort failed: " << error.what()
                                      << std::endl;
                        }
                    }
                    throw std::runtime_error(message.str());
                }
            }
            const auto t_kernel_done = Clock::now();
            if (config.verbose) {
                std::cout << "[Run] All 4 PEs completed; reading logits"
                          << std::endl;
            }

            if (!config.dump_residuals_dir.empty()) {
                // The next token overwrites these BOs with its embedding, so
                // capture all four final decoder-output shards immediately.
                residual0.sync(XCL_BO_SYNC_BO_FROM_DEVICE,
                               RESIDUAL_BYTES, 0);
                residual1.sync(XCL_BO_SYNC_BO_FROM_DEVICE,
                               RESIDUAL_BYTES, 0);
                residual2.sync(XCL_BO_SYNC_BO_FROM_DEVICE,
                               RESIDUAL_BYTES, 0);
                residual3.sync(XCL_BO_SYNC_BO_FROM_DEVICE,
                               RESIDUAL_BYTES, 0);
                unpack_residual(residual_map0, residual_map1,
                                residual_map2, residual_map3,
                                combined_residual.data());
                print_residual_diagnostics(combined_residual.data(),
                                           position);
                const std::string dump_path = dump_residuals(
                    config.dump_residuals_dir, position, token_id,
                    combined_residual.data());
                std::cout << "[Residual] dumped=" << dump_path
                          << " bytes="
                          << std::size_t(DIM) * sizeof(float)
                          << std::endl;
            }

            // Fire all 4 PCIe DMA reads in parallel.
            {
                auto l0 = std::async(std::launch::async, [&]{
                    logits0.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0); });
                auto l1 = std::async(std::launch::async, [&]{
                    logits1.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0); });
                auto l2 = std::async(std::launch::async, [&]{
                    logits2.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0); });
                auto l3 = std::async(std::launch::async, [&]{
                    logits3.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0); });
                l0.get(); l1.get(); l2.get(); l3.get();
            }
            if (config.verbose) {
                std::cout << "[Run] All PE logits synced (parallel)" << std::endl;
            }
            const auto t_logit_sync = Clock::now();
            unpack_logits(logits_map0, logits_map1, logits_map2, logits_map3,
                          combined_logits.data());

            if (config.top_k > 0 || !config.dump_logits_dir.empty()) {
                print_logit_diagnostics(combined_logits.data(), config.top_k,
                                        position, tokenizer);
            }
            if (!config.dump_logits_dir.empty()) {
                const std::string dump_path = dump_logits(
                    config.dump_logits_dir, position, token_id,
                    combined_logits.data());
                std::cout << "[Logits] dumped=" << dump_path
                          << " bytes="
                          << std::size_t(PADDED_VOCAB_SIZE) * sizeof(float)
                          << std::endl;
            }

            TokenRunResult result;
            result.next_token = select_next_token
                ? sampler.select(combined_logits.data(), token_history)
                : -1;
            const auto t_end = Clock::now();
            result.step_ms = elapsed_ms(begin, t_end);
            if (config.verbose) {
                std::cout << "[Run] pos=" << position << " done in "
                          << std::fixed << std::setprecision(3)
                          << result.step_ms << " ms"
                          << "  [pack=" << elapsed_ms(begin, t_pack)
                          << " res_sync=" << elapsed_ms(t_pack, t_res_sync)
                          << " submit=" << elapsed_ms(t_res_sync, t_submit)
                          << " kernel=" << elapsed_ms(wait_start, t_kernel_done)
                          << " logit_sync=" << elapsed_ms(t_kernel_done, t_logit_sync)
                          << " sample=" << elapsed_ms(t_logit_sync, t_end)
                          << " ms]";
                if (select_next_token) {
                    std::cout << ", next=" << result.next_token;
                }
                std::cout << std::endl;
            }
            return result;
        };

        if (config.verbose) {
            std::cout << "[Sampling] temperature=" << std::fixed
                      << std::setprecision(3) << config.temperature
                      << " top_p=" << config.top_p
                      << " repeat_penalty=" << config.repeat_penalty
                      << " seed=" << config.seed << std::endl;
            std::cout << "[Prefill] Processing " << prompt_tokens.size()
                      << " tokens ..." << std::endl;
        }
        double prefill_ms = 0.0;
        double total_inference_ms = 0.0;
        TokenRunResult token_result;
        for (std::size_t position = 0;
             position < prompt_tokens.size(); ++position) {
            token_result = run_one_token(static_cast<int>(position),
                                         prompt_tokens[position],
                                         position + 1 ==
                                             prompt_tokens.size());
            total_inference_ms += token_result.step_ms;
            if (position + 1 < prompt_tokens.size()) {
                prefill_ms += token_result.step_ms;
            }
        }

        std::vector<int> generated_tokens;
        generated_tokens.reserve(static_cast<std::size_t>(config.max_tokens));
        std::string generated_text;
        int position = static_cast<int>(prompt_tokens.size());
        int previous_token = prompt_tokens.back();

        if (config.verbose) {
            std::cout << "[Generate] ";
        }
        std::cout << config.prompt;
        std::cout.flush();
        while (static_cast<int>(generated_tokens.size()) < config.max_tokens) {
            const int next_token = token_result.next_token;
            if (next_token == 1 || next_token == 2) {
                break;
            }

            const std::string piece =
                tokenizer.decode_piece(previous_token, next_token);
            generated_tokens.push_back(next_token);
            token_history.push_back(next_token);
            generated_text += piece;
            std::cout << piece;
            std::cout.flush();

            if (static_cast<int>(generated_tokens.size()) >=
                    config.max_tokens ||
                position >= MAX_SEQ_LEN) {
                break;
            }

            token_result = run_one_token(position, next_token, true);
            total_inference_ms += token_result.step_ms;
            previous_token = next_token;
            ++position;
        }
        std::cout << std::endl;

        if (config.verbose) {
            print_tokens("[Generated tokens]", generated_tokens);
        }
        const int generated_count =
            static_cast<int>(generated_tokens.size());
        if (config.verbose) {
            std::cout << "[Stats] prompt_eval_ms=" << std::fixed
                      << std::setprecision(3) << prefill_ms
                      << " total_inference_ms=" << total_inference_ms;
            if (generated_count > 0 && total_inference_ms > 0.0) {
                std::cout << " generated=" << generated_count
                          << " effective_tok/s="
                          << (1000.0 * generated_count /
                              total_inference_ms);
            }
            std::cout << std::endl;
        }
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "ERROR: " << error.what() << std::endl;
        return 1;
    }
}
