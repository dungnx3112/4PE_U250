# Minimal U250 floorplan for the five timing-critical AXI interfaces.
# The PE datapaths, memories, FIFOs and reducers remain timing-driven.

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

place_axi_interface gmem0_m_axi_U SLR0
place_axi_interface gmem1_m_axi_U SLR1
place_axi_interface gmem2_m_axi_U SLR2
place_axi_interface gmem3_m_axi_U SLR3
place_axi_interface control_s_axi_U SLR0

puts "INFO: 300MHz floorplan: INTERFACE_LOCALITY_APPLIED"
