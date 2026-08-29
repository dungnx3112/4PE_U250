# INT4 Llama-2 7B decoder trên Alveo U250

Source này hiện thực một decoder token hoàn chỉnh bằng Vitis HLS 2023.2 cho
FPGA `xcu250-figd2104-2L-e`, gồm 4 processing element (PE) ánh xạ lên 4 SLR và
4 DDR độc lập. Mục tiêu implementation là 300 MHz.

Kernel top-level là `int4_decoder_token_controller`. Mỗi lần gọi kernel nhận
một hidden state 4096 phần tử đã qua embedding, chạy toàn bộ 32 decoder layer
cho một token, cập nhật KV cache và xuất logits 32000 phần tử. Thiết kế dùng
kích thước cố định của Llama-2 7B; host không truyền kích thước ma trận lúc
runtime.

Phân tích checkpoint timing cũ và lịch sử các thay đổi nằm trong
[`TIMING_300MHZ_ANALYSIS.md`](TIMING_300MHZ_ANALYSIS.md). README này mô tả
source hiện tại và là tài liệu ưu tiên khi hai file có thông tin khác nhau.

## Thông số chính

| Thành phần | Giá trị |
|---|---:|
| Model dimension | 4096 |
| FFN hidden dimension | 11008 |
| Vocabulary | 32000 |
| Decoder layers | 32 |
| Attention heads | 32 |
| Head size | 128 |
| Maximum sequence length | 4096 |
| PE / DDR / SLR | 4 / 4 / 4 |
| GEMV tile | 128 hàng x 256 cột |
| Weight | INT4, một FP16 scale cho mỗi tile |
| Activation GEMV | signed A15, group size 32, FP32 scale |
| Nonlinear/attention boundary | Q15.17 |
| Target clock | 3.333 ns, 300 MHz |

Các mode linear cố định gồm `Q`, `K`, `V`, `O`, `GATE`, `UP`, `DOWN` và
`LOGITS`.

## Giao diện kernel

Khai báo top-level nằm trong `int4_decoder_controller.hpp`:

```cpp
void int4_decoder_token_controller(
    ap_uint<12> position,
    const int4_weight_word_t* model_bank0,
    const int4_weight_word_t* model_bank1,
    const int4_weight_word_t* model_bank2,
    const int4_weight_word_t* model_bank3,
    const int4_output_word_t* rope_lut_ddr,
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

`gmem0..gmem3` lần lượt nối với `DDR[0]..DDR[3]`. Mỗi AXI master sở hữu model,
residual, logits và KV cache của PE tương ứng. `rope_lut_ddr` dùng chung bundle
`gmem0`. Thiết kế giữ tối đa 2 read transaction nhưng chỉ 1 write transaction
outstanding trên mỗi master để tránh nhân đôi cone điều khiển FIFO write 512-bit.

Khi `position == 0`, kernel preload hai vùng model prefix và toàn bộ bảng RoPE
vào URAM persistent. Từ token tiếp theo, kernel không tải lại các vùng này.
Residual chỉ được đọc từ DDR một lần ở đầu invocation và ghi lại một lần ở cuối.

## Luồng xử lý một token

Controller giữ layer, linear mode và offset model ở hardware. Luồng của mỗi
layer là:

```text
RMSNorm -> Q -> K -> V
                 |
                 +-> RoPE + SwiftKV online attention -> O -> residual add

RMSNorm -> GATE -> UP -> SiLU(GATE) * UP -> DOWN -> residual add
```

Sau layer 31, controller chạy RMSNorm cuối và projection `LOGITS`, sau đó kết
thúc invocation. Vòng controller có bound tĩnh 257 bước cho synthesis và thoát
ngay khi logits hoàn thành.

Các state có producer liền trước được fuse bằng DATAFLOW:

- RMSNorm sinh trực tiếp activation A15/G32 cho `Q`, `GATE` hoặc `LOGITS`.
- SwiftKV attention sinh trực tiếp activation cho projection `O`; không tạo
  attention-result buffer toàn cục.
- SwiGLU sinh trực tiếp activation cho projection `DOWN`.
- Writer của `O` và `DOWN` cộng branch vào residual tại chỗ; không có một pass
  AXI residual-add riêng.

## Phân vùng 4 PE / 4 SLR

| SLR | PE | DDR | Logic chính |
|---|---:|---:|---|
| SLR0 | PE0 | DDR0 | Linear PE0, SwiftKV PE0, local memories, RoPE bank0 |
| SLR1 | PE1 | DDR1 | Linear PE1, SwiftKV PE1, pair01 island, AXI-Lite control |
| SLR2 | PE2 | DDR2 | Linear PE2, SwiftKV PE2, pair23 island |
| SLR3 | PE3 | DDR3 | Linear PE3, SwiftKV PE3, local memories, RoPE bank3 |

Output row tile toàn cục `t` thuộc PE `t % 4`; local tile là `t / 4`. Mọi ma
trận được pad số output tile thành bội số của 4 để bốn DDR có layout và burst
cân bằng.

`timing_300mhz_pre_place.tcl` sử dụng `USER_SLR_ASSIGNMENT` cùng các hard
`pblock_dynamic_SLR0..3` có sẵn của platform. Chỉ datapath, memory, AXI, FIFO
rộng và endpoint pair-local bị khóa; các wrapper DATAFLOW cùng control
`ap_start/ap_done` bên ngoài vẫn để placer tự phân bố. Link phải fail nếu pattern
source/RTL thay đổi, assignment bị bỏ qua hoặc floorplan không được áp dụng.

## Kiểm soát bus rộng và SLL crossing

### Activation 480-bit

Một activation group chứa `32 x 15 = 480` bit. Đây là định dạng kiến trúc, không
phải độ rộng crossing giữa SLR. Khi cần trao đổi giữa pair01 và pair23, hoặc giữa
pair01/23 với PE biên ở SLR0/SLR3, mỗi word được serialize thành `16 x 30-bit`,
truyền qua FIFO đã đăng ký rồi ghép lại gần consumer. Các FIFO 480-bit còn lại là
BRAM cục bộ trong SLR sở hữu PE hoặc pair island.

### RoPE 608-bit

Một RoPE LUT word chứa 16 cặp cosine/sine, mỗi phần tử 19 bit:

```text
16 x (19-bit cosine + 19-bit sine) = 608 bit
```

Bus 608-bit chỉ tồn tại ở URAM cục bộ. Preload đi theo cascade
`SLR0 -> SLR1 -> SLR2 -> SLR3` bằng `16 x 38-bit` beat; mỗi stage tự ghép lại
608 bit trước khi ghi bank của nó. Trong DDR, một row 608-bit được lưu trong hai
word 512-bit để reader `gmem0` vẫn dùng burst chuẩn.

### Linear output và projection routing

Linear PE truyền từng output value 32-bit qua boundary nội bộ rồi pack thành
word 512-bit cạnh destination memory. Không có bus result 512-bit dài chạy qua
nhiều SLR.

Route projection không còn dùng một dispatcher state chung cho cả bốn PE. Source
có bốn instance `int4_route_projection_local_pe<PE_ID>`; mỗi instance giải mã
mode và ghi `Q/K/V/residual/GATE/UP/logits` của riêng PE/SLR đó. Route phase chỉ
truyền token 3-bit theo chuỗi `PE0 -> PE1 -> PE2 -> PE3`.

RTL HLS hiện tại tách route owner thành các state riêng cho PE0/1/2/3. Log không
còn cảnh báo dispatcher `ap_CS_fsm_state7` có fanout 12536. Không sử dụng global
`FANOUT_LIMIT`; ownership và crossing được kiểm soát từ hierarchy source và
floorplan bắt buộc.

## Bộ nhớ model và host packer

Mỗi DDR chứa một image 512-bit liên tục:

```text
[1600 packed FP16 tile-scale words]
[4160 RMSNorm gamma words]
[13037568 INT4 weight words]
```

Tổng cộng `13043328` word 512-bit trên mỗi DDR. Offset được định nghĩa trong
`int4_model_layout.hpp` và được controller tăng tuần tự theo đúng thứ tự
projection; không tính lại `layer * stride` cho cả bốn bank trong datapath.

Host packer trong `int4_weight_packer.cpp/.hpp` cung cấp:

- `int4_pack_linear_matrix`: lượng tử và stripe ma trận FP32 vào bốn DDR image.
- `int4_pack_norm_vector`: pack gamma RMSNorm theo row-tile striping.
- `int4_pack_input_residual`: pack hidden state đầu vào.
- `int4_unpack_fp32_linear_output`: ghép output/logits từ bốn PE.
- `int4_pack_rope_lut`: tạo bảng RoPE DDR dùng cho preload.

KV cache của mỗi DDR có layout:

```text
[layer][local_head][token][metadata, K0, K1, V0, V1]
```

Mỗi PE xử lý 8 attention head. K/V được nén INT8/G32; SwiftKV dùng online
attention recurrence nên không materialize toàn bộ score vector.

## Vai trò các file source

| File | Vai trò |
|---|---|
| `int4_decoder_controller.cpp/.hpp` | Kernel top, controller 32 layer, AXI interface, preload và local projection routing |
| `int4_linear_controller.cpp/.hpp` | Linear engine 4 PE, activation transport, W4 x A15 GEMV, dequant và output packing |
| `int4_decoder_blocks.cpp/.hpp` | RMSNorm, residual add, SwiGLU và activation quantization |
| `swiftkv_attention.cpp/.hpp` | RoPE, KV compression/cache và SwiftKV online attention 4 PE |
| `int4_model_layout.hpp` | Fixed matrix shape, DDR layout, stride và offset model |
| `int4_weight_packer.cpp/.hpp` | Host-side packer/unpacker cho model, residual, logits và RoPE |
| `gemv_tile_pe.cpp/.hpp` | GEMV tile/PE primitives |
| `gemv2_pack_bench.cpp/.hpp` | Packed-DSP arithmetic primitives/benchmark được linear engine sử dụng |
| `run_hls_300mhz.tcl` | Tạo HLS project, csynth và export XO |
| `link_300mhz.cfg` | Clock, DDR connectivity và Vivado implementation strategy |
| `timing_300mhz_pre_place.tcl` | Đưa PE-local datapath/AXI/memory/FIFO vào hard `pblock_dynamic_SLR0..3`, giữ outer control soft và kiểm tra trước place |
| `timing_300mhz_post_place_check.tcl` | Fail implementation nếu datapath/AXI/memory/FIFO thoát khỏi SLR đã gắn hoặc một biên SLR dùng từ 50% SLL |
| `build_300mhz.ps1` / `build_300mhz.sh` | Wrapper link XCLBIN cho Windows/Linux, tạo run directory riêng và kiểm tra marker floorplan |
| `report_300mhz_post_route.tcl` | Sinh timing, congestion, high-fanout và utilization report từ routed DCP |

## Build XO bằng HLS

Yêu cầu Vitis HLS 2023.2. Chạy trong thư mục `source`:

```powershell
Set-Location C:\KLTN\u250\source
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' -f run_hls_300mhz.tcl
```

Output:

```text
C:\KLTN\u250\source\int4_decoder_token_controller_300mhz.xo
```

`export_hls_300mhz.tcl` chỉ export lại XO từ HLS project đã synthesize; nó không
chạy lại `csynth_design`.

## Link XCLBIN

Dùng wrapper để pre-place hook luôn được resolve thành absolute path và để mỗi
lần build có log riêng:

```powershell
Set-Location C:\KLTN\u250
.\source\build_300mhz.ps1 `
    -Platform '<path-hoac-ten-U250-xpfm>' `
    -Output 'int4_decoder_token_controller_300mhz.xclbin'
```

Trên máy build Linux, chạy wrapper Linux thay vì gọi `v++` trực tiếp:

```bash
cd /path/to/u250/source
bash ./build_300mhz.sh \
    /opt/xilinx/platforms/xilinx_u250_gen3x16_xdma_4_1_202210_1/xilinx_u250_gen3x16_xdma_4_1_202210_1.xpfm \
    int4_decoder_token_controller_300mhz.xclbin
```

Hai wrapper đều ép `300000000 Hz`, tạo bản config riêng cho mỗi run và thay
PRE/POST hook bằng absolute path hợp lệ trên host đang build.

Wrapper tạo thư mục:

```text
build_300mhz/runs/<timestamp>-<pid>/
```

Link chỉ được coi là hợp lệ khi log của chính run đó chứa cả ba marker:

```text
300MHz floorplan: PAIR_LOCAL_APPLIED
300MHz floorplan: LOCAL_DATA_PLANE_APPLIED
300MHz floorplan: HARD_ANCHORS_APPLIED
300MHz floorplan: FLOORPLAN_APPLIED
300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED
300MHz floorplan: SLL_BOUNDARY_VALIDATED
300MHz floorplan: ROUTE_AND_TIMING_VALIDATED
```

Không gọi `v++ --link` bỏ qua `link_300mhz.cfg` hoặc
`timing_300mhz_pre_place.tcl`, vì như vậy PE/local memory có thể bị dồn vào
SLR2/SLR3 và tái tạo các đường SLL dài trong checkpoint cũ.

## Báo cáo post-route

Sau khi link tạo routed DCP:

```powershell
& 'C:\Xilinx\Vivado\2023.2\bin\vivado.bat' `
    -mode batch `
    -source C:\KLTN\u250\source\report_300mhz_post_route.tcl `
    -tclargs '<post-route.dcp>' '<output-directory>'
```

Các output cần kiểm tra:

- `timing_summary.rpt`: WNS/TNS, setup và hold.
- `worst_setup_500.rpt`: phân loại critical path mới.
- `congestion.rpt`: congestion level và hotspot.
- `high_fanout.rpt`: bảo đảm không tái xuất hiện controller/dispatcher cone lớn.
- `utilization_slr.rpt` và `resources_by_slr.csv`: cân bằng PE trên 4 SLR.
- `uram_by_slr.csv`: SLR0..SLR3 đều phải có URAM của kernel.
- `route_status.rpt`, `methodology.rpt` và `qor_assessment.rpt`: trạng thái route,
  lỗi methodology và đánh giá QoR tổng thể.

## Trạng thái kiểm chứng hiện tại

Lần HLS gần nhất hoàn thành ngày 2026-08-26 với exit code 0:

| Chỉ số HLS | Kết quả |
|---|---:|
| Target period | 3.333 ns |
| Estimated period | 2.433 ns |
| Estimated Fmax | 411 MHz |
| BRAM_18K | 1682 |
| DSP | 862 |
| FF | 410112 |
| LUT | 339071 |
| URAM | 264 |

XO đã được export sau thay đổi local dispatcher, serialize các đường activation
ở biên SLR0/SLR3, tách FIFO key 512-bit thành các FIFO 128-bit cục bộ và tách
forwarding attention pair01/pair23. Tuy nhiên HLS timing chỉ là
ước lượng trước placement/routing. Chỉ WNS/TNS từ XCLBIN và routed DCP mới có
thể xác nhận thiết kế thực sự đạt 300 MHz. Checkpoint cũ không phản ánh source
và XO hiện tại.

## Nguyên tắc khi sửa tiếp

- Mỗi PE phải tiếp tục sở hữu weight stream, MAC, output memory, KV cache và AXI
  master của chính nó.
- Không tạo lại pointer/memory selector chung điều khiển destination của cả bốn
  PE.
- Không đưa bus 480/512/608-bit qua biên SLR nếu có thể serialize hoặc tái tạo
  tại consumer.
- Không đổi FIFO 480-bit cục bộ từ BRAM về LUTRAM nếu chưa kiểm tra post-route
  high-fanout và congestion.
- Nếu đổi tên HLS hierarchy, phải cập nhật pattern và các kiểm tra `require_*`
  trong `timing_300mhz_pre_place.tcl`; không được bỏ kiểm tra để link tiếp tục.
- Không che regression kiến trúc bằng global `FANOUT_LIMIT`. Nếu xuất hiện net
  fanout lớn, sửa ownership, hierarchy hoặc register boundary trong source.
