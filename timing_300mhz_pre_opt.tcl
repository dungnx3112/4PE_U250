# Establish PE/SLR ownership before opt_design can flatten or promote critical
# arithmetic.  Also bound the fanout of the reset/stall networks identified by
# routed STA so opt_design/phys_opt_design are allowed to create local replicas.

puts "INFO: loading [file normalize [info script]]"
set script_directory [file dirname [file normalize [info script]]]
set ownership_script [file join $script_directory timing_300mhz_domains.tcl]
if {![file exists $ownership_script]} {
    error "300MHz pre-opt: missing ownership library $ownership_script"
}
if {[llength [info commands timing300::apply_floorplan]] == 0} {
    source $ownership_script
}

timing300::refresh pre_opt
puts "INFO: 300MHz pre-opt: OBJECT_CACHE_REFRESHED"
timing300::apply_floorplan

set pe_roots {}
foreach pe {0 1 2 3} {
    set roots [get_cells -quiet -hierarchical -filter \
        "NAME =~ */int4_decoder_token_controller_1/inst/*/int4_decoder_local_pe_${pe}_U0 && IS_PRIMITIVE == 0"]
    if {[llength $roots] != 1} {
        error "300MHz pre-opt: expected one PE${pe} root, found [llength $roots]"
    }
    lappend pe_roots [lindex $roots 0]
}
set_property KEEP_HIERARCHY true $pe_roots

set critical_hierarchy [get_cells -quiet -hierarchical -filter {
    IS_PRIMITIVE == 0 &&
    (NAME =~ */grp_swiftkv_quantize_kv_record* ||
     NAME =~ */grp_swiftkv_update_values_and_quantize* ||
     NAME =~ */grp_swiftkv_process_weighted_group* ||
     NAME =~ */grp_swiftkv_normalize_weighted_group* ||
     NAME =~ */grp_swiftkv_quantize_attention_group* ||
     NAME =~ */grp_swiftkv_select_rope_lut_beat* ||
     NAME =~ */grp_int4_prepare_local_group_metadata_Pipeline_local_metadata_output_tile_loop_local* ||
     NAME =~ */grp_int4_accumulate_local_partial_tiles_Pipeline_local_partial_continuous_mac_loop*)}]
if {[llength $critical_hierarchy] == 0} {
    puts "WARNING: 300MHz pre-opt: critical datapath hierarchy was not found; skipping KEEP_HIERARCHY hint"
} else {
    set_property KEEP_HIERARCHY true $critical_hierarchy
}
set linear_mac_hierarchy [get_cells -quiet -hierarchical -filter {
    IS_PRIMITIVE == 0 &&
    (ORIG_REF_NAME =~ *local_partial_continuous_mac_loop* || REF_NAME =~ *local_partial_continuous_mac_loop*)}]
if {[llength $linear_mac_hierarchy] != 4} {
    puts "WARNING: 300MHz pre-opt: expected four linear MAC pipeline cells, found [llength $linear_mac_hierarchy]"
}
set linear_metadata_hierarchy [get_cells -quiet -hierarchical -filter {
    IS_PRIMITIVE == 0 &&
    (ORIG_REF_NAME =~ *local_metadata_output_tile_loop_local* || REF_NAME =~ *local_metadata_output_tile_loop_local*)}]
if {[llength $linear_metadata_hierarchy] != 4} {
    puts "WARNING: 300MHz pre-opt: expected four linear metadata pipeline cells, found [llength $linear_metadata_hierarchy]"
}

array set fanout_limits {
    *ap_rst_n_inv* 256
    *ap_block_pp0_stage0_subdone* 128
    *full_n* 128
    *ap_enable* 128
}
set constrained_nets 0
set kernel_name $timing300::kernel_name
foreach pattern [array names fanout_limits] {
    set nets [get_nets -quiet -hierarchical -filter \
        "NAME =~ ${kernel_name}/* && NAME =~ $pattern"]
    foreach net $nets {
        if {![catch {set_property MAX_FANOUT $fanout_limits($pattern) $net}]} {
            incr constrained_nets
        }
    }
    puts "INFO: 300MHz pre-opt: MAX_FANOUT=$fanout_limits($pattern) pattern='$pattern' nets=[llength $nets]"
}
if {$constrained_nets == 0} {
    puts "WARNING: 300MHz pre-opt: no reset/stall nets accepted optional MAX_FANOUT constraints"
}

# Bound only state nets inside the STA-identified datapath hierarchies.  A
# kernel-wide ap_CS_fsm wildcard would replicate thousands of unrelated local
# controllers and can make SLR congestion worse.
set critical_state_nets 0
set critical_stall_nets 0
set critical_valid_nets 0
foreach critical_cell $critical_hierarchy {
    set critical_name [get_property NAME $critical_cell]
    set state_nets [get_nets -quiet -hierarchical -filter \
        "NAME =~ ${critical_name}/*ap_CS_fsm*"]
    foreach net $state_nets {
        if {![catch {set_property MAX_FANOUT 128 $net}]} {
            incr critical_state_nets
        }
    }
    # The four linear MAC pipelines synthesize ap_block_pp0_stage0_11001 at
    # about 6.1k loads.  The metadata producers can also expose a large FRP
    # control cone.  Limit only the copies below these retained critical cells
    # so opt_design can replicate them locally without a kernel-wide
    # replication/congestion penalty.
    set stall_nets [get_nets -quiet -hierarchical -filter \
        "NAME =~ ${critical_name}/*ap_block_pp0_stage0*"]
    foreach net $stall_nets {
        if {![catch {set_property MAX_FANOUT 128 $net}]} {
            incr critical_stall_nets
        }
    }
    # The 270 MHz routed report also showed the FRP validity chain driving
    # more than 1k clock-enable pins in the metadata producer.  Keep those
    # replicas local to each retained PE pipeline.
    set valid_nets [get_nets -quiet -hierarchical -filter \
        "NAME =~ ${critical_name}/*frp_pipeline_valid*"]
    foreach net $valid_nets {
        if {![catch {set_property MAX_FANOUT 128 $net}]} {
            incr critical_valid_nets
        }
    }
}
if {$critical_stall_nets < 4} {
    error "300MHz pre-opt: expected at least four critical datapath stall nets, constrained=$critical_stall_nets"
}
if {$critical_valid_nets < 4} {
    error "300MHz pre-opt: expected at least four critical FRP validity nets, constrained=$critical_valid_nets"
}
puts "INFO: 300MHz pre-opt: critical datapath state nets constrained=$critical_state_nets MAX_FANOUT=128"
puts "INFO: 300MHz pre-opt: critical datapath stall nets constrained=$critical_stall_nets MAX_FANOUT=128"
puts "INFO: 300MHz pre-opt: critical FRP validity nets constrained=$critical_valid_nets MAX_FANOUT=128"

puts "INFO: 300MHz pre-opt: kept [llength $pe_roots] PE roots and [llength $critical_hierarchy] critical hierarchy cells"
puts "INFO: 300MHz pre-opt: PRE_OPT_OWNERSHIP_APPLIED"
