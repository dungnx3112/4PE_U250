# Mandatory four-SLR leaf floorplan for the 300 MHz U250 build.
puts "INFO: loading [file normalize [info script]]"
set script_directory [file dirname [file normalize [info script]]]
set ownership_script [file join $script_directory timing_300mhz_domains.tcl]
if {![file exists $ownership_script]} {
    error "300MHz floorplan: missing ownership library $ownership_script"
}
source $ownership_script
timing300::apply_floorplan

puts "INFO: 300MHz floorplan: LEAF_PRIMITIVE_OWNERSHIP_APPLIED"
puts "INFO: 300MHz floorplan: LOCAL_DOMAINS_APPLIED"
puts "INFO: 300MHz floorplan: REGISTERED_BOUNDARIES_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
