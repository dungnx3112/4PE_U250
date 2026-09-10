# Pure-Tcl regression tests for the multi-SLR ownership selectors.
# Run with: tclsh test_timing_300mhz_domains.tcl

set script_dir [file dirname [file normalize [info script]]]
source [file join $script_dir timing_300mhz_domains.tcl]

set failures 0
set checks 0

proc check {condition message} {
    upvar failures failures checks checks
    incr checks
    if {![uplevel 1 [list expr $condition]]} {
        incr failures
        puts stderr "FAIL: $message"
    }
}

proc group_patterns {description} {
    foreach spec [timing300::domain_specs] {
        lassign $spec slr candidate mandatory patterns
        if {$candidate eq $description} {
            return $patterns
        }
    }
    error "No ownership group named '$description'"
}

proc group_is_mandatory {description} {
    foreach spec [timing300::domain_specs] {
        lassign $spec slr candidate mandatory patterns
        if {$candidate eq $description} {
            return $mandatory
        }
    }
    error "No ownership group named '$description'"
}

proc matches_any {name patterns {expected_pe ""}} {
    foreach pattern $patterns {
        if {[timing300::name_matches_pattern $name $pattern $expected_pe]} {
            return 1
        }
    }
    return 0
}

# Reproduce the exact failure mode from Vivado: the real hierarchy is PE1,
# while the primitive's flattened provenance suffix mentions PE0.
set reported_name [join [list \
    root KPN_1255_1_U0 int4_decoder_local_pe_1_U0 \
    grp_int4_local_residual_add_pe1_fu_411 \
    {ap_enable_reg_pp0_iter7_reg_srl6___KPN_1255_1_U0_int4_decoder_local_pe_0_U0_grp_int4_local_swiglu_stage_pe0_fu_370_ap_enable_reg}] /]
check {[matches_any $reported_name [group_patterns "PE1 local compute anchor"] 1]} \
    "reported PE1 cell must belong to PE1"
check {![matches_any $reported_name [group_patterns "PE0 local compute anchor"] 0]} \
    "PE0 text in a provenance suffix must not claim the reported PE1 cell"

# Vivado also emits the same provenance without the triple-underscore marker.
set reported_kpn_name [join [list \
    root KPN_1255_1_U0 int4_decoder_local_pe_1_U0 \
    grp_int4_local_residual_add_pe1_fu_411 \
    {ap_enable_reg_pp0_iter8_reg_KPN_1255_1_U0_int4_decoder_local_pe_0_U0_grp_int4_local_swiglu_stage_pe0_fu_370_ap_enable_reg}] /]
check {[matches_any $reported_kpn_name [group_patterns "PE1 local compute anchor"] 1]} \
    "reported _KPN_ PE1 cell must belong to PE1"
check {![matches_any $reported_kpn_name [group_patterns "PE0 local compute anchor"] 0]} \
    "PE0 text in an _KPN_ provenance suffix must not claim the PE1 cell"

# Even an unknown future separator cannot override an explicit destination PE
# hierarchy.  This exercises the hierarchy guard independently of suffix
# recognition.
set reported_unknown_suffix [join [list \
    root KPN_1255_1_U0 int4_decoder_local_pe_1_U0 \
    grp_int4_local_residual_add_pe1_fu_411 \
    {ap_enable_reg_FUTURE_NAMING_int4_decoder_local_pe_0_U0_ap_enable_reg}] /]
check {[matches_any $reported_unknown_suffix [group_patterns "PE1 local compute anchor"] 1]} \
    "explicit PE1 hierarchy must survive an unknown provenance separator"
check {![matches_any $reported_unknown_suffix [group_patterns "PE0 local compute anchor"] 0]} \
    "unknown provenance spelling must not override explicit PE1 hierarchy"

# The AXI-Lite controller generates synchronizer primitives whose leaf names
# embed the task they synchronize.  The final completion selector must match
# the real root-level task hierarchy, not that incidental text inside a
# control_s_axi_U leaf (the latter is already owned by SLR0).
set final_wait_patterns [group_patterns "final two-input completion wait"]
set control_sync_name \
    "root/control_s_axi_U/ap_sync_reg_int4_wait_task_completion_pairs_300_U0_ap_start_i_1"
check {[matches_any \
    "root/int4_wait_task_completion_pairs_300_U0/ap_done_reg" \
    $final_wait_patterns]} \
    "root-level final completion task must remain selectable"
check {![matches_any \
    $control_sync_name \
    $final_wait_patterns]} \
    "final completion selector must not claim an AXI-Lite synchronizer leaf"
check {[timing300::is_control_axi_descendant $control_sync_name]} \
    "AXI-Lite synchronizer leaf must be recognized as control_s_axi_U-owned"
check {![timing300::is_control_axi_descendant \
    "root/int4_wait_task_completion_pairs_300_U0/ap_done_reg"]} \
    "real completion task must not be classified as AXI-Lite control"

# The connectivity-derived critical-cone pass supplements the mandatory PE
# pblocks.  Zero eligible paths or zero new primitives are valid no-op results,
# while positive counts report a real reinforcement.
check {[timing300::critical_cone_result_status 0 0 0] eq "no_timing_paths"} \
    "zero timing paths must be a valid critical-cone no-op"
check {[timing300::critical_cone_result_status 7 0 0] eq "no_same_owner_paths"} \
    "zero same-PE paths must be a valid critical-cone no-op"
check {[timing300::critical_cone_result_status 7 7 0] eq "no_new_primitives"} \
    "already-owned timing cones must not fail the implementation"
check {[timing300::critical_cone_result_status 7 7 3] eq "claimed"} \
    "positive critical-cone claims must retain claimed status"
check {[catch {timing300::critical_cone_result_status -1 0 0}]} \
    "negative critical-cone counts must remain fatal"

# These groups improve placement when their post-optimization hierarchy
# survives, but the mandatory PE/interface domains already cover the design.
# Their absence must therefore remain a warning rather than a build failure.
foreach optional_group [list \
        "PE0 promoted SwiftKV critical arithmetic" \
        "position stage 0" "position stage 1" \
        "position stage 2" "position stage 3" \
        "pair01 reductions and completion" \
        "pair23 reductions and completion" \
        "final two-input completion wait"] {
    check {![group_is_mandatory $optional_group]} \
        "$optional_group must remain an optional placement hint"
}

# Exercise every PE pair for every PE-specific ownership class.  The suffix
# intentionally names every possible foreign PE, including the real PE.
set pe_classes {
    {{local compute anchor} int4_decoder_local_pe_%d_U0}
    {{AXI adapter} gmem%d_m_axi_U}
    {{linear reader/compute} int4_read_local_weights_%d_U0}
    {{hoisted local stages} int4_store_local_logits_commanded_%d_U0}
    {{promoted local memories} residual%d_U}
    {{AXI config FIFOs} model_bank%d_c_U}
}

foreach class $pe_classes {
    lassign $class group_suffix instance_format
    for {set actual 0} {$actual < 4} {incr actual} {
        for {set provenance 0} {$provenance < 4} {incr provenance} {
            set actual_instance [format $instance_format $actual]
            set source_instance [format $instance_format $provenance]
            foreach name [list \
                    "root/$actual_instance/cell___flattened_${source_instance}_source" \
                    "root/$actual_instance/cell_KPN_1255_1_U0_${source_instance}_source"] {
                for {set expected 0} {$expected < 4} {incr expected} {
                    set description "PE${expected} $group_suffix"
                    set matched [matches_any $name [group_patterns $description] $expected]
                    check {$matched == ($expected == $actual)} \
                        "$description incorrectly classified actual PE$actual with PE$provenance provenance"
                }
            }
        }
    }
}

# opt_design can promote PE0 SwiftKV arithmetic directly below the kernel,
# removing every PE wrapper from the visible instance name.  Claim that case,
# but never let the fallback pattern steal an explicitly named foreign PE.
set promoted_patterns [group_patterns "PE0 promoted SwiftKV critical arithmetic"]
check {[matches_any \
    "root/grp_swiftkv_quantize_kv_record_fu_123/add_ln456_reg" \
    $promoted_patterns 0]} \
    "name-less promoted SwiftKV arithmetic must be claimed by PE0"
check {![matches_any \
    "root/int4_decoder_local_pe_1_U0/grp_swiftkv_quantize_kv_record_fu_123/add_ln456_reg" \
    $promoted_patterns 0]} \
    "PE0 promoted fallback must not steal explicit PE1 arithmetic"

# Audit every declared pattern, including position and reduction domains.
# A representative semantic segment must never resolve to two SLRs.
set representatives {}
foreach spec [timing300::domain_specs] {
    lassign $spec owner_slr description mandatory patterns
    foreach pattern $patterns {
        set representative [string map [list * {}] $pattern]
        lappend representatives [list $owner_slr $description $pattern $representative]
    }
}

foreach record $representatives {
    lassign $record owner_slr description pattern representative
    set matched_slrs {}
    foreach candidate [timing300::domain_specs] {
        lassign $candidate candidate_slr candidate_description mandatory candidate_patterns
        if {[matches_any "root/$representative/cell" $candidate_patterns]} {
            lappend matched_slrs $candidate_slr
        }
    }
    set matched_slrs [lsort -unique $matched_slrs]
    check {$matched_slrs eq [list $owner_slr]} \
        "pattern $pattern from '$description' resolves across SLRs: $matched_slrs"

    # A pattern appearing only in either known provenance suffix is never
    # ownership, including position and pair-reduction patterns.
    foreach provenance_name [list \
            "root/unrelated_cell___$representative" \
            "root/unrelated_cell_KPN_1255_1_U0_$representative"] {
        check {![timing300::name_matches_pattern $provenance_name $pattern]} \
            "pattern $pattern matched provenance-only text in $provenance_name"
    }
}

if {$failures != 0} {
    puts stderr "FAILED: $failures of $checks checks"
    exit 1
}
puts "PASS: $checks ownership-selector checks"
