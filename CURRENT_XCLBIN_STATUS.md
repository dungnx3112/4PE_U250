# Trạng thái hiện tại — kiến trúc 4 PE độc lập

Ngày kiểm chứng: 2026-08-30

Source cũ không còn là thiết kế đang build. Kernel hiện tại đã được viết lại theo
miền sở hữu độc lập `PE n / SLR n / DDR n`; chỉ packet partial-output 128-bit và
command/reduction scalar có thanh ghi được đi qua biên SLR.

## Kết quả đã hoàn tất

- Vitis HLS 2023.2 C-synthesis: exit code 0.
- Tất cả loop constraint được thỏa.
- Estimated Fmax: 300.03 MHz với target 3.333 ns.
- Không còn cảnh báo `HLS 200-656` hoặc `Deadlocks can occur`.
- Test layout/packer 4 PE độc lập: PASS.
- XO chứa đúng source hiện tại; SHA-256 của `int4_linear_controller.cpp` trong
  XO khớp source trên đĩa.
- Floorplan hiện chỉ phụ thuộc các hierarchy PE-local lớn còn tồn tại sau
  `opt_design`, không phụ thuộc tên của helper command nhỏ.
- XO cuối: `int4_decoder_token_controller_300mhz.xo`.
- Kích thước XO: 8,819,002 byte.
- SHA-256: `1A834CE9A5311DC2885374BC36D3D31EFE85AC6B9D5B6CB63835E0932BC91311`.

Ước lượng toàn U250: 1308 BRAM18K, 916 DSP, 356947 FF, 387973 LUT và 160 URAM.

## Điều chưa được khẳng định

Full link gần nhất đã hoàn tất synthesis và `opt_design`, nhưng pre-place cũ dừng
vì Vivado đã flatten helper `int4_seed_linear_command_chain_U0`. Floorplan đã được
đơn giản hóa để bỏ phụ thuộc này. Vẫn cần chạy lại full link; chỉ xác nhận 300 MHz
thực tế khi WNS/WHS không âm và không còn net unrouted, routing error hoặc DRC Error.

Lệnh full link khi có platform:

```powershell
.\build_300mhz.ps1 -Platform '<đường-dẫn-U250.xpfm>'
```

Chi tiết kiến trúc, layout DDR và cách build nằm trong `README.md`.
