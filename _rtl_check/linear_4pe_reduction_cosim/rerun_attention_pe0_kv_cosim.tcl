set script_dir [file normalize [file dirname [info script]]]
set repo_root [file normalize [file join $script_dir ".." ".."]]
set project_dir [file join $repo_root "_rtl_check" "attn0kv"]
set real_vector_dir [file join $repo_root "_dense_scale_csim_data"]
set ::env(ATTN_REAL_VECTOR_DIR) $real_vector_dir

open_project $project_dir
open_solution solution_300mhz
cosim_design -rtl verilog -tool xsim -trace_level port
exit
