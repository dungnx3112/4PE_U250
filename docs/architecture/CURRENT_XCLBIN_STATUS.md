# Trạng thái hiện tại — routed DCP 2026-09-03 và fix locality 300 MHz

Ngày kiểm chứng routed DCP: 2026-09-04

Ngày kiểm chứng lại HLS/XO: 2026-09-07

> Routed DCP mới đã được STA trực tiếp. Nó cải thiện mạnh so với artifact cũ nhưng
> vẫn chưa đóng timing. Constraint locality đã được sửa; phải route lại để xác nhận.

> Working tree hiện có một pass nhắm đúng các critical path AXI/FIFO mới: AXI
> read `2x64`, write `2x16`, `latency=32`; skid FIFO SRL 4-word cắt
> backpressure trước weight FIFO BRAM 256-word; locality chỉ áp dụng cho các
> reader/writer bridge của từng PE; placer dùng `SSI_SpreadSLLs`. XO/DCP nêu
> dưới đây có trước pass này; `build_300mhz.sh` sẽ tự rebuild XO vì source mới
> hơn artifact.

Checkpoint `../level0_wrapper_routed.dcp` mới có WNS `-2.213 ns`, TNS
`-30169.711 ns`, 55,200 setup endpoint fail trên clock kernel; WHS kernel
`+0.009 ns` và không có hold endpoint fail. Route hoàn tất 855,055/855,055 net,
không có route error. Worst path là DDR0 → `gmem0_m_axi_U`, có 4.901/5.031 ns
là routing và đi sai từ SLR0 tới SLR2.

## Đã sửa và xác minh

- Bốn `int4_decoder_local_pe_N` chạy bằng persistent `hls::task`; mỗi root sở
  hữu local scheduler, BRAM/URAM, attention, linear và AXI của đúng SLR.
- Top không còn phát `mode/state/address` tới bốn PE. Qua biên SLR chỉ còn
  position token 12-bit, RMS FP32, linear packet 128-bit và completion 1-bit.
- Pre-place Tcl đặt cứng `gmem0..3_m_axi_U` cạnh DDR0..3 và
  `control_s_axi_U` cạnh shell control ở SLR0; compute PE vẫn timing-driven.
- Critical DSP preadder/multiply 3.333 ns được thay bằng phép cộng fabric.
- Vitis HLS 2023.2 C-synthesis thành công, không có `ERROR` hay
  `CRITICAL WARNING`; tất cả loop constraint đạt.
- Estimated clock: `2.787 ns`, tương đương `358.84 MHz`, với target 3.333 ns.
- RTL có 5 KPN; 23 worker đều có `ap_start=1`, `ap_continue=1`; `ap_done` của
  worker không tham gia logic điều khiển KPN.
- XO hiện tại được lưu trong Git:
  `int4_decoder_token_controller_300mhz.xo`, 8,965,790 byte.
- SHA-256: `BE5B3ED2B261F8BD3B0C044B9EE02274142AAB769B7C5F02D468E5162BB67422`.
- Resource HLS toàn U250: 1308 BRAM18K, 900 DSP, 363118 FF, 393387 LUT,
  160 URAM.
- `build_300mhz.sh` và `build_300mhz.ps1` đều giữ routed DCP và gọi
  `verify_300mhz_routed.tcl`. Build fail nếu route chưa đủ, có routing/DRC Error,
  WNS/WHS âm hoặc còn setup/hold path fail; XCLBIN chỉ được nhận khi có marker
  `TIMING_CLOSED`.
- Full implementation ngày 2026-09-01 cho thấy pass ép replication cũ làm WNS
  từ `-10.188 ns` xuống `-11.035 ns`. Sau ba pass tùy chỉnh, WNS chỉ đạt
  `-10.021 ns`; riêng SLR cleanup mất khoảng 2 giờ 40 phút.
- Pre-place hiện chỉ thêm leaf primitive của bốn AXI master và AXI-Lite slave
  vào pblock SLR tương ứng. Đây là fix trực tiếp cho DCP mới, nơi gmem0/1/2 bị
  dồn vào SLR2 và worst AXI path đi SLR0→SLR2. Không ép lại toàn bộ 441,617 leaf
  của kernel vì run đó từng có post-place WNS `-4.900 ns`.
- Timing gate đã được thử trên checkpoint mới và trả exit code 1 đúng như yêu cầu.

## Chưa thể khẳng định trên máy này

Máy hiện tại không có U250 `.xpfm`, nên chưa thể chạy full `v++ --link` để tạo
routed DCP mới. HLS estimate không thay thế post-route STA. Trên máy Linux có
platform mặc định, chạy từ repository root:

```bash
bash build_300mhz.sh
```

Kết quả chỉ đạt khi cuối log có `300MHz timing gate: TIMING_CLOSED`. Chi tiết lỗi
cũ, mapping từng nhóm cảnh báo và các thay đổi nằm trong
`PNR_300MHZ_FIX_REPORT.md`.
