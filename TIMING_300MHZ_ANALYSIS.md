# Phân tích timing 300 MHz cho U250

Ngày cập nhật source/HLS: 2026-08-26

Checkpoint được phân tích: `../level0_wrapper_routed.dcp`

## Kết quả của checkpoint cũ

- Clock vi phạm: `clk_out1_ulp_clk_wiz_0`, chu kỳ 3.333 ns (300 MHz).
- WNS: -1.746 ns.
- TNS: -50,463.941 ns.
- Setup: 92,007 endpoint vi phạm trên 1,514,177 endpoint toàn thiết kế.
- Hold sạch: WHS 0.005 ns, THS 0 ns.
- Pulse width sạch.

Đường xấu nhất nằm hoàn toàn trong
`quantized_half01_stream_U/full_n_reg`: data path 5.028 ns, trong đó logic chỉ
0.612 ns (12.172%) và routing chiếm 4.416 ns (87.828%). Vì vậy đây không phải
lỗi thiếu pipeline số học; nguyên nhân chính là placement/routing và fanout của
FIFO LUTRAM rộng.

Trong 500 setup path xấu nhất:

- routing trung bình chiếm khoảng 93.2% data-path delay;
- 177 path kết thúc trong các FIFO `quantized_half01/23`;
- 114 path kết thúc ở AXI `gmem0`;
- 87 path kết thúc ở AXI-Lite control;
- 61 path kết thúc trong central dispatcher;
- 318/500 path có thêm từ hai đến bốn lần vượt biên SLR trên data path.

Phân bố hard block cho thấy floorplan bắt buộc đã không được áp dụng khi tạo
checkpoint: SLR0 và SLR1 không chứa URAM nào, trong khi SLR2 chứa 228 URAM và
SLR3 chứa 192 URAM. BRAM tile cũng bị dồn vào SLR2/SLR3 lần lượt 69.72% và
51.56%. Kết quả là dữ liệu và control phải đi qua nhiều SLL; riêng kết nối
SLR2<->SLR1 dùng 7,379 SLL và SLR3<->SLR2 dùng 5,361 SLL.

## Thay đổi đã thực hiện

1. Toàn bộ FIFO 480-bit đang hoạt động trong kernel được chuyển sang BRAM.
   Ngoài tám FIFO ingress/pair-exchange/assembly trong
   `int4_decoder_controller.cpp`, việc sửa bao phủ các FIFO PE-local và
   pair-local của RMSNorm, SwiGLU, SwiftKV attention và linear projection.
   Việc này bỏ cone `full_n`/write-enable rộng của distributed RAM khỏi cả
   đường critical cũ lẫn các FIFO crossing có thể trở thành critical path kế
   tiếp.
2. RoPE preload được đổi từ một writer ở SLR0 điều khiển trực tiếp bốn bank
   URAM 608-bit thành dataflow cascade SLR0->SLR1->SLR2->SLR3. Mỗi word được
   serialize thành 16 beat 38-bit; ba FIFO BRAM chỉ mang một cặp cosine/sine
   qua từng biên SLR. Stage đích ghép lại word 608-bit rồi ghi URAM cục bộ, vì
   vậy payload rộng không còn vượt biên SLR.
3. `timing_300mhz_pre_place.tcl` neo hai command FIFO vào SLR1, bổ sung anchor
   pair01 còn thiếu, và biến command FIFO cùng AXI-Lite control thành kiểm tra
   bắt buộc. Nếu hierarchy đổi tên hoặc hook không áp dụng, link phải fail thay
   vì âm thầm sinh một implementation không có floorplan. Các RoPE preload
   stage và FIFO mới cũng là anchor bắt buộc trên SLR tương ứng.
4. `build_300mhz.ps1` dùng thư mục run duy nhất cho mỗi lần link và chỉ kiểm tra
   marker trong log của chính run đó. Điều này loại bỏ trường hợp marker
   `FLOORPLAN_APPLIED` cũ làm một link mới bị xác nhận nhầm.
5. `quantized_half01_stream` và `quantized_half23_stream` đã được trace từ
   producer `int4_preprocess_activation_pair_halves` tới consumer
   `int4_exchange_activation_half_pair01/23`. Hai FIFO ingress 480-bit không còn
   dùng depth 8 mà dùng BRAM depth 2; steady-state II không đổi, đồng thời loại
   các bit con trỏ `[2]`/`[3]` đã xuất hiện trên critical path. Nhánh forwarding
   attention được tách thành hai process pair-local độc lập để logic ghi 480-bit
   không bị placer kéo vào vùng giữa SLR1 và SLR2.
6. Hai FIFO key `w512_d32` trong mỗi `swiftkv_attention_head` được thay bằng
   boundary FIFO 512-bit depth 2 và tám FIFO BRAM 128-bit depth 32. Dữ liệu và thứ
   tự chunk không đổi; payload rộng chỉ còn tồn tại cục bộ tại router/splitter,
   còn storage và consumer được đặt cùng SwiftKV PE tương ứng.
7. `route_all_compressed_kv_loop` giữ `PIPELINE II=1` nhưng bỏ `style=frp`, loại
   cone init/start FRP có fanout 4702 trong RTL cũ. Số read outstanding của bốn
   AXI master giảm từ 8 xuống 2; với burst tối đa 256 beat và latency khai báo 64
   cycle, vẫn đủ cửa sổ để giữ bandwidth nhưng giảm state/control của AXI burst.

## Kiểm chứng sau sửa

- HLS hoàn tất với exit code 0 và tạo lại
  `int4_decoder_token_controller_300mhz.xo`.
- Không có `ERROR` hoặc `CRITICAL WARNING` trong synthesis log.
- HLS xác nhận cả 30 FIFO 480-bit đang hoạt động được implement bằng Block RAM;
  không còn FIFO 480-bit nào dùng distributed RAM. Ba crossing RoPE
  `rope_stream01/12/23` là FIFO BRAM sâu 128, rộng đúng 38-bit; RTL mới không
  còn tham chiếu đến FIFO `w608`.
- RTL mới xác nhận `quantized_half01/23_stream` là `fifo_w480_d2_B`; hai
  `key0/1_stream` 512-bit depth 32 cũ không còn. Thay vào đó mỗi SwiftKV PE có
  hai boundary FIFO `fifo_w512_d2_S` và tám FIFO `fifo_w128_d32_B` cục bộ.
- Scheduler xác nhận `route_all_compressed_kv_loop`, hai key splitter và hai
  attention forwarding loop đều đạt II=1. Router KV không còn thông báo FRP
  `Estimated max control fanout = 4702`.
- Timing estimate HLS: 2.433 ns (411.00 MHz) so với target 3.33 ns (300 MHz).
- Resource mới: 1,682 BRAM_18K, 862 DSP, 410,112 FF, 339,071 LUT, 264 URAM,
  tương ứng khoảng 31%, 7%, 12%, 19% và 20% tài nguyên toàn chip. Con số BRAM lớn hơn
  khả năng của một SLR nhưng chỉ dùng 29% toàn chip; floorplan bắt buộc phải
  phân bố các FIFO cùng PE tương ứng trên cả bốn SLR.
- Ba FIFO RoPE giảm từ 87 xuống 6 BRAM_18K. RoPE preload tại `position == 0`
  có latency 376,946 cycle, tương đương 1.256 ms ở 300 MHz; đây là đánh đổi có
  chủ ý để giảm data crossing 16 lần. Datapath token sau preload vẫn đọc word
  608-bit từ URAM cục bộ và không bị serialize.
- Các hierarchy mà floorplan mới dùng vẫn tồn tại trong RTL được tái sinh.
- PowerShell build wrapper parse thành công và file Tcl là một Tcl script hoàn
  chỉnh về cú pháp/braces.
- Hai crossing activation 480-bit giữa cặp PE01 và PE23, cùng các crossing giữa
  pair01/23 với PE biên ở SLR0/SLR3, được serialize thành 16 beat 30-bit. Không
  còn bus activation 480-bit chạy xuyên biên SLR; phép pack/unpack RTL chỉ còn
  shift hằng số.
- Output linear được chuyển qua FIFO BRAM 32-bit rồi mới pack 512-bit cục bộ;
  `current_record_stream` 512-bit cũng đã chuyển từ LUTRAM sang BRAM.
- Các loop RoPE, compressed-dot, preload prefix, residual load/store và fused
  output đã tách/pipeline để cắt control fanout. AXI write outstanding giảm còn
  1 và synthesis fanout limit là 128 để nhân bản các net control còn lớn.

HLS vẫn báo một throughput warning độc lập ở `coefficient_token_loop`
(`swiftkv_attention.cpp:1133-1137`, final II=6). Warning này không phải nguyên
nhân của 92,007 setup violation trong routed checkpoint và không được thay đổi
trong bản sửa timing này.

## Việc còn lại để đo WNS mới

Máy hiện tại không có file platform U250 `.xpfm`, nên chưa thể chạy `v++ --link`
và route lại toàn platform. Khi platform được cài/cung cấp, chạy:

```powershell
.\build_300mhz.ps1 -Platform <duong-dan-toi-platform-u250.xpfm>
```

Build wrapper sẽ tự kiểm tra cả marker `FLOORPLAN_APPLIED` và
`PAIR_LOCAL_APPLIED`. Chỉ báo cáo timing của routed DCP mới mới có thể xác nhận
WNS cuối cùng; HLS estimate không thay thế được post-route STA.
