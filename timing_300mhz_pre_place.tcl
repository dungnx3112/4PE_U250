# U250 floorplan for four local decoder domains and registered boundaries.
#
# Architectural ownership:
#   PE0 -> SLR0 / DDR0
#   PE1 -> SLR1 / DDR1
#   PE2 -> SLR2 / DDR2
#   PE3 -> SLR3 / DDR3
#
# The local PE, matching AXI adapter and its five scalar configuration FIFOs
# are kept together. Pair services live in the middle SLR of their pair, and
# every inter-pair stream FIFO is placed at its producer. This makes crossings
# explicit one-way registered boundaries instead of allowing a path to leave
# an SLR, visit several others, and return to its original endpoint SLR.

puts "INFO: loading [file normalize [info script]]"

proc get_unique_object {objects description} {
    if {[llength $objects] != 1} {
        error "300MHz floorplan: expected one $description, found [llength $objects]"
    }
    return [lindex $objects 0]
}

proc slr_pblock {slr} {
    return [get_unique_object \
        [get_pblocks -quiet "pblock_dynamic_${slr}"] \
        "platform pblock_dynamic_${slr}"]
}

proc assign_hierarchy_pattern {pattern slr description {mandatory 1}} {
    set objects [get_cells -quiet -hierarchical -filter \
        "NAME =~ $pattern && IS_PRIMITIVE == 0"]
    if {[llength $objects] == 0} {
        if {$mandatory} {
            error "300MHz floorplan: missing $description matching $pattern"
        }
        puts "WARNING: 300MHz floorplan: optional $description not found ($pattern)"
        return
    }
    set pblock [slr_pblock $slr]
    foreach object $objects {
        add_cells_to_pblock $pblock $object
        set_property USER_SLR_ASSIGNMENT $slr $object
        puts "INFO: 300MHz floorplan: $description -> $slr ($object)"
    }
}

proc assign_patterns {patterns slr group_name} {
    foreach pattern $patterns {
        assign_hierarchy_pattern $pattern $slr "$group_name / $pattern"
    }
}

# Complete local compute roots, AXI adapters and per-PE launch/config FIFOs.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    assign_hierarchy_pattern \
        "*/int4_decoder_local_pe_${pe}_U0" $slr "PE${pe} compute root"
    assign_hierarchy_pattern \
        "*/gmem${pe}_m_axi_U" $slr "PE${pe} AXI adapter"
    foreach config_name [list \
            "model_bank${pe}_c_U" "rope_lut_pe${pe}_c_U" \
            "residual_pe${pe}_c_U" "logits_pe${pe}_c_U" \
            "kv_cache_pe${pe}_c_U"] {
        assign_hierarchy_pattern \
            "*/${config_name}" $slr "PE${pe} config FIFO ${config_name}"
    }
}

# Position command travels SLR0 -> SLR1 -> SLR2 -> SLR3 through depth-2 FIFOs.
assign_patterns [list \
    "*/int4_seed_position_chain_U0" \
    "*/position_pe0_U" \
    "*/position_01_U"] SLR0 "position stage 0"
assign_patterns [list \
    "*/int4_relay_position_1_U0" \
    "*/position_pe1_U" \
    "*/position_12_U"] SLR1 "position stage 1"
assign_patterns [list \
    "*/int4_relay_position_2_U0" \
    "*/position_pe2_U" \
    "*/position_23_U"] SLR2 "position stage 2"
assign_patterns [list \
    "*/int4_terminate_position_chain_U0" \
    "*/position_pe3_U"] SLR3 "position stage 3"

# PE0/PE1 pair services. Cross-pair FIFOs stay with their producer in SLR1.
assign_patterns [list \
    "*/int4_rms_pair01_schedule_U0" \
    "*/rms_partial0_U" "*/rms_partial1_U" \
    "*/rms_reciprocal0_U" "*/rms_reciprocal1_U" \
    "*/rms_reciprocal01_to23_U" \
    "*/int4_linear_reduce_pair01_schedule_U0" \
    "*/int4_linear_finalize_pair01_schedule_U0" \
    "*/linear_partial0_U" "*/linear_partial1_U" \
    "*/linear_sum01_local_U" "*/linear_sum01_to23_U" \
    "*/linear_output0_U" "*/linear_output1_U" \
    "*/int4_join_task_completion_pair_300_U0" \
    "*/completion0_U" "*/completion1_U" "*/completion01_U"] \
    SLR1 "pair01 domain"

# PE2/PE3 pair services. Reverse-direction FIFOs stay with their SLR2 producer.
assign_patterns [list \
    "*/int4_rms_pair23_schedule_U0" \
    "*/rms_partial2_U" "*/rms_partial3_U" \
    "*/rms_reciprocal2_U" "*/rms_reciprocal3_U" \
    "*/rms_sum23_to01_U" \
    "*/int4_linear_reduce_pair23_schedule_U0" \
    "*/int4_linear_finalize_pair23_schedule_U0" \
    "*/linear_partial2_U" "*/linear_partial3_U" \
    "*/linear_sum23_local_U" "*/linear_sum23_to01_U" \
    "*/linear_output2_U" "*/linear_output3_U" \
    "*/int4_join_task_completion_pair_301_U0" \
    "*/completion2_U" "*/completion3_U" "*/completion23_U"] \
    SLR2 "pair23 domain"

# The final wait receives only two registered pair-completion FIFOs.
assign_hierarchy_pattern \
    "*/int4_wait_task_completion_pairs_300_U0" SLR1 \
    "two-input final completion wait"

# If Vivado preserves the KEEP names from the patched entry process, anchor
# each five-output launch cone beside its PE. The data/config FIFO constraints
# above remain sufficient if synthesis folds or renames these optional nets.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    set launch_nets [get_nets -quiet -hierarchical -filter \
        "NAME =~ */entry_proc*_U0/config_fire_pe${pe}"]
    foreach launch_net $launch_nets {
        set drivers [get_cells -quiet -of_objects \
            [get_pins -quiet -leaf -of_objects $launch_net -filter \
                {DIRECTION == OUT}]]
        foreach driver $drivers {
            set_property USER_SLR_ASSIGNMENT $slr $driver
            add_cells_to_pblock [slr_pblock $slr] $driver
            puts "INFO: 300MHz floorplan: PE${pe} config launch driver -> $slr ($driver)"
        }
    }
}

puts "INFO: 300MHz floorplan: LOCAL_DOMAINS_APPLIED"
puts "INFO: 300MHz floorplan: REGISTERED_BOUNDARIES_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
