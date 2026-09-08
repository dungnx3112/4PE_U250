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
    }

    set legacy [glob -nocomplain -directory $rtl_directory \
        "*int4_stream_local_weights_*.v"]
    if {[llength $legacy] != 0} {
        error "300MHz RTL gate: legacy base+word weight reader is still present: $legacy"
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

    # Route reports from the original implementation identified the selected
    # weighted-value register in the normalization loop as the tightest PE3
    # pins. Require four fixed-bank staging loops and a normalize loop that
    # reads only the local staged BRAM, not the four engine memories directly.
    set state_stages [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_update_values_and_quantize_Pipeline_stage_weighted_group_engine_loop*.v"]
    set normalize_loops [glob -nocomplain -directory $rtl_directory \
        "*swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop.v"]
    if {[llength $state_stages] != 4 || [llength $normalize_loops] != 1} {
        error "300MHz RTL gate: expected four state-bank staging loops and one normalize loop; stages=[llength $state_stages] normalize=[llength $normalize_loops]"
    }
    set handle [open [lindex $normalize_loops 0] r]
    set normalize_loop_text [read $handle]
    close $handle
    if {![regexp -- {weighted_group_q0} $normalize_loop_text] ||
        [regexp -- {weighted_value_engine} $normalize_loop_text]} {
        error "300MHz RTL gate: attention normalization still selects engine state directly"
    }

    puts "INFO: 300MHz RTL gate: LOCAL_WEIGHT_REQUEST_PIPELINES_VERIFIED"
    puts "INFO: 300MHz RTL gate: LOCAL_WEIGHT_BACKPRESSURE_BOUNDARY_VERIFIED"
    puts "INFO: 300MHz RTL gate: AXI_READ_WINDOWS_2X64_VERIFIED"
    puts "INFO: 300MHz RTL gate: AXI_WRITE_WINDOWS_2X16_VERIFIED"
    puts "INFO: 300MHz RTL gate: ATTENTION_KV_WRITE_BOUNDARY_VERIFIED"
    puts "INFO: 300MHz RTL gate: ATTENTION_SCORE_MULTIPLIER_ISOLATED"
    puts "INFO: 300MHz RTL gate: ATTENTION_NORMALIZATION_STAGING_VERIFIED"
}

set validator_directory [file dirname [file normalize [info script]]]
set generated_rtl_directory [file join $validator_directory \
    proj_int4_decoder_300mhz solution1 syn verilog]
verify_generated_rtl_300mhz $generated_rtl_directory
