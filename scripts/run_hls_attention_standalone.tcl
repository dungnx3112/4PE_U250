set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

# Standalone HLS C-synthesis for int4_swiftkv_attention_pe0
# HLS target: 3.0 ns = 333 MHz (tight target so HLS estimated Fmax > 300 MHz)
# PnR target: 3.703 ns = 270 MHz (actual implementation constraint)
# Rationale: HLS estimated Fmax ~244 MHz at 3.703 ns target, which is insufficient.
#   Tightening HLS to 3.0 ns forces HLS to pipeline/register more aggressively,
#   pushing estimated Fmax above 300 MHz so post-route timing can comfortably close at 270 MHz.

open_project -reset proj_int4_attention_standalone
set_top int4_swiftkv_attention_pe0

# Same include flags as full decoder (attention.cpp includes decoder_blocks.hpp)
set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -I."
add_files swiftkv_attention.cpp -cflags $cflags

open_solution -reset solution_270mhz -flow_target vitis
set_part {xcu250-figd2104-2L-e}

# HLS target: 3.0 ns (333 MHz) — forces aggressive pipelining/retiming
# clock_uncertainty=0.300 ns → effective budget = 2.700 ns for combinational paths
create_clock -period 3.0 -name default
set_clock_uncertainty 0.300

# Match full decoder AXI configuration
config_interface -m_axi_latency 32
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8

puts "INFO: Running C-synthesis for int4_swiftkv_attention_pe0 at 3.0ns (333 MHz HLS target)..."
csynth_design

puts "INFO: Exporting RTL for standalone PnR..."
export_design -format ip_catalog

puts "INFO: HLS standalone attention synthesis complete."
puts "INFO: RTL at: proj_int4_attention_standalone/solution_270mhz/impl/verilog/"

exit
