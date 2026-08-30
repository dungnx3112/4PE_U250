# Mandatory U250 floorplan for the independent 4-PE architecture.
# PE n owns SLR n, DDR n, all local memories and all local compute.  Only
# registered scalar commands and 128-bit reduction packets cross SLRs.

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

proc platform_slr_pblock {slr} {
    set pblock [get_pblocks -quiet "pblock_dynamic_${slr}"]
    if {[llength $pblock] != 1} {
        error "300MHz floorplan: pblock_dynamic_${slr} was not found uniquely"
    }
    set is_soft [get_property IS_SOFT $pblock]
    if {$is_soft ni {0 false FALSE}} {
        error "300MHz floorplan: pblock_dynamic_${slr} must be hard"
    }
    return $pblock
}

proc anchor_required {slr label patterns} {
    foreach pattern $patterns {
        set pattern_matches [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]
        if {[llength $pattern_matches] == 0} {
            error "300MHz floorplan: required $label pattern '$pattern' was not found"
        }
    }
    set roots [find_hierarchy_roots $patterns]
    if {[llength $roots] == 0} {
        error "300MHz floorplan: required $label hierarchy was not found"
    }
    set pblock [platform_slr_pblock $slr]
    set pblock_name [get_property NAME $pblock]
    add_cells_to_pblock $pblock $roots
    set_property USER_SLR_ASSIGNMENT $slr $roots
    foreach root $roots {
        set name [get_property NAME $root]
        if {[get_property USER_SLR_ASSIGNMENT $root] ne $slr} {
            error "300MHz floorplan: $name rejected USER_SLR_ASSIGNMENT=$slr"
        }
        if {[lsearch -exact [get_pblocks -quiet -of_objects $root] $pblock_name] < 0} {
            error "300MHz floorplan: $name did not enter $pblock_name"
        }
    }
    puts "INFO: 300MHz floorplan: $label -> $slr ([llength $roots] roots)"
    return $roots
}

# The outer 4-way DATAFLOW wrappers remain soft.  Their PE-local children are
# hard anchored, so HLS ap_start/ap_done glue is free to sit near its endpoint
# instead of dragging an entire four-SLR hierarchy into one pblock.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    anchor_required $slr "PE${pe} AXI master" [list \
        "*gmem${pe}_m_axi_U"]

    anchor_required $slr "PE${pe} persistent/local memories" [list \
        "*scale_cache${pe}_U" \
        "*norm_cache${pe}_U" \
        "*residual${pe}_U" \
        "*projection${pe}_U" \
        "*q${pe}_U" "*k${pe}_U" "*v${pe}_U" \
        "*gate${pe}_U" \
        "*activation_q${pe}_U" \
        "*activation_scale${pe}_U"]

    anchor_required $slr "PE${pe} time-shared linear data plane" [list \
        "*/int4_run_local_pe_${pe}_U0" \
        "*/int4_store_local_output_${pe}_U0"]

    anchor_required $slr "PE${pe} SwiftKV data plane" [list \
        "*/int4_run_local_attention_commanded_${pe}_U0"]

    anchor_required $slr "PE${pe} RMS/SwiGLU/residual data plane" [list \
        "*/int4_local_sumsq_${pe}_U0" \
        "*/int4_local_rms_normalize_quantize_${pe}_U0" \
        "*/int4_local_swiglu_quantize_commanded_${pe}_U0" \
        "*/int4_local_residual_add_commanded_${pe}_U0"]

    anchor_required $slr "PE${pe} local DDR and scratch clients" [list \
        "*/int4_preload_local_metadata_commanded_${pe}_U0" \
        "*/int4_load_local_residual_commanded_${pe}_U0" \
        "*/int4_store_local_residual_commanded_${pe}_U0" \
        "*/int4_save_local_projection_commanded_${pe}_U0" \
        "*/int4_store_local_logits_commanded_${pe}_U0"]
}

# Linear reduction islands.  Pair01 lives in SLR1 and pair23 in SLR2.  The
# endpoints guarantee that the only data crossing a boundary is a registered
# 128-bit packet; there is no global 512-bit output bus.
anchor_required SLR0 "linear command source" [list \
    "*/int4_seed_linear_command_chain_U0"]
anchor_required SLR1 "linear pair01 island" [list \
    "*/int4_relay_pair_linear_command_0_U0" \
    "*/int4_reduce_pair_and_route_0_U0" \
    "*/int4_finalize_pair_outputs_0_U0"]
anchor_required SLR2 "linear pair23 island" [list \
    "*/int4_relay_pair_linear_command_1_U0" \
    "*/int4_reduce_pair_and_route_1_U0" \
    "*/int4_finalize_pair_outputs_1_U0"]
anchor_required SLR3 "linear command sink" [list \
    "*/int4_terminate_linear_command_U0"]

# RMS reduction moves only one FP32 partial and one FP32 reciprocal between
# neighboring SLRs.
anchor_required SLR1 "RMS pair01/finalize island" [list \
    "*/int4_merge_rms_pair_0_U0" \
    "*/int4_finalize_rms_and_seed_chain_U0"]
anchor_required SLR2 "RMS pair23/relay island" [list \
    "*/int4_merge_rms_pair_1_U0" \
    "*/int4_relay_rms_reciprocal_2_U0"]
anchor_required SLR3 "RMS reciprocal sink" [list \
    "*/int4_terminate_rms_reciprocal_U0"]

# Attention and projection commands are narrow registered chains.  Their
# local consumers are included in the PE roots above.
anchor_required SLR0 "attention/projection command sources" [list \
    "*/int4_seed_attention_command_chain_U0" \
    "*/int4_seed_projection_command_chain_U0" \
    "*/int4_seed_controller_token_chain*_U0" \
    "*/int4_seed_block_token_chain*_U0"]
anchor_required SLR1 "attention/projection command relays PE1" [list \
    "*/int4_relay_attention_command_1_U0" \
    "*/int4_relay_projection_command_1_U0" \
    "*/int4_relay_controller_token_1*_U0" \
    "*/int4_relay_block_token_1*_U0"]
anchor_required SLR2 "attention/projection command relays PE2" [list \
    "*/int4_relay_attention_command_2_U0" \
    "*/int4_relay_projection_command_2_U0" \
    "*/int4_relay_controller_token_2*_U0" \
    "*/int4_relay_block_token_2*_U0"]
anchor_required SLR3 "attention/projection command sinks" [list \
    "*/int4_terminate_attention_command_U0" \
    "*/int4_terminate_projection_command_U0" \
    "*/int4_terminate_controller_token*_U0" \
    "*/int4_terminate_block_token*_U0"]

# The host control endpoint is small and stays beside PE0.  It does not own
# or select any PE-local data plane.
anchor_required SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

puts "INFO: 300MHz floorplan: PAIR_LOCAL_APPLIED"
puts "INFO: 300MHz floorplan: LOCAL_DATA_PLANE_APPLIED"
puts "INFO: 300MHz floorplan: HARD_ANCHORS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
