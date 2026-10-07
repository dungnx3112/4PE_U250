#!/usr/bin/env bash
set -euo pipefail

# One entry point: compare the old arithmetic against the hardened source.
# Both images have boundary + internal PE0 ILAs and a 100-MHz link clock.
repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
usage() {
    printf '%s\n' \
        'Usage: bash build_full_ila_xclbin.sh [--check] [U250-platform.xpfm]' \
        'Builds baseline and hardened in parallel, with fresh XOs for all four PEs.' \
        'Overrides: U250_PLATFORM, VITIS_SETTINGS, JOBS (default 8),' \
        '           O_DEEP_HLS_PARALLEL (default 2 per image), FULL_ILA_RUN_DIR.'
}
check_only=0
if [[ ${1:-} == --help || ${1:-} == -h ]]; then usage; exit 0; fi
if [[ ${1:-} == --check ]]; then check_only=1; shift; fi
if (( $# > 1 )); then usage >&2; exit 2; fi
default_platform="$HOME/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
export U250_PLATFORM=${1:-${U250_PLATFORM:-$default_platform}}
export JOBS=${JOBS:-8}
export O_DEEP_HLS_PARALLEL=${O_DEEP_HLS_PARALLEL:-2}
if [[ ! $JOBS =~ ^[1-9][0-9]*$ ]]; then echo 'JOBS must be positive.' >&2; exit 2; fi
case "$O_DEEP_HLS_PARALLEL" in 1|2|4) ;; *) echo 'O_DEEP_HLS_PARALLEL must be 1, 2 or 4.' >&2; exit 2 ;; esac

if ! command -v vitis_hls >/dev/null 2>&1 ||
   ! command -v v++ >/dev/null 2>&1 || ! command -v vivado >/dev/null 2>&1; then
    settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}
    if [[ ! -f $settings ]]; then echo "Missing Vitis settings: $settings" >&2; exit 1; fi
    set +u
    source "$settings"
    set -u
fi
for tool in vitis_hls v++ vivado unzip zip sha256sum realpath find sort xargs; do
    command -v "$tool" >/dev/null || { echo "Missing tool: $tool" >&2; exit 1; }
done
export PYTHON_BIN=${PYTHON_BIN:-/usr/bin/python3}
command -v "$PYTHON_BIN" >/dev/null || { echo "Missing Python: $PYTHON_BIN" >&2; exit 1; }
if ! env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH "$PYTHON_BIN" -c \
    'import sys; assert sys.version_info >= (3, 6), "Python 3.6+ required"'; then
    echo 'Python preflight failed.' >&2; exit 1
fi
if [[ ! -f $U250_PLATFORM ]]; then
    echo "Platform file not found: $U250_PLATFORM" >&2
    echo 'Set U250_PLATFORM to the .xpfm used by your successful U250 build.' >&2
    exit 1
fi
echo "PLATFORM=$U250_PLATFORM"
echo "IMAGES=baseline hardened CLOCK=100MHz HLS_WORKERS=$((2 * O_DEEP_HLS_PARALLEL)) LINK_JOBS_PER_IMAGE=$JOBS"
if (( check_only == 1 )); then echo 'PASS FULL_ILA_PREFLIGHT'; exit 0; fi

run_dir=${FULL_ILA_RUN_DIR:-"$repo_root/build_full_ila/$(date +%Y%m%d-%H%M%S)-$$"}
run_dir=$(realpath -m "$run_dir")
if [[ -e $run_dir ]]; then echo "Refusing to overwrite run directory: $run_dir" >&2; exit 1; fi
mkdir -p "$run_dir"
echo "RUN_DIR=$run_dir"
variants=(baseline hardened)
pids=()
for variant in "${variants[@]}"; do
    bash "$repo_root/scripts/build_o_projection_deep.sh" "$variant" "$run_dir/$variant" \
        > "$run_dir/$variant.log" 2>&1 &
    pids+=("$!")
    echo "BUILD=$variant LOG=$run_dir/$variant.log"
done
failed=0
for index in "${!variants[@]}"; do
    if ! wait "${pids[$index]}"; then
        echo "FAIL ${variants[$index]}; inspect $run_dir/${variants[$index]}.log" >&2
        failed=1
    fi
done
if (( failed != 0 )); then
    echo 'Build incomplete: do not replace a failed image with an old XO/XCLBIN.' >&2
    exit 1
fi
printf 'variant\txclbin\tltx\tprobes\n' > "$run_dir/xclbins.tsv"
for variant in "${variants[@]}"; do
    xclbin="$run_dir/$variant/int4_decoder_100mhz_o_deep_${variant}.xclbin"
    for artifact in "$xclbin" "$xclbin.ltx" "$xclbin.deep.json"; do
        test -s "$artifact" || { echo "Missing artifact: $artifact" >&2; exit 1; }
    done
    printf '%s\t%s\t%s\t%s\n' "$variant" "$xclbin" "$xclbin.ltx" "$xclbin.deep.json" \
        >> "$run_dir/xclbins.tsv"
    echo "XCLBIN=$xclbin"
done
echo "PASS FULL_ILA_BUILDS MANIFEST=$run_dir/xclbins.tsv"
echo "Next: O_DEEP_VARIANTS='baseline hardened' bash scripts/capture_o_projection_deep_suite.sh '$run_dir'"
