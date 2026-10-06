#!/usr/bin/env bash
set -euo pipefail

if (( $# < 1 || $# > 2 )); then
    echo "Usage: $0 <run-directory> [output-xclbin]" >&2
    exit 2
fi

run_dir=$(cd -- "$1" && pwd -P)
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
output=${2:-$repo_root/int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin}
if [[ "$output" != /* ]]; then
    output="$PWD/$output"
fi
output_dir=$(dirname -- "$output")
mkdir -p "$output_dir"
output_dir=$(cd -- "$output_dir" && pwd -P)
output="$output_dir/$(basename -- "$output")"

candidate="$run_dir/int4_decoder_multikernel_300mhz.candidate.xclbin"
ltx="$run_dir/int4_decoder_multikernel_300mhz.candidate.ltx"

for artifact in "$candidate" "$ltx"; do
    if [[ ! -s "$artifact" ]]; then
        echo "ERROR: missing or empty build artifact: $artifact" >&2
        exit 1
    fi
done

for ila_instance in \
    ila_o_projection_pe0_control_inst \
    ila_o_projection_pe0_data_inst; do
    if ! grep -aFqi "$ila_instance" "$ltx"; then
        echo "ERROR: '$ila_instance' is missing from: $ltx" >&2
        exit 1
    fi
done

timestamp=$(date +%Y%m%d-%H%M%S)
for old_artifact in "$output" "${output}.ltx" "${output}.sha256"; do
    if [[ -e "$old_artifact" ]]; then
        backup="${old_artifact}.before-${timestamp}"
        cp -p -- "$old_artifact" "$backup"
        echo "[OK] Preserved previous artifact: $backup"
    fi
done

cp -p -- "$candidate" "$output"
cp -p -- "$ltx" "${output}.ltx"
sha256sum "$output" > "${output}.sha256"

echo ""
echo "PASS O_PROJECTION_CANDIDATE_PUBLISHED"
echo "XCLBIN=$output"
echo "LTX=${output}.ltx"
echo "SHA256=${output}.sha256"
