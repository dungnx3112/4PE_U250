# Post-place guard for the congestion-aware U250 300 MHz floorplan.
# Hard resource anchors must remain local, while orchestration/control logic is
# deliberately free to spread.  The build also stops before routing when an
# adjacent SLR boundary is already too heavily used.

puts "INFO: loading [file normalize [info script]]"

proc find_required_roots {label patterns} {
    set roots {}
    foreach pattern $patterns {
        set roots [concat $roots [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]]
    }
    set roots [lsort -unique $roots]
    if {[llength $roots] == 0} {
        error "300MHz post-place: required $label hierarchy was not found"
    }
    return $roots
}

proc physical_slr {cell} {
    set loc [get_property LOC $cell]
    if {$loc eq ""} {
        return "UNPLACED"
    }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] != 1} {
        return "UNKNOWN"
    }
    return [get_property NAME [lindex $slrs 0]]
}

proc check_physical_slr {slr label patterns required} {
    set roots {}
    foreach pattern $patterns {
        set roots [concat $roots [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]]
    }
    set roots [lsort -unique $roots]
    if {[llength $roots] == 0} {
        if {$required} {
            error "300MHz post-place: required $label hierarchy was not found"
        }
        puts "INFO: 300MHz post-place: optional $label hierarchy was not found"
        return
    }

    set primitives {}
    foreach root $roots {
        set root_name [get_property NAME $root]
        if {[get_property IS_PRIMITIVE $root]} {
            lappend primitives $root
        }
        set primitives [concat $primitives [get_cells -quiet -hierarchical \
            -filter "NAME =~ ${root_name}/* && IS_PRIMITIVE"]]
    }
    set primitives [lsort -unique $primitives]
    set placeable_primitives {}
    foreach primitive $primitives {
        set ref_name [get_property REF_NAME $primitive]
        # Constant-source primitives do not receive physical LOCs and therefore
        # must not be treated as cells that escaped an SLR assignment.
        if {$ref_name eq "VCC" || $ref_name eq "GND"} {
            continue
        }
        lappend placeable_primitives $primitive
    }
    set primitives $placeable_primitives
    if {[llength $primitives] == 0} {
        error "300MHz post-place: required $label has no primitive descendants"
    }

    array set count {SLR0 0 SLR1 0 SLR2 0 SLR3 0 UNPLACED 0 UNKNOWN 0}
    set examples {}
    foreach primitive $primitives {
        set actual [physical_slr $primitive]
        if {[info exists count($actual)]} {
            incr count($actual)
        } else {
            incr count(UNKNOWN)
        }
        if {$actual ne $slr && [llength $examples] < 5} {
            lappend examples "[get_property NAME $primitive]=$actual"
        }
    }

    set foreign [expr {[llength $primitives] - $count($slr)}]
    puts "INFO: 300MHz post-place: $label expected=$slr total=[llength $primitives] local=$count($slr) foreign=$foreign"
    if {$foreign != 0} {
        error "300MHz post-place: $label escaped $slr; examples: [join $examples {, }]"
    }
}

proc require_physical_slr {slr label patterns} {
    check_physical_slr $slr $label $patterns 1
}

proc optional_physical_slr {slr label patterns} {
    check_physical_slr $slr $label $patterns 0
}

proc report_hierarchy_distribution {label patterns} {
    set roots [find_required_roots $label $patterns]
    set primitives {}
    foreach root $roots {
        set root_name [get_property NAME $root]
        set primitives [concat $primitives [get_cells -quiet -hierarchical \
            -filter "NAME =~ ${root_name}/* && IS_PRIMITIVE"]]
    }
    set primitives [lsort -unique $primitives]
    array set count {SLR0 0 SLR1 0 SLR2 0 SLR3 0 UNPLACED 0 UNKNOWN 0}
    foreach primitive $primitives {
        set ref_name [get_property REF_NAME $primitive]
        if {$ref_name eq "VCC" || $ref_name eq "GND"} {
            continue
        }
        set actual [physical_slr $primitive]
        if {[info exists count($actual)]} {
            incr count($actual)
        } else {
            incr count(UNKNOWN)
        }
    }
    puts "INFO: 300MHz post-place: soft $label distribution SLR0=$count(SLR0) SLR1=$count(SLR1) SLR2=$count(SLR2) SLR3=$count(SLR3) UNPLACED=$count(UNPLACED) UNKNOWN=$count(UNKNOWN)"
    if {$count(UNPLACED) != 0 || $count(UNKNOWN) != 0} {
        error "300MHz post-place: soft $label contains unplaced or unknown primitives"
    }
}

# Report complete PE hierarchies without demanding that their HLS-generated
# control cones remain inside one SLR.  This is the key difference from the
# failed checkpoint's over-constrained placement.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    report_hierarchy_distribution "linear PE${pe}" [list \
        "*/int4_run_pe_dataflow_${pe}_U0"]
    report_hierarchy_distribution "SwiftKV PE${pe}" [list \
        "*/swiftkv_run_pe_${pe}_U0"]

    require_physical_slr $slr "gmem${pe} AXI master" [list \
        "*gmem${pe}_m_axi_U"]
    require_physical_slr $slr "PE${pe} local memories" [list \
        "*linear_stage${pe}_U" \
        "*model_scale_cache${pe}_U" \
        "*model_norm_cache${pe}_U" \
        "*residual_buffer${pe}_U" \
        "*q_pe${pe}_U" "*k_pe${pe}_U" "*v_pe${pe}_U" \
        "*gate_pe${pe}_U" "*up_pe${pe}_U" \
        "*logits_pe${pe}_U" \
        "*rope_lut_bank${pe}_U"]
    require_physical_slr $slr "PE${pe} linear arithmetic" [list \
        "*/int4_run_pe_dataflow_${pe}_U0/int4_pe_mac_commanded_${pe}_U0" \
        "*/int4_run_pe_dataflow_${pe}_U0/int4_pe_dequant_commanded_${pe}_U0"]
    optional_physical_slr $slr "PE${pe} SwiftKV arithmetic" [list \
        "*/swiftkv_run_pe_${pe}_U0/*/grp_swiftkv_attention_head_fu_*"]
}

require_physical_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

require_physical_slr SLR1 "pair01 storage" [list \
    "*activation_q_pair01_U" "*activation_scale_pair01_U" \
    "*current_cos_pair01_U" "*current_sin_pair01_U" \
    "*/attention_quantized_half01_stream*_U" \
    "*/quantized_half01_stream_U" \
    "*/quantized_half01_local_U" \
    "*/quantized_half23_to01_U" \
    "*/quantized_pair01_stream_U" \
    "*/quantized_pair01_U"]

require_physical_slr SLR2 "pair23 storage" [list \
    "*activation_q_pair23_U" "*activation_scale_pair23_U" \
    "*current_cos_pair23_U" "*current_sin_pair23_U" \
    "*/attention_quantized_half23_stream*_U" \
    "*/quantized_half23_stream_U" \
    "*/quantized_half23_local_U" \
    "*/quantized_half01_to23_U" \
    "*/quantized_pair23_stream_U" \
    "*/quantized_pair23_U"]

set run_directory [pwd]
if {![catch {set candidate_run_directory [get_property DIRECTORY [current_run]]}] &&
        $candidate_run_directory ne ""} {
    set run_directory $candidate_run_directory
}
set slr_report_path [file normalize [file join $run_directory post_place_utilization_slr.rpt]]
redirect -variable slr_report {report_utilization -slr}
set slr_report_file [open $slr_report_path w]
puts $slr_report_file $slr_report
close $slr_report_file

set boundary_count 0
set overloaded_boundaries {}
foreach line [split $slr_report "\n"] {
    if {[regexp {^\|[[:space:]]*(SLR[0-3][[:space:]]*<->[[:space:]]*SLR[0-3])[[:space:]]*\|[[:space:]]*([0-9]+)[[:space:]]*\|[^|]*\|[[:space:]]*([0-9]+)[[:space:]]*\|[[:space:]]*([0-9.]+)[[:space:]]*\|} \
            $line -> boundary used available utilization]} {
        incr boundary_count
        puts "INFO: 300MHz post-place: $boundary used=$used available=$available utilization=${utilization}%"
        if {[expr {double($utilization) >= 50.0}]} {
            lappend overloaded_boundaries "$boundary=${utilization}%"
        }
    }
}
if {$boundary_count != 3} {
    error "300MHz post-place: could not parse all three adjacent SLR boundaries from $slr_report_path"
}
if {[llength $overloaded_boundaries] != 0} {
    error "300MHz post-place: SLL boundary utilization must stay below 50%; overloaded: [join $overloaded_boundaries {, }]"
}

set congestion_report_path [file normalize [file join $run_directory post_place_congestion.rpt]]
report_design_analysis -congestion -file $congestion_report_path

puts "INFO: 300MHz floorplan: SLL_BOUNDARY_VALIDATED"
puts "INFO: 300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED"
