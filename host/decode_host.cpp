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
#include <fstream>
#include <iomanip>
#include <iostream>
#include <limits>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#ifndef __has_include
#define __has_include(x) 0
#endif

#if __has_include(<xrt/xrt_bo.h>)
#include <xrt/xrt_bo.h>
#include <xrt/xrt_device.h>
#include <xrt/xrt_kernel.h>
#elif __has_include(<experimental/xrt_bo.h>)
#include <experimental/xrt_bo.h>
#include <experimental/xrt_device.h>
#include <experimental/xrt_kernel.h>
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

constexpr std::size_t MODEL_BANK_WORDS = 13926208ULL;
constexpr std::size_t MODEL_BANK_BYTES = MODEL_BANK_WORDS * DDR_WORD_BYTES;
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

static_assert(MODEL_BANK_BYTES == 891277312ULL,
              "model bank size must match int4_model_layout.hpp");
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
                       std::size_t bytes) {
    std::cout << "[Init] Reading " << path << " ("
              << bytes / (1024 * 1024) << " MiB) ..." << std::endl;
    const auto read_begin = Clock::now();
    auto* mapped = bo.map<std::uint8_t*>();
    read_exact_file(path, mapped, bytes);
    const auto read_end = Clock::now();

    std::cout << "[Init] Syncing " << path << " to device ..." << std::endl;
    bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, bytes, 0);
    const auto sync_end = Clock::now();

    std::cout << "[Init] Loaded " << path
              << " (read=" << std::fixed << std::setprecision(1)
              << elapsed_ms(read_begin, read_end) << " ms, sync="
              << elapsed_ms(read_end, sync_end) << " ms)" << std::endl;
}

std::vector<float> load_embeddings(const std::string& path) {
    std::cout << "[Init] Reading " << path << " ("
              << EMBEDDING_BYTES / (1024 * 1024) << " MiB) ..." << std::endl;
    const auto begin = Clock::now();
    std::vector<float> embeddings(std::size_t(VOCAB_SIZE) * DIM);
    read_exact_file(path, embeddings.data(), EMBEDDING_BYTES);
    const auto end = Clock::now();
    std::cout << "[Init] Loaded " << VOCAB_SIZE << " x " << DIM
              << " embedding table in " << std::fixed << std::setprecision(1)
              << elapsed_ms(begin, end) << " ms" << std::endl;
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

void unpack_logits(const float* shard0, const float* shard1,
                   const float* shard2, const float* shard3,
                   float* logits) {
    constexpr int LOCAL_VOCAB = PADDED_VOCAB_SIZE / NUM_PES;
    const std::array<const float*, NUM_PES> shards = {
        shard0, shard1, shard2, shard3};
    for (int pe = 0; pe < NUM_PES; ++pe) {
        const int begin = pe * LOCAL_VOCAB;
        const int count = std::min(LOCAL_VOCAB, VOCAB_SIZE - begin);
        if (count > 0) {
            std::memcpy(logits + begin, shards[pe],
                        std::size_t(count) * sizeof(float));
        }
    }
}

int argmax_logits(const float* logits) {
    int best = 0;
    for (int i = 1; i < VOCAB_SIZE; ++i) {
        if (logits[i] > logits[best]) {
            best = i;
        }
    }
    return best;
}

struct Config {
    std::string xclbin = "int4_decoder_multikernel_300mhz.xclbin";
    std::string banks_dir = ".";
    std::string rope_lut = "rope_lut.bin";
    std::string tokenizer = "tokenizer.bin";
    std::string embeddings;
    std::string prompt = "Once upon a time";
    std::string device_id = "0000:13:00.0";
    int max_tokens = 256;
    bool tokenize_only = false;
};

void print_usage(const char* program) {
    std::cout
        << "Usage: " << program << " [options]\n"
        << "  --xclbin PATH       decoder xclbin\n"
        << "  --banks DIR         directory containing model_bank0..3.bin\n"
        << "  --rope PATH         rope_lut.bin\n"
        << "  --tokenizer PATH    llama2.c tokenizer.bin\n"
        << "  --embeddings PATH   embeddings.bin (default: BANKS/embeddings.bin)\n"
        << "  --prompt TEXT       prompt text\n"
        << "  --max-tokens N      maximum number of new tokens\n"
        << "  --device ID         BDF or numeric XRT device index\n"
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
        else if (argument == "--max-tokens") {
            config.max_tokens = parse_positive_int(next(), "--max-tokens");
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

void zero_bo(xrt::bo& bo, std::size_t bytes, int pe) {
    std::cout << "[Init] Clearing PE" << pe << " KV cache ("
              << bytes / (1024 * 1024) << " MiB) ..." << std::endl;
    const auto begin = Clock::now();
    std::memset(bo.map<std::uint8_t*>(), 0, bytes);
    bo.sync(XCL_BO_SYNC_BO_TO_DEVICE, bytes, 0);
    const auto end = Clock::now();
    std::cout << "[Init] Cleared PE" << pe << " KV cache in "
              << std::fixed << std::setprecision(1)
              << elapsed_ms(begin, end) << " ms" << std::endl;
}

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

        std::cout << "[Init] Opening device " << config.device_id << " ..."
                  << std::endl;
        xrt::device device =
            config.device_id.find(':') != std::string::npos
                ? xrt::device(config.device_id)
                : xrt::device(parse_device_index(config.device_id));

        std::cout << "[Init] Loading " << config.xclbin << " ..."
                  << std::endl;
        const auto uuid = device.load_xclbin(config.xclbin);
        std::cout << "[Init] xclbin loaded OK." << std::endl;

        auto kernel0 = open_kernel(device, uuid,
            "int4_decoder_pe0_kernel", "pe0");
        auto kernel1 = open_kernel(device, uuid,
            "int4_decoder_pe1_kernel", "pe1");
        auto kernel2 = open_kernel(device, uuid,
            "int4_decoder_pe2_kernel", "pe2");
        auto kernel3 = open_kernel(device, uuid,
            "int4_decoder_pe3_kernel", "pe3");

        std::cout << "[Init] Allocating DDR buffers ..." << std::endl;
        xrt::bo model0(device, MODEL_BANK_BYTES, kernel0.group_id(1));
        xrt::bo model1(device, MODEL_BANK_BYTES, kernel1.group_id(1));
        xrt::bo model2(device, MODEL_BANK_BYTES, kernel2.group_id(1));
        xrt::bo model3(device, MODEL_BANK_BYTES, kernel3.group_id(1));

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

        const auto bank_path = [&](int pe) {
            return join_path(config.banks_dir,
                             "model_bank" + std::to_string(pe) + ".bin");
        };

        load_bo_from_file(model0, bank_path(0), MODEL_BANK_BYTES);
        load_bo_from_file(model1, bank_path(1), MODEL_BANK_BYTES);
        load_bo_from_file(model2, bank_path(2), MODEL_BANK_BYTES);
        load_bo_from_file(model3, bank_path(3), MODEL_BANK_BYTES);

        load_bo_from_file(rope0, config.rope_lut, ROPE_LUT_BYTES);
        load_bo_from_file(rope1, config.rope_lut, ROPE_LUT_BYTES);
        load_bo_from_file(rope2, config.rope_lut, ROPE_LUT_BYTES);
        load_bo_from_file(rope3, config.rope_lut, ROPE_LUT_BYTES);

        zero_bo(kv0, KV_BYTES, 0);
        zero_bo(kv1, KV_BYTES, 1);
        zero_bo(kv2, KV_BYTES, 2);
        zero_bo(kv3, KV_BYTES, 3);

        std::vector<float> embeddings = load_embeddings(config.embeddings);
        Tokenizer tokenizer;
        std::cout << "[Init] Loading tokenizer " << config.tokenizer << " ..."
                  << std::endl;
        tokenizer.load(config.tokenizer);
        std::cout << "[Init] Tokenizer loaded (" << VOCAB_SIZE
                  << " entries)." << std::endl;

        const std::vector<int> prompt_tokens =
            tokenizer.encode(config.prompt, true, false);
        if (prompt_tokens.empty()) {
            throw std::runtime_error("prompt produced no tokens");
        }
        if (prompt_tokens.size() > std::size_t(MAX_SEQ_LEN)) {
            throw std::runtime_error("encoded prompt exceeds MAX_SEQ_LEN");
        }

        std::cout << "[Prompt] \"" << escape_text(config.prompt) << "\""
                  << std::endl;
        print_tokens("[Tokens]", prompt_tokens);

        auto* residual_map0 = residual0.map<float*>();
        auto* residual_map1 = residual1.map<float*>();
        auto* residual_map2 = residual2.map<float*>();
        auto* residual_map3 = residual3.map<float*>();
        auto* logits_map0 = logits0.map<float*>();
        auto* logits_map1 = logits1.map<float*>();
        auto* logits_map2 = logits2.map<float*>();
        auto* logits_map3 = logits3.map<float*>();
        std::vector<float> combined_logits(VOCAB_SIZE, 0.0f);

        auto run_one_token = [&](int position, int token_id) {
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
            residual0.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0);
            residual1.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0);
            residual2.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0);
            residual3.sync(XCL_BO_SYNC_BO_TO_DEVICE, RESIDUAL_BYTES, 0);

            xrt::run run0(kernel0);
            xrt::run run1(kernel1);
            xrt::run run2(kernel2);
            xrt::run run3(kernel3);

            run0.set_arg(0, static_cast<std::uint32_t>(position));
            run0.set_arg(1, model0);
            run0.set_arg(2, rope0);
            run0.set_arg(3, residual0);
            run0.set_arg(4, logits0);
            run0.set_arg(5, kv0);

            run1.set_arg(0, static_cast<std::uint32_t>(position));
            run1.set_arg(1, model1);
            run1.set_arg(2, rope1);
            run1.set_arg(3, residual1);
            run1.set_arg(4, logits1);
            run1.set_arg(5, kv1);

            run2.set_arg(0, static_cast<std::uint32_t>(position));
            run2.set_arg(1, model2);
            run2.set_arg(2, rope2);
            run2.set_arg(3, residual2);
            run2.set_arg(4, logits2);
            run2.set_arg(5, kv2);

            run3.set_arg(0, static_cast<std::uint32_t>(position));
            run3.set_arg(1, model3);
            run3.set_arg(2, rope3);
            run3.set_arg(3, residual3);
            run3.set_arg(4, logits3);
            run3.set_arg(5, kv3);

            std::cout << "[Run] pos=" << position << " token=" << token_id
                      << " start PE1,PE2,PE0,PE3" << std::endl;
            run1.start();
            std::cout << "[Run] PE1 started" << std::endl;
            run2.start();
            std::cout << "[Run] PE2 started" << std::endl;
            run0.start();
            std::cout << "[Run] PE0 started" << std::endl;
            run3.start();
            std::cout << "[Run] PE3 started; waiting for completion"
                      << std::endl;

            auto wait_for_run = [&](xrt::run& run, const char* name) {
                const auto state = run.wait(RUN_TIMEOUT_MS);
                std::cout << "[Run] " << name << " wait state="
                          << static_cast<int>(state) << std::endl;
                if (state != ERT_CMD_STATE_COMPLETED) {
                    std::ostringstream message;
                    message << name << " did not complete within "
                            << RUN_TIMEOUT_MS << " ms; command states: "
                            << "PE0=" << static_cast<int>(run0.state()) << ' '
                            << "PE1=" << static_cast<int>(run1.state()) << ' '
                            << "PE2=" << static_cast<int>(run2.state()) << ' '
                            << "PE3=" << static_cast<int>(run3.state());
                    throw std::runtime_error(message.str());
                }
            };

            wait_for_run(run1, "PE1");
            wait_for_run(run2, "PE2");
            wait_for_run(run0, "PE0");
            wait_for_run(run3, "PE3");
            std::cout << "[Run] PE3 completed; reading logits" << std::endl;

            logits0.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0);
            std::cout << "[Run] PE0 logits synced" << std::endl;
            logits1.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0);
            std::cout << "[Run] PE1 logits synced" << std::endl;
            logits2.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0);
            std::cout << "[Run] PE2 logits synced" << std::endl;
            logits3.sync(XCL_BO_SYNC_BO_FROM_DEVICE, LOGIT_BYTES, 0);
            std::cout << "[Run] PE3 logits synced" << std::endl;
            unpack_logits(logits_map0, logits_map1, logits_map2, logits_map3,
                          combined_logits.data());

            TokenRunResult result;
            result.next_token = argmax_logits(combined_logits.data());
            result.step_ms = elapsed_ms(begin, Clock::now());
            std::cout << "[Run] pos=" << position << " done in "
                      << std::fixed << std::setprecision(3)
                      << result.step_ms << " ms, next="
                      << result.next_token << std::endl;
            return result;
        };

        std::cout << "[Prefill] Processing " << prompt_tokens.size()
                  << " tokens ..." << std::endl;
        double prefill_ms = 0.0;
        double total_inference_ms = 0.0;
        TokenRunResult token_result;
        for (std::size_t position = 0;
             position < prompt_tokens.size(); ++position) {
            token_result = run_one_token(static_cast<int>(position),
                                         prompt_tokens[position]);
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

        std::cout << "[Generate] " << config.prompt;
        std::cout.flush();
        while (static_cast<int>(generated_tokens.size()) < config.max_tokens) {
            const int next_token = token_result.next_token;
            if (next_token == 1 || next_token == 2) {
                break;
            }

            const std::string piece =
                tokenizer.decode_piece(previous_token, next_token);
            generated_tokens.push_back(next_token);
            generated_text += piece;
            std::cout << piece;
            std::cout.flush();

            if (static_cast<int>(generated_tokens.size()) >=
                    config.max_tokens ||
                position >= MAX_SEQ_LEN) {
                break;
            }

            token_result = run_one_token(position, next_token);
            total_inference_ms += token_result.step_ms;
            previous_token = next_token;
            ++position;
        }
        std::cout << std::endl;

        print_tokens("[Generated tokens]", generated_tokens);
        const int generated_count =
            static_cast<int>(generated_tokens.size());
        std::cout << "[Stats] prompt_eval_ms=" << std::fixed
                  << std::setprecision(3) << prefill_ms
                  << " total_inference_ms=" << total_inference_ms;
        if (generated_count > 0 && total_inference_ms > 0.0) {
            std::cout << " generated=" << generated_count
                      << " effective_tok/s="
                      << (1000.0 * generated_count / total_inference_ms);
        }
        std::cout << std::endl;
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "ERROR: " << error.what() << std::endl;
        return 1;
    }
}
