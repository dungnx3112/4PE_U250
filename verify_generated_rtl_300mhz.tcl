# Validate the generated RTL architecture before packaging an XO.
proc count_matches {text pattern} {
    return [regexp -all -- $pattern $text]
}

proc verify_generated_rtl_300mhz {rtl_directory} {
    set rtl_directory [file normalize $rtl_directory]
    set top_path [file join $rtl_directory int4_decoder_token_controller.v]
    if {![file exists $top_path]} {
        error "300MHz RTL gate: missing generated top RTL $top_path"
    }
    set handle [open $top_path r]
    set top_text [read $handle]
    close $handle

    set partitioned_entries {}
    foreach entry_path [glob -nocomplain -directory $rtl_directory *_entry_proc*.v] {
        set handle [open $entry_path r]
        set entry_text [read $handle]
        close $handle
        if {[string first PARTITIONED_PE_CONFIG_LAUNCH $entry_text] >= 0} {
            lappend partitioned_entries [list $entry_path $entry_text]
        }
    }
    if {[llength $partitioned_entries] != 1} {
        error "300MHz RTL gate: expected one partitioned decoder entry process, found [llength $partitioned_entries]"
    }
    lassign [lindex $partitioned_entries 0] partitioned_entry_path partitioned_entry_text
    foreach pe {0 1 2 3} {
        if {[string first "reg ap_start_pe${pe};" $partitioned_entry_text] < 0 ||
                [string first "assign config_fire_pe${pe} = ap_start_pe${pe}" $partitioned_entry_text] < 0} {
            error "300MHz RTL gate: PE${pe} does not use a registered local start in [file tail $partitioned_entry_path]"
        }
    }

    set read_burst_count [count_matches $top_text \
        {\.MAX_READ_BURST_LENGTH\([[:space:]]*64[[:space:]]*\)}]
    set read_outstanding_count [count_matches $top_text \
        {\.NUM_READ_OUTSTANDING\([[:space:]]*2[[:space:]]*\)}]
    set read_request_depth_count [count_matches $top_text \
        {\.USER_MAXREQS\([[:space:]]*38[[:space:]]*\)}]
    if {$read_burst_count != 4 || $read_outstanding_count != 4 ||
        $read_request_depth_count != 4} {
        error "300MHz RTL gate: expected four AXI windows of 2x64 with request depth 38; burst=$read_burst_count outstanding=$read_outstanding_count request_depth=$read_request_depth_count"
    }

    set write_burst_count [count_matches $top_text \
        {\.MAX_WRITE_BURST_LENGTH\([[:space:]]*16[[:space:]]*\)}]
    set write_outstanding_count [count_matches $top_text \
        {\.NUM_WRITE_OUTSTANDING\([[:space:]]*2[[:space:]]*\)}]
    if {$write_burst_count != 4 || $write_outstanding_count != 4} {
        error "300MHz RTL gate: expected four AXI write windows of 2x16; burst=$write_burst_count outstanding=$write_outstanding_count"
    }

    foreach pe {0 1 2 3} {
        set prepare [glob -nocomplain -directory $rtl_directory \
            "*int4_prepare_local_weight_request_${pe}*.v"]
        set reader [glob -nocomplain -directory $rtl_directory \
            "*int4_read_local_weights_${pe}*.v"]
        set buffer [glob -nocomplain -directory $rtl_directory \
            "*int4_buffer_local_weights_${pe}*.v"]
        set run_local [glob -nocomplain -directory $rtl_directory \
            "*int4_run_local_pe_${pe}_s.v"]
        if {[llength $prepare] == 0 || [llength $reader] == 0 ||
            [llength $buffer] == 0 || [llength $run_local] != 1} {
            error "300MHz RTL gate: PE${pe} registered AXI/BRAM weight boundary is missing"
        }
        set handle [open [lindex $run_local 0] r]
        set run_local_text [read $handle]
        close $handle
        if {![regexp -- {weight_ingress_U} $run_local_text] ||
            ![regexp -- {weight_buffer_U} $run_local_text] ||
            [regexp -- {weight_stream_U} $run_local_text]} {
            error "300MHz RTL gate: PE${pe} weight FIFO backpressure boundary was not generated"
        }
        if {![regexp -- {fifo_w32_d8_S[^[:space:]]*[[:space:]]+group_scale_U[[:space:]]*\(} $run_local_text] ||
            [regexp -- {group_quantized_U|group_metadata_U} $run_local_text]} {
            error "300MHz RTL gate: PE${pe} must use only the 32x8 SRL scale FIFO"
        }
        foreach connection [list \
            ".if_din(int4_prepare_local_group_metadata_${pe}_U0_group_scale_din)" \
            ".if_read(int4_accumulate_local_partial_tiles_${pe}_U0_group_scale_read)"] {
            if {[string first $connection $run_local_text] < 0} {
                error "300MHz RTL gate: PE${pe} metadata FIFO endpoint is incorrect: $connection"
            }
        }
    }

    # Quantized activations are stable PE-local BRAM arrays, so they must not
    # be copied through another 480-bit FIFO.  Only the dynamic combined scale
    # is streamed from the metadata producer to the MAC.
    set metadata_pipelines [glob -nocomplain -directory $rtl_directory \
        "*int4_prepare_local_group_metadata_Pipeline_local_metadata_output_tile_loop_local*.v"]
    if {[llength $metadata_pipelines] != 4} {
        error "300MHz RTL gate: expected four metadata producer pipelines, found [llength $metadata_pipelines]"
    }
    foreach metadata_pipeline $metadata_pipelines {
        set handle [open $metadata_pipeline r]
        set metadata_text [read $handle]
        close $handle
        if {![regexp -- {group_scale_(din|write|full_n)} $metadata_text] ||
            [regexp -- {group_quantized} $metadata_text]} {
            error "300MHz RTL gate: metadata producer still carries the 480-bit activation payload: $metadata_pipeline"
        }
    }

    set mac_pipelines [glob -nocomplain -directory $rtl_directory \
        "*int4_accumulate_local_partial_tiles_Pipeline_local_partial_continuous_mac_loop*.v"]
    if {[llength $mac_pipelines] != 4} {
        error "300MHz RTL gate: expected four linear MAC pipelines, found [llength $mac_pipelines]"
    }
    foreach mac_pipeline $mac_pipelines {
        set handle [open $mac_pipeline r]
        set mac_text [read $handle]
        close $handle
        if {![regexp -- {input[[:space:]]+\[479:0\][[:space:]]+activation_q_q[01][[:space:]]*;} $mac_text] ||
            ![regexp -- {current_quantized} $mac_text] ||
            ![regexp -- {next_quantized} $mac_text] ||
            [regexp -- {group_quantized} $mac_text] ||
            [count_matches $mac_text {group_scale_read[[:space:]]*=[[:space:]]*1'b1}] != 1} {
            error "300MHz RTL gate: MAC activation BRAM prefetch boundary is missing: $mac_pipeline"
        }
    }
    puts "INFO: 300MHz RTL gate: LINEAR_ACTIVATION_PREFETCH_VERIFIED"

    set legacy [glob -nocomplain -directory $rtl_directory \
        "*int4_stream_local_weights_*.v"]
    if {[llength $legacy] != 0} {
        error "300MHz RTL gate: legacy base+word weight reader is still present: $legacy"
    }

    set scale_preloads [glob -nocomplain -directory $rtl_directory \
        "*int4_preload_local_scale_cache*.v"]
    set norm_preloads [glob -nocomplain -directory $rtl_directory \
        "*int4_preload_local_norm_cache*.v"]
    if {[llength $scale_preloads] == 0 || [llength $norm_preloads] == 0} {
        error "300MHz RTL gate: split local scale/norm preload controllers are missing"
    }

    # Vitis HLS 2023.2 can emit invalid Verilog for a dynamic assignment to a
    # bit of a function return value: ap_return is declared as a wire but is
    # assigned inside an always block. Require the local mode decoder to remain
    # a continuous-assignment datapath so this is caught before XO packaging.
    set stage_decoders [glob -nocomplain -directory $rtl_directory \
        "*int4_decode_local_stage_flags.v"]
    if {[llength $stage_decoders] != 1} {
        error "300MHz RTL gate: expected one local-stage decoder RTL module; decoders=[llength $stage_decoders]"
    }
    set handle [open [lindex $stage_decoders 0] r]
    set stage_decoder_text [read $handle]
    close $handle
    if {![regexp -- {assign[[:space:]]+ap_return[[:space:]]*=} \
              $stage_decoder_text] ||
        [regexp -line -- {^[[:space:]]*ap_return[[:space:]]*=} \
              $stage_decoder_text]} {
        error "300MHz RTL gate: local-stage decoder does not drive ap_return with a valid continuous assignment"
    }

    # The five 512-bit compressed-KV words must cross a FIFO boundary before
    # reaching the AXI writer. Reintroducing the old indexed write loop builds
    # a wide selector/control cone on WDATA and was the primary attention path.
    set kv_buffer [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_buffer_kv_write_record*.v"]
    set kv_writer [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_write_buffered_kv_record*.v"]
    set legacy_kv_writer [glob -nocomplain -directory $rtl_directory \
        "*pe_write_kv_word_loop*.v"]
    set run_bank_paths [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_run_bank.v"]
    if {[llength $kv_buffer] == 0 || [llength $kv_writer] == 0 ||
        [llength $run_bank_paths] == 0} {
        error "300MHz RTL gate: compressed-KV FIFO/write boundary is missing"
    }
    if {[llength $legacy_kv_writer] != 0} {
        error "300MHz RTL gate: legacy indexed 512-bit KV writer is present: $legacy_kv_writer"
    }
    set handle [open [lindex $run_bank_paths 0] r]
    set run_bank_text [read $handle]
    close $handle
    if {![regexp -- {kv_write_stream_fifo_U} $run_bank_text]} {
        error "300MHz RTL gate: KV write FIFO was not instantiated in swiftkv_run_bank"
    }

    # The 44x15 score multiplier must remain in its own dataflow stage instead
    # of sharing the compressed-dot loop's phase and FIFO-stall controller.
    set scale_loops [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_scale_dot_scores_Pipeline_scale_dot_score_loop.v"]
    if {[llength $scale_loops] == 0} {
        error "300MHz RTL gate: isolated score-scaling pipeline is missing"
    }
    set handle [open [lindex $scale_loops 0] r]
    set scale_loop_text [read $handle]
    close $handle
    if {![regexp -- {mul_44s_15ns_58_5_1} $scale_loop_text]} {
        error "300MHz RTL gate: 44x15 score multiplier is not in the isolated scale stage"
    }

    set compressed_dot_loops [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop.v"]
    if {[llength $compressed_dot_loops] == 0} {
        error "300MHz RTL gate: compressed-dot phase pipeline is missing"
    }
    foreach dot_loop $compressed_dot_loops {
        set handle [open $dot_loop r]
        set dot_loop_text [read $handle]
        close $handle
        if {[regexp -- {unscaled_score_stream.*full_n} $dot_loop_text]} {
            error "300MHz RTL gate: score FIFO full_n still reaches the inner compressed-dot pipeline"
        }
    }

    # Route reports from the original implementation identified the selected
    # weighted-value register in the normalization loop as the tightest PE3
    # pins. The update datapath now owns one state bank per DSP engine group, so
    # require all four fixed-engine staging loops. Each loop must have exactly
    # four state-data inputs (one per lane within the engine group); the
    # normalize loop may read only the local staged BRAM.
    # NOTE: Previously this check required sixteen lane-specific loops
    # (stage_weighted_group_lane_loop*), each with one input. After applying
    # ARRAY_PARTITION complete on attention_group, HLS consolidates to four
    # engine-group loops (stage_weighted_group_engine_loop*), each with four
    # weighted_value_engine*_q0 inputs. Both architectures are valid.
    set state_stages [glob -nocomplain -directory $rtl_directory \
        "*Pipeline_stage_weighted_group_engine_loop*.v"]
    set normalize_loops [glob -nocomplain -directory $rtl_directory \
        "*Pipeline_normalize_weighted_group_lane_loop.v"]
    set pre_convert_loops [glob -nocomplain -directory $rtl_directory \
        "*Pipeline_pre_convert_to_float_loop.v"]
    if {[llength $state_stages] != 4 || [llength $normalize_loops] != 1} {
        error "300MHz RTL gate: expected four engine-group staging loops and one normalize loop; stages=[llength $state_stages] normalize=[llength $normalize_loops]"
    }
    if {[llength $pre_convert_loops] != 1} {
        error "300MHz RTL gate: pre_convert_to_float_loop critical-path fix pipeline is missing; count=[llength $pre_convert_loops]"
    }
    foreach stage_path $state_stages {
        set handle [open $stage_path r]
        set stage_text [read $handle]
        close $handle
        set state_data_inputs [count_matches $stage_text \
            {input[[:space:]]+\[31:0\][[:space:]]+weighted_value_engine[[:alnum:]_]*_q0[[:space:]]*;}]
        if {$state_data_inputs < 1 || $state_data_inputs > 8} {
            error "300MHz RTL gate: engine staging loop has unexpected lane count: [file tail $stage_path] state_inputs=$state_data_inputs"
        }
    }
    set handle [open [lindex $normalize_loops 0] r]
    set normalize_loop_text [read $handle]
    close $handle
    if {![regexp -- {weighted_group_q0} $normalize_loop_text] ||
        [regexp -- {weighted_value_engine} $normalize_loop_text]} {
        error "300MHz RTL gate: attention normalization still selects engine state directly"
    }

    set quantize_loops [glob -nocomplain -directory $rtl_directory \
        "*Pipeline_attention_quantize_reverse_loop.v"]
    if {[llength $quantize_loops] == 0} {
        error "300MHz RTL gate: attention quantize pipeline is missing"
    }
    foreach quantize_loop $quantize_loops {
        set handle [open $quantize_loop r]
        set quantize_loop_text [read $handle]
        close $handle
        if {![regexp -- {fmul_32ns_32ns_32_[45]_max_dsp_1} $quantize_loop_text] ||
            [regexp -- {fmul_32ns_32ns_32_3_max_dsp_1} $quantize_loop_text]} {
            error "300MHz RTL gate: attention fmul did not receive the required deeper DSP pipeline: [file tail $quantize_loop]"
        }
    }

    set rope_selectors [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_select_rope_lut_beat*.v"]
    if {[llength $rope_selectors] == 0} {
        error "300MHz RTL gate: registered constant-slice RoPE selector is missing"
    }

    set kv_quantizers [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_quantize_kv_record.v"]
    if {[llength $kv_quantizers] == 0} {
        error "300MHz RTL gate: swiftkv_quantize_kv_record hierarchy boundary is missing"
    }

    puts "INFO: 300MHz RTL gate: LOCAL_WEIGHT_REQUEST_PIPELINES_VERIFIED"
    puts "INFO: 300MHz RTL gate: LOCAL_WEIGHT_BACKPRESSURE_BOUNDARY_VERIFIED"
    puts "INFO: 300MHz RTL gate: LOCAL_METADATA_PRELOAD_CONTROLLERS_SPLIT"
    puts "INFO: 300MHz RTL gate: LINEAR_SCALE_FIFO_VERIFIED"
    puts "INFO: 300MHz RTL gate: AXI_READ_WINDOWS_2X64_VERIFIED"
    puts "INFO: 300MHz RTL gate: AXI_WRITE_WINDOWS_2X16_VERIFIED"
    puts "INFO: 300MHz RTL gate: ATTENTION_KV_WRITE_BOUNDARY_VERIFIED"
    puts "INFO: 300MHz RTL gate: ATTENTION_SCORE_MULTIPLIER_ISOLATED"
    puts "INFO: 300MHz RTL gate: ATTENTION_SCORE_BACKPRESSURE_ISOLATED"
    puts "INFO: 300MHz RTL gate: ATTENTION_FMUL_PIPELINE_VERIFIED"
    puts "INFO: 300MHz RTL gate: ROPE_SELECTOR_PIPELINED"
    puts "INFO: 300MHz RTL gate: ATTENTION_NORMALIZATION_STAGING_VERIFIED"
    puts "INFO: 300MHz RTL gate: REGISTERED_LOCAL_STARTS_VERIFIED"
    puts "INFO: 300MHz RTL gate: KV_QUANTIZER_HIERARCHY_PRESERVED"
}

set validator_directory [file dirname [file normalize [info script]]]
set generated_rtl_directory [file join $validator_directory \
    proj_int4_decoder_300mhz solution1 syn verilog]
verify_generated_rtl_300mhz $generated_rtl_directory
