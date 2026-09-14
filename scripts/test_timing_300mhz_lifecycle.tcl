set script_dir [file dirname [file normalize [info script]]]
source [file join $script_dir timing_300mhz_domains.tcl]

# Every implementation hook must be syntactically complete and must explicitly
# refresh Vivado objects at its design-step boundary.  This prevents a future
# edit from silently reintroducing cross-step collection reuse.
foreach hook_spec {
    {timing_300mhz_pre_opt.tcl {timing300::refresh pre_opt}}
    {timing_300mhz_pre_place.tcl {timing300::refresh pre_place}}
    {timing_300mhz_pre_physopt.tcl {timing300::rescue_escaped_cells}}
    {timing_300mhz_post_place.tcl {timing300::refresh post_physopt}}
} {
    lassign $hook_spec hook_name required_call
    set hook_path [file join $script_dir $hook_name]
    set handle [open $hook_path r]
    set hook_text [read $handle]
    close $handle
    if {![info complete $hook_text]} {
        error "FAIL: incomplete Tcl syntax in $hook_name"
    }
    if {[string first $required_call $hook_text] < 0} {
        error "FAIL: $hook_name does not contain '$required_call'"
    }
}

set timing_gate_path [file join $script_dir verify_300mhz_routed.tcl]
set handle [open $timing_gate_path r]
set timing_gate_text [read $handle]
close $handle
if {![info complete $timing_gate_text]} {
    error "FAIL: incomplete Tcl syntax in verify_300mhz_routed.tcl"
}
if {[string first {require_numeric_path_slack} $timing_gate_text] < 0} {
    error "FAIL: routed timing gate lacks null/non-numeric path protection"
}

set mock_generation 1
set mock_get_cells_calls 0

proc mock_assert {condition message} {
    if {![uplevel 1 [list expr $condition]]} {
        error "FAIL: $message"
    }
}

proc get_cells {args} {
    global mock_generation mock_get_cells_calls
    incr mock_get_cells_calls
    set joined [join $args " "]

    set object_index [lsearch -exact $args -of_objects]
    if {$object_index >= 0} {
        set object [lindex $args [expr {$object_index + 1}]]
        if {$object eq "null"} {
            error "mock rejected a null -of_objects argument"
        }
        if {$object eq "pin_current"} {
            return "leaf_g${mock_generation}"
        }
        return {}
    }

    if {[string first "NAME =~ */int4_decoder_token_controller_1/inst &&" $joined] >= 0} {
        return "root_g${mock_generation}"
    }
    if {[string first "IS_PRIMITIVE == 1" $joined] >= 0} {
        return "leaf_g${mock_generation}"
    }
    if {[string first "IS_PRIMITIVE == 0" $joined] >= 0} {
        return "hier_g${mock_generation}"
    }

    set requested [lindex $args end]
    if {$requested eq "kernel/leaf"} {
        return "leaf_g${mock_generation}"
    }
    return {}
}

proc get_pblocks {args} {
    global mock_generation
    set requested [lindex $args end]
    return "${requested}_g${mock_generation}"
}

proc get_property {property object} {
    global mock_generation
    if {[regexp {_g([0-9]+)$} $object -> generation] &&
            $generation != $mock_generation} {
        return null
    }
    switch -- $property {
        NAME {
            if {[string match "root_g*" $object]} { return kernel }
            if {[string match "hier_g*" $object]} { return kernel/hier }
            if {[string match "leaf_g*" $object]} { return kernel/leaf }
            return $object
        }
        USER_SLR_ASSIGNMENT {
            if {[string match "leaf_g*" $object]} { return SLR0 }
            return ""
        }
        default { return "" }
    }
}

timing300::initialize
mock_assert {$timing300::kernel_leaves eq "leaf_g1"} \
    "initial generation was not cached"
set timing300::owner(kernel/leaf) SLR0
set timing300::owner(kernel/retired) SLR1

set mock_generation 2
lassign [timing300::refresh lifecycle_test] previous_owners current_owners
mock_assert {$timing300::kernel_leaves eq "leaf_g2"} \
    "refresh retained a stale leaf collection"
mock_assert {$timing300::pblocks(SLR3) eq "pblock_dynamic_SLR3_g2"} \
    "refresh retained a stale pblock handle"
mock_assert {$timing300::owner(kernel/leaf) eq "SLR0"} \
    "refresh lost ownership of a surviving cell name"
mock_assert {![info exists timing300::owner(kernel/retired)]} \
    "refresh retained ownership for a retired cell name"
mock_assert {$previous_owners == 2 && $current_owners == 1} \
    "refresh returned unexpected previous/current ownership counts"

set calls_before_null $mock_get_cells_calls
mock_assert {[timing300::pin_pe_owner null] eq ""} \
    "a null pin was not ignored"
mock_assert {$mock_get_cells_calls == $calls_before_null} \
    "a null pin reached get_cells -of_objects"
mock_assert {[timing300::pin_pe_owner pin_current] eq "0"} \
    "a valid current-generation pin did not resolve through saved ownership"

puts "PASS: Vivado object lifecycle refresh and null-object guards"
