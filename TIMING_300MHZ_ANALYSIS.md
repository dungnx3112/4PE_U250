# Phân tích checkpoint routed cũ

Checkpoint: `../level0_wrapper_routed.dcp`  
Ngày phân tích: 2026-08-31

Checkpoint này thuộc RTL trước bản sửa KPN và chỉ được giữ làm bằng chứng lỗi.
Không dùng nó để đánh giá source/XO hiện tại.

## Timing của checkpoint

| Chỉ số | Giá trị |
|---|---:|
| Clock | `clk_out1_ulp_clk_wiz_0` |
| Chu kỳ | 3.333 ns / 300 MHz |
| WNS | -13.105 ns |
| TNS | -118341.414 ns |
| Setup endpoint fail | 70,322 / 1,411,995 |
| WHS | +0.009 ns |
| THS | 0.000 ns |
| Hold endpoint fail | 0 |

Worst data path dài 16.027 ns, trong đó logic chỉ 0.396 ns (2.471%) còn route
là 15.631 ns (97.529%). Nó đổi SLR lặp lại và đi trong mạng completion
`ap_done/ap_sync/ap_continue`. Vì vậy chạy thêm `phys_opt_design` không thể sửa
gốc lỗi; chính Vivado cũng báo `Path group WNS did not improve` cho các net này.

Checkpoint được route đầy đủ (873,906 fully routed nets, không có route error),
nhưng không đạt timing. `verify_300mhz_routed.tcl` đã được chạy thử trên DCP này
và cố ý trả lỗi với WNS -13.105 ns.

Phân tích đầy đủ của bản sửa nằm trong `PNR_300MHZ_FIX_REPORT.md`.
