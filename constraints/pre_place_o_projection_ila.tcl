# Preserve the normal implementation constraints, then insert the dedicated
# PE-local O-projection ILA before placement.
set script_dir [file dirname [file normalize [info script]]]
source [file join $script_dir pre_place.tcl]
source [file join $script_dir ila_o_projection.tcl]
