# Targeted read-only trace for comparing an existing routed DCP with the
# regenerated HLS RTL. Usage:
#   vivado -mode batch -source trace_old_dcp.tcl -tclargs <dcp> <report_dir>

if {$argc != 2} {
    error "Usage: trace_old_dcp.tcl <routed.dcp> <report_dir>"
}

set dcp_path [file normalize [lindex $argv 0]]
set report_dir [file normalize [lindex $argv 1]]
file mkdir $report_dir

proc object_name {object} {
    if {[llength $object] == 0} {
        return ""
    }
    return [get_property NAME [lindex $object 0]]
}

proc pin_slr {pin_name} {
    # STARTPOINT_PIN/ENDPOINT_PIN timing-path properties are returned as names,
    # not pin objects. Resolve the name before asking for its owning cell.
    set pins [get_pins -quiet $pin_name]
    set cells [get_cells -quiet -of_objects $pins]
    if {[llength $cells] == 0} {
        return "NONE"
    }
    set loc [get_property LOC [lindex $cells 0]]
    if {$loc eq ""} {
        return "UNPLACED"
    }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] != 1} {
        return "UNKNOWN"
    }
    return [get_property NAME [lindex $slrs 0]]
}

proc classify_path {name} {
    foreach {pattern label} [list \
        "*quantized_half23_stream_U*" quantized_half23 \
        "*quantized_half01_stream_U*" quantized_half01 \
        "*key0_stream_U*" key0_stream \
        "*key1_stream_U*" key1_stream \
        "*swiftkv_route_compressed_kv_cache*" swiftkv_router \
        "*gmem0_m_axi_U*" gmem0_axi \
        "*control_s_axi_U*" axilite_control] {
        if {[string match $pattern $name]} {
            return $label
        }
    }
    return other
}

open_checkpoint $dcp_path

report_timing_summary -delay_type min_max -report_unconstrained \
    -check_timing_verbose -max_paths 50 -input_pins \
    -file [file join $report_dir timing_summary.rpt]
report_timing -delay_type max -max_paths 200 -nworst 1 -sort_by group \
    -path_type full_clock_expanded -input_pins \
    -file [file join $report_dir worst_setup_200.rpt]
report_high_fanout_nets -timing -load_types -max_nets 200 \
    -file [file join $report_dir high_fanout_200.rpt]
report_utilization -slr -file [file join $report_dir utilization_slr.rpt]
report_route_status -file [file join $report_dir route_status.rpt]

set path_csv [open [file join $report_dir timing_paths.csv] w]
puts $path_csv "index,slack,datapath_delay,logic_delay,start_slr,end_slr,category,startpoint,endpoint"
set index 0
foreach path [get_timing_paths -quiet -delay_type max -max_paths 500 \
        -nworst 1 -sort_by group] {
    incr index
    set start_pin [get_property STARTPOINT_PIN $path]
    set end_pin [get_property ENDPOINT_PIN $path]
    set start_name [object_name $start_pin]
    set end_name [object_name $end_pin]
    set category [classify_path "${start_name} ${end_name}"]
    set datapath ""
    set logic ""
    catch {set datapath [get_property DATAPATH_DELAY $path]}
    catch {set logic [get_property LOGIC_DELAY $path]}
    puts $path_csv [join [list $index [get_property SLACK $path] \
        $datapath $logic [pin_slr $start_pin] [pin_slr $end_pin] \
        $category $start_name $end_name] ","]
}
close $path_csv

set cell_csv [open [file join $report_dir issue_cells.csv] w]
puts $cell_csv "group,name,ref_name,loc,slr,user_slr_assignment"
foreach {label pattern} [list \
    quantized_half23_ptr "*quantized_half23_stream_U/mOutPtr_reg*" \
    quantized_half23_mem "*quantized_half23_stream_U/*mem_reg*" \
    quantized_half01_ptr "*quantized_half01_stream_U/mOutPtr_reg*" \
    key0_stream "*key0_stream_U/*" \
    key1_stream "*key1_stream_U/*" \
    router_loop_init "*swiftkv_route_compressed_kv_cache*/*ap_loop_init*" \
    router_start_replica "*swiftkv_route_compressed_kv_cache*/*ap_start*replica*" \
    gmem0_burst "*gmem0_m_axi_U/bus_read/fifo_burst/*"] {
    foreach cell [get_cells -quiet -hierarchical -filter "NAME =~ $pattern"] {
        set loc [get_property LOC $cell]
        set slr "UNPLACED"
        if {$loc ne ""} {
            set physical_slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
            if {[llength $physical_slrs] == 1} {
                set slr [get_property NAME [lindex $physical_slrs 0]]
            } else {
                set slr "UNKNOWN"
            }
        }
        set user_slr ""
        catch {set user_slr [get_property USER_SLR_ASSIGNMENT $cell]}
        puts $cell_csv [join [list $label [get_property NAME $cell] \
            [get_property REF_NAME $cell] $loc $slr $user_slr] ","]
    }
}
close $cell_csv

set hierarchy_csv [open [file join $report_dir hierarchy_slr_counts.csv] w]
puts $hierarchy_csv "group,SLR0,SLR1,SLR2,SLR3,unplaced,unknown"
foreach {label root_pattern} [list \
    linear_pe0 "*/int4_run_pe_dataflow_0_U0/*" \
    linear_pe1 "*/int4_run_pe_dataflow_1_U0/*" \
    linear_pe2 "*/int4_run_pe_dataflow_2_U0/*" \
    linear_pe3 "*/int4_run_pe_dataflow_3_U0/*" \
    swiftkv_pe0 "*/swiftkv_run_pe_0_U0/*" \
    swiftkv_pe1 "*/swiftkv_run_pe_1_U0/*" \
    swiftkv_pe2 "*/swiftkv_run_pe_2_U0/*" \
    swiftkv_pe3 "*/swiftkv_run_pe_3_U0/*"] {
    array set count {SLR0 0 SLR1 0 SLR2 0 SLR3 0 UNPLACED 0 UNKNOWN 0}
    foreach cell [get_cells -quiet -hierarchical -filter \
            "NAME =~ $root_pattern && IS_PRIMITIVE"] {
        set loc [get_property LOC $cell]
        if {$loc eq ""} {
            incr count(UNPLACED)
            continue
        }
        set physical_slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
        if {[llength $physical_slrs] == 1} {
            set slr [get_property NAME [lindex $physical_slrs 0]]
            if {[info exists count($slr)]} {
                incr count($slr)
            } else {
                incr count(UNKNOWN)
            }
        } else {
            incr count(UNKNOWN)
        }
    }
    puts $hierarchy_csv [join [list $label $count(SLR0) $count(SLR1) \
        $count(SLR2) $count(SLR3) $count(UNPLACED) $count(UNKNOWN)] ","]
}
close $hierarchy_csv

puts "INFO: targeted old-DCP trace written to $report_dir"
close_design
