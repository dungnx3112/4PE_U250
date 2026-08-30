# INT4 Llama-2 7B decoder — 4 PE độc lập trên Alveo U250

Source này hiện thực một token decode đầy đủ bằng Vitis HLS 2023.2 cho
`xcu250-figd2104-2L-e`. Kiến trúc được tổ chức theo nguyên tắc bắt buộc:

- PE0 / SLR0 / DDR0 là một miền dữ liệu độc lập.
- PE1 / SLR1 / DDR1 là một miền dữ liệu độc lập.
- PE2 / SLR2 / DDR2 là một miền dữ liệu độc lập.
- PE3 / SLR3 / DDR3 là một miền dữ liệu độc lập.
- Không PE nào đọc model, RoPE, residual hay KV cache của PE khác.
- Chỉ partial output 128-bit và scalar command/reduction đã đăng ký được phép
  đi qua biên SLR.

Kernel top là `int4_decoder_token_controller`. Một invocation nhận hidden state
đã embedding, chạy 32 decoder layer, cập nhật bốn KV cache cục bộ và ghi bốn
shard logits.

## Thành phần source hiện tại

| File | Vai trò |
|---|---|
| `int4_decoder_controller.cpp/.hpp` | Top kernel, scheduler 32 layer và các command-chain liên SLR |
| `int4_linear_controller.cpp/.hpp` | GEMV INT4 4 PE, overlap DDR/compute và reduction output |
| `int4_decoder_blocks.cpp/.hpp` | RMSNorm, SwiGLU, residual và token-chain cục bộ |
| `swiftkv_attention.cpp/.hpp` | RoPE, KV cache INT8 và online-softmax attention cục bộ |
| `int4_model_layout.hpp` | Shape, padding và offset cố định của mỗi DDR |
| `int4_weight_packer.cpp/.hpp` | Packer offline tạo bốn model image input-column-sharded |
| `link_300mhz.cfg` | Ánh xạ `gmem0..3` tới `DDR[0]..3` |
| `timing_300mhz_*.tcl` | Hard floorplan và kiểm tra physical/timing bắt buộc |
| `tests/int4_layout_packer_test.cpp` | Test padding, offset, nibble order, scale, residual, logits và RoPE |

## Kiến trúc dữ liệu

| Đại lượng | Global | Padded | Mỗi PE |
|---|---:|---:|---:|
| Model dimension | 4096 | 4096 | 1024 |
| FFN hidden | 11008 | 11264 | 2816 |
| Vocabulary | 32000 | 32256 | 8064 |
| Attention head | 32 | 32 | 8 |

Mọi ma trận được shard theo **input column**. PE `n` chỉ giữ cột thuộc shard
của nó, nhưng tính partial cho cùng tập output row. Hai reducer cục bộ tạo
`pair01` tại SLR1 và `pair23` tại SLR2; hai pair trao đổi packet 128-bit rồi ghi
trực tiếp bốn output shard liên tục. Không có activation 480/512-bit broadcast
trở lại bốn SLR.

```text
DDR0 -> PE0 --128b--\
                     pair01 (SLR1) --128b--+
DDR1 -> PE1 --local-/                       |
                                             +-> output PE0/PE1
DDR2 -> PE2 --local-\                       |
                     pair23 (SLR2) --128b--+
DDR3 -> PE3 --128b--/                       +-> output PE2/PE3
```

RMSNorm cũng theo topology pair nhưng chỉ truyền một partial FP32 và một
reciprocal FP32. Attention, projection-save và linear mode dùng command-chain
nhỏ có thanh ghi `SLR0 -> SLR1 -> SLR2 -> SLR3`; controller không lái trực tiếp
một bus shape/mode rộng tới cả bốn SLR.

## Overlap DDR với compute

Mỗi PE linear có hai process DATAFLOW độc lập:

1. `int4_stream_local_weights` đọc burst 512-bit từ DDR cục bộ với II=1.
2. `int4_compute_local_partials` tiêu thụ đúng một word 512-bit mỗi cycle với
   II=1.

Giữa hai process là FIFO BRAM sâu 512 word, bằng hai tile `128 x 256`. Vì tốc độ
producer và consumer đều một word/cycle, FIFO hấp thụ latency/command bubble
của AXI mà không tạo chênh lệch throughput dài hạn. HLS đã infer burst cho các
đường model, metadata, residual, RoPE, KV và logits.

Mỗi local SwiftKV PE đọc tám word RoPE của đúng vị trí từ DDR của nó, sau đó
quét KV cache một lần bằng online-softmax recurrence. RoPE và KV dùng chung AXI
cục bộ nên được sắp tuần tự trong PE; bốn PE attention vẫn chạy song song.

## Tái sử dụng phần cứng

- Chỉ có **một** call-site `int4_sharded_linear_4pe` trong toàn scheduler.
- Q, K, V, O, GATE, UP, DOWN và LOGITS dùng lại cùng một linear pipeline trên
  mỗi PE; không sinh tám bản MAC.
- Mỗi PE chỉ có một scratch projection lớn nhất. Q/K/V và GATE được lưu riêng
  vì phải sống qua stage sau; O, UP, DOWN và LOGITS tiêu thụ scratch trực tiếp.
- RMSNorm, SwiGLU, residual-add và local SwiftKV được gọi lại qua mọi layer/token.
- INT4 MAC packed giữ II=1. Tổng DSP chỉ chiếm khoảng 7% U250.

Luồng một layer:

```text
RMS(attn) -> Q -> K -> V -> local RoPE + SwiftKV -> O -> residual add
RMS(ffn)  -> GATE -> UP -> local SwiGLU        -> DOWN -> residual add
```

Sau layer 31: `RMS(final) -> LOGITS`.

## Packing hai phép nhân vào một DSP48

Hai weight INT4 của hai output row dùng chung một activation INT15 được ghép
vào toán hạng 27-bit, cách nhau 23 bit:

```text
packed_weight = (w_high << 23) + w_low
packed_weight * activation
              = (w_high * activation << 23)
              + (w_low  * activation)
```

Khoảng 23 bit đủ chứa tổng có dấu của một group 32 phần tử. Sau MAC, hàm
`int4_unpack_packed_acc` tách hai accumulator và hiệu chỉnh borrow do trường
thấp âm. Đây là packing **2 phép nhân `INT4 x INT15` dùng chung activation vào
1 DSP48**, không phải hai phép nhân có hai activation độc lập.

Mỗi PE unroll 32 activation lane và xử lý bốn output row mỗi cycle:

- 64 packed DSP48 integer MAC;
- 128 phép nhân scalar `INT4 x INT15` mỗi cycle;
- tỷ lệ packing: 2 scalar multiply / DSP48;
- row-block pipeline giữ II=1.

RTL HLS sinh primitive dạng pre-adder `(A + D) * B`, đúng với datapath packing
trên. Các DSP floating-point dùng cho scale, RMSNorm và attention được tính
riêng, nên con số 916 DSP toàn kernel không chỉ gồm integer MAC.

## Layout mỗi DDR

Mỗi DDR chứa một model image 512-bit độc lập:

```text
[1600 FP16 scale words]
[4160 FP32 RMS gamma words]
[13103104 packed INT4 weight words]
```

Tổng: `13108864` word 512-bit mỗi DDR. Offset cố định nằm trong
`int4_model_layout.hpp`; packer offline nằm trong `int4_weight_packer.cpp`.
Weight order của mỗi ma trận là:

```text
[global output tile][local input-column tile][256 packed words]
```

Host phải tạo bốn bản RoPE giống nhau và đặt mỗi bản trong DDR của PE tương ứng.
KV layout của mỗi PE là `[layer][local_head][token][metadata,K0,K1,V0,V1]`.

## Kernel interface

Suffix `N` là ownership contract, không chỉ là tên port:

```cpp
void int4_decoder_token_controller(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    const int4_output_word_t* rope_lut_pe0,
    const int4_output_word_t* rope_lut_pe1,
    const int4_output_word_t* rope_lut_pe2,
    const int4_output_word_t* rope_lut_pe3,
    int4_output_word_t* residual_pe0,
    int4_output_word_t* residual_pe1,
    int4_output_word_t* residual_pe2,
    int4_output_word_t* residual_pe3,
    int4_output_word_t* logits_pe0,
    int4_output_word_t* logits_pe1,
    int4_output_word_t* logits_pe2,
    int4_output_word_t* logits_pe3,
    int4_output_word_t* kv_cache_pe0,
    int4_output_word_t* kv_cache_pe1,
    int4_output_word_t* kv_cache_pe2,
    int4_output_word_t* kv_cache_pe3);
```

`gmem0..gmem3` nối với `DDR[0]..DDR[3]` trong `link_300mhz.cfg`. Metadata scale
và norm được preload vào URAM persistent khi `position == 0`. Residual chỉ đọc
một lần đầu invocation và ghi một lần cuối invocation.

## Floorplan bắt buộc

`timing_300mhz_pre_place.tcl` hard-anchor các thành phần sau vào đúng SLR:

- AXI master, local memories và DDR clients của từng PE;
- local linear, RMS, SwiGLU, residual và SwiftKV data plane;
- reducer `pair01` tại SLR1, `pair23` tại SLR2;
- endpoint của các scalar command-chain.

Outer DATAFLOW wrappers vẫn soft để placer đặt glue `ap_start/ap_done` gần
consumer. `timing_300mhz_post_place_check.tcl` làm link fail nếu primitive nào
thoát khỏi SLR được gán hoặc một biên SLR dùng từ 50% SLL. Post-route hook yêu
cầu zero unrouted net, zero routing/DRC error và setup/hold slack không âm.

## Kiểm thử và build

Chạy test layout/packer:

```powershell
Set-Location C:\KLTN\u250
.\source\tests\run_tests.ps1
```

Chạy HLS synthesis nhanh, không package XO:

```powershell
Set-Location C:\KLTN\u250\source
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_csynth_300mhz.tcl
```

Synthesize và export XO:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_300mhz.tcl
```

Link XCLBIN bằng wrapper để absolute Tcl hooks và marker validation luôn được
áp dụng:

```powershell
Set-Location C:\KLTN\u250
.\source\build_300mhz.ps1 `
  -Platform '<U250 xpfm>' `
  -Output 'int4_decoder_token_controller_300mhz.xclbin'
```

Trên máy Linux `/home/eda`, script đã có sẵn các giá trị mặc định:

```text
Vitis settings:
/home/eda/xilinx/Vitis/2023.2/settings64.sh

U250 platform:
/opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/
xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm
```

Từ thư mục workspace chứa `source/`, dùng XO hiện có và chạy full hardware
link bằng một lệnh:

```bash
bash source/build_300mhz.sh
```

Để tổng hợp lại XO từ source trước khi link:

```bash
REBUILD_XO=1 bash source/build_300mhz.sh
```

Script tự source Vitis, tạo config theo từng run với đường dẫn Tcl tuyệt đối,
chạy `v++ --link --target hw --save-temps`, rồi chỉ báo thành công nếu đủ tất
cả marker floorplan/post-place/post-route. Build sẽ fail nếu sai SLR, biên SLL
dùng từ 50%, còn unrouted net/routing error/DRC Error, hoặc WNS/WHS âm.

Artifact mặc định và log được ghi tại:

```text
<workspace>/int4_decoder_token_controller_300mhz.xclbin
<workspace>/build_300mhz/runs/<timestamp-pid>/
```

Có thể override mà không sửa script qua `VITIS_SETTINGS`, `U250_PLATFORM`,
`XCLBIN_OUTPUT`, `VPP` và `VITIS_HLS`.

## Kết quả HLS đã xác minh

C-synthesis Vitis HLS 2023.2 ngày 2026-08-30 hoàn tất với exit code 0:

| Chỉ số | Kết quả |
|---|---:|
| Target | 3.333 ns / 300 MHz |
| Estimated Fmax | 300.03 MHz |
| Linear instances | 1 time-shared 4-PE engine |
| Linear MAC II | 1 |
| Integer MAC packing | 2 phép nhân `INT4 x INT15` / DSP48 |
| Integer packed MAC / PE | 64 DSP48 = 128 scalar multiply/cycle |
| BRAM18K | 1308 / 5376 (24%) |
| DSP | 916 / 12288 (7%) |
| FF | 356947 / 3456000 (10%) |
| LUT | 387973 / 1728000 (22%) |
| URAM | 160 / 1280 (12%) |

Đây là kết quả HLS trước place/route. Chỉ XCLBIN/routed DCP với WNS và WHS
không âm mới chứng minh implementation thực sự chạy 300 MHz.

XO tương ứng với source hiện tại:

```text
int4_decoder_token_controller_300mhz.xo
size:    8,819,002 byte
SHA-256: 1A834CE9A5311DC2885374BC36D3D31EFE85AC6B9D5B6CB63835E0932BC91311
```
