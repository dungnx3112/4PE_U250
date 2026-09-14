#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Build Script: 4-PE INT4 LLaMA Decoder Multi-Kernel @ 300 MHz on AMD Alveo U250
# Target: Linux EDA Server (CentOS / RHEL / Ubuntu)
# 1. Detects and sources Xilinx Vitis 2023.2 environment
# 2. Synthesizes and exports 4 PE XOs from C++ sources (pe0..pe3) @ 300 MHz
# 3. Links 4 XOs into final hardware container: int4_decoder_multikernel_300mhz.xclbin
# ==============================================================================

default_vitis_settings="/home/eda/xilinx/Vitis/2023.2/settings64.sh"
default_platform="/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
default_output="int4_decoder_multikernel_300mhz.xclbin"

usage() {
    cat >&2 <<EOF
Usage: $0 [platform.xpfm-or-name] [output.xclbin]

Defaults:
  platform: $default_platform
  output:   $default_output
  settings: $default_vitis_settings

Environment overrides:
  VITIS_SETTINGS=<settings64.sh>
  U250_PLATFORM=<platform.xpfm-or-name>
  XCLBIN_OUTPUT=<output.xclbin>
  REUSE_XO=1        Skip HLS and link existing 4 XO files directly
  REBUILD_XO=1      Force re-synthesis of all 4 XO files even if present
  JOBS=<N>          Parallel synthesis/linking jobs (default: nproc)
EOF
}

if (( $# > 2 )); then
    usage
    exit 2
fi

platform=${1:-${U250_PLATFORM:-$default_platform}}
output_name=${2:-${XCLBIN_OUTPUT:-$default_output}}
vitis_settings=${VITIS_SETTINGS:-$default_vitis_settings}
reuse_xo=${REUSE_XO:-0}
rebuild_xo=${REBUILD_XO:-0}
jobs=${JOBS:-$(nproc 2>/dev/null || echo 8)}

if (( reuse_xo == 1 && rebuild_xo == 1 )); then
    echo "ERROR: REUSE_XO=1 and REBUILD_XO=1 are mutually exclusive." >&2
    exit 2
fi

# ==============================================================================
# Step 0: Source Xilinx Vitis Environment
# ==============================================================================
echo "========================================================================"
echo " [Step 0] Sourcing Vitis Environment (Linux Server)"
echo "========================================================================"

# Auto-detect Vitis tools if not already sourced
if command -v vitis_hls >/dev/null 2>&1 && command -v v++ >/dev/null 2>&1; then
    echo "Vitis tools already found in environment PATH:"
    echo "  vitis_hls: $(command -v vitis_hls)"
    echo "  v++:       $(command -v v++)"
    echo "  vivado:    $(command -v vivado 2>/dev/null || echo 'not found')"
else
    if [[ ! -f "$vitis_settings" ]]; then
        # Search other standard Linux installation locations
        for cand in \
            "/home/eda/xilinx/Vitis/2023.2/settings64.sh" \
            "/tools/Xilinx/Vitis/2023.2/settings64.sh" \
            "/opt/xilinx/Vitis/2023.2/settings64.sh" \
            "/opt/Xilinx/Vitis/2023.2/settings64.sh" \
            "/opt/xilinx/xilinx/Vitis/2023.2/settings64.sh"; do
            if [[ -f "$cand" ]]; then
                vitis_settings="$cand"
                break
            fi
        done
    fi

    if [[ -f "$vitis_settings" ]]; then
        set +u
        source "$vitis_settings"
        set -u
        echo "Vitis environment loaded from: $vitis_settings"
    else
        echo "ERROR: Vitis settings file not found: $vitis_settings" >&2
        echo "Please set VITIS_SETTINGS or ensure vitis_hls/v++ are in PATH." >&2
        exit 1
    fi
fi

# Verify required executables
for tool in vitis_hls v++ vivado; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: Required tool '$tool' not found in PATH." >&2
        exit 1
    fi
    echo "  Found $tool: $(command -v "$tool")"
done

# Resolve platform if full path does not exist but short name is available
if [[ ! -f "$platform" ]]; then
    short_platform="xilinx_u250_gen3x16_xdma_4_1_202210_1"
    echo "NOTE: Platform path '$platform' not found as a direct file."
    echo "      Attempting platform name: '$short_platform'"
    platform="$short_platform"
fi

# Resolve paths
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
if [[ -d "$script_dir/kernel_HLS" ]]; then
    repo_root="$script_dir"
    scripts_dir="$script_dir"
else
    repo_root=$(cd -- "$script_dir/.." && pwd -P)
    scripts_dir="$script_dir"
fi
cd "$repo_root"

hls_script="$scripts_dir/run_hls_decoder_multikernel.tcl"
config_path="$scripts_dir/link_decoder_multikernel_300mhz.cfg"

if [[ ! -f "$hls_script" ]]; then
    echo "ERROR: HLS build script not found: $hls_script" >&2
    exit 1
fi
if [[ ! -f "$config_path" ]]; then
    echo "ERROR: Link config not found: $config_path" >&2
    exit 1
fi

xo_files=(
    "$repo_root/int4_decoder_pe0_kernel_300mhz.xo"
    "$repo_root/int4_decoder_pe1_kernel_300mhz.xo"
    "$repo_root/int4_decoder_pe2_kernel_300mhz.xo"
    "$repo_root/int4_decoder_pe3_kernel_300mhz.xo"
)

run_id=$(date +%Y%m%d-%H%M%S)-$$
run_dir="$repo_root/build_multikernel_300mhz/runs/$run_id"
temp_dir="$run_dir/temp"
log_dir="$run_dir/logs"
report_dir="$run_dir/reports"
mkdir -p "$temp_dir" "$log_dir" "$report_dir"

# ==============================================================================
# Step 1: Synthesize and Export 4 PE XOs (Vitis HLS)
# ==============================================================================
echo ""
echo "========================================================================"
echo " [Step 1] Checking / Generating 4 XO Kernels (PE0 .. PE3) @ 300 MHz"
echo "========================================================================"

need_hls=0
if (( rebuild_xo == 1 )); then
    echo "REBUILD_XO=1: Forcing full re-synthesis of all 4 XOs..."
    need_hls=1
elif (( reuse_xo == 1 )); then
    echo "REUSE_XO=1: Using existing XO files without re-synthesis."
    for xo in "${xo_files[@]}"; do
        if [[ ! -s "$xo" ]]; then
            echo "ERROR: REUSE_XO=1 requested, but missing XO: $xo" >&2
            exit 1
        fi
    done
else
    # Check if any XO is missing or empty
    for xo in "${xo_files[@]}"; do
        if [[ ! -s "$xo" ]]; then
            echo "XO file missing or empty: $xo"
            need_hls=1
            break
        fi
    done

    if (( need_hls == 0 )); then
        # Check source file timestamps against oldest XO
        oldest_xo=$(ls -t "${xo_files[@]}" | tail -n 1)
        if find "$source_dir" -maxdepth 1 -type f \
            \( -name '*.cpp' -o -name '*.hpp' -o -name 'run_hls_decoder_multikernel.tcl' \) \
            -newer "$oldest_xo" -print -quit | grep -q .; then
            echo "Source files are newer than existing XO files. Rebuilding XOs..."
            need_hls=1
        fi
    fi
fi

if (( need_hls == 1 )); then
    echo "Starting Vitis HLS synthesis for all 4 PEs in PARALLEL (300 MHz)..."
    echo "Server has $jobs CPU cores available. Launching PE0..PE3 concurrently."
    echo "Logs: $log_dir/vitis_hls_pe{0,1,2,3}.log"

    export TARGET_FREQ="300mhz"
    hls_pids=()
    for pe in 0 1 2 3; do
        (
            export INT4_DECODER_PE="$pe"
            vitis_hls -f "$hls_script" > "$log_dir/vitis_hls_pe${pe}.log" 2>&1
        ) &
        hls_pids+=($!)
        echo "  [PE$pe] Spawned concurrent HLS worker (PID: ${hls_pids[-1]}) -> $log_dir/vitis_hls_pe${pe}.log"
    done

    echo "Waiting for all 4 PE synthesis jobs to complete..."
    hls_failed=0
    for pe in 0 1 2 3; do
        pid=${hls_pids[$pe]}
        if ! wait "$pid"; then
            echo "ERROR: HLS synthesis for PE$pe (PID $pid) failed!" >&2
            echo "=== Last 25 lines of $log_dir/vitis_hls_pe${pe}.log ===" >&2
            tail -n 25 "$log_dir/vitis_hls_pe${pe}.log" >&2
            hls_failed=1
        else
            echo "  [PE$pe] HLS synthesis completed successfully."
        fi
    done

    if (( hls_failed == 1 )); then
        echo "ERROR: One or more HLS synthesis tasks failed." >&2
        exit 1
    fi

    echo "Vitis HLS finished. Verifying generated XO files..."
    for xo in "${xo_files[@]}"; do
        if [[ ! -s "$xo" ]]; then
            echo "ERROR: XO was not generated or is empty: $xo" >&2
            exit 1
        fi
        echo "  [OK] $(basename "$xo") ($(stat -c%s "$xo" 2>/dev/null || stat -f%z "$xo") bytes)"
    done
else
    echo "Existing 4 XO files are up to date:"
    for xo in "${xo_files[@]}"; do
        echo "  [OK] $(basename "$xo") ($(stat -c%s "$xo" 2>/dev/null || stat -f%z "$xo") bytes)"
    done
fi

# ==============================================================================
# Step 2: Link 4 XOs into XCLBIN (v++)
# ==============================================================================
echo ""
echo "========================================================================"
echo " [Step 2] Linking 4 XOs into Hardware Container (.xclbin) @ 300 MHz"
echo "========================================================================"

if [[ "$output_name" == /* ]]; then
    resolved_output="$output_name"
else
    resolved_output="$repo_root/$output_name"
fi
candidate_output="$run_dir/int4_decoder_multikernel_300mhz.candidate.xclbin"

echo "Platform:       $platform"
echo "Config:         $config_path"
echo "Target Clock:   300 MHz (pe0..3.ap_clk)"
echo "Candidate out:  $candidate_output"
echo "Final out:      $resolved_output"
echo "Log dir:        $log_dir"
echo "Report dir:     $report_dir"
echo "Parallel jobs:  $jobs"
echo ""

set +e
# Patch the cfg: replace placeholder Tcl paths with absolute paths
# (v++ sets Vivado CWD to a temp dir, so relative paths in cfg do not work)
config_patched="$temp_dir/link_decoder_multikernel_300mhz_patched.cfg"
if [[ -d "$repo_root/constraints" ]]; then
    constraints_dir="$repo_root/constraints"
elif [[ -d "$scripts_dir/constraints" ]]; then
    constraints_dir="$scripts_dir/constraints"
else
    constraints_dir="$repo_root/constraints"
fi
pre_place_tcl="$constraints_dir/pre_place.tcl"
pre_physopt_tcl="$constraints_dir/pre_physopt.tcl"
# Squeeze server configuration: scale Vivado synth.jobs and impl.jobs to 32 32
synth_jobs=$(( jobs >= 32 ? 32 : jobs ))
impl_jobs=$(( jobs >= 32 ? 32 : jobs ))
echo "Vivado synth jobs: $synth_jobs (maximized for 64-core server)"
echo "Vivado impl jobs:  $impl_jobs (maximized for 64-core server)"

sed \
    -e "s|__PRE_PLACE_TCL__|${pre_place_tcl}|g" \
    -e "s|__PRE_PHYSOPT_TCL__|${pre_physopt_tcl}|g" \
    -e "s|synth.jobs=.*|synth.jobs=${synth_jobs}|g" \
    -e "s|impl.jobs=.*|impl.jobs=${impl_jobs}|g" \
    "$config_path" > "$config_patched"
echo "  Patched config: $config_patched"
echo "    pre_place.tcl   -> $pre_place_tcl"
echo "    pre_physopt.tcl -> $pre_physopt_tcl"

v++ --link \
    --target hw \
    --platform "$platform" \
    --config "$config_patched" \
    --save-temps \
    --temp_dir "$temp_dir" \
    --log_dir "$log_dir" \
    --report_dir "$report_dir" \
    --output "$candidate_output" \
    "${xo_files[@]}" 2>&1 | tee "$log_dir/vpp_link.log"
link_exit_code=$?
set -e

if (( link_exit_code != 0 )); then
    echo "ERROR: v++ --link failed with exit code $link_exit_code!" >&2
    echo "Check logs in: $log_dir" >&2
    exit "$link_exit_code"
fi

if [[ ! -s "$candidate_output" ]]; then
    echo "ERROR: v++ returned 0 but candidate xclbin is missing or empty: $candidate_output" >&2
    exit 1
fi

# Publish final output
mv -f "$candidate_output" "$resolved_output"
echo ""
echo "========================================================================"
echo " BUILD SUCCESSFUL!"
echo "========================================================================"
echo "XCLBIN Published: $resolved_output"
echo "Size:             $(stat -c%s "$resolved_output" 2>/dev/null || stat -f%z "$resolved_output") bytes"
sha256sum "$resolved_output" | tee "$resolved_output.sha256"

if command -v xclbinutil >/dev/null 2>&1; then
    xclbinutil --input "$resolved_output" --info > "$report_dir/xclbin.info.txt" 2>/dev/null || true
fi

echo "All logs saved to:    $log_dir"
echo "All reports saved to: $report_dir"