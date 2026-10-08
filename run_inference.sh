#!/usr/bin/env bash

# Run one FPGA inference from an xclbin.  The script can be configured once in
# run_inference.env, or through HOST_BIN, DATA_DIR and DEVICE environment
# variables.

set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
CONFIG_FILE="${RUN_INFERENCE_CONFIG:-${SCRIPT_DIR}/run_inference.env}"

if [[ -f "${CONFIG_FILE}" ]]; then
  # shellcheck source=/dev/null
  source "${CONFIG_FILE}"
fi

usage() {
  cat <<'EOF'
Usage:
  ./run_inference.sh XCLBIN [PROMPT] [options] [-- extra-host-options]

Options:
  -i, --prompt TEXT       Input prompt text (default: Hello; -p also accepted)
  -n, --max-tokens N      Number of tokens to generate (default: 32)
      --time             Print per-token timing and detailed host diagnostics
  -d, --device DEVICE     XRT device BDF (default: 0000:13:00.0)
      --host-bin PATH     Path to the host executable
      --data-dir DIR      Model data directory
                          (default: /dev/shm/4PE_U250_dense)
      --log FILE          Log path (default: logs/<xclbin>_<timestamp>.log)
  -h, --help              Show this help

Examples:
  ./run_inference.sh build/model_300mhz.xclbin
  ./run_inference.sh build/model_300mhz.xclbin -i "Hello" -n 64
  ./run_inference.sh build/model_300mhz.xclbin -i "Xin chao" -n 32 --time

Decoding uses greedy argmax after applying a fixed repetition penalty of 1.1.

Without --time, stdout contains only generated text (the input prompt is not
echoed). Errors are still printed to stderr. Host output is saved to the log.

Optional run_inference.env beside this script:
  HOST_BIN=/absolute/path/to/host_binary
  DATA_DIR=/dev/shm/4PE_U250_dense
  DEVICE=0000:13:00.0
EOF
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

find_host_bin() {
  local candidate
  local -a candidates=(
    "${SCRIPT_DIR}/decode_host"
    "${SCRIPT_DIR}/host"
    "${SCRIPT_DIR}/bin/host"
    "${SCRIPT_DIR}/build/host"
    "${SCRIPT_DIR}/build/bin/host"
    "${SCRIPT_DIR}/host_app"
    "${SCRIPT_DIR}/build/host_app"
    "${SCRIPT_DIR}/inference"
    "${SCRIPT_DIR}/build/inference"
  )

  for candidate in "${candidates[@]}"; do
    if [[ -f "${candidate}" && -x "${candidate}" ]]; then
      printf '%s\n' "${candidate}"
      return 0
    fi
  done
  return 1
}

is_data_dir() {
  local dir="$1"
  [[ -d "${dir}" \
    && -f "${dir}/model_bank0.bin" \
    && -f "${dir}/model_bank1.bin" \
    && -f "${dir}/model_bank2.bin" \
    && -f "${dir}/model_bank3.bin" \
    && -f "${dir}/rope_lut.bin" \
    && -f "${dir}/tokenizer.bin" \
    && -f "${dir}/embeddings.bin" ]]
}

find_data_dir() {
  local candidate
  local -a candidates=(
    "${SCRIPT_DIR}/data"
    "${SCRIPT_DIR}/model_data"
    "${SCRIPT_DIR}/weights"
    "${SCRIPT_DIR}/../data"
  )

  for candidate in "${candidates[@]}"; do
    if is_data_dir "${candidate}"; then
      (cd -- "${candidate}" && pwd -P)
      return 0
    fi
  done
  return 1
}

if [[ $# -eq 0 ]]; then
  usage
  exit 2
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
  exit 0
fi

XCLBIN="$1"
shift

PROMPT="${PROMPT:-Hello}"
MAX_TOKENS="${MAX_TOKENS:-32}"
DEVICE="${DEVICE:-0000:13:00.0}"
HOST_BIN="${HOST_BIN:-}"
DATA_DIR="${DATA_DIR:-/dev/shm/4PE_U250_dense}"
LOG_FILE=""
SHOW_TIME=0

# A second positional argument is accepted as the prompt for quick runs.
if [[ $# -gt 0 && "$1" != -* ]]; then
  PROMPT="$1"
  shift
fi

declare -a EXTRA_ARGS=()
EXTRA_ARGS_COUNT=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    -i|-p|--prompt)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      PROMPT="$2"
      shift 2
      ;;
    --time)
      SHOW_TIME=1
      shift
      ;;
    -n|--max-tokens)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      MAX_TOKENS="$2"
      shift 2
      ;;
    -d|--device)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      DEVICE="$2"
      shift 2
      ;;
    --host-bin)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      HOST_BIN="$2"
      shift 2
      ;;
    --data-dir)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      DATA_DIR="$2"
      shift 2
      ;;
    --log)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      LOG_FILE="$2"
      shift 2
      ;;
    --)
      shift
      EXTRA_ARGS+=("$@")
      EXTRA_ARGS_COUNT=$#
      break
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1 (use -- before host-specific options)"
      ;;
  esac
done

[[ -f "${XCLBIN}" ]] || die "xclbin not found: ${XCLBIN}"
[[ "${MAX_TOKENS}" =~ ^[1-9][0-9]*$ ]] \
  || die "--max-tokens must be a positive integer"

if [[ -z "${HOST_BIN}" ]]; then
  HOST_BIN="$(find_host_bin)" || die \
    "host binary not found; set HOST_BIN or add it to run_inference.env"
fi
[[ -f "${HOST_BIN}" ]] || die "host binary not found: ${HOST_BIN}"
[[ -x "${HOST_BIN}" ]] || die "host binary is not executable: ${HOST_BIN}"

if [[ -z "${DATA_DIR}" ]]; then
  DATA_DIR="$(find_data_dir)" || die \
    "model data directory not found; set DATA_DIR or add it to run_inference.env"
fi
is_data_dir "${DATA_DIR}" || die \
  "${DATA_DIR} must contain model_bank0.bin..model_bank3.bin, rope_lut.bin, tokenizer.bin and embeddings.bin"

if [[ -z "${LOG_FILE}" ]]; then
  XCLBIN_NAME="$(basename -- "${XCLBIN}")"
  XCLBIN_NAME="${XCLBIN_NAME%.xclbin}"
  LOG_DIR="${LOG_DIR:-${SCRIPT_DIR}/logs}"
  mkdir -p -- "${LOG_DIR}"
  LOG_FILE="${LOG_DIR}/${XCLBIN_NAME}_$(date '+%Y%m%d_%H%M%S').log"
else
  LOG_PARENT="$(dirname -- "${LOG_FILE}")"
  mkdir -p -- "${LOG_PARENT}"
fi

declare -a CMD=(
  "${HOST_BIN}"
  --xclbin "${XCLBIN}"
  --device "${DEVICE}"
  --banks "${DATA_DIR}"
  --rope "${DATA_DIR}/rope_lut.bin"
  --tokenizer "${DATA_DIR}/tokenizer.bin"
  --embeddings "${DATA_DIR}/embeddings.bin"
  --prompt "${PROMPT}"
  --max-tokens "${MAX_TOKENS}"
)
if (( SHOW_TIME )); then
  CMD+=(--verbose)
fi
if (( EXTRA_ARGS_COUNT > 0 )); then
  CMD+=("${EXTRA_ARGS[@]}")
fi
# Keep greedy decoding with repetition penalty explicit, including when an old
# config or extra host options contain sampling overrides (last value wins).
CMD+=(--temperature 0 --repeat-penalty 1.1)

if (( SHOW_TIME )); then
  printf 'XCLBIN : %s\n' "${XCLBIN}"
  printf 'Device : %s\n' "${DEVICE}"
  printf 'Host   : %s\n' "${HOST_BIN}"
  printf 'Data   : %s\n' "${DATA_DIR}"
  printf 'Log    : %s\n' "${LOG_FILE}"
  printf 'Command:'
  printf ' %q' "${CMD[@]}"
  printf '\n\n'
fi

set +e
if (( SHOW_TIME )); then
  "${CMD[@]}" 2>&1 | tee "${LOG_FILE}"
  PIPE_STATUSES=("${PIPESTATUS[@]}")
else
  # decode_host echoes the literal input prompt before streaming generated
  # pieces. Skip that exact byte prefix on stdout, including UTF-8 prompts.
  # Keep stderr separate so errors are never mistaken for prompt/text bytes.
  PROMPT_BYTES=$(printf '%s' "${PROMPT}" | wc -c)
  : > "${LOG_FILE}"
  "${CMD[@]}" 2> >(tee -a "${LOG_FILE}" >&2) \
    | tee -a "${LOG_FILE}" | tail -c "+$((PROMPT_BYTES + 1))"
  PIPE_STATUSES=("${PIPESTATUS[@]}")
fi
RUN_STATUS=${PIPE_STATUSES[0]}
set -e

if (( RUN_STATUS != 0 )); then
  printf '\nInference failed with exit code %d. See: %s\n' \
    "${RUN_STATUS}" "${LOG_FILE}" >&2
  exit "${RUN_STATUS}"
fi

for PIPE_STATUS in "${PIPE_STATUSES[@]}"; do
  if (( PIPE_STATUS != 0 )); then
    printf '\nError: output/logging pipeline failed (exit code %d).\n' \
      "${PIPE_STATUS}" >&2
    exit "${PIPE_STATUS}"
  fi
done

if (( ! SHOW_TIME )); then
  exit 0
fi

TOKEN_TIMING_SUMMARY="$({
  awk '
    {
      value = $0
      sub(/^.*\[Run\] pos=[0-9]+ done in /, "", value)
      if (value == $0) {
        next
      }
      sub(/ ms.*$/, "", value)
      if (value !~ /^[0-9]+([.][0-9]+)?$/) {
        next
      }

      latency = value + 0
      sum += latency
      count++
      if (count == 1 || latency < minimum) minimum = latency
      if (count == 1 || latency > maximum) maximum = latency
    }
    END {
      if (count > 0) {
        average = sum / count
        printf "[Token timing] count=%d avg=%.3f ms/token min=%.3f ms max=%.3f ms throughput=%.3f tok/s", \
          count, average, minimum, maximum, 1000.0 / average
      }
    }
  ' "${LOG_FILE}"
} || true)"

if [[ -n "${TOKEN_TIMING_SUMMARY}" ]]; then
  printf '\n%s\n' "${TOKEN_TIMING_SUMMARY}"
else
  printf '\n[Token timing] No per-token timing lines found in %s\n' \
    "${LOG_FILE}" >&2
fi

GENERATION_TIMING_SUMMARY="$({
  awk '
    /\[Stats\].*total_inference_ms=/ {
      total_ms = 0
      generated = 0
      throughput = 0
      for (i = 1; i <= NF; i++) {
        split($i, pair, "=")
        if (pair[1] == "total_inference_ms") total_ms = pair[2] + 0
        if (pair[1] == "generated") generated = pair[2] + 0
        if (pair[1] == "effective_tok/s") throughput = pair[2] + 0
      }
    }
    END {
      if (generated > 0 && total_ms > 0) {
        printf "[Generation timing] generated=%d avg=%.3f ms/token total=%.3f ms throughput=%.3f tok/s", \
          generated, total_ms / generated, total_ms, throughput
      }
    }
  ' "${LOG_FILE}"
} || true)"

if [[ -n "${GENERATION_TIMING_SUMMARY}" ]]; then
  printf '%s\n' "${GENERATION_TIMING_SUMMARY}"
fi
