#!/usr/bin/env bash
set -euo pipefail

# Rebuild all four decoder XOs from the current HLS sources, verify that the
# O-projection activation snapshot exists in every generated RTL tree, then
# package the PE0 forensic ILAs and perform exactly one v++ link.

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
vitis_settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}
hls_script="$script_dir/run_hls_decoder_multikernel.tcl"

if ! command -v vitis_hls >/dev/null 2>&1 ||
   ! command -v v++ >/dev/null 2>&1; then
    if [[ ! -f "$vitis_settings" ]]; then
        echo "ERROR: Vitis settings file not found: $vitis_settings" >&2
        echo "Set VITIS_SETTINGS to the Vitis 2023.2 settings64.sh path." >&2
        exit 1
    fi
    set +u
    source "$vitis_settings"
    set -u
fi

for tool in vitis_hls v++ vivado; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: Required tool '$tool' is not available." >&2
        exit 1
    fi
done

if [[ ! -f "$hls_script" ]]; then
    echo "ERROR: HLS script not found: $hls_script" >&2
    exit 1
fi

run_id=$(date +%Y%m%d-%H%M%S)-$$
log_dir="$repo_root/build_multikernel_300mhz/runs/$run_id/logs"
mkdir -p "$log_dir"

export TARGET_FREQ=300mhz
export ENABLE_STALL_PROFILE=0
export XO_OUTPUT_DIR="$repo_root"

echo "========================================================================"
echo " Rebuilding PE0..PE3 from the fixed HLS sources"
echo "========================================================================"
echo "Logs: $log_dir/vitis_hls_pe{0,1,2,3}.log"

hls_pids=()
for pe in 0 1 2 3; do
    (
        export INT4_DECODER_PE="$pe"
        cd "$repo_root"
        vitis_hls -f "$hls_script" \
            > "$log_dir/vitis_hls_pe${pe}.log" 2>&1
    ) &
    hls_pids[$pe]=$!
    echo "  [PE$pe] HLS PID ${hls_pids[$pe]}"
done

hls_failed=0
for pe in 0 1 2 3; do
    if ! wait "${hls_pids[$pe]}"; then
        echo "ERROR: PE$pe HLS synthesis failed." >&2
        tail -n 80 "$log_dir/vitis_hls_pe${pe}.log" >&2 || true
        hls_failed=1
    else
        echo "  [OK] PE$pe HLS synthesis completed."
    fi
done
if (( hls_failed != 0 )); then
    exit 1
fi

for pe in 0 1 2 3; do
    xo="$repo_root/int4_decoder_pe${pe}_kernel_300mhz.xo"
    rtl_dir="$repo_root/proj_int4_decoder_pe${pe}/solution_300mhz/syn/verilog"
    snapshot_rtl=$(find "$rtl_dir" -maxdepth 1 -type f \
        -name '*int4_snapshot_local_activation*.v' -print -quit \
        2>/dev/null || true)
    if [[ ! -s "$xo" ]]; then
        echo "ERROR: PE$pe XO is missing or empty: $xo" >&2
        exit 1
    fi
    if [[ -z "$snapshot_rtl" || ! -s "$snapshot_rtl" ]]; then
        echo "ERROR: PE$pe RTL does not contain the activation snapshot fix." >&2
        echo "Expected under: $rtl_dir" >&2
        exit 1
    fi
    echo "  [OK] PE$pe XO and activation-snapshot RTL verified."
done

echo ""
echo "========================================================================"
echo " Packaging forensic ILAs and linking the fixed xclbin once"
echo "========================================================================"

export REUSE_XO=1
export REBUILD_XO=0
exec bash "$script_dir/build_o_projection_ila.sh" "$@"
