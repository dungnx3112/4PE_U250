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
  -p, --prompt TEXT       Prompt to run (default: Hello)
  -n, --max-tokens N      Number of tokens to generate (default: 32)
  -d, --device DEVICE     XRT device index/BDF (default: DEVICE or 0)
      --host-bin PATH     Path to the host executable
      --data-dir DIR      Model data directory
                          (default: /dev/shm/4PE_U250_dense)
      --log FILE          Log path (default: logs/<xclbin>_<timestamp>.log)
  -h, --help              Show this help

Examples:
  ./run_inference.sh build/model_300mhz.xclbin
  ./run_inference.sh build/model_300mhz.xclbin "Hello" -n 64
  ./run_inference.sh build/model_300mhz.xclbin -p "Xin chao" -d 0

Optional run_inference.env beside this script:
  HOST_BIN=/absolute/path/to/host_binary
  DATA_DIR=/dev/shm/4PE_U250_dense
  DEVICE=0
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
DEVICE="${DEVICE:-0}"
HOST_BIN="${HOST_BIN:-}"
DATA_DIR="${DATA_DIR:-/dev/shm/4PE_U250_dense}"
LOG_FILE=""

# A second positional argument is accepted as the prompt for quick runs.
if [[ $# -gt 0 && "$1" != -* ]]; then
  PROMPT="$1"
  shift
fi

declare -a EXTRA_ARGS=()
EXTRA_ARGS_COUNT=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--prompt)
      [[ $# -ge 2 ]] || die "$1 requires a value"
      PROMPT="$2"
      shift 2
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
if (( EXTRA_ARGS_COUNT > 0 )); then
  CMD+=("${EXTRA_ARGS[@]}")
fi

printf 'XCLBIN : %s\n' "${XCLBIN}"
printf 'Device : %s\n' "${DEVICE}"
printf 'Host   : %s\n' "${HOST_BIN}"
printf 'Data   : %s\n' "${DATA_DIR}"
printf 'Log    : %s\n' "${LOG_FILE}"
printf 'Command:'
printf ' %q' "${CMD[@]}"
printf '\n\n'

"${CMD[@]}" 2>&1 | tee "${LOG_FILE}"
