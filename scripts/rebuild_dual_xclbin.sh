#!/usr/bin/env bash
set -euo pipefail

# Rebuild PE0..PE3 once from the current source, then link these two images
# concurrently from the exact same XO set:
#   1. 100 MHz PE0 O-projection full-data ILA image.
#   2. 300 MHz production image without ILA/profile instrumentation.

usage() {
    cat <<'EOF'
Usage: scripts/rebuild_dual_xclbin.sh

Environment overrides:
  VITIS_SETTINGS=<settings64.sh>
  U250_PLATFORM=<platform.xpfm-or-name>
  JOBS=<N>                  Jobs assigned to each concurrent v++ link (default: 16)
  ILA_OUTPUT=<file.xclbin>  Default:
      int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin
  PROD_OUTPUT=<file.xclbin> Default:
      int4_decoder_multikernel_300mhz_prod_clean.xclbin
  O_ILA_DEPTH=<N>           Full-data ILA capture depth (default: 1024)
  O_ILA_CONTROL_DEPTH=<N>   Control ILA capture depth (default: 1024)

The four HLS jobs run concurrently first. Only after all four new XOs pass
validation are the 100 MHz ILA and 300 MHz production links started together.
EOF
}

if (( $# != 0 )); then
    case "${1:-}" in
        -h|--help) usage; exit 0 ;;
        *) usage >&2; exit 2 ;;
    esac
fi

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
vitis_settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}
hls_script="$script_dir/run_hls_decoder_multikernel.tcl"
ila_output=${ILA_OUTPUT:-int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin}
prod_output=${PROD_OUTPUT:-int4_decoder_multikernel_300mhz_prod_clean.xclbin}
link_jobs=${JOBS:-16}
ila_depth=${O_ILA_DEPTH:-1024}
ila_control_depth=${O_ILA_CONTROL_DEPTH:-1024}

if [[ ! "$link_jobs" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: JOBS must be a positive integer, got '$link_jobs'." >&2
    exit 2
fi
if [[ ! "$ila_depth" =~ ^[1-9][0-9]*$ ]] ||
   [[ ! "$ila_control_depth" =~ ^[1-9][0-9]*$ ]]; then
    echo "ERROR: O_ILA_DEPTH and O_ILA_CONTROL_DEPTH must be positive integers." >&2
    exit 2
fi

resolve_output() {
    local value=$1
    if [[ "$value" == /* ]]; then
        printf '%s\n' "$value"
    else
        printf '%s/%s\n' "$repo_root" "$value"
    fi
}

ila_output_abs=$(resolve_output "$ila_output")
prod_output_abs=$(resolve_output "$prod_output")
if [[ "$ila_output_abs" == "$prod_output_abs" ]]; then
    echo "ERROR: ILA_OUTPUT and PROD_OUTPUT must be different paths." >&2
    exit 2
fi
mkdir -p "$(dirname -- "$ila_output_abs")" "$(dirname -- "$prod_output_abs")"

if [[ ! -f "$hls_script" ]]; then
    echo "ERROR: missing HLS script: $hls_script" >&2
    exit 1
fi

if ! command -v vitis_hls >/dev/null 2>&1 ||
   ! command -v v++ >/dev/null 2>&1 ||
   ! command -v vivado >/dev/null 2>&1; then
    if [[ ! -f "$vitis_settings" ]]; then
        echo "ERROR: Vitis settings file not found: $vitis_settings" >&2
        echo "Set VITIS_SETTINGS to the Vitis 2023.2 settings64.sh path." >&2
        exit 1
    fi
    set +u
    source "$vitis_settings"
    set -u
fi

for tool in vitis_hls v++ vivado sha256sum; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: required tool '$tool' is unavailable." >&2
        exit 1
    fi
done

cd "$repo_root"

run_id=$(date +%Y%m%d-%H%M%S)-$$
dual_run_dir="$repo_root/build_multikernel_300mhz/dual_runs/$run_id"
hls_log_dir="$dual_run_dir/hls_logs"
link_log_dir="$dual_run_dir/link_logs"
staged_xo_dir="$dual_run_dir/xo"
mkdir -p "$hls_log_dir" "$link_log_dir" "$staged_xo_dir"

source_commit=unknown
if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    source_commit=$(git rev-parse HEAD)
fi
printf '%s\n' "$source_commit" > "$dual_run_dir/source_commit.txt"

echo "========================================================================"
echo " DUAL XCLBIN REBUILD"
echo "========================================================================"
echo "Source commit:        $source_commit"
echo "Run directory:        $dual_run_dir"
echo "ILA output:           $ila_output_abs"
echo "Production output:    $prod_output_abs"
echo "Jobs per v++ link:    $link_jobs"
echo ""
echo "[Phase 1/2] Rebuilding PE0..PE3 XOs concurrently"

hls_pids=()
for pe in 0 1 2 3; do
    (
        export INT4_DECODER_PE="$pe"
        export TARGET_FREQ=300mhz
        export ENABLE_STALL_PROFILE=0
        export XO_OUTPUT_DIR="$staged_xo_dir"
        vitis_hls -f "$hls_script"
    ) > "$hls_log_dir/pe${pe}.log" 2>&1 &
    hls_pids[$pe]=$!
    echo "  PE${pe}: PID ${hls_pids[$pe]} -> $hls_log_dir/pe${pe}.log"
done

terminate_hls() {
    local pid
    for pid in "${hls_pids[@]}"; do
        kill "$pid" 2>/dev/null || true
    done
    wait 2>/dev/null || true
    echo "Interrupted while rebuilding XOs." >&2
    exit 130
}
trap terminate_hls INT TERM

hls_failed=0
for pe in 0 1 2 3; do
    if wait "${hls_pids[$pe]}"; then
        echo "  PE${pe}: PASS"
    else
        echo "  PE${pe}: FAIL (last 80 log lines follow)" >&2
        tail -n 80 "$hls_log_dir/pe${pe}.log" >&2 || true
        hls_failed=1
    fi
done
trap - INT TERM

if (( hls_failed != 0 )); then
    echo "ERROR: at least one HLS build failed; no XCLBIN link was started." >&2
    exit 1
fi

for pe in 0 1 2 3; do
    staged_xo="$staged_xo_dir/int4_decoder_pe${pe}_kernel_300mhz.xo"
    rtl_dir="$repo_root/proj_int4_decoder_pe${pe}/solution_300mhz/syn/verilog"
    snapshot_rtl=$(find "$rtl_dir" -maxdepth 1 -type f \
        -name '*int4_snapshot_local_activation*.v' -size +0c -print -quit \
        2>/dev/null || true)

    if [[ ! -s "$staged_xo" ]]; then
        echo "ERROR: PE${pe} did not produce a non-empty XO: $staged_xo" >&2
        exit 1
    fi
    if [[ -z "$snapshot_rtl" ]]; then
        echo "ERROR: PE${pe} generated RTL is missing the activation-snapshot fix." >&2
        echo "Expected under: $rtl_dir" >&2
        exit 1
    fi
done

# Publish only a complete, validated XO set. The two link processes that follow
# read these four immutable source files and never synthesize them again.
for pe in 0 1 2 3; do
    cp -fL \
        "$staged_xo_dir/int4_decoder_pe${pe}_kernel_300mhz.xo" \
        "$repo_root/int4_decoder_pe${pe}_kernel_300mhz.xo"
done
sha256sum "$repo_root"/int4_decoder_pe*_kernel_300mhz.xo \
    | tee "$dual_run_dir/source_xo.sha256"

# Remove only the explicitly selected final outputs. This prevents a failed
# new build from being mistaken for an older successful artifact.
rm -f -- \
    "$ila_output_abs" "$ila_output_abs.ltx" "$ila_output_abs.sha256" \
    "$ila_output_abs.xrt.ini" \
    "$prod_output_abs" "$prod_output_abs.ltx" "$prod_output_abs.sha256" \
    "$prod_output_abs.xrt.ini"

echo ""
echo "[Phase 2/2] Starting both v++ links concurrently"

(
    export ENABLE_O_PROJECTION_ILA=1
    export ENABLE_STALL_PROFILE=0
    export ENABLE_FULL_STREAM_DEBUG=0
    export REUSE_XO=1
    export REBUILD_XO=0
    export DEBUG_CLOCK_HZ=100000000
    export O_ILA_PE=0
    export O_ILA_SOURCE_XO_DIR="$repo_root"
    export O_ILA_DEPTH="$ila_depth"
    export O_ILA_CONTROL_DEPTH="$ila_control_depth"
    export XCLBIN_OUTPUT="$ila_output_abs"
    export JOBS="$link_jobs"
    bash "$script_dir/build_o_projection_ila.sh"
) > "$link_log_dir/100mhz_ila.log" 2>&1 &
ila_pid=$!

(
    export ENABLE_O_PROJECTION_ILA=0
    export ENABLE_STALL_PROFILE=0
    export ENABLE_FULL_STREAM_DEBUG=0
    export REUSE_XO=1
    export REBUILD_XO=0
    export XCLBIN_OUTPUT="$prod_output_abs"
    export JOBS="$link_jobs"
    bash "$script_dir/build_decoder_multikernel_300mhz.sh"
) > "$link_log_dir/300mhz_production.log" 2>&1 &
prod_pid=$!

echo "  100 MHz ILA:        PID $ila_pid -> $link_log_dir/100mhz_ila.log"
echo "  300 MHz production: PID $prod_pid -> $link_log_dir/300mhz_production.log"

terminate_links() {
    kill "$ila_pid" "$prod_pid" 2>/dev/null || true
    wait "$ila_pid" "$prod_pid" 2>/dev/null || true
    echo "Interrupted while linking XCLBINs." >&2
    exit 130
}
trap terminate_links INT TERM

ila_status=0
prod_status=0
wait "$ila_pid" || ila_status=$?
wait "$prod_pid" || prod_status=$?
trap - INT TERM

if (( ila_status != 0 )); then
    echo "ERROR: 100 MHz ILA link failed with exit code $ila_status." >&2
    tail -n 120 "$link_log_dir/100mhz_ila.log" >&2 || true
fi
if (( prod_status != 0 )); then
    echo "ERROR: 300 MHz production link failed with exit code $prod_status." >&2
    tail -n 120 "$link_log_dir/300mhz_production.log" >&2 || true
fi
if (( ila_status != 0 || prod_status != 0 )); then
    exit 1
fi

if [[ ! -s "$ila_output_abs" || ! -s "$ila_output_abs.ltx" ]]; then
    echo "ERROR: 100 MHz ILA build did not publish both XCLBIN and LTX." >&2
    exit 1
fi
if [[ ! -s "$prod_output_abs" ]]; then
    echo "ERROR: 300 MHz production build did not publish its XCLBIN." >&2
    exit 1
fi
if [[ -e "$prod_output_abs.ltx" || -e "$prod_output_abs.xrt.ini" ]]; then
    echo "ERROR: production output unexpectedly has debug sidecar files." >&2
    exit 1
fi

sha256sum "$ila_output_abs" "$ila_output_abs.ltx" "$prod_output_abs" \
    | tee "$dual_run_dir/final_artifacts.sha256"

echo ""
echo "========================================================================"
echo " DUAL BUILD SUCCESSFUL"
echo "========================================================================"
echo "100 MHz full-data ILA: $ila_output_abs"
echo "Matching probes:       $ila_output_abs.ltx"
echo "300 MHz no-ILA:        $prod_output_abs"
echo "Source XO checksums:   $dual_run_dir/source_xo.sha256"
echo "Final checksums:       $dual_run_dir/final_artifacts.sha256"
echo "All logs:              $dual_run_dir"
