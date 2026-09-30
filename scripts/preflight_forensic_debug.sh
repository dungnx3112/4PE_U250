#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
vitis_settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}

if ! command -v vitis_hls >/dev/null 2>&1; then
    if [[ ! -f "$vitis_settings" ]]; then
        echo "ERROR: Vitis settings not found: $vitis_settings" >&2
        exit 1
    fi
    set +u
    source "$vitis_settings"
    set -u
fi
if [[ -f /opt/xilinx/xrt/setup.sh ]]; then
    set +u
    source /opt/xilinx/xrt/setup.sh
    set -u
fi

cxx=/home/eda/xilinx/Vivado/2023.2/tps/lnx64/gcc-9.3.0/bin/g++
if [[ ! -x "$cxx" ]]; then
    cxx=$(command -v g++ || true)
fi
if [[ -z "$cxx" || ! -x "$cxx" ]]; then
    echo "ERROR: no usable C++ compiler for forensic preflight" >&2
    exit 1
fi

tmp_dir=$(mktemp -d "${TMPDIR:-/tmp}/4pe-forensic-preflight.XXXXXX")
trap 'rm -rf -- "$tmp_dir"' EXIT

echo "[Preflight] software oracle syntax/link"
"$cxx" -O2 -std=c++14 \
    "$repo_root/software_sim/llama2_decoder_sw_emulator.cpp" \
    -o "$tmp_dir/runq.exe" -static-libgcc -static-libstdc++

echo "[Preflight] host debug ABI syntax/link"
"$cxx" -O2 -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=0 \
    -I"${XILINX_XRT:-/opt/xilinx/xrt}/include" \
    -I"$repo_root/host/include" \
    "$repo_root/host/decode_host.cpp" -o "$tmp_dir/decode_host_forensic" \
    -L"${XILINX_XRT:-/opt/xilinx/xrt}/lib" -lxrt_coreutil -pthread \
    -static-libstdc++ -static-libgcc

echo "[Preflight] analyzer syntax"
cd "$repo_root"
env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH \
    /usr/bin/python3 -c \
    'import ast, pathlib; ast.parse(pathlib.Path("scripts/analyze_stage_trace.py").read_text())'

if [[ "${RUN_RTL_COSIM:-0}" == "1" ]]; then
    echo "[Preflight] HLS C/RTL co-simulation for Q/O/Gate/Down/Logits"
    vitis_hls -f scripts/run_hls_deep_trace_rtl_cosim.tcl
else
    echo "[Preflight] HLS C simulation for Q/O/Gate/Down/Logits trace shapes"
    vitis_hls -f scripts/run_hls_deep_o_trace_test.tcl
fi

echo "[Preflight] PASS"
