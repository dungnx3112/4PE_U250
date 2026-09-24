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
default_platform="${HOME}/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
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
  ENABLE_STALL_PROFILE=1
                    Add HLS stall ports and XRT AXI/stall monitors. This mode
                    rebuilds XOs unless REUSE_XO=1, then links debug metadata.
  DEBUG_CLOCK_HZ=N  Link clock for profile builds (default: 150000000). The
                    production build remains fixed at 300000000 Hz.
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
enable_stall_profile=${ENABLE_STALL_PROFILE:-0}
debug_clock_hz=${DEBUG_CLOCK_HZ:-150000000}
detected_jobs=$(nproc 2>/dev/null || echo 32)
if (( detected_jobs < 8 )); then
    detected_jobs=32
fi
jobs=${JOBS:-$detected_jobs}

if [[ "$enable_stall_profile" != "0" && "$enable_stall_profile" != "1" ]]; then
    echo "ERROR: ENABLE_STALL_PROFILE must be 0 or 1." >&2
    exit 2
fi

link_clock_hz=300000000
if (( enable_stall_profile == 1 )); then
    if [[ ! "$debug_clock_hz" =~ ^[0-9]+$ ]] ||
       (( debug_clock_hz < 100000000 || debug_clock_hz > 300000000 )); then
        echo "ERROR: DEBUG_CLOCK_HZ must be an integer from 100000000 to 300000000." >&2
        exit 2
    fi
    link_clock_hz=$debug_clock_hz
fi

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

# Resolve paths
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
if [[ -d "$script_dir/kernel_HLS" ]]; then
    repo_root="$script_dir"
    scripts_dir="$script_dir/scripts"
else
    repo_root=$(cd -- "$script_dir/.." && pwd -P)
    scripts_dir="$script_dir"
fi
source_dir="$repo_root/kernel_HLS"
cd "$repo_root"

# Auto-detect U250 platform (.xpfm) across standard installation and user directories
target_xpfm="xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
found_platform=""

candidates=(
    "${platform}"
    "${repo_root}/../u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/${target_xpfm}"
    "${HOME}/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/${target_xpfm}"
    "/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/${target_xpfm}"
    "${repo_root}/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/${target_xpfm}"
)

for cand in "${candidates[@]}"; do
    if [[ -n "$cand" && -f "$cand" ]]; then
        found_platform="$(cd "$(dirname "$cand")" && pwd)/$(basename "$cand")"
        break
    fi
done

if [[ -z "$found_platform" ]]; then
    for search_root in "${repo_root}/.." "${HOME}/u250_platform" "${HOME}"; do
        if [[ -d "$search_root" ]]; then
            searched=$(find "$search_root" -maxdepth 6 -name "$target_xpfm" 2>/dev/null | head -n 1)
            if [[ -n "$searched" && -f "$searched" ]]; then
                found_platform="$(cd "$(dirname "$searched")" && pwd)/$(basename "$searched")"
                break
            fi
        fi
    done
fi

if [[ -n "$found_platform" ]]; then
    platform="$found_platform"
    export PLATFORM_REPO_PATHS="$(dirname "$(dirname "$(dirname "$platform")")")"
    echo "[+] Found U250 platform: $platform"
    echo "    Exported PLATFORM_REPO_PATHS=$PLATFORM_REPO_PATHS"
elif [[ ! -f "$platform" ]]; then
    short_platform="xilinx_u250_gen3x16_xdma_4_1_202210_1"
    echo "NOTE: Platform path '$platform' not found as a direct file."
    echo "      Attempting platform name: '$short_platform'"
    platform="$short_platform"
fi

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

if (( enable_stall_profile == 1 )); then
    xo_output_dir="$repo_root/build_multikernel_300mhz/profile_xo"
else
    xo_output_dir="$repo_root"
fi
mkdir -p "$xo_output_dir"
xo_files=(
    "$xo_output_dir/int4_decoder_pe0_kernel_300mhz.xo"
    "$xo_output_dir/int4_decoder_pe1_kernel_300mhz.xo"
    "$xo_output_dir/int4_decoder_pe2_kernel_300mhz.xo"
    "$xo_output_dir/int4_decoder_pe3_kernel_300mhz.xo"
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
if (( enable_stall_profile == 1 && reuse_xo != 1 )); then
    echo "ENABLE_STALL_PROFILE=1: rebuilding all XOs with HLS kernel-profile ports."
    need_hls=1
elif (( rebuild_xo == 1 )); then
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
    export ENABLE_STALL_PROFILE="$enable_stall_profile"
    export XO_OUTPUT_DIR="$xo_output_dir"
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
            echo "=== HLS errors for PE$pe ===" >&2
            grep -nE 'ERROR:|CRITICAL WARNING:|FATAL:|Synthesis failed' \
                "$log_dir/vitis_hls_pe${pe}.log" | tail -n 80 >&2 || true
            echo "=== Last 80 lines of $log_dir/vitis_hls_pe${pe}.log ===" >&2
            tail -n 80 "$log_dir/vitis_hls_pe${pe}.log" >&2
            hls_failed=1
        else
            echo "  [PE$pe] HLS synthesis completed successfully."
        fi
    done

    if (( hls_failed == 1 )); then
        all_xo_ok=1
        for xo in "${xo_files[@]}"; do
            if [[ ! -s "$xo" ]]; then
                all_xo_ok=0
                break
            fi
        done
        if (( all_xo_ok == 1 )); then
            echo "WARNING: One or more HLS worker processes returned non-zero status, but all 4 XO files were successfully generated. Continuing to link..."
        else
            echo "ERROR: One or more HLS synthesis tasks failed." >&2
            exit 1
        fi
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
echo " [Step 2] Linking 4 XOs into Hardware Container (.xclbin) @ ${link_clock_hz} Hz"
echo "========================================================================"

if [[ "$output_name" == /* ]]; then
    resolved_output="$output_name"
else
    resolved_output="$repo_root/$output_name"
fi
candidate_output="$run_dir/int4_decoder_multikernel_300mhz.candidate.xclbin"

echo "Platform:       $platform"
echo "Config:         $config_path"
echo "Target Clock:   ${link_clock_hz} Hz (pe0..3.ap_clk)"
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
    -e "s|^freqhz=.*|freqhz=${link_clock_hz}:pe0.ap_clk,pe1.ap_clk,pe2.ap_clk,pe3.ap_clk|g" \
    -e "s|__PRE_PLACE_TCL__|${pre_place_tcl}|g" \
    -e "s|__PRE_PHYSOPT_TCL__|${pre_physopt_tcl}|g" \
    -e "s|synth.jobs=.*|synth.jobs=${synth_jobs}|g" \
    -e "s|impl.jobs=.*|impl.jobs=${impl_jobs}|g" \
    "$config_path" > "$config_patched"

if (( enable_stall_profile == 1 )); then
    cat >> "$config_patched" <<'EOF'

[profile]
# Only insert CU stall monitors. Profiling every AXI/AXIS interface with
# data=all is too large for this four-SLR design and can fail in vpl.update_bd.
stall=all:all:all
EOF
fi
echo "  Patched config: $config_patched"
echo "    pre_place.tcl   -> $pre_place_tcl"
echo "    pre_physopt.tcl -> $pre_physopt_tcl"

vpp_debug_flag=""
if (( enable_stall_profile == 1 )); then
    vpp_debug_flag="-g"
fi

v++ --link \
    --target hw \
    --platform "$platform" \
    --config "$config_patched" \
    $vpp_debug_flag \
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

if (( enable_stall_profile == 1 )); then
    if ! command -v xclbinutil >/dev/null 2>&1; then
        echo "ERROR: xclbinutil is required to verify the profile xclbin." >&2
        exit 1
    fi
    debug_layout="$report_dir/debug_ip_layout.json"
    if ! xclbinutil --input "$candidate_output" \
        --dump-section "DEBUG_IP_LAYOUT:JSON:$debug_layout" \
        > "$log_dir/xclbinutil_debug_layout.log" 2>&1 || [[ ! -s "$debug_layout" ]]; then
        echo "ERROR: profile build has no readable DEBUG_IP_LAYOUT section." >&2
        echo "       Refusing to publish a debug xclbin that cannot produce traces." >&2
        echo "       See: $log_dir/xclbinutil_debug_layout.log" >&2
        exit 1
    fi
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

if (( enable_stall_profile == 1 )); then
    profile_ini="${resolved_output}.xrt.ini"
    cat > "$profile_ini" <<'EOF'
[Runtime]
verbosity = 3
runtime_log = console

[Debug]
native_xrt_trace = true
device_trace = fine
stall_trace = all
continuous_trace = true
trace_buffer_size = 64M
EOF
    echo "XRT profile config:   $profile_ini"
    echo "NOTE: Run the host through scripts/debug_u250_deadlock.sh so the trace"
    echo "      is written into an isolated evidence directory."
fi

echo "All logs saved to:    $log_dir"
echo "All reports saved to: $report_dir"
