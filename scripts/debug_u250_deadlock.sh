#!/usr/bin/env bash
set -euo pipefail

# One supported deadlock-observation flow for this project:
#   1) rebuild four profile-enabled XOs and one instrumented xclbin;
#   2) build the native-XRT host;
#   3) run once on U250 and keep every XRT trace/log in one evidence directory.

usage() {
    cat >&2 <<'EOF'
Usage:
  scripts/debug_u250_deadlock.sh build
  scripts/debug_u250_deadlock.sh run [extra decode_host options]
  scripts/debug_u250_deadlock.sh all [extra decode_host options]

Environment:
  U250_PLATFORM=...       U250 .xpfm path/name used by v++
  VITIS_SETTINGS=...      Vitis settings64.sh (default: 2023.2 path)
  JOBS=N                  HLS/Vivado parallelism
  DEVICE=0                XRT device index; use a BDF only on multi-card hosts
  BANKS_DIR=.             directory containing model_bank0..3.bin
  ROPE_LUT=rope_lut.bin
  TOKENIZER=tokenizer.bin
  EMBEDDINGS=...          optional; defaults to BANKS_DIR/embeddings.bin
  PROMPT=Hello
  MAX_TOKENS=4            keep the first debug capture short
  XCLBIN=...              profile xclbin path override
  HOST=...                profile host path override

Examples:
  scripts/debug_u250_deadlock.sh all
  DEVICE=0000:0c:00.1 BANKS_DIR=/dev/shm/4PE_U250 \
    scripts/debug_u250_deadlock.sh run --prompt "Hello" --max-tokens 2
EOF
}

if (( $# == 0 )); then
    action=all
else
    action=$1
    shift
fi

case "$action" in
    build|run|all) ;;
    -h|--help) usage; exit 0 ;;
    *) echo "ERROR: action must be build, run, or all." >&2; usage; exit 2 ;;
esac

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
xclbin=${XCLBIN:-$repo_root/int4_decoder_multikernel_300mhz_profile.xclbin}
host=${HOST:-$repo_root/decode_host_profile}

build_artifacts() {
    echo "========================================================================"
    echo " PROFILE BUILD: 4 XOs + XCLBIN + HOST"
    echo "========================================================================"
    ENABLE_STALL_PROFILE=1 \
    REBUILD_XO=1 \
    XCLBIN_OUTPUT="$xclbin" \
        bash "$script_dir/build_decoder_multikernel_300mhz.sh"

    HOST_OUTPUT="$(basename "$host")" bash "$script_dir/build_decode_host.sh"
    if [[ "$host" != "$repo_root/$(basename "$host")" ]]; then
        mkdir -p "$(dirname "$host")"
        cp -f "$repo_root/$(basename "$host")" "$host"
    fi

    [[ -s "$xclbin" ]] || { echo "ERROR: missing xclbin: $xclbin" >&2; exit 1; }
    [[ -x "$host" ]] || { echo "ERROR: missing host executable: $host" >&2; exit 1; }
    [[ -s "${xclbin}.xrt.ini" ]] || {
        echo "ERROR: missing generated XRT profile config: ${xclbin}.xrt.ini" >&2
        exit 1
    }
    echo "[OK] Profile artifacts are ready:"
    echo "     $xclbin"
    echo "     $host"
    echo "     ${xclbin}.xrt.ini"
}

absolute_existing_path() {
    local path=$1
    [[ -e "$path" ]] || return 1
    local dir base
    dir=$(cd -- "$(dirname -- "$path")" && pwd -P)
    base=$(basename -- "$path")
    printf '%s/%s\n' "$dir" "$base"
}

write_runtime_profile_ini() {
    local output=$1
    local xrt_version="" xrt_minor=999 trace_key=device_trace
    if command -v xbutil >/dev/null 2>&1; then
        xrt_version=$(xbutil --version 2>&1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -n 1 || true)
        if [[ -n "$xrt_version" ]]; then
            xrt_minor=$(printf '%s\n' "$xrt_version" | cut -d. -f2)
        fi
    fi
    # XRT 2021.2 (2.11) used data_transfer_trace. XRT 2022.1 (2.12)
    # renamed it to device_trace. The U250 server has been seen with both.
    if [[ "$xrt_minor" =~ ^[0-9]+$ ]] && (( xrt_minor < 12 )); then
        trace_key=data_transfer_trace
    fi

    cat > "$output" <<EOF
[Runtime]
verbosity = 3
runtime_log = console

[Debug]
native_xrt_trace = true
$trace_key = fine
stall_trace = all
continuous_trace = true
trace_buffer_size = 64M
pl_deadlock_detection = true
EOF
    echo "XRT version: ${xrt_version:-unknown}; using '$trace_key'" \
        | tee "$output.detected-version.txt"
}

run_capture() {
    local xclbin_abs host_abs banks_abs rope_abs tokenizer_abs embeddings_abs
    xclbin_abs=$(absolute_existing_path "$xclbin") || {
        echo "ERROR: xclbin not found: $xclbin; run '$0 build' first." >&2
        exit 1
    }
    host_abs=$(absolute_existing_path "$host") || {
        echo "ERROR: host not found: $host; run '$0 build' first." >&2
        exit 1
    }
    banks_abs=$(absolute_existing_path "${BANKS_DIR:-$repo_root}") || {
        echo "ERROR: BANKS_DIR does not exist: ${BANKS_DIR:-$repo_root}" >&2
        exit 1
    }
    rope_abs=$(absolute_existing_path "${ROPE_LUT:-$banks_abs/rope_lut.bin}") || {
        echo "ERROR: rope LUT not found: ${ROPE_LUT:-$banks_abs/rope_lut.bin}" >&2
        exit 1
    }
    tokenizer_abs=$(absolute_existing_path "${TOKENIZER:-$banks_abs/tokenizer.bin}") || {
        echo "ERROR: tokenizer not found: ${TOKENIZER:-$banks_abs/tokenizer.bin}" >&2
        exit 1
    }
    embeddings_abs=$(absolute_existing_path "${EMBEDDINGS:-$banks_abs/embeddings.bin}") || {
        echo "ERROR: embeddings not found: ${EMBEDDINGS:-$banks_abs/embeddings.bin}" >&2
        exit 1
    }

    local run_id evidence_dir profile_ini device prompt max_tokens
    run_id=$(date +%Y%m%d-%H%M%S)-$$
    evidence_dir="$repo_root/debug_runs/$run_id"
    mkdir -p "$evidence_dir"
    profile_ini="${xclbin}.xrt.ini"
    [[ -s "$profile_ini" ]] || {
        echo "ERROR: XRT profile config not found: $profile_ini" >&2
        echo "       Rebuild with '$0 build'; do not use the production xclbin." >&2
        exit 1
    }
    write_runtime_profile_ini "$evidence_dir/xrt.ini"
    sha256sum "$xclbin_abs" "$host_abs" > "$evidence_dir/artifacts.sha256"

    device=${DEVICE:-0}
    prompt=${PROMPT:-Hello}
    max_tokens=${MAX_TOKENS:-4}

    if command -v xbutil >/dev/null 2>&1; then
        xbutil examine > "$evidence_dir/xbutil_before.txt" 2>&1 || \
            xbutil scan > "$evidence_dir/xbutil_before.txt" 2>&1 || true
    fi
    dmesg > "$evidence_dir/dmesg_before.txt" 2>&1 || true

    echo "========================================================================"
    echo " PROFILE RUN"
    echo "========================================================================"
    echo "Device:      $device"
    echo "XCLBIN:      $xclbin_abs"
    echo "Evidence:    $evidence_dir"
    echo "Max tokens:  $max_tokens"
    echo ""

    local host_status
    set +e
    (
        cd "$evidence_dir"
        # Force this profile config. Otherwise XRT may pick the production
        # xrt.ini beside the host executable before checking the current CWD.
        export XRT_INI_PATH="$evidence_dir/xrt.ini"
        "$host_abs" \
            --xclbin "$xclbin_abs" \
            --device "$device" \
            --banks "$banks_abs" \
            --rope "$rope_abs" \
            --tokenizer "$tokenizer_abs" \
            --embeddings "$embeddings_abs" \
            --prompt "$prompt" \
            --max-tokens "$max_tokens" \
            "$@"
    ) 2>&1 | tee "$evidence_dir/host.log"
    host_status=${PIPESTATUS[0]}
    set -e

    if command -v xbutil >/dev/null 2>&1; then
        xbutil examine > "$evidence_dir/xbutil_after.txt" 2>&1 || \
            xbutil scan > "$evidence_dir/xbutil_after.txt" 2>&1 || true
    fi
    dmesg > "$evidence_dir/dmesg_after.txt" 2>&1 || true

    echo ""
    echo "========================================================================"
    echo " CAPTURE COMPLETE (host exit=$host_status)"
    echo "========================================================================"
    echo "Evidence directory: $evidence_dir"
    local run_summary
    run_summary=$(find "$evidence_dir" -maxdepth 1 -type f -name '*.run_summary' -size +0c \
        -print -quit 2>/dev/null || true)
    if [[ -n "$run_summary" ]]; then
        echo "Trace:              $run_summary"
        echo "Open with:          vitis_analyzer $run_summary"
    else
        echo "ERROR: XRT did not create xrt.run_summary." >&2
        echo "Inspect: $evidence_dir/host.log" >&2
        echo "This usually means the instrumented xclbin was not loaded, or the" >&2
        echo "runtime XRT cannot collect traces from that build." >&2
        return 3
    fi
    return "$host_status"
}

if [[ "$action" == build || "$action" == all ]]; then
    build_artifacts
fi
if [[ "$action" == run || "$action" == all ]]; then
    run_capture "$@"
fi
