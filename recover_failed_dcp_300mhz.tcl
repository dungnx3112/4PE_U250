# Re-place and re-route an existing U250 implementation checkpoint with the
# congestion-aware 300 MHz constraints checked into this directory.
#
# Usage:
#   vivado -mode batch -source recover_failed_dcp_300mhz.tcl \
#       -tclargs <failed.dcp> <output-directory>

if {$argc != 2} {
    error "Usage: recover_failed_dcp_300mhz.tcl <failed.dcp> <output-directory>"
}

set input_dcp [file normalize [lindex $argv 0]]
set output_directory [file normalize [lindex $argv 1]]
set script_directory [file dirname [file normalize [info script]]]
set pre_place_script [file join $script_directory timing_300mhz_pre_place.tcl]
set post_place_script [file join $script_directory timing_300mhz_post_place_check.tcl]
set post_route_script [file join $script_directory timing_300mhz_post_route_check.tcl]

if {![file exists $input_dcp]} {
    error "Input checkpoint does not exist: $input_dcp"
}
foreach required_script [list $pre_place_script $post_place_script $post_route_script] {
    if {![file exists $required_script]} {
        error "Required recovery script does not exist: $required_script"
    }
}
file mkdir $output_directory
cd $output_directory

set_param general.maxThreads 12
puts "INFO: 300MHz recovery: opening $input_dcp"
open_checkpoint $input_dcp

# Preserve the platform shell and its fixed routes.  Remove only the kernel's
# old child-pblock membership and SLR assignments before unplacing its movable
# implementation cells.
set kernel_roots [get_cells -quiet -hierarchical -filter \
    {NAME =~ */int4_decoder_token_controller_1}]
if {[llength $kernel_roots] != 1} {
    error "300MHz recovery: expected one kernel root, found [llength $kernel_roots]"
}
set kernel_root [lindex $kernel_roots 0]
set kernel_name [get_property NAME $kernel_root]
set kernel_cells [get_cells -quiet -hierarchical -filter \
    "NAME == $kernel_name || NAME =~ ${kernel_name}/*"]
if {[llength $kernel_cells] == 0} {
    error "300MHz recovery: no cells found below $kernel_name"
}
puts "INFO: 300MHz recovery: kernel=$kernel_name cells=[llength $kernel_cells]"

foreach slr {SLR0 SLR1 SLR2 SLR3} {
    set pblock_name "pblock_dynamic_${slr}"
    set pblock [get_pblocks -quiet $pblock_name]
    if {[llength $pblock] != 1} {
        error "300MHz recovery: required platform pblock $pblock_name was not found uniquely"
    }
    set old_members [get_cells -quiet -of_objects $pblock -filter \
        "NAME == $kernel_name || NAME =~ ${kernel_name}/*"]
    if {[llength $old_members] > 0} {
        puts "INFO: 300MHz recovery: removing [llength $old_members] old members from $pblock_name"
        remove_cells_from_pblock $pblock $old_members
    }
}
reset_property USER_SLR_ASSIGNMENT $kernel_cells

puts "INFO: 300MHz recovery: unroute movable design"
route_design -unroute
puts "INFO: 300MHz recovery: unplace movable design"
place_design -unplace

source $pre_place_script

puts "INFO: 300MHz recovery: place_design SSI_SpreadSLLs"
place_design -directive SSI_SpreadSLLs
source $post_place_script
write_checkpoint -force [file join $output_directory level0_wrapper_recovered_placed.dcp]
report_timing_summary -delay_type min_max -max_paths 20 \
    -file [file join $output_directory placed_timing_summary.rpt]

puts "INFO: 300MHz recovery: pre-route phys_opt_design AggressiveExplore"
phys_opt_design -directive AggressiveExplore
source $post_place_script
write_checkpoint -force [file join $output_directory level0_wrapper_recovered_physopt.dcp]

puts "INFO: 300MHz recovery: route_design Explore"
if {[catch {route_design -directive Explore} route_error]} {
    catch {report_route_status -file [file join $output_directory failed_route_status.rpt]}
    catch {report_utilization -slr -file [file join $output_directory failed_utilization_slr.rpt]}
    catch {write_checkpoint -force [file join $output_directory level0_wrapper_recovery_route_error.dcp]}
    error "300MHz recovery: route_design failed: $route_error"
}

puts "INFO: 300MHz recovery: post-route phys_opt_design AggressiveExplore"
if {[catch {phys_opt_design -directive AggressiveExplore} physopt_error]} {
    catch {report_route_status -file [file join $output_directory failed_post_route_physopt_status.rpt]}
    catch {write_checkpoint -force [file join $output_directory level0_wrapper_recovery_physopt_error.dcp]}
    error "300MHz recovery: post-route phys_opt_design failed: $physopt_error"
}

source $post_route_script
report_utilization -slr -file [file join $output_directory final_utilization_slr.rpt]
report_design_analysis -congestion -file [file join $output_directory final_congestion.rpt]
report_methodology -file [file join $output_directory final_methodology.rpt]
report_qor_assessment -file [file join $output_directory final_qor_assessment.rpt]
write_checkpoint -force [file join $output_directory level0_wrapper_recovered_routed_clean.dcp]

puts "INFO: 300MHz recovery: RECOVERED_DCP_VALIDATED"
close_design
