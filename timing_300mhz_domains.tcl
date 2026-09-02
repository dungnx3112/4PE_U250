# Shared four-SLR ownership model for the decoder kernel.
#
# Vivado may move arithmetic and RAM primitives out of their original HLS
# wrapper during opt_design. Every pattern is therefore resolved both to
# hierarchy cells and directly to leaf primitives.

namespace eval timing300 {
    variable initialized 0
    variable kernel_name ""
    variable kernel_hier {}
    variable kernel_leaves {}
    variable pblocks
    variable owner
    variable wrong_owner
    variable pattern_hier_cache
    variable pattern_leaf_cache
    variable wrong_report_limit 10000
    array set pblocks {}
    array set owner {}
    array set wrong_owner {}
    array set pattern_hier_cache {}
    array set pattern_leaf_cache {}
}

proc timing300::unique {items} {
    if {[llength $items] == 0} { return {} }
    return [lsort -unique $items]
}

proc timing300::initialize {} {
    variable initialized
    variable kernel_name
    variable kernel_hier
    variable kernel_leaves
    variable pblocks
    variable owner
    variable wrong_owner
    variable pattern_hier_cache
    variable pattern_leaf_cache
    if {$initialized} { return }

    set roots [get_cells -quiet -hierarchical -filter {
        NAME =~ */int4_decoder_token_controller_1/inst &&
        IS_PRIMITIVE == 0}]
    if {[llength $roots] != 1} {
        error "300MHz ownership: expected one decoder kernel root, found [llength $roots]"
    }
    set kernel_name [get_property NAME [lindex $roots 0]]
    set kernel_hier [get_cells -quiet -hierarchical -filter \
        "NAME =~ ${kernel_name}/* && IS_PRIMITIVE == 0"]
    # VCC/GND are logical primitive sources with no physical LOC. They are not
    # movable datapath leaves and must not be reported as unplaced SLR escapes.
    set kernel_leaves [get_cells -quiet -hierarchical -filter \
        "NAME =~ ${kernel_name}/* && IS_PRIMITIVE == 1 && \
         REF_NAME != VCC && REF_NAME != GND"]
    if {[llength $kernel_leaves] == 0} {
        error "300MHz ownership: decoder kernel has no leaf primitives"
    }
    foreach slr {SLR0 SLR1 SLR2 SLR3} {
        set found [get_pblocks -quiet "pblock_dynamic_${slr}"]
        if {[llength $found] != 1} {
            error "300MHz ownership: expected one pblock_dynamic_${slr}, found [llength $found]"
        }
        set pblocks($slr) [lindex $found 0]
    }
    array unset owner
    array set owner {}
    array unset wrong_owner
    array set wrong_owner {}
    array unset pattern_hier_cache
    array set pattern_hier_cache {}
    array unset pattern_leaf_cache
    array set pattern_leaf_cache {}
    set initialized 1
    puts "INFO: 300MHz ownership: cached [llength $kernel_hier] hierarchy cells and [llength $kernel_leaves] leaf primitives"
}

proc timing300::match_patterns {patterns primitive} {
    variable kernel_name
    variable kernel_hier
    variable kernel_leaves
    variable pattern_hier_cache
    variable pattern_leaf_cache
    if {$primitive} { set universe $kernel_leaves } else { set universe $kernel_hier }
    set matches {}
    foreach pattern $patterns {
        if {$primitive && [info exists pattern_leaf_cache($pattern)]} {
            set matches [concat $matches $pattern_leaf_cache($pattern)]
            continue
        }
        if {!$primitive && [info exists pattern_hier_cache($pattern)]} {
            set matches [concat $matches $pattern_hier_cache($pattern)]
            continue
        }
        set full_pattern "${kernel_name}/${pattern}"
        set resolved {}
        foreach object [filter $universe "NAME =~ $full_pattern"] {
            # Vivado's NAME glob lets '*' cross hierarchy separators.  A
            # pattern for PE1 could therefore match a PE0 engine nested below
            # an unrelated ..._1_U0 wrapper.  Accept a candidate only when one
            # complete hierarchy segment itself matches the requested HLS
            # instance pattern.
            set name [get_property NAME $object]
            foreach segment [split $name /] {
                if {[string match $pattern $segment]} {
                    lappend resolved $object
                    break
                }
            }
        }
        set resolved [unique $resolved]
        if {$primitive} {
            set pattern_leaf_cache($pattern) $resolved
        } else {
            set pattern_hier_cache($pattern) $resolved
        }
        set matches [concat $matches $resolved]
    }
    return [unique $matches]
}

proc timing300::discover_group {slr description patterns mandatory} {
    variable owner
    set hierarchy [match_patterns $patterns 0]
    set leaves [match_patterns $patterns 1]
    if {[llength $hierarchy] == 0 && [llength $leaves] == 0} {
        if {$mandatory} {
            error "300MHz ownership: missing mandatory group '$description' for $slr"
        }
        puts "WARNING: 300MHz ownership: optional group '$description' not present"
        return [list {} {}]
    }
    if {[llength $leaves] == 0} {
        error "300MHz ownership: group '$description' matched hierarchy but no leaf primitives"
    }
    foreach leaf $leaves {
        set name [get_property NAME $leaf]
        if {[info exists owner($name)] && $owner($name) ne $slr} {
            error "300MHz ownership conflict: $name belongs to $owner($name) and $slr ($description)"
        }
        set owner($name) $slr
    }
    return [list $hierarchy $leaves]
}

proc timing300::claim_group {slr description patterns mandatory} {
    variable pblocks
    lassign [discover_group $slr $description $patterns $mandatory] hierarchy leaves
    if {[llength $leaves] == 0} { return }
    if {[llength $hierarchy] > 0} {
        set_property USER_SLR_ASSIGNMENT $slr $hierarchy
    }
    add_cells_to_pblock $pblocks($slr) $leaves
    puts "INFO: 300MHz floorplan: $description -> $slr ([llength $hierarchy] hierarchy, [llength $leaves] leaves)"
}

proc timing300::cell_slr {cell} {
    set loc [get_property LOC $cell]
    if {$loc eq ""} { return UNPLACED }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] != 1} { return UNKNOWN }
    return [get_property NAME [lindex $slrs 0]]
}

proc timing300::verify_group {slr description patterns mandatory report_handle} {
    variable wrong_owner
    variable wrong_report_limit
    lassign [discover_group $slr $description $patterns $mandatory] hierarchy leaves
    if {[llength $leaves] == 0} { return [list 0 0] }
    set wrong 0
    foreach leaf $leaves {
        set actual [cell_slr $leaf]
        if {$actual ne $slr} {
            incr wrong
            set leaf_name [get_property NAME $leaf]
            set first_occurrence [expr {![info exists wrong_owner($leaf_name)]}]
            set wrong_owner($leaf_name) 1
            if {$first_occurrence && [array size wrong_owner] <= $wrong_report_limit} {
                puts $report_handle "WRONG,$slr,$actual,$description,$leaf_name"
            }
        }
    }
    puts $report_handle "GROUP,$slr,$slr,$description,[llength $leaves]"
    return [list [llength $leaves] $wrong]
}

# Registered bridge wrappers are mandatory when the pre-place hook applies
# their ownership.  Vivado may legally absorb an empty/pass-through bridge
# after placement, so absence of those wrapper names is not itself a routed
# error.  Persistent PE, AXI and config domains must remain discoverable.
proc timing300::routed_mandatory {description mandatory} {
    if {!$mandatory} { return 0 }
    if {[string match "position stage *" $description] ||
            [string match "pair* reductions and completion" $description] ||
            $description eq "final two-input completion wait"} {
        return 0
    }
    return 1
}

# Each record is: expected SLR, description, mandatory flag, name patterns.
proc timing300::domain_specs {} {
    set specs {}
    foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
        # HLS/Vivado can remove the outer scheduler hierarchy while retaining
        # its independently scheduled local engines.  Require at least one
        # stable PE-specific anchor rather than one exact wrapper spelling.
        lappend specs [list $slr "PE${pe} local compute anchor" 1 [list \
            "*int4_decoder_local_pe_${pe}_U0*" \
            "*int4_run_local_pe_${pe}_U0*" \
            "*int4_run_local_attention_commanded_${pe}_U0*" \
            "*int4_preload_local_metadata_commanded_${pe}_U0*" \
            "*int4_preload_local_metadata_${pe}_s*" \
            "*int4_load_local_residual_commanded_${pe}_U0*" \
            "*int4_load_local_residual_${pe}_s*"]]
        lappend specs [list $slr "PE${pe} AXI adapter" 1 [list \
            "*gmem${pe}_m_axi_U*"]]
        lappend specs [list $slr "PE${pe} linear reader/compute" 0 [list \
            "*int4_run_local_pe_${pe}_U0*" \
            "*int4_stream_local_weights_${pe}_U0*" \
            "*int4_prepare_local_weight_request_${pe}_U0*" \
            "*int4_read_local_weights_${pe}_U0*" \
            "*int4_compute_local_partials_${pe}_U0*" \
            "*int4_store_local_output_${pe}_U0*"]]
        lappend specs [list $slr "PE${pe} hoisted local stages" 0 [list \
            "*int4_preload_local_metadata_commanded_${pe}_U0*" \
            "*int4_preload_local_metadata_${pe}_s*" \
            "*int4_load_local_residual_commanded_${pe}_U0*" \
            "*int4_load_local_residual_${pe}_s*" \
            "*int4_store_local_residual_commanded_${pe}_U0*" \
            "*int4_store_local_residual_${pe}_s*" \
            "*int4_store_local_logits_commanded_${pe}_U0*" \
            "*int4_store_local_logits_${pe}_s*" \
            "*int4_run_local_attention_commanded_${pe}_U0*" \
            "*int4_swiftkv_attention_pe${pe}_U0*" \
            "*swiftkv_run_pe_${pe}_U0*"]]
        lappend specs [list $slr "PE${pe} promoted local memories" 0 [list \
            "*linear_stage${pe}_U*" \
            "*model_scale_cache${pe}_U*" \
            "*model_norm_cache${pe}_U*" \
            "*scale_cache${pe}_U*" "*norm_cache${pe}_U*" \
            "*residual_buffer${pe}_U*" "*residual${pe}_U*" \
            "*projection${pe}_U*" \
            "*q_pe${pe}_U*" "*k_pe${pe}_U*" "*v_pe${pe}_U*" \
            "*gate_pe${pe}_U*" "*up_pe${pe}_U*" \
            "*logits_pe${pe}_U*" "*rope_lut_bank${pe}_U*" \
            "*activation_q${pe}_U*" "*activation_scale${pe}_U*"]]
        lappend specs [list $slr "PE${pe} AXI config FIFOs" 1 [list \
            "*model_bank${pe}_c_U*" "*rope_lut_pe${pe}_c_U*" \
            "*residual_pe${pe}_c_U*" "*logits_pe${pe}_c_U*" \
            "*kv_cache_pe${pe}_c_U*"]]
    }

    lappend specs [list SLR0 "position stage 0" 1 [list \
        "*int4_seed_position_chain_U0*" "*position_pe0_U*" "*position_01_U*"]]
    lappend specs [list SLR1 "position stage 1" 1 [list \
        "*int4_relay_position_1_U0*" "*position_pe1_U*" "*position_12_U*"]]
    lappend specs [list SLR2 "position stage 2" 1 [list \
        "*int4_relay_position_2_U0*" "*position_pe2_U*" "*position_23_U*"]]
    lappend specs [list SLR3 "position stage 3" 1 [list \
        "*int4_terminate_position_chain_U0*" "*position_pe3_U*"]]

    lappend specs [list SLR1 "pair01 reductions and completion" 1 [list \
        "*int4_rms_pair01_schedule_U0*" \
        "*rms_partial0_U*" "*rms_partial1_U*" \
        "*rms_reciprocal0_U*" "*rms_reciprocal1_U*" \
        "*rms_reciprocal01_to23_U*" \
        "*int4_linear_reduce_pair01_schedule_U0*" \
        "*int4_linear_finalize_pair01_schedule_U0*" \
        "*linear_partial0_U*" "*linear_partial1_U*" \
        "*linear_sum01_local_U*" "*linear_sum01_to23_U*" \
        "*linear_output0_U*" "*linear_output1_U*" \
        "*int4_join_task_completion_pair_300_U0*" \
        "*completion0_U*" "*completion1_U*" "*completion01_U*"]]
    lappend specs [list SLR2 "pair23 reductions and completion" 1 [list \
        "*int4_rms_pair23_schedule_U0*" \
        "*rms_partial2_U*" "*rms_partial3_U*" \
        "*rms_reciprocal2_U*" "*rms_reciprocal3_U*" \
        "*rms_sum23_to01_U*" \
        "*int4_linear_reduce_pair23_schedule_U0*" \
        "*int4_linear_finalize_pair23_schedule_U0*" \
        "*linear_partial2_U*" "*linear_partial3_U*" \
        "*linear_sum23_local_U*" "*linear_sum23_to01_U*" \
        "*linear_output2_U*" "*linear_output3_U*" \
        "*int4_join_task_completion_pair_301_U0*" \
        "*completion2_U*" "*completion3_U*" "*completion23_U*"]]
    lappend specs [list SLR1 "final two-input completion wait" 1 [list \
        "*int4_wait_task_completion_pairs_300_U0*"]]
    return $specs
}

proc timing300::apply_floorplan {} {
    initialize
    foreach spec [domain_specs] {
        lassign $spec slr description mandatory patterns
        claim_group $slr $description $patterns $mandatory
    }
}

proc timing300::verify_placement {report_path} {
    variable owner
    variable wrong_owner
    variable wrong_report_limit
    initialize
    set report [open $report_path w]
    puts $report "record,expected_slr,actual_slr,group_or_count,cell"
    foreach spec [domain_specs] {
        lassign $spec slr description mandatory patterns
        set must_survive [routed_mandatory $description $mandatory]
        lassign [verify_group $slr $description $patterns $must_survive $report] count bad
    }
    # A leaf can intentionally be covered by a broad PE domain and a narrower
    # local-memory/engine domain. Report unique physical primitives, not the
    # sum of overlapping group memberships.
    set total [array size owner]
    set wrong [array size wrong_owner]
    puts $report "SUMMARY,ALL,ALL,owned_leaves,$total"
    puts $report "SUMMARY,ALL,ALL,wrong_or_unplaced,$wrong"
    puts $report "SUMMARY,ALL,ALL,wrong_rows_capped_at,$wrong_report_limit"
    close $report
    return [list $total $wrong]
}
