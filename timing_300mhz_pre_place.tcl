# Simple U250 floorplan for the independent 4-PE architecture.
#
# Only the large, surviving PE-local roots are constrained:
#   PE0 -> SLR0 / DDR0
#   PE1 -> SLR1 / DDR1
#   PE2 -> SLR2 / DDR2
#   PE3 -> SLR3 / DDR3
#
# Small command, relay and reduction helpers are intentionally left to the
# placer. Vivado may flatten those helpers during opt_design, so using their
# HLS instance names as mandatory anchors makes the build unnecessarily
# dependent on an unstable synthesized hierarchy.

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

proc platform_slr_pblock {slr} {
    set pblock [get_pblocks -quiet "pblock_dynamic_${slr}"]
    if {[llength $pblock] != 1} {
        error "300MHz floorplan: pblock_dynamic_${slr} was not found uniquely"
    }
    return $pblock
}

proc anchor_group {slr label patterns} {
    set roots [find_surviving_roots $patterns]
    if {[llength $roots] == 0} {
        error "300MHz floorplan: no surviving hierarchy found for $label"
    }

    set pblock [platform_slr_pblock $slr]
    add_cells_to_pblock $pblock $roots
    set_property USER_SLR_ASSIGNMENT $slr $roots
    puts "INFO: 300MHz floorplan: $label -> $slr ([llength $roots] roots)"
}

foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    anchor_group $slr "PE${pe} AXI/DDR endpoint" [list \
        "*gmem${pe}_m_axi_U"]

    anchor_group $slr "PE${pe} local memories" [list \
        "*scale_cache${pe}_U" \
        "*norm_cache${pe}_U" \
        "*residual${pe}_U" \
        "*projection${pe}_U" \
        "*q${pe}_U" "*k${pe}_U" "*v${pe}_U" \
        "*gate${pe}_U" \
        "*activation_q${pe}_U" \
        "*activation_scale${pe}_U"]

    anchor_group $slr "PE${pe} local compute" [list \
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

puts "INFO: 300MHz floorplan: SIMPLE_PE_ANCHORS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
