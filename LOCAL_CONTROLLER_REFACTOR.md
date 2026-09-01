# Local-controller refactor for U250

## Resulting hierarchy

The kernel ABI and the four DDR bundles are unchanged. Internally, the old
single projection scheduler has been replaced by four complete local schedule
controllers:

```text
                         position token
                              |
          +-------------------+-------------------+
          |                   |                   |
 local decoder PE0 -> local decoder PE1 -> local decoder PE2 -> local decoder PE3
      SLR0/DDR0           SLR1/DDR1           SLR2/DDR2           SLR3/DDR3
          |                   |                   |                   |
   local mode/FSM       local mode/FSM       local mode/FSM       local mode/FSM
   local RAM/AXI        local RAM/AXI        local RAM/AXI        local RAM/AXI
```

Every local controller walks the same fixed 32-layer schedule. Blocking FIFO
traffic at RMSNorm and linear reduction boundaries keeps the controllers in
lock-step; no global layer/mode/address bus is required.

## Ownership

Each `int4_decoder_local_pe_N` owns:

- the complete layer/stage scheduler for PE `N`;
- weight-scale and RMS gamma URAM;
- residual, projection, Q, K, V, Gate and activation BRAM;
- metadata preload, residual load/store and logits store;
- local RMSNorm, attention, SwiGLU and residual-add control;
- the local DDR weight reader, INT4 MAC pipeline and output writer;
- all address, enable and mode registers used by those blocks.

The top-level dataflow graph owns only:

- the registered `position` token chain;
- two RMS pair services carrying one FP32 partial/reciprocal per event;
- two linear pair reducers and two finalizers carrying 128-bit packets;
- pairwise completion joins.

## Source split

| File | Responsibility |
|---|---|
| `int4_decoder_schedule.hpp` | One canonical fixed schedule shared by all local controllers and reducers |
| `int4_decoder_controller.cpp` | Kernel interface, four local PE roots and narrow inter-SLR task graph |
| `int4_linear_controller.cpp/.hpp` | PE-local linear stages and schedule-long pair reduction services |
| `int4_decoder_blocks.cpp/.hpp` | PE-local RMS/SwiGLU/residual blocks and schedule-long RMS pair services |
| `timing_300mhz_pre_place.tcl` | Assigns each complete local decoder root to its owning SLR |

## Inter-SLR interfaces

Only the following algorithmic streams cross a PE boundary:

| Stream | Width | Topology |
|---|---:|---|
| Position command | 12 bits | SLR0 -> SLR1 -> SLR2 -> SLR3 |
| RMS partial/reciprocal | 32 bits | pair01 <-> pair23 |
| Linear partial/pair sum | 128 bits | PE -> local pair and pair01 <-> pair23 |
| Completion | 1 bit | join01 and join23 |

## Verification

Run C++ syntax checking and HLS synthesis before exporting a new XO. In the HLS
log, the top KPN must contain all four `int4_decoder_local_pe_N` processes and
the pair services. After RTL generation, verify that the top module does not
contain a global projection `mode_reg` driving four PE memory muxes.

The full hardware link must use the updated pre-place Tcl. It expects exactly
one `int4_decoder_local_pe_N_U0` hierarchy for every PE and assigns those roots
to SLR0 through SLR3 respectively.

## Verified result (2026-09-01)

- C++ syntax check: pass.
- Vitis HLS 2023.2 C-synthesis: pass, no error or critical warning.
- Target / estimated clock: 3.333 ns / 2.787 ns (358.84 MHz estimate).
- Top and top-KPN `mode_reg` occurrences: zero.
- Local PE roots: four; each root exposes only its matching `gmemN` bundle.
- Top KPN workers: 15, all with constant `ap_start` and `ap_continue`.
- All generated KPN workers: 23 across five KPN modules.
- Auto-rewind deadlock warning `HLS 200-656`: zero.
- New XO: 8,864,862 bytes, SHA-256
  `C76827EF70E5FA88214E4B63C37FDB86AA212CE87AE933666F2183E70492AA0E`.

Post-route WNS/WHS is intentionally not claimed here; it requires a new full
U250 link using this XO and the updated floorplan.
