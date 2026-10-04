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
depth=${O_ILA_DEPTH:-4096}
part=${O_ILA_PART:-xcu250-figd2104-2L-e}
python_bin=${PYTHON_BIN:-python3}
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

"$python_bin" "$script_dir/patch_o_projection_rtl.py" "$rtl"

export O_ILA_IP_ROOT="$ip_root"
export O_ILA_WORK_DIR="$vivado_dir"
export O_ILA_PART="$part"
export O_ILA_DEPTH="$depth"
"$vivado_bin" -mode batch -nojournal -nolog -notrace \
    -source "$script_dir/create_o_projection_ila_ip.tcl"

if ! grep -Fq 'O_PROJECTION_ILA_RTL_INSTANTIATION' "$rtl"; then
    echo "ERROR: PE0 RTL instrumentation marker is missing after patching." >&2
    exit 1
fi
if [[ ! -s "$ip_root/subcore/ila_o_projection_pe0/ila_o_projection_pe0.xci" ]]; then
    echo "ERROR: packaged ILA XCI is missing." >&2
    exit 1
fi

candidate="$work_dir/instrumented.xo"
(
    cd "$unpack_dir"
    zip -q -r "$candidate" .
)
mv -f "$candidate" "$output_xo"

echo "[OK] HDL-instantiated O-projection ILA XO: $output_xo"
echo "     Source: $source_xo"
echo "     Depth:  $depth"
