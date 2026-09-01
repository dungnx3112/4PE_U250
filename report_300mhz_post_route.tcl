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

proc csv_quote {value} {
    set escaped [string map [list {"} {""}] $value]
    return \"$escaped\"
}

proc pin_name {pin_value} {
    if {[llength $pin_value] == 0} {
        return ""
    }
    set name ""
    if {![catch {set name [get_property NAME [lindex $pin_value 0]]}] &&
            $name ne ""} {
        return $name
    }
    return [lindex $pin_value 0]
}

proc pin_slr_and_cell {pin_value} {
    set name [pin_name $pin_value]
    if {$name eq ""} {
        return [list NONE ""]
    }
    set pins [get_pins -quiet $name]
    set cells [get_cells -quiet -of_objects $pins]
    if {[llength $cells] == 0} {
        return [list NONE ""]
    }
    set cell [lindex $cells 0]
    set cell_name [get_property NAME $cell]
    set loc [get_property LOC $cell]
    if {$loc eq ""} {
        return [list UNPLACED $cell_name]
    }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] != 1} {
        return [list UNKNOWN $cell_name]
    }
    return [list [get_property NAME [lindex $slrs 0]] $cell_name]
}

proc append_slr_transition {sequence_var cells_var slr cell_name} {
    upvar 1 $sequence_var sequence
    upvar 1 $cells_var transition_cells
    if {![string match "SLR?" $slr]} {
        return
    }
    if {[llength $sequence] == 0 || [lindex $sequence end] ne $slr} {
        lappend sequence $slr
        lappend transition_cells "${slr}:${cell_name}"
    }
}

proc timing_path_slr_sequence {path} {
    set sequence {}
    set transition_cells {}
    set points {}
    catch {set points [get_property PATH $path]}
    foreach point $points {
        set point_pin ""
        catch {set point_pin [get_property PIN $point]}
        if {$point_pin eq ""} {
            set point_pin $point
        }
        lassign [pin_slr_and_cell $point_pin] slr cell_name
        append_slr_transition sequence transition_cells $slr $cell_name
    }

    # PATH is not exposed for every path type/tool version. Keep a best-effort
    # fallback, then force the endpoints into the sequence for useful output.
    if {[llength $sequence] == 0} {
        foreach point_pin [get_pins -quiet -of_objects $path] {
            lassign [pin_slr_and_cell $point_pin] slr cell_name
            append_slr_transition sequence transition_cells $slr $cell_name
        }
    }
    lassign [pin_slr_and_cell [get_property STARTPOINT_PIN $path]] start_slr start_cell
    lassign [pin_slr_and_cell [get_property ENDPOINT_PIN $path]] end_slr end_cell
    if {[string match "SLR?" $start_slr] &&
            ([llength $sequence] == 0 || [lindex $sequence 0] ne $start_slr)} {
        set sequence [linsert $sequence 0 $start_slr]
        set transition_cells [linsert $transition_cells 0 "${start_slr}:${start_cell}"]
    }
    append_slr_transition sequence transition_cells $end_slr $end_cell
    return [list $sequence $transition_cells]
}

proc slr_index {slr} {
    if {[regexp {^SLR([0-9]+)$} $slr -> index]} {
        return $index
    }
    return -1
}

proc classify_timing_path {startpoint endpoint} {
    set name "$startpoint $endpoint"
    foreach {pattern label} [list \
        "*entry_proc*" config_launch \
        "*gmem0_m_axi_U*" axi_gmem0 \
        "*gmem1_m_axi_U*" axi_gmem1 \
        "*gmem2_m_axi_U*" axi_gmem2 \
        "*gmem3_m_axi_U*" axi_gmem3 \
        "*rms_pair*" rms_pair \
        "*linear_reduce_pair*" linear_reduce_pair \
        "*linear_finalize_pair*" linear_finalize_pair \
        "*completion*" completion \
        "*int4_decoder_local_pe_0*" local_pe0 \
        "*int4_decoder_local_pe_1*" local_pe1 \
        "*int4_decoder_local_pe_2*" local_pe2 \
        "*int4_decoder_local_pe_3*" local_pe3 \
        "*rst*" reset] {
        if {[string match $pattern $name]} {
            return $label
        }
    }
    return other
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
run_report slr_crossing [list report_slr_crossing -max_nets 500] $report_dir
run_report route_status [list report_route_status] $report_dir
run_report methodology [list report_methodology] $report_dir

# Endpoint SLR alone is insufficient: the old failing path started and ended
# in SLR0 while physically travelling SLR0->SLR2->SLR1->SLR0->SLR3->SLR0.
# Record the complete collapsed SLR sequence and flag detours/revisits.
set path_csv [open [file join $report_dir "timing_path_slr_audit.csv"] w]
puts $path_csv "index,slack,datapath_delay,logic_delay,route_delay,route_ratio,logic_levels,start_slr,end_slr,slr_sequence,crossing_count,max_hop,revisit,same_slr_detour,category,flags,transition_cells,startpoint,endpoint"
set path_index 0
set suspicious_count 0
set revisit_count 0
set same_slr_detour_count 0
set nonadjacent_count 0
set route_dominated_failing_count 0
foreach path [get_timing_paths -quiet -delay_type max -max_paths 1000 \
        -nworst 1 -sort_by group] {
    incr path_index
    set start_pin [get_property STARTPOINT_PIN $path]
    set end_pin [get_property ENDPOINT_PIN $path]
    set start_name [pin_name $start_pin]
    set end_name [pin_name $end_pin]
    lassign [pin_slr_and_cell $start_pin] start_slr unused_start_cell
    lassign [pin_slr_and_cell $end_pin] end_slr unused_end_cell
    lassign [timing_path_slr_sequence $path] sequence transition_cells

    set crossings [expr {max(0, [llength $sequence] - 1)}]
    set max_hop 0
    set revisit 0
    array unset seen_slr
    set previous ""
    foreach slr $sequence {
        if {[info exists seen_slr($slr)]} {
            set revisit 1
        }
        set seen_slr($slr) 1
        if {$previous ne ""} {
            set previous_index [slr_index $previous]
            set current_index [slr_index $slr]
            if {$previous_index >= 0 && $current_index >= 0} {
                set hop [expr {abs($current_index - $previous_index)}]
                if {$hop > $max_hop} {
                    set max_hop $hop
                }
            }
        }
        set previous $slr
    }
    set same_slr_detour [expr {$start_slr eq $end_slr && $crossings > 0}]

    set slack ""
    set datapath ""
    set logic ""
    set route ""
    set levels ""
    catch {set slack [get_property SLACK $path]}
    catch {set datapath [get_property DATAPATH_DELAY $path]}
    catch {set logic [get_property LOGIC_DELAY $path]}
    catch {set route [get_property ROUTE_DELAY $path]}
    catch {set levels [get_property LOGIC_LEVELS $path]}
    if {![string is double -strict $route] &&
            [string is double -strict $datapath] &&
            [string is double -strict $logic]} {
        set route [expr {$datapath - $logic}]
    }
    set route_ratio ""
    if {[string is double -strict $route] &&
            [string is double -strict $datapath] && $datapath > 0.0} {
        set route_ratio [expr {$route / $datapath}]
    }

    set flags {}
    if {$crossings > 1} {
        lappend flags MULTIPLE_CROSSINGS
    }
    if {$max_hop > 1} {
        lappend flags NONADJACENT_HOP
        incr nonadjacent_count
    }
    if {$revisit} {
        lappend flags SLR_REVISIT
        incr revisit_count
    }
    if {$same_slr_detour} {
        lappend flags SAME_SLR_DETOUR
        incr same_slr_detour_count
    }
    if {[string is double -strict $slack] && $slack < 0.0 &&
            [string is double -strict $route_ratio] && $route_ratio > 0.8} {
        lappend flags ROUTE_DOMINATED_FAIL
        incr route_dominated_failing_count
    }
    if {[llength $flags] > 0} {
        incr suspicious_count
    }

    set category [classify_timing_path $start_name $end_name]
    set row [list $path_index $slack $datapath $logic $route $route_ratio \
        $levels $start_slr $end_slr [join $sequence {->}] $crossings \
        $max_hop $revisit $same_slr_detour $category [join $flags {|}] \
        [join $transition_cells {|}] $start_name $end_name]
    set quoted_row {}
    foreach value $row {
        lappend quoted_row [csv_quote $value]
    }
    puts $path_csv [join $quoted_row ","]
}
close $path_csv

set audit_summary [open [file join $report_dir "timing_path_slr_audit_summary.csv"] w]
puts $audit_summary "metric,value"
puts $audit_summary "paths_checked,$path_index"
puts $audit_summary "paths_with_flags,$suspicious_count"
puts $audit_summary "slr_revisit_paths,$revisit_count"
puts $audit_summary "same_slr_detour_paths,$same_slr_detour_count"
puts $audit_summary "nonadjacent_hop_paths,$nonadjacent_count"
puts $audit_summary "route_dominated_failing_paths,$route_dominated_failing_count"
close $audit_summary

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
puts "INFO: 300MHz post-route: SLR_PATH_AUDIT_COMPLETE"
close_design
