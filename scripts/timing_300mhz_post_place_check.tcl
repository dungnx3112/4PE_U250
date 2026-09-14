# Post-place validation for the simple per-PE U250 floorplan.

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

proc find_surviving_roots {patterns} {
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

proc verify_group {slr label patterns} {
    set roots [find_surviving_roots $patterns]
    if {[llength $roots] == 0} {
        error "300MHz post-place: no surviving hierarchy found for $label"
    }

    set checked 0
    set foreign 0
    set examples {}
    foreach root $roots {
        set root_name [get_property NAME $root]
        set primitives [get_cells -quiet -hierarchical -filter \
            "NAME =~ ${root_name}/* && IS_PRIMITIVE"]
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
    }

    if {$checked == 0} {
        error "300MHz post-place: $label has no placeable descendants"
    }
    puts "INFO: 300MHz post-place: $label expected=$slr checked=$checked foreign=$foreign"
    if {$foreign != 0} {
        error "300MHz post-place: $label escaped $slr; [join $examples {, }]"
    }
}

foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    verify_group $slr "PE${pe} AXI/DDR endpoint" [list \
        "*gmem${pe}_m_axi_U"]

    verify_group $slr "PE${pe} local memories" [list \
        "*scale_cache${pe}_U" \
        "*norm_cache${pe}_U" \
        "*residual${pe}_U" \
        "*projection${pe}_U" \
        "*q${pe}_U" "*k${pe}_U" "*v${pe}_U" \
        "*gate${pe}_U" \
        "*activation_q${pe}_U" \
        "*activation_scale${pe}_U"]

    verify_group $slr "PE${pe} local compute" [list \
        "*/int4_run_local_pe_${pe}_U0" \
        "*/int4_store_local_output_${pe}_U0" \
        "*/int4_run_local_attention_commanded_${pe}_U0" \
        "*/int4_local_sumsq_${pe}_U0" \
        "*/int4_local_rms_normalize_quantize_${pe}_U0" \
        "*/int4_local_swiglu_quantize_commanded_${pe}_U0" \
        "*/int4_local_residual_add_commanded_${pe}_U0" \
        "*/int4_preload_local_metadata_commanded_${pe}_U0" \
        "*/int4_load_local_residual_commanded_${pe}_U0" \
        "*/int4_store_local_residual_commanded_${pe}_U0" \
        "*/int4_save_local_projection_commanded_${pe}_U0" \
        "*/int4_store_local_logits_commanded_${pe}_U0"]
}

set run_directory [pwd]
if {![catch {set candidate [get_property DIRECTORY [current_run]]}] &&
        $candidate ne ""} {
    set run_directory $candidate
}

report_utilization -slr -file \
    [file normalize [file join $run_directory post_place_utilization_slr.rpt]]
report_design_analysis -congestion -file \
    [file normalize [file join $run_directory post_place_congestion.rpt]]

puts "INFO: 300MHz floorplan: SIMPLE_FLOORPLAN_VALIDATED"
puts "INFO: 300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED"
