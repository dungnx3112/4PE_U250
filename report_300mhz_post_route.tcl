# Usage:
#   vivado -mode batch -source source/report_300mhz_post_route.tcl \
#     -tclargs <routed.dcp> <output_directory>

if {$argc < 1 || $argc > 2} {
    error "Usage: report_300mhz_post_route.tcl <routed.dcp> ?output_directory?"
}

set dcp_path [file normalize [lindex $argv 0]]
if {![file exists $dcp_path]} {
    error "Checkpoint does not exist: $dcp_path"
}

if {$argc == 2} {
    set report_dir [file normalize [lindex $argv 1]]
} else {
    set report_dir [file normalize "report_300mhz_post_route"]
}
file mkdir $report_dir

proc run_report {name command report_dir} {
    set output_path [file join $report_dir "${name}.rpt"]
    puts "INFO: generating $output_path"
    if {[catch {uplevel #0 [concat $command [list -file $output_path]]} message]} {
        puts "WARNING: could not generate $name: $message"
    }
}

open_checkpoint $dcp_path

run_report timing_summary [list report_timing_summary \
    -delay_type min_max -report_unconstrained -check_timing_verbose \
    -max_paths 100 -input_pins] $report_dir
run_report worst_setup_500 [list report_timing \
    -delay_type max -max_paths 500 -nworst 1 -sort_by group \
    -path_type full_clock_expanded -input_pins] $report_dir
run_report utilization_slr [list report_utilization -slr] $report_dir
run_report utilization_hierarchy [list report_utilization \
    -hierarchical -hierarchical_depth 4] $report_dir
run_report congestion [list report_design_analysis -congestion] $report_dir
run_report high_fanout [list report_high_fanout_nets \
    -timing -load_types -max_nets 200] $report_dir
run_report route_status [list report_route_status] $report_dir
run_report methodology [list report_methodology] $report_dir

# Count placed URAM primitives by physical SLR. This specifically checks the
# old failure mode in which every URAM was packed into SLR2 and SLR3.
array set uram_count {SLR0 0 SLR1 0 SLR2 0 SLR3 0 UNPLACED 0 UNKNOWN 0}
foreach cell [get_cells -quiet -hierarchical -filter {PRIMITIVE_TYPE =~ BLOCKRAM.URAM.*}] {
    set loc [get_property LOC $cell]
    if {$loc eq ""} {
        incr uram_count(UNPLACED)
        continue
    }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] == 1} {
        set slr [get_property NAME [lindex $slrs 0]]
        if {[info exists uram_count($slr)]} {
            incr uram_count($slr)
        } else {
            incr uram_count(UNKNOWN)
        }
    } else {
        incr uram_count(UNKNOWN)
    }
}

set uram_csv [open [file join $report_dir "uram_by_slr.csv"] w]
puts $uram_csv "slr,uram_primitives"
foreach slr {SLR0 SLR1 SLR2 SLR3 UNPLACED UNKNOWN} {
    puts $uram_csv "$slr,$uram_count($slr)"
}
close $uram_csv

# Emit a machine-readable balance table for the resources that matter to this
# kernel.  The implementation report remains the source of truth; this CSV is
# intentionally simple so successive floorplan attempts can be compared
# without parsing Vivado's formatted tables.
array set resource_filters [list \
    LUT  {PRIMITIVE_TYPE =~ CLB.LUT.*} \
    FF   {PRIMITIVE_TYPE =~ CLB.FF.*} \
    BRAM {PRIMITIVE_TYPE =~ BLOCKRAM.BRAM.*} \
    URAM {PRIMITIVE_TYPE =~ BLOCKRAM.URAM.*} \
    DSP  {PRIMITIVE_TYPE =~ ARITHMETIC.DSP*}]
array set resource_count {}
foreach resource {LUT FF BRAM URAM DSP} {
    foreach slr {SLR0 SLR1 SLR2 SLR3 UNPLACED UNKNOWN} {
        set resource_count($resource,$slr) 0
    }
    foreach cell [get_cells -quiet -hierarchical -filter \
            $resource_filters($resource)] {
        set loc [get_property LOC $cell]
        if {$loc eq ""} {
            incr resource_count($resource,UNPLACED)
            continue
        }
        set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
        if {[llength $slrs] == 1} {
            set slr [get_property NAME [lindex $slrs 0]]
            if {[info exists resource_count($resource,$slr)]} {
                incr resource_count($resource,$slr)
            } else {
                incr resource_count($resource,UNKNOWN)
            }
        } else {
            incr resource_count($resource,UNKNOWN)
        }
    }
}

set resource_csv [open [file join $report_dir "resources_by_slr.csv"] w]
puts $resource_csv "resource,SLR0,SLR1,SLR2,SLR3,unplaced,unknown"
foreach resource {LUT FF BRAM URAM DSP} {
    puts $resource_csv "$resource,$resource_count($resource,SLR0),$resource_count($resource,SLR1),$resource_count($resource,SLR2),$resource_count($resource,SLR3),$resource_count($resource,UNPLACED),$resource_count($resource,UNKNOWN)"
}
close $resource_csv

# QoR assessment can be much slower than the other reports for this design.
# Run it last so the timing, congestion, and physical-balance evidence above
# is already safely on disk if that optional analysis is interrupted.
run_report qor_assessment [list report_qor_assessment] $report_dir

puts "INFO: 300 MHz post-route reports written to $report_dir"
close_design
