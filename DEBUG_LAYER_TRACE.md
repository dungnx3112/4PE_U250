# One-build forensic debug for 4PE U250

This checkout has a debug-only kernel ABI. Do not mix its host with a
production XCLBIN. The forensic XCLBIN is intentionally large: build it once,
then choose the layer and module at runtime without another HLS/link run.

## Coverage in the single XCLBIN

Every token can dump:

- all 65 residual boundaries (`input`, then attention/FFN output for 32 layers);
- eleven layer-0 stage checkpoints (RMS, Q/K/V, attention output, O, FFN RMS,
  Gate, Up, SwiGLU and Down);
- compressed KV records from any selected layer;
- a runtime-selected deep trace for any `q|k|v|o|gate|up|down` at layers
  0..31, or final `logits` at layer 32;
- all twelve inter-PE AXIS links through protocol checkers, counters and
  System ILA probes.

The deep trace records, per PE:

- every FP32 local partial for every output row (up to 32,256 logits);
- exact INT14 activation, its E8M0 scale, and packed INT4 weight words consumed;
- raw INT32 dots, FP32 weight scales and cumulative FP32 sums for output rows
  0..3 across every local G32 group (32 groups, or 88 for Down).

The stage file is 798,464 bytes:
`[4 PE][3119 words][64 bytes]`. Older 220,416, 292,096 and 308,480-byte files
are a different ABI and must not be compared with this analyzer.

## The final XCLBIN build

```bash
cd ~/XuanDung_AnhDuc/XuanDung/debug

RUN_RTL_COSIM=1 DEBUG_CLOCK_HZ=200000000 JOBS=32 REBUILD_XO=1 \
  bash scripts/build_forensic_debug.sh 2>&1 | tee build_forensic_debug.log
```

With `RUN_RTL_COSIM=1`, the preflight first synthesizes the local linear
module and runs XSIM C/RTL co-simulation with non-zero Q/O/Gate/Down/Logits
transactions. The build is accepted only if that passes and the final link
finds debug metadata for all twelve
streams and a non-empty matching `.ltx` file. Outputs:

```text
int4_decoder_multikernel_200mhz_forensic_debug.xclbin
int4_decoder_multikernel_200mhz_forensic_debug.xclbin.ltx
```

Build the matching host and software oracle once:

```bash
source /opt/xilinx/xrt/setup.sh
HOST_OUTPUT=decode_host_forensic bash scripts/build_decode_host.sh
make -C software_sim \
  CC=/home/eda/xilinx/Vivado/2023.2/tps/lnx64/gcc-9.3.0/bin/g++
```

## Capture one selected module without rebuilding

Example: layer 0 O, first prompt token `15043`, no BOS.

```bash
TRACE_LAYER=0
TRACE_MODE=o
HW_ROOT=/dev/shm/forensic_hw_l${TRACE_LAYER}_${TRACE_MODE}_$(date +%Y%m%d_%H%M%S)
mkdir -p "$HW_ROOT/layer" "$HW_ROOT/logits" "$HW_ROOT/residuals" \
  "$HW_ROOT/kv" "$HW_ROOT/stage"

./decode_host_forensic \
  --xclbin "$PWD/int4_decoder_multikernel_200mhz_forensic_debug.xclbin" \
  --device 0000:13:00.0 \
  --banks /dev/shm/4PE_U250_dense \
  --rope /dev/shm/4PE_U250_dense/rope_lut.bin \
  --tokenizer /dev/shm/4PE_U250_dense/tokenizer.bin \
  --embeddings /dev/shm/4PE_U250_dense/embeddings.bin \
  --prompt "Hello" --no-bos --max-tokens 1 \
  --trace-layer "$TRACE_LAYER" --trace-mode "$TRACE_MODE" \
  --kv-layer "$TRACE_LAYER" \
  --dump-layer-trace "$HW_ROOT/layer" \
  --dump-logits "$HW_ROOT/logits" \
  --dump-residuals "$HW_ROOT/residuals" \
  --dump-kv-cache "$HW_ROOT/kv" \
  --dump-stage-trace "$HW_ROOT/stage" \
  --verbose 2>&1 | tee "$HW_ROOT/host.log"

HOST_RC=${PIPESTATUS[0]}
test "$HOST_RC" -eq 0
stat -c '%n %s bytes' "$HW_ROOT/stage/stage_trace_pos0000_token15043.bin"
```

For logits use `TRACE_LAYER=32`, `TRACE_MODE=logits`, and omit `--kv-layer 32`
(KV layers are 0..31). To inspect another module, change only the two selector
values and use a new output directory; do not rebuild the XCLBIN.

## Produce the matching software trace

```bash
SW_ROOT=/dev/shm/forensic_sw_l${TRACE_LAYER}_${TRACE_MODE}_$(date +%Y%m%d_%H%M%S)
mkdir -p "$SW_ROOT/layer" "$SW_ROOT/kv" "$SW_ROOT/stage"

./software_sim/runq.exe /dev/shm/4PE_U250_dense \
  -z /dev/shm/4PE_U250_dense/tokenizer.bin \
  -i "Hello" --no-bos -n 1 -t 0 -s 42 \
  --trace-layer "$TRACE_LAYER" --trace-mode "$TRACE_MODE" \
  --kv-layer "$TRACE_LAYER" \
  --dump-layer-trace "$SW_ROOT/layer" \
  --dump-kv-cache "$SW_ROOT/kv" \
  --dump-stage-trace "$SW_ROOT/stage" \
  2>&1 | tee "$SW_ROOT/software.log"

SW_RC=${PIPESTATUS[0]}
test "$SW_RC" -eq 0
```

## Localize the failure

```bash
env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH \
  /usr/bin/python3 scripts/analyze_stage_trace.py \
  --hardware "$HW_ROOT/stage/stage_trace_pos0000_token15043.bin" \
  --software "$SW_ROOT/stage/stage_trace_pos0000_token15043.bin" \
  --deep-layer "$TRACE_LAYER" --deep-mode "$TRACE_MODE"
```

The report distinguishes activation delivery, packed-weight ordering, integer
MAC, scale addressing, FP32 accumulation, PE-local packet order and the final
four-PE reduction/store. For layer-0 FP32 projections it also replays the
bit-exact `(PE0 + PE1) + (PE2 + PE3)` tree.

Compare KV for the selected layer with `scripts/analyze_kv_cache.py`, and use
`scripts/analyze_layer_trace.py` to find the first bad half-layer before
selecting a deeper module. A divergence in an earlier stage contaminates all
later stages, so bugs are fixed and re-tested in first-divergence order; one
run cannot prove that no independent downstream bug exists.

## ILA fallback

The `.ltx` belongs only to the forensic XCLBIN generated beside it. Load that
exact pair in Hardware Manager. Trigger on the selected first-token run and
inspect TVALID/TREADY/TDATA on the twelve AXIS links. The protocol checkers and
counters remain present in the same bitstream, so an AXIS routing/stall issue
does not require another implementation build.
