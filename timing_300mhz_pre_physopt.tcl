# Targeted post-place optimization for the remaining top-level HLS control
# cones.  The data-driven KPN removes cross-SLR worker ap_done fan-in, but HLS
# still emits a small top scheduler that gates shared RAM/AXI ports with
# mode_reg/ap_CS_fsm/ap_sync state.  Replicate those drivers after placement,
# when Vivado knows the physical load clusters in each SLR, then explicitly
# optimize BRAM enables and SLR crossings before the normal implementation
# strategy runs its full phys_opt_design pass.

puts "INFO: loading [file normalize [info script]]"

set kernel_control_patterns [list \
    "*mode_reg_*" \
    "*ap_CS_fsm*" \
    "*ap_sync_reg_*" \
    "*ap_block_state*"]

set candidate_nets {}
set kernel_control_root "int4_decoder_token_controller_1/inst/"
foreach pattern $kernel_control_patterns {
    foreach net [get_nets -quiet -hierarchical $pattern] {
        # Vivado's hierarchical glob matching does not treat '*' as a generic
        # recursive pathname wildcard when '/' is embedded in the pattern.
        # Select on the basename first, then restrict the result to this kernel.
        set root_index [string first $kernel_control_root $net]
        if {$root_index >= 0} {
            set tail_index [expr {$root_index + [string length $kernel_control_root]}]
            set control_basename [string range $net $tail_index end]
        } else {
            set control_basename ""
        }
        # Only replicate direct children of the top HLS scheduler.  Nested KPN
        # workers already own local control and must not be replicated en masse.
        if {$control_basename ne "" && [string first "/" $control_basename] < 0} {
            lappend candidate_nets $net
        }
    }
}
set candidate_nets [lsort -unique $candidate_nets]

set replication_nets {}
foreach net $candidate_nets {
    set drivers [get_pins -quiet -leaf -of_objects $net \
        -filter {DIRECTION == OUT}]
    set loads [get_pins -quiet -leaf -of_objects $net \
        -filter {DIRECTION == IN}]

    # Replication is useful only for a single-driver control net with enough
    # placed loads to form multiple physical clusters.  This excludes aliases,
    # constants and already-local point-to-point nets without relying on an
    # unstable synthesized replica suffix.
    if {[llength $drivers] == 1 && [llength $loads] >= 8} {
        lappend replication_nets $net
    }
}

if {[llength $replication_nets] == 0} {
    error "300MHz control physopt: no eligible top-level control nets were found"
}

puts "INFO: 300MHz control physopt: forcing placement-aware replication on [llength $replication_nets] nets"
phys_opt_design -force_replication_on_nets $replication_nets

# These options directly cover the two residual path families observed in the
# old routed DCP: top FSM/mode logic to BRAM CE/WE/address pins and long control
# nets crossing SLRs.  The following configured AggressiveExplore step remains
# enabled and therefore performs an additional independent optimization pass.
phys_opt_design \
    -bram_enable_opt \
    -fanout_opt \
    -critical_cell_opt \
    -placement_opt

# Vivado 2023.2 requires TNS cleanup to be paired exclusively with the SLR
# crossing pass; combining unrelated directives in this invocation is rejected
# even when -slr_crossing_opt is present.
phys_opt_design -slr_crossing_opt -tns_cleanup

puts "INFO: 300MHz control physopt: CONTROL_MEMORY_PATH_OPT_APPLIED"
