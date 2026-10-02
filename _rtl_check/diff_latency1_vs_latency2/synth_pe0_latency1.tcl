set kernel_dir {C:/KLTN/4PE_U250/kernel_HLS}
set project_dir {C:/KLTN/4PE_U250/_rtl_check/proj_pe0_latency1}

open_project -reset $project_dir
set_top int4_decoder_pe0_kernel

set cflags {-std=c++11 -DAP_INT_MAX_W=4096 -IC:/KLTN/4PE_U250/kernel_HLS}
foreach source [list \
    $kernel_dir/swiftkv_attention.cpp \
    $kernel_dir/int4_linear_controller.cpp \
    $kernel_dir/int4_decoder_blocks.cpp \
    $kernel_dir/int4_decoder_controller.cpp \
    $kernel_dir/int4_decoder_multikernel.cpp] {
    add_files $source -cflags $cflags
}

open_solution -reset solution_300mhz -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
set_clock_uncertainty 0.270

config_interface -m_axi_latency 64
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_interface -m_axi_register_io all
config_interface -m_axi_buffer_impl auto
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8

csynth_design
exit
