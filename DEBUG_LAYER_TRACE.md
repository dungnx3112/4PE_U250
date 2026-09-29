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

## Build the debug XCLBIN

The debug build uses the same datapath source as production, while the linked
hardware clock defaults to 200 MHz for reliable trace capture. This command
rebuilds the four debug XOs once, then links one full-stage XCLBIN.

```bash
cd ~/XuanDung_AnhDuc/XuanDung/debug

DEBUG_CLOCK_HZ=200000000 \
JOBS=32 \
bash scripts/build_layer_trace.sh
```

Output:

```text
int4_decoder_multikernel_200mhz_full_stage_debug.xclbin
```

## Build the matching debug host

Use a compiler with C++17 support:

```bash
source /opt/xilinx/xrt/setup.sh

g++ -std=c++17 -O2 -g host/decode_host.cpp \
  -o decode_host_layer_trace \
  -I"$XILINX_XRT/include" \
  -L"$XILINX_XRT/lib" \
  -lxrt_coreutil -pthread
```

## Capture FPGA traces

Start with one generated token.  The two prompt forwards are also captured.

```bash
mkdir -p /dev/shm/layer_trace_hw
mkdir -p /dev/shm/kv_cache_hw
mkdir -p /dev/shm/stage_trace_hw

./decode_host_layer_trace \
  --xclbin "$PWD/int4_decoder_multikernel_200mhz_full_stage_debug.xclbin" \
  --device 0000:13:00.0 \
  --banks /dev/shm/4PE_U250_dense \
  --prompt "Hello" \
  --max-tokens 1 \
  --dump-layer-trace /dev/shm/layer_trace_hw \
  --dump-logits /dev/shm/layer_trace_hw/logits \
  --dump-residuals /dev/shm/layer_trace_hw/residuals \
  --dump-kv-cache /dev/shm/kv_cache_hw \
  --dump-stage-trace /dev/shm/stage_trace_hw \
  --verbose
```

## Create the software reference

Build `software_sim/llama2_decoder_sw_emulator.cpp` as usual, then run it with
the same dense bank directory, prompt, and greedy sampling:

```bash
mkdir -p /dev/shm/layer_trace_sw
mkdir -p /dev/shm/kv_cache_sw
mkdir -p /dev/shm/stage_trace_sw

./llama2_decoder_sw_emulator /dev/shm/4PE_U250_dense \
  -z /dev/shm/4PE_U250_dense/tokenizer.bin \
  -i "Hello" -n 1 -t 0 \
  --dump-layer-trace /dev/shm/layer_trace_sw \
  --dump-kv-cache /dev/shm/kv_cache_sw \
  --dump-stage-trace /dev/shm/stage_trace_sw
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
  --hardware /dev/shm/stage_trace_hw/stage_trace_pos0000_token00001.bin \
  --software /dev/shm/stage_trace_sw/stage_trace_pos0000_token00001.bin
```

Repeat with `stage_trace_pos0004_token00626.bin` for the first forward that
produces a different greedy token. INT14/E8M0 and Q15.17 checkpoints are
compared exactly; FP32 projections report relative L2, RMSE, and maximum
absolute error.
