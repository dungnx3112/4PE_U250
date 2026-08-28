# Simple pre-place SLR constraints for the U250 300 MHz build.

puts "INFO: loading [file normalize [info script]]"

proc find_floorplan_cells {patterns} {
    set matched {}
    foreach pattern $patterns {
        set cells [get_cells -quiet -hierarchical -filter "NAME =~ $pattern"]
        if {[llength $cells] > 0} {
            set matched [concat $matched $cells]
        }
    }
    return [lsort -unique $matched]
}

# The U250 platform already owns four hard child pblocks named
# pblock_dynamic_SLR0..3 below pblock_dynamic_region.  USER_SLR_ASSIGNMENT is
# only a placement guideline and the placer is allowed to ignore it.  Put the
# selected hierarchy into the platform child pblock as the hard constraint,
# while retaining USER_SLR_ASSIGNMENT as an additional placement hint.
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

proc assign_slr {slr patterns} {
    set cells [find_floorplan_cells $patterns]
    if {[llength $cells] > 0} {
        set pblock [require_platform_slr_pblock $slr]
        set pblock_name [get_property NAME $pblock]

        # Reassign the hierarchy from the parent dynamic-region pblock into
        # the platform's hard per-SLR child pblock.
        add_cells_to_pblock $pblock $cells
        set_property USER_SLR_ASSIGNMENT $slr $cells
        foreach cell $cells {
            set assigned [get_property USER_SLR_ASSIGNMENT $cell]
            if {$assigned ne $slr} {
                error "300MHz floorplan: failed to assign [get_property NAME $cell] to $slr (read back '$assigned')"
            }

            set memberships [get_pblocks -quiet -of_objects $cell]
            if {[lsearch -exact $memberships $pblock_name] < 0} {
                error "300MHz floorplan: failed to add [get_property NAME $cell] to hard pblock $pblock_name"
            }
        }
    }
    return $cells
}

proc require_slr {slr label patterns} {
    set cells [assign_slr $slr $patterns]
    if {[llength $cells] == 0} {
        error "300MHz floorplan: required $label hierarchy was not found for $slr"
    }
    puts "INFO: 300MHz floorplan: $label -> $slr ([llength $cells] cells)"
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
    assign_slr $slr [list \
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
        "*/int4_seed_linear_stage_pe_${pe}*_U0" \
        "*/quantized_pe${pe}_U" \
        "*/quantized_pe${pe}_local_U" \
        "*/scale_pe${pe}_U" \
        "*/activation_scale_pe${pe}_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/replay_activation_stream_U" \
        "*/int4_run_pe_dataflow_${pe}_U0/output_value_stream_U" \
        "*/swiftkv_run_pe_${pe}_U0/*/current_record_stream_U" \
        "*/int4_preload_model_prefix_pe_${pe}*_U0" \
        "*/int4_load_residual_pe_${pe}*_U0" \
        "*/int4_store_residual_pe_${pe}*_U0" \
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
    assign_slr $slr [list "*rope_lut_bank${bank}_U"]
    set loader [get_cells -quiet -hierarchical -filter \
        "REF_NAME =~ *swiftkv_load_rope_bank${bank}"]
    if {[llength $loader] > 0} {
        set_property USER_SLR_ASSIGNMENT $slr $loader
    }
}

require_slr SLR0 "AXI-Lite control adapter" [list \
    "*control_s_axi_U"]

assign_slr SLR0 [list \
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

assign_slr SLR1 [list \
    "*/swiftkv_preload_rope_bank1_stage_U0" \
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

assign_slr SLR2 [list \
    "*/swiftkv_preload_rope_bank2_stage_U0" \
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
    "*/int4_rms_merge_partial2_U0" \
    "*/int4_rms_merge_partial3_and_rsqrt_U0"]

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

assign_slr SLR3 [list \
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

puts "INFO: 300MHz floorplan: PAIR_LOCAL_APPLIED"
puts "INFO: 300MHz floorplan: HARD_PBLOCKS_APPLIED"
puts "INFO: 300MHz floorplan: FLOORPLAN_APPLIED"
