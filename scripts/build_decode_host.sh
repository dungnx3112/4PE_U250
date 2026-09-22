#!/usr/bin/env bash
set -e

# ==============================================================================
# build_decode_host.sh
# Build script for XRT host driver (decode_host) on CentOS 7 / EDA server
# ==============================================================================

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

# 1. Setup XRT environment
if [ -z "$XILINX_XRT" ]; then
    if [ -f "/opt/xilinx/xrt/setup.sh" ]; then
        source /opt/xilinx/xrt/setup.sh
    else
        export XILINX_XRT="/opt/xilinx/xrt"
    fi
fi
echo "[+] Using XILINX_XRT: $XILINX_XRT"

# 2. Locate a modern C++17 compiler (GCC >= 7 preferred, e.g. GCC 9.3.0 from Vivado)
CANDIDATES=(
    "$XILINX_VIVADO/tps/lnx64/gcc-9.3.0/bin/g++"
    "/home/eda/xilinx/Vivado/2023.2/tps/lnx64/gcc-9.3.0/bin/g++"
    "/home/eda/xilinx/Vitis/2023.2/tps/lnx64/gcc-9.3.0/bin/g++"
    $(ls -d /home/eda/xilinx/Vivado/*/tps/lnx64/gcc-9*/bin/g++ 2>/dev/null | sort -V | tail -n 1)
    $(ls -d /home/eda/xilinx/Vitis/*/tps/lnx64/gcc-9*/bin/g++ 2>/dev/null | sort -V | tail -n 1)
    $(ls -d /opt/rh/devtoolset-*/root/usr/bin/g++ 2>/dev/null | sort -V | tail -n 1)
    $(ls -d $VITIS_ROOT/tps/lnx64/gcc*/bin/g++ 2>/dev/null | sort -V | tail -n 1)
    $(which g++ 2>/dev/null)
)

CHOSEN_CXX=""
for c in "${CANDIDATES[@]}"; do
    if [ -n "$c" ] && [ -x "$c" ]; then
        CHOSEN_CXX="$c"
        # If it is gcc-9 or higher, break immediately
        if "$c" -dumpversion 2>&1 | grep -qE "^([789]|1[0-9])\."; then
            break
        fi
    fi
done

if [ -z "$CHOSEN_CXX" ]; then
    echo "[-] ERROR: No suitable g++ found!"
    exit 1
fi

echo "[+] Selected compiler: $CHOSEN_CXX"
$CHOSEN_CXX --version | head -n 1

# 3. Determine C++ standard flag
STD_FLAG="-std=c++17"
if $CHOSEN_CXX -dumpversion 2>&1 | grep -qE "^[456]\."; then
    echo "[!] Compiler version < 7 detected. Enabling C++1z and local boost shim..."
    STD_FLAG="-std=c++1z"
fi

# 4. Compilation command
# Note: -static-libstdc++ -static-libgcc is critical on CentOS 7 to avoid GLIBCXX mismatch at runtime
CMD=(
    "$CHOSEN_CXX"
    $STD_FLAG
    "-O2"
    "-D_GLIBCXX_USE_CXX11_ABI=0"
    "-I$XILINX_XRT/include"
    "-I$REPO_DIR/host/include"
    "host/decode_host.cpp"
    "-o" "decode_host"
    "-L$XILINX_XRT/lib"
    "-lxrt_coreutil"
    "-pthread"
    "-static-libstdc++"
    "-static-libgcc"
)

echo "[+] Compiling decode_host:"
echo "    ${CMD[*]}"
"${CMD[@]}"

echo "================================================================="
echo "[+] SUCCESS: Built ./decode_host successfully!"
ls -lh ./decode_host
echo "================================================================="
echo "[*] Quick test command on U250 (device 0000:13:00.0):"
echo "    ./decode_host \\"
echo "        --xclbin int4_decoder_multikernel_300mhz.xclbin \\"
echo "        --device 0000:13:00.0 \\"
echo "        --banks . \\"
echo "        --rope rope_lut.bin \\"
echo "        --tokenizer tokenizer.bin \\"
echo "        --prompt \"Hello\" \\"
echo "        --max-tokens 20"
echo "================================================================="
