# Trạng thái sửa lỗi XCLBIN 300 MHz

Ngày kiểm chứng: 2026-08-29

## Kết luận nguyên nhân

`level0_wrapper_routed_error.dcp` không thể dùng để tạo XCLBIN hợp lệ trước hết vì
implementation đã thất bại ở bước route, không phải vì lỗi cú pháp C++:

- 774,201 net chưa route và 74 net có routing error;
- WNS = -9.458 ns, TNS = -59,311.172 ns;
- 27,626 SLL được dùng; riêng biên SLR1/SLR2 dùng 13,649/23,040 SLL (59.24%).

Một implementation cũ của cùng kiến trúc đã route đủ 899,946 net và có 0 routing
error, nhưng vẫn không đạt timing 300 MHz (WNS = -2.107 ns). Vì vậy nguyên nhân trực
tiếp của DCP hiện tại là floorplan/routing regression; source HLS cũng có vấn đề kiến
trúc control crossing cần sửa để đạt 300 MHz ổn định.

Các worst setup path của DCP lỗi đi qua `ap_done`, `ap_ready` và
`ap_sync_continue` của nhiều PE/SLR. Đây là các phép join control bốn nhánh do HLS
tạo ra, làm placement/routing kéo logic điều khiển xuyên nhiều SLR.

## Source đã sửa

- Các wrapper load/store/preload tuần tự không còn dùng DATAFLOW bốn nhánh.
- Linear engine được chia thành hai process pair-local: PE0/PE1 và PE2/PE3.
- RMSNorm sum, normalize/quantize và SwiGLU quantize được chia theo pair-local;
  bước merge cuối giữ nguyên thứ tự cộng số thực ban đầu.
- Dispatcher phát command qua FIFO đã đăng ký thay vì tạo biểu thức control trực
  tiếp trong DATAFLOW region.
- SwiftKV done-token join được đóng gói trong process riêng.
- Floorplan chỉ hard-anchor AXI, memory và arithmetic; hierarchy control được để
  placer phân bố, đồng thời kiểm tra bắt buộc các wrapper pair-local mới.

## Kết quả HLS mới

- Vitis HLS 2023.2 `csynth_design`: thành công, tất cả loop constraint đạt.
- Estimated Fmax: 411.00 MHz, cao hơn target 300 MHz.
- Tài nguyên ước tính: 1,682 BRAM_18K, 860 DSP, 407,322 FF, 345,778 LUT,
  264 URAM.
- XO mới: `int4_decoder_token_controller_300mhz.xo`.
- SHA-256: `41C839799AA1935ECAFBF5C7615099F00C2FFD5BF35B83E7BF4AFB30D596AA20`.
- Không có `ERROR`, `HLS 214-113` hoặc `HLS 200-471` trong solution log.

## Điều kiện để xác nhận XCLBIN đã fix hoàn toàn

Máy hiện tại chưa có U250 `.xpfm`, nên chưa thể tạo routed DCP mới. Build wrapper
sẽ chủ động fail nếu thiếu bất kỳ điều kiện nào sau đây:

- floorplan/pair-local/hard-anchor hook đã chạy;
- mọi hard anchor nằm đúng SLR;
- mỗi biên SLR dùng dưới 50% SLL;
- 0 unrouted net và 0 routing error;
- WNS >= 0 và WHS >= 0;
- 0 DRC Error.

Chạy full link khi có platform:

```powershell
.\build_300mhz.ps1 -Platform '<đường-dẫn-U250.xpfm>'
```

Chỉ khi lệnh trên kết thúc thành công và in marker
`ROUTE_AND_TIMING_VALIDATED` mới có thể khẳng định XCLBIN/DCP mới đã sạch hoàn toàn.
