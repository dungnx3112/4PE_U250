# Kiến trúc phần cứng RMSNorm và nhân ma trận–vector trên 4 SLR

Tài liệu này mô tả đúng datapath production của kernel
`int4_decoder_token_controller`: cách RMSNorm tạo activation lượng tử, cách
bốn PE thực hiện phép nhân `y = W x`, cách cộng các partial result và mức
floorplan đang thực sự được áp dụng trên Alveo U250.

Các file hiện thực chính:

- [`int4_decoder_blocks.cpp`](int4_decoder_blocks.cpp): RMSNorm và quantizer.
- [`int4_linear_controller.cpp`](int4_linear_controller.cpp): GEMV INT4.
- [`int4_decoder_controller.cpp`](int4_decoder_controller.cpp): bốn local PE
  scheduler và các stream nối giữa PE.
- [`int4_model_layout.hpp`](int4_model_layout.hpp): shape, padding và offset.
- [`timing_300mhz_pre_place.tcl`](timing_300mhz_pre_place.tcl): constraint
  placement vật lý hiện tại.

## 1. Toàn cảnh kiến trúc

Model được chia theo **cột đầu vào** của ma trận. PE `p` giữ shard activation
`x_p` và shard cột `W_p` trong DDR `p`, nhưng vẫn chứa weight cho toàn bộ hàng
đầu ra. Mỗi PE tính:

```text
partial_p[r] = sum(W[r, c] * x[c]), với c thuộc input shard p
```

Kết quả đầy đủ là:

```text
y[r] = partial_0[r] + partial_1[r] + partial_2[r] + partial_3[r]
```

Sau reduction, `y` lại được chia thành bốn shard hàng liên tục để PE0–PE3 dùng
làm activation cục bộ của stage kế tiếp. Vì vậy không cần broadcast một vector
4096/11008 phần tử trở lại cả bốn SLR.

```text
 DDR0 <-> gmem0 <-> PE0 -- partial 128b --\
                                             pair01 -- first half -- final01 -> PE0, PE1
 DDR1 <-> gmem1 <-> PE1 -- partial 128b --/       \
                                                    X  pair-half 128b
 DDR2 <-> gmem2 <-> PE2 -- partial 128b --\       /
                                             pair23 -- second half - final23 -> PE2, PE3
 DDR3 <-> gmem3 <-> PE3 -- partial 128b --/
```

Mỗi PE có local scheduler, AXI requester, address generator và scratch memory
riêng. Phần phối hợp giữa các task ở top-level chỉ dùng các kênh hẹp: position
12-bit, RMS scalar FP32, linear packet 128-bit và completion token 1-bit.

## 2. Kích thước dữ liệu và cách shard

| Đại lượng | Kích thước thật | Sau padding | Mỗi PE |
|---|---:|---:|---:|
| Model dimension | 4096 | 4096 | 1024 |
| FFN hidden | 11008 | 11264 | 2816 |
| Vocabulary | 32000 | 32256 | 8064 |
| Số decoder layer | 32 | 32 | cùng schedule |

Các định dạng chính:

| Dữ liệu | Định dạng |
|---|---|
| Residual và output thông thường | 16 FP32 trong một word 512-bit |
| Q/K/V sau linear | signed fixed-point 32-bit, Q15.17 |
| Activation lượng tử | 32 giá trị INT15 trong word 480-bit |
| Activation scale | một FP32 cho mỗi group 32 phần tử |
| Weight | INT4 đối xứng, miền `[-7, 7]` |
| Weight scale | FP16, một scale cho tile `128 × 256` |
| Partial reduction | 4 FP32 trong packet 128-bit |

Mỗi DDR giữ một model-shard image có cùng layout, nhưng phần weight là shard
cột dành riêng cho PE tương ứng:

```text
[1600 word weight-scale FP16]
[4160 word RMS gamma FP32]
[13103104 word weight INT4]
```

PE không đọc model bank của PE khác. Padded row/column được pack bằng zero;
host chỉ sử dụng 11008 hidden và 32000 logits hợp lệ.

## 3. Lịch phần cứng được tái sử dụng

Trong mỗi decoder layer, một PE chạy tuần tự:

```text
RMS(attention) -> Q -> K -> V -> attention -> O -> residual add
RMS(FFN)       -> GATE -> UP -> SwiGLU    -> DOWN -> residual add
```

Sau layer 31:

```text
RMS(final) -> LOGITS
```

Do đó một token có:

- 65 RMS event: `32 × 2 + 1`.
- 225 linear event: `32 × 7 + 1`.
- Chỉ **một linear engine trong mỗi PE** được tái sử dụng cho Q, K, V, O,
  GATE, UP, DOWN và LOGITS; không nhân bản tám datapath GEMV trong một PE.
- Có bốn bản engine vật lý vì PE0–PE3 chạy song song.

RMS tại stage Q tạo activation dùng chung cho Q/K/V. RMS tại GATE tạo
activation dùng chung cho GATE/UP. Attention ghi activation mới cho O; SwiGLU
ghi activation mới cho DOWN.

## 4. RMSNorm: từ residual FP32 đến activation INT15

RMSNorm không trừ mean như LayerNorm. Với vector 4096 phần tử:

```text
sum_sq = sum(x[i] * x[i])
inv_rms = rsqrt(sum_sq / 4096 + 1e-5)
y[i] = x[i] * inv_rms * gamma[i]
```

`y` không được ghi thành một vector FP32 trung gian. Phần cứng lượng tử hóa
ngay từng group 32 phần tử thành `activation_q` và `activation_scale` để GEMV
tiêu thụ trực tiếp.

### 4.1. Metadata persistent

Mỗi PE có hai cache tĩnh:

- `scale_cache`: toàn bộ weight scale FP16, bind vào URAM.
- `norm_cache`: gamma của 64 RMSNorm vector cục bộ theo layer cộng gamma final,
  bind vào URAM.

Khi `position == 0`, mỗi PE burst-read 1600 word scale và 4160 word gamma từ
DDR cục bộ vào URAM với II=1. Những token sau tái sử dụng cache này. Vì thế
invocation đầu tiên sau khi program FPGA bắt buộc phải dùng position zero.

### 4.2. Tính tổng bình phương cục bộ

Residual của mỗi PE chứa 1024 FP32, tức 64 word 512-bit. Hàm
`int4_local_sumsq` đọc từng word và chia thành bốn block, mỗi block gồm bốn
FP32. Bốn accumulator độc lập thực hiện:

```text
acc0 += x0*x0
acc1 += x1*x1
acc2 += x2*x2
acc3 += x3*x3
```

Loop này dùng `PIPELINE II=4` để phù hợp recurrence latency của phép cộng
floating-point. Cuối local pass, bốn accumulator được cộng thành đúng một
scalar FP32 `partial_p`.

```text
PE0: 1024 FP32 -> sumsq0 --\
PE1: 1024 FP32 -> sumsq1 --- pair01
PE2: 1024 FP32 -> sumsq2 --- pair23
PE3: 1024 FP32 -> sumsq3 --/
```

### 4.3. Reduction RMS theo cặp

Reduction không dùng một bus broadcast toàn cục:

```text
pair23: sum23 = sumsq2 + sumsq3
                         |
                         | 32-bit FP32
                         v
pair01: total = sumsq0 + sumsq1 + sum23
        inv_rms = rsqrt(total / 4096 + 1e-5)
             |                              |
             +-> PE0, PE1                   +-> pair23 -> PE2, PE3
```

`pair01` thực hiện phép cộng cuối và `rsqrt`. `pair23` vừa tạo `sum23`, vừa
relay reciprocal trở lại PE2/PE3. Mỗi RMS event chỉ cần truyền một partial
FP32 và một reciprocal FP32 qua vùng trung tâm.

Các service `int4_rms_pair01_schedule` và `int4_rms_pair23_schedule` tự chạy
đúng 65 event. Blocking read/write trên stream giữ bốn local controller đồng
bộ mà không cần một global RMS state machine.

### 4.4. Nhân gamma và lượng tử hóa G32

Sau khi nhận `inv_rms`, mỗi PE xử lý 32 group cục bộ; mỗi group chứa 32 giá
trị, tương ứng hai word 512-bit:

```text
normalized[i] = residual[i] * inv_rms * gamma[i]
amax = max(abs(normalized[0..31]))
activation_scale = amax / 16383
q[i] = clamp(round(normalized[i] / activation_scale), -16383, 16383)
```

Nếu `amax == 0`, scale và toàn bộ q bằng zero. Kết quả mỗi group là:

- một word 480-bit chứa `32 × INT15`;
- một scale FP32.

Buffer tạm 32 FP32 được bind BRAM. Hai loop tìm max và lượng tử đều pipeline
II=1. Cách fuse RMSNorm với quantization loại bỏ một lần ghi/đọc vector FP32
đầy đủ trước GEMV.

## 5. GEMV INT4: tổ chức tile và datapath trong một PE

Trong source, phép toán được viết theo hướng `y = W x`, với hàng của `W` là
output và cột là input. Nếu mô hình host dùng ký hiệu row-vector `xW`, ma trận
chỉ khác quy ước transpose; datapath phần cứng vẫn là dot product theo cột.

### 5.1. Shape của các mode

| Mode | Output padded | Input padded | Output tile | Local input tile/PE | Weight word/PE | Partial packet/PE | Output word/PE |
|---|---:|---:|---:|---:|---:|---:|---:|
| Q/K/V/O | 4096 | 4096 | 32 | 4 | 32768 | 1024 | 64 |
| GATE/UP | 11264 | 4096 | 88 | 4 | 90112 | 2816 | 176 |
| DOWN | 4096 | 11264 | 32 | 11 | 90112 | 1024 | 64 |
| LOGITS | 32256 | 4096 | 252 | 4 | 258048 | 8064 | 504 |

Một matrix tile có 128 output row × 256 input column. Mỗi PE giữ 4 local
column tile cho input 4096, hoặc 11 tile cho input FFN đã pad thành 11264.

### 5.2. Layout một word weight 512-bit

Một tile `128 × 256` được chia thành:

- 8 group theo chiều cột, mỗi group 32 input.
- 32 row-block theo chiều hàng, mỗi block 4 output row.
- Tổng `8 × 32 = 256` word 512-bit/tile.

Một word chứa `32 input lane × 4 weight INT4 = 512 bit`. Trong mỗi cụm 16 bit
của một lane, row chẵn nằm ở nibble cao của từng byte và row lẻ ở nibble thấp:

```text
lane 0: bits  7:4=row0,  3:0=row1, 15:12=row2, 11:8=row3
lane 1: bits 23:20=row0, 19:16=row1, 31:28=row2, 27:24=row3
...
lane31: cùng thứ tự cho input column 31
```

Packer tìm `max(abs(weight))` trên toàn tile 128×256, lưu
`weight_scale = max_abs / 7` dưới dạng FP16 và lượng tử weight vào `[-7, 7]`.
Một word scale 512-bit chứa 32 tile scale FP16.

### 5.3. Reader–compute DATAFLOW

Mỗi local linear engine có bốn process DATAFLOW:

```text
64-bit command -> split command --+-> prepare request -> AXI weight reader
                                  |                          |
                                  |                      512-bit word
                                  |                          v
                                  +-> compute command -> INT4 compute <- weight FIFO
```

Command chứa mode, weight offset, scale offset, số output tile, số local input
tile và cờ output fixed-point. Request rút gọn còn base address 24-bit và số
word 18-bit.

AXI reader dùng một address counter tuần tự và đọc một word 512-bit mỗi cycle
ở II=1. Một skid FIFO SRL 4 word và relay II=1 tách reader khỏi FIFO weight
BRAM sâu 256 word. BRAM chứa được hai cửa sổ đọc AXI 64-beat, nhưng `full_n`
của BRAM chỉ dừng relay cục bộ thay vì đi thẳng về điều khiển AXI reader.

Reader và compute nằm trong vùng `DATAFLOW disable_start_propagation`. Mỗi PE
chỉ đọc `gmemN`, nên bốn DDR có thể cấp bốn luồng 512-bit độc lập.

### 5.4. MAC cho bốn output row mỗi cycle

Với mỗi group 32 input và row-block 4 output, compute đọc:

- một activation word 480-bit;
- một weight word 512-bit;
- một activation scale FP32;
- một weight scale FP16 đã đổi sang FP32.

Loop 32 activation lane được unroll hoàn toàn. Row-block pipeline chạy II=1,
nên mỗi cycle tiêu thụ một word weight và tính 128 phép nhân scalar
`INT4 × INT15` cho bốn output row.

Integer dot product của group:

```text
integer_sum[row] = sum(q_weight[row,lane] * q_activation[lane])
contribution[row] = integer_sum[row] * weight_scale * activation_scale
partial[row] += contribution[row]
```

`partial[128]` được cyclic-partition factor 4 để bốn hàng của một row-block
được truy cập song song. Accumulator integer group rộng 23-bit; partial qua
các group/local tile là FP32.

### 5.5. Hai phép nhân INT4 trong một DSP48

Hai weight của hai output row dùng chung một activation được pack cách nhau
23 bit:

```text
packed_weight = (w_high << 23) + w_low
packed_product = packed_weight * activation
```

Trường 23-bit đủ cho tổng G32 vì:

```text
32 × 16383 × 7 = 3,669,792 < 2^22
```

Sau khi cộng 32 packed product, phần cứng tách trường thấp và cao, đồng thời
hiệu chỉnh borrow khi trường thấp âm. Mỗi packed multiplier vì thế tương
đương hai phép nhân `INT4 × INT15` có chung activation.

Một PE dùng:

- 64 packed integer MAC DSP48;
- tương đương 128 scalar multiply/cycle;
- bốn PE tương đương 512 scalar multiply/cycle khi cùng chạy GEMV.

Phép cộng tạo `packed_weight` bị bind sang fabric để tránh đường DSP pre-adder
sát giới hạn 3.333 ns. DSP floating-point cho scale/reduction được tính riêng.

### 5.6. Emit partial result

Sau khi tích lũy hết input shard cho một output tile, PE phát 128 hàng dưới
dạng 32 packet:

```text
packet 128-bit = {partial[row+3], partial[row+2],
                  partial[row+1], partial[row+0]}
```

Emit loop chạy II=1. Tất cả PE phát cùng thứ tự output tile và row-block, nên
pair reducer chỉ cần đọc lock-step, không cần tag hàng trong mỗi packet.

## 6. Reduction và scatter output

Mỗi PE tính partial cho **toàn bộ output row**. Pair reducer cộng trước:

```text
sum01 = partial0 + partial1
sum23 = partial2 + partial3
```

Sau đó dữ liệu được route theo nửa output:

- Pair01 giữ `sum01` của nửa đầu, gửi `sum01` của nửa sau sang pair23.
- Pair23 gửi `sum23` của nửa đầu sang pair01, giữ nửa sau.
- Final01 cộng hai pair-sum của nửa đầu rồi chia thành shard PE0 và PE1.
- Final23 cộng hai pair-sum của nửa sau rồi chia thành shard PE2 và PE3.

```text
output tiles: [ quarter0 | quarter1 | quarter2 | quarter3 ]
owner:             PE0        PE1        PE2        PE3
                   \________first half________/
                                      \________second half_______/
```

Chỉ một nửa `sum01` và một nửa `sum23` phải đi qua liên kết giữa hai pair.
Không có một completed vector đi từ reducer trung tâm rồi broadcast tới bốn
PE.

Q/K/V được đổi FP32 sang fixed-point Q15.17 trong finalizer. Các mode còn lại
giữ FP32. Bốn packet 128-bit được ghép lại thành một word output 512-bit trước
khi ghi scratch BRAM cục bộ.

## 7. Stream và buffering tại biên PE

| Kênh | Width | Depth | Storage/chức năng |
|---|---:|---:|---|
| Position chain | 12 bit | 2 | SRL; SLR0→1→2→3 |
| RMS local partial | 32 bit | 4 | scalar sumsq |
| RMS reciprocal local | 32 bit | 2 | scalar feedback |
| RMS pair23→pair01 | 32 bit | 4 | pair sum |
| RMS pair01→pair23 | 32 bit | 4 | reciprocal relay |
| Linear PE partial | 128 bit | 8 | bốn FP32/packet |
| Linear pair-half cross | 128 bit | 16 | BRAM FIFO |
| Linear completed output | 128 bit | 32 | buffer trước local store |
| Completion | 1 bit | 4 | pair join/final wait |
| PE-local weight FIFO | 512 bit | 256 | BRAM, hai cửa sổ đọc 64-beat |

Depth ở biên không thay đổi thuật toán; chúng tạo elasticity để AXI latency,
floating-point latency và đường qua SLR không biến thành một combinational
control path dài.

## 8. Phân chia trên bốn SLR

### 8.1. Phân chia logic khuyến nghị

| SLR | Cụm logic nên đặt lân cận | DDR |
|---|---|---|
| SLR0 | PE0, model/residual/QKV/activation shard 0, control | DDR0 |
| SLR1 | PE1, shard 1, pair01/final01 lân cận | DDR1 |
| SLR2 | PE2, shard 2, pair23/final23 lân cận | DDR2 |
| SLR3 | PE3, model/residual/QKV/activation shard 3 | DDR3 |

Đây là topology nên hướng tới, không phải constraint cứng hiện tại. Pointer có
suffix `N` chỉ đi vào local PE `N`, và `gmemN` được nối với `DDR[N]` trong
`link_300mhz.cfg`. Đặt pair01/final01 gần SLR1 và pair23/final23 gần SLR2 làm
cho reduction hội tụ về hai SLR giữa thay vì kéo một reducer toàn cục qua cả
chiều ngang thiết bị.

Các crossing logic còn lại khi đi theo topology này là có chủ đích:

- Position command đi theo chuỗi SLR0 -> SLR1 -> SLR2 -> SLR3.
- RMS gửi `sum23` từ phía SLR2 về SLR1 và gửi reciprocal theo chiều ngược lại.
- Linear trao đổi đúng một nửa `sum01` và một nửa `sum23` qua biên SLR1/SLR2.
- Kết quả final01 trả về PE0/PE1; final23 trả về PE2/PE3. Không có một vector
  hoàn chỉnh broadcast từ một SLR trung tâm.

### 8.2. Constraint vật lý đang thực sự áp dụng

Floorplan hiện tại **không hard-pblock toàn bộ PE**. Script pre-place chỉ ép:

```text
gmem0_m_axi_U -> SLR0
gmem1_m_axi_U -> SLR1
gmem2_m_axi_U -> SLR2
gmem3_m_axi_U -> SLR3
control_s_axi_U -> SLR0
```

Nó đặt `USER_SLR_ASSIGNMENT` cho năm interface root và thêm leaf primitive của
chúng vào `pblock_dynamic_SLRN`. Datapath MAC, BRAM/URAM, FIFO, RMS pair và
linear reducer vẫn để Vivado placement theo timing.

Vì vậy bảng ownership phía trên không phải bằng chứng rằng mọi primitive của
PE0 đã nằm trong SLR0, v.v. Muốn biết placement thật phải đọc routed DCP và
thống kê cell/route theo hierarchy.

Lý do không khóa cứng nguyên PE:

- Run placement tự do đã cho routed WNS khoảng `-2.213 ns`.
- Run ép toàn bộ PE vào SLR tương ứng từng cho post-place WNS khoảng
  `-4.900 ns` vì congestion.
- Floorplan interface-only hiện tại sửa trực tiếp trường hợp AXI adapter bị
  đặt xa DDR nhưng vẫn cho placer tự cân bằng logic lớn.
- Phương án interface-only chưa có routed DCP mới, nên chưa được phép khẳng
  định timing closure 300 MHz.

Một floorplan PE tiếp theo nên dựa trên báo cáo routed hierarchy/crossing và
chỉ tạo soft pblock cho cụm gây vấn đề, thay vì ép toàn bộ PE ngay từ đầu.

## 9. Ý nghĩa đối với băng thông và timing

Kiến trúc input-column shard đổi bài toán từ một đường broadcast activation
rộng sang bốn đường đọc DDR song song và các reduction packet hẹp:

- Mỗi PE có khả năng đọc 512-bit weight/cycle từ DDR cục bộ.
- Tổng datapath weight lý tưởng là 2048 bit/cycle trên bốn bank.
- Cross-PE payload lớn nhất của RMSNorm chỉ 32 bit/event.
- Cross-pair payload linear là 128 bit/cycle khi reducer đạt II=1.
- Không có bus activation 480/512-bit fanout từ một controller tới bốn SLR.
- Address/mode được local scheduler tự sinh từ fixed schedule; không có global
  mode bus chạy qua toàn chip.

HLS C-synthesis gần nhất đạt estimated period 2.787 ns, tương đương
358.84 MHz với target 3.333 ns. Tổng estimate là 1308 BRAM18K, 900 DSP,
363118 FF, 393387 LUT và 160 URAM. Toàn kernel gần bằng sức chứa LUT/BRAM của
một SLR, nên kiến trúc bắt buộc phải trải qua bốn SLR; tuy nhiên số liệu HLS
không thay thế kết quả place/route.

## 10. Các invariant cần giữ khi sửa source

- PE `N` không được đọc `model_bank`, residual, RoPE hoặc KV cache của PE khác.
- Bốn PE phải phát partial packet cùng thứ tự tile/row-block.
- Weight reader và compute phải duy trì thứ tự một word 512-bit cho mỗi
  `(output_tile, local_col_tile, group, row_block)`.
- Q/K/V phải giữ output Q15.17; O/GATE/UP/DOWN/LOGITS giữ FP32 tại boundary
  tương ứng.
- RMS pair service phải xử lý đúng 65 event và linear reducer đúng 225 event.
- Invocation đầu tiên phải có `position == 0` để preload metadata URAM.
- Không thêm broadcast activation rộng hoặc global mode/state bus qua bốn SLR.
- Không xem HLS Fmax là timing closure; chỉ routed WNS/WHS không âm mới chứng
  minh kernel đạt 300 MHz trên U250.
