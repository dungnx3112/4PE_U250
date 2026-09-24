#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# build_hw_emu.sh
# Build 4 XO Kernels & Link Hardware Emulation (hw_emu) for Alveo U250
#
# Usage:
#   bash scripts/build_hw_emu.sh build      # Rebuild XOs (if needed) & link hw_emu xclbin
#   bash scripts/build_hw_emu.sh run        # Run hw_emu with decode_host
#   bash scripts/build_hw_emu.sh all        # Build and run sequentially
#
# Options / Overrides:
#   REBUILD_XO=1            Force re-synthesis of all 4 XO kernels
#   U250_PLATFORM=...       Override path to U250 .xpfm
#   GUI=1                   Launch live Vivado GUI for waveform instead of batch .wdb
# ==============================================================================

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
cd "$repo_root"

default_platform="${HOME}/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
default_output="int4_decoder_hw_emu.xclbin"
default_vitis_settings="/home/eda/xilinx/Vitis/2023.2/settings64.sh"

action="${1:-build}"
case "$action" in
    build|run|all|-h|--help) ;;
    *)
        echo "Usage: $0 [build|run|all]" >&2
        exit 1
        ;;
esac

if [[ "$action" == "-h" || "$action" == "--help" ]]; then
    cat <<EOF
Usage: $0 [action]

Actions:
  build (default) : Synthesize XOs and link int4_decoder_hw_emu.xclbin
  run             : Run emulation using decode_host (dumps waveform .wdb)
  all             : Build and then run

Environment:
  REBUILD_XO=1    : Force HLS re-synthesis of all 4 XOs (pe0..pe3)
  U250_PLATFORM   : Path to xilinx_u250...xpfm
  GUI=1           : Open Vivado Waveform GUI interactively (requires X11)
  PROMPT="Hi"     : Prompt for decode_host run (default: "Hi")
  MAX_TOKENS=2    : Max tokens to generate during emulation test
EOF
    exit 0
fi

# 1. Environment Detection
if ! command -v v++ >/dev/null 2>&1; then
    if [[ -f "$default_vitis_settings" ]]; then
        echo "[+] Sourcing Vitis 2023.2 environment from $default_vitis_settings"
        # shellcheck source=/dev/null
        source "$default_vitis_settings"
    elif [[ -f "/opt/xilinx/Vitis/2023.2/settings64.sh" ]]; then
        # shellcheck source=/dev/null
        source "/opt/xilinx/Vitis/2023.2/settings64.sh"
    fi
fi

if [[ -f "/opt/xilinx/xrt/setup.sh" ]]; then
    # shellcheck source=/dev/null
    source "/opt/xilinx/xrt/setup.sh"
fi

# Locate Platform .xpfm
platform="${U250_PLATFORM:-$default_platform}"
if [[ ! -f "$platform" ]]; then
    candidate_platforms=(
        "${repo_root}/../u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
        "${HOME}/u250_platform/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
        "/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm"
    )
    found=0
    for cand in "${candidate_platforms[@]}"; do
        if [[ -f "$cand" ]]; then
            platform="$cand"
            found=1
            break
        fi
    done
    if (( found == 0 )); then
        echo "[-] ERROR: Alveo U250 platform (.xpfm) not found!" >&2
        echo "    Checked: $platform" >&2
        exit 1
    fi
fi
echo "[+] Using Platform: $platform"

build_all() {
    echo "========================================================================"
    echo " [Step 1] Checking / Generating 4 XO Kernels (PE0 .. PE3) @ 300 MHz"
    echo "========================================================================"

    build_dir="$repo_root/build_hw_emu"
    log_dir="$build_dir/logs"
    temp_dir="$build_dir/temp"
    report_dir="$build_dir/reports"
    mkdir -p "$log_dir" "$temp_dir" "$report_dir"

    xo_paths=(
        "$repo_root/int4_decoder_pe0_kernel_300mhz.xo"
        "$repo_root/int4_decoder_pe1_kernel_300mhz.xo"
        "$repo_root/int4_decoder_pe2_kernel_300mhz.xo"
        "$repo_root/int4_decoder_pe3_kernel_300mhz.xo"
    )

    hls_sources=(
        "$repo_root/kernel_HLS/swiftkv_attention.cpp"
        "$repo_root/kernel_HLS/swiftkv_attention.hpp"
        "$repo_root/kernel_HLS/int4_linear_controller.cpp"
        "$repo_root/kernel_HLS/int4_linear_controller.hpp"
        "$repo_root/kernel_HLS/int4_decoder_blocks.cpp"
        "$repo_root/kernel_HLS/int4_decoder_blocks.hpp"
        "$repo_root/kernel_HLS/int4_decoder_controller.cpp"
        "$repo_root/kernel_HLS/int4_decoder_controller.hpp"
        "$repo_root/kernel_HLS/int4_decoder_multikernel.cpp"
        "$repo_root/kernel_HLS/int4_decoder_multikernel.hpp"
    )

    rebuild_xo="${REBUILD_XO:-0}"
    need_hls=0

    if (( rebuild_xo == 1 )); then
        echo "[!] REBUILD_XO=1: Forcing re-synthesis of all 4 XOs..."
        need_hls=1
    else
        for xo in "${xo_paths[@]}"; do
            if [[ ! -s "$xo" ]]; then
                echo "[!] XO missing or empty: $(basename "$xo")"
                need_hls=1
                break
            fi
            xo_time=$(stat -c %Y "$xo" 2>/dev/null || stat -f %m "$xo")
            for src in "${hls_sources[@]}"; do
                src_time=$(stat -c %Y "$src" 2>/dev/null || stat -f %m "$src")
                if (( src_time > xo_time )); then
                    echo "[!] Source modified ($(basename "$src")) newer than $(basename "$xo")"
                    need_hls=1
                    break 2
                fi
            done
        done
    fi

    if (( need_hls == 1 )); then
        echo "[+] Launching Vitis HLS synthesis for PE0..PE3 in parallel..."
        export TARGET_FREQ="300mhz"
        hls_pids=()
        for pe in 0 1 2 3; do
            (
                export INT4_DECODER_PE="$pe"
                vitis_hls -f "$script_dir/run_hls_decoder_multikernel.tcl" \
                    > "$log_dir/vitis_hls_pe${pe}.log" 2>&1
            ) &
            hls_pids+=($!)
            echo "    Started PE$pe synthesis (PID: ${hls_pids[-1]})"
        done

        hls_failed=0
        for idx in 0 1 2 3; do
            pid=${hls_pids[$idx]}
            if ! wait "$pid"; then
                echo "[-] ERROR: Vitis HLS synthesis failed for PE$idx. See log: $log_dir/vitis_hls_pe${idx}.log" >&2
                hls_failed=1
            else
                echo "[+] PE$idx HLS synthesis finished successfully."
            fi
        done

        if (( hls_failed == 1 )); then
            all_xo_ok=1
            for xo in "${xo_paths[@]}"; do
                if [[ ! -s "$xo" ]]; then
                    all_xo_ok=0
                    break
                fi
            done
            if (( all_xo_ok == 1 )); then
                echo "[!] WARNING: One HLS worker exited with status code, but all 4 XO files are present and valid. Continuing..."
            else
                echo "[-] HLS generation failed. Aborting." >&2
                exit 1
            fi
        fi
    else
        echo "[+] All 4 XO files are up to date. Skipping HLS synthesis."
    fi

    # Verify all 4 XOs exist
    for xo in "${xo_paths[@]}"; do
        if [[ ! -s "$xo" ]]; then
            echo "[-] ERROR: Expected XO not found: $xo" >&2
            exit 1
        fi
        echo "    $(basename "$xo") : $(du -h "$xo" | cut -f1)"
    done

    echo "========================================================================"
    echo " [Step 2] Linking hw_emu Container ($default_output)"
    echo "========================================================================"

    # Prepare hw_emu config (retaining connectivity & clock, omitting physical P&R directives)
    config_hw_emu="$temp_dir/link_hw_emu.cfg"
    grep -v -E "prop=run.impl_1" "$script_dir/link_decoder_multikernel_300mhz.cfg" > "$config_hw_emu"

    echo "[+] Running v++ --link --target hw_emu -g ..."
    echo "    Output: $repo_root/$default_output"
    echo "    Config: $config_hw_emu"

    v++ --link \
        --target hw_emu \
        --platform "$platform" \
        --config "$config_hw_emu" \
        -g \
        --save-temps \
        --temp_dir "$temp_dir" \
        --log_dir "$log_dir" \
        --report_dir "$report_dir" \
        --output "$repo_root/$default_output" \
        "${xo_paths[@]}"

    if [[ ! -s "$repo_root/$default_output" ]]; then
        echo "[-] ERROR: v++ failed to produce $default_output. Check logs in $log_dir" >&2
        exit 1
    fi

    echo "========================================================================"
    echo " [Step 3] Generating Emulation Configuration (emconfig.json & xrt.ini)"
    echo "========================================================================"

    emconfigutil --platform "$platform" --nd 1
    echo "[+] Generated emconfig.json successfully."

    gui_mode="${GUI:-0}"
    launch_mode="batch"
    if (( gui_mode == 1 )); then
        launch_mode="gui"
    fi

    cat > "$repo_root/xrt.ini" <<EOF
[Runtime]
verbosity = 4
runtime_log = console

[Emulation]
launch_waveform = ${launch_mode}
debug_mode = batch

[Debug]
profile = true
timeline_trace = true
device_trace = fine
stall_trace = all
continuous_trace = true
EOF
    echo "[+] Configured xrt.ini (launch_waveform = ${launch_mode})"

    # Also build decode_host if not present
    if [[ ! -x "$repo_root/decode_host" ]]; then
        echo "[+] Building decode_host..."
        bash "$script_dir/build_decode_host.sh"
    fi

    echo "========================================================================"
    echo "[+] SUCCESS: hw_emu container ready: $default_output"
    echo "========================================================================"
    echo "To run emulation now, execute:"
    echo "    bash scripts/build_hw_emu.sh run"
}

run_emu() {
    echo "========================================================================"
    echo " Running Hardware Emulation (hw_emu)"
    echo "========================================================================"

    if [[ ! -s "$repo_root/$default_output" ]]; then
        echo "[-] ERROR: $default_output not found. Run 'bash scripts/build_hw_emu.sh build' first." >&2
        exit 1
    fi

    if [[ ! -f "$repo_root/emconfig.json" ]]; then
        echo "[+] Generating missing emconfig.json..."
        emconfigutil --platform "$platform" --nd 1
    fi

    if [[ ! -x "$repo_root/decode_host" || "$repo_root/host/decode_host.cpp" -nt "$repo_root/decode_host" ]]; then
        echo "[+] Building decode_host..."
        bash "$script_dir/build_decode_host.sh"
    fi

    prompt="${PROMPT:-Hi}"
    max_tokens="${MAX_TOKENS:-2}"

    echo "[*] Setting XCL_EMULATION_MODE=hw_emu"
    export XCL_EMULATION_MODE=hw_emu

    echo "[*] Launching decode_host in emulation mode (device: 0, prompt: \"$prompt\", max_tokens: $max_tokens)..."
    ./decode_host \
        --xclbin "$default_output" \
        --device 0 \
        --banks . \
        --rope rope_lut.bin \
        --tokenizer tokenizer.bin \
        --prompt "$prompt" \
        --max-tokens "$max_tokens"

    echo "========================================================================"
    echo "[+] Emulation run finished!"
    echo "    Waveform databases (.wdb) or trace files (.csv / .run) are in this directory."
    echo "    You can copy any .wdb file to Windows and open it in Vivado to inspect cycle waveforms."
    echo "========================================================================"
}

if [[ "$action" == "build" ]]; then
    build_all
elif [[ "$action" == "run" ]]; then
    run_emu
elif [[ "$action" == "all" ]]; then
    build_all
    run_emu
fi
