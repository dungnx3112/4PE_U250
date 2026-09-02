# Read-only selector audit for a post-synthesis, placed, or routed checkpoint.
# It resolves every ownership group and fails on the first cross-SLR claim,
# without changing pblocks, placement, routing, or checkpoint contents.

if {$argc != 1} {
    error "Usage: audit_300mhz_ownership_selectors.tcl <checkpoint.dcp>"
}

set checkpoint_path [file normalize [lindex $argv 0]]
if {![file exists $checkpoint_path]} {
    error "Ownership audit checkpoint does not exist: $checkpoint_path"
}

set script_directory [file dirname [file normalize [info script]]]
source [file join $script_directory timing_300mhz_domains.tcl]

puts "INFO: 300MHz selector audit: opening $checkpoint_path"
open_checkpoint $checkpoint_path
timing300::initialize

set group_count 0
foreach spec [timing300::domain_specs] {
    lassign $spec slr description mandatory patterns
    lassign [timing300::discover_group $slr $description $patterns $mandatory] \
        hierarchy leaves
    incr group_count
    puts "AUDIT_GROUP,$slr,$description,[llength $hierarchy],[llength $leaves]"
}

puts "INFO: 300MHz selector audit: OWNERSHIP_SELECTORS_CLEAN ($group_count groups)"
close_design
