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
     NAME =~ */grp_swiftkv_update_values_and_quantize*)}]
if {[llength $critical_hierarchy] == 0} {
    error "300MHz pre-opt: critical SwiftKV hierarchy was not found"
}
set_property KEEP_HIERARCHY true $critical_hierarchy

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
    error "300MHz pre-opt: no reset/stall nets accepted MAX_FANOUT constraints"
}

puts "INFO: 300MHz pre-opt: kept [llength $pe_roots] PE roots and [llength $critical_hierarchy] critical hierarchy cells"
puts "INFO: 300MHz pre-opt: PRE_OPT_OWNERSHIP_APPLIED"
