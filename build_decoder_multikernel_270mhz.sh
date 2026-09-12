#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Build Script: 4-PE INT4 LLaMA Decoder Multi-Kernel @ 270 MHz on AMD Alveo U250
# 1. Sources Vitis environment settings
# 2. Synthesizes and exports 4 PE XOs from current C++ sources (pe0..pe3)
# 3. Links 4 XOs into final hardware container: int4_decoder_multikernel_270mhz.xclbin
# ==============================================================================

default_vitis_settings="/home/eda/xilinx/Vitis/2023.2/settings64.sh"
default_platform="/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
default_output="int4_decoder_multikernel_270mhz.xclbin"

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

if (( reuse_xo == 1 && rebuild_xo == 1 )); then
    echo "ERROR: REUSE_XO=1 and REBUILD_XO=1 are mutually exclusive." >&2
    exit 2
fi

# ==============================================================================
# Step 0: Source Xilinx Vitis Environment
# ==============================================================================
echo "========================================================================"
echo " [Step 0] Sourcing Vitis Environment"
echo "========================================================================"
if [[ ! -f "$vitis_settings" ]]; then
    echo "ERROR: Vitis settings file does not exist: $vitis_settings" >&2
    echo "Set VITIS_SETTINGS environment variable to point to settings64.sh" >&2
    exit 1
fi

set +u
source "$vitis_settings"
set -u

echo "Vitis environment loaded successfully from: $vitis_settings"

# Verify required executables
for tool in vitis_hls v++ vivado; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: Required tool '$tool' not found in PATH after sourcing settings." >&2
        exit 1
    fi
    echo "  Found $tool: $(command -v "$tool")"
done

# Resolve paths
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd "$source_dir"

hls_script="$source_dir/run_hls_decoder_multikernel.tcl"
config_path="$source_dir/link_decoder_multikernel_270mhz.cfg"

if [[ ! -f "$hls_script" ]]; then
    echo "ERROR: HLS build script not found: $hls_script" >&2
    exit 1
fi
if [[ ! -f "$config_path" ]]; then
    echo "ERROR: Link config not found: $config_path" >&2
    exit 1
fi

xo_files=(
    "$source_dir/int4_decoder_pe0_kernel_270mhz.xo"
    "$source_dir/int4_decoder_pe1_kernel_270mhz.xo"
    "$source_dir/int4_decoder_pe2_kernel_270mhz.xo"
    "$source_dir/int4_decoder_pe3_kernel_270mhz.xo"
)

run_id=$(date +%Y%m%d-%H%M%S)-$$
run_dir="$source_dir/build_multikernel_270mhz/runs/$run_id"
temp_dir="$run_dir/temp"
log_dir="$run_dir/logs"
report_dir="$run_dir/reports"
mkdir -p "$temp_dir" "$log_dir" "$report_dir"

# ==============================================================================
# Step 1: Synthesize and Export 4 PE XOs (Vitis HLS)
# ==============================================================================
echo ""
echo "========================================================================"
echo " [Step 1] Checking / Generating 4 XO Kernels (PE0 .. PE3)"
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
    echo "Starting Vitis HLS synthesis for all 4 PEs (270 MHz)..."
    echo "Log file: $log_dir/vitis_hls_multikernel.log"

    # Make sure no single PE override is set in environment
    unset INT4_DECODER_PE 2>/dev/null || true

    vitis_hls -f "$hls_script" 2>&1 | tee "$log_dir/vitis_hls_multikernel.log"

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
echo " [Step 2] Linking 4 XOs into Hardware Container (.xclbin)"
echo "========================================================================"

if [[ "$output_name" == /* ]]; then
    resolved_output="$output_name"
else
    resolved_output="$source_dir/$output_name"
fi
candidate_output="$run_dir/int4_decoder_multikernel_270mhz.candidate.xclbin"

echo "Platform:       $platform"
echo "Config:         $config_path"
echo "Target Clock:   270 MHz (pe0..3.ap_clk)"
echo "Candidate out:  $candidate_output"
echo "Final out:      $resolved_output"
echo "Log dir:        $log_dir"
echo "Report dir:     $report_dir"
echo ""

set +e
v++ --link \
    --target hw \
    --platform "$platform" \
    --config "$config_path" \
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
