# Minimal U250 floorplan for the four heavy linear-processing elements.
#
# Keep only the architectural ownership that the implementation tools cannot
# infer from connectivity alone:
#   PE0 -> SLR0 / DDR0
#   PE1 -> SLR1 / DDR1
#   PE2 -> SLR2 / DDR2
#   PE3 -> SLR3 / DDR3
#
# Each int4_run_local_pe_* hierarchy already contains its local command split,
# weight reader, compute pipeline and AXI-facing logic. Do not separately
# anchor descendants, memories, boundary FIFOs, joins or reductions. Leaving
# those cells unconstrained gives SSI_BalanceSLLs and phys_opt_design freedom to
# place them at the best side of each SLR crossing.

puts "INFO: loading [file normalize [info script]]"

proc get_unique_object {objects description} {
    if {[llength $objects] != 1} {
        error "300MHz floorplan: expected one $description, found [llength $objects]"
    }
    return [lindex $objects 0]
}

foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    set pe_pattern "*/int4_run_local_pe_${pe}_U0"
    set pe_root [get_unique_object \
        [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pe_pattern && IS_PRIMITIVE == 0"] \
        "PE${pe} hierarchy matching $pe_pattern"]
    set pblock [get_unique_object \
        [get_pblocks -quiet "pblock_dynamic_${slr}"] \
        "platform pblock_dynamic_${slr}"]

    add_cells_to_pblock $pblock $pe_root
    set_property USER_SLR_ASSIGNMENT $slr $pe_root
    puts "INFO: 300MHz floorplan: PE${pe} root -> $slr ($pe_root)"
}

puts "INFO: 300MHz floorplan: PE_ROOTS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
