#!/usr/bin/env bash
set -euo pipefail
if (( $# != 1 )); then
    echo "Usage: bash $0 <RUN_DIR printed by deep parallel build>" >&2; exit 2
fi
run_dir=$(realpath "$1")
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
evidence="$run_dir/captures/$(date +%Y%m%d-%H%M%S)-$$"
mkdir -p "$evidence"
data_dir=${DATA_DIR:-/dev/shm/4PE_U250_dense}
sha256sum "$data_dir"/model_bank{0..3}.bin > "$evidence/model_banks.sha256"
export HOST_BIN=${HOST_BIN:-"$repo_root/decode_host"}
# One physical U250 is reprogrammed SERIALly, even though builds ran in parallel.
read -r -a variants <<< "${O_DEEP_VARIANTS:-baseline group_packed group_scalar}"
for variant in "${variants[@]}"; do
    case "$variant" in
        baseline|group_packed|group_scalar|hardened) ;;
        *) echo "Invalid O_DEEP_VARIANTS entry: $variant" >&2; exit 2 ;;
    esac
    export XCLBIN="$run_dir/$variant/int4_decoder_100mhz_o_deep_${variant}.xclbin"
    export O_ILA_LTX="${XCLBIN}.ltx"
    test -s "$XCLBIN"; test -s "$O_ILA_LTX"; test -s "${XCLBIN}.deep.json"
    for point in input_write deep partial; do
        export O_ILA_EVIDENCE_DIR="$evidence/$variant/$point"
        export O_ILA_CAPTURE_DIR="$O_ILA_EVIDENCE_DIR/capture"
        case "$point" in
            input_write) export O_ILA_TRIGGER_POSITION=960 ;;
            deep) export O_ILA_TRIGGER_POSITION=512 ;;
            partial) export O_ILA_TRIGGER_POSITION=64 ;;
        esac
        export O_DEEP_TRIGGER_WORD=0
        bash "$script_dir/run_o_projection_capture.sh" "$point"
    done
done
archive="$run_dir/o_projection_deep_evidence_$(basename "$evidence").tar.gz"
tar -czf "$archive" -C "$run_dir" "${evidence#"$run_dir/"}"
echo "PASS DEEP_SUITE ARCHIVE=$archive"
