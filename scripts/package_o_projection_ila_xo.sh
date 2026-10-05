#!/usr/bin/env bash
set -euo pipefail

if (( $# != 2 )); then
    echo "Usage: $0 <source-pe0.xo> <instrumented-pe0.xo>" >&2
    exit 2
fi

source_xo=$(realpath "$1")
output_xo=$(realpath -m "$2")
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
depth=${O_ILA_DEPTH:-1024}
control_depth=${O_ILA_CONTROL_DEPTH:-1024}
part=${O_ILA_PART:-xcu250-figd2104-2L-e}
if [[ -n "${PYTHON_BIN:-}" ]]; then
    python_bin=$PYTHON_BIN
elif [[ -x /usr/bin/python3 ]]; then
    python_bin=/usr/bin/python3
else
    python_bin=python3
fi
vivado_bin=${VIVADO_BIN:-vivado}

for tool in unzip zip "$python_bin" "$vivado_bin"; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: required tool '$tool' is not available." >&2
        exit 1
    fi
done
if [[ ! -s "$source_xo" ]]; then
    echo "ERROR: source XO is missing or empty: $source_xo" >&2
    exit 1
fi

output_dir=$(dirname -- "$output_xo")
mkdir -p "$output_dir"
work_dir=$(mktemp -d "$output_dir/.o_projection_ila_xo.XXXXXX")
cleanup() {
    if [[ -n "${work_dir:-}" && -d "$work_dir" && "$work_dir" == "$output_dir"/.o_projection_ila_xo.* ]]; then
        rm -rf -- "$work_dir"
    fi
}
trap cleanup EXIT

unpack_dir="$work_dir/unpacked"
vivado_dir="$work_dir/vivado"
mkdir -p "$unpack_dir" "$vivado_dir"
unzip -q "$source_xo" -d "$unpack_dir"

component=$(find "$unpack_dir/ip_repo" -mindepth 2 -maxdepth 2 \
    -type f -name component.xml -print -quit)
if [[ -z "$component" ]]; then
    echo "ERROR: source XO contains no packaged HLS component.xml." >&2
    exit 1
fi
ip_root=$(dirname -- "$component")
rtl=$(find "$ip_root/hdl/verilog" -maxdepth 1 -type f \
    -name '*int4_decoder_local_pe_0.v' -print -quit)
if [[ -z "$rtl" ]]; then
    echo "ERROR: PE0 local-controller RTL was not found in the source XO." >&2
    exit 1
fi

# Vitis/Vivado prepend their bundled libraries to LD_LIBRARY_PATH.  Loading
# those libraries into the host Python can fail with _Py_LegacyLocaleDetected.
# Clean only the Python subprocess; Vivado and v++ retain the Xilinx environment.
env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH \
    "$python_bin" "$script_dir/patch_o_projection_rtl.py" "$rtl"

export O_ILA_IP_ROOT="$ip_root"
export O_ILA_WORK_DIR="$vivado_dir"
export O_ILA_PART="$part"
export O_ILA_DEPTH="$depth"
export O_ILA_CONTROL_DEPTH="$control_depth"
"$vivado_bin" -mode batch -nojournal -nolog -notrace \
    -source "$script_dir/create_o_projection_ila_ip.tcl"

if ! grep -Fq 'O_PROJECTION_FORENSIC_ILA_V3' "$rtl"; then
    echo "ERROR: PE0 forensic RTL instrumentation marker is missing after patching." >&2
    exit 1
fi
for core in ila_o_projection_pe0_control ila_o_projection_pe0_data; do
    if [[ ! -s "$ip_root/subcore/$core/$core.xci" ]]; then
        echo "ERROR: packaged forensic ILA XCI is missing: $core" >&2
        exit 1
    fi
done

candidate="$work_dir/instrumented.xo"
(
    cd "$unpack_dir"
    zip -q -r "$candidate" .
)
mv -f "$candidate" "$output_xo"

echo "[OK] Comprehensive HDL-instantiated O-projection forensic XO: $output_xo"
echo "     Source:        $source_xo"
echo "     Control depth: $control_depth"
echo "     Data depth:    $depth"
