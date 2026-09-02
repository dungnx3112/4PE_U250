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
        {\.NUM_READ_OUTSTANDING\([[:space:]]*4[[:space:]]*\)}]
    if {$read_burst_count != 4 || $read_outstanding_count != 4} {
        error "300MHz RTL gate: expected four AXI windows of 4x64; burst=$read_burst_count outstanding=$read_outstanding_count"
    }

    foreach pe {0 1 2 3} {
        set prepare [glob -nocomplain -directory $rtl_directory \
            "*int4_prepare_local_weight_request_${pe}*.v"]
        set reader [glob -nocomplain -directory $rtl_directory \
            "*int4_read_local_weights_${pe}*.v"]
        if {[llength $prepare] == 0 || [llength $reader] == 0} {
            error "300MHz RTL gate: PE${pe} registered weight request/reader boundary is missing"
        }
    }

    set legacy [glob -nocomplain -directory $rtl_directory \
        "*int4_stream_local_weights_*.v"]
    if {[llength $legacy] != 0} {
        error "300MHz RTL gate: legacy base+word weight reader is still present: $legacy"
    }
    puts "INFO: 300MHz RTL gate: LOCAL_WEIGHT_REQUEST_PIPELINES_VERIFIED"
    puts "INFO: 300MHz RTL gate: AXI_READ_WINDOWS_4X64_VERIFIED"
}

set validator_directory [file dirname [file normalize [info script]]]
set generated_rtl_directory [file join $validator_directory \
    proj_int4_decoder_300mhz solution1 syn verilog]
verify_generated_rtl_300mhz $generated_rtl_directory
