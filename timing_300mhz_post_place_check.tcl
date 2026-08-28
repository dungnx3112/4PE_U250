# Post-place guard for the U250 300 MHz floorplan.
# This script deliberately fails implementation when a required kernel
# hierarchy is unplaced or lands outside its assigned SLR.

puts "INFO: loading [file normalize [info script]]"

proc find_required_roots {label patterns} {
    set roots {}
    foreach pattern $patterns {
        set roots [concat $roots [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern"]]
    }
    set roots [lsort -unique $roots]
    if {[llength $roots] == 0} {
        error "300MHz post-place: required $label hierarchy was not found"
    }
    return $roots
}

proc physical_slr {cell} {
    set loc [get_property LOC $cell]
    if {$loc eq ""} {
        return "UNPLACED"
    }
    set slrs [get_slrs -quiet -of_objects [get_sites -quiet $loc]]
    if {[llength $slrs] != 1} {
        return "UNKNOWN"
    }
    return [get_property NAME [lindex $slrs 0]]
}

proc require_physical_slr {slr label patterns} {
    set roots [find_required_roots $label $patterns]
    set primitives {}
    foreach root $roots {
        set root_name [get_property NAME $root]
        if {[get_property IS_PRIMITIVE $root]} {
            lappend primitives $root
        }
        set primitives [concat $primitives [get_cells -quiet -hierarchical \
            -filter "NAME =~ ${root_name}/* && IS_PRIMITIVE"]]
    }
    set primitives [lsort -unique $primitives]
    set placeable_primitives {}
    foreach primitive $primitives {
        set ref_name [get_property REF_NAME $primitive]
        # Constant-source primitives do not receive physical LOCs and therefore
        # must not be treated as cells that escaped an SLR assignment.
        if {$ref_name eq "VCC" || $ref_name eq "GND"} {
            continue
        }
        lappend placeable_primitives $primitive
    }
    set primitives $placeable_primitives
    if {[llength $primitives] == 0} {
        error "300MHz post-place: required $label has no primitive descendants"
    }

    array set count {SLR0 0 SLR1 0 SLR2 0 SLR3 0 UNPLACED 0 UNKNOWN 0}
    set examples {}
    foreach primitive $primitives {
        set actual [physical_slr $primitive]
        if {[info exists count($actual)]} {
            incr count($actual)
        } else {
            incr count(UNKNOWN)
        }
        if {$actual ne $slr && [llength $examples] < 5} {
            lappend examples "[get_property NAME $primitive]=$actual"
        }
    }

    set foreign [expr {[llength $primitives] - $count($slr)}]
    puts "INFO: 300MHz post-place: $label expected=$slr total=[llength $primitives] local=$count($slr) foreign=$foreign"
    if {$foreign != 0} {
        error "300MHz post-place: $label escaped $slr; examples: [join $examples {, }]"
    }
}

# These checks are intentionally architectural rather than utilization based.
# A source change may alter the number of BRAM/URAM instances, but each PE,
# SwiftKV bank, AXI master and the AXI-Lite adapter must retain its SLR owner.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    require_physical_slr $slr "linear PE${pe}" [list \
        "*/int4_run_pe_dataflow_${pe}_U0"]
    require_physical_slr $slr "SwiftKV PE${pe}" [list \
        "*/swiftkv_run_pe_${pe}_U0"]
    require_physical_slr $slr "gmem${pe} AXI master" [list \
        "*gmem${pe}_m_axi_U"]
}

require_physical_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

puts "INFO: 300MHz floorplan: FLOORPLAN_POST_PLACE_VALIDATED"
