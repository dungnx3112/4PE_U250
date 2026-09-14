#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Standalone OOC Place & Route @ 300 MHz on AMD Alveo U250
# NO XPFM / NO VITIS PLATFORM / NO XCLBIN REQUIRED
# 1. Sources Vivado/Vitis environment
# 2. Runs HLS synthesis for 4 PEs (if not yet generated)
# 3. Runs pure Vivado OOC PnR across 4 SLRs @ 300 MHz
# 4. Prints WNS, WHS, Achieved Fmax
# ==============================================================================

default_vitis_settings="/home/eda/xilinx/Vitis/2023.2/settings64.sh"
vitis_settings=${VITIS_SETTINGS:-$default_vitis_settings}
rebuild_hls=${REBUILD_HLS:-0}

# Step 0: Source Vivado/Vitis Environment
if command -v vivado >/dev/null 2>&1 && command -v vitis_hls >/dev/null 2>&1; then
    echo "Vivado and Vitis HLS tools already found in environment PATH."
else
    if [[ ! -f "$vitis_settings" ]]; then
        for cand in \
            "/home/eda/xilinx/Vitis/2023.2/settings64.sh" \
            "/tools/Xilinx/Vitis/2023.2/settings64.sh" \
            "/opt/xilinx/Vitis/2023.2/settings64.sh" \
            "/opt/Xilinx/Vitis/2023.2/settings64.sh"; do
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
        echo "Environment loaded from: $vitis_settings"
    else
        echo "ERROR: Vitis settings file not found: $vitis_settings" >&2
        echo "Please set VITIS_SETTINGS or ensure vivado/vitis_hls are in PATH." >&2
        exit 1
    fi
fi

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
cd "$source_dir"

# Step 1: Check if HLS RTL exists for all 4 PEs
need_hls=0
if (( rebuild_hls == 1 )); then
    echo "REBUILD_HLS=1: Forcing full re-synthesis of all 4 PEs..."
    need_hls=1
else
    for pe in 0 1 2 3; do
        vdir_300="$source_dir/proj_int4_decoder_pe${pe}/solution_300mhz/syn/verilog"
        vdir_270="$source_dir/proj_int4_decoder_pe${pe}/solution_270mhz/syn/verilog"
        if [[ ! -d "$vdir_300" && ! -d "$vdir_270" ]]; then
            echo "Synthesized Verilog missing for PE${pe}. Running HLS..."
            need_hls=1
            break
        fi
    done
fi

if (( need_hls == 1 )); then
    echo "Running Vitis HLS synthesis for 4 PEs (300 MHz)..."
    export TARGET_FREQ="300mhz"
    unset INT4_DECODER_PE 2>/dev/null || true
    vitis_hls -f "$source_dir/run_hls_decoder_multikernel.tcl"
fi

# Step 2: Run Standalone Vivado PnR @ 300 MHz
echo ""
echo "========================================================================"
echo " Running Standalone Vivado Place & Route @ 300 MHz (OOC, no xpfm)"
echo "========================================================================"
pnr_tcl="$source_dir/run_pnr_decoder_multikernel_300mhz.tcl"
log_file="$source_dir/pnr_300mhz.log"
jou_file="$source_dir/pnr_300mhz.jou"

vivado -mode batch -notrace \
    -source "$pnr_tcl" \
    -log "$log_file" \
    -journal "$jou_file"

echo ""
echo "PnR execution finished. Check $log_file for full log."