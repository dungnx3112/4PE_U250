# Trạng thái hiện tại — bản sửa critical path 300 MHz

Ngày kiểm chứng: 2026-09-01

Checkpoint `../level0_wrapper_routed.dcp` là implementation của RTL cũ. Nó fail
setup rất nặng: WNS `-13.105 ns`, TNS `-118341.414 ns`, 70,322 endpoint fail;
hold sạch với WHS `+0.009 ns`. Đường xấu nhất có 15.631/16.027 ns là routing và
đi qua control `ap_done/ap_sync/ap_continue` giữa nhiều SLR.

## Đã sửa và xác minh

- Bốn PE chạy bằng persistent `hls::task`; completion đi qua FIFO token và cây
  gom có đăng ký, không còn fan-in `ap_done/ap_continue` trực tiếp giữa bốn PE.
- Command/data/completion FIFO qua biên SLR có ownership rõ ràng. Pre-place Tcl
  chỉ neo bốn root `int4_run_local_pe_0..3` vào SLR0..3; các cell còn lại do
  placer tự bố trí.
- Critical DSP preadder/multiply 3.333 ns được thay bằng phép cộng fabric.
- Vitis HLS 2023.2 C-synthesis thành công, không có `ERROR` hay
  `CRITICAL WARNING`; tất cả loop constraint đạt.
- Estimated clock: `2.787 ns`, tương đương `358.84 MHz`, với target 3.333 ns.
- RTL có 10 KPN; 109 worker đều có `ap_start=1`, `ap_continue=1`; `ap_done` của
  worker không tham gia logic điều khiển KPN.
- XO cuối: `int4_decoder_token_controller_300mhz.xo`, 10,220,792 byte.
- SHA-256: `4BA302F2F63AB56BC6B535D3430BDE17171E4E2232FBB76F03E7A71E16FA97A8`.
- Resource HLS toàn U250: 1308 BRAM18K, 904 DSP, 366313 FF, 397750 LUT,
  160 URAM.
- `build_300mhz.sh` và `build_300mhz.ps1` đều giữ routed DCP và gọi
  `verify_300mhz_routed.tcl`. Build fail nếu route chưa đủ, có routing/DRC Error,
  WNS/WHS âm hoặc còn setup/hold path fail; XCLBIN chỉ được nhận khi có marker
  `TIMING_CLOSED`.
- Full implementation ngày 2026-09-01 cho thấy pass ép replication cũ làm WNS
  từ `-10.188 ns` xuống `-11.035 ns`. Sau ba pass tùy chỉnh, WNS chỉ đạt
  `-10.021 ns`; riêng SLR cleanup mất khoảng 2 giờ 40 phút.
- `timing_300mhz_pre_physopt.tcl` hiện là no-op. Build kiểm tra marker
  `TOOL_DRIVEN_PHYSOPT`; physical optimization do strategy Vivado thực hiện.
- Timing gate đã được thử trên checkpoint cũ và trả exit code 1 đúng như yêu cầu.

## Chưa thể khẳng định trên máy này

Máy hiện tại không có U250 `.xpfm`, nên chưa thể chạy full `v++ --link` để tạo
routed DCP mới. HLS estimate không thay thế post-route STA. Trên máy Linux có
platform mặc định, chạy từ workspace:

```bash
bash source/build_300mhz.sh
```

Kết quả chỉ đạt khi cuối log có `300MHz timing gate: TIMING_CLOSED`. Chi tiết lỗi
cũ, mapping từng nhóm cảnh báo và các thay đổi nằm trong
`PNR_300MHZ_FIX_REPORT.md`.
