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

`int4_decoder_token_controller` được giữ làm baseline monolithic. Target
control-plane mới tách nó thành `int4_decoder_pe0_kernel` tới
`int4_decoder_pe3_kernel`, mỗi CU sở hữu đúng một SLR/DDR. Một token launch cả
bốn CU, chạy 32 decoder layer, cập nhật bốn KV cache cục bộ và ghi bốn shard
logits.

## Cấu trúc thư mục dự án

Repository được chuẩn hóa thành các thư mục chức năng rõ ràng:

- **`kernel_HLS/`**: Toàn bộ mã nguồn thiết kế phần cứng C++ HLS và top-level Verilog wrapper.
- **`scripts/`**: Toàn bộ script build (`.sh`, `.ps1`), Tcl script cho Vitis HLS & Vivado, và cấu hình link (`.cfg`).
- **`constraints/`**: Các file ràng buộc vật lý, neo SLR, và tiền xử lý PnR (`pre_place.tcl`, `pre_physopt.tcl`, `mcp_reset.xdc`).
- **`docs/`**: Tài liệu kiến trúc (`docs/architecture/`), báo cáo & đề cương luận văn (`docs/thesis/`), hình ảnh (`docs/images/`).

### Thành phần mã nguồn thiết kế (`kernel_HLS/`)

| File | Vai trò |
|---|---|
| `kernel_HLS/int4_decoder_multikernel.cpp/.hpp` | Top multi-kernel chia 4 PE độc lập cho 4 SLR |
| `kernel_HLS/int4_decoder_multikernel_top.v` | Top-level Verilog RTL wrapper kết nối 12 P2P AXI-Stream links |
| `kernel_HLS/int4_decoder_controller.cpp/.hpp` | Kernel controller và 4 local scheduler sở hữu trọn PE/SLR |
| `kernel_HLS/int4_decoder_schedule.hpp` | Lịch cố định dùng riêng trong từng local controller/reducer |
| `kernel_HLS/int4_linear_controller.cpp/.hpp` | Linear GEMV cục bộ từng PE và 2 pair reducer 128-bit |
| `kernel_HLS/int4_decoder_blocks.cpp/.hpp` | RMSNorm, SwiGLU, residual cục bộ và RMS pair service |
| `kernel_HLS/swiftkv_attention.cpp/.hpp` | RoPE, KV cache INT8 và online-softmax attention cục bộ |
| `kernel_HLS/int4_types.hpp` | Kiểu dữ liệu, hằng model/tile và shape dùng chung |
| `kernel_HLS/int4_numeric.hpp` | Chuyển đổi FP32/bit dùng chung, bảo toàn bit pattern |
| `kernel_HLS/int4_task_control.hpp` | Completion token, pair join và final wait dùng chung |
| `kernel_HLS/int4_model_layout.hpp` | Shape, padding và offset cố định của mỗi DDR |
| `kernel_HLS/int4_weight_packer.cpp/.hpp` | Packer offline tạo bốn model image input-column-sharded |

Sơ đồ dependency và contract khởi tạo được mô tả trong [`docs/architecture/HLS_SOURCE_GUIDE.md`](docs/architecture/HLS_SOURCE_GUIDE.md).
Datapath RMSNorm, GEMV INT4, reduction tree và cách chia logic theo SLR được mô tả chi tiết trong [`docs/architecture/RMSNORM_MATMUL_HARDWARE.md`](docs/architecture/RMSNORM_MATMUL_HARDWARE.md).
Control plane bốn CU độc lập dùng lại datapath này, topology 12 AXIS link nằm trong [`docs/architecture/DECODER_MULTIKERNEL_CONTROL_PLANE.md`](docs/architecture/DECODER_MULTIKERNEL_CONTROL_PLANE.md).

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
reciprocal FP32. Mỗi `int4_decoder_local_pe_N` tự chạy đủ lịch 32 layer và tự
giữ `mode/layer/address/enable`; không còn bus mode/state toàn cục. Baseline
monolithic relay position theo chuỗi, còn target bốn CU nhận cùng scalar
`position` trực tiếp từ host để không tạo thêm control net xuyên SLR.

## Overlap DDR với compute

Mỗi PE linear có hai process DATAFLOW độc lập:

1. `int4_stream_local_weights` đọc burst 512-bit từ DDR cục bộ với II=1.
2. `int4_compute_local_partials` tiêu thụ đúng một word 512-bit mỗi cycle với
   II=1.

Giữa hai process là skid FIFO SRL 4 word và FIFO BRAM sâu 256 word, bằng một
tile `128 x 256`. Relay II=1 giữa hai FIFO cắt đường backpressure từ BRAM
`full_n` về AXI reader; BRAM vẫn hấp thụ hai cửa sổ đọc AXI 64-beat. HLS đã
infer burst cho các đường model, metadata, residual, RoPE, KV và logits.

Mỗi local SwiftKV PE đọc tám word RoPE của đúng vị trí từ DDR của nó, sau đó
quét KV cache một lần bằng online-softmax recurrence. RoPE và KV dùng chung AXI
cục bộ nên được sắp tuần tự trong PE; bốn PE attention vẫn chạy song song.

## Tái sử dụng phần cứng

- Mỗi local controller chỉ có **một** call-site `int4_linear_local_stage_peN`.
- Q, K, V, O, GATE, UP, DOWN và LOGITS dùng lại cùng một linear pipeline trong
  PE tương ứng; không sinh tám bản MAC trên mỗi PE.
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

Hai weight INT4 của hai output row dùng chung một activation INT14 được ghép
vào toán hạng 27-bit, cách nhau 22 bit:

```text
packed_weight = (w_high << 22) + w_low
packed_weight * activation
              = (w_high * activation << 22)
              + (w_low  * activation)
```

Khoảng 22 bit đủ chứa tổng có dấu của một group 32 phần tử khi activation
được chặn trong [-8191, 8191], kể cả weight -8. Sau MAC, hàm
`int4_unpack_packed_acc` tách hai accumulator và hiệu chỉnh borrow do trường
thấp âm. Đây là packing **2 phép nhân `INT4 x INT14` dùng chung activation vào
1 DSP48**, không phải hai phép nhân có hai activation độc lập.

Mỗi PE unroll 32 activation lane và xử lý bốn output row mỗi cycle:

- 64 packed DSP48 integer MAC;
- 128 phép nhân scalar `INT4 x INT14` mỗi cycle;
- tỷ lệ packing: 2 scalar multiply / DSP48;
- row-block pipeline giữ II=1.

RTL HLS sinh primitive dạng pre-adder `(A + D) * B`, đúng với datapath packing
trên. Các DSP floating-point dùng cho scale, RMSNorm và attention được tính
riêng, nên con số 900 DSP toàn kernel không chỉ gồm integer MAC.

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

`gmem0..gmem3` được nối tương ứng với `DDR[0]..DDR[3]` trong `link_300mhz.cfg`.
Metadata scale và norm được preload vào URAM persistent khi `position == 0`.
Residual chỉ đọc một lần đầu invocation và ghi một lần cuối invocation.
Invocation đầu tiên sau khi program/reprogram FPGA **phải** dùng `position == 0`;
các position tiếp theo mới được phép tái sử dụng metadata persistent.

## Locality cho DDR/control và control KPN

`timing_300mhz_pre_place.tcl` là một hook độc lập, đặt cứng bốn AXI adapter
`gmem0..3` vào SLR chứa DDR tương ứng và đặt
`control_s_axi_U` cạnh AXI-Lite shell ở SLR0. Các PE compute lớn vẫn để placer
tối ưu theo timing. Routed DCP ngày 2026-09-03 chứng minh hint mềm có thể bị bỏ
qua và làm `gmem0` đi SLR0→SLR2; ngược lại, run ép ownership toàn bộ khoảng
442k primitive từng có post-place WNS `-4.900 ns`, nên không dùng lại.

Số liệu và critical-path chi tiết nằm trong `NEW_DCP_TIMING_FIX.md`.

Ở baseline monolithic, Vitis HLS 2023.2 tự sinh một `entry_proc` AND đồng thời
20 tín hiệu `full_n` của các FIFO địa chỉ. `patch_partitioned_entry_proc.tcl`
được gọi tự động sau
`csynth_design` và trước `export_design`: nó thay cone 20 ngõ bằng bốn launcher
5 ngõ độc lập, mỗi launcher vẫn ghi nguyên tử đủ năm địa chỉ của một PE. Script
fail build nếu không tìm đúng một entry process hoặc nếu cone toàn cục vẫn còn.
Target bốn CU loại bỏ nguyên nhân này ở boundary HLS: mỗi CU chỉ có năm con trỏ
AXI cục bộ, nên không cần patch generated RTL.

## Tổng hợp và build

Chạy HLS synthesis nhanh, không package XO:

```powershell
Set-Location C:\KLTN\4PE_U250
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_csynth_300mhz.tcl
```

Synthesize và export XO:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_300mhz.tcl
```

Chạy CSim regression:

```powershell
& 'C:\Xilinx\Vitis_HLS\2023.2\bin\vitis_hls.bat' `
  -f run_hls_unit_tests.tcl
```

XO đã export phải chứa marker `PARTITIONED_PE_CONFIG_LAUNCH` trong
`int4_decoder_token_controller_entry_proc42.v`. Báo cáo post-route tạo thêm
`timing_path_slr_audit.csv`; cột `slr_sequence` ghi toàn bộ hành trình vật lý
của path và đánh dấu `SLR_REVISIT`, `SAME_SLR_DETOUR`, `NONADJACENT_HOP` hoặc
`ROUTE_DOMINATED_FAIL` thay vì chỉ nhìn SLR của hai endpoint.

Link XCLBIN bằng wrapper để absolute Tcl hooks và marker validation luôn được
áp dụng:

```powershell
Set-Location C:\KLTN\4PE_U250
.\build_300mhz.ps1 `
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

Từ repository root, dùng XO đã kiểm chứng và chạy full hardware link bằng
một lệnh:

```bash
bash scripts/build_300mhz.sh
```

Để tổng hợp lại XO từ source trước khi link:

```bash
REBUILD_XO=1 bash scripts/build_300mhz.sh
```

Nếu XO đã được build và kiểm tra đúng phiên bản, có thể bỏ qua kiểm tra timestamp và chỉ link lại XCLBIN:

```bash
REUSE_XO=1 bash scripts/build_300mhz.sh
```

`REUSE_XO=1` không tắt floorplan hoặc timing gate; nó chỉ ngăn script gọi lại Vitis HLS.

Script tự source Vitis, tạo config theo từng run với đường dẫn Tcl tuyệt đối,
chạy `v++ --link --target hw --save-temps`, kiểm tra marker locality interface rồi mở
routed DCP bằng Vivado. XCLBIN chỉ được chấp nhận khi route đầy đủ, không có
routing/DRC Error, không còn setup/hold path âm và log có marker
`300MHz timing gate: TIMING_CLOSED`.

Artifact mặc định và log được ghi tại:

```text
<workspace>/int4_decoder_token_controller_300mhz.xclbin
<workspace>/build_300mhz/runs/<timestamp-pid>/
```

Có thể override mà không sửa script qua `VITIS_SETTINGS`, `U250_PLATFORM`,
`XCLBIN_OUTPUT`, `VPP`, `VIVADO` và `VITIS_HLS`.

## Kết quả HLS baseline trước khi đổi sang INT14

C-synthesis Vitis HLS 2023.2 ngày 2026-09-07 hoàn tất với exit code 0;
CSim regression cũng pass với 0 lỗi. Các số liệu bên dưới thuộc bản build
trước thay đổi INT14. Kết quả đo lại cho riêng PE0 nằm ở mục kế tiếp;
bốn PE chưa được tổng hợp lại cùng nhau.

| Chỉ số | Kết quả |
|---|---:|
| Target | 3.333 ns / 300 MHz |
| Estimated clock | 2.787 ns |
| Estimated Fmax | 358.84 MHz |
| Linear instances | 4 local engine, mỗi PE dùng lại cho 8 mode |
| Linear MAC II | 1 |
| Integer MAC packing | 2 phép nhân `INT4 x INT15` / DSP48 (baseline) |
| Integer packed MAC / PE | 64 DSP48 = 128 scalar multiply/cycle |
| BRAM18K | 1308 / 5376 (24%) |
| DSP | 900 / 12288 (7%) |
| FF | 363118 / 3456000 (10%) |
| LUT | 393387 / 1728000 (22%) |
| URAM | 160 / 1280 (12%) |

Đây là kết quả HLS trước place/route. Chỉ XCLBIN/routed DCP với WNS và WHS
không âm mới chứng minh implementation thực sự chạy 300 MHz.

## C-synthesis INT14 cho PE0

Vitis HLS 2023.2 ngày 2026-09-20, top `int4_decoder_pe0_kernel`, target
3.00 ns và clock uncertainty 0.27 ns:

| Chỉ số | PE0 INT14 |
|---|---:|
| MAC packed | 2 phép nhân `INT4 x INT14` / DSP48 |
| Vòng đọc weight | II=1, 1 word 512-bit/cycle |
| Vòng MAC | II=1, pipeline depth 28 |
| Estimated clock | 3.041 ns |
| HLS timing slack ở target 3.00 ns | -0.31 ns |
| BRAM18K / DSP / FF / LUT / URAM | 353 / 238 / 95,100 / 118,702 / 40 |

Đường timing HLS xấu nhất thuộc vòng tính tổng bình phương trong RMSNorm,
không thuộc MAC. Báo cáo tại
`proj_int14_perf_pe0/solution_300mhz/syn/report/csynth.rpt`.

II=1 ở reader và MAC là khả năng của hai pipeline khi dữ liệu sẵn có, chưa
chứng minh DDR cấp đều 1 word/cycle. Ở 300 MHz, mỗi PE đòi hỏi
`64 byte x 300 MHz = 19.2 GB/s` weight từ một bank DDR. Đây gần bằng toàn bộ
băng thông đỉnh lý thuyết của bank; cần đo bandwidth và stall trên phần cứng
để xác nhận throughput. Activation INT14 nằm trong bộ nhớ cục bộ của PE;
đổi sang INT16 không giảm lưu lượng weight DDR hay số word MAC cần đọc.

XO của baseline trước INT14 được lưu trong Git:

```text
int4_decoder_token_controller_300mhz.xo
size:    8,965,790 byte
SHA-256: BE5B3ED2B261F8BD3B0C044B9EE02274142AAB769B7C5F02D468E5162BB67422
```

Mỗi lần `run_hls_300mhz.tcl` hoặc `export_hls_300mhz.tcl` export thành công,
file `.xo.sha256` được sinh lại tự động.

Máy Windows hiện tại chưa cài U250 `.xpfm`, vì vậy chưa có routed DCP mới để
báo WNS/WHS sau sửa. Dùng wrapper trên máy có platform; wrapper sẽ tự fail nếu
route chưa đóng timing.
