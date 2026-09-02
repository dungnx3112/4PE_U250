#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat >&2 <<EOF
Usage: $0 [platform.xpfm-or-name] [output.xclbin] [v++ executable]

Defaults:
  platform: $default_platform
  output:   int4_decoder_token_controller_300mhz.xclbin
  settings: $default_vitis_settings

Environment overrides:
  VITIS_SETTINGS=<settings64.sh>
  U250_PLATFORM=<platform.xpfm-or-name>
  XCLBIN_OUTPUT=<output.xclbin>
  VPP=<v++ executable>
  VIVADO=<vivado executable> hard-gate the retained routed DCP
  REBUILD_XO=1              rebuild the XO from the checked-in HLS source
  VITIS_HLS=<vitis_hls>     HLS executable used with REBUILD_XO=1
EOF
}

default_platform=/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm
default_vitis_settings=/home/eda/xilinx/Vitis/2023.2/settings64.sh

if (( $# > 3 )); then
    usage
    exit 2
fi

platform=${1:-${U250_PLATFORM:-$default_platform}}
output=${2:-${XCLBIN_OUTPUT:-int4_decoder_token_controller_300mhz.xclbin}}
vpp=${3:-${VPP:-v++}}
vitis_settings=${VITIS_SETTINGS:-$default_vitis_settings}
rebuild_xo=${REBUILD_XO:-0}
target_frequency_hz=300000000
kernel_clock=int4_decoder_token_controller_1.ap_clk

case $rebuild_xo in
    0|1) ;;
    *)
        echo "REBUILD_XO must be 0 or 1, got: $rebuild_xo" >&2
        exit 2
        ;;
esac

if [[ ! -f $vitis_settings ]]; then
    echo "Vitis settings file does not exist: $vitis_settings" >&2
    exit 1
fi

# The settings script supplies v++, vitis_hls, Vivado and XRT utility paths.
# Vendor settings scripts may inspect optional variables that are unset, so
# suspend nounset only while sourcing the trusted Xilinx environment.
# shellcheck disable=SC1090
set +u
source "$vitis_settings"
set -u

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
workspace_dir=$(cd -- "$source_dir/.." && pwd -P)
xo_path=$source_dir/int4_decoder_token_controller_300mhz.xo
base_config_path=$source_dir/link_300mhz.cfg
pre_place_path=$source_dir/timing_300mhz_pre_place.tcl
post_place_path=$source_dir/timing_300mhz_post_place.tcl
slr_domains_path=$source_dir/timing_300mhz_domains.tcl
pre_physopt_path=$source_dir/timing_300mhz_pre_physopt.tcl
hls_script_path=$source_dir/run_hls_300mhz.tcl
timing_gate_path=$source_dir/verify_300mhz_routed.tcl
post_route_report_path=$source_dir/report_300mhz_post_route.tcl
run_id=$(date +%Y%m%d-%H%M%S)-$$
run_dir=$workspace_dir/build_300mhz/runs/$run_id
temp_dir=$run_dir/temp
log_dir=$run_dir/logs
report_dir=$run_dir/reports
resolved_config_path=$run_dir/link_300mhz.resolved.cfg
candidate_output=$run_dir/int4_decoder_token_controller_300mhz.candidate.xclbin

for required_path in \
    "$base_config_path" \
    "$pre_place_path" \
    "$post_place_path" \
    "$slr_domains_path" \
    "$pre_physopt_path" \
    "$timing_gate_path" \
    "$post_route_report_path"; do
    if [[ ! -f $required_path ]]; then
        echo "Required build input does not exist: $required_path" >&2
        exit 1
    fi
done

mkdir -p -- "$temp_dir" "$log_dir" "$report_dir"

if [[ ! -f $xo_path ]]; then
    echo "XO does not exist; enabling REBUILD_XO=1: $xo_path"
    rebuild_xo=1
elif find "$source_dir" -maxdepth 1 -type f \
        \( -name '*.cpp' -o -name '*.hpp' -o \
           -name 'run_hls_300mhz.tcl' -o \
           -name 'patch_partitioned_entry_proc.tcl' -o \
           -name 'verify_generated_rtl_300mhz.tcl' \) \
        -newer "$xo_path" -print -quit | grep -q .; then
    echo "XO is older than its HLS inputs; enabling REBUILD_XO=1."
    rebuild_xo=1
fi

if (( rebuild_xo == 1 )); then
    if [[ ! -f $hls_script_path ]]; then
        echo "HLS build script does not exist: $hls_script_path" >&2
        exit 1
    fi
    hls=${VITIS_HLS:-vitis_hls}
    if [[ $hls == */* ]]; then
        if [[ ! -x $hls ]]; then
            echo "Vitis HLS executable does not exist or is not executable: $hls" >&2
            exit 1
        fi
    else
        hls=$(command -v -- "$hls" || true)
        if [[ -z $hls ]]; then
            echo "vitis_hls was not found after sourcing $vitis_settings" >&2
            exit 1
        fi
    fi

    echo "Rebuilding XO with: $hls"
    (
        cd -- "$source_dir"
        "$hls" -f "$hls_script_path"
    ) 2>&1 | tee "$log_dir/vitis_hls.log"
    for marker in \
        "PARTITIONED_PE_CONFIG_LAUNCH" \
        "LOCAL_WEIGHT_REQUEST_PIPELINES_VERIFIED" \
        "AXI_READ_WINDOWS_4X64_VERIFIED"; do
        if ! grep -Fq -- "$marker" "$log_dir/vitis_hls.log"; then
            echo "HLS completed without required architecture marker: $marker" >&2
            exit 1
        fi
    done
fi

if [[ ! -s $xo_path ]]; then
    echo "XO was not generated or is empty: $xo_path" >&2
    exit 1
fi

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

expected_frequency="freqhz=${target_frequency_hz}:${kernel_clock}"
if [[ $(grep -Fxc -- "$expected_frequency" "$base_config_path") -ne 1 ]]; then
    echo "Base config must contain exactly one '$expected_frequency' entry." >&2
    exit 1
fi

# Generate a run-local config. The absolute Linux paths remain valid after
# Vitis changes directory into its generated Vivado implementation project.
if ! awk -v pre="$pre_place_path" -v post="$post_place_path" -v phys="$pre_physopt_path" '
    BEGIN { pre_count = 0; post_count = 0; phys_count = 0 }
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
    /^prop=run\.impl_1\.STEPS\.PHYS_OPT_DESIGN\.TCL\.PRE=/ {
        print "prop=run.impl_1.STEPS.PHYS_OPT_DESIGN.TCL.PRE=" phys
        phys_count++
        next
    }
    { print }
    END {
        if (pre_count != 1 || post_count != 1 || phys_count != 1) {
            exit 42
        }
    }
' "$base_config_path" > "$resolved_config_path"; then
    echo "Could not inject exactly one pre-place, post-place and pre-physopt hook." >&2
    exit 1
fi

if [[ $output == /* ]]; then
    resolved_output=$output
else
    resolved_output=$workspace_dir/$output
fi
mkdir -p -- "$(dirname -- "$resolved_output")"

echo "Build run directory: $run_dir"
echo "Vitis settings: $vitis_settings"
echo "Platform: $platform"
echo "XO input: $xo_path"
sha256sum -- "$xo_path"
echo "Target kernel clock: ${target_frequency_hz} Hz"
echo "Resolved link config: $resolved_config_path"

set +e
"$vpp" \
    --link \
    --target hw \
    --platform "$platform" \
    --save-temps \
    --freqhz "${target_frequency_hz}:${kernel_clock}" \
    --config "$resolved_config_path" \
    --temp_dir "$temp_dir" \
    --log_dir "$log_dir" \
    --report_dir "$report_dir" \
    --output "$candidate_output" \
    "$xo_path"
link_exit_code=$?
set -e

# Bash 4.2 (still common on CentOS/RHEL build servers) supports mapfile but
# not its later -d option.  Newlines cannot occur in Vitis' generated run
# paths here, so populate the array with the portable read loop instead.
implementation_logs=()
while IFS= read -r implementation_log; do
    implementation_logs+=("$implementation_log")
done < <(find "$temp_dir" -type f -name runme.log -print 2>/dev/null)

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
        "300MHz floorplan: LOCAL_DOMAINS_APPLIED" \
        "four local PE/AXI/config domains were assigned to SLR0-SLR3"
    require_marker \
        "300MHz floorplan: REGISTERED_BOUNDARIES_APPLIED" \
        "position, pair-reduction and completion boundaries were localized"
    require_marker \
        "300MHz floorplan: LEAF_PRIMITIVE_OWNERSHIP_APPLIED" \
        "optimized leaf primitives were assigned to their owning SLR"
    require_marker \
        "300MHz post-place: LEAF_OWNERSHIP_VERIFIED" \
        "placed PE/AXI/memory primitives stayed in their owning SLR"
    require_marker \
        "300MHz physopt: TOOL_DRIVEN_PHYSOPT" \
        "custom physopt mutations were disabled in favor of the Vivado strategy"
fi

if (( validation_failed != 0 )); then
    exit 1
fi
if (( link_exit_code != 0 )); then
    exit "$link_exit_code"
fi

if [[ ! -s $candidate_output ]]; then
    echo "v++ returned success but candidate XCLBIN is missing or empty: $candidate_output" >&2
    exit 1
fi

vivado=${VIVADO:-vivado}
if [[ $vivado == */* ]]; then
    if [[ ! -x $vivado ]]; then
        echo "Vivado executable does not exist or is not executable: $vivado" >&2
        exit 1
    fi
else
    vivado=$(command -v -- "$vivado" || true)
    if [[ -z $vivado ]]; then
        echo "Vivado was not found after sourcing $vitis_settings" >&2
        exit 1
    fi
fi

routed_dcp=$(find "$temp_dir" -type f -name 'level0_wrapper_routed.dcp' \
    -print 2>/dev/null | sort | tail -n 1)
if [[ -z $routed_dcp ]]; then
    routed_dcp=$(find "$temp_dir" -type f -name '*routed.dcp' -print \
        2>/dev/null | sort | tail -n 1)
fi
if [[ -z $routed_dcp || ! -s $routed_dcp ]]; then
    echo "Link completed, but no non-empty routed DCP was retained under: $temp_dir" >&2
    exit 1
fi

echo "Running hard setup/hold timing gate on: $routed_dcp"
"$vivado" -mode batch -notrace \
    -source "$timing_gate_path" \
    -tclargs "$routed_dcp" "$report_dir" \
    2>&1 | tee "$log_dir/timing_gate.log"
if ! grep -Fq -- "300MHz timing gate: TIMING_CLOSED" \
        "$log_dir/timing_gate.log"; then
    echo "Vivado timing gate did not emit TIMING_CLOSED." >&2
    exit 1
fi
if ! grep -Fq -- "300MHz timing gate: ROUTED_LEAF_OWNERSHIP_CLEAN" \
        "$log_dir/timing_gate.log"; then
    echo "Vivado timing gate did not verify routed leaf ownership." >&2
    exit 1
fi

echo "Running full SLR-sequence audit on: $routed_dcp"
"$vivado" -mode batch -notrace \
    -source "$post_route_report_path" \
    -tclargs "$routed_dcp" "$report_dir" \
    2>&1 | tee "$log_dir/post_route_slr_audit.log"
if ! grep -Fq -- "300MHz post-route: SLR_PATH_AUDIT_COMPLETE" \
        "$log_dir/post_route_slr_audit.log"; then
    echo "Vivado post-route report did not complete the SLR path audit." >&2
    exit 1
fi
if ! grep -Fq -- "300MHz post-route: INTERNAL_SLR_TOPOLOGY_CLEAN" \
        "$log_dir/post_route_slr_audit.log"; then
    echo "Vivado post-route audit found a kernel-internal SLR detour." >&2
    exit 1
fi

# Never publish a timing-failing image.  The previous accepted XCLBIN remains
# untouched until placement ownership, setup/hold and routed SLR topology have
# all passed for this exact run.
mv -f -- "$candidate_output" "$resolved_output"
sha256sum -- "$resolved_output"
if command -v xclbinutil >/dev/null 2>&1; then
    xclbinutil --input "$resolved_output" --info \
        > "$report_dir/xclbin.info.txt"
fi

echo "300MHz build gate: ACCEPTED_XCLBIN_PUBLISHED"
echo "XCLBIN build completed: $resolved_output"
echo "Reports: $report_dir"
