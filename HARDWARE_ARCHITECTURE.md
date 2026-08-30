# Mô hình Kiến trúc Phần cứng - Int4 Decoder trên Alveo U250

Tài liệu này mô tả chi tiết kiến trúc phần cứng của hệ thống giải mã token (decoder) Int4 được triển khai trên FPGA Xilinx Alveo U250. Thiết kế được phân mảnh (sharded) trên 4 Super Logic Regions (SLR), tương ứng với 4 Processing Elements (PE).

## 1. Top Module: `int4_decoder_token_controller`

Đây là module gốc (top-level) giao tiếp trực tiếp với bộ nhớ DDR và điều khiển toàn bộ luồng dữ liệu của mạng nơ-ron (LLM Decoder Block). 

### Giao tiếp (Interfaces)
- **Điều khiển (s_axilite):** `position` (vị trí token hiện tại).
- **Bộ nhớ (m_axi, gmem0 - gmem3):** 
  - `model_bank[0-3]`: Chứa tham số mô hình (weights, scales, norms).
  - `rope_lut_pe[0-3]`: Bảng tra cứu cho RoPE.
  - `kv_cache_pe[0-3]`: Bộ nhớ đệm KV Cache.
  - `residual_pe[0-3]`, `logits_pe[0-3]`: Các luồng dữ liệu vào/ra.

## 2. Các tín hiệu nội bộ (Internal Signals / Memories)

Bên trong `int4_decoder_token_controller`, các khối nhỏ không kết nối với nhau bằng các dây dẫn (wires) đơn giản, mà thông qua các vùng nhớ đệm cục bộ (BRAM/URAM) hoặc luồng FIFO (hls::stream).

- **Vùng nhớ tham số (URAM):**
  - `scale_cache0-3`: Lưu tỷ lệ (scale) của trọng số.
  - `norm_cache0-3`: Lưu tham số gamma cho RMSNorm.
- **Vùng nhớ trung gian (BRAM):**
  - `residual0-3`: Trạng thái dòng chảy chính của mạng (Residual stream).
  - `projection0-3` (Scratchpad): Nơi chứa kết quả thô xuất ra từ mạch nhân ma trận Linear.
  - `q0-3`, `k0-3`, `v0-3`: Lưu trữ Query, Key, Value cho Attention.
  - `gate0-3`: Lưu trữ Gate cho hàm kích hoạt SwiGLU.
  - `activation_q0-3` (Int4) & `activation_scale0-3` (FP32): Các tín hiệu đã được lượng tử hóa (quantized) để làm đầu vào cho mạch Linear.
- **Luồng điều khiển (FIFO Streams):**
  - `token_pe0..3`, `command_pe0..3`: Các chuỗi token điều khiển được truyền nối tiếp qua 4 PE để đồng bộ hóa các khối `DATAFLOW` mà không gây tắc nghẽn (deadlock).

## 3. Sơ đồ phân cấp và Liên kết tín hiệu chi tiết

Sơ đồ dưới đây thể hiện luồng dữ liệu (Dataflow) đi qua các khối xử lý và các tín hiệu/vùng nhớ kết nối chúng:

```mermaid
graph TD
    %% Tùy chỉnh giao diện (Styling)
    classDef memory fill:#E1F5FE,stroke:#0288D1,stroke-width:2px,color:#01579B;
    classDef compute fill:#E8F5E9,stroke:#388E3C,stroke-width:2px,color:#1B5E20,rx:8,ry:8;
    classDef router fill:#FFF3E0,stroke:#F57C00,stroke-width:2px,color:#E65100,stroke-dasharray: 5 5;
    
    %% Định nghĩa các vùng nhớ (Tín hiệu liên kết)
    Res[(residual0-3)]:::memory
    Act[(activation_q0-3<br>activation_scale0-3)]:::memory
    Proj[(projection0-3)]:::memory
    QKV[(q0-3, k0-3, v0-3)]:::memory
    Gate[(gate0-3)]:::memory
    
    %% Các khối tính toán
    Norm[1. int4_rmsnorm_quantize_shards]:::compute
    Linear[2. int4_sharded_linear_4pe<br>Tính Q/K/V/O/Gate/Up/Down]:::compute
    Split{{Lưu Projection / Router}}:::router
    Attn[3. int4_run_local_attention_4pe]:::compute
    SwiGLU[4. int4_swiglu_quantize_shards]:::compute
    Add[5. int4_residual_add_shards]:::compute

    %% Luồng chạy
    Res ==>|Input| Norm
    Norm ==>|Output| Act
    
    Act ==>|Input| Linear
    Linear ==>|Output| Proj
    
    Proj -->|Lưu vào BRAM| Split
    Split -.->|Nếu là Q/K/V| QKV
    Split -.->|Nếu là Gate| Gate
    
    QKV ==>|Input| Attn
    Attn ==>|Output Quantized| Act
    
    Gate -->|Input 1| SwiGLU
    Proj -->|Input 2: Up| SwiGLU
    SwiGLU ==>|Output Quantized| Act
    
    Proj -.->|Nếu là O hoặc Down| Add
    Res ==>|Input/Output| Add
```

## 4. Phân tích chi tiết lõi `int4_sharded_linear_4pe` (Bên trong khối nhỏ)

Khối nhân ma trận (Linear) là khối phức tạp nhất, được chia nhỏ thành 4 luồng chạy song song trên 4 SLR. Các tín hiệu bên trong khối này kết nối qua **hls::stream** (FIFO) để tạo mạng lưới tính toán và cộng gộp (Reduction Network).

```mermaid
flowchart TD
    %% Tùy chỉnh giao diện (Styling)
    classDef pe_node fill:#FCE4EC,stroke:#C2185B,stroke-width:2px,color:#880E4F,rx:8,ry:8;
    classDef reduce_node fill:#E8EAF6,stroke:#3F51B5,stroke-width:2px,color:#1A237E;
    classDef final_node fill:#E0F2F1,stroke:#009688,stroke-width:2px,color:#004D40;
    classDef store_node fill:#FFF8E1,stroke:#FFC107,stroke-width:2px,color:#FF8F00;
    classDef slr_box fill:#FAFAFA,stroke:#9E9E9E,stroke-width:2px,stroke-dasharray: 5 5;

    subgraph SLR0_SLR1 [Cặp PE 0 và 1]
        PE0[int4_run_local_pe 0]:::pe_node
        PE1[int4_run_local_pe 1]:::pe_node
        Red01{int4_reduce_pair_and_route 0}:::reduce_node
        
        PE0 ==>|partial0| Red01
        PE1 ==>|partial1| Red01
    end
    class SLR0_SLR1 slr_box;

    subgraph SLR2_SLR3 [Cặp PE 2 và 3]
        PE2[int4_run_local_pe 2]:::pe_node
        PE3[int4_run_local_pe 3]:::pe_node
        Red23{int4_reduce_pair_and_route 1}:::reduce_node
        
        PE2 ==>|partial2| Red23
        PE3 ==>|partial3| Red23
    end
    class SLR2_SLR3 slr_box;

    Red01 ==>|sum01_local| Fin0[int4_finalize_pair_outputs 0]:::final_node
    Red23 -.->|sum23_to01| Fin0

    Red23 ==>|sum23_local| Fin1[int4_finalize_pair_outputs 1]:::final_node
    Red01 -.->|sum01_to23| Fin1

    Fin0 ==>|output0_stream| Store0[(int4_store_local_output 0)]:::store_node
    Fin0 ==>|output1_stream| Store1[(int4_store_local_output 1)]:::store_node
    
    Fin1 ==>|output2_stream| Store2[(int4_store_local_output 2)]:::store_node
    Fin1 ==>|output3_stream| Store3[(int4_store_local_output 3)]:::store_node
```

### Các tín hiệu nội bộ của `int4_sharded_linear_4pe`:
1. **Dữ liệu đầu vào (Input streams):**
   - Lõi `int4_run_local_pe` đọc trọng số từ DDR và `activation_q` từ BRAM.
2. **Tín hiệu `partial0-3`:**
   - Là luồng stream `int4_reduction_packet_t` (chứa 4 giá trị float32). Đây là kết quả nhân ma trận cục bộ (partial GEMV) của mỗi PE.
3. **Mạng lưới cộng gộp (Reduction Network):**
   - **`sum01_local`, `sum23_local`**: Tổng của PE0+PE1 và PE2+PE3, giữ lại ở SLR hiện tại.
   - **`sum01_to23`, `sum23_to01`**: Tổng của PE0+PE1 được truyền xuyên qua ranh giới SLR sang cho PE2+PE3 (và ngược lại) thông qua các FIFO dài (`fifo impl=bram`). Đây là kết nối chéo vật lý duy nhất giữa các SLR.
4. **Dữ liệu đầu ra (Output streams):**
   - `output0-3_stream`: Kết quả GEMV hoàn chỉnh đã được cộng từ cả 4 PE, đưa vào `int4_store_local_output` để ghi ra BRAM `projection0-3`.
