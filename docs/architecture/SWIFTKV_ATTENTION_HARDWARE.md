# SwiftKV Attention Engine — Hardware Architecture

> **File**: `swiftkv_attention.cpp` / `swiftkv_attention.hpp`
> **Target**: Xilinx Alveo U250 (xcu250-figd2104-2L-e) @ 270 MHz (3.703 ns)
> **HLS Tool**: Vitis HLS 2023.2
> **Estimated delay (HLS)**: 4.084 ns → Post-route expected ~3.6 ns (~278 MHz)

---

## 1. Tổng Quan

SwiftKV Attention là khối tính toán **Multi-Head Self-Attention** được tối ưu hóa cho suy diễn token-by-token (decode phase) trên FPGA U250. Nó thực hiện:

1. **RoPE** (Rotary Position Embedding) cho Q và K của token hiện tại
2. **Nén KV cache** (INT8 / G32 block-float) và ghi vào DDR
3. **Attention score** (QK^T) trực tiếp trên KV cache nén — không vật chất hóa bảng score đầy đủ
4. **Online softmax** (1 lần đọc KV, không second-pass) theo thuật toán (mu, Z, Y)
5. **Tích lũy V** có trọng số softmax và xuất activation đã lượng tử hóa (A15/G32) cho O-projection

### Cấu hình Transformer
| Tham số | Giá trị |
|---------|---------|
| Tổng số heads | 32 |
| Head dimension | 128 |
| Heads mỗi PE | 8 (SWIFTKV_LOCAL_HEADS) |
| Max sequence length | 4096 |
| KV cache bits | 8 (INT8) |
| KV group size | 32 (G32 block-float) |
| KV words / token / head | 5 (metadata + K0 + K1 + V0 + V1) |

---

## 2. Interface (Ports) của int4_swiftkv_attention_pe0

```cpp
void int4_swiftkv_attention_pe0(
    const int4_output_word_t q[INT4_VECTOR_WORDS_PER_PE],   // Q từ BRAM (PE-local)
    const int4_output_word_t k[INT4_VECTOR_WORDS_PER_PE],   // K từ BRAM (PE-local)
    const int4_output_word_t v[INT4_VECTOR_WORDS_PER_PE],   // V từ BRAM (PE-local)
    int4_output_word_t*      kv_cache,                       // m_axi: DDR bank riêng PE
    const int4_output_word_t* rope_lut_ddr,                  // m_axi: LUT RoPE trong DDR
    int4_quant_word_t activation_q[INT4_MAX_LOCAL_GROUPS],   // Output → BRAM MatMul input
    float            activation_scale[INT4_MAX_LOCAL_GROUPS],// Output scale → BRAM
    ap_uint<6>       layer_index,                            // Scalar: layer (0-63)
    ap_uint<12>      position                                // Scalar: token position (0-4095)
);
```

### Chi tiết interface
| Port | Hướng | Loại | Mô tả |
|------|-------|------|-------|
| q, k, v | IN | BRAM 512-bit/word | Q/K/V projection output từ RMSNorm+MatMul |
| kv_cache | IN/OUT | m_axi DDR 512-bit | KV cache nén trong DDR của PE (64 layers × 8 heads × 4096 tokens × 5 words) |
| rope_lut_ddr | IN | m_axi DDR 512-bit | LUT cosine/sine pre-computed (8 word / position) |
| activation_q | OUT | BRAM 480-bit/word | Output lượng tử hóa (A15/G32) → đầu vào MatMul tiếp theo |
| activation_scale | OUT | BRAM float | FP32 scale cho từng nhóm G32 |
| layer_index | IN | Scalar 6-bit | Transformer layer index |
| position | IN | Scalar 12-bit | Token position trong chuỗi |

---

## 3. Datapath Nội Bộ — 4 Stage

### Stage 1: swiftkv_seed_local_pe<PE>
- Đọc 8 word × 512-bit từ rope_lut_ddr cho vị trí position
- Giải nén 64 cặp (cosine, sine) 19-bit từ dạng nén Q1.17 LUT
- Phát ra cosine_stream (128 samples), sine_stream (128 samples), command_stream
- 1 AXI burst = 8 word × 64B = 512 bytes từ DDR

### Stage 2: swiftkv_run_pe<PE> — Core Attention
Core attention thực hiện:
1. swiftkv_quantize_kv_record(): Đọc K,V từ BRAM; tính G32 max; quantize INT8; pack 5 words
2. Ghi 5-word record vào kv_cache DDR (current token)
3. swiftkv_rotate_rope_word(): RoPE cho Q và K (8 phases × 2 DSP mults per pair)
4. swiftkv_attention_head() × 8 heads:
   - swiftkv_process_compressed_kv(): QK dot với INT8 K (16 DSP mults + adder tree)
   - swiftkv_scale_score(): Chia sqrt(128)
   - online_softmax_update(): (mu,Z,Y) recurrence, exp2 LUT
   - swiftkv_update_values_and_quantize(): 4×4 lane V accumulation + A15/G32 quantize

### Stage 3: swiftkv_collect_pe_output<PE>
- Đọc quantized_stream và scale_stream → ghi vào activation_q[] và activation_scale[] BRAM

### Stage 4: swiftkv_consume_local_done<PE>
- Drain done_stream (1 token completion)

---

## 4. KV Cache Format (DDR)

### Mỗi head mỗi token: 5 word × 512-bit
```
Word 0 (metadata):
  bits[4:0]   = K_shift[0]  (G32 group 0, 5-bit power-of-2 exponent)
  bits[9:5]   = K_shift[1]
  bits[14:10] = K_shift[2]
  bits[19:15] = K_shift[3]
  bits[24:20] = V_shift[0]
  bits[29:25] = V_shift[1]
  bits[34:30] = V_shift[2]
  bits[39:35] = V_shift[3]

Word 1 = K_group0 [32×INT8=256b lower] + K_group1 [256b upper]
Word 2 = K_group2 + K_group3
Word 3 = V_group0 + V_group1
Word 4 = V_group2 + V_group3
```

### DDR layout: kv_cache[layer][local_head][token][5 words]
- 64 × 8 × 4096 × 5 × 64 bytes ≈ 10 GB per PE

---

## 5. RoPE Mechanism

### LUT Format
- 4096 positions × 4 LUT words/pos × 2 DDR words/LUT = 32,768 DDR words
- 1 LUT word = 16 pairs (cos, sin) × 19-bit each

### Rotation Formula (per pair j,j+1)
```
Q'[j]   = Q[j] × cos[j/2] - Q[j+1] × sin[j/2]
Q'[j+1] = Q[j] × sin[j/2] + Q[j+1] × cos[j/2]
```
- Q15.17 × Q1.17 → Q17.34 → shift right 17 → clamp int32
- Implementation: swiftkv_q17_mul_add_rope_raw() — 2 DSP mults latency=3
- 1 word 512-bit = 8 pairs → 8 phases pipeline II=1

---

## 6. QK Dot Product (swiftkv_dot16_int8)

Dot product mà không dequantize K:
```
dot = sum(Q[i] * K_q[i] for i in 0..15)
scaled_dot = dot shifted by (shift-10)
```
- 16 DSP mults (Q15.17 × INT8) latency=3
- Binary adder tree: 16→8→4→2→1 levels

---

## 7. Online Softmax (mu, Z, Y)

```
Init: mu = -inf, Z = 0, Y[i] = 0
Per token t:
  s_t = QK^T_t / sqrt(128)
  mu_new = max(mu, s_t)
  Z_new = Z * exp2(mu - mu_new) + exp2(s_t - mu_new)
  Y_new[i] = Y[i] * exp2(mu - mu_new) + V[i,t] * exp2(s_t - mu_new)
Output: attention[i] = Y[i] / Z
```
- exp2: 5-bit LUT + linear interpolation
- V accumulation: 4 engines × 4 lanes = 16 parallel mults

---

## 8. Output Quantization (A15/G32)

```
Per 32-element group:
  scale = max(|Y[i]|) / 16383.0f
  activation_q[i] = round(Y[i] / scale)  [15-bit signed]
```
- attention_normalize_lane_loop: FP32 mul DSP latency=4
- attention_quantize_reverse_loop: FP32 mul DSP latency=2 (đã tách riêng recurrence)
- pack_quantized_lanes_loop: UNROLL (không recurrence)

---

## 9. Resources Per PE (HLS Csynth)

| Resource | Per PE | SLR Available | % SLR |
|----------|--------|---------------|-------|
| BRAM18K | 190 | 1,344 | 14.1% |
| DSP | 92 | 3,072 | 3.0% |
| FF | 47,519 | 864,000 | 5.5% |
| LUT | 45,578 | 432,000 | 10.6% |
| URAM | 16 | 320 | 5.0% |

HLS estimate: 4.084 ns | Post-route expected: ~3.6 ns (~278 MHz)

---

## 10. Stream Topology Nội Bộ

| Stream | Depth | Impl | Lý do |
|--------|-------|------|-------|
| cosine_stream | 64 | SRL | Nhỏ, latency thấp |
| sine_stream | 64 | SRL | Nhỏ, latency thấp |
| quantized_stream | 64 | **BRAM** | Cách ly timing path 2 (quantize output) |
| scale_stream | 64 | SRL | Float, nhỏ |
| command_stream | 2 | SRL | Control token |
| done_stream | 2 | SRL | Completion token |

---

## 11. SLR Assignment và Cross-SLR Issues

| PE | SLR | DDR bank |
|----|-----|----------|
| PE0 | SLR0 | bank 0 |
| PE1 | SLR1 | bank 1 |
| PE2 | SLR2 | bank 2 |
| PE3 | SLR3 | bank 3 |

**Không có cross-SLR data path** — tất cả Q/K/V, DDR, và output đều nằm trong cùng SLR.

### Known Issue: Promoted Cells (từ PnR thất bại 09/09)
Vivado synthesis promote `grp_swiftkv_quantize_kv_record_fu_617` cells ra khỏi PE hierarchy:
- 8 fabric adders `add_32ns_32ns_32_2_1_U27x` bị đặt vào SLR2 cho dù PE ở SLR0
- WNS = -4.878 ns do SLR0→SLR2→SLR0 detour
- **Fix**: `timing_300mhz_pre_place.tcl` procedure `place_attention_pe_cells` với selector `*swiftkv*` pattern

---

## 12. Critical Timing Paths

### Path 1: swiftkv_quantize_kv_record
- 8 parallel fabric adders trong `quantize_kv_group_block_loop` (PIPELINE II=1)
- Dễ bị promoted → SLR mismatch → WNS violation
- Fix: BIND_OP fabric latency=1 + floorplan constraint

### Path 2: swiftkv_update_values_and_quantize
- `attention_normalize_lane_loop`: DSP FP32 mul latency=4 + BRAM read (attention_group ram_2p latency=2)
- `attention_quantize_reverse_loop`: DSP FP32 mul latency=2 (tách riêng từ recurrence cũ)
- Fix: BIND_STORAGE attention_group ram_2p latency=2 + tách loop pack

---

## 13. Verification Plan

### Standalone PnR Scripts
```bash
# Step 1: HLS csynth
vivado_hls -f run_hls_attention_standalone.tcl

# Step 2: OOC PnR  
vivado -mode batch -source run_pnr_attention_standalone.tcl
```

### Pass Criteria
| Metric | Required |
|--------|----------|
| WNS | >= 0 ns |
| WHS | >= 0 ns |
| Routing errors | = 0 |
| Unrouted nets | = 0 |

### Output Files
- pnr_attention_standalone_run/int4_swiftkv_attention_pe0_routed.dcp
- pnr_attention_standalone_run/timing_summary_270mhz.rpt
- pnr_attention_standalone_run/utilization.rpt
