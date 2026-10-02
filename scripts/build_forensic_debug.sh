#!/usr/bin/env bash
set -euo pipefail

# The expensive, one-time forensic build.  It combines the runtime-selectable
# deep linear trace ABI with all twelve inter-PE AXIS monitors/checkers/ILAs.
# Changing --trace-layer/--trace-mode/--kv-layer later does not rebuild XOs.
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

export ENABLE_LAYER_TRACE=1
export ENABLE_STALL_PROFILE=1
export ENABLE_FULL_STREAM_DEBUG=1
export DEBUG_CLOCK_HZ=${DEBUG_CLOCK_HZ:-200000000}
export REBUILD_XO=${REBUILD_XO:-1}
export XCLBIN_OUTPUT=${XCLBIN_OUTPUT:-int4_decoder_multikernel_200mhz_forensic_debug.xclbin}

run_preflight=${RUN_FORENSIC_PREFLIGHT:-0}
if [[ "$run_preflight" != "0" && "$run_preflight" != "1" ]]; then
    echo "ERROR: RUN_FORENSIC_PREFLIGHT must be 0 or 1." >&2
    exit 2
fi
if (( run_preflight == 1 )); then
    bash "$script_dir/preflight_forensic_debug.sh"
else
    echo "[Preflight] SKIPPED (RUN_FORENSIC_PREFLIGHT=0); building XOs/XCLBIN directly"
fi
exec bash "$script_dir/build_decoder_multikernel_300mhz.sh" "$@"
