#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage: scripts/run_o_projection_capture.sh <checkpoint|remaining|all>

Checkpoints:
  input_write input_read partial completed output projection_read residual

Examples:
  bash scripts/run_o_projection_capture.sh input_read
  bash scripts/run_o_projection_capture.sh remaining
  bash scripts/run_o_projection_capture.sh all

Environment overrides:
  DEVICE=0000:13:00.0
  DATA_DIR=/dev/shm/4PE_U250_dense
  PROMPT=Hello
  MAX_TOKENS=1
  XVC_DEVICE=/dev/xfpga/xvc_pub.u4864.0
  XVC_PORT=10200
  XVC_BIN=/home/eda/xilinx/Vivado/2023.2/bin/xvc_pcie
  VIVADO_BIN=vivado
  O_ILA_TRIGGER_POSITION=<sample index>
EOF
}

if (( $# != 1 )); then
    usage >&2
    exit 2
fi

checkpoint=$1
checkpoints=(input_write input_read partial completed output projection_read residual)
remaining_checkpoints=(input_read partial completed output projection_read residual)
if [[ "$checkpoint" == all || "$checkpoint" == remaining ]]; then
    selected_checkpoints=("${checkpoints[@]}")
    if [[ "$checkpoint" == remaining ]]; then
        selected_checkpoints=("${remaining_checkpoints[@]}")
    fi
    for point in "${selected_checkpoints[@]}"; do
        bash "$0" "$point"
    done
    exit 0
fi

valid=0
for point in "${checkpoints[@]}"; do
    if [[ "$checkpoint" == "$point" ]]; then
        valid=1
        break
    fi
done
if (( valid == 0 )); then
    echo "ERROR: invalid checkpoint '$checkpoint'" >&2
    usage >&2
    exit 2
fi

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
repo_root=$(cd -- "$script_dir/.." && pwd -P)
host=${HOST_BIN:-$repo_root/decode_host}
xclbin=${XCLBIN:-$repo_root/int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin}
ltx=${O_ILA_LTX:-${xclbin}.ltx}
data_dir=${DATA_DIR:-/dev/shm/4PE_U250_dense}
device=${DEVICE:-0000:13:00.0}
prompt=${PROMPT:-Hello}
max_tokens=${MAX_TOKENS:-1}
xvc_device=${XVC_DEVICE:-/dev/xfpga/xvc_pub.u4864.0}
xvc_port=${XVC_PORT:-10200}
xvc_bin=${XVC_BIN:-/home/eda/xilinx/Vivado/2023.2/bin/xvc_pcie}
vivado_bin=${VIVADO_BIN:-vivado}

for artifact in \
    "$host" "$xclbin" "$ltx" \
    "$data_dir/model_bank0.bin" "$data_dir/model_bank1.bin" \
    "$data_dir/model_bank2.bin" "$data_dir/model_bank3.bin" \
    "$data_dir/rope_lut.bin" "$data_dir/tokenizer.bin" \
    "$data_dir/embeddings.bin" "$xvc_device"; do
    if [[ ! -e "$artifact" ]]; then
        echo "ERROR: required artifact is missing: $artifact" >&2
        exit 1
    fi
done
for tool in "$xvc_bin" "$vivado_bin" ss pgrep grep mkfifo; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: required tool is unavailable: $tool" >&2
        exit 1
    fi
done

case "$checkpoint" in
    input_read|partial|completed)
        default_trigger_position=0
        ;;
    *)
        default_trigger_position=960
        ;;
esac
trigger_position=${O_ILA_TRIGGER_POSITION:-$default_trigger_position}

run_id=$(date +%Y%m%d-%H%M%S)-$checkpoint
evidence_dir="$repo_root/debug_runs/o_projection_auto/$run_id"
mkdir -p "$evidence_dir"
fifo="/tmp/o_ila_continue.$$.fifo"
host_log="$evidence_dir/host.log"
xvc_log="$evidence_dir/xvc.log"
vivado_log="$evidence_dir/vivado.log"
host_pid=""

cleanup() {
    if [[ -n "$host_pid" ]] && kill -0 "$host_pid" 2>/dev/null; then
        kill "$host_pid" 2>/dev/null || true
    fi
    exec 3>&- || true
    if [[ -p "$fifo" && "$fifo" == /tmp/o_ila_continue.*.fifo ]]; then
        rm -f -- "$fifo"
    fi
}
trap cleanup EXIT

mkfifo "$fifo"
exec 3<>"$fifo"

echo "================================================================"
echo "AUTO O-PROJECTION CAPTURE: $checkpoint"
echo "================================================================"
echo "Evidence: $evidence_dir"
echo "Trigger position: $trigger_position"

"$host" \
    --xclbin "$xclbin" \
    --device "$device" \
    --banks "$data_dir" \
    --rope "$data_dir/rope_lut.bin" \
    --tokenizer "$data_dir/tokenizer.bin" \
    --embeddings "$data_dir/embeddings.bin" \
    --prompt "$prompt" \
    --max-tokens "$max_tokens" \
    --pause-after-load \
    --verbose \
    <&3 >"$host_log" 2>&1 &
host_pid=$!

paused=0
for _ in $(seq 1 300); do
    if grep -Fq '[ILA] XCLBIN loaded.' "$host_log" 2>/dev/null; then
        paused=1
        break
    fi
    if ! kill -0 "$host_pid" 2>/dev/null; then
        echo "ERROR: host exited before reaching the ILA pause." >&2
        cat "$host_log" >&2
        exit 1
    fi
    sleep 0.2
done
if (( paused == 0 )); then
    echo "ERROR: timed out waiting for the host ILA pause." >&2
    exit 1
fi
echo "[OK] Host loaded the xclbin and is paused."

mapfile -t old_xvc_pids < <(
    pgrep -u "$(id -u)" -f "xvc_pcie.*TCP::${xvc_port}" || true
)
if (( ${#old_xvc_pids[@]} > 0 )); then
    kill "${old_xvc_pids[@]}" 2>/dev/null || true
    for _ in $(seq 1 50); do
        if ! pgrep -u "$(id -u)" -f "xvc_pcie.*TCP::${xvc_port}" >/dev/null; then
            break
        fi
        sleep 0.1
    done
fi

"$xvc_bin" -d "$xvc_device" -s "TCP::${xvc_port}" \
    >"$xvc_log" 2>&1 &
for _ in $(seq 1 100); do
    if ss -ltn | grep -q ":${xvc_port}[[:space:]]"; then
        break
    fi
    sleep 0.1
done
if ! ss -ltn | grep -q ":${xvc_port}[[:space:]]"; then
    echo "ERROR: XVC did not open TCP port $xvc_port." >&2
    cat "$xvc_log" >&2
    exit 1
fi
echo "[OK] XVC is listening on TCP port $xvc_port."

export O_ILA_LTX="$ltx"
export O_ILA_CAPTURE_POINT="$checkpoint"
export O_ILA_TRIGGER_POSITION="$trigger_position"
export O_ILA_CONTINUE_FIFO="$fifo"

set +e
"$vivado_bin" -mode batch -nojournal -nolog -notrace \
    -source "$script_dir/run_o_projection_capture_batch.tcl" \
    2>&1 | tee "$vivado_log"
vivado_status=${PIPESTATUS[0]}
set -e
if (( vivado_status != 0 )); then
    echo "ERROR: Vivado capture failed; see $vivado_log" >&2
    exit "$vivado_status"
fi

set +e
wait "$host_pid"
host_status=$?
set -e
host_pid=""
cat "$host_log"
if (( host_status != 0 )); then
    echo "ERROR: host failed with exit code $host_status; see $host_log" >&2
    exit "$host_status"
fi

echo ""
echo "PASS AUTO_O_PROJECTION_CAPTURE checkpoint=$checkpoint"
echo "EVIDENCE_DIR=$evidence_dir"
