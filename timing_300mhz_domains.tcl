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

# A replicated SRL/register can be named either
#   <real_instance>___<flattened_source_hierarchy>
# or
#   <real_instance>_KPN_<flattened_source_hierarchy>
# by Vivado.  The suffix is provenance only: it may mention PE0 even when the
# actual cell is below PE1.  Never use that suffix to determine SLR ownership.
proc timing300::semantic_segment {segment} {
    set provenance [string length $segment]
    foreach delimiter [list "___" "_KPN_"] {
        set candidate [string first $delimiter $segment]
        if {$candidate >= 0 && $candidate < $provenance} {
            set provenance $candidate
        }
    }
    if {$provenance < [string length $segment]} {
        return [string range $segment 0 [expr {$provenance - 1}]]
    }
    return $segment
}

proc timing300::local_pe_owner {name} {
    foreach raw_segment [split $name /] {
        set segment [semantic_segment $raw_segment]
        # Primary: explicit PE wrapper created by HLS.
        if {[regexp {^int4_decoder_local_pe_([0-3])_U0$} $segment -> pe]} {
            return $pe
        }
        # Secondary: Vivado may flatten a PE-specific engine out of its
        # parent wrapper.  Recognise the PE index from the module name
        # itself so that the ownership guard still works correctly.
        if {[regexp {^int4_(?:stream_local_weights|run_local_pe|compute_local_partials|store_local_output|prepare_local_weight_request|read_local_weights|swiftkv_attention_pe)_?([0-3])_(?:U0|s)$} $segment -> pe]} {
            return $pe
        }
        if {[regexp {^gmem([0-3])_m_axi_U$} $segment -> pe]} {
            return $pe
        }
        if {[regexp {^(?:model_bank|rope_lut_pe|residual_pe|logits_pe|kv_cache_pe)([0-3])_c_U$} $segment -> pe]} {
            return $pe
        }
    }
    return ""
}

proc timing300::slr_for_pe {pe} {
    if {![string is integer -strict $pe] || $pe < 0 || $pe > 3} {
        error "300MHz ownership: invalid PE index '$pe'"
    }
    return "SLR${pe}"
}

proc timing300::object_is_null {value} {
    if {[llength $value] == 0} { return 1 }
    set object [lindex $value 0]
    return [expr {$object eq "" || [string equal -nocase $object "null"]}]
}

proc timing300::pin_pe_owner {pin_value} {
    variable owner
    if {[object_is_null $pin_value]} { return "" }
    set pin [lindex $pin_value 0]
    set cells {}
    if {[catch {set cells [get_cells -quiet -of_objects $pin]}] ||
            [llength $cells] != 1 || [object_is_null $cells]} {
        return ""
    }
    set cell_name ""
    if {[catch {set cell_name [get_property NAME [lindex $cells 0]]}] ||
            $cell_name eq ""} {
        return ""
    }
    set pe [local_pe_owner $cell_name]
    if {$pe ne ""} { return $pe }
    if {[info exists owner($cell_name)] &&
            [regexp {^SLR([0-3])$} $owner($cell_name) -> pe]} {
        return $pe
    }
    return ""
}

proc timing300::name_matches_pattern {name pattern {expected_pe ""}} {
    # The explicit destination hierarchy is authoritative.  This guard also
    # protects ownership if a future Vivado release uses another replication
    # suffix spelling which has not yet been added to semantic_segment.
    if {$expected_pe ne ""} {
        set actual_pe [local_pe_owner $name]
        if {$actual_pe ne "" && $actual_pe ne $expected_pe} {
            return 0
        }
    }
    foreach raw_segment [split $name /] {
        if {[string match $pattern [semantic_segment $raw_segment]]} {
            return 1
        }
    }
    return 0
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
    # Critical-cone closure records its assignments on promoted primitive
    # cells.  Re-seed those assignments whenever another implementation hook
    # reloads this library so rescue/verification covers the same cells.
    foreach leaf $kernel_leaves {
        if {[object_is_null $leaf]} { continue }
        set assigned ""
        catch {set assigned [get_property USER_SLR_ASSIGNMENT $leaf]}
        if {[regexp {^SLR[0-3]$} $assigned]} {
            set leaf_name ""
            catch {set leaf_name [get_property NAME $leaf]}
            if {$leaf_name ne ""} {
                set owner($leaf_name) $assigned
            }
        }
    }
    # add_cells_to_pblock does not guarantee that every primitive receives a
    # USER_SLR_ASSIGNMENT property. Recover ownership from the four live
    # pblock memberships as a bulk query, never from handles cached by an
    # earlier implementation step.
    foreach slr {SLR0 SLR1 SLR2 SLR3} {
        set members {}
        catch {set members [get_cells -quiet -of_objects $pblocks($slr) -filter {
            IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND}]}
        foreach leaf $members {
            if {[object_is_null $leaf]} { continue }
            set leaf_name ""
            catch {set leaf_name [get_property NAME $leaf]}
            if {$leaf_name eq "" ||
                    ![string match "${kernel_name}/*" $leaf_name]} {
                continue
            }
            if {[info exists owner($leaf_name)] && $owner($leaf_name) ne $slr} {
                error "300MHz ownership: live pblock conflict for $leaf_name ($owner($leaf_name) versus $slr)"
            }
            set owner($leaf_name) $slr
        }
    }
    set initialized 1
    puts "INFO: 300MHz ownership: cached [llength $kernel_hier] hierarchy cells and [llength $kernel_leaves] leaf primitives"
}

# Vivado collections are process-local object handles, not durable names.
# opt_design/place_design/phys_opt_design may invalidate a previously cached
# handle even when a logically equivalent cell survives.  Refresh all object
# collections at every implementation-step boundary. Ownership is rebuilt from
# current USER_SLR_ASSIGNMENT properties and current pblock membership; no
# object or per-cell lookup from an earlier design generation is dereferenced.
proc timing300::refresh {{phase "unspecified"}} {
    variable initialized
    variable owner
    variable kernel_hier
    variable kernel_leaves
    variable pblocks

    set previous_owner_count 0
    if {[array exists owner]} { set previous_owner_count [array size owner] }

    set initialized 0
    initialize

    foreach slr {SLR0 SLR1 SLR2 SLR3} {
        if {![info exists pblocks($slr)] || [object_is_null $pblocks($slr)]} {
            error "300MHz ownership refresh '$phase': pblock handle for $slr is null"
        }
    }
    if {[llength $kernel_hier] == 0 || [llength $kernel_leaves] == 0} {
        error "300MHz ownership refresh '$phase': refreshed kernel collection is empty"
    }

    set current_owner_count [array size owner]
    puts "INFO: 300MHz ownership: OBJECT_CACHE_REFRESHED phase=$phase previous_owners=$previous_owner_count current_owners=$current_owner_count hierarchy=[llength $kernel_hier] leaves=[llength $kernel_leaves]"
    return [list $previous_owner_count $current_owner_count]
}

# Close the physical ownership of timing cones whose sequential endpoints both
# belong to the same PE.  This deliberately uses timing connectivity rather
# than hierarchy names: opt_design can promote LUT/CARRY/MUX primitives to the
# kernel root and erase the PE marker that the ordinary selectors rely on.
proc timing300::claim_same_owner_critical_cones {max_paths report_path} {
    variable kernel_name
    variable pblocks
    variable owner
    initialize

    if {![string is integer -strict $max_paths] || $max_paths <= 0} {
        error "300MHz critical-cone closure: max_paths must be positive"
    }

    array set claimed {SLR0 {} SLR1 {} SLR2 {} SLR3 {}}
    set inspected 0
    set same_owner_paths 0
    set claimed_points 0
    set conflicts 0
    set paths {}
    if {[catch {set paths [get_timing_paths -quiet -delay_type max \
            -max_paths $max_paths -nworst 1]} message]} {
        error "300MHz critical-cone closure could not query $max_paths timing paths: $message"
    }
    if {[llength $paths] == 0} {
        error "300MHz critical-cone closure obtained no max-delay timing paths"
    }
    foreach path $paths {
        if {[object_is_null $path]} { continue }
        incr inspected
        set start_pin ""
        set end_pin ""
        catch {set start_pin [get_property STARTPOINT_PIN $path]}
        catch {set end_pin [get_property ENDPOINT_PIN $path]}
        set start_pe [pin_pe_owner $start_pin]
        set end_pe [pin_pe_owner $end_pin]
        if {$start_pe eq "" || $start_pe ne $end_pe} { continue }
        incr same_owner_paths
        set expected_slr [slr_for_pe $start_pe]

        set points ""
        catch {set points [get_property PATH $path]}
        if {[llength $points] == 0} {
            catch {set points [get_pins -quiet -of_objects $path]}
        }
        foreach point $points {
            if {[object_is_null $point]} { continue }
            set pin ""
            catch {set pin [get_property PIN $point]}
            if {$pin eq ""} { set pin $point }
            if {[object_is_null $pin]} { continue }
            set cells {}
            if {[catch {set cells [get_cells -quiet -of_objects $pin -filter {
                    IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND}]}]} {
                continue
            }
            foreach cell $cells {
                if {[object_is_null $cell]} { continue }
                set cell_name ""
                if {[catch {set cell_name [get_property NAME $cell]}] ||
                        $cell_name eq ""} {
                    continue
                }
                if {![string match "${kernel_name}/*" $cell_name]} { continue }

                set explicit_pe [local_pe_owner $cell_name]
                if {$explicit_pe ne "" && $explicit_pe ne $start_pe} {
                    incr conflicts
                    continue
                }
                if {[info exists owner($cell_name)] &&
                        $owner($cell_name) ne $expected_slr} {
                    incr conflicts
                    continue
                }

                set owner($cell_name) $expected_slr
                dict set claimed($expected_slr) $cell_name $cell
                catch {set_property USER_SLR_ASSIGNMENT $expected_slr $cell}
                incr claimed_points
            }
        }
    }

    set unique_claims 0
    foreach slr {SLR0 SLR1 SLR2 SLR3} {
        set cells [dict values $claimed($slr)]
        if {[llength $cells] == 0} { continue }
        add_cells_to_pblock $pblocks($slr) $cells
        incr unique_claims [llength $cells]
        puts "INFO: 300MHz critical-cone closure: $slr claimed [llength $cells] primitives"
    }

    set report [open $report_path w]
    puts $report "metric,value"
    puts $report "paths_inspected,$inspected"
    puts $report "same_owner_paths,$same_owner_paths"
    puts $report "unique_primitive_claims,$unique_claims"
    puts $report "path_point_claims,$claimed_points"
    puts $report "ownership_conflicts_skipped,$conflicts"
    close $report

    if {$same_owner_paths == 0 || $unique_claims == 0} {
        error "300MHz critical-cone closure found no same-PE timing cones"
    }
    puts "INFO: 300MHz critical-cone closure: CRITICAL_CONES_CLAIMED paths=$same_owner_paths primitives=$unique_claims conflicts=$conflicts"
    return [list $same_owner_paths $unique_claims $conflicts]
}

proc timing300::match_patterns {patterns primitive {expected_pe ""}} {
    variable kernel_name
    variable kernel_hier
    variable kernel_leaves
    variable pattern_hier_cache
    variable pattern_leaf_cache
    if {$primitive} { set universe $kernel_leaves } else { set universe $kernel_hier }
    set matches {}
    foreach pattern $patterns {
        set cache_key [list $expected_pe $pattern]
        if {$primitive && [info exists pattern_leaf_cache($cache_key)]} {
            set matches [concat $matches $pattern_leaf_cache($cache_key)]
            continue
        }
        if {!$primitive && [info exists pattern_hier_cache($cache_key)]} {
            set matches [concat $matches $pattern_hier_cache($cache_key)]
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
            if {[name_matches_pattern $name $pattern $expected_pe]} {
                lappend resolved $object
            }
        }
        set resolved [unique $resolved]
        if {$primitive} {
            set pattern_leaf_cache($cache_key) $resolved
        } else {
            set pattern_hier_cache($cache_key) $resolved
        }
        set matches [concat $matches $resolved]
    }
    return [unique $matches]
}

proc timing300::discover_group {slr description patterns mandatory} {
    variable owner
    set expected_pe ""
    regexp {^PE([0-3]) } $description -> expected_pe
    set hierarchy [match_patterns $patterns 0 $expected_pe]
    set leaves [match_patterns $patterns 1 $expected_pe]
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
            "*kv_cache_pe${pe}_c_U*" \
            "*ap_start_pe${pe}*"]]
    }

    # The integrated design has one PE0 SwiftKV instance whose arithmetic is
    # promoted directly below the kernel root by opt_design.  The expected-PE
    # guard prevents these patterns from stealing explicitly named PE1..PE3
    # descendants while still claiming the name-less promoted PE0 primitives.
    lappend specs [list SLR0 "PE0 promoted SwiftKV critical arithmetic" 1 [list \
        "*grp_swiftkv_quantize_kv_record*" \
        "*grp_swiftkv_update_values_and_quantize*" \
        "*grp_swiftkv_write_buffered_kv_record3*"]]

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

# Re-constrain cells that have been created or moved by phys_opt_design
# outside their assigned SLR pblock.  Call from the phys_opt pre-hook.
proc timing300::rescue_escaped_cells {} {
    variable pblocks
    variable owner
    variable kernel_leaves

    # Re-acquire every Vivado handle after placement while retaining ownership
    # by stable cell name.  Never carry cached Tcl objects across design steps.
    refresh pre_physopt

    # Re-discover ownership from the current netlist.
    foreach spec [domain_specs] {
        lassign $spec slr description mandatory patterns
        set expected_pe ""
        regexp {^PE([0-3]) } $description -> expected_pe
        set leaves [match_patterns [lindex $spec 3] 1 $expected_pe]
        foreach leaf $leaves {
            set lname [get_property NAME $leaf]
            if {![info exists owner($lname)]} {
                set owner($lname) $slr
            }
        }
    }

    set rescued 0
    foreach leaf_name [array names owner] {
        set expected_slr $owner($leaf_name)
        set leaf_obj [get_cells -quiet $leaf_name]
        if {[llength $leaf_obj] != 1} { continue }
        set actual [cell_slr [lindex $leaf_obj 0]]
        if {$actual eq $expected_slr} { continue }
        # Cell is in the wrong SLR — add it to the correct pblock.
        add_cells_to_pblock $pblocks($expected_slr) [lindex $leaf_obj 0]
        incr rescued
    }
    puts "INFO: 300MHz rescue: re-constrained $rescued cells to their assigned SLR pblocks"
    return $rescued
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
    # Connectivity-derived promoted cells do not necessarily match a stable
    # hierarchy selector. Verify every remembered owner as well as each named
    # domain so a same-SLR endpoint detour cannot escape this gate.
    foreach leaf_name [array names owner] {
        set leaf [get_cells -quiet $leaf_name]
        if {[llength $leaf] != 1} { continue }
        set expected $owner($leaf_name)
        set actual [cell_slr [lindex $leaf 0]]
        if {$actual ne $expected && ![info exists wrong_owner($leaf_name)]} {
            set wrong_owner($leaf_name) 1
            if {[array size wrong_owner] <= $wrong_report_limit} {
                puts $report "WRONG,$expected,$actual,connectivity-derived critical cone,$leaf_name"
            }
        }
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
