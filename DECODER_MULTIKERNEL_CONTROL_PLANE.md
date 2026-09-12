# Decoder multi-kernel control plane — 4 CU / 4 SLR

Đây là control plane thay thế cho top monolithic khi build decoder ở 270 MHz.
Datapath MatMul, RMSNorm và SwiftKV Attention không bị viết lại; bốn local PE
cũ được tái sử dụng nguyên trạng qua boundary `int4_decoder_local_pe_N`.

Top monolithic `int4_decoder_token_controller` vẫn được giữ làm baseline và
regression target. Top mới gồm bốn CU độc lập:

| CU | SLR / DDR | Logic sở hữu |
|---|---|---|
| `pe0` | SLR0 / DDR0 | local PE0 |
| `pe1` | SLR1 / DDR1 | local PE1, RMS pair01, linear reducer01, finalizer01 |
| `pe2` | SLR2 / DDR2 | local PE2, RMS pair23, linear reducer23, finalizer23 |
| `pe3` | SLR3 / DDR3 | local PE3 |

Mỗi CU có đúng năm con trỏ AXI master cục bộ trên một bundle DDR:
`model_bank`, `rope_lut`, `residual`, `logits`, `kv_cache`. Vì vậy mỗi top HLS
chỉ còn gate địa chỉ năm ngõ của chính SLR đó; không còn `entry_proc` chờ đồng
thời 20 địa chỉ xuyên bốn SLR.

## Liên kết giữa các CU

Chỉ scalar RMS FP32 và packet reduction 128-bit đi qua AXI4-Stream. Mọi cổng
đều dùng `register_mode=both`, còn FIFO dung lượng thực nằm ở hai phía bên
trong kernel.

```text
pe0 / SLR0 <====> pe1 / SLR1 <====> pe2 / SLR2 <====> pe3 / SLR3
 local only       reduce/finalize01   reduce/finalize23    local only
```

Có đúng 12 kết nối point-to-point trong
`link_decoder_multikernel_270mhz.cfg`:

- SLR0↔SLR1: RMS partial/reciprocal, linear partial/completed output.
- SLR1↔SLR2: RMS pair sum/reciprocal, linear pair01/pair23 sums.
- SLR2↔SLR3: RMS partial/reciprocal, linear partial/completed output.

Relay trong mỗi CU chạy lịch decoder cố định 32 layer cộng final
RMS/logits. Nó chuyển đúng số packet của từng mode, nên AXIS top không được
dùng như một FIFO vô hạn và không cần stream `TLAST` để phân ranh giới stage.

## Contract phía host

Một token là một invocation đồng thời của cả bốn CU. Host phải:

1. Dùng cùng một `position` cho cả bốn CU.
2. Truyền năm buffer thuộc đúng DDR của CU tương ứng.
3. Start cả bốn run theo kiểu non-blocking trước khi wait bất kỳ run nào.
4. Nên start hai coordinator `pe1`, `pe2` trước rồi mới start `pe0`, `pe3`.
5. Chờ đủ bốn run hoàn tất trước khi đọc logits hoặc bắt đầu token kế tiếp.

Ví dụ thứ tự XRT (các AXIS link không phải host argument):

```cpp
auto run1 = pe1(position, model1, rope1, residual1, logits1, kv1);
auto run2 = pe2(position, model2, rope2, residual2, logits2, kv2);
auto run0 = pe0(position, model0, rope0, residual0, logits0, kv0);
auto run3 = pe3(position, model3, rope3, residual3, logits3, kv3);

run0.wait();
run1.wait();
run2.wait();
run3.wait();
```

Invocation đầu tiên sau khi program/reprogram FPGA vẫn phải dùng
`position == 0`, vì metadata model persistent được preload riêng bên trong
từng CU.

## Build

Synthesize/export cả bốn XO:

```powershell
Set-Location C:\KLTN\4PE_U250
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_decoder_multikernel.tcl
```

Để chỉ synthesize một CU khi debug, đặt `INT4_DECODER_PE` bằng `0`, `1`, `2`
hoặc `3` trước khi gọi script.

Full hardware link trên máy có U250 platform:

```powershell
.\build_decoder_multikernel_270mhz.ps1 `
  -Platform '<U250 xpfm>' `
  -Output 'int4_decoder_multikernel_270mhz.xclbin'
```

Wrapper tự rebuild XO nếu thiếu hoặc cũ hơn source. Thêm `-RebuildXo` để ép
rebuild. Candidate XCLBIN chỉ được publish sau khi routed DCP route đầy đủ,
không có DRC Error và cả WNS/WHS đều không âm.

HLS estimate không phải bằng chứng 270 MHz. Clock 270 MHz chỉ được coi là đạt
khi hard gate trên routed DCP pass; điểm timing HLS hiện nằm trong SwiftKV
Attention, không nằm trong MatMul đã được route ở 270 MHz.
