# 4-PE U250 deadlock: root cause, HLS fix, and RTL comparison

Date: 2026-09-25

## Result

The captured hardware run proves a distributed stream stall, but the old
profile image has no AXI-stream monitors and therefore cannot identify one
specific first-blocked channel. Source and generated-RTL analysis found two
HLS topologies that match the observed failure mode:

1. The per-linear-stage DATAFLOW sink wrote directly into the caller-owned
   `projection` RAM while it also waited on a predecessor stream. Vitis HLS
   emitted `HLS 200-1614` for this topology.
2. Explicit completion-token `join`/`wait` networks duplicated DATAFLOW's own
   process-completion synchronization. They added a second control graph to
   the cyclic four-PE data graph.

The fix terminates each linear DATAFLOW transaction in a fully sized FIFO,
commits that FIFO to `projection` only after DATAFLOW completes, removes the
redundant completion graph, and removes the same `HLS 200-1614` topology from
the SwiftKV update path. All four kernels now synthesize with zero
`HLS 200-1614` warnings and unchanged external RTL interfaces.

Hardware validation still requires a newly built XCLBIN. The old
`int4_decoder_multikernel_150mhz_profile.xclbin` contains the old RTL.

## Evidence from the failed hardware run

Evidence directory: `20260925-004705-46509`

- All four CUs were launched, but none completed: accelerator monitor counters
  showed `Starts=1`, `Ends=0` for PE0..PE3.
- Each CU ran for about 8732.7 ms with approximately 100% intra-kernel
  dataflow stall and inter-kernel pipe stall; reported external-memory stall
  time was zero.
- The AXI firewall reported
  `READ_RESPONSE_BUSY | RECS_ARREADY_MAX_WAIT`. This is consistent with a
  weight-reader AXI request path becoming blocked after downstream stream
  backpressure propagates into the local compute pipeline.
- The XCLBIN contained four accelerator monitors but zero stream monitors:
  `XCL_PERF_MON_ACCEL=4`, `XCL_PERF_MON_STR=0`. Therefore the old trace cannot
  distinguish starvation (`TVALID=0`) from backpressure (`TREADY=0`) on a
  particular link.
- PE1 and PE2 starting tens of microseconds before PE0 and PE3 explains a
  short initial starvation interval, not an 8.7-second permanent stall.

The HLS maximum estimate before the fix was 351,992,590 cycles. Even at the
150 MHz debug clock this is about 2.347 seconds, well below the observed
8.7-10 second timeout. The timeout is not explained by ordinary compute
latency.

## Packet-count audit

The fixed local schedule contains 65 RMS events and 225 linear stages.
Producer/consumer counts are algebraically balanced for every linear mode:

- Each PE emits `output_tiles * INT4_ROW_BLOCKS` partial packets.
- A pair reducer consumes that count from each of its two PEs and splits the
  sums into two halves of
  `(output_tiles / 2) * INT4_ROW_BLOCKS` packets.
- Since `local_output_tiles = output_tiles / 4`, each finalizer consumes
  `2 * local_output_tiles * INT4_ROW_BLOCKS` packets from each pair-half and
  emits `local_output_tiles * INT4_ROW_BLOCKS` packets to each local PE.
- A local output packer reads four 128-bit packets for every 512-bit output
  word, exactly matching
  `local_output_tiles * INT4_OUTPUT_WORDS_PER_TILE` output words.

No packet-count mismatch was found in RMS or linear relays. The failure is a
control/buffering cycle, not a static producer/consumer count error.

## HLS changes

### Linear stage

Before:

```text
local compute ----> inter-PE reduction ----> store directly to projection RAM
      |                                          |
      +---- completion_compute                    +---- completion_store
                     \                            /
                      join completion -> wait
```

After:

```text
DATAFLOW region:
local compute ----> inter-PE reduction ----> pack ----> FIFO[504 x 512]

sequential caller:
FIFO[504 x 512] ----> commit projection RAM
```

The FIFO depth is exactly the maximum transaction size: logits mode produces
`63 * 8 = 504` words. Consequently the DATAFLOW producer can always finish
without waiting for the later RAM commit. This is a bounded liveness property,
not a depth chosen from trial and error.

The old `command_store` predecessor and the local compute/store completion
tokens were removed. `mode` is a stable scalar input to the packer.

### Top-level completion graph

Every relay and local controller has a finite compile-time schedule. Standard
DATAFLOW already waits for every process to assert `ap_done`, so the separate
completion FIFO trees were redundant. They were removed from PE0..PE3 and the
shared monolithic controller. Packet streams and external interfaces were not
changed.

### SwiftKV

The old SwiftKV structure broadcast one control token, then four predecessor
processes independently combined that token with caller-owned V streams. HLS
emitted four `HLS 200-1614` warnings per PE. The broadcast and four prepare
processes are now one lock-step prepare process. It reads shared metadata and
control once per token, reads the four physically partitioned V words, and
writes four independent phase FIFOs in parallel.

## Generated RTL comparison

Vitis HLS 2023.2, part `xcu250-figd2104-2L-e`, target 3.0 ns, uncertainty
0.270 ns.

| PE | Version | Best cycles | Worst cycles | BRAM18 | DSP | FF | LUT | URAM |
|---:|:--|--:|--:|--:|--:|--:|--:|--:|
| 0 | before | 341,321,873 | 351,992,590 | 353 | 314 | 116,026 | 124,934 | 40 |
| 0 | after  | 341,435,889 | 352,110,169 | 368 | 314 | 116,509 | 124,036 | 40 |
| 1 | before | 341,321,915 | 351,992,590 | 365 | 344 | 123,124 | 133,840 | 40 |
| 1 | after  | 341,435,931 | 352,110,169 | 380 | 344 | 123,592 | 132,853 | 40 |
| 2 | before | 341,321,882 | 351,992,590 | 365 | 332 | 122,552 | 133,258 | 40 |
| 2 | after  | 341,435,898 | 352,110,169 | 380 | 332 | 123,020 | 132,271 | 40 |
| 3 | before | 341,321,873 | 351,992,590 | 353 | 314 | 116,026 | 124,934 | 40 |
| 3 | after  | 341,435,889 | 352,110,169 | 368 | 314 | 116,509 | 124,036 | 40 |

Per PE delta:

- BRAM18: +15, exactly the synthesized `512 x 504` staging FIFO.
- DSP and URAM: unchanged.
- FF: +468 to +483.
- LUT: -898 on PE0/PE3 and -987 on PE1/PE2.
- Worst-case latency: +117,579 cycles, 0.03340%; at 150 MHz this is 0.784 ms.
- Estimated clock period remains 3.041 ns (328.84 MHz) for all four PEs.

Structural RTL differences for PE0 are representative of all four PEs:

- Verilog modules: 225 before, 213 after.
- Added: `int4_run_local_linear_stage_dataflow_0_s`,
  `int4_pack_local_output_terminal_0_s`,
  `int4_commit_local_output_0_s`, and `fifo_w512_d504_B`.
- Removed: `int4_run_local_pe_with_completion_0_s`,
  `int4_store_local_output_0_s`, both local and top-level completion joins and
  waits, four per-engine SwiftKV prepare modules, and the SwiftKV control
  broadcast module.
- A scan of the final Verilog found no `completion_local`,
  `completion_relay`, `completion_joined`, `join_task_completion`, or
  `wait_task_completion` instance in any PE.
- The complete top-level port name/direction/width/protocol sets are identical:
  77 ports for PE0/PE3 and 89 ports for PE1/PE2. The link configuration and
  host ABI do not change.

## Remaining warnings

Each PE retains one `HLS 200-765` and one `HLS 200-1450` warning at
`int4_decoder_local_pe_N`. These indicate that a top-level process which has
stream successors also writes caller-visible memory and is therefore included
in output synchronization. They can constrain throughput, but they are not the
streamed-array/predecessor deadlock warning removed above.

Final warning counts per PE:

```text
HLS 200-1614: 0
HLS 200-765:  1
HLS 200-1450: 1
```

## Rebuild and hardware validation

Do not reuse an old XO after an HLS source change.

```bash
REUSE_PROFILE_XO=0 \
ENABLE_STALL_PROFILE=1 \
ENABLE_FULL_STREAM_DEBUG=1 \
DEBUG_CLOCK_HZ=150000000 \
JOBS=32 \
bash scripts/debug_u250_deadlock.sh build
```

The expected default output is
`int4_decoder_multikernel_150mhz_full_debug.xclbin`. Copy/read model data from
`/dev/shm/4PE_U250` to avoid the previously observed filesystem I/O error, then
run one token:

```bash
DEVICE=0000:13:00.0 \
XCLBIN="$PWD/int4_decoder_multikernel_150mhz_full_debug.xclbin" \
HOST="$PWD/decode_host_profile" \
BANKS_DIR=/dev/shm/4PE_U250 \
PROMPT="Hello" \
MAX_TOKENS=1 \
bash scripts/debug_u250_deadlock.sh run
```

Acceptance checks:

1. XCLBIN loads and all four CUs finish (`Starts=1`, `Ends=1`).
2. No AXI firewall trip is reported.
3. `summary.csv` reports 12 stream monitors for the full-debug XCLBIN.
4. If a timeout remains, the 12 monitored links identify the first FIFO with
   sustained `TVALID && !TREADY` or `!TVALID && TREADY`; the old profile image
   could not provide this evidence.
