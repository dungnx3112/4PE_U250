# 4PE U250 layer-trace debug repository

This repository is intentionally separate from the production `4PE_U250`
checkout.  Its kernel ABI adds one DDR trace buffer to every PE and must not be
mixed with a production host or production XCLBIN.

## What is captured

Each token produces one FP32 tensor with shape `[65][4096]`:

- slot 0: decoder input embedding;
- slot `1 + 2 * layer`: residual after attention projection/add;
- slot `2 + 2 * layer`: residual after FFN down projection/add.

Every PE writes its local 1024-value shard.  The host combines PE0..PE3 in
model-dimension order before saving the file.

## Build the debug XCLBIN

The HLS datapath is scheduled with the same 300 MHz constraints as production,
but the linked hardware clock defaults to 200 MHz for reliable trace capture.

```bash
cd ~/XuanDung_AnhDuc/XuanDung/debug

DEBUG_CLOCK_HZ=200000000 \
JOBS=32 \
bash scripts/build_layer_trace.sh
```

Output:

```text
int4_decoder_multikernel_200mhz_layer_trace.xclbin
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

./decode_host_layer_trace \
  --xclbin "$PWD/int4_decoder_multikernel_200mhz_layer_trace.xclbin" \
  --device 0000:13:00.0 \
  --banks /dev/shm/4PE_U250_dense \
  --prompt "Hello" \
  --max-tokens 1 \
  --dump-layer-trace /dev/shm/layer_trace_hw \
  --dump-logits /dev/shm/layer_trace_hw/logits \
  --dump-residuals /dev/shm/layer_trace_hw/residuals \
  --verbose
```

## Create the software reference

Build `software_sim/llama2_decoder_sw_emulator.cpp` as usual, then run it with
the same dense bank directory, prompt, and greedy sampling:

```bash
mkdir -p /dev/shm/layer_trace_sw

./llama2_decoder_sw_emulator /dev/shm/4PE_U250_dense \
  -z /dev/shm/4PE_U250_dense/tokenizer.bin \
  -i "Hello" -n 1 -t 0 \
  --dump-layer-trace /dev/shm/layer_trace_sw
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
