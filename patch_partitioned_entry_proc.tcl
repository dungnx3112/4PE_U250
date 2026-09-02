# Patch the one HLS-generated entry process that transports the decoder's
# twenty AXI base addresses. Vitis HLS 2023.2 emits one global 20-input
# full_n cone; replace it with four atomic five-address PE launch groups.

proc replace_exactly_one_region {text pattern replacement description} {
    if {![regexp -indices $pattern $text match_indices]} {
        error "Could not find $description in generated decoder entry process"
    }
    lassign $match_indices first_index last_index
    set second_match_start [expr {$last_index + 1}]
    if {[regexp -start $second_match_start -indices $pattern $text]} {
        error "Found more than one $description in generated decoder entry process"
    }
    set prefix [string range $text 0 [expr {$first_index - 1}]]
    set suffix [string range $text [expr {$last_index + 1}] end]
    return "${prefix}${replacement}${suffix}"
}

proc partition_decoder_entry_proc {verilog_directory} {
    set rtl_directory [file normalize $verilog_directory]
    if {![file isdirectory $rtl_directory]} {
        error "Generated RTL directory does not exist: $rtl_directory"
    }

    set required_signals [list \
        model_bank0_c_full_n model_bank1_c_full_n \
        model_bank2_c_full_n model_bank3_c_full_n \
        rope_lut_pe0_c_full_n rope_lut_pe1_c_full_n \
        rope_lut_pe2_c_full_n rope_lut_pe3_c_full_n \
        residual_pe0_c_full_n residual_pe1_c_full_n \
        residual_pe2_c_full_n residual_pe3_c_full_n \
        logits_pe0_c_full_n logits_pe1_c_full_n \
        logits_pe2_c_full_n logits_pe3_c_full_n \
        kv_cache_pe0_c_full_n kv_cache_pe1_c_full_n \
        kv_cache_pe2_c_full_n kv_cache_pe3_c_full_n]

    set candidates {}
    foreach path [glob -nocomplain -directory $rtl_directory *_entry_proc*.v] {
        set handle [open $path r]
        set candidate_text [read $handle]
        close $handle
        set is_match 1
        foreach signal $required_signals {
            if {[string first $signal $candidate_text] < 0} {
                set is_match 0
                break
            }
        }
        if {$is_match} {
            lappend candidates $path
        }
    }
    if {[llength $candidates] != 1} {
        error "Expected exactly one 20-address decoder entry process, found [llength $candidates]"
    }

    set entry_path [lindex $candidates 0]
    set handle [open $entry_path r]
    set text [read $handle]
    close $handle
    if {[string first PARTITIONED_PE_CONFIG_LAUNCH $text] >= 0} {
        puts "INFO: partitioned entry process already present: $entry_path"
        puts "INFO: 300MHz RTL gate: PARTITIONED_PE_CONFIG_LAUNCH"
        return $entry_path
    }

    set declaration_replacement {
// PARTITIONED_PE_CONFIG_LAUNCH
// Each PE accepts its five AXI base addresses independently.  The original
// HLS entry process ANDed all twenty FIFO-full signals in one combinational
// cone; on a four-SLR U250 that cone pulls placement in four directions.
(* dont_touch = "yes" *) reg [3:0] config_sent;
reg done_hold;
(* keep = "yes" *) wire config_ready_pe0;
(* keep = "yes" *) wire config_ready_pe1;
(* keep = "yes" *) wire config_ready_pe2;
(* keep = "yes" *) wire config_ready_pe3;
(* keep = "yes" *) wire config_fire_pe0;
(* keep = "yes" *) wire config_fire_pe1;
(* keep = "yes" *) wire config_fire_pe2;
(* keep = "yes" *) wire config_fire_pe3;
wire [3:0] config_sent_or_fire;
wire config_complete;
}

    set body_replacement {
// The five channels belonging to one PE remain atomic, while the four PE
// groups may make progress independently.  This preserves one config tuple
// per invocation and reduces the physical control fan-in from 20 to 5.
assign config_ready_pe0 = model_bank0_c_full_n & rope_lut_pe0_c_full_n &
                          residual_pe0_c_full_n & logits_pe0_c_full_n &
                          kv_cache_pe0_c_full_n;
assign config_ready_pe1 = model_bank1_c_full_n & rope_lut_pe1_c_full_n &
                          residual_pe1_c_full_n & logits_pe1_c_full_n &
                          kv_cache_pe1_c_full_n;
assign config_ready_pe2 = model_bank2_c_full_n & rope_lut_pe2_c_full_n &
                          residual_pe2_c_full_n & logits_pe2_c_full_n &
                          kv_cache_pe2_c_full_n;
assign config_ready_pe3 = model_bank3_c_full_n & rope_lut_pe3_c_full_n &
                          residual_pe3_c_full_n & logits_pe3_c_full_n &
                          kv_cache_pe3_c_full_n;

assign config_fire_pe0 = ap_start & ~done_hold & ~config_sent[0] & config_ready_pe0;
assign config_fire_pe1 = ap_start & ~done_hold & ~config_sent[1] & config_ready_pe1;
assign config_fire_pe2 = ap_start & ~done_hold & ~config_sent[2] & config_ready_pe2;
assign config_fire_pe3 = ap_start & ~done_hold & ~config_sent[3] & config_ready_pe3;
assign config_sent_or_fire = config_sent |
    {config_fire_pe3, config_fire_pe2, config_fire_pe1, config_fire_pe0};
assign config_complete = ap_start & ~done_hold & (&config_sent_or_fire);

assign model_bank0_c_write = config_fire_pe0;
assign rope_lut_pe0_c_write = config_fire_pe0;
assign residual_pe0_c_write = config_fire_pe0;
assign logits_pe0_c_write = config_fire_pe0;
assign kv_cache_pe0_c_write = config_fire_pe0;
assign model_bank1_c_write = config_fire_pe1;
assign rope_lut_pe1_c_write = config_fire_pe1;
assign residual_pe1_c_write = config_fire_pe1;
assign logits_pe1_c_write = config_fire_pe1;
assign kv_cache_pe1_c_write = config_fire_pe1;
assign model_bank2_c_write = config_fire_pe2;
assign rope_lut_pe2_c_write = config_fire_pe2;
assign residual_pe2_c_write = config_fire_pe2;
assign logits_pe2_c_write = config_fire_pe2;
assign kv_cache_pe2_c_write = config_fire_pe2;
assign model_bank3_c_write = config_fire_pe3;
assign rope_lut_pe3_c_write = config_fire_pe3;
assign residual_pe3_c_write = config_fire_pe3;
assign logits_pe3_c_write = config_fire_pe3;
assign kv_cache_pe3_c_write = config_fire_pe3;

assign ap_done = config_complete | done_hold;
assign ap_ready = config_complete;
assign ap_idle = ~ap_start & (config_sent == 4'b0000) & ~done_hold;

initial begin
    #0 config_sent = 4'b0000;
    #0 done_hold = 1'b0;
end

always @(posedge ap_clk) begin
    if (ap_rst) begin
        config_sent <= 4'b0000;
        done_hold <= 1'b0;
    end else if (done_hold) begin
        if (ap_continue) begin
            config_sent <= 4'b0000;
            done_hold <= 1'b0;
        end
    end else if (config_complete) begin
        if (ap_continue) begin
            config_sent <= 4'b0000;
            done_hold <= 1'b0;
        end else begin
            config_sent <= 4'b1111;
            done_hold <= 1'b1;
        end
    end else begin
        config_sent <= config_sent_or_fire;
    end
end

assign kv_cache_pe0_c_din}

    set patched [replace_exactly_one_region $text \
        {(?s)reg ap_done;.*?wire[[:space:]]+ap_ce_reg;} \
        $declaration_replacement "entry-process declaration region"]
    set patched [replace_exactly_one_region $patched \
        {(?s)// power-on initialization.*?assign kv_cache_pe0_c_din} \
        $body_replacement "entry-process control body"]

    if {[string first ap_block_state1 $patched] >= 0} {
        error "Global ap_block_state1 logic remains after patching $entry_path"
    }
    foreach pe {0 1 2 3} {
        if {[string first "assign config_fire_pe${pe} =" $patched] < 0} {
            error "Missing PE${pe} partition in patched entry process"
        }
    }

    set handle [open $entry_path w]
    fconfigure $handle -translation lf -encoding utf-8
    puts -nonewline $handle $patched
    close $handle
    puts "INFO: partitioned 20-address entry process into four five-address PE groups: $entry_path"
    puts "INFO: 300MHz RTL gate: PARTITIONED_PE_CONFIG_LAUNCH"
    return $entry_path
}

set patch_directory [file dirname [file normalize [info script]]]
set patch_invoked_directly 0
if {[info exists argv0] && [file exists $argv0]} {
    set patch_invoked_directly [expr {
        [file normalize $argv0] eq [file normalize [info script]]}]
}
if {$patch_invoked_directly && $argc == 1} {
    set generated_verilog_directory [lindex $argv 0]
} elseif {!$patch_invoked_directly || $argc == 0} {
    set generated_verilog_directory [file join $patch_directory \
        proj_int4_decoder_300mhz solution1 syn verilog]
} else {
    error "Usage: patch_partitioned_entry_proc.tcl ?generated_verilog_directory?"
}
partition_decoder_entry_proc $generated_verilog_directory
