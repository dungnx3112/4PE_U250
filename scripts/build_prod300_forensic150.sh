#!/usr/bin/env bash
set -uo pipefail

# Pull one verified revision, clone it into two isolated workspaces, then build:
#   - production 300 MHz
#   - forensic 150 MHz
# at the same time as two independent OS processes.
#
# Both workers force REBUILD_XO=1 and REUSE_XO=0. Therefore all four HLS XOs
# in each variant are synthesized again from the selected Git revision.
# Isolation is mandatory: the underlying flows otherwise share HLS project and
# Vitis run directory names and would corrupt/overwrite each other's outputs.
#
# Usage:
#   screen -S xclbin_dual
#   cd ~/XuanDung_AnhDuc/XuanDung/4PE_U250_forensic
#   bash scripts/build_prod300_forensic150.sh
#
# Useful overrides:
#   JOBS_PER_BUILD=32        # total load is roughly 2x this value
#   SKIP_GIT_PULL=1          # only when HEAD was already verified
#   EXPECTED_COMMIT=ea491c9   # commit containing the HLS latency fix
#   U250_PLATFORM=/absolute/path/to/platform.xpfm
#   DUAL_WORK_ROOT=/scratch/$USER/dual_build_...

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
cd "$repo_root"

expected_commit=${EXPECTED_COMMIT:-ea491c9}
git_remote=${GIT_REMOTE:-origin}
git_branch=${GIT_BRANCH:-debug}
skip_git_pull=${SKIP_GIT_PULL:-0}
jobs_per_build=${JOBS_PER_BUILD:-${JOBS:-32}}
vitis_settings=${VITIS_SETTINGS:-/home/eda/xilinx/Vitis/2023.2/settings64.sh}
prod_xclbin=${PROD_XCLBIN:-int4_decoder_multikernel_300mhz_prod_1f1881e.xclbin}
debug_xclbin=${DEBUG_XCLBIN:-int4_decoder_multikernel_150mhz_forensic_1f1881e.xclbin}
run_stamp=$(date +%Y%m%d-%H%M%S)
log_root="$repo_root/dual_build_logs/$run_stamp"
work_root=${DUAL_WORK_ROOT:-"$(dirname "$repo_root")/$(basename "$repo_root")_dual_$run_stamp"}
prod_repo="$work_root/prod300"
debug_repo="$work_root/forensic150"

mkdir -p "$log_root"

banner() {
    printf '\n========================================================================\n'
    printf ' %s\n' "$1"
    printf '========================================================================\n'
}

fail() {
    echo "ERROR: $*" >&2
    exit 1
}

run_logged() {
    local log_file=$1
    shift
    "$@" 2>&1 | tee "$log_file"
    return "${PIPESTATUS[0]}"
}

latest_build_run() {
    local root=$1
    find "$root/build_multikernel_300mhz/runs" \
        -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\n' 2>/dev/null |
        sort -nr |
        sed -n '1s/^[^ ]* //p'
}

select_routed_dcp() {
    local run_dir=$1
    local selected=""
    [[ -n "$run_dir" ]] || return 0

    selected=$(
        find "$run_dir/temp" -type f -name 'level0_wrapper_routed.dcp' \
            -printf '%T@ %p\n' 2>/dev/null |
        sort -nr |
        sed -n '1s/^[^ ]* //p'
    )
    if [[ -z "$selected" ]]; then
        selected=$(
            find "$run_dir/temp" -type f -name '*routed.dcp' \
                -printf '%T@ %p\n' 2>/dev/null |
            sort -nr |
            sed -n '1s/^[^ ]* //p'
        )
    fi
    printf '%s\n' "$selected"
}

write_status() {
    local status_file=$1
    shift
    : > "$status_file"
    while (( $# >= 2 )); do
        printf '%s=%q\n' "$1" "$2" >> "$status_file"
        shift 2
    done
}

if [[ ! "$skip_git_pull" =~ ^[01]$ ]]; then
    fail "SKIP_GIT_PULL must be 0 or 1"
fi
if [[ ! "$jobs_per_build" =~ ^[0-9]+$ ]] || (( jobs_per_build < 1 )); then
    fail "JOBS_PER_BUILD must be a positive integer"
fi

banner "STEP 0: PULL AND PIN ONE SOURCE REVISION"

git rev-parse --is-inside-work-tree >/dev/null 2>&1 ||
    fail "$repo_root is not a Git working tree"

# Untracked build artifacts are allowed. Tracked/index changes are rejected so
# both workers definitely compile the same committed HLS source.
git diff --quiet || fail "tracked files have unstaged changes; commit/stash them first"
git diff --cached --quiet || fail "the Git index has staged changes; commit/stash them first"

if (( skip_git_pull == 0 )); then
    echo "[+] git pull --ff-only $git_remote $git_branch"
    git pull --ff-only "$git_remote" "$git_branch" 2>&1 | tee "$log_root/git_pull.log"
    pull_status=${PIPESTATUS[0]}
    (( pull_status == 0 )) || fail "git pull failed with status $pull_status"
else
    echo "[!] SKIP_GIT_PULL=1: using current local checkout"
fi

head_full=$(git rev-parse HEAD)
head_short=$(git rev-parse --short HEAD)
echo "[+] pinned HEAD=$head_full"
if [[ "$head_full" == "$expected_commit"* ]]; then
    echo "[+] HEAD exactly matches required commit $expected_commit"
elif git merge-base --is-ancestor "$expected_commit" HEAD; then
    echo "[+] HEAD=$head_short contains required base commit $expected_commit"
else
    fail "HEAD=$head_short does not contain required commit $expected_commit"
fi

if [[ ! -r "$vitis_settings" ]] && ! command -v vitis_hls >/dev/null 2>&1; then
    fail "Vitis settings not found: $vitis_settings"
fi
[[ ! -e "$work_root" ]] || fail "isolated work root already exists: $work_root"
[[ ! -e "$repo_root/$prod_xclbin" ]] || fail "refusing to overwrite $repo_root/$prod_xclbin"
[[ ! -e "$repo_root/$debug_xclbin" ]] || fail "refusing to overwrite $repo_root/$debug_xclbin"

banner "STEP 1: CREATE TWO ISOLATED CHECKOUTS AT $head_short"
mkdir -p "$work_root"
git clone --local --no-checkout "$repo_root" "$prod_repo" \
    2>&1 | tee "$log_root/clone_prod.log"
(( PIPESTATUS[0] == 0 )) || fail "failed to create production checkout"
git -C "$prod_repo" checkout --detach "$head_full" \
    2>&1 | tee -a "$log_root/clone_prod.log"
(( PIPESTATUS[0] == 0 )) || fail "failed to checkout production revision"

git clone --local --no-checkout "$repo_root" "$debug_repo" \
    2>&1 | tee "$log_root/clone_debug.log"
(( PIPESTATUS[0] == 0 )) || fail "failed to create forensic checkout"
git -C "$debug_repo" checkout --detach "$head_full" \
    2>&1 | tee -a "$log_root/clone_debug.log"
(( PIPESTATUS[0] == 0 )) || fail "failed to checkout forensic revision"

for checkout in "$prod_repo" "$debug_repo"; do
    [[ "$(git -C "$checkout" rev-parse HEAD)" == "$head_full" ]] ||
        fail "revision mismatch in $checkout"
done

# The generic timing checker is reused after this wrapper verifies that the
# forensic build really contains a 150 MHz (6.666667 ns) kernel clock.
debug_gate_tcl="$log_root/verify_150mhz_routed.tcl"
cat > "$debug_gate_tcl" <<'TCL'
if {$argc != 3} {
    error "Usage: verify_150mhz_routed.tcl <routed.dcp> <report_dir> <generic_check.tcl>"
}
set dcp_path [file normalize [lindex $argv 0]]
set report_dir [file normalize [lindex $argv 1]]
set generic_check [file normalize [lindex $argv 2]]
file mkdir $report_dir
cd $report_dir
open_checkpoint $dcp_path
set clock_name clk_out1_ulp_clk_wiz_0
set clocks [get_clocks -quiet $clock_name]
if {[llength $clocks] != 1} {
    error "150MHz gate expected exactly one $clock_name clock, found [llength $clocks]"
}
set period [get_property PERIOD [lindex $clocks 0]]
if {![string is double -strict $period] || abs($period - 6.666667) > 0.002} {
    error "150MHz gate rejected kernel period ${period}ns; expected 6.666667ns"
}
puts "INFO: 150MHz forensic timing gate: period_ns=$period"
source $generic_check
puts "INFO: 150MHz forensic timing gate: TIMING_CLOSED"
close_design
TCL

production_worker() (
    cd "$prod_repo" || exit 1
    local build_status=FAIL
    local timing_status=NOT_RUN
    local run_dir=""
    local dcp=""
    local -a build_env=(
        "VITIS_SETTINGS=$vitis_settings"
        "JOBS=$jobs_per_build"
        "REBUILD_XO=1"
        "REUSE_XO=0"
    )
    if [[ -n "${U250_PLATFORM:-}" ]]; then
        build_env+=("U250_PLATFORM=$U250_PLATFORM")
    fi

    echo "[+] Starting fresh production build in $prod_repo"
    echo "[+] REBUILD_XO=1 REUSE_XO=0 JOBS=$jobs_per_build"
    if run_logged "$log_root/build_prod_300mhz.log" \
        env "${build_env[@]}" \
            ENABLE_LAYER_TRACE=0 \
            ENABLE_STALL_PROFILE=0 \
            ENABLE_FULL_STREAM_DEBUG=0 \
            DEBUG_CLOCK_HZ=300000000 \
            XCLBIN_OUTPUT="$prod_xclbin" \
            bash scripts/build_decoder_multikernel_300mhz.sh; then
        if [[ -s "$prod_repo/$prod_xclbin" ]]; then
            build_status=PASS
            run_dir=$(latest_build_run "$prod_repo")
            dcp=$(select_routed_dcp "$run_dir")
            sha256sum "$prod_repo/$prod_xclbin" > "$prod_repo/${prod_xclbin}.sha256"
        else
            build_status=FAIL_MISSING_XCLBIN
        fi
    fi

    if [[ "$build_status" == PASS && -n "$dcp" && -s "$dcp" ]]; then
        gate_dir="$run_dir/reports/timing_gate_300"
        mkdir -p "$gate_dir"
        if run_logged "$log_root/timing_gate_300mhz.log" \
            vivado -mode batch -notrace \
                -source scripts/verify_300mhz_routed.tcl \
                -tclargs "$dcp" "$gate_dir" "300MHz production"; then
            if grep -q '300MHz production timing gate: TIMING_CLOSED' \
                "$log_root/timing_gate_300mhz.log"; then
                timing_status=PASS
            else
                timing_status=FAIL_NO_CLOSED_MARKER
            fi
        else
            timing_status=FAIL
        fi
    else
        timing_status=SKIPPED_NO_ROUTED_DCP
    fi

    write_status "$log_root/prod.status" \
        prod_build_status "$build_status" \
        prod_timing_status "$timing_status" \
        prod_run_dir "$run_dir" \
        prod_dcp "$dcp"
    [[ "$build_status" == PASS && "$timing_status" == PASS ]]
)

forensic_worker() (
    cd "$debug_repo" || exit 1
    local build_status=FAIL
    local timing_status=NOT_RUN
    local run_dir=""
    local dcp=""
    local -a build_env=(
        "VITIS_SETTINGS=$vitis_settings"
        "JOBS=$jobs_per_build"
        "REBUILD_XO=1"
        "REUSE_XO=0"
    )
    if [[ -n "${U250_PLATFORM:-}" ]]; then
        build_env+=("U250_PLATFORM=$U250_PLATFORM")
    fi

    echo "[+] Starting fresh forensic build in $debug_repo"
    echo "[+] REBUILD_XO=1 REUSE_XO=0 JOBS=$jobs_per_build"
    if run_logged "$log_root/build_forensic_150mhz.log" \
        env "${build_env[@]}" \
            DEBUG_CLOCK_HZ=150000000 \
            XCLBIN_OUTPUT="$debug_xclbin" \
            bash scripts/build_forensic_debug.sh; then
        if [[ -s "$debug_repo/$debug_xclbin" &&
              -s "$debug_repo/${debug_xclbin}.ltx" &&
              -s "$debug_repo/${debug_xclbin}.xrt.ini" ]]; then
            build_status=PASS
            run_dir=$(latest_build_run "$debug_repo")
            dcp=$(select_routed_dcp "$run_dir")
            sha256sum "$debug_repo/$debug_xclbin" \
                "$debug_repo/${debug_xclbin}.ltx" \
                > "$debug_repo/${debug_xclbin}.artifacts.sha256"
        else
            build_status=FAIL_MISSING_DEBUG_ARTIFACT
        fi
    fi

    if [[ "$build_status" == PASS && -n "$dcp" && -s "$dcp" ]]; then
        gate_dir="$run_dir/reports/timing_gate_150"
        mkdir -p "$gate_dir"
        if run_logged "$log_root/timing_gate_150mhz.log" \
            vivado -mode batch -notrace \
                -source "$debug_gate_tcl" \
                -tclargs "$dcp" "$gate_dir" \
                    "$debug_repo/scripts/timing_300mhz_post_route_check.tcl"; then
            if grep -q '150MHz forensic timing gate: TIMING_CLOSED' \
                "$log_root/timing_gate_150mhz.log"; then
                timing_status=PASS
            else
                timing_status=FAIL_NO_CLOSED_MARKER
            fi
        else
            timing_status=FAIL
        fi
    else
        timing_status=SKIPPED_NO_ROUTED_DCP
    fi

    write_status "$log_root/debug.status" \
        debug_build_status "$build_status" \
        debug_timing_status "$timing_status" \
        debug_run_dir "$run_dir" \
        debug_dcp "$dcp"
    [[ "$build_status" == PASS && "$timing_status" == PASS ]]
)

banner "STEP 2: START BOTH BUILDS CONCURRENTLY"
echo "[+] production workspace: $prod_repo"
echo "[+] forensic workspace:   $debug_repo"
echo "[+] jobs per build:       $jobs_per_build (up to ~$((2 * jobs_per_build)) total)"

production_worker \
    > >(sed -u 's/^/[PROD300] /' | tee "$log_root/prod.worker.log") 2>&1 &
prod_pid=$!
forensic_worker \
    > >(sed -u 's/^/[DEBUG150] /' | tee "$log_root/debug.worker.log") 2>&1 &
debug_pid=$!

echo "[+] production PID=$prod_pid"
echo "[+] forensic PID=$debug_pid"

wait "$prod_pid"
prod_wait_status=$?
wait "$debug_pid"
debug_wait_status=$?

prod_build_status=FAIL_NO_STATUS
prod_timing_status=NOT_RUN
prod_run_dir=""
prod_dcp=""
debug_build_status=FAIL_NO_STATUS
debug_timing_status=NOT_RUN
debug_run_dir=""
debug_dcp=""
[[ -s "$log_root/prod.status" ]] && source "$log_root/prod.status"
[[ -s "$log_root/debug.status" ]] && source "$log_root/debug.status"

banner "STEP 3: PUBLISH ONLY VERIFIED ARTIFACTS"
if [[ "$prod_build_status" == PASS && "$prod_timing_status" == PASS ]]; then
    cp -p "$prod_repo/$prod_xclbin" "$repo_root/$prod_xclbin"
    cp -p "$prod_repo/${prod_xclbin}.sha256" "$repo_root/${prod_xclbin}.sha256"
    echo "[+] published $repo_root/$prod_xclbin"
else
    echo "[!] production artifact not published; candidate remains in $prod_repo"
fi

if [[ "$debug_build_status" == PASS && "$debug_timing_status" == PASS ]]; then
    cp -p "$debug_repo/$debug_xclbin" "$repo_root/$debug_xclbin"
    cp -p "$debug_repo/${debug_xclbin}.ltx" "$repo_root/${debug_xclbin}.ltx"
    cp -p "$debug_repo/${debug_xclbin}.xrt.ini" "$repo_root/${debug_xclbin}.xrt.ini"
    cp -p "$debug_repo/${debug_xclbin}.artifacts.sha256" \
        "$repo_root/${debug_xclbin}.artifacts.sha256"
    echo "[+] published $repo_root/$debug_xclbin (+ .ltx and .xrt.ini)"
else
    echo "[!] forensic artifacts not published; candidates remain in $debug_repo"
fi

banner "FINAL MANIFEST"
manifest="$log_root/manifest.txt"
{
    echo "date=$(date --iso-8601=seconds)"
    echo "source_repo=$repo_root"
    echo "git_head=$head_full"
    echo "git_remote=$git_remote"
    echo "git_branch=$git_branch"
    echo "rebuild_xo=1"
    echo "reuse_xo=0"
    echo "jobs_per_build=$jobs_per_build"
    echo "work_root=$work_root"
    echo "prod_pid=$prod_pid"
    echo "prod_wait_status=$prod_wait_status"
    echo "prod_workspace=$prod_repo"
    echo "prod_xclbin=$repo_root/$prod_xclbin"
    echo "prod_build_status=$prod_build_status"
    echo "prod_timing_status=$prod_timing_status"
    echo "prod_run_dir=$prod_run_dir"
    echo "prod_dcp=$prod_dcp"
    echo "debug_pid=$debug_pid"
    echo "debug_wait_status=$debug_wait_status"
    echo "debug_workspace=$debug_repo"
    echo "debug_xclbin=$repo_root/$debug_xclbin"
    echo "debug_build_status=$debug_build_status"
    echo "debug_timing_status=$debug_timing_status"
    echo "debug_run_dir=$debug_run_dir"
    echo "debug_dcp=$debug_dcp"
} | tee "$manifest"

echo
echo "Logs and manifest: $log_root"
echo "Isolated workspaces: $work_root"

if [[ "$prod_build_status" == PASS &&
      "$prod_timing_status" == PASS &&
      "$debug_build_status" == PASS &&
      "$debug_timing_status" == PASS ]]; then
    echo "SUCCESS: BOTH_PARALLEL_XCLBINS_BUILT_AND_TIMING_CLOSED"
    exit 0
fi

echo "FAIL: one or more parallel build/timing gates failed; inspect $manifest" >&2
exit 1
