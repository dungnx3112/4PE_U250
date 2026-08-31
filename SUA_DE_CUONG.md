# Hướng dẫn Sửa Đề Cương (Copy & Paste)

Do hệ thống không thể lưu trực tiếp vào định dạng nhị phân của Word (`.doc`) mà không làm hỏng font tiếng Việt, tôi đã chuẩn bị sẵn **tất cả các đoạn văn bản cần thay thế** dựa trên góp ý của hội đồng. Bạn chỉ cần mở file Word, nhấn `Ctrl + F` tìm câu cũ và dán câu mới vào nhé.

---

## 1. Sửa Bảng Các Công Trình Liên Quan
**Thay toàn bộ bảng cũ bằng bảng sau:**

| Công trình | Nền tảng / đối tượng | Kỹ thuật chính | Liên hệ với đề tài |
|---|---|---|---|
| FlightLLM [11] | FPGA, LLM | Mapping flow, dữ liệu độ chính xác thấp và tổ chức compute core theo SLR | Tham khảo cách phân bố khối tính toán và khai thác tính cục bộ dữ liệu trên FPGA nhiều SLR. |
| QLlama [12] | U280, Llama 2 | Microscaling quantization, vector–matrix engine và các khối toán tử cơ bản | Tham khảo thiết kế định dạng số học lượng tử hóa và kiến trúc datapath cho suy luận LLM trên FPGA. |
| SwiftKV [13] | LLM attention | Online normalization và xử lý attention theo luồng | Tham khảo cơ chế xử lý attention theo luồng, tránh lưu toàn bộ vector attention score trước khi thực hiện chuẩn hóa. |
| FlightOPU [14] | Multi-die FPGA | Compute–memory locality và thực thi nhận biết SLR | Tham khảo cách bố trí khối tính toán gần bộ nhớ và hạn chế truyền dữ liệu qua biên SLR. |

---

## 2. Sửa Bảng Rủi Ro Kỹ Thuật
**Thay toàn bộ bảng rủi ro cũ bằng bảng sau:**

| Rủi ro | Ảnh hưởng | Hướng xử lý |
|---|---|---|
| Sai số do lượng tử hóa | Sai số có thể tích lũy qua nhiều lớp, làm tăng perplexity hoặc giảm độ chính xác của đầu ra. | Đánh giá sai số theo từng toán tử và từng lớp; lựa chọn hệ số scale, clipping và cấu hình lượng tử phù hợp trước khi tích hợp toàn hệ thống. |
| Băng thông DDR không đáp ứng tốc độ tính toán | Các PE phải chờ dữ liệu, làm giảm mức khai thác song song và tăng độ trễ suy luận. | Tổ chức dữ liệu liên tục trong bộ nhớ, khai thác truyền burst, phân bố dữ liệu trên nhiều bank và sử dụng FIFO để chồng lấp truyền dữ liệu với tính toán. |
| Dung lượng và chi phí truy cập KV cache tăng theo chiều dài ngữ cảnh | Độ trễ attention tăng dần khi số token trong ngữ cảnh lớn. | Giảm kích thước KV cache bằng lượng tử hóa/nén và tổ chức xử lý attention theo luồng nhằm hạn chế dữ liệu trung gian và truy cập bộ nhớ không cần thiết. |
| Mất cân bằng tốc độ giữa các khối pipeline | Khối nhanh phải chờ khối chậm, gây back-pressure và làm giảm throughput toàn hệ thống. | Cân bằng throughput giữa các stage, lựa chọn độ sâu FIFO phù hợp và sử dụng bộ đệm cục bộ tại các điểm giao tiếp. |
| Không đạt yêu cầu timing sau Place & Route | Đường truyền dài, congestion và kết nối qua SLR có thể gây setup timing violation, làm giới hạn tần số hoạt động của thiết kế. | Ưu tiên tính cục bộ của dữ liệu và tính toán, giảm kết nối qua SLR, pipeline các đường truyền dài, giảm fanout và điều chỉnh floorplan dựa trên kết quả timing và congestion sau P&R. |

---

## 3. Sửa chi tiết các câu chữ "đậm mùi AI" và Mơ hồ

Bạn dùng tính năng **Find (Ctrl + F)** để tìm các câu bên dưới và thay thế nhé:

**🔴 Tìm:** Llama 2-7B là cấu hình phù hợp để nghiên cứu trên các nền tảng tăng tốc có tài nguyên giới hạn hơn GPU trung tâm dữ liệu.
**✅ Thay bằng:** Đề tài lựa chọn Llama 2-7B vì đây là cấu hình nhỏ nhất của họ Llama 2 nhưng vẫn có khoảng 7 tỷ tham số, đủ để thể hiện các vấn đề về dung lượng trọng số, băng thông bộ nhớ và KV cache khi triển khai trên FPGA.

**🟡 Tìm:** Đây là hai nút thắt chính cần được xử lý…
**✅ Thay bằng:** Do đó, lưu lượng trọng số của GEMV và lưu lượng KV cache là hai vấn đề chính được xem xét trong đề tài.

**🔴 Tìm:** Một hướng quan trọng để giảm lưu lượng bộ nhớ là lượng tử hóa.
**✅ Thay bằng:** Đề tài sử dụng lượng tử hóa để giảm dung lượng trọng số và lưu lượng dữ liệu đọc từ DDR.

**🔴 Tìm:** ...phải được đồng thiết kế với kiến trúc phần cứng, thay vì chỉ xem lượng tử hóa như một bước tiền xử lý phần mềm.
**✅ Thay bằng:** Do đó, định dạng W4/A15, kích thước nhóm và cách lưu scale được lựa chọn dựa trên datapath DSP48E2 và giao tiếp DDR của U250.

**🔴 Tìm:** Các nghiên cứu này tạo nền tảng cho đề tài...
**✅ Thay bằng:** Từ các công trình trên, đề tài kế thừa ba ý chính: số học độ chính xác thấp, xử lý attention theo luồng và tổ chức dữ liệu theo tính cục bộ của bộ nhớ/SLR.

**🟡 Tìm:** ...kiến trúc vẫn cần được thiết kế lại để phù hợp trực tiếp với cấu trúc bốn SLR, bốn DDR bank và DSP48E2...
**✅ Thay bằng:** Đề tài tập trung hiện thực các kỹ thuật này trên Alveo U250 với bốn SLR, bốn DDR bank và DSP48E2.

**🔴 Tìm:** Việc khóa cấu hình không nhằm tạo một accelerator tổng quát…
**✅ Thay bằng:** Đề tài cố định cấu hình Llama 2-7B và batch size 1 để tập trung vào thiết kế và đánh giá kiến trúc trên U250, thay vì xây dựng accelerator tổng quát cho nhiều mô hình.

**🟡 Tìm:** ...có thể được định lượng ngay từ đầu
**✅ Thay bằng:** *(Xóa bỏ cụm từ này)*

**🔴 Tìm:** ...theo cấu hình tham chiếu
**✅ Thay bằng:** Tối đa 4096 token

**🟡 Tìm:** Hidden state → 32 layers → final RMSNorm → vocabulary projection
**✅ Thay bằng:** Đầu vào FPGA: hidden state; đầu ra FPGA: logits sau vocabulary projection.

**🔴 Tìm:** ...hai tích W4 dùng chung một activation được đóng gói vào một DSP48E2
**✅ Thay bằng:** ...hai trọng số INT4 được đóng gói để thực hiện đồng thời hai phép nhân với cùng một activation INT15 trên một DSP48E2.

**🟡 Tìm:** ...rồi cộng dồn theo nhóm 32 phần tử
**✅ Thay bằng:** ...cộng dồn theo nhóm lượng tử hóa G=32.

**🔴 Xử lý từ khóa KV8 (Thêm định nghĩa ở lần xuất hiện đầu tiên):**
**✅ Thay bằng:** K/V được lượng tử hóa xuống signed INT8 (KV8) trước khi lưu cache.

**🔴 Tìm:** K/V được nén trước khi lưu cache
**✅ Thay bằng:** K/V được lượng tử hóa xuống INT8 trước khi lưu cache

**🔴 Tìm:** attention theo hướng KV8 streaming
**✅ Thay bằng:** Attention đọc trực tiếp K/V INT8 từ DDR và xử lý tuần tự theo token.

**🟡 Tìm:** footprint
**✅ Thay bằng:** dung lượng KV cache

**🔴 Tìm:** Ba hướng tối ưu này được tích hợp trong cùng decoder dataflow thay vì đánh giá như các kernel rời rạc.
**✅ Thay bằng:** *(Xóa bỏ câu này)*

**🔴 Tìm:** Mục tiêu tổng quát... tối ưu đồng thời số học độ chính xác thấp, phép tính GEMV, tổ chức bộ nhớ ngoài và attention/KV cache.
**✅ Thay bằng:** Mục tiêu là hiện thực đầy đủ một decoder accelerator cho Llama 2-7B trên U250 và đánh giá ảnh hưởng của W4A15, tổ chức bốn DDR bank và KV8 attention đến tài nguyên, timing và tốc độ giải mã.

**🟡 Tìm:** golden reference / bit-true reference
**✅ Thay bằng:** mô hình tham chiếu bit-true *(Lưu ý: sửa đồng nhất toàn bộ tài liệu)*

**🔴 Tìm:** Chất lượng mô hình được đánh giá bằng perplexity và mức tương đồng với mô hình phần mềm tham chiếu.
**✅ Thay bằng:** Chất lượng mô hình được đánh giá bằng perplexity, sai số logits và tỷ lệ token prediction trùng với mô hình tham chiếu.

**🟡 Tìm:** dataflow load-compute-write có buffering
**✅ Thay bằng:** pipeline đọc dữ liệu – tính toán – ghi kết quả với các FIFO trung gian.

**🔴 Tìm:** Tần số triển khai hướng tới trên 260 MHz; mức 300 MHz được xem là mục tiêu tối ưu...
**✅ Thay bằng:** Mục tiêu là đạt timing closure trên 260 MHz; 300 MHz được xem là mục tiêu mở rộng nếu P&R cho phép.

**🟡 Tìm:** HLS co-simulation, cycle count, DSP utilization và functional agreement.
**✅ Thay bằng:** HLS co-simulation, số chu kỳ, mức sử dụng DSP và sai số so với mô hình bit-true.

**🔴 Tìm:** single-pass online softmax, không lưu full score vector
**✅ Thay bằng:** online softmax trong một lượt quét KV cache, không cần lưu toàn bộ vector attention score.

**🟡 Tìm:** WikiText-2 hoặc tập dữ liệu tương đương
**✅ Thay bằng:** WikiText-2

**🔴 Tìm:** các phép toán nằm trên critical path của một token decoding
**✅ Thay bằng:** các phép toán chính trong decoding

**🟡 Tìm:** intermediate tensor
**✅ Thay bằng:** tensor trung gian

**🔴 Tìm:** Việc tách kiểm chứng theo từng toán tử giúp phát hiện...
**✅ Thay bằng:** Kết quả của từng toán tử được đối chiếu với mô hình bit-true trước khi tích hợp toàn decoder.

**🟡 Tìm:** ...metadata được bố trí riêng nhưng địa chỉ được tính toán sao cho giảm truy cập rời rạc.
**✅ Thay bằng:** *(Xóa bỏ câu này nếu chưa có layout cụ thể)*

**🔴 Tìm:** Kết quả của phần mềm bit-true được dùng làm golden reference...
**✅ Thay bằng:** *(Xóa bỏ vì đã lặp ý ở trên)*

**🟡 Tìm:** Cách tổ chức này giúp một DSP thực hiện công việc tương đương hai phép nhân...
**✅ Thay bằng:** Nhờ đó, một DSP48E2 thực hiện đồng thời hai tích W4×A15.

**🔴 Tìm:** ...phù hợp với đặc tính memory-bound của GEMV.
**✅ Thay bằng:** Việc giảm số DSP cho mỗi hai tích giúp dành tài nguyên cho nhiều lane xử lý hơn mà không làm tăng lưu lượng trọng số từ DDR.

**🟡 Tìm:** Trong trạng thái ổn định
**✅ Thay bằng:** Khi pipeline đã được lấp đầy

**🟡 Tìm:** stage phía sau dequantize
**✅ Thay bằng:** khối phía sau thực hiện giải lượng tử

**🔴 Tìm:** Mục tiêu của cách tổ chức này là che một phần độ trễ truyền dữ liệu...
**✅ Thay bằng:** Các stage hoạt động chồng lấp để giảm thời gian PE chờ dữ liệu DDR.

**🔴 Tìm:** Alveo U250 có bốn DDR bank và bốn SLR, vì vậy đề tài ánh xạ một PE với một DDR bank...
**✅ Thay bằng:** Kiến trúc sử dụng bốn PE, mỗi PE truy cập một DDR bank độc lập. Khi P&R, PE được ưu tiên đặt gần logic giao tiếp của bank tương ứng để giảm lưu lượng liên SLR.

**🟡 Tìm:** Weight tile được chia theo output tile và phân bố round-robin vào các bank.
**✅ Thay bằng:** Weight tile được phân bố giữa bốn bank theo output tile.

**🔴 Tìm:** ...activation, RoPE coefficient và command được phân phối với lưu lượng nhỏ hơn và được replay cục bộ.
**✅ Thay bằng:** ...activation và hệ số RoPE được lưu trong buffer cục bộ để tái sử dụng; mỗi PE tự tạo địa chỉ từ lệnh điều khiển nhận được.

**🟡 Tìm:** Intermediate tensor và metadata có thể được giữ…
**✅ Thay bằng:** Các tensor trung gian có kích thước phù hợp được lưu trong BRAM/URAM để giảm truy cập DDR.

**🔴 Tìm:** Cách bố trí này hướng tới việc giữ các luồng dữ liệu lớn ở phạm vi cục bộ...
**✅ Thay bằng:** Mục tiêu placement là hạn chế weight/KV traffic đi qua biên SLR; chỉ các tín hiệu điều khiển và dữ liệu kích thước nhỏ được phép crossing khi cần.

**🔴 Tìm:** Một global scheduler...
**✅ Thay bằng:** Bộ điều khiển toàn cục (global scheduler)...

**🔴 Tìm:** command đã đăng ký
**✅ Thay bằng:** command đi qua một tầng thanh ghi/FIFO trước khi truyền sang SLR khác.

**🟡 Tìm:** PE tự sinh địa chỉ dựa trên command cục bộ.
**✅ Thay bằng:** Mỗi PE tự sinh địa chỉ từ thông tin điều khiển đã nhận.

**🔴 Tìm:** ...không biến floorplan thành trọng tâm riêng của kiến trúc.
**✅ Thay bằng:** *(Xóa bỏ)*

**🔴 Tìm:** online softmax duy trì running maximum, normalization term và weighted-value accumulator
**✅ Thay bằng:** online softmax duy trì giá trị cực đại hiện tại, tổng chuẩn hóa và vector tích lũy có trọng số.

**🔴 Tìm:** ...đồng thời forwarded vào attention pipeline
**✅ Thay bằng:** ...đồng thời được chuyển trực tiếp vào pipeline attention, tránh phải đọc lại từ DDR ngay sau khi ghi.

**🔴 Tìm:** Trong kiến trúc tham chiếu của bài báo, một record K/V... (cùng với cụm "5 transfer 512-bit")
**✅ Thay bằng:** *(Xóa bỏ câu này để tránh đi quá sâu vào cấu trúc 5 transfer chưa fix cứng)*

**🔴 Tìm:** ...dung lượng giảm so với K/V FP16.
**✅ Thay bằng:** ...giảm lượng dữ liệu K/V đọc từ DDR so với FP16.

**🟡 Tìm:** QK datapath và value-update datapath được cân bằng tốc độ...
**✅ Thay bằng:** FIFO được đặt giữa QK/softmax và value update để hấp thụ chênh lệch tốc độ giữa hai pipeline.

**🔴 Tìm:** functional verification được thực hiện ở ba mức...
**✅ Thay bằng:** Kiểm chứng chức năng được thực hiện ở ba mức...

**🟡 Tìm:** logit agreement
**✅ Thay bằng:** tỷ lệ token dự đoán trùng nhau

**🔴 Phần "Hiện thực trên FPGA và tối ưu timing"**
**✅ Lời khuyên:** Hãy cắt giảm 20-30% độ dài phần này. Không nên liệt kê chi tiết các thao tác như log Vivado (routing congestion, negative setup slack, high-fanout net, pblock). Tập trung vào nguyên tắc: "Phân bổ floorplan hợp lý để giảm giao tiếp liên SLR và tối ưu timing".

**🔴 Tìm:** Đây là bước triển khai cần thiết nhưng không phải mục tiêu nghiên cứu độc lập.
**✅ Thay bằng:** *(Xóa bỏ)*

**🟡 Tìm:** ...kết quả P&R hiện tại chưa ổn định ở mức tần số mong muốn...
**✅ Thay bằng:** Thiết kế hiện tại chưa đạt timing closure ở tần số trên 260 MHz.

**🔴 Tìm:** routing delay có thể chiếm phần lớn data-path delay...
**✅ Thay bằng:** Các báo cáo timing hiện tại cho thấy một số critical path chịu ảnh hưởng lớn của routing delay.

**🟡 Tìm:** điều chỉnh pblock đủ khoảng trống cho router
**✅ Thay bằng:** điều chỉnh phạm vi pblock để tránh mật độ placement quá cao.

**🔴 Cột "Ảnh hưởng" - Bảng Rủi ro:** PE bị starvation, compute còn nhàn
**✅ Thay bằng:** PE phải chờ dữ liệu, làm giảm mức sử dụng tài nguyên tính toán.

**🔴 Tìm:** produce, consumer lệch nhau
**✅ Thay bằng:** tốc độ sinh và tiêu thụ dữ liệu giữa các stage không cân bằng.

**🔴 Tìm:** Negative setup slack do congestion/cross-SLR routing.
**✅ Thay bằng:** Đường truyền dài và congestion, đặc biệt tại các kết nối liên SLR, có thể gây vi phạm setup timing.

**🟡 Bảng kế hoạch - Tìm:** latency, token, throughput
**✅ Thay bằng:** latency/token, throughput

**🔴 Tìm:** embedded hidden state
**✅ Thay bằng:** hidden state đầu vào decoder

**🔴 Tìm:** Tokenizer, embedding lookup sampling
**✅ Thay bằng:** Tokenizer, embedding lookup và sampling

**🟡 Tìm:** context policy
**✅ Thay bằng:** cùng tokenizer, sequence length và cách chia mẫu

**🔴 Tìm:** Quantized software reference được so sánh với FP16 reference; FPGA được so với software bit-true.
**✅ Thay bằng:** Mô hình phần mềm lượng tử hóa được so sánh với mô hình FP16; kết quả FPGA được đối chiếu với mô hình phần mềm bit-true.

**🟡 Tìm:** các vấn đề congestion đáng chú ý nếu có.
**✅ Thay bằng:** báo cáo resource utilization, timing và congestion sau P&R.

---
*Chúc bạn bảo vệ đề cương thành công rực rỡ!*
