# Batch entry point used by run_o_projection_capture.sh.
set script_dir [file dirname [file normalize [info script]]]
if {[info exists ::env(O_ILA_CAPTURE_POINT)] && $::env(O_ILA_CAPTURE_POINT) eq "deep"} {
    source [file join $script_dir capture_o_projection_deep_ila.tcl]
    exit
}
source [file join $script_dir connect_o_projection_ila_hw.tcl]
source [file join $script_dir capture_o_projection_ila.tcl]
