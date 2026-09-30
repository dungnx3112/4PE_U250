# 4PE U250 layer-trace debug repository

This repository is intentionally separate from the production `4PE_U250`
checkout.  Its kernel ABI adds one DDR trace buffer to every PE and must not be
mixed with a production host or production XCLBIN.

## What is captured

Each token produces one FP32 residual tensor with shape `[65][4096]`:

- slot 0: decoder input embedding;
- slot `1 + 2 * layer`: residual after attention projection/add;
- slot `2 + 2 * layer`: residual after FFN down projection/add.

Every PE writes its local 1024-value shard.  The host combines PE0..PE3 in
model-dimension order before saving the file.

The same XCLBIN also captures eleven layer-zero internal checkpoints in one
raw stage trace, so narrowing a mismatch does not require another XCLBIN
build:

- attention RMS INT14/E8M0 input;
- Q, K, and V Q15.17 projections;
- attention INT14/E8M0 output;
- O projection;
- FFN RMS INT14/E8M0 input;
- Gate and Up projections;
- SwiGLU INT14/E8M0 output;
- Down projection.

For the layer-zero Q and O projections, one shared deep region records enough
intermediate state to distinguish local GEMV arithmetic from the 4-PE
reduction path. O runs after Q and intentionally leaves its data in that
region; use `--deep-mode q` with the analyzer for older Q-only XCLBINs:

- every PE-local FP32 partial for all 4096 output rows;
- the exact INT14 activation word consumed by the selected MAC for every local group;
- the exact packed INT4 weights consumed for rows 0..3 in every local group;
- raw INT32 group dots for output rows 0..3 and all 32 local G32 groups;
- the matching FP32 weight scale for each audited group;
- the cumulative FP32 row sum after every audited group.

The deep stage trace is exactly 308,480 bytes per token
(`[4 PE][1205 words][64 bytes]`). Old 220,416-byte and 292,096-byte stage traces are not
compatible with the deep analyzer and must be regenerated.

## Build the debug XCLBIN

The debug build uses the same datapath source as production, while the linked
hardware clock defaults to 200 MHz for reliable trace capture. This command
rebuilds the four debug XOs once, then links one full-stage XCLBIN.

```bash
cd ~/XuanDung_AnhDuc/XuanDung/debug

DEBUG_CLOCK_HZ=200000000 \
JOBS=32 \
REBUILD_XO=1 \
XCLBIN_OUTPUT=int4_decoder_multikernel_200mhz_deep_q_debug.xclbin \
bash scripts/build_layer_trace.sh 2>&1 | tee build_deep_q.log
```

Output:

```text
int4_decoder_multikernel_200mhz_deep_q_debug.xclbin
```

## Build the matching debug host

Use a compiler with C++17 support:

```bash
source /opt/xilinx/xrt/setup.sh
HOST_OUTPUT=decode_host_layer_trace bash scripts/build_decode_host.sh
```

## Capture FPGA traces

Start with one generated token.  The two prompt forwards are also captured.

```bash
HW_ROOT=/dev/shm/deep_q_hw_$(date +%Y%m%d_%H%M%S)
mkdir -p "$HW_ROOT/layer" "$HW_ROOT/logits" "$HW_ROOT/residuals" \
  "$HW_ROOT/kv" "$HW_ROOT/stage"

./decode_host_layer_trace \
  --xclbin "$PWD/int4_decoder_multikernel_200mhz_deep_q_debug.xclbin" \
  --device 0000:13:00.0 \
  --banks /dev/shm/4PE_U250_dense \
  --rope /dev/shm/4PE_U250_dense/rope_lut.bin \
  --tokenizer /dev/shm/4PE_U250_dense/tokenizer.bin \
  --embeddings /dev/shm/4PE_U250_dense/embeddings.bin \
  --prompt "Hello" \
  --no-bos \
  --max-tokens 1 \
  --dump-layer-trace "$HW_ROOT/layer" \
  --dump-logits "$HW_ROOT/logits" \
  --dump-residuals "$HW_ROOT/residuals" \
  --dump-kv-cache "$HW_ROOT/kv" \
  --dump-stage-trace "$HW_ROOT/stage" \
  --verbose 2>&1 | tee "$HW_ROOT/host.log"

HOST_RC=${PIPESTATUS[0]}
echo "HOST_RC=$HOST_RC HW_ROOT=$HW_ROOT"
test "$HOST_RC" -eq 0
stat -c '%n %s bytes' "$HW_ROOT/stage/stage_trace_pos0000_token15043.bin"
```

## Create the software reference

Build with the GCC 9.3 compiler bundled with Vivado (some login shells select
an older `g++` that does not recognize C++14), then run with the same prompt,
position and greedy sampling:

```bash
make -C software_sim \
  CC=/home/eda/xilinx/Vivado/2023.2/tps/lnx64/gcc-9.3.0/bin/g++

SW_ROOT=/dev/shm/deep_q_sw_$(date +%Y%m%d_%H%M%S)
mkdir -p "$SW_ROOT/layer" "$SW_ROOT/kv" "$SW_ROOT/stage"

./software_sim/runq.exe /dev/shm/4PE_U250_dense \
  -z /dev/shm/4PE_U250_dense/tokenizer.bin \
  -i "Hello" --no-bos -n 1 -t 0 -s 42 \
  --dump-layer-trace "$SW_ROOT/layer" \
  --dump-kv-cache "$SW_ROOT/kv" \
  --dump-stage-trace "$SW_ROOT/stage" \
  2>&1 | tee "$SW_ROOT/software.log"

SW_RC=${PIPESTATUS[0]}
echo "SW_RC=$SW_RC SW_ROOT=$SW_ROOT"
test "$SW_RC" -eq 0
stat -c '%n %s bytes' "$SW_ROOT/stage/stage_trace_pos0000_token15043.bin"
```

## Find the first divergent layer

```bash
python3 scripts/analyze_layer_trace.py \
  --hardware /dev/shm/layer_trace_hw/layer_trace_pos0000_token00001.bin \
  --software /dev/shm/layer_trace_sw/layer_trace_pos0000_token00001.bin \
  --threshold 0.05 \
  --csv /dev/shm/layer_trace_pos0_compare.csv
```

Repeat for positions 1 through 4.  If slot zero already differs, the host input
packing or DDR mapping is wrong.  If slot `1 + 2*N` is the first mismatch, the
fault is in layer N attention/QKV/O path.  If slot `2 + 2*N` is first, the fault
is in layer N FFN gate/up/SwiGLU/down path.

After locating the first bad half-layer, add fine-grained checkpoints only for
that one layer.  Avoid tracing every internal tensor across all 32 layers,
because the extra AXI traffic and RAM readers can perturb the schedule being
diagnosed.

## Compare the compressed layer-0 KV cache

The hardware host copies the actual DDR records, while the emulator repacks
its semantic cache into the same headerless 10,240-byte layout:
`[PE0..3][local head 0..7][metadata,K0,K1,V0,V1]`.

```bash
env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH \
  /usr/bin/python3 scripts/analyze_kv_cache.py \
  --hardware /dev/shm/kv_cache_hw/kv_layer00_pos0000_token00001.bin \
  --software /dev/shm/kv_cache_sw/kv_layer00_pos0000_token00001.bin
```

An exact match moves the investigation downstream to cache routing,
dequantization, attention-output quantization, and O projection. A mismatch
moves it upstream to the Q/K/V projection boundary or KV quantize/pack logic.

## Find the first divergent internal stage

One command compares every layer-zero checkpoint captured by the full-stage
debug build:

```bash
env -u LD_LIBRARY_PATH -u PYTHONHOME -u PYTHONPATH \
  /usr/bin/python3 scripts/analyze_stage_trace.py \
  --hardware "$HW_ROOT/stage/stage_trace_pos0000_token15043.bin" \
  --software "$SW_ROOT/stage/stage_trace_pos0000_token15043.bin" \
  --deep-mode o
```

The analyzer prints `DEEP-O RESULT` after the normal stage comparison. Its
result separates packed dot/activation/weight ordering, scale addressing,
FP32 accumulation, and PE-local packet ordering. For O, it also replays the
bit-exact `(PE0 + PE1) + (PE2 + PE3)` tree from the captured local partials,
checking both the FPGA output and the software reference before blaming the
final AXIS reduction/store path. INT14/E8M0 and Q15.17 checkpoints are
compared exactly; FP32 projections report relative L2, RMSE, and maximum
absolute error.
