set script_directory [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_directory ".."]]
set kernel_dir [file join $repo_root "kernel_HLS"]

cd $repo_root
open_project -reset proj_deep_o_trace_unit
set_top int4_linear_local_stage_pe0

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_ENABLE_LAYER_TRACE=1 -I$kernel_dir"
add_files [file join $kernel_dir "int4_linear_controller.cpp"] -cflags $cflags
add_files -tb [file join $repo_root "testbench" "test_deep_o_trace.cpp"] -cflags $cflags

open_solution -reset solution1 -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
csim_design -clean
exit
