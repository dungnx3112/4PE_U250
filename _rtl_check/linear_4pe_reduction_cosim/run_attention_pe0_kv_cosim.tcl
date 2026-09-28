set script_dir [file normalize [file dirname [info script]]]
set repo_root [file normalize [file join $script_dir ".." ".."]]
set kernel_dir [file join $repo_root "kernel_HLS"]
set project_dir [file join $repo_root "_rtl_check" "attn0kv"]
set real_vector_dir [file join $repo_root "_dense_scale_csim_data"]
set ::env(ATTN_REAL_VECTOR_DIR) $real_vector_dir

open_project -reset $project_dir
set_top attn0kv
set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -I$kernel_dir"
add_files [file join $script_dir "attention_pe0_kv_rtl_test.cpp"] -cflags $cflags
add_files -tb [file join $script_dir "tb_attention_pe0_kv_rtl.cpp"] -cflags $cflags
open_solution -reset solution_300mhz -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
set_clock_uncertainty 0.270
config_interface -m_axi_latency 64
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8
csim_design
csynth_design
cosim_design -rtl verilog -tool xsim -trace_level port
exit
