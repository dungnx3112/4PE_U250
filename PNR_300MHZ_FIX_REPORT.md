# Báo cáo sửa P&R 300 MHz

Ngày: 2026-08-31  
Target: Alveo U250, `xcu250-figd2104-2L-e`, 300 MHz

## Kết luận hiện tại

Source đã được sửa ở mức kiến trúc, C-synthesis thành công và XO mới đã được
export. HLS estimate là 2.787 ns (358.84 MHz), tạo khoảng đệm 0.546 ns so với
clock 3.333 ns trước place/route. Không có HLS `ERROR` hay `CRITICAL WARNING`.

Máy hiện tại không có U250 `.xpfm`, nên chưa thể tạo routed DCP mới. Vì vậy chưa
được phép tuyên bố timing closure. Hai wrapper build đã có hard gate: XCLBIN chỉ
được chấp nhận nếu route đầy đủ, không có routing/DRC Error, routed WNS và WHS
đều không âm, đồng thời không còn setup/hold path fail.

## Lỗi trong DCP cũ và cách sửa

| Lỗi | Bằng chứng | Sửa trong source/flow |
|---|---|---|
| Setup fail nghiêm trọng | WNS -13.105 ns, TNS -118341.414 ns, 70,322 endpoint | Bỏ control completion tập trung; dùng persistent task và FIFO token |
| Routing chiếm gần toàn bộ path | 15.631/16.027 ns = 97.529% route | Mỗi PE sở hữu compute, memory, AXI và task trên cùng SLR |
| `ap_done/ap_sync/ap_continue` chạy qua nhiều SLR | Worst path đổi SLR nhiều lần | Cây completion 2 tầng, có FIFO/register tại biên SLR |
| `phys_opt_design` không cải thiện WNS | Nhiều `Physopt 32-953` | Sửa topology RTL trước placement, không lặp directive trên net sai kiến trúc |
| DSP arithmetic sát đúng 3.333 ns | Preadder-to-multiply trong HLS | Ép packed add sang fabric; đường 3.333 ns biến mất |
| Loop recurrence/AXI port không thể đạt II mặc định | `coefficient_token_loop`, RoPE | Đặt II=6 và II=2 đúng giới hạn vật lý đã đạt |
| Floorplan có thể âm thầm không chạy | Tcl path tương đối/hierarchy thay đổi | Config run-local dùng path tuyệt đối, marker bắt buộc |
| Route xong nhưng timing âm vẫn có thể sinh artifact | Chỉ kiểm exit code `v++` | Mở routed DCP và hard-fail khi WNS/WHS âm |

## Thay đổi kiến trúc

- `int4_task_control.hpp`: token completion, pair join và final wait.
- `int4_linear_controller.cpp`: bốn PE thành `hls::task`; command, output và
  completion đi bằng FIFO; boundary FIFO 01/12/23 được đăng ký.
- `int4_decoder_controller.cpp`: preload, residual load/store, attention,
  projection save và logits store thành task graph có cây completion.
- `int4_decoder_blocks.cpp`: RMSNorm, SwiGLU và residual add dùng task/FIFO
  completion thay cho fan-in `ap_done`.
- `swiftkv_attention.cpp`: pipeline constraint khớp recurrence và số cổng AXI.
- `timing_300mhz_pre_place.tcl`: neo PE0..3 lần lượt vào SLR0..3; neo AXI,
  memory, workers, FIFO biên và completion joins theo ownership.
- `timing_300mhz_pre_physopt.tcl`: sau placement, ép replicate các net
  `mode_reg/ap_CS_fsm/ap_sync` còn lại theo cụm tải; chạy `bram_enable_opt`,
  fanout/critical-cell/placement optimization và
  `slr_crossing_opt -tns_cleanup` trước pass AggressiveExplore chuẩn.
  Hook đã được chạy thử bằng Vivado 2023.2 trên đúng part U250: 3 control net
  thử nghiệm tạo 3 replica, các pass BRAM và SLR/TNS đều hoàn tất với exit code 0.
- `link_300mhz.cfg`: 4 AXI master ánh xạ DDR0..3; dùng SSI BalanceSLLs,
  Performance Explore và aggressive physical optimization.
- `build_300mhz.sh`/`.ps1`: run directory riêng, `--save-temps`, kiểm marker,
  tìm routed DCP và gọi hard timing gate.

## Kiểm chứng HLS/RTL

| Kiểm tra | Kết quả |
|---|---:|
| C-synthesis | PASS |
| Target / estimate | 3.333 ns / 2.787 ns |
| Estimated Fmax | 358.84 MHz |
| Loop constraints | PASS |
| HLS ERROR / CRITICAL WARNING | 0 / 0 |
| KPN RTL modules | 10 |
| Worker controls kiểm tra | 109 |
| Worker `ap_start`/`ap_continue` không hằng 1 | 0 |
| Worker `ap_done` tham gia control KPN | 0 |
| BRAM18K | 1308 / 5376 (24%) |
| DSP | 904 / 12288 (7%) |
| FF | 366313 / 3456000 (10%) |
| LUT | 397750 / 1728000 (23%) |
| URAM | 160 / 1280 (12%) |

## Phân loại toàn bộ warning còn lại

Các mục dưới đây là warning, không phải error. Không tắt warning để làm log đẹp.

| Mã | Số lượng | Đánh giá/xử lý |
|---|---:|---|
| `HLS 200-871`, `200-1016` | 16 + 16 | Một số local loop dài 2.466–2.787 ns so với effective budget 2.433 ns do uncertainty 0.900 ns; vẫn dưới clock vật lý 3.333 ns và top estimate đạt 2.787 ns. Không hạ uncertainty giả tạo. |
| `HLS 200-1888` | 24 | Vitis 2023.2 cảnh báo con trỏ ghi được đánh dấu `STABLE` trong persistent task. `STABLE` là yêu cầu để task giữ pointer; RTL đã kiểm tra còn đầy đủ BRAM write-enable và AXI AW/W channels. Ordering được bảo đảm bằng completion FIFO. |
| `HLS 200-1449`, `200-1450` | 5 + 10 | Throughput giới hạn bởi recurrence/task topology; constraint đã đặt đúng II đạt được. Không phải timing error. |
| `HLS 200-1614` | 5 | Cảnh báo cosim deadlock tổng quát cho dataflow có M_AXI; không xuất hiện lỗi synth. Completion FIFO có depth 4, start FIFO depth 8. |
| `HLS 200-2042` | 16 | URAM dependency warning; scheduler vẫn đạt II yêu cầu. Đổi sang BRAM sẽ tăng áp lực BRAM mỗi SLR nên không áp dụng. |
| `HLS 200-657` | 4 | Backward FIFO của reciprocal trong graph RMSNorm; đây là feedback channel có buffer và explicit token. |
| `HLS 200-765` | 9 | Region throughput message; không phải constraint failure. |
| `HLS 214-273`, `214-388` | 23 + 1 | Diagnostic từ vendor `hls_task.h` về pragma canonicalization; 10 KPN vẫn sinh đúng `ap_ctrl_none`. |
| `RTGEN 206-101` | 1221 | Child hierarchy port không dùng sau top-level merge/tie-off; top AXI/BRAM port ghi đã được xác nhận tồn tại. |
| `SYN 201-103`, `201-303` | 252 + 4 | RTL synthesis message về module/port nội bộ; không có synth failure. |
| `BIND 205-102`, `ANALYSIS 214-52`, `XFORM 203-561`, `SYNCHK 200-23` | 19 + 16 + 4 + 1 | Binding/analysis transform thông tin của HLS; loop bounds và hardware binding đã phản ánh trong report cuối. |

Các warning cũ `HLS 200-1018`, `200-1020`, `200-880`, `200-960` đã về 0.

## Artifact

```text
source/int4_decoder_token_controller_300mhz.xo
size:    10,220,792 byte
SHA-256: 4BA302F2F63AB56BC6B535D3430BDE17171E4E2232FBB76F03E7A71E16FA97A8
```

HLS report:
`proj_int4_decoder_300mhz/solution1/syn/report/int4_decoder_token_controller_csynth.rpt`

## Lệnh P&R bắt buộc

Trên máy Linux có platform mặc định:

```bash
cd <workspace>
bash source/build_300mhz.sh
```

Nếu đường dẫn khác:

```bash
VITIS_SETTINGS=/path/to/settings64.sh \
U250_PLATFORM=/path/to/xilinx_u250.xpfm \
bash source/build_300mhz.sh
```

Không nhận build chỉ vì `v++` trả 0. Điều kiện cuối là log có:

```text
300MHz timing gate: TIMING_CLOSED
```

và `reports/timing_gate.txt` có `WNS >= 0`, `WHS >= 0`,
`setup_failing=0`, `hold_failing=0`, `fully_routed_nets=routable_nets`,
`route_errors=0`, `drc_errors=0`.
