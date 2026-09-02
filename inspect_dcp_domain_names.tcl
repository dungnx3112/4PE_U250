# Diagnostic helper for deriving stable HLS hierarchy patterns from a routed
# checkpoint.  It is intentionally read-only.
if {$argc != 1} {
    error "Usage: inspect_dcp_domain_names.tcl <checkpoint.dcp>"
}
open_checkpoint [file normalize [lindex $argv 0]]
set kernel [lindex [get_cells -quiet -hierarchical -filter {
    NAME =~ */int4_decoder_token_controller_1/inst}] 0]
if {$kernel eq ""} {
    error "Decoder kernel hierarchy was not found"
}

foreach token {
        int4_decoder_local_pe_0 int4_decoder_local_pe_1
        int4_decoder_local_pe_2 int4_decoder_local_pe_3
        int4_run_local_pe_0 int4_run_local_pe_1
        int4_run_local_pe_2 int4_run_local_pe_3
        int4_stream_local_weights_0 int4_stream_local_weights_1
        int4_stream_local_weights_2 int4_stream_local_weights_3
        gmem0_m_axi_U gmem1_m_axi_U gmem2_m_axi_U gmem3_m_axi_U
        load_all_residuals position} {
    set cells [get_cells -quiet -hierarchical -filter "NAME =~ *${token}*"]
    puts "DOMAIN_TOKEN,$token,[llength $cells]"
    foreach cell $cells {
        if {[get_property IS_PRIMITIVE $cell]} {
            puts "LEAF,$token,[get_property REF_NAME $cell],[get_property NAME $cell]"
        } else {
            puts "HIER,$token,[get_property REF_NAME $cell],[get_property NAME $cell]"
        }
    }
}
close_design
