# Re-constrain any kernel leaves that escaped their SLR pblock during
# placement or incremental optimisation.  The pre-place hook assigns
# ownership, but opt_design / place_design may flatten hierarchy and
# create new cells (e.g. CARRY8 adders) that inherit no pblock.
#
# This hook re-discovers ownership from the same domain_specs used at
# pre-place time, then force-adds any misplaced leaf back into its
# correct pblock BEFORE phys_opt_design runs its SLR-crossing pass.

puts "INFO: loading [file normalize [info script]]"
set script_directory [file dirname [file normalize [info script]]]
set ownership_script [file join $script_directory timing_300mhz_domains.tcl]
if {![file exists $ownership_script]} {
    error "300MHz pre-physopt: missing ownership library $ownership_script"
}
source $ownership_script

set rescued [timing300::rescue_escaped_cells]
puts "INFO: 300MHz pre-physopt: rescued $rescued escaped cells"
puts "INFO: 300MHz pre-physopt: SLR_OWNERSHIP_REINFORCED"
