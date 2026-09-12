set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

open_project -reset proj_int4_linear_4pe
set_top int4_linear_kernel_4pe

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_ENABLE_LEGACY_GLOBAL_API -I."
add_files int4_linear_controller.cpp -cflags $cflags

open_solution -reset solution_270mhz -flow_target vitis
set_part {xcu250-figd2104-2L-e}

# Target: 3.703 ns = 270 MHz (>250 MHz requested)
create_clock -period 3.703 -name default
set_clock_uncertainty 0.300

config_interface -m_axi_latency 32
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8

csynth_design

# Export as .xo for Vitis/Vivado implementation
export_design -format xo -output int4_linear_kernel_4pe_270mhz.xo

exit