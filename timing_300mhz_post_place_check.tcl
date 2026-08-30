# Physical validation for timing_300mhz_pre_place.tcl.

puts "INFO: loading [file normalize [info script]]"

proc prune_nested_cells {cells} {
    set roots {}
    set names {}
    foreach cell [lsort -unique $cells] {
        set name [get_property NAME $cell]
        set nested 0
        foreach root_name $names {
            if {[string first "${root_name}/" $name] == 0} {
                set nested 1
                break
            }
        }
        if {!$nested} {
            lappend roots $cell
            lappend names $name
        }
    }
    return $roots
}

proc find_hierarchy_roots {patterns} {
    set matches {}
    foreach pattern $patterns {
        set matches [concat $matches [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]]
    }
    return [prune_nested_cells $matches]
}

proc primitive_slr {cell} {
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

proc require_physical_slr {slr label patterns} {
    foreach pattern $patterns {
        set pattern_matches [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]
        if {[llength $pattern_matches] == 0} {
            error "300MHz post-place: required $label pattern '$pattern' was not found"
        }
    }
    set roots [find_hierarchy_roots $patterns]
    if {[llength $roots] == 0} {
        error "300MHz post-place: required $label hierarchy was not found"
    }

    set primitives {}
    foreach root $roots {
        set root_name [get_property NAME $root]
        set primitives [concat $primitives [get_cells -quiet -hierarchical \
            -filter "NAME =~ ${root_name}/* && IS_PRIMITIVE"]]
    }
    set primitives [lsort -unique $primitives]
    set checked 0
    set foreign 0
    set examples {}
    foreach primitive $primitives {
        set ref_name [get_property REF_NAME $primitive]
        if {$ref_name eq "VCC" || $ref_name eq "GND"} {
            continue
        }
        incr checked
        set actual [primitive_slr $primitive]
        if {$actual ne $slr} {
            incr foreign
            if {[llength $examples] < 5} {
                lappend examples "[get_property NAME $primitive]=$actual"
            }
        }
    }
    if {$checked == 0} {
        error "300MHz post-place: $label has no placeable primitive descendants"
    }
    puts "INFO: 300MHz post-place: $label expected=$slr checked=$checked foreign=$foreign"
    if {$foreign != 0} {
        error "300MHz post-place: $label escaped $slr; [join $examples {, }]"
    }
}

foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    require_physical_slr $slr "PE${pe} AXI master" [list \
        "*gmem${pe}_m_axi_U"]
    require_physical_slr $slr "PE${pe} memories" [list \
        "*scale_cache${pe}_U" "*norm_cache${pe}_U" \
        "*residual${pe}_U" "*projection${pe}_U" \
        "*q${pe}_U" "*k${pe}_U" "*v${pe}_U" "*gate${pe}_U" \
        "*activation_q${pe}_U" "*activation_scale${pe}_U"]
    require_physical_slr $slr "PE${pe} linear" [list \
        "*/int4_run_local_pe_${pe}_U0" \
        "*/int4_store_local_output_${pe}_U0"]
    require_physical_slr $slr "PE${pe} attention" [list \
        "*/int4_run_local_attention_commanded_${pe}_U0"]
    require_physical_slr $slr "PE${pe} preprocessing" [list \
        "*/int4_local_sumsq_${pe}_U0" \
        "*/int4_local_rms_normalize_quantize_${pe}_U0" \
        "*/int4_local_swiglu_quantize_commanded_${pe}_U0" \
        "*/int4_local_residual_add_commanded_${pe}_U0"]
    require_physical_slr $slr "PE${pe} memory clients" [list \
        "*/int4_preload_local_metadata_commanded_${pe}_U0" \
        "*/int4_load_local_residual_commanded_${pe}_U0" \
        "*/int4_store_local_residual_commanded_${pe}_U0" \
        "*/int4_save_local_projection_commanded_${pe}_U0" \
        "*/int4_store_local_logits_commanded_${pe}_U0"]
}

require_physical_slr SLR0 "linear command source" [list \
    "*/int4_seed_linear_command_chain_U0"]
require_physical_slr SLR1 "linear pair01" [list \
    "*/int4_relay_pair_linear_command_0_U0" \
    "*/int4_reduce_pair_and_route_0_U0" \
    "*/int4_finalize_pair_outputs_0_U0"]
require_physical_slr SLR2 "linear pair23" [list \
    "*/int4_relay_pair_linear_command_1_U0" \
    "*/int4_reduce_pair_and_route_1_U0" \
    "*/int4_finalize_pair_outputs_1_U0"]
require_physical_slr SLR3 "linear command sink" [list \
    "*/int4_terminate_linear_command_U0"]

require_physical_slr SLR1 "RMS pair01/finalize" [list \
    "*/int4_merge_rms_pair_0_U0" \
    "*/int4_finalize_rms_and_seed_chain_U0"]
require_physical_slr SLR2 "RMS pair23/relay" [list \
    "*/int4_merge_rms_pair_1_U0" \
    "*/int4_relay_rms_reciprocal_2_U0"]
require_physical_slr SLR3 "RMS sink" [list \
    "*/int4_terminate_rms_reciprocal_U0"]

require_physical_slr SLR0 "attention/projection command sources" [list \
    "*/int4_seed_attention_command_chain_U0" \
    "*/int4_seed_projection_command_chain_U0" \
    "*/int4_seed_controller_token_chain*_U0" \
    "*/int4_seed_block_token_chain*_U0"]
require_physical_slr SLR1 "attention/projection command relay1" [list \
    "*/int4_relay_attention_command_1_U0" \
    "*/int4_relay_projection_command_1_U0" \
    "*/int4_relay_controller_token_1*_U0" \
    "*/int4_relay_block_token_1*_U0"]
require_physical_slr SLR2 "attention/projection command relay2" [list \
    "*/int4_relay_attention_command_2_U0" \
    "*/int4_relay_projection_command_2_U0" \
    "*/int4_relay_controller_token_2*_U0" \
    "*/int4_relay_block_token_2*_U0"]
require_physical_slr SLR3 "attention/projection command sinks" [list \
    "*/int4_terminate_attention_command_U0" \
    "*/int4_terminate_projection_command_U0" \
    "*/int4_terminate_controller_token*_U0" \
    "*/int4_terminate_block_token*_U0"]
require_physical_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

set run_directory [pwd]
if {![catch {set candidate [get_property DIRECTORY [current_run]]}] &&
        $candidate ne ""} {
    set run_directory $candidate
}
set slr_report_path [file normalize [file join $run_directory post_place_utilization_slr.rpt]]
report_utilization -slr -file $slr_report_path
set report_file [open $slr_report_path r]
set report_text [read $report_file]
close $report_file

set boundary_count 0
set overloaded {}
foreach line [split $report_text "\n"] {
    if {[regexp {^\|[[:space:]]*(SLR[0-3][[:space:]]*<->[[:space:]]*SLR[0-3])[[:space:]]*\|[[:space:]]*([0-9]+)[[:space:]]*\|[^|]*\|[[:space:]]*([0-9]+)[[:space:]]*\|[[:space:]]*([0-9.]+)[[:space:]]*\|} \
            $line -> boundary used available utilization]} {
        incr boundary_count
        puts "INFO: 300MHz post-place: $boundary used=$used available=$available utilization=${utilization}%"
        if {[expr {double($utilization) >= 50.0}]} {
            lappend overloaded "$boundary=${utilization}%"
        }
    }
}
if {$boundary_count != 3} {
    error "300MHz post-place: could not parse all SLR boundaries from $slr_report_path"
}
if {[llength $overloaded] != 0} {
    error "300MHz post-place: SLL boundary utilization >= 50%; [join $overloaded {, }]"
}

report_design_analysis -congestion -file \
    [file normalize [file join $run_directory post_place_congestion.rpt]]

puts "INFO: 300MHz floorplan: SLL_BOUNDARY_VALIDATED"
puts "INFO: 300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED"
