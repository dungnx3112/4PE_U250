# Batch entry point used by run_o_projection_capture.sh.
set script_dir [file dirname [file normalize [info script]]]
source [file join $script_dir connect_o_projection_ila_hw.tcl]
source [file join $script_dir capture_o_projection_ila.tcl]
