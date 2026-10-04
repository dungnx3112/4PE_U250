#!/usr/bin/env bash
set -euo pipefail

# Dedicated hardware build for the Attention -> O-projection boundary.
# PE0 is the default because the observed group-0 mismatch occurred there.
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

export ENABLE_O_PROJECTION_ILA=1
export O_ILA_PE=${O_ILA_PE:-0}
export O_ILA_DEPTH=${O_ILA_DEPTH:-1024}
export O_ILA_CONTROL_DEPTH=${O_ILA_CONTROL_DEPTH:-1024}
export DEBUG_CLOCK_HZ=${DEBUG_CLOCK_HZ:-150000000}
export XCLBIN_OUTPUT=${XCLBIN_OUTPUT:-int4_decoder_multikernel_150mhz_o_projection_ila.xclbin}
export REUSE_XO=${REUSE_XO:-1}

exec bash "$script_dir/build_decoder_multikernel_300mhz.sh" "$@"
