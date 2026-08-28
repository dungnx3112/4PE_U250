#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 <platform.xpfm-or-name> [output.xclbin] [v++ executable]" >&2
}

if (( $# < 1 || $# > 3 )); then
    usage
    exit 2
fi

platform=$1
output=${2:-int4_decoder_token_controller_300mhz.xclbin}
vpp=${3:-v++}
target_frequency_hz=300000000
kernel_clock=int4_decoder_token_controller_1.ap_clk

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
workspace_dir=$(cd -- "$source_dir/.." && pwd -P)
xo_path=$source_dir/int4_decoder_token_controller_300mhz.xo
base_config_path=$source_dir/link_300mhz.cfg
pre_place_path=$source_dir/timing_300mhz_pre_place.tcl
post_place_path=$source_dir/timing_300mhz_post_place_check.tcl
run_id=$(date +%Y%m%d-%H%M%S)-$$
run_dir=$workspace_dir/build_300mhz/runs/$run_id
temp_dir=$run_dir/temp
log_dir=$run_dir/logs
report_dir=$run_dir/reports
resolved_config_path=$run_dir/link_300mhz.resolved.cfg

for required_path in \
    "$xo_path" \
    "$base_config_path" \
    "$pre_place_path" \
    "$post_place_path"; do
    if [[ ! -f $required_path ]]; then
        echo "Required build input does not exist: $required_path" >&2
        exit 1
    fi
done

if [[ $vpp == */* ]]; then
    if [[ ! -x $vpp ]]; then
        echo "v++ executable does not exist or is not executable: $vpp" >&2
        exit 1
    fi
else
    vpp=$(command -v -- "$vpp" || true)
    if [[ -z $vpp ]]; then
        echo "v++ was not found in PATH" >&2
        exit 1
    fi
fi

if [[ $platform == */* && ! -f $platform ]]; then
    echo "Platform file does not exist: $platform" >&2
    exit 1
fi

mkdir -p -- "$temp_dir" "$log_dir" "$report_dir"

expected_frequency="freqhz=${target_frequency_hz}:${kernel_clock}"
if [[ $(grep -Fxc -- "$expected_frequency" "$base_config_path") -ne 1 ]]; then
    echo "Base config must contain exactly one '$expected_frequency' entry." >&2
    exit 1
fi

# Generate a run-local config. The absolute Linux paths remain valid after
# Vitis changes directory into its generated Vivado implementation project.
if ! awk -v pre="$pre_place_path" -v post="$post_place_path" '
    BEGIN { pre_count = 0; post_count = 0 }
    /^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.PRE=/ {
        print "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.PRE=" pre
        pre_count++
        next
    }
    /^prop=run\.impl_1\.STEPS\.PLACE_DESIGN\.TCL\.POST=/ {
        print "prop=run.impl_1.STEPS.PLACE_DESIGN.TCL.POST=" post
        post_count++
        next
    }
    { print }
    END {
        if (pre_count != 1 || post_count != 1) {
            exit 42
        }
    }
' "$base_config_path" > "$resolved_config_path"; then
    echo "Could not inject exactly one pre-place and one post-place hook." >&2
    exit 1
fi

if [[ $output == /* ]]; then
    resolved_output=$output
else
    resolved_output=$workspace_dir/$output
fi

echo "Build run directory: $run_dir"
echo "Target kernel clock: ${target_frequency_hz} Hz"
echo "Resolved link config: $resolved_config_path"

set +e
"$vpp" \
    --link \
    --target hw \
    --platform "$platform" \
    --freqhz "${target_frequency_hz}:${kernel_clock}" \
    --config "$resolved_config_path" \
    --temp_dir "$temp_dir" \
    --log_dir "$log_dir" \
    --report_dir "$report_dir" \
    --output "$resolved_output" \
    "$xo_path"
link_exit_code=$?
set -e

mapfile -d '' implementation_logs < <(
    find "$temp_dir" -type f -name runme.log -print0 2>/dev/null
)

validation_failed=0
require_marker() {
    local marker=$1
    local description=$2
    if (( ${#implementation_logs[@]} == 0 )) || \
        ! grep -Fq -- "$marker" "${implementation_logs[@]}"; then
        echo "Missing build marker: $marker ($description)" >&2
        validation_failed=1
    else
        echo "Verified: $description"
    fi
}

if (( ${#implementation_logs[@]} > 0 || link_exit_code == 0 )); then
    require_marker \
        "300MHz floorplan: FLOORPLAN_APPLIED" \
        "the pre-place PE/SLR floorplan ran"
    require_marker \
        "300MHz floorplan: PAIR_LOCAL_APPLIED" \
        "the pair-local anchors ran"
    require_marker \
        "300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED" \
        "placed PE, AXI and control primitives stayed in their assigned SLRs"
fi

if (( validation_failed != 0 )); then
    exit 1
fi
exit "$link_exit_code"
