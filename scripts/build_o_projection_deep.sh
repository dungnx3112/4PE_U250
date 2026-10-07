#!/usr/bin/env bash
set -euo pipefail

# Each variant owns a complete source/XO/link workspace. Never reuse root XOs.
variant=${1:-}
case "$variant" in
    baseline) implementation=0 ;;
    group_packed) implementation=1 ;;
    group_scalar) implementation=2 ;;
    hardened) implementation=3 ;;
    *) echo "Usage: bash $0 baseline|group_packed|group_scalar|hardened [workspace]" >&2; exit 2 ;;
esac
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
workspace=${2:-"$repo_root/build_o_deep/$(date +%Y%m%d-%H%M%S)-$$/$variant"}
workspace=$(realpath -m "$workspace")
if [[ -e "$workspace" ]]; then
    echo "ERROR: workspace already exists; choose a fresh directory: $workspace" >&2
    exit 1
fi
mkdir -p "$workspace"
for directory in kernel_HLS scripts constraints; do
    cp -a "$repo_root/$directory" "$workspace/$directory"
done
mkdir -p "$workspace/logs" "$workspace/source_xo"
(
    cd "$workspace"
    find kernel_HLS scripts constraints -type f \
        \( -name '*.cpp' -o -name '*.hpp' -o -name '*.tcl' -o -name '*.sh' -o -name '*.py' -o -name '*.cfg' \) \
        -print0 | sort -z | xargs -0 sha256sum > source.sha256
)
printf 'variant=%s\nimplementation=%s\nlink_clock_hz=100000000\n' \
    "$variant" "$implementation" > "$workspace/build_config.txt"

if ! command -v vitis_hls >/dev/null 2>&1 || ! command -v v++ >/dev/null 2>&1; then
    settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}
    set +u
    source "$settings"
    set -u
fi
for tool in vitis_hls v++ vivado; do
    command -v "$tool" >/dev/null || { echo "Missing tool: $tool" >&2; exit 1; }
done
export TARGET_FREQ=300mhz ENABLE_STALL_PROFILE=0 ENABLE_FULL_STREAM_DEBUG=0
export O_ILA_PE=0
export INT4_HLS_EXTRA_CFLAGS="-DINT4_ACCUM_DEBUG_VARIANT=$implementation"
export XO_OUTPUT_DIR="$workspace/source_xo"
# Two HLS workers per image by default; the root launcher builds two images.
parallel=${O_DEEP_HLS_PARALLEL:-2}
if [[ "$parallel" != 1 && "$parallel" != 2 && "$parallel" != 4 ]]; then
    echo "O_DEEP_HLS_PARALLEL must be 1, 2 or 4" >&2; exit 2
fi
cd "$workspace"
for ((start=0; start<4; start+=parallel)); do
    pids=()
    for ((pe=start; pe<start+parallel && pe<4; ++pe)); do
        (
            export INT4_DECODER_PE="$pe"
            vitis_hls -f "$workspace/scripts/run_hls_decoder_multikernel.tcl" \
                > "$workspace/logs/hls_pe${pe}.log" 2>&1
        ) &
        pids+=("$!")
    done
    failed=0
    for pid in "${pids[@]}"; do
        if ! wait "$pid"; then failed=1; fi
    done
    if (( failed != 0 )); then
        echo "ERROR: HLS failed. See $workspace/logs/hls_pe*.log" >&2
        exit 1
    fi
done
for pe in 0 1 2 3; do
    test -s "$workspace/source_xo/int4_decoder_pe${pe}_kernel_300mhz.xo"
done
export O_ILA_SOURCE_XO_DIR="$workspace/source_xo"
export O_DEEP_ILA=1 O_DEEP_ILA_DEPTH=${O_DEEP_ILA_DEPTH:-4096}
export O_DEEP_MATH_DEPTH=${O_DEEP_MATH_DEPTH:-2048}
export REUSE_XO=1 REBUILD_XO=0 JOBS=${JOBS:-8}
export O_ILA_DEPTH=${O_ILA_DEPTH:-1024} O_ILA_CONTROL_DEPTH=${O_ILA_CONTROL_DEPTH:-1024}
export DEBUG_CLOCK_HZ=100000000
export XCLBIN_OUTPUT="$workspace/int4_decoder_100mhz_o_deep_${variant}.xclbin"
bash "$workspace/scripts/build_o_projection_ila.sh" \
    > "$workspace/logs/link.log" 2>&1
sha256sum "$XCLBIN_OUTPUT" "${XCLBIN_OUTPUT}.ltx" "${XCLBIN_OUTPUT}.deep.json" \
    > "$workspace/artifacts.sha256"
echo "PASS variant=$variant XCLBIN=$XCLBIN_OUTPUT"
