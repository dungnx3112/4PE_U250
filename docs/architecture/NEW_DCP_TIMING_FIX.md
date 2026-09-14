# Phân tích routed DCP 2026-09-03 và fix cho vòng P&R kế tiếp

Checkpoint đã phân tích: `../level0_wrapper_routed.dcp`  
Thiết bị: `xcu250-figd2104-2L-e`  
Clock kernel: `clk_out1_ulp_clk_wiz_0`, 3.333 ns / 300 MHz

## Kết quả STA trực tiếp từ checkpoint

| Chỉ số | Kết quả |
|---|---:|
| Trạng thái route | 855,055 / 855,055 routable nets đã route; 0 route error |
| WNS | -2.213 ns |
| TNS | -30,169.711 ns |
| Setup endpoint fail | 55,200 / 724,875 trên clock kernel |
| WHS | +0.009 ns trên clock kernel; +0.007 ns toàn design |
| Hold endpoint fail | 0 |

Worst path đi từ register slice của `memory_subsystem/.../ddr4_mem00` tới
`int4_decoder_token_controller_1/inst/gmem0_m_axi_U/bus_read/rs_rdata`:

- datapath 5.031 ns;
- logic 0.130 ns, chỉ 2.584%;
- routing 4.901 ns, chiếm 97.416%;
- chỉ có một LUT4;
- dữ liệu đi từ SLR0 tới SLR2;
- clock skew -0.199 ns và uncertainty 0.068 ns chỉ là phần nhỏ, không phải gốc lỗi.

Trong 1,000 path xấu nhất được lấy mẫu, 907 path thuộc DDR0 ↔ `gmem0_m_axi_U`.
93 path còn lại ở đầu danh sách thuộc AXI-Lite control từ
`ict_axi_ctrl_user_00` tới `control_s_axi_U`.

## Bằng chứng placement sai locality

| Hierarchy | SLR0 | SLR1 | SLR2 | SLR3 |
|---|---:|---:|---:|---:|
| gmem0 adapter | 0 | 1 | 6,494 | 0 |
| gmem1 adapter | 0 | 0 | 6,536 | 0 |
| gmem2 adapter | 0 | 0 | 6,526 | 0 |
| gmem3 adapter | 0 | 0 | 4,961 | 1,571 |
| control_s_axi | 0 | 181 | 3,231 | 0 |
| shell AXI control | 939 | 0 | 0 | 0 |
| local PE0 | 0 | 0 | 97,926 | 0 |
| local PE1 | 0 | 0 | 87,403 | 10,740 |
| local PE2 | 0 | 0 | 37,405 | 60,872 |
| local PE3 | 0 | 0 | 79,391 | 18,506 |

`USER_SLR_ASSIGNMENT=SLR1` tồn tại trên một phần PE1 nhưng không được placer giữ.
Toàn chip vì vậy mất cân bằng: SLR2 dùng 72.40% CLB và 78.20% BRAM; toàn bộ 160
URAM nằm ở SLR2/SLR3. Đây là nguyên nhân routing congestion và hàng chục nghìn
endpoint âm.

## Fix đã áp dụng

`timing_300mhz_pre_place.tcl` đã chuyển từ hint mềm chỉ cho PE1 sang một
floorplan độc lập, có phạm vi hẹp:

- `gmem0..3_m_axi_U` → lần lượt SLR0..3, cạnh DDR0..3;
- `control_s_axi_U` → SLR0, cạnh `ict_axi_ctrl_user_00` của shell;
- hierarchy nhận `USER_SLR_ASSIGNMENT`, còn leaf primitives của đúng năm adapter
  được thêm vào pblock SLR tương ứng để constraint không bị bỏ qua;
- các PE compute, local memory, position chain và reducers lớn vẫn để placer
  timing-driven.

Không bật lại hard ownership toàn kernel: run trước đã ép khoảng 441,617 leaf
primitive đúng bốn SLR nhưng post-place WNS vẫn `-4.900 ns`. Fix mới chỉ khóa
đúng hai interface family đang chiếm toàn bộ 1,000 path xấu nhất, giảm nguy cơ
tạo congestion nhân tạo trong datapath PE.

Không thêm false path, multicycle path hoặc giảm clock uncertainty để che lỗi.
Không sửa cây cộng SwiftKV ở vòng này vì nó không phải worst routed path.

## Điều kiện đánh giá vòng build kế tiếp

Chạy lại full link bằng `build_300mhz.sh` hoặc `build_300mhz.ps1`. Chỉ nhận kết quả
khi hard gate cuối build báo `TIMING_CLOSED`. Trước khi chờ route xong, log pre-place
phải có `INTERFACE_LOCALITY_APPLIED`; nếu không có marker này thì build không dùng fix.

Sau route, so sánh bắt buộc:

1. `gmem0_m_axi_U` không còn nằm ở SLR2 và `control_s_axi_U` không còn xa SLR0;
2. worst path không còn là DDR0 → gmem0 với SLR0→SLR2;
3. bốn AXI adapter nằm cùng SLR với bốn DDR; compute được placer tự cân bằng;
4. WNS/WHS đều không âm và setup/hold failing endpoint bằng 0.

Nếu interface locality đã sạch nhưng WNS còn khoảng -1 ns, vòng tối ưu RTL kế tiếp
sẽ tập trung vào BRAM control/data paths trong quantize/SwiGLU và preload, là nhóm
bottleneck thứ hai được `report_methodology` chỉ ra. Không nên sửa các path đó trước
khi loại xong sai placement ở cấp SLR.
