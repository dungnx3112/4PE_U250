# Báo Cáo Tính Toán & Thiết Kế Chi Tiết Module Nhân Ma Trận (Matmul / GEMV INT4) Trên 4 SLR (Xilinx Alveo U250)

Tài liệu này cung cấp toàn bộ phân tích toán học, cấu trúc dữ liệu nhị phân bit-level, lưu đồ streaming dataflow, cơ chế chồng lấn (overlap/pipelining), mạng lưới gom tụ (reduction network) và bảng tính toán định lượng (chu kỳ, băng thông, tài nguyên) của module nhân ma trận – vector (**GEMV INT4**) trong bộ tăng tốc phần cứng **Llama-2-7B** triển khai trên 4 Super Logic Regions (SLR) của FPGA AMD/Xilinx Alveo U250.

---

## MỤC LỤC
1. [Tổng Quan Kiến Trúc & Nguyên Lý Sharding](#1-tổng-quan-kiến-trúc--nguyên-lý-sharding)
2. [Layout Weight & Bố Trí Dữ Liệu Bộ Nhớ (Weight Layout)](#2-layout-weight--bố-trí-dữ-liệu-bộ-nhớ-weight-layout)
   - 2.1. Phân chia kích thước, Padding và Kích thước từng PE
   - 2.2. Cấu trúc Tile Ma Trận chuẩn $128 \times 256$
   - 2.3. Bố trí Bit-Level trong 1 Word Weight 512-bit (Nibble Placement)
   - 2.4. Định dạng Scale Factor FP16 và RMS Gamma FP32
   - 2.5. Bản đồ bộ nhớ tổng thể trên mỗi kênh DDR
3. [Cơ Chế Nạp & Truyền Weight Vào Các PE (Weight Streaming)](#3-cơ-chế-nạp--truyền-weight-vào-các-pe-weight-streaming)
   - 3.1. 4 Kênh AXI Master 512-bit độc lập
   - 3.2. Sequential Registered Address Counter (Khử vi phạm timing SLR)
   - 3.3. Cơ chế đệm 2 tầng (2-Tier Decoupling FIFO) & Cắt đứt phản hồi `full_n`
4. [Streaming Dataflow Của Dữ Liệu & Datapath MAC Nội PE](#4-streaming-dataflow-của-dữ-liệu--datapath-mac-nội-pe)
   - 4.1. Vòng đời của Activation (Từ Residual FP32 đến INT15)
   - 4.2. Kỹ thuật DSP Packing: 2 phép nhân INT4 $\times$ INT15 trong 1 DSP48E2
   - 4.3. Chứng minh toán học an toàn tràn số và Khử mượn (Borrow Correction)
   - 4.4. Cấu trúc song song 64 DSPs trong mỗi PE
5. [Cơ Chế Chồng Lấn (Overlap, Pipelining & Double-Buffering)](#5-cơ-chế-chồng-lấn-overlap-pipelining--double-buffering)
   - 5.1. Pipelining II=1 ở vòng lặp trong cùng
   - 5.2. Task-Level Dataflow Overlap giữa AXI Reader và MAC Engine
   - 5.3. Ẩn độ trễ truy xuất DDR bằng Burst Pipelining
   - 5.4. Đồng bộ hóa không khóa (Lock-step without global stall)
6. [Quá Trình Tích Lũy, Mạng Gom Tụ (Reduction) & Load/Save Buffers](#6-quá-trình-tích-lũy-mạng-gom-tụ-reduction--loadsave-buffers)
   - 6.1. Tích lũy cục bộ (Local Accumulation Buffer)
   - 6.2. Đóng gói luồng trung gian (Partial Stream Emission)
   - 6.3. Mạng Reduction 2 cấp phân tán (Hierarchical Pair Reduction)
   - 6.4. Kỹ thuật Shuffled Cross-Pair Exchange (Không Broadcast toàn cục)
   - 6.5. Finalization, Ép kiểu Q15.17 và Lưu trữ vào Scratchpad BRAM
7. [Bảng Tính Toán Định Lượng (Quantitative Metrics)](#7-bảng-tính-toán-định-lượng-quantitative-metrics)
   - 7.1. Bảng số phép tính FLOPs / MACs và Words dữ liệu
   - 7.2. Tính toán chu kỳ xung nhịp lý thuyết & Thời gian thực thi
   - 7.3. Tính toán băng thông bộ nhớ (Bandwidth Analysis)
   - 7.4. Bảng tổng hợp tài nguyên phần cứng (Resource Utilization)
8. [Đối Chiếu Mã Nguồn HLS (Source Code Traceability)](#8-đối-chiếu-mã-nguồn-hls-source-code-traceability)

---

## 1. Tổng Quan Kiến Trúc & Nguyên Lý Sharding

Trong mô hình Transformer giải mã (Decoder-only) như Llama-2-7B, phép nhân ma trận trọng số với vector kích hoạt (GEMV: $y = W \cdot x$) chiếm hơn **95% khối lượng tính toán và băng thông bộ nhớ**.

Hệ thống sử dụng **4 Processing Elements (PE0, PE1, PE2, PE3)** ánh xạ trực tiếp lên **4 Super Logic Regions (SLR0, SLR1, SLR2, SLR3)** của chip Xilinx Alveo U250.

```
+-------------------------------------------------------------------------------+
|                                ALVEO U250                                     |
|                                                                               |
|  [DDR0] <===> SLR0: PE0 (Shard Cột 0) <==+                                   |
|                                          | (Kênh 128-bit Partial)             |
|  [DDR1] <===> SLR1: PE1 (Shard Cột 1) <==+==> [Pair 01 Reducer]               |
|                                                      ||                       |
|                                        (Cross-SLR    || (128-bit BRAM FIFO    |
|                                         Boundary)    ||  chỉ gửi 50% data)    |
|                                                      ||                       |
|  [DDR2] <===> SLR2: PE2 (Shard Cột 2) <==+==> [Pair 23 Reducer]               |
|                                          | (Kênh 128-bit Partial)             |
|  [DDR3] <===> SLR3: PE3 (Shard Cột 3) <==+                                   |
+-------------------------------------------------------------------------------+
```

### Nguyên tắc Phân Mảnh Theo Cột Đầu Vào (Input-Column Sharding):
- **Phép toán tổng quát**: $y = W \cdot x$, trong đó $x \in \mathbb{R}^{K}$ (vector kích hoạt), $W \in \mathbb{R}^{M \times K}$ (ma trận trọng số), $y \in \mathbb{R}^{M}$ (vector kết quả).
- **Phân mảnh cột**: Chiều cột đầu vào $K$ được chia đều cho 4 PE:
  $$x = \begin{bmatrix} x_0 \\ x_1 \\ x_2 \\ x_3 \end{bmatrix}, \quad W = \begin{bmatrix} W_0 & W_1 & W_2 & W_3 \end{bmatrix}$$
  - Mỗi PE $p \in \{0, 1, 2, 3\}$ giữ một **input shard** $x_p \in \mathbb{R}^{K/4}$ trong BRAM cục bộ.
  - Mỗi PE $p$ chỉ đọc từ DDR $p$ cục bộ khối ma trận $W_p \in \mathbb{R}^{M \times (K/4)}$ gồm **tất cả các hàng đầu ra $M$**, nhưng chỉ chứa các cột thuộc dải $[p \cdot \frac{K}{4}, (p+1) \cdot \frac{K}{4})$.
- **Tính kết quả cục bộ (Partial Dot Product)**:
  $$\text{partial}_p[r] = \sum_{c=0}^{K/4 - 1} W_p[r, c] \cdot x_p[c], \quad \forall r \in [0, M-1]$$
- **Gom tụ kết quả toàn cục (Global Reduction)**:
  $$y[r] = \text{partial}_0[r] + \text{partial}_1[r] + \text{partial}_2[r] + \text{partial}_3[r]$$

> **Ý nghĩa kiến trúc then chốt**:
> Nhờ sharding theo cột đầu vào, **KHÔNG CẦN BROADCAST VECTOR KÍCH HOẠT $x$ (rộng 4096 hoặc 11008 phần tử) qua 4 SLR**. Mỗi PE tự xử lý độc lập phần activation của mình với các cột weight cục bộ, chỉ phát sinh luồng dữ liệu liên SLR ở khâu cộng gộp partial result hẹp (128-bit packet).

---

## 2. Layout Weight & Bố Trí Dữ Liệu Bộ Nhớ (Weight Layout)

### 2.1. Phân chia kích thước, Padding và Kích thước từng PE

Kiến trúc phần cứng quy định mọi kích thước ma trận phải là bội số của kích thước Tile phần cứng:
- Chiều cao Tile: $T_{\text{row}} = 128$ hàng.
- Chiều rộng Tile: $T_{\text{col}} = 256$ cột.
- Vì có 4 PE xử lý song song, kích thước cột toàn cục phải là bội số của $4 \times 256 = 1024$ cột.

Bảng quy đổi kích thước thực tế của Llama-2-7B sang kích thước phần cứng sau Padding:

| Projection Mode | Kích thước gốc ($M \times K$) | Kích thước sau Pad ($M_{\text{pad}} \times K_{\text{pad}}$) | Output Tiles ($M_{\text{pad}} / 128$) | Input Tiles ($K_{\text{pad}} / 1024$) | Cột/PE ($K_{\text{pad}} / 4$) | Hàng output/PE ($M_{\text{pad}} / 4$) |
|---|---|---|---:|---:|---:|---:|
| **Q, K, V, O** | $4096 \times 4096$ | $4096 \times 4096$ | 32 | 4 | 1024 | 1024 |
| **GATE, UP** | $11008 \times 4096$ | $11264 \times 4096$ | 88 | 4 | 1024 | 2816 |
| **DOWN** | $4096 \times 11008$ | $4096 \times 11264$ | 32 | 11 | 2816 | 1024 |
| **LOGITS** | $32000 \times 4096$ | $32256 \times 4096$ | 252 | 4 | 1024 | 8064 |

*Ghi chú về phần bù (Padding)*:
- FFN Hidden Dimension $11008$ được pad thêm $256$ thành $11264$ (chia hết cho 1024: $11264 / 1024 = 11$ local tiles).
- Vocab Size $32000$ được pad thêm $256$ thành $32256$ ($32256 / 512 = 63$ tiles/PE hay $252$ tiles toàn cục).
- Toàn bộ trọng số ở các vị trí pad đều được điền giá trị 0 offline bởi packer.

---

### 2.2. Cấu trúc Tile Ma Trận chuẩn $128 \times 256$

Một ma trận con cục bộ gán cho 1 PE bao gồm nhiều Matrix Tile kích thước $128 \times 256$ ($128$ output rows $\times 256$ input cols).
Mỗi Tile được tổ chức như sau:
- **Chiều cột (256 cols)**: Được chia thành **8 Groups**, mỗi group gồm **32 input columns** (ứng với kích thước nhóm lượng tử G32: `INT4_GROUP_SIZE = 32`).
- **Chiều hàng (128 rows)**: Được chia thành **32 Row-Blocks**, mỗi block gồm **4 output rows** (ứng với số lane tính toán song song: `INT4_ROW_BLOCK = 4`).
- **Số Word 512-bit trong 1 Tile**:
  $$\text{Words per Tile} = 8 \text{ groups} \times 32 \text{ row-blocks} = 256 \text{ words}$$
- **Kiểm tra dung lượng**:
  $$256 \text{ words} \times 512 \text{ bits/word} = 131,072 \text{ bits} = 32,768 \text{ weights INT4}$$
  Khớp chính xác với: $128 \text{ rows} \times 256 \text{ cols} = 32,768$ phần tử.

```
       <------------------------- 256 Input Columns ------------------------->
       +------------------+------------------+     +------------------+
       | Group 0 (32 cols)| Group 1 (32 cols)| ... | Group 7 (32 cols)|
+----+ +==================+==================+     +==================+
| R0 | |                  |                  |     |                  |
| R1 | |  Word 0 (512b)   |  Word 32 (512b)  | ... |  Word 224 (512b) |
| R2 | |                  |                  |     |                  |
| R3 | |                  |                  |     |                  |
+----+ +------------------+------------------+     +------------------+
| R4 | |                  |                  |     |                  |
| R5 | |  Word 1 (512b)   |  Word 33 (512b)  | ... |  Word 225 (512b) |
| R6 | |                  |                  |     |                  |
| R7 | |                  |                  |     |                  |
+----+ +------------------+------------------+     +------------------+
  :             :                  :                         :
+----+ +------------------+------------------+     +------------------+
|R124| |                  |                  |     |                  |
|R125| |  Word 31 (512b)  |  Word 63 (512b)  | ... |  Word 255 (512b) |
|R126| |                  |                  |     |                  |
|R127| |                  |                  |     |                  |
+----+ +------------------+------------------+     +------------------+
```

---

### 2.3. Bố trí Bit-Level trong 1 Word Weight 512-bit (Nibble Placement)

Một Word 512-bit chứa thông tin của **1 Group (32 input lanes) $\times$ 1 Row-Block (4 output rows)**.
Mỗi phần tử trọng số là số nguyên có dấu 4-bit (`int4_weight_t`, miền giá trị $[-7, +7]$).

512 bit được chia thành **32 lát cắt 16-bit** tương ứng với 32 input lanes ($32 \times 16 = 512$ bit):
$$\text{Bit index of lane } k = [16k + 15 : 16k], \quad k \in [0, 31]$$

Trong mỗi lát cắt 16-bit của lane $k$, 4 giá trị trọng số của 4 hàng (Row 0, Row 1, Row 2, Row 3) được sắp xếp đặc biệt để phục vụ trực tiếp cho cơ chế **DSP Packing**:

```
Lát cắt 16-bit của Lane k (tương ứng input column k):
+-----------------------------------+-----------------------------------+
|       Byte Cao: bits [15:8]       |       Byte Thấp: bits [7:0]       |
|              Pair 1               |              Pair 0               |
+-----------------+-----------------+-----------------+-----------------+
|  Nibble Cao     |  Nibble Thấp    |  Nibble Cao     |  Nibble Thấp    |
|  bits [15:12]   |  bits [11:8]    |  bits [7:4]     |  bits [3:0]     |
+-----------------+-----------------+-----------------+-----------------+
|   Row 2 INT4    |   Row 3 INT4    |   Row 0 INT4    |   Row 1 INT4    |
|   (w_high 1)    |   (w_low 1)     |   (w_high 0)    |   (w_low 0)     |
+-----------------+-----------------+-----------------+-----------------+
```

Công thức trích xuất bit trong phần cứng ([`int4_linear_controller.cpp:370-379`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L370-L379)):
```cpp
const ap_uint<8> pair0 = weight.range(16 * lane + 7, 16 * lane);
const ap_uint<8> pair1 = weight.range(16 * lane + 15, 16 * lane + 8);

// Pair 0: Row 0 nằm ở [7:4], Row 1 nằm ở [3:0]
int4_weight_t w_row0 = pair0.range(7, 4);
int4_weight_t w_row1 = pair0.range(3, 0);

// Pair 1: Row 2 nằm ở [7:4] của pair1 (tức bits [15:12]), Row 3 nằm ở [3:0] (bits [11:8])
int4_weight_t w_row2 = pair1.range(7, 4);
int4_weight_t w_row3 = pair1.range(3, 0);
```

---

### 2.4. Định dạng Scale Factor FP16 và RMS Gamma FP32

1. **Weight Scale (FP16)**:
   - Áp dụng kỹ thuật lượng tử hóa đối xứng theo từng Tile $128 \times 256$:
     $$\text{scale} = \frac{\max_{r, c \in \text{Tile}} |W[r, c]|}{7.0}$$
   - Giá trị scale được lưu dưới dạng **IEEE 754 Half-Precision (FP16)** (16 bit).
   - Đóng gói: 1 word 512-bit chứa $512 / 16 = 32$ scale FP16 của 32 tiles liên tiếp (`INT4_WEIGHT_SCALES_PER_WORD = 32`).
   - Toàn bộ scale được nạp vào **URAM** (`scale_cache`) khi khởi động (`position == 0`).

2. **RMSNorm Gamma (FP32)**:
   - Mỗi phần tử chuẩn hóa có 1 trọng số tỉ lệ $\gamma$ dạng **Single-Precision Float (FP32)** (32 bit).
   - Mỗi vector 4096 có $4096 / 4 = 1024$ giá trị gamma trên mỗi PE, tương ứng 64 words 512-bit ($64 \times 16 \text{ floats} = 1024$).
   - Toàn bộ gamma của 32 layer ($32 \times 2 + 1 = 65$ vector) được lưu trong **URAM** (`norm_cache`).

---

### 2.5. Bản đồ bộ nhớ tổng thể trên mỗi kênh DDR

Mỗi kênh DDR $p$ (giao tiếp qua `gmem[p]`) lưu giữ cấu trúc bộ nhớ tĩnh của riêng PE $p$:

```
Địa chỉ Offset (Word 512-bit)
+------------------------+  Word 0
| Weight Scale Cache     |  (1,600 words = 100 KB) -> Đọc vào URAM
+------------------------+  Word 1,600
| RMSNorm Gamma Cache    |  (4,160 words = 260 KB) -> Đọc vào URAM
+------------------------+  Word 5,760
| INT4 Weights           |  (13,103,104 words = 799.75 MB) -> Stream khi tính
|   - Layer 0..31        |    * Q, K, V, O: 32,768 words/mode/layer
|   - Logits             |    * Gate, Up, Down: 90,112 words/mode/layer
|                        |    * Logits: 258,048 words
+------------------------+  Word 13,108,864 (Tổng: 800.1 MB/DDR)
```

Kiểm tra assert trong code ([`int4_model_layout.hpp:178-185`](file:///c:/KLTN/4PE_U250/int4_model_layout.hpp#L178-L185)):
- `INT4_TOTAL_WEIGHT_SCALE_WORDS_PER_PE == 1600`
- `INT4_TOTAL_NORM_WORDS_PER_PE == 4160`
- `INT4_TOTAL_WEIGHT_WORDS_PER_PE == 13103104`
- `INT4_MODEL_WORDS_PER_DDR == 13108864`

---

## 3. Cơ Chế Nạp & Truyền Weight Vào Các PE (Weight Streaming)

### 3.1. 4 Kênh AXI Master 512-bit độc lập

Phần cứng ánh xạ 4 cổng bộ nhớ độc lập:
- `PE0` $\to$ `gmem0` $\to$ `DDR[0]` (SLR0)
- `PE1` $\to$ `gmem1` $\to$ `DDR[1]` (SLR1)
- `PE2` $\to$ `gmem2` $\to$ `DDR[2]` (SLR2)
- `PE3` $\to$ `gmem3` $\to$ `DDR[3]` (SLR3)

Mỗi kênh AXI được cấu hình trong Pragmas HLS:
`latency=32`, `max_read_burst_length=64`, `num_read_outstanding=2`.
Tổng băng thông lý thuyết của 4 kênh chạy song song ở 300 MHz:
$$\text{Băng thông tối đa} = 4 \times 64 \text{ bytes/cycle} \times 300 \text{ MHz} = 76.8 \text{ GB/s}$$

---

### 3.2. Sequential Registered Address Counter (Khử vi phạm timing SLR)

Trong các thiết kế HLS thông thường, phép tính địa chỉ `weight_mem[base + offset]` tạo ra bộ cộng 64-bit hoặc 32-bit rộng. Trong Vivado implementation cũ, chuỗi carry-chain `CARRY8` của bộ cộng này bị công cụ place-and-route kéo xuyên SLR (từ SLR0 lên SLR2 rồi vòng về SLR0), gây trễ đường truyền lên đến **6.6 ns**, làm hỏng timing 300 MHz (chu kỳ yêu cầu $3.333 \text{ ns}$).

**Giải pháp kiến trúc**: Thay thế bộ cộng offset bằng **bộ đếm thanh ghi cục bộ 24-bit (Narrow Registered Counter)** ([`int4_linear_controller.cpp:261-279`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L261-L279)):
```cpp
template <int PE_ID>
static void int4_read_local_weights(
    const int4_weight_word_t* weight_mem,
    hls::stream<int4_weight_request_t>& request_stream,
    hls::stream<int4_weight_word_t>& weight_ingress) {
    const int4_weight_request_t request = request_stream.read();
    ap_uint<24> address = request.range(23, 0);
    const ap_uint<18> total_words = request.range(41, 24);

stream_local_weight_loop:
    for (ap_uint<19> remaining = total_words; remaining != 0; --remaining) {
#pragma HLS PIPELINE II=1
        weight_ingress.write(weight_mem[(unsigned int)address]);
        ++address; // Bộ đếm tăng tuần tự 24-bit, nằm trọn vẹn trong SLR cục bộ
    }
}
```

---

### 3.3. Cơ chế đệm 2 tầng (2-Tier Decoupling FIFO) & Cắt đứt phản hồi `full_n`

Để bảo vệ đường AXI ARVALID/RREADY khỏi các tín hiệu dừng (stall) phức tạp từ lõi tính toán, hệ thống thiết kế cơ chế đệm 2 tầng độc đáo:

```
[DDR AXI Port] 
       |
       v (Burst 64 beats)
[int4_read_local_weights]
       |
       v (512-bit, depth=4, SRL FIFO) <--- Ranh giới đăng ký timing cực ngắn
[weight_ingress]
       |
       v (Chuyển tiếp II=1)
[int4_buffer_local_weights]
       |
       v (512-bit, depth=256, BRAM FIFO) <- Chứa đúng 1 Tile (2 cửa sổ đọc 64-beat)
[weight_buffer]
       |
       v (512-bit/cycle tiêu thụ đều đặn)
[int4_compute_local_partials]
```

- **Tầng 1 - `weight_ingress` (SRL FIFO, depth=4)**: Nằm ngay sát primitive AXI adapter, đảm bảo pipeline đọc AXI đạt II=1 không bị áp lực diện tích routing.
- **Tầng 2 - `weight_buffer` (BRAM FIFO, depth=256)**: Có sức chứa đúng bằng 256 word (1 Tile ma trận). Độ sâu này vừa vặn hấp thụ 2 burst AXI 64-beat outstanding.
- **Cắt đường phản hồi `full_n`**: Tín hiệu báo đầy `full_n` của BRAM FIFO chỉ tác động dừng tiến trình `int4_buffer_local_weights` cục bộ, **tuyệt đối không truyền ngược về máy trạng thái của AXI Reader**, ngăn ngừa tạo thành chu trình trễ kết hợp (combinational loop) cắt ngang qua chip.

---

## 4. Streaming Dataflow Của Dữ Liệu & Datapath MAC Nội PE

### 4.1. Vòng đời của Activation (Từ Residual FP32 đến INT15)

Trước khi đi vào phép nhân ma trận, dữ liệu activation được biến đổi khép kín trong từng PE:
1. **Residual Stream**: Lưu trong BRAM `residual` ($1024$ FP32/PE).
2. **RMSNorm Cục bộ**: Mỗi PE tính tổng bình phương cục bộ $\sum x_i^2$ ([`int4_decoder_blocks.cpp:45-80`](file:///c:/KLTN/4PE_U250/int4_decoder_blocks.cpp#L45-L80)), sau đó gửi scalar FP32 lên Pair Reducer để tính:
   $$\text{inv\_rms} = \frac{1}{\sqrt{\frac{1}{4096}\sum_{i=0}^{4095} x_i^2 + 10^{-5}}}$$
3. **Quantization G32 (Lượng tử hóa nhóm 32)**:
   - Mỗi PE nhận lại scalar `inv_rms`, nhân với vector $\gamma$ tương ứng:
     $$\bar{x}_i = x_i \cdot \text{inv\_rms} \cdot \gamma_i$$
   - Với mỗi nhóm 32 phần tử, tìm biên độ cực đại: $a_{\max} = \max_{j \in [0, 31]} |\bar{x}_j|$.
   - Tính hệ số tỉ lệ: $\text{act\_scale} = \frac{a_{\max}}{16383.0}$.
   - Lượng tử hóa về số nguyên có dấu 15-bit (INT15, phạm vi $[-16383, +16383]$):
     $$q_j = \text{clamp}\left(\text{round}\left(\frac{\bar{x}_j}{\text{act\_scale}}\right), -16383, 16383\right)$$
4. **Đóng gói vào BRAM**: 32 số INT15 được đóng gói thành 1 word 480-bit ($32 \times 15 = 480$ bit), lưu vào `activation_q[group]` sẵn sàng cho GEMV.

---

### 4.2. Kỹ thuật DSP Packing: 2 phép nhân INT4 $\times$ INT15 trong 1 DSP48E2

Bộ nhân phần cứng trong khối DSP48E2 của FPGA Xilinx UltraScale+ hỗ trợ phép nhân số nguyên có dấu với kích thước tối đa **$27 \text{ bit} \times 18 \text{ bit}$**.

Nếu thực hiện nhân thông thường, mỗi phép nhân $W_{\text{int4}} \times A_{\text{int15}}$ tiêu tốn 1 khối DSP, gây lãng phí nghiêm trọng tài nguyên của bộ nhân 27-bit. Kiến trúc này áp dụng kỹ thuật **ghép 2 trọng số INT4 vào 1 từ 27-bit để tính đồng thời 2 phép nhân của 2 hàng đầu ra khác nhau trên cùng 1 activation**.

```
Bộ nhân DSP48E2: Cổng A (27 bit) x Cổng B (18 bit)
+---------------------------------------------------------------+
| Cổng A (27-bit có dấu): [w_high (4b)] [23 bit 0 / khoảng cách] [w_low (4b)] |
| Cổng B (15-bit có dấu): [Activation a_k (15-bit INT15)]                     |
+---------------------------------------------------------------+
                               |
                               v Phép nhân DSP
+---------------------------------------------------------------+
| Kết quả (46-bit):  [w_high * a_k] * 2^23  +  [w_low * a_k]   |
+---------------------------------------------------------------+
```

Mã nguồn thực thi đóng gói ([`int4_linear_controller.cpp:89-97`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L89-L97)):
```cpp
static ap_int<27> int4_pack_two_w4(int4_weight_t high, int4_weight_t low) {
#pragma HLS INLINE
    const ap_int<27> packed = ((ap_int<27>)high << 23) + (ap_int<27>)low;
#pragma HLS BIND_OP variable=packed op=add impl=fabric // Ép cộng trên LUT fabric
    return packed;
}
```

---

### 4.3. Chứng minh toán học an toàn tràn số và Khử mượn (Borrow Correction)

#### Bước 1: Chứng minh không tràn bit (Overflow Safety)
Trong một nhóm $G32$, phép tích lũy diễn ra trên 32 phần tử của lane:
- Giá trị trọng số: $w \in [-7, +7]$.
- Giá trị activation: $a \in [-16383, +16383]$.
- Giá trị tích cực đại của 1 phần tử:
  $$|w \cdot a|_{\max} = 7 \times 16383 = 114,681$$
- Tổng tích lũy tối đa của 32 phần tử trong trường thấp ($S_{\text{low}}$):
  $$|S_{\text{low}}| = \left| \sum_{k=0}^{31} w_{\text{low}, k} \cdot a_k \right| \le 32 \times 114,681 = 3,669,792$$
- So sánh với độ rộng trường 23-bit:
  $$2^{21} = 2,097,152 < 3,669,792 < 2^{22} = 4,194,304 < 2^{23} = 8,388,608$$
- **Kết luận**: Giá trị tích lũy tuyệt đối $3,669,792$ chỉ chiếm tối đa 22 bit (bao gồm 1 bit dấu ở vị trí bit 22). **Khoảng cách 23-bit đảm bảo tuyệt đối không có bit dữ liệu nào từ trường thấp bị tràn (overflow) sang trường cao!**

#### Bước 2: Khử hiện tượng mượn (Borrow Correction)
Khi biểu diễn số âm bằng bù 2 trong trường 23-bit:
- Nếu $S_{\text{low}} \ge 0$: Bit 22 là 0. Trường cao phản ánh chính xác $S_{\text{high}}$.
- Nếu $S_{\text{low}} < 0$: Bit 22 là 1. Phép biểu diễn bù 2 của $S_{\text{low}}$ trong hệ thống số lớn hơn gây ra một giá trị mượn (borrow) bằng $2^{23}$ từ các bit phía trên. Do đó, trường thô ở dải bit $[45:23]$ bị giảm đi 1 đơn vị:
  $$\text{high\_raw} = S_{\text{high}} - 1$$
- Để khôi phục lại giá trị chính xác của $S_{\text{high}}$, ta chỉ việc **cộng thêm bit dấu `low[22]` vào `high_raw`**:
  $$S_{\text{high}} = \text{high\_raw} + \text{low}[22]$$

Mã nguồn giải mã ([`int4_linear_controller.cpp:99-108`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L99-L108)):
```cpp
static void int4_unpack_packed_acc(
    int4_packed_acc_t packed,
    int4_group_acc_t& high,
    int4_group_acc_t& low) {
#pragma HLS INLINE
    low = packed.range(22, 0);
    const int4_group_acc_t high_raw = packed.range(45, 23);
    high = (int4_group_acc_t)((ap_int<24>)high_raw + (low[22] ? 1 : 0));
}
```

---

### 4.4. Cấu trúc song song 64 DSPs trong mỗi PE

Trong mỗi chu kỳ xung nhịp của loop tính toán (`local_partial_row_block_loop`):
- Đầu vào: 1 word weight 512-bit (chứa $32 \text{ lanes} \times 4 \text{ rows}$) và 1 word activation 480-bit (chứa 32 phần tử INT15).
- Trong 32 lanes song song:
  - Lane $k$ có 2 bộ nhân DSP:
    - **DSP 0**: Thực hiện $(w_{\text{row0}} \ll 23 + w_{\text{row1}}) \times a_k$
    - **DSP 1**: Thực hiện $(w_{\text{row2}} \ll 23 + w_{\text{row3}}) \times a_k$
- Tổng số bộ nhân integer MAC DSP48E2 hoạt động song song:
  $$\text{DSPs per PE} = 32 \text{ lanes} \times 2 \text{ multipliers} = 64 \text{ DSPs}$$
- Số phép nhân vô hướng hoàn thành mỗi cycle:
  $$\text{Multiplications per cycle} = 64 \times 2 = 128 \text{ MACs/cycle/PE}$$
- Trên toàn FPGA (4 PE):
  $$\text{Toàn hệ thống} = 64 \times 4 = 256 \text{ DSPs} \implies 512 \text{ MACs INT4}\times\text{INT15 mỗi cycle!}$$

Sau khi tính xong tổng số nguyên của nhóm 32 phần tử, giá trị được chuyển đổi sang float và nhân với tích hệ số tỉ lệ `combined_scale = weight_scale * activation_scale` bằng các DSP FP32 độc lập.

---

## 5. Cơ Chế Chồng Lấn (Overlap, Pipelining & Double-Buffering)

### 5.1. Pipelining II=1 ở vòng lặp trong cùng

Lõi tính toán `local_partial_row_block_loop` được chỉ định:
```cpp
#pragma HLS PIPELINE II=1 style=stp
```
Mỗi chu kỳ xung nhịp (3.33 ns ở 300 MHz), vòng lặp:
1. Đọc 1 word 512-bit từ `weight_buffer`.
2. Truy xuất 1 word 480-bit từ `activation_q` (đã unroll 32 lane).
3. Thực hiện 64 phép nhân DSP packing.
4. Tích lũy vào 4 thanh ghi tích lũy cục bộ của 4 hàng đầu ra (`partial[row]`).
5. Đạt tỷ lệ khởi tạo hoàn hảo **Initiation Interval = 1 (II=1)**.

---

### 5.2. Task-Level Dataflow Overlap giữa AXI Reader và MAC Engine

Bên trong hàm [`int4_run_local_pe`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L423-L468), các tiến trình con được kết nối theo mô hình **Task Dataflow**:

```
+-------------------------------------------------------------------------------+
|                       int4_run_local_pe (DATAFLOW)                            |
|                                                                               |
|  [AXI Weight Reader] ===(weight_ingress)===> [Weight Buffer Relay]            |
|        ^                                             ||                       |
|        | (Đọc đón trước từ DDR)                      v (weight_buffer BRAM)   |
|        +-----------------------------------> [Compute Engine MAC]             |
|                                                      ||                       |
|                                                      v (partial_stream)       |
|                                              [Emit Partial Packets]           |
+-------------------------------------------------------------------------------+
```

Lược đồ thời gian chồng lấn thực tế:
```
Thời gian (Cycles) --->
AXI Reader:   |-- Load Tile 0 --|-- Load Tile 1 --|-- Load Tile 2 --| ...
Compute MAC:        |-- Calc Tile 0 --|-- Calc Tile 1 --|-- Calc Tile 2 --| ...
Emit Stream:              |Emit 0|          |Emit 1|          |Emit 2| ...
```
Toàn bộ thời gian đọc dữ liệu từ DDR qua AXI được **ẩn hoàn toàn (hidden latency)** đằng sau thời gian tính toán của khối MAC.

---

### 5.3. Ẩn độ trễ truy xuất DDR bằng Burst Pipelining

- Cửa sổ đọc AXI được cấu hình `num_read_outstanding=2` với độ dài burst `max_read_burst_length=64`.
- Một Tile ma trận cần 256 word, tương đương $256 / 64 = 4$ burst AXI liên tiếp.
- Khi Compute Engine đang xử lý nửa sau của Tile hiện tại trong `weight_buffer` (BRAM sâu 256), AXI Reader đã phát lệnh yêu cầu đọc burst cho Tile tiếp theo từ DDR, triệt tiêu hoàn toàn hiện tượng bọt khí xung nhịp (pipeline bubble).

---

### 5.4. Đồng bộ hóa không khóa (Lock-step without global stall)

Không có bus điều khiển toàn cục (global control bus) chạy qua 4 SLR để điều khiển bắt tay (handshake). Thay vào đó, 4 PE duy trì sự đồng bộ hoàn hảo thông qua các **FIFO Stream chặn (Blocking FIFO Streams)**:
- Cả 4 PE đều nạp cùng một lịch trình decoder tĩnh ([`int4_decoder_schedule.hpp`](file:///c:/KLTN/4PE_U250/int4_decoder_schedule.hpp)).
- Khi một PE hoàn thành một tile nhanh hơn, nó sẽ bị block nhẹ tại thao tác ghi vào `partial_stream`.
- Khối Reducer chỉ đọc khi cả 2 nhánh FIFO đều có dữ liệu (`partial0.read()`, `partial1.read()`), tự động kéo 4 PE chạy đồng nhịp (lock-step) mà không cần thêm bất kỳ logic đồng bộ phức tạp nào.

---

## 6. Quá Trình Tích Lũy, Mạng Gom Tụ (Reduction) & Load/Save Buffers

### 6.1. Tích lũy cục bộ (Local Accumulation Buffer)

Trong mỗi PE, mảng `partial[128]` (128 số FP32) lưu trữ giá trị tích lũy của 128 hàng đầu ra trong Tile hiện tại.
- Để cho phép truy cập song song 4 hàng mỗi chu kỳ, mảng được phân vùng tuần hoàn (cyclic partition) bậc 4 ([`int4_linear_controller.cpp:318`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L318)):
  ```cpp
  #pragma HLS ARRAY_PARTITION variable=partial cyclic factor=4
  ```
- **Quy tắc xóa/tích lũy**:
  - Tại cột tile đầu tiên và group đầu tiên (`local_col_tile == 0 && group == 0`), giá trị được ghi đè: `partial[row] = contribution`.
  - Tại các group và cột tile tiếp theo, giá trị được cộng dồn: `partial[row] += contribution`.
- Sau khi duyệt hết tất cả local input tiles (4 tile với Dim 4096, 11 tile với FFN 11264), `partial[128]` chứa giá trị tích chập hoàn chỉnh của shard cột cục bộ.

---

### 6.2. Đóng gói luồng trung gian (Partial Stream Emission)

Sau khi tính xong 1 output tile, hàm phát dữ liệu ([`int4_linear_controller.cpp:405-419`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L405-L419)) duyệt qua 32 row-blocks:
- Mỗi row-block (4 float) được đóng gói thành 1 packet 128-bit (`int4_reduction_packet_t`):
  $$\text{packet}[127:0] = \{\text{float}_3, \text{float}_2, \text{float}_1, \text{float}_0\}$$
- Phát ra stream với `II=1`, hoàn thành trong đúng **32 chu kỳ/tile**.

---

### 6.3. Mạng Reduction 2 cấp phân tán (Hierarchical Pair Reduction)

Thay vì gom toàn bộ 4 luồng partial về một bộ cộng trung tâm (sẽ gây nghẽn định tuyến liên SLR nghiêm trọng), mạng cộng gom tụ được tổ chức thành 2 cấp:

```
[PE 0] (SLR0) ----> partial0 (128b) ---\
                                        +--> [Pair 01 Reducer] (SLR1)
[PE 1] (SLR1) ----> partial1 (128b) ---/          |
                                                  | sum01 (128b)
                                                  v
                                          +---------------+
                                          | Router Cắt Đôi|
                                          +---------------+
                                           /             \
                   (50% data: First Half) /               \ (50% data: Second Half)
                                         v                 v
                 [Finalize 01] (SLR1) <============= [BRAM FIFO sum23_to01]
                       ||                                  ^
                       || (Trả kết quả)                    |
                       v                                   |
                +--------------+                           |  (Ranh giới SLR1 <-> SLR2)
                | PE 0  | PE 1 |                           |
                +--------------+                           |
                                                           |
                 [Finalize 23] (SLR2) <============= [BRAM FIFO sum01_to23]
                       ||                                  ^
                       || (Trả kết quả)                    |
                       v                                   |
                +--------------+                  +---------------+
                | PE 2  | PE 3 |                  | Router Cắt Đôi|
                +--------------+                  +---------------+
                                                           ^
[PE 2] (SLR2) ----> partial2 (128b) ---\                   | sum23 (128b)
                                        +--> [Pair 23 Reducer] (SLR2)
[PE 3] (SLR3) ----> partial3 (128b) ---/
```

- **Cấp 1 - Pair Reducer**:
  - `Pair 01` (đặt tại SLR1): Tính $\text{sum01} = \text{partial}_0 + \text{partial}_1$.
  - `Pair 23` (đặt tại SLR2): Tính $\text{sum23} = \text{partial}_2 + \text{partial}_3$.
  - Thực hiện cộng 4 kênh float song song bằng phép cộng vector unroll ([`int4_linear_controller.cpp:470-485`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L470-L485)).

---

### 6.4. Kỹ thuật Shuffled Cross-Pair Exchange (Không Broadcast toàn cục)

Đây là điểm sáng tạo cốt lõi của kiến trúc giúp đạt timing 300 MHz:
- Các output tile được chia đôi:
  - **Nửa đầu (First Half)**: Dành cho PE0 và PE1 làm activation của layer kế tiếp.
  - **Nửa sau (Second Half)**: Dành cho PE2 và PE3.
- **Quy tắc định tuyến**:
  - `Pair 01`: Giữ lại nửa đầu của `sum01` cho bộ `Finalize 01` cục bộ; chỉ đẩy nửa sau của `sum01` qua cầu liên SLR sang `Pair 23` (qua `sum01_to23`).
  - `Pair 23`: Giữ lại nửa sau của `sum23` cho bộ `Finalize 23` cục bộ; chỉ đẩy nửa đầu của `sum23` qua cầu liên SLR sang `Pair 01` (qua `sum23_to01`).
- **Ý nghĩa**: **Chỉ có đúng 50% khối lượng dữ liệu partial phải vượt qua ranh giới vật lý giữa SLR1 và SLR2**. Hoàn toàn không có đường truyền broadcast nào từ trung tâm tỏa ra toàn chip!

---

### 6.5. Finalization, Ép kiểu Q15.17 và Lưu trữ vào Scratchpad BRAM

1. **Finalize**:
   - `Finalize 01` cộng: $\text{completed} = \text{sum01\_local} + \text{sum23\_to01}$.
   - `Finalize 23` cộng: $\text{completed} = \text{sum23\_local} + \text{sum01\_to23}$.
2. **Ép kiểu Fixed-Point (với Q, K, V)**:
   - Nếu là mode Q, K, V (`output_fxp == true`), giá trị float32 được đổi sang **signed fixed-point 32-bit Q15.17** (`int4_float_to_fxp_bits`) để phục vụ bộ nhân RoPE và Attention trực tiếp mà không cần phần cứng float phức tạp.
   - Các mode O, Gate, Up, Down, Logits giữ nguyên FP32.
3. **Phân phối về PE (Scatter)**:
   - Nửa đầu của `Finalize 01` $\to$ `output0_stream` (gửi về PE0).
   - Nửa sau của `Finalize 01` $\to$ `output1_stream` (gửi về PE1).
   - Nửa đầu của `Finalize 23` $\to$ `output2_stream` (gửi về PE2).
   - Nửa sau của `Finalize 23` $\to$ `output3_stream` (gửi về PE3).
4. **Lưu trữ vào BRAM (`int4_store_local_output`)**:
   - Nhận các packet 128-bit, ghép 4 packet liên tiếp thành 1 word 512-bit (chứa 16 giá trị float hoặc Q15.17).
   - Ghi tuần tự vào vùng nhớ scratchpad `projection` BRAM trong mỗi PE.
   - Phát token hoàn thành 1-bit (`completion_stream.write(1)`).

---

## 7. Bảng Tính Toán Định Lượng (Quantitative Metrics)

### 7.1. Bảng số phép tính FLOPs / MACs và Words dữ liệu

| Mode | Kích thước ma trận | Số phép nhân vô hướng (MACs) | Số Word Weight (512b) / PE | Số Packet Partial (128b) / PE | Số Word Output (512b) / PE |
|---|---|---:|---:|---:|---:|
| **Q** | $4096 \times 4096$ | $16,777,216$ | 32,768 | 1,024 | 64 |
| **K** | $4096 \times 4096$ | $16,777,216$ | 32,768 | 1,024 | 64 |
| **V** | $4096 \times 4096$ | $16,777,216$ | 32,768 | 1,024 | 64 |
| **O** | $4096 \times 4096$ | $16,777,216$ | 32,768 | 1,024 | 64 |
| **GATE** | $11264 \times 4096$ | $46,137,344$ | 90,112 | 2,816 | 176 |
| **UP** | $11264 \times 4096$ | $46,137,344$ | 90,112 | 2,816 | 176 |
| **DOWN** | $4096 \times 11264$ | $46,137,344$ | 90,112 | 1,024 | 64 |
| **1 Layer (7 modes)** | - | **$205,520,896$** | **401,408** | **10,752** | **672** |
| **32 Layers** | - | **$6,576,668,672$** | **12,845,056** | **344,064** | **21,504** |
| **LOGITS** | $32256 \times 4096$ | $132,120,576$ | 258,048 | 8,064 | 504 |
| **TỔNG CỘNG 1 TOKEN** | - | **$6,708,789,248$** | **13,103,104** | **352,128** | **22,008** |

*Nhận xét*: Một token sinh ra cần thực hiện xấp xỉ **6.71 tỷ phép nhân tích lũy (MAC)**, tương đương **13.42 GFLOPs/token** (nếu tính theo chuẩn $1 \text{ MAC} = 2 \text{ FLOPs}$).

---

### 7.2. Tính toán chu kỳ xung nhịp lý thuyết & Thời gian thực thi

Vì mỗi chu kỳ xung nhịp lõi Compute tiêu thụ chính xác **1 word 512-bit** ở pipeline II=1:
$$\text{Chu kỳ tính toán lý thuyết} = \text{Tổng số Word Weight}$$

| Thành phần | Số chu kỳ tính toán lý thuyết | Thời gian ở 300 MHz ($T_{\text{clk}} = 3.333\text{ ns}$) | Thời gian ở 358 MHz ($T_{\text{clk}} = 2.787\text{ ns}$) |
|---|---:|---:|---:|
| **1 Mode Q / K / V / O** | 32,768 | $109.23\ \mu\text{s}$ | $91.32\ \mu\text{s}$ |
| **1 Mode Gate / Up / Down** | 90,112 | $300.37\ \mu\text{s}$ | $251.14\ \mu\text{s}$ |
| **1 Layer Decoder (7 modes)** | 401,408 | $1.338\text{ ms}$ | $1.119\text{ ms}$ |
| **32 Layers Decoder** | 12,845,056 | $42.817\text{ ms}$ | $35.800\text{ ms}$ |
| **Logits Projection** | 258,048 | $0.860\text{ ms}$ | $0.719\text{ ms}$ |
| **TỔNG CỘNG GEMV (1 Token)** | **13,103,104** | **$43.677\text{ ms}$** | **$36.519\text{ ms}$** |

#### Tốc độ sinh Token lý thuyết (Token Generation Throughput):
- **Ở xung nhịp mục tiêu 300 MHz**:
  $$\text{Throughput} = \frac{1}{0.04368\text{ s}} \approx \mathbf{22.89\text{ tokens/second}}$$
- **Ở xung nhịp ước tính HLS 358.84 MHz**:
  $$\text{Throughput} = \frac{1}{0.03652\text{ s}} \approx \mathbf{27.38\text{ tokens/second}}$$

---

### 7.3. Tính toán băng thông bộ nhớ (Bandwidth Analysis)

- **Lưu lượng đọc Weight mỗi PE**:
  - Kích thước mỗi word: $512 \text{ bits} = 64 \text{ bytes}$.
  - Tốc độ tiêu thụ: 1 word / cycle.
  - Băng thông yêu cầu trên 1 kênh DDR:
    $$\text{BW}_{\text{DDR}} = 64 \text{ bytes} \times 300 \text{ MHz} = \mathbf{19.2\text{ GB/s}}$$
- **Băng thông tổng cộng trên 4 kênh DDR**:
  $$\text{BW}_{\text{Total}} = 4 \times 19.2 \text{ GB/s} = \mathbf{76.8\text{ GB/s}}$$
- **Đối chiếu phần cứng Alveo U250**:
  - Bo mạch trang bị 4 kênh DDR4-2400 (4 rank x 72-bit ECC).
  - Băng thông đỉnh lý thuyết của mỗi kênh DDR4-2400:
    $$\text{BW}_{\text{Peak}} = 2400 \times 10^6 \times 8 \text{ bytes} = 19.2 \text{ GB/s}$$
- **Kết luận**: Thiết kế khai thác **100% băng thông đỉnh vật lý** của cả 4 kênh DDR trên Alveo U250 ở tần số 300 MHz. Đây là kiến trúc tối ưu hóa hoàn toàn theo giới hạn bộ nhớ (Memory-Bound Saturation).

---

### 7.4. Bảng tổng hợp tài nguyên phần cứng (Resource Utilization)

Dữ liệu tổng hợp từ báo cáo C-Synthesis gần nhất của kernel top `int4_decoder_token_controller`:

| Tài nguyên Phần cứng | Sử dụng bởi Kernel Top | Khả năng chứa của 1 SLR | Khả năng chứa toàn U250 (4 SLRs) | % Sử dụng toàn chip |
|---|---:|---:|---:|---:|
| **DSP48E2** | 900 | 3,072 | 12,288 | 7.3% |
| **BRAM_18K** | 1,308 | 1,344 | 5,376 | 24.3% |
| **URAM** | 160 | 320 | 1,280 | 12.5% |
| **LUT** | 393,387 | 432,000 | 1,728,000 | 22.8% |
| **FF** | 363,118 | 864,000 | 3,456,000 | 10.5% |

*Nhận xét về tài nguyên*:
- **BRAM**: Dùng 1,308 khối, tương đương sức chứa của gần 1 SLR đầy đủ. Nếu dồn toàn bộ vào 1 SLR sẽ không thể fit, bắt buộc phải phân tán trên 4 SLR.
- **DSP**: Sử dụng 900 DSPs (256 DSP cho lõi integer MAC packing, phần còn lại cho float scale mul, float adder trong RMSNorm và Attention). Mức sử dụng rất khiêm tốn (7.3%), để lại dồi dào tài nguyên cho việc mở rộng tính toán nếu cần.
- **URAM**: 160 khối chia đều cho 4 PE (mỗi PE 40 URAM) để chứa toàn bộ `scale_cache` và `norm_cache` nội trú suốt quá trình suy luận.

---

## 8. Đối Chiếu Mã Nguồn HLS (Source Code Traceability)

Bảng đối chiếu vị trí mã nguồn giúp tra cứu chính xác khi bảo trì hoặc phát triển:

| Chức năng kiến trúc | Hàm / Struct HLS | File nguồn & Dòng |
|---|---|---|
| Đóng gói 2 trọng số INT4 vào 27-bit | `int4_pack_two_w4` | [`int4_linear_controller.cpp:89-97`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L89-L97) |
| Giải mã tích lũy và khử mượn (Borrow fix) | `int4_unpack_packed_acc` | [`int4_linear_controller.cpp:99-108`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L99-L108) |
| Bộ đếm địa chỉ AXI tuần tự 24-bit | `int4_read_local_weights` | [`int4_linear_controller.cpp:257-280`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L257-L280) |
| Bộ đệm trung gian 2 tầng (SRL + BRAM) | `int4_buffer_local_weights` | [`int4_linear_controller.cpp:282-302`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L282-L302) |
| Vòng lặp tính toán MAC II=1 trong PE | `int4_compute_local_partials` | [`int4_linear_controller.cpp:304-420`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L304-L420) |
| Tiến trình Task-Dataflow nội PE | `int4_run_local_pe` | [`int4_linear_controller.cpp:423-468`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L423-L468) |
| Reducer cấp 1 & Phân luồng Cross-SLR | `int4_reduce_pair_and_route` | [`int4_linear_controller.cpp:487-518`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L487-L518) |
| Reducer cấp 2 Finalize & Ép kiểu Q15.17 | `int4_finalize_pair_outputs` | [`int4_linear_controller.cpp:520-557`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L520-L557) |
| Ghép 4 packet 128b thành 1 word 512b | `int4_store_local_output` | [`int4_linear_controller.cpp:560-588`](file:///c:/KLTN/4PE_U250/int4_linear_controller.cpp#L560-L588) |
| Khởi tạo Metadata URAM (`position==0`) | `int4_preload_local_metadata` | [`int4_decoder_controller.cpp:58-77`](file:///c:/KLTN/4PE_U250/int4_decoder_controller.cpp#L58-L77) |
| Lượng tử hóa kích hoạt G32 (INT15) | `int4_quantize_g32` | [`int4_decoder_blocks.cpp:8-42`](file:///c:/KLTN/4PE_U250/int4_decoder_blocks.cpp#L8-L42) |
| Packer nạp trọng số và sắp xếp bit | `int4_pack_linear_matrix` | [`int4_weight_packer.cpp:110-241`](file:///c:/KLTN/4PE_U250/int4_weight_packer.cpp#L110-L241) |
| Cấu hình floorplan interface cho 4 DDR | `timing_300mhz_pre_place.tcl` | Toàn bộ file Tcl |
