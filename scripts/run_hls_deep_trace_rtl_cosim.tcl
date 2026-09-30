set script_directory [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_directory ".."]]
set kernel_dir [file join $repo_root "kernel_HLS"]

cd $repo_root
open_project -reset proj_deep_trace_rtl_cosim
set_top int4_linear_local_stage_pe0

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_ENABLE_LAYER_TRACE=1 -DINT4_RTL_COSIM_STIMULUS=1 -I$kernel_dir"
add_files [file join $kernel_dir "int4_linear_controller.cpp"] -cflags $cflags
add_files -tb [file join $repo_root "testbench" "test_deep_o_trace.cpp"] -cflags $cflags

open_solution -reset solution1 -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
set_clock_uncertainty 0.270

# The generic runtime-mode top must expose capacity for the largest matrix
# (logits) and the complete forensic trace during C/RTL co-simulation.
set_directive_interface -mode m_axi -bundle gmem_weight -depth 266112 \
    int4_linear_local_stage_pe0 weight_mem
set_directive_interface -mode m_axi -bundle gmem_trace -depth 7279 \
    int4_linear_local_stage_pe0 q_deep_trace
set_directive_interface -mode ap_memory \
    int4_linear_local_stage_pe0 activation_q
set_directive_interface -mode ap_memory \
    int4_linear_local_stage_pe0 activation_scale
set_directive_interface -mode ap_memory \
    int4_linear_local_stage_pe0 output_mem

csim_design -clean
csynth_design
cosim_design -rtl verilog -tool xsim -trace_level all
exit
