# U250 floorplan for the data-driven 4-PE architecture.
#
# Only the large, surviving PE-local roots are constrained:
#   PE0 -> SLR0 / DDR0
#   PE1 -> SLR1 / DDR1
#   PE2 -> SLR2 / DDR2
#   PE3 -> SLR3 / DDR3
#
# The KPN worker control is local (ap_start/ap_continue are constants), while
# commands and completion events cross SLRs only through explicit FIFOs.  Keep
# each local FIFO with its PE and place the two completion joins in the middle
# SLRs so no completion hop spans more than one SLR boundary.

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
        "*/int4_local_rms_task_${pe}_U0" \
        "*/int4_local_sumsq_${pe}_U0" \
        "*/int4_local_rms_normalize_quantize_${pe}_U0" \
        "*/int4_local_swiglu_quantize_commanded_${pe}_U0" \
        "*/int4_local_residual_add_commanded_${pe}_U0" \
        "*/int4_preload_local_metadata_commanded_${pe}_U0" \
        "*/int4_load_local_residual_commanded_${pe}_U0" \
        "*/int4_store_local_residual_commanded_${pe}_U0" \
        "*/int4_save_local_projection_commanded_${pe}_U0" \
        "*/int4_store_local_logits_commanded_${pe}_U0"]

    anchor_group $slr "PE${pe} local task FIFOs" [list \
        "*/command_pe${pe}_U" \
        "*/command_store${pe}_U" \
        "*/token_pe${pe}_U" \
        "*/offset_pe${pe}_U" \
        "*/partial${pe}_U" \
        "*/reciprocal${pe}_U" \
        "*/completion${pe}_U" \
        "*/output${pe}_stream_U" \
        "*/residual_pe${pe}_c_U"]
}

# Registered command/data boundaries.  The FIFO is placed on the receiving
# side of each SLR crossing; this prevents a long route from being absorbed
# into the downstream worker's local critical path.
anchor_group SLR1 "SLR0-to-SLR1 registered boundaries" [list \
    "*/command_01_U" "*/token_01_U" "*/offset_01_U" \
    "*/sum01_local_U" "*/sum23_to01_U" "*/completion01_U"]
anchor_group SLR2 "SLR1-to-SLR2 registered boundaries" [list \
    "*/command_12_U" "*/token_12_U" "*/offset_12_U" \
    "*/reciprocal12_U" "*/sum01_to23_U" \
    "*/sum23_local_U" "*/completion23_U"]
anchor_group SLR3 "SLR2-to-SLR3 registered boundaries" [list \
    "*/command_23_U" "*/token_23_U" "*/offset_23_U" \
    "*/reciprocal23_U"]

# Completion joins and pairwise reductions are intentionally central.  The
# trailing template digit identifies the {PE0,PE1} or {PE2,PE3} pair for every
# generated group (0/1, 10/11, ..., 220/221).
anchor_group SLR1 "PE0/PE1 joins and reductions" [list \
    "*/int4_join_task_completion_pair_*0_U0" \
    "*/int4_wait_task_completion_pairs_*_U0" \
    "*/int4_reduce_pair_and_route_0_U0" \
    "*/int4_finalize_pair_outputs_0_U0" \
    "*/int4_merge_rms_pair_0_U0" \
    "*/int4_finalize_rms_and_seed_chain_U0"]
anchor_group SLR2 "PE2/PE3 joins and reductions" [list \
    "*/int4_join_task_completion_pair_*1_U0" \
    "*/int4_reduce_pair_and_route_1_U0" \
    "*/int4_finalize_pair_outputs_1_U0" \
    "*/int4_merge_rms_pair_1_U0" \
    "*/int4_relay_rms_reciprocal_2_U0"]

puts "INFO: 300MHz floorplan: DATA_DRIVEN_TASK_ANCHORS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
