# RTL review and hardened HLS (2026-10-08)

## What the RTL does and does not prove

The available local accumulator RTL was read, including:

`_rtl_check/xo_pe0_latest/ip_repo/xilinx_com_hls_int4_decoder_pe0_kernel_1_0/hdl/verilog/`

- `int4_decoder_pe0_kernel_int4_accumulate_local_partial_tiles_0_s.v`
- `int4_decoder_pe0_kernel_int4_accumulate_local_partial_tiles_Pipeline_local_partial_continuous_mac_loop.v`

For splitter, scale emitter and block-memory ownership, the complete generated
tree from the dense-source sequence test was read:

`_evidence_analysis/o_sequence_cosim/project/solution_300mhz/syn/verilog/`

These are **local artifacts**, not an authenticated extraction of the exact
100-MHz XCLBIN currently on the server. Do not equate the two without hashes
and its matching XO/build manifest. In particular the root
`int4_decoder_pe0_kernel_300mhz.xo` embeds an older `group_scale` implementation,
not the current four raw-scale-lane dense pipeline. The build script therefore
freshly synthesizes all four XOs in an isolated workspace before linking.

### Accumulator

The original continuous loop has a 28-stage pipeline. It maintains Q in
`quantized_fu_848`, prefetch Q in `next_quantized_fu_844`, and activation FP
scale in `current_act_scale_fu_852`. Q handoff is scheduled at iteration 2;
the scale update/select occurs at iteration 11. The actual dot products use
per-lane registers distributed across later stages.

The shared stall is the OR of `weight_buffer_empty_n == 0` and all four
`scale_lane*_empty_n == 0`. All five FIFO reads, state updates, and arithmetic
clock enables are gated by that stall. Partial RAM reads are scheduled at
iteration 18, captured at 19, and written at 27 with pipelined row addresses.
This is not evidence of a simple one-clock BRAM misalignment or independent
scale FIFO consumption. The accumulator wrapper also preloads Q[0] before
consuming the command; the stage-owned snapshot is intended to already be
stable at that time. That assumption still needs checking on the actual card.

The conservative rewrite makes Q and activation scale **constant arguments**
to a 32-row pipeline, and waits for its completion before incrementing the
group counter. There is no row-28 prefetch, row-31 handoff or mutable scale
recurrence inside that pipeline. Four independent signed MACs replace the
packed arithmetic. Products are signed 18-bit, sums signed 23-bit. The lane
order remains `{1,0,3,2}`; FP32 operation/accumulation order remains unchanged.

The packed implementation relies on the producer's symmetric +/-8191 clamp:
32*(-8192)*(-8) is +2^21, which does not fit a signed 22-bit low packed half.
The existing production quantizers clamp to +/-8191, so this endpoint alone
is **not** a demonstrated cause of the captured hardware error. The scalar
implementation also handles the entire signed-14 input range.

### Scale emitter and splitter

The old emitter was flattened across the tile/word loops. It reads the
ping-pong scale RAM at iteration 2, releases a tile on its last word, and
writes four scale lanes at iteration 4. All lane writes share the OR of all
four `full_n == 0` conditions. The RAM wrapper has `prev_tptr` and stalled-read
holding registers, so an early lock release is not by itself a proved bug.

The scale extraction matches the dense layout:

`word = row_block/4`, `scalar = (row_block%4)*8 + 2*lane + group_in_tile/4`.

The old splitter classifies offsets 0..127 as scale and 128..4223 as weight;
its offset and remaining-word counters stop under the correct downstream
stall. No off-by-one was identified in these comparisons.

The hardened emitter copies eight 512-bit scale words into fully partitioned
registers while holding `read_lock`, then releases that lock after the copy
pipeline drains. A separate output pipeline reads only those registers. It
cannot touch/release/reselect the scale-block RAM during scale-lane stalls.
`LOOP_FLATTEN off` keeps the next tile from replacing those registers early.
The hardened splitter uses a block loop with explicit 128-scale and
4096-weight phases, removing the conditional demux/rolling-offset recurrence.

## Source/build behavior

`INT4_ACCUM_DEBUG_VARIANT=3` is now the source default and the `hardened` image.
Explicit 0/1/2 retain the three previous control implementations, including
the old splitter/emitter. The safe path is slower and may use more resources;
it is a correctness-first candidate, not a confirmed U250 repair or timing
closure guarantee. It applies to all linear modes and all four PEs.

```bash
# Single entry point: fresh all-four-PE HLS for baseline and hardened,
# internal ILAs, separate workspaces, parallel 100-MHz links:
bash build_full_ila_xclbin.sh
```

The launcher prints RUN_DIR and validates XCLBIN/LTX/probe manifests for both
images. It uses four HLS workers total and eight link jobs per image by default.
U250_PLATFORM must point to the existing platform .xpfm; its default matches
the previous build wrapper. `--check` performs preflight without building.

```bash
RUN_DIR=/absolute/path/printed/by/the/launcher
O_DEEP_VARIANTS="baseline hardened" \
  bash scripts/capture_o_projection_deep_suite.sh "$RUN_DIR"
```

Always capture input_write separately for each image. Earlier Q/K/V results
can change and therefore O's input golden cannot be reused across builds.

## Regression

`scripts/run_hls_linear_hardened_test.tcl` instantiates the real splitter,
scale packer/emitter, weight buffer, accumulator and partial emitter, with a
stage-owned BRAM activation snapshot. Its model feeder sends 32 words then
waits 32 clocks; its output drain accepts one partial packet per 128 clocks.
The synthesis/simulation depth limits actually exert backpressure, unlike
the unbounded C simulation FIFOs. The test is smaller than the full decoder
and does not include attention, four-PE reduction, PCIe or real DDR behavior.

The independent native-integer/FP32 golden checks 3,072 output lanes across:

- O, four output tiles, 32 groups, signed per-tile/per-row/per-lane scales;
- DOWN, sixteen output tiles, 88 groups, 11 superblocks, all Q=-8192 and W=-8;
- O again with zero Q and signed scale endpoints, verifying repeated calls.

C simulation passed all 3,072 lanes. HLS synthesis passed, and the MAC row
loop achieved II=1 with 27-cycle iteration latency. RTL inspection confirmed
constant group Q/scale arguments and a register-only scale-output pipeline.
C/RTL co-simulation **passed all three transactions and all 3,072 FP32 lanes**,
including real bounded-FIFO input/output backpressure. The test uses the
generated arithmetic IPs, not FP blackboxes. Full PE0 synthesis results are
recorded separately; only a completed PASS constitutes verification. Full
four-kernel placement/routing and hardware correctness still require the
server run.

```bash
vitis_hls -f scripts/run_hls_linear_hardened_test.tcl
```

Local logs: `_evidence_analysis/linear_hardened_hls.log` and
`_evidence_analysis/linear_hardened_pe0_hls.log`.

The scalar-MAC control (variant 2, retaining the old splitter/emitter) also
passed the same 3,072-lane C/RTL backpressure regression. This is evidence
against claiming a demonstrated scale/splitter ordering defect from these
tests. Full production PE0 HLS synthesis succeeded; local XO export hit the
Windows path-length limit. No locally exported XO, full four-kernel routed
image or hardware repair is claimed. The server launcher uses fresh Linux
workspaces and must complete the exports, link and timing checks there.

## Continuous scalar throughput candidate (variant 4)

The default remains variant 3, the implementation tested on U250. Variant 4
keeps the activation snapshot, independent signed MACs and explicit splitter,
but reads Q/activation scale by the current word's group address in every
iteration. It does not use row-28 Q prefetch, row-31 Q handoff or a mutable
activation-scale recurrence. The MAC pipeline drains once per output tile,
rather than once per group. The scheduler must retain the true partial-RAM
dependency; no false-dependence directive is used.

Scale prefetch copies eight words while holding the source block lock and
publishes a complete 4096-bit snapshot through a two-packet FIFO. The emitter
holds its own packet in registers for all 256 output words while prefetch
prepares the next tile. FIFO stalls cannot overwrite that private packet.
The emitter still drains between tiles; only the eight-word BRAM-copy latency
is overlapped. The original variant-3 scale emitter is unchanged.

The regression now adds 16 nonzero O output tiles without artificial gaps,
in addition to the three previous backpressure/endpoint/repeated-call cases,
for 5120 FP32 lane comparisons. Run variant 4 explicitly:

```bash
O_ACCUM_IMPL=4 vitis_hls -f scripts/run_hls_linear_hardened_test.tcl
```

Production build, fresh four-PE XOs, no ILA:

```bash
REBUILD_XO=1 REUSE_XO=0 \
ENABLE_O_PROJECTION_ILA=0 ENABLE_STALL_PROFILE=0 ENABLE_FULL_STREAM_DEBUG=0 \
INT4_HLS_EXTRA_CFLAGS='-DINT4_ACCUM_DEBUG_VARIANT=4' JOBS=8 \
XCLBIN_OUTPUT=int4_decoder_multikernel_300mhz_fast_hardened_clean.xclbin \
  bash scripts/build_decoder_multikernel_300mhz.sh
```

Any HLS/export failure now stops the build even when four old XO files exist.
The ILA launcher continues to compare baseline against the card-tested
variant 3; variant 4 uses the production build command above.

The 46--47 ms target is about 13.8--14.1 million CU cycles at 300 MHz. A dense
bank contains 13,516,736 512-bit words, giving roughly 45 ms for one word per
clock before stage/DDR overhead. This is a throughput target, not a measured
variant-4 hardware latency or a routed timing guarantee. The server must
complete four-PE placement/routing and repeat the known token regressions.

Local verification on 2026-10-08: variant 4 passed C simulation, synthesis
and xsim C/RTL co-simulation with all 5120 FP32 lanes equal to the independent
golden. Variant 3 passed the same expanded regression. Full production PE0
synthesis also passed, with all loop constraints satisfied and estimated
Fmax 315.18 MHz; its continuous MAC remained II=1 with 27-cycle iteration
latency. The MAC process takes 1051 cycles for 1024 O words, versus about 2022
cycles per output tile for variant 3. Scale emission takes 261 cycles per
256 words, versus 273 for variant 3.

Those are individual-process synthesis estimates. The regression's external
model feeder dominates the no-gap transaction (77955 cycles for variant 4
versus 77968 for variant 3), so that test proves correctness under stalls,
not a board-level speedup. Production uses the separate burst DDR reader.
Local logs are `_evidence_analysis/linear_fast_prefetch_v4_hls.log`,
`_evidence_analysis/linear_fast_control_v3_hls.log` and
`_evidence_analysis/linear_fast_prefetch_pe0_v4_hls.log`.
