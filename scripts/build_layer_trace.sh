#!/usr/bin/env bash
set -euo pipefail

# Dedicated debug build.  HLS still schedules against the 300 MHz target so
# the generated datapath remains comparable with production, while v++ links
# it at a conservative clock for reliable trace capture.
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)

export ENABLE_LAYER_TRACE=1
export ENABLE_STALL_PROFILE=${ENABLE_STALL_PROFILE:-0}
export ENABLE_FULL_STREAM_DEBUG=${ENABLE_FULL_STREAM_DEBUG:-0}
export DEBUG_CLOCK_HZ=${DEBUG_CLOCK_HZ:-200000000}
export REBUILD_XO=${REBUILD_XO:-1}
export XCLBIN_OUTPUT=${XCLBIN_OUTPUT:-int4_decoder_multikernel_200mhz_full_stage_debug.xclbin}

exec bash "$script_dir/build_decoder_multikernel_300mhz.sh" "$@"
