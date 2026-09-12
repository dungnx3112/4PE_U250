# Standalone OOC Place & Route for int4_swiftkv_attention_pe0
# Target: 270 MHz (3.703 ns) on xcu250-figd2104-2L-e, 1 SLR (SLR0)
# Reference: run_pnr_linear_4pe.tcl (MatMul standalone)
# Prerequisite: run_hls_attention_standalone.tcl must have completed

set script_dir [file dirname [file normalize [info script]]]
set output_dir [file join $script_dir "pnr_attention_standalone_run"]
file mkdir $output_dir
cd $output_dir

# ---------------------------------------------------------------------------
# 1. Read Verilog RTL from HLS output
# ---------------------------------------------------------------------------
set verilog_dir [file join $script_dir "proj_int4_attention_standalone/solution_270mhz/impl/verilog"]
set verilog_files [glob $verilog_dir/*.v]
puts "INFO: Reading [llength $verilog_files] Verilog files from $verilog_dir"
read_verilog $verilog_files

# IP wrapper Verilog (if any)
set ip_verilog_dir [file join $script_dir "proj_int4_attention_standalone/solution_270mhz/impl/ip/hdl/ip"]
set ip_verilog_files [glob -nocomplain $ip_verilog_dir/*.v]
if {[llength $ip_verilog_files] > 0} {
    puts "INFO: Reading [llength $ip_verilog_files] IP wrapper Verilog files"
    read_verilog $ip_verilog_files
}

# ---------------------------------------------------------------------------
# 2. Read XCI IP cores (floating point, DSP48 wrappers, etc.)
# ---------------------------------------------------------------------------
set xci_dir [file join $script_dir "proj_int4_attention_standalone/solution_270mhz/impl/ip/tmp.srcs/sources_1/ip"]
set xci_files [glob -nocomplain $xci_dir/*/*.xci]
if {[llength $xci_files] > 0} {
    puts "INFO: Reading [llength $xci_files] XCI IP cores"
    read_ip $xci_files
    generate_target {synthesis} [get_ips]
}

# ---------------------------------------------------------------------------
# 3. OOC Synthesis on xcu250
# ---------------------------------------------------------------------------
puts "INFO: Starting OOC Synthesis for int4_swiftkv_attention_pe0 on xcu250-figd2104-2L-e..."
synth_design -top int4_swiftkv_attention_pe0 -part xcu250-figd2104-2L-e -mode out_of_context

# ---------------------------------------------------------------------------
# 4. Clock Constraint: 3.703 ns = 270 MHz
# ---------------------------------------------------------------------------
puts "INFO: Applying clock constraint: 3.703 ns (270 MHz)..."
create_clock -period 3.703 -name ap_clk [get_ports ap_clk]

# ---------------------------------------------------------------------------
# 5. Floorplan — constrain PE0 attention cells into SLR0
# ---------------------------------------------------------------------------
puts "INFO: Creating SLR0 pblock for attention PE0..."
create_pblock pblock_attention_SLR0
resize_pblock pblock_attention_SLR0 -add [get_slrs SLR0]

# Select all cells — for standalone PE0 everything should go in SLR0
# Using broad selectors to catch promoted swiftkv cells
set all_cells [get_cells -hierarchical -filter {PRIMITIVE_LEVEL != MACRO}]
if {[llength $all_cells] > 0} {
    add_cells_to_pblock pblock_attention_SLR0 $all_cells
    puts "INFO: Pblock SLR0: assigned [llength $all_cells] cells (all logic in PE0)"
}

# Additional fine-grained constraint for promoted swiftkv arithmetic cells
# These patterns mirror timing_300mhz_pre_place.tcl place_attention_pe_cells logic
set swiftkv_cells [get_cells -hierarchical -filter {
    NAME =~ *swiftkv* ||
    NAME =~ *grp_swiftkv* ||
    NAME =~ *quantize_kv* ||
    NAME =~ *attention_head* ||
    NAME =~ *seed_local* ||
    NAME =~ *run_pe* ||
    NAME =~ *collect_pe* ||
    NAME =~ *update_values*
}]
if {[llength $swiftkv_cells] > 0} {
    puts "INFO: Reinforcing [llength $swiftkv_cells] swiftkv-specific cells into SLR0"
    add_cells_to_pblock pblock_attention_SLR0 $swiftkv_cells
}

# ---------------------------------------------------------------------------
# 6. Implementation Pipeline
# ---------------------------------------------------------------------------
puts "INFO: Running opt_design..."
opt_design

puts "INFO: Running place_design with SSI_SpreadSLLs..."
place_design -directive SSI_SpreadSLLs

puts "INFO: Running phys_opt_design (pre-route, AggressiveExplore)..."
phys_opt_design -directive AggressiveExplore

puts "INFO: Running route_design (Explore)..."
route_design -directive Explore

puts "INFO: Running post-route phys_opt_design..."
phys_opt_design -directive AggressiveExplore

# ---------------------------------------------------------------------------
# 7. Reports and Checkpoint
# ---------------------------------------------------------------------------
puts "INFO: Generating timing and utilization reports..."
report_timing_summary -file timing_summary_270mhz.rpt
report_utilization -file utilization.rpt
report_clock_utilization -file clock_utilization.rpt
report_route_status -file route_status.rpt

write_checkpoint -force int4_swiftkv_attention_pe0_routed.dcp

# ---------------------------------------------------------------------------
# 8. Final Result Summary
# ---------------------------------------------------------------------------
set wns [get_property SLACK [get_timing_paths -max_paths 1 -setup]]
set whs [get_property SLACK [get_timing_paths -max_paths 1 -hold]]

# Count routing errors
set route_status [report_route_status -return_string]
set unrouted_count [llength [get_nets -filter {ROUTE_STATUS == UNROUTED}]]
set route_errors  [llength [get_nets -filter {ROUTE_STATUS == FAILED}]]

puts "=================================================="
puts "FINAL RESULT: Attention PE0 Standalone @ 270 MHz"
puts "  WNS (Setup) = $wns ns"
puts "  WHS (Hold)  = $whs ns"
puts "  Unrouted nets = $unrouted_count"
puts "  Route errors  = $route_errors"
puts "--------------------------------------------------"
if {$wns >= 0.0 && $whs >= 0.0 && $unrouted_count == 0 && $route_errors == 0} {
    puts "TIMING CLOSED: Attention PE0 PASS at 270 MHz!"
    puts "Ready to integrate into full Token Decoder build."
} else {
    puts "TIMING VIOLATED or ROUTE ERRORS detected."
    if {$wns < 0.0} { puts "  >> Setup violation: WNS = $wns ns" }
    if {$whs < 0.0} { puts "  >> Hold violation:  WHS = $whs ns" }
    if {$unrouted_count > 0} { puts "  >> Unrouted: $unrouted_count nets" }
    if {$route_errors > 0}   { puts "  >> Failed routes: $route_errors nets" }
}
puts "=================================================="

exit
