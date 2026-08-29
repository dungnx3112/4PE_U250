# Congestion-aware pre-place SLR constraints for the U250 300 MHz build.

puts "INFO: loading [file normalize [info script]]"

proc prune_nested_floorplan_cells {cells} {
    # NAME =~ patterns ending in '*' also match descendants because a Vivado
    # hierarchical name contains '/'.  Retain only the highest matched cell;
    # otherwise one run-bank pattern expands into hundreds of hierarchy cells
    # and recreates the old broad-pblock behavior.
    set roots {}
    set root_names {}
    foreach cell [lsort -unique $cells] {
        set name [get_property NAME $cell]
        set nested 0
        foreach root_name $root_names {
            if {[string first "${root_name}/" $name] == 0} {
                set nested 1
                break
            }
        }
        if {!$nested} {
            lappend roots $cell
            lappend root_names $name
        }
    }
    return $roots
}

proc find_floorplan_cells {patterns} {
    set matched {}
    foreach pattern $patterns {
        # Anchor hierarchy roots, never every primitive whose full path happens
        # to share the prefix. USER_SLR_ASSIGNMENT is ignored on leaf cells and
        # the broad match needlessly inflated one SwiftKV anchor to ~34k cells.
        set cells [get_cells -quiet -hierarchical -filter \
            "NAME =~ $pattern && IS_PRIMITIVE == 0"]
        if {[llength $cells] > 0} {
            set matched [concat $matched $cells]
        }
    }
    return [prune_nested_floorplan_cells $matched]
}

# The U250 platform already owns four hard child pblocks named
# pblock_dynamic_SLR0..3 below pblock_dynamic_region.  Do not put complete HLS
# DATAFLOW hierarchies into those child pblocks: doing that separated their
# automatically generated ap_done/ap_sync control cones across all four SLRs
# and made localized SLL demand exceed 100 percent.  Complete hierarchies are
# checked for name/version compatibility but intentionally left unconstrained.
# Only PE-local datapaths, their storage and pair-boundary endpoints receive
# USER_SLR_ASSIGNMENT and enter hard child pblocks.  The outer HLS DATAFLOW
# wrappers and their generated ap_start/ap_done orchestration remain soft.
proc require_platform_slr_pblock {slr} {
    set pblock_name "pblock_dynamic_${slr}"
    set pblock [get_pblocks -quiet $pblock_name]
    if {[llength $pblock] != 1} {
        error "300MHz floorplan: required platform pblock $pblock_name was not found uniquely"
    }

    set is_soft [get_property IS_SOFT $pblock]
    if {$is_soft ni {0 false FALSE}} {
        error "300MHz floorplan: platform pblock $pblock_name is soft (IS_SOFT=$is_soft)"
    }
    return $pblock
}

proc discover_slr_group {slr patterns} {
    # 'slr' records the intended data ownership for diagnostics only.  Do not
    # set USER_SLR_ASSIGNMENT here: applying it to a hierarchy constrains every
    # HLS control descendant and recreates the failed checkpoint's topology.
    return [find_floorplan_cells $patterns]
}

proc anchor_slr {slr label patterns required} {
    set cells [find_floorplan_cells $patterns]
    if {[llength $cells] == 0} {
        if {$required} {
            error "300MHz floorplan: required hard anchor $label was not found for $slr"
        }
        puts "INFO: 300MHz floorplan: optional hard anchor $label was not found for $slr"
        return {}
    }

    set pblock [require_platform_slr_pblock $slr]
    set pblock_name [get_property NAME $pblock]
    add_cells_to_pblock $pblock $cells
    set_property USER_SLR_ASSIGNMENT $slr $cells
    foreach cell $cells {
        set assigned_slr [get_property USER_SLR_ASSIGNMENT $cell]
        if {$assigned_slr ne $slr} {
            error "300MHz floorplan: hard anchor [get_property NAME $cell] ignored USER_SLR_ASSIGNMENT=$slr (actual=$assigned_slr)"
        }
        set memberships [get_pblocks -quiet -of_objects $cell]
        if {[lsearch -exact $memberships $pblock_name] < 0} {
            error "300MHz floorplan: failed to add hard anchor [get_property NAME $cell] to $pblock_name"
        }
    }
    puts "INFO: 300MHz floorplan: hard anchor $label -> $slr ([llength $cells] cells)"
    return $cells
}

proc require_anchor_slr {slr label patterns} {
    return [anchor_slr $slr $label $patterns 1]
}

proc optional_anchor_slr {slr label patterns} {
    return [anchor_slr $slr $label $patterns 0]
}

proc require_slr {slr label patterns} {
    set cells [discover_slr_group $slr $patterns]
    if {[llength $cells] == 0} {
        error "300MHz floorplan: required $label hierarchy was not found for $slr"
    }
    puts "INFO: 300MHz floorplan: unconstrained hierarchy $label preferred-owner=$slr ([llength $cells] cells)"
}

# Keep each PE, its memories and its AXI port on the same SLR.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    require_slr $slr "linear PE${pe}" [list \
        "*/int4_run_pe_dataflow_${pe}_U0"]
    require_slr $slr "SwiftKV PE${pe}" [list \
        "*/swiftkv_run_pe_${pe}_U0"]
    require_slr $slr "RMS PE${pe}" [list \
        "*/int4_rms_normalize_quantize_pe_${pe}*_U0"]
    require_slr $slr "SwiGLU PE${pe}" [list \
        "*/int4_swiglu_quantize_pe${pe}*_U0"]
    discover_slr_group $slr [list \
        "*/int4_run_pe_dataflow_${pe}_U0" \
        "*/int4_pe_*_slice_${pe}*_U0" \
        "*/int4_broadcast_pe_stage_commands_${pe}_U0" \
        "*/int4_pe_*_commanded_${pe}*_U0" \
        "*/int4_run_pe_dataflow_${pe}_U0/*_command_stream_U" \
        "*/swiftkv_run_pe_${pe}_U0" \
        "*/swiftkv_run_pe_${pe}_U0/*/packed_key*_stream_U" \
        "*/swiftkv_run_pe_${pe}_U0/*/key*_chunk*_stream_U" \
        "*/swiftkv_run_pe_${pe}_U0/*/value*_engine*_stream_U" \
        "*/grp_int4_route_projection_local_pe_${pe}*_fu_*" \
        "*/grp_int4_seed_linear_stage_pe_${pe}*_fu_*" \
        "*/quantized_pe${pe}_U" \
        "*/quantized_pe${pe}_local_U" \
        "*/scale_pe${pe}_U" \
        "*/activation_scale_pe${pe}_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/replay_activation_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/output_value_stream_U" \
        "*/swiftkv_run_pe_${pe}_U0/*/current_record_stream_U" \
        "*/grp_int4_preload_model_prefix_pe_${pe}*_fu_*" \
        "*/grp_int4_load_residual_pe_${pe}*_fu_*" \
        "*/grp_int4_store_residual_pe_${pe}*_fu_*" \
        "*/int4_rms_sumsq_pe_${pe}*_U0" \
        "*/int4_rms_normalize_quantize_pe_${pe}*_U0" \
        "*/int4_swiglu_quantize_pe${pe}*_U0" \
        "*linear_stage${pe}_U" \
        "*model_scale_cache${pe}_U" \
        "*model_norm_cache${pe}_U" \
        "*residual_buffer${pe}_U" \
        "*q_pe${pe}_U" "*k_pe${pe}_U" "*v_pe${pe}_U" \
        "*gate_pe${pe}_U" "*up_pe${pe}_U" \
        "*gmem${pe}_m_axi_U" \
        "*model_bank${pe}_read_reg*" \
        "*residual_pe${pe}_read_reg*" \
        "*logits_pe${pe}_read_reg*" \
        "*kv_cache_pe${pe}_read_reg*"]
}

# RoPE LUTs, loaders and the registered preload chain.
foreach bank {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    discover_slr_group $slr [list "*rope_lut_bank${bank}_U"]
}

require_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

discover_slr_group SLR0 [list \
    "*/swiftkv_preload_rope_reader_bank0_U0" \
    "*/int4_serialize_activation_pe0_to_pair01*_U0" \
    "*/swiftkv_serialize_attention_pe0_to_pair01_U0" \
    "*/int4_deserialize_activation_pe0_U0" \
    "*/quantized_pe0_local_U" \
    "*/quantized_pe0_to_pair01_U"]

require_slr SLR0 "PE0 activation serializer" [list \
    "*/int4_serialize_activation_pe0_to_pair01*_U0"]
require_slr SLR0 "PE0 attention serializer" [list \
    "*/swiftkv_serialize_attention_pe0_to_pair01_U0"]
require_slr SLR0 "PE0 linear deserializer" [list \
    "*/int4_deserialize_activation_pe0_U0"]

discover_slr_group SLR1 [list \
    "*/swiftkv_preload_rope_bank1_stage_U0" \
    "*/int4_run_linear_pair01_U0" \
    "*/int4_rms_sumsq_pair01_U0" \
    "*/int4_rms_normalize_quantize_pair01_half_U0" \
    "*/int4_swiglu_quantize_pair01_half_U0" \
    "*/rope_stream01_U" \
    "*activation_q_pair01_U" "*activation_scale_pair01_U" \
    "*current_cos_pair01_U" "*current_sin_pair01_U" \
    "*attention_quantized_half01_stream*_U" \
    "*attention_scale_half01_stream*_U" \
    "*/quantized_half01_stream_U" "*/quantized_half01_local_U" \
    "*/quantized_pair01_stream_U" "*/quantized_pair01_U" \
    "*/quantized_pair01_to_pe0_U" \
    "*/activation_scale_pair01_to_pe0_U" \
    "*/scale_half01_stream_U" "*/scale_half01_local_U" \
    "*/scale_pair01_stream_U" "*/activation_scale_pair01_stream_U" \
    "*/quantized_half23_to01_U" "*/scale_half23_to01_U" \
    "*/grp_int4_dispatch_linear_registered_fu_*/command_stream_U" \
    "*/grp_int4_dispatch_linear_registered_fu_*/swift_command_stream_U" \
    "*/int4_exchange_activation_half_pair01_U0" \
    "*/int4_assemble_activation_pair01_U0" \
    "*/int4_prepare_activation_pair01_U0" \
    "*/int4_broadcast_activation_pair01_U0" \
    "*/int4_forward_attention_half_pair01_U0" \
    "*/int4_swiglu_gather_pair01_edge_U0" \
    "*/int4_rms_gather_pair01_edge_U0" \
    "*/int4_rms_broadcast_reciprocal_pair01_U0" \
    "*/swiftkv_broadcast_rope_pair01_U0" \
    "*/swiftkv_broadcast_pe_commands_pair01_U0" \
    "*/swiftkv_gather_attention_pair01_U0" \
    "*/swiftkv_join_done01_U0" \
    "*/swiftkv_join_all_done_U0" \
    "*/int4_rms_merge_partial01_U0"]

require_slr SLR1 "pair01 linear wrapper" [list \
    "*/int4_run_linear_pair01_U0"]
require_slr SLR1 "pair01 RMS sum wrapper" [list \
    "*/int4_rms_sumsq_pair01_U0"]
require_slr SLR1 "pair01 RMS normalize wrapper" [list \
    "*/int4_rms_normalize_quantize_pair01_half_U0"]
require_slr SLR1 "pair01 SwiGLU wrapper" [list \
    "*/int4_swiglu_quantize_pair01_half_U0"]

require_slr SLR1 "pair01 RMS gather" [list \
    "*/int4_rms_gather_pair01_edge_U0"]
require_slr SLR1 "pair01 SwiGLU gather" [list \
    "*/int4_swiglu_gather_pair01_edge_U0"]
require_slr SLR1 "pair01 linear broadcast" [list \
    "*/int4_broadcast_activation_pair01_U0"]
require_slr SLR1 "pair01 attention forward" [list \
    "*/int4_forward_attention_half_pair01_U0"]
require_slr SLR1 "pair01 attention buffer" [list \
    "*/attention_quantized_half01_stream*_U"]
require_slr SLR1 "pair01 preprocess FIFO" [list \
    "*/quantized_half01_stream_U"]

discover_slr_group SLR2 [list \
    "*/swiftkv_preload_rope_bank2_stage_U0" \
    "*/int4_run_linear_pair23_U0" \
    "*/int4_rms_sumsq_pair23_U0" \
    "*/int4_rms_normalize_quantize_pair23_half_U0" \
    "*/int4_swiglu_quantize_pair23_half_U0" \
    "*/rope_stream12_U" \
    "*activation_q_pair23_U" "*activation_scale_pair23_U" \
    "*current_cos_pair23_U" "*current_sin_pair23_U" \
    "*attention_quantized_half23_stream*_U" \
    "*attention_scale_half23_stream*_U" \
    "*/quantized_half23_stream_U" "*/quantized_half23_local_U" \
    "*/quantized_pair23_stream_U" "*/quantized_pair23_U" \
    "*/quantized_pair23_to_pe3_U" \
    "*/activation_scale_pair23_to_pe3_U" \
    "*/scale_half23_stream_U" "*/scale_half23_local_U" \
    "*/scale_pair23_stream_U" "*/activation_scale_pair23_stream_U" \
    "*/quantized_half01_to23_U" "*/scale_half01_to23_U" \
    "*/int4_exchange_activation_half_pair23_U0" \
    "*/int4_assemble_activation_pair23_U0" \
    "*/int4_prepare_activation_pair23_U0" \
    "*/int4_broadcast_activation_pair23_U0" \
    "*/int4_forward_attention_half_pair23_U0" \
    "*/int4_swiglu_gather_pair23_edge_U0" \
    "*/int4_rms_gather_pair23_edge_U0" \
    "*/int4_rms_broadcast_reciprocal_pair23_U0" \
    "*/swiftkv_broadcast_rope_pair23_U0" \
    "*/swiftkv_broadcast_pe_commands_pair23_U0" \
    "*/swiftkv_gather_attention_pair23_U0" \
    "*/swiftkv_join_done23_U0" \
    "*/int4_rms_merge_partial23_U0" \
    "*/int4_rms_finalize_pair_sums_U0"]

require_slr SLR2 "pair23 linear wrapper" [list \
    "*/int4_run_linear_pair23_U0"]
require_slr SLR2 "pair23 RMS sum wrapper" [list \
    "*/int4_rms_sumsq_pair23_U0"]
require_slr SLR2 "pair23 RMS normalize wrapper" [list \
    "*/int4_rms_normalize_quantize_pair23_half_U0"]
require_slr SLR2 "pair23 SwiGLU wrapper" [list \
    "*/int4_swiglu_quantize_pair23_half_U0"]

require_slr SLR2 "pair23 RMS gather" [list \
    "*/int4_rms_gather_pair23_edge_U0"]
require_slr SLR2 "pair23 SwiGLU gather" [list \
    "*/int4_swiglu_gather_pair23_edge_U0"]
require_slr SLR2 "pair23 linear broadcast" [list \
    "*/int4_broadcast_activation_pair23_U0"]
require_slr SLR2 "pair23 attention forward" [list \
    "*/int4_forward_attention_half_pair23_U0"]
require_slr SLR2 "pair23 attention buffer" [list \
    "*/attention_quantized_half23_stream*_U"]
require_slr SLR2 "pair23 preprocess FIFO" [list \
    "*/quantized_half23_stream_U"]

discover_slr_group SLR3 [list \
    "*/swiftkv_preload_rope_bank3_stage_U0" \
    "*/int4_serialize_activation_pe3_to_pair23*_U0" \
    "*/swiftkv_serialize_attention_pe3_to_pair23_U0" \
    "*/int4_deserialize_activation_pe3_U0" \
    "*/quantized_pe3_local_U" \
    "*/quantized_pe3_to_pair23_U" \
    "*/rope_stream23_U"]

require_slr SLR3 "PE3 activation serializer" [list \
    "*/int4_serialize_activation_pe3_to_pair23*_U0"]
require_slr SLR3 "PE3 attention serializer" [list \
    "*/swiftkv_serialize_attention_pe3_to_pair23_U0"]
require_slr SLR3 "PE3 linear deserializer" [list \
    "*/int4_deserialize_activation_pe3_U0"]

# Hard anchors retain DDR affinity and distribute the large BRAM/URAM/DSP
# consumers without forcing the HLS orchestration FSMs into remote SLRs.
foreach pe {0 1 2 3} slr {SLR0 SLR1 SLR2 SLR3} {
    require_anchor_slr $slr "gmem${pe} AXI master" [list \
        "*gmem${pe}_m_axi_U"]

    require_anchor_slr $slr "PE${pe} local memories" [list \
        "*linear_stage${pe}_U" \
        "*model_scale_cache${pe}_U" \
        "*model_norm_cache${pe}_U" \
        "*residual_buffer${pe}_U" \
        "*q_pe${pe}_U" "*k_pe${pe}_U" "*v_pe${pe}_U" \
        "*gate_pe${pe}_U" "*up_pe${pe}_U" \
        "*logits_pe${pe}_U" \
        "*rope_lut_bank${pe}_U"]

    # Anchor the six linear worker stages and their wide local FIFOs, but not
    # int4_run_pe_dataflow itself.  This keeps the data plane next to gmemN
    # without forcing the wrapper's generated start/done cone into four SLRs.
    require_anchor_slr $slr "PE${pe} linear datapath" [list \
        "*/int4_run_pe_dataflow_${pe}_U0/int4_pe_*_commanded_${pe}*_U0" \
        "*/int4_run_pe_dataflow_${pe}_U0/weight_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/replay_activation_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/replay_scale_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/group_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/final_block_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/output_value_stream_U"]

    # These functions directly read or write PE-owned 512-bit memories.  They
    # used to be only discovered, so placer could put the client in SLR2 while
    # its PE3 RAM stayed in SLR3, consuming thousands of SLLs.
    require_anchor_slr $slr "PE${pe} memory clients" [list \
        "*/grp_int4_route_projection_local_pe_${pe}*_fu_*" \
        "*/grp_int4_seed_linear_stage_pe_${pe}*_fu_*" \
        "*/grp_int4_preload_model_prefix_pe_${pe}*_fu_*" \
        "*/grp_int4_load_residual_pe_${pe}*_fu_*" \
        "*/grp_int4_store_residual_pe_${pe}*_fu_*"]

    # Keep the PE-specific normalization/SwiGLU producers and all 480-bit
    # hand-off FIFOs with their producer/consumer PE.  Only the deliberately
    # serialized 30-bit edge streams are allowed to cross an SLR boundary.
    require_anchor_slr $slr "PE${pe} preprocess datapath" [list \
        "*/int4_rms_sumsq_pe_${pe}*_U0" \
        "*/int4_rms_normalize_quantize_pe_${pe}*_U0" \
        "*/int4_swiglu_quantize_pe${pe}*_U0" \
        "*/quantized_pe${pe}_U" \
        "*/quantized_pe${pe}_local_U"]

    # swiftkv_run_bank is the PE-local SwiftKV data plane: q/k/v/query BRAMs,
    # RoPE, KV quantization and the attention engine.  Leave swiftkv_run_pe's
    # command/completion shell soft so its narrow control tokens may be placed
    # at the pair boundary.
    require_anchor_slr $slr "PE${pe} SwiftKV bank datapath" [list \
        "*/swiftkv_run_pe_${pe}_U0/grp_swiftkv_run_bank_fu_*"]
}

require_anchor_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

# Endpoint placement makes every intentionally serialized edge an explicit
# registered SLR cut.  The wide FIFO and serializer stay with the edge PE; the
# 30-bit FIFO is placed at the receiving pair (or destination PE for linear).
require_anchor_slr SLR0 "PE0 edge source and destination" [list \
    "*/int4_serialize_activation_pe0_to_pair01*_U0" \
    "*/swiftkv_serialize_attention_pe0_to_pair01_U0" \
    "*/int4_deserialize_activation_pe0_U0" \
    "*/quantized_pair01_to_pe0_U" \
    "*/activation_scale_pair01_to_pe0_U"]

require_anchor_slr SLR3 "PE3 edge source and destination" [list \
    "*/int4_serialize_activation_pe3_to_pair23*_U0" \
    "*/swiftkv_serialize_attention_pe3_to_pair23_U0" \
    "*/int4_deserialize_activation_pe3_U0" \
    "*/quantized_pair23_to_pe3_U" \
    "*/activation_scale_pair23_to_pe3_U"]

require_anchor_slr SLR1 "pair01 storage" [list \
    "*activation_q_pair01_U" "*activation_scale_pair01_U" \
    "*current_cos_pair01_U" "*current_sin_pair01_U" \
    "*/attention_quantized_half01_stream*_U" \
    "*/quantized_half01_stream_U" \
    "*/quantized_half01_local_U" \
    "*/quantized_half23_to01_U" \
    "*/quantized_pair01_stream_U" \
    "*/quantized_pair01_U" \
    "*/quantized_pe0_to_pair01_U"]

require_anchor_slr SLR1 "pair01 datapath endpoints" [list \
    "*/int4_broadcast_activation_pair01_U0" \
    "*/int4_rms_gather_pair01_edge_U0" \
    "*/int4_swiglu_gather_pair01_edge_U0" \
    "*/int4_rms_broadcast_reciprocal_pair01_U0" \
    "*/int4_rms_merge_partial01_U0" \
    "*/int4_forward_attention_half_pair01_U0" \
    "*/swiftkv_gather_attention_pair01_U0"]

require_anchor_slr SLR2 "pair23 storage" [list \
    "*activation_q_pair23_U" "*activation_scale_pair23_U" \
    "*current_cos_pair23_U" "*current_sin_pair23_U" \
    "*/attention_quantized_half23_stream*_U" \
    "*/quantized_half23_stream_U" \
    "*/quantized_half23_local_U" \
    "*/quantized_half01_to23_U" \
    "*/quantized_pair23_stream_U" \
    "*/quantized_pair23_U" \
    "*/quantized_pe3_to_pair23_U"]

require_anchor_slr SLR2 "pair23 datapath endpoints" [list \
    "*/int4_broadcast_activation_pair23_U0" \
    "*/int4_rms_gather_pair23_edge_U0" \
    "*/int4_swiglu_gather_pair23_edge_U0" \
    "*/int4_rms_broadcast_reciprocal_pair23_U0" \
    "*/int4_rms_merge_partial23_U0" \
    "*/int4_rms_finalize_pair_sums_U0" \
    "*/int4_forward_attention_half_pair23_U0" \
    "*/swiftkv_gather_attention_pair23_U0"]

puts "INFO: 300MHz floorplan: PAIR_LOCAL_APPLIED"
puts "INFO: 300MHz floorplan: LOCAL_DATA_PLANE_APPLIED"
puts "INFO: 300MHz floorplan: HARD_ANCHORS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
