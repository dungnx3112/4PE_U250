# Fail immediately if placement escaped the PE/SLR ownership map.
puts "INFO: loading [file normalize [info script]]"
set script_directory [file dirname [file normalize [info script]]]
set ownership_script [file join $script_directory timing_300mhz_domains.tcl]
if {![file exists $ownership_script]} {
    error "300MHz post-place: missing ownership library $ownership_script"
}
source $ownership_script

set report_path [file normalize "timing_300mhz_post_place_ownership.csv"]
lassign [timing300::verify_placement $report_path] owned_leaves wrong_leaves
puts "INFO: 300MHz post-place: owned_leaves=$owned_leaves wrong_or_unplaced=$wrong_leaves"
if {$wrong_leaves != 0} {
    error "300MHz post-place ownership failed: $wrong_leaves local primitives are outside their assigned SLR; see $report_path"
}

# Placement timing is diagnostic; routed timing remains the acceptance gate.
report_timing_summary -delay_type max -max_paths 50 -input_pins \
    -file [file normalize "timing_300mhz_post_place_summary.rpt"]
puts "INFO: 300MHz post-place: LEAF_OWNERSHIP_VERIFIED"
