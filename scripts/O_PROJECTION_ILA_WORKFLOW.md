# PE0 O-projection forensic workflow

This build reuses the four existing XO files. It modifies only the packaged
PE0 RTL to add two ILAs; it does not rebuild or change the HLS algorithm.

## 1. Build on the FPGA server

```bash
cd /home/s23521141_truongnh/XuanDung_AnhDuc/XuanDung/4PE_U250_forensic
git pull origin main
bash scripts/build_o_projection_ila.sh
```

The build must produce both files:

```text
int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin
int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin.ltx
```

If `v++` completed but an older `xclbinutil` rejected `DEBUG_IP_LAYOUT`, publish
the already-built candidate without rebuilding:

```bash
bash scripts/publish_o_projection_candidate.sh \
  build_multikernel_300mhz/runs/<run-id>
```

The publisher verifies both ILA instance names in the matching `.ltx` file and
preserves any previous final artifacts with a timestamped backup suffix.

## 2. Connect Vivado

Load the new xclbin with the host program and pause the host immediately after
programming the card. Start `xvc_pcie` for the same card, open Vivado, and paste
this into the Vivado Tcl Console:

```tcl
cd /home/s23521141_truongnh/XuanDung_AnhDuc/XuanDung/4PE_U250_forensic
source scripts/connect_o_projection_ila_hw.tcl
```

The final line must be `PASS O_PROJECTION_ILA_HW_CONNECTED`.

## 3. Capture one O-only checkpoint

Choose a checkpoint, then source the capture script:

```tcl
set ::env(O_ILA_CAPTURE_POINT) output
source scripts/capture_o_projection_ila.tcl
```

When Vivado prints `BOTH O-PROJECTION ILAS ARMED`, return to the paused host
terminal and press Enter. Vivado waits for the trigger and saves `.ila`, `.csv`,
and `.vcd` files under `ila_captures/<timestamp>-<checkpoint>/`.

The same xclbin supports all checkpoints. Use one host execution per capture:

| Checkpoint | Boundary being tested |
| --- | --- |
| `input_write` | SwiftKV attention output entering activation RAM |
| `input_read` | O linear stage reading activation/scale RAM |
| `partial` | PE0 partial sums sent to the 4-PE reduction network |
| `completed` | Completed sums returned to PE0 |
| `output` | O linear output committed to projection RAM |
| `projection_read` | Residual stage reading the O projection |
| `residual` | Result after residual addition |

Recommended localization order:

```text
input_write -> input_read -> partial -> completed -> output
            -> projection_read -> residual
```

Every trigger is qualified by `mode == 3` (`INT4_LINEAR_O`). Q, K, V, GATE,
UP, and DOWN traffic therefore cannot trigger these captures.

## Automated capture

The complete host/XVC/Vivado sequence can run without the GUI:

```bash
bash scripts/run_o_projection_capture.sh input_read
```

To capture every checkpoint sequentially:

```bash
bash scripts/run_o_projection_capture.sh all
```

If `input_write` has already been captured, run only the remaining checkpoints:

```bash
bash scripts/run_o_projection_capture.sh remaining
```
