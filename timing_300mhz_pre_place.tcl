# Minimal U250 floorplan for the timing-critical AXI interfaces and only the
# small HLS read/write bridges directly connected to them.  Arithmetic,
# attention state, projection memories and reducers remain timing-driven.

puts "INFO: loading [file normalize [info script]]"

proc place_axi_interface {instance slr} {
    set pattern "*/int4_decoder_token_controller_1/inst/${instance}"
    set root [get_cells -quiet -hierarchical -filter \
        "NAME =~ $pattern && IS_PRIMITIVE == 0"]
    if {[llength $root] != 1} {
        error "300MHz floorplan: expected one $instance root, found [llength $root]"
    }

    set root_name [get_property NAME $root]
    set leaves [get_cells -quiet -hierarchical -filter \
        "NAME =~ ${root_name}/* && IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND"]
    if {[llength $leaves] == 0} {
        error "300MHz floorplan: $instance has no leaf primitives"
    }

    set pblock [get_pblocks -quiet "pblock_dynamic_${slr}"]
    if {[llength $pblock] != 1} {
        error "300MHz floorplan: expected one pblock_dynamic_${slr}"
    }

    set_property USER_SLR_ASSIGNMENT $slr $root
    add_cells_to_pblock $pblock $leaves
    puts "INFO: 300MHz floorplan: $instance -> $slr ([llength $leaves] leaves)"
}

proc place_pe_axi_bridges {pe slr} {
    set pe_pattern \
        "*/int4_decoder_token_controller_1/inst/*/int4_decoder_local_pe_${pe}_U0"
    set pe_root [get_cells -quiet -hierarchical -filter \
        "NAME =~ $pe_pattern && IS_PRIMITIVE == 0"]
    if {[llength $pe_root] != 1} {
        error "300MHz floorplan: expected one PE${pe} root, found [llength $pe_root]"
    }

    set pe_name [get_property NAME [lindex $pe_root 0]]
    set selectors [list \
        "*int4_read_local_weights_${pe}_U0*" \
        "*weight_ingress_U*" \
        "*int4_buffer_local_weights_${pe}_U0*" \
        "*weight_buffer_U*" \
        "*int4_preload_local_metadata_${pe}_s*" \
        "*int4_load_local_residual_${pe}_s*" \
        "*int4_store_local_residual_${pe}_s*" \
        "*int4_store_local_logits_${pe}_s*" \
        "*swiftkv_read_compressed_kv_cache*" \
        "*swiftkv_write_buffered_kv_record*"]

    set bridge_roots {}
    set bridge_leaves {}
    foreach selector $selectors {
        set pattern "${pe_name}/${selector}"
        set roots [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]
        set leaves [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND"]
        if {[llength $leaves] == 0} {
            error "300MHz floorplan: PE${pe} AXI bridge selector '$selector' matched no leaves"
        }
        set bridge_roots [concat $bridge_roots $roots]
        set bridge_leaves [concat $bridge_leaves $leaves]
        puts "INFO: 300MHz floorplan: PE${pe} selector '$selector' -> $slr ([llength $leaves] leaves)"
    }

    # Some HLS AXI handshakes are re-driven by small mux/enable cells in parent
    # wrappers (notably swiftkv_run_bank).  Constrain only those primitive
    # drivers; constraining the complete attention/run-bank hierarchy would
    # recreate the whole-PE pblock congestion that this floorplan avoids.
    set handshake_driver_leaves {}
    foreach signal {ARVALID ARREADY RREADY WVALID} {
        set handshake_nets [get_nets -quiet -hierarchical -filter \
            "NAME =~ ${pe_name}/*m_axi_gmem${pe}_${signal}*"]
        foreach net $handshake_nets {
            set driver_pins [get_pins -quiet -of_objects $net -filter \
                {DIRECTION == OUT}]
            set driver_cells [get_cells -quiet -of_objects $driver_pins -filter \
                {IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND}]
            set handshake_driver_leaves [concat \
                $handshake_driver_leaves $driver_cells]
        }
    }
    set handshake_driver_leaves [lsort -unique $handshake_driver_leaves]
    if {[llength $handshake_driver_leaves] == 0} {
        error "300MHz floorplan: PE${pe} AXI handshake driver search matched no primitive cells"
    }
    set bridge_leaves [concat $bridge_leaves $handshake_driver_leaves]
    puts "INFO: 300MHz floorplan: PE${pe} AXI handshake drivers -> $slr ([llength $handshake_driver_leaves] leaves)"

    set bridge_roots [lsort -unique $bridge_roots]
    set bridge_leaves [lsort -unique $bridge_leaves]
    set pblock [get_pblocks -quiet "pblock_dynamic_${slr}"]
    if {[llength $pblock] != 1} {
        error "300MHz floorplan: expected one pblock_dynamic_${slr}"
    }
    if {[llength $bridge_roots] > 0} {
        set_property USER_SLR_ASSIGNMENT $slr $bridge_roots
    }
    add_cells_to_pblock $pblock $bridge_leaves
    puts "INFO: 300MHz floorplan: PE${pe} AXI bridges -> $slr ([llength $bridge_leaves] unique leaves)"
}

place_axi_interface gmem0_m_axi_U SLR0
place_axi_interface gmem1_m_axi_U SLR1
place_axi_interface gmem2_m_axi_U SLR2
place_axi_interface gmem3_m_axi_U SLR3
place_axi_interface control_s_axi_U SLR0


proc place_pe_core {pe slr} {
    set pe_pattern "*/int4_decoder_token_controller_1/inst/*/int4_decoder_local_pe_${pe}_U0"
    set leaves [get_cells -quiet -hierarchical -filter "NAME =~ $pe_pattern/* && IS_PRIMITIVE == 1 && REF_NAME != VCC && REF_NAME != GND"]
    set pblock [get_pblocks -quiet "pblock_dynamic_$slr"]
    
    if {[llength $pblock] == 1 && [llength $leaves] > 0} {
        add_cells_to_pblock $pblock $leaves
        puts "INFO: 300MHz floorplan: PE$pe CORE -> $slr ([llength $leaves] leaves)"
    }
}

foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    place_pe_axi_bridges $pe $slr
    place_pe_core $pe $slr
}

# Re-apply the shared ownership model after opt_design, then close the
# timing-critical combinational cones by connectivity.  The latter is what
# captures promoted LUT/CARRY/MUX cells whose optimized names no longer carry
# int4_decoder_local_pe_N_U0.
set timing_script_directory [file dirname [file normalize [info script]]]
set timing_ownership_script [file join $timing_script_directory timing_300mhz_domains.tcl]
if {![file exists $timing_ownership_script]} {
    error "300MHz floorplan: missing ownership library $timing_ownership_script"
}
if {[llength [info commands timing300::apply_floorplan]] == 0} {
    source $timing_ownership_script
}
timing300::refresh pre_place
puts "INFO: 300MHz floorplan: OBJECT_CACHE_REFRESHED"
timing300::apply_floorplan
set cone_report [file normalize "timing_300mhz_pre_place_cone_ownership.csv"]
# A single 80k timing-path collection can consume several GB on this design.
# The four full PE pblocks already constrain every named PE leaf; this pass is
# only for promoted primitives on the worst connectivity cones. Keep a safe
# default for 24 GB hosts and allow an explicit increase on larger machines.
set cone_path_limit 12000
if {[info exists ::env(TIMING300_CONE_MAX_PATHS)]} {
    set requested_limit $::env(TIMING300_CONE_MAX_PATHS)
    if {![string is integer -strict $requested_limit] ||
            $requested_limit < 1000 || $requested_limit > 80000} {
        error "300MHz floorplan: TIMING300_CONE_MAX_PATHS must be an integer from 1000 through 80000"
    }
    set cone_path_limit $requested_limit
}
puts "INFO: 300MHz floorplan: critical-cone timing path limit=$cone_path_limit"
lassign [timing300::claim_same_owner_critical_cones $cone_path_limit $cone_report] \
    cone_paths cone_primitives cone_conflicts
puts "INFO: 300MHz floorplan: cone_paths=$cone_paths cone_primitives=$cone_primitives cone_conflicts=$cone_conflicts"
puts "INFO: 300MHz floorplan: OWNERSHIP_APPLIED"

puts "INFO: 300MHz floorplan: INTERFACE_LOCALITY_APPLIED"
puts "INFO: 300MHz floorplan: PE_AXI_BRIDGE_LOCALITY_APPLIED"
puts "INFO: 300MHz floorplan: PE_AXI_HANDSHAKE_DRIVERS_APPLIED"

