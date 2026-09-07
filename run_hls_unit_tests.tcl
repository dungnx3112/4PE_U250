set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

open_project -reset proj_int4_unit_tests
set_top int4_layout_test_top

set cflags "-std=c++11 -DAP_INT_MAX_W=4096 -I."
add_files tests/int4_layout_test_top.cpp -cflags $cflags
add_files -tb int4_weight_packer.cpp -cflags $cflags
add_files -tb tests/test_int4_layout.cpp -cflags $cflags

open_solution -reset solution1 -flow_target vitis
set_part {xcu250-figd2104-2L-e}
create_clock -period 3.333 -name default
csim_design -clean
exit
