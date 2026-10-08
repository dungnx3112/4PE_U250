set root [file normalize [file join [file dirname [info script]] ..]]
set implementation 3
if {[info exists ::env(O_ACCUM_IMPL)]} { set implementation $::env(O_ACCUM_IMPL) }
if {$implementation ni {0 1 2 3 4}} { error "O_ACCUM_IMPL must be 0, 1, 2, 3 or 4" }
set project [file join $root _evidence_analysis linear_hardened_test v${implementation}]
open_project -reset $project
set_top linear_hardened_rtl_test
set flags "-std=c++11 -DAP_INT_MAX_W=4096 -DINT4_ACCUM_DEBUG_VARIANT=$implementation -I[file join $root kernel_HLS]"
add_files [file join $root testbench linear_hardened_rtl_test.cpp] -cflags $flags
add_files -tb [file join $root testbench tb_linear_hardened_rtl.cpp] -cflags $flags
open_solution -reset solution -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.0 -name default
set_clock_uncertainty 0.270
config_dataflow -start_fifo_depth 8
config_rtl -register_reset_num 3
csim_design
csynth_design
cosim_design -rtl verilog -tool xsim -trace_level port
close_project
exit
