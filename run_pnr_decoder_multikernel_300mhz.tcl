# ============================================================================
# Standalone OOC Place & Route for 4-PE INT4 Decoder Multi-Kernel
# Target: AMD Alveo U250 (xcu250-figd2104-2L-e) @ 300 MHz (3.333 ns)
# Across 4 SLRs (SLR0..3) with 12 Point-to-Point AXI4-Stream Links
# NO XPFM / NO VITIS PLATFORM / NO XCLBIN REQUIRED
# ============================================================================

set script_dir [file dirname [file normalize [info script]]]
set output_dir [file join $script_dir "pnr_decoder_multikernel_300mhz_run"]
file mkdir $output_dir
cd $output_dir

puts "======================================================================"
puts "STARTING STANDALONE OOC PNR FOR 4-PE MULTI-KERNEL DECODER @ 300 MHz"
puts "Target Part:       xcu250-figd2104-2L-e (AMD Alveo U250)"
puts "Target Clock:      300.0 MHz (Period: 3.333 ns)"
puts "Working Directory: $output_dir"
puts "======================================================================"

# ---------------------------------------------------------------------------
# 0. Initialize In-Memory Project with U250 Part
# ---------------------------------------------------------------------------
# Setting part explicitly in project prevents IP lock mismatch with default Versal part
create_project -in_memory -part xcu250-figd2104-2L-e

# ---------------------------------------------------------------------------
# 1. Read Verilog RTL from all 4 HLS projects
# ---------------------------------------------------------------------------
set all_verilog_files [list]
for {set pe 0} {$pe < 4} {incr pe} {
    # Check solution_300mhz first, fall back to solution_270mhz if not yet run
    set pe_vdir [file join $script_dir "proj_int4_decoder_pe${pe}" "solution_300mhz" "syn" "verilog"]
    if {![file exists $pe_vdir]} {
        set pe_vdir [file join $script_dir "proj_int4_decoder_pe${pe}" "solution_270mhz" "syn" "verilog"]
    }
    
    if {![file exists $pe_vdir]} {
        error "ERROR: No synthesized Verilog found for PE${pe} in proj_int4_decoder_pe${pe}!"
    }
    
    set pe_vfiles [glob -nocomplain $pe_vdir/*.v]
    puts "INFO: PE${pe}: Found [llength $pe_vfiles] Verilog files in $pe_vdir"
    lappend all_verilog_files {*}$pe_vfiles

    # IP wrapper Verilog files
    set pe_ip_vdir [file join [file dirname [file dirname $pe_vdir]] "impl" "ip" "hdl" "ip"]
    set pe_ip_vfiles [glob -nocomplain $pe_ip_vdir/*.v]
    if {[llength $pe_ip_vfiles] > 0} {
        puts "INFO: PE${pe}: Found [llength $pe_ip_vfiles] IP wrapper Verilog files"
        lappend all_verilog_files {*}$pe_ip_vfiles
    }
}

# Top Integration Wrapper
set top_wrapper [file join $script_dir "int4_decoder_multikernel_top.v"]
if {![file exists $top_wrapper]} {
    error "ERROR: Top wrapper does not exist: $top_wrapper"
}
lappend all_verilog_files $top_wrapper
puts "INFO: Total Verilog files to read: [llength $all_verilog_files]"
read_verilog $all_verilog_files

# ---------------------------------------------------------------------------
# 2. Read and generate target for all XCI IP cores
# ---------------------------------------------------------------------------
set all_xci_files [list]
for {set pe 0} {$pe < 4} {incr pe} {
    set pe_sol_dir [file join $script_dir "proj_int4_decoder_pe${pe}" "solution_300mhz"]
    if {![file exists $pe_sol_dir]} {
        set pe_sol_dir [file join $script_dir "proj_int4_decoder_pe${pe}" "solution_270mhz"]
    }
    set pe_xci_dir [file join $pe_sol_dir "impl" "ip" "tmp.srcs" "sources_1" "ip"]
    set pe_xcis [glob -nocomplain $pe_xci_dir/*/*.xci]
    puts "INFO: PE${pe}: Found [llength $pe_xcis] XCI IP cores in $pe_xci_dir"
    lappend all_xci_files {*}$pe_xcis
}

if {[llength $all_xci_files] > 0} {
    puts "INFO: Reading [llength $all_xci_files] total XCI IP cores..."
    read_ip $all_xci_files
    puts "INFO: Generating synthesis targets for IP cores..."
    generate_target {synthesis} [get_ips]
}

# ---------------------------------------------------------------------------
# 3. OOC Synthesis on xcu250
# ---------------------------------------------------------------------------
puts "INFO: Starting OOC Synthesis for int4_decoder_multikernel_top on xcu250-figd2104-2L-e..."
synth_design -top int4_decoder_multikernel_top -part xcu250-figd2104-2L-e -mode out_of_context

# ---------------------------------------------------------------------------
# 4. Clock Constraint: 3.333 ns = 300 MHz
# ---------------------------------------------------------------------------
puts "INFO: Applying clock constraint: 3.333 ns (300 MHz)..."
create_clock -period 3.333 -name ap_clk [get_ports ap_clk]

# ---------------------------------------------------------------------------
# 5. 4-SLR Floorplan Pblocks
# ---------------------------------------------------------------------------
puts "INFO: Creating 4-SLR Floorplan Pblocks for U250..."

create_pblock pblock_SLR0
resize_pblock pblock_SLR0 -add [get_slrs SLR0]
set c0 [get_cells -quiet pe0_inst]
if {[llength $c0] == 0} { set c0 [get_cells -hierarchical -filter {NAME =~ *pe0*}] }
add_cells_to_pblock [get_pblocks pblock_SLR0] $c0
puts "INFO: Pblock SLR0: assigned [llength $c0] cells"

create_pblock pblock_SLR1
resize_pblock pblock_SLR1 -add [get_slrs SLR1]
set c1 [get_cells -quiet pe1_inst]
if {[llength $c1] == 0} { set c1 [get_cells -hierarchical -filter {NAME =~ *pe1*}] }
add_cells_to_pblock [get_pblocks pblock_SLR1] $c1
puts "INFO: Pblock SLR1: assigned [llength $c1] cells"

create_pblock pblock_SLR2
resize_pblock pblock_SLR2 -add [get_slrs SLR2]
set c2 [get_cells -quiet pe2_inst]
if {[llength $c2] == 0} { set c2 [get_cells -hierarchical -filter {NAME =~ *pe2*}] }
add_cells_to_pblock [get_pblocks pblock_SLR2] $c2
puts "INFO: Pblock SLR2: assigned [llength $c2] cells"

create_pblock pblock_SLR3
resize_pblock pblock_SLR3 -add [get_slrs SLR3]
set c3 [get_cells -quiet pe3_inst]
if {[llength $c3] == 0} { set c3 [get_cells -hierarchical -filter {NAME =~ *pe3*}] }
add_cells_to_pblock [get_pblocks pblock_SLR3] $c3
puts "INFO: Pblock SLR3: assigned [llength $c3] cells"

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

puts "INFO: Running post-route phys_opt_design (AggressiveExplore)..."
phys_opt_design -directive AggressiveExplore

# ---------------------------------------------------------------------------
# 7. Reports and Checkpoint
# ---------------------------------------------------------------------------
puts "INFO: Generating timing and utilization reports..."
report_timing_summary -file timing_summary_300mhz.rpt
report_timing -delay_type max -max_paths 10 -nworst 1 -file worst_10_setup_paths_300mhz.rpt
report_utilization -file utilization_300mhz.rpt
report_utilization -slr -file utilization_slr_300mhz.rpt
report_clock_utilization -file clock_utilization_300mhz.rpt
report_route_status -file route_status_300mhz.rpt

puts "INFO: Writing routed checkpoint..."
write_checkpoint -force int4_decoder_multikernel_4pe_300mhz_routed.dcp

# ---------------------------------------------------------------------------
# 8. Final Result & Fmax Calculation
# ---------------------------------------------------------------------------
set target_period 3.333
set wns [get_property SLACK [get_timing_paths -max_paths 1 -setup]]
set whs [get_property SLACK [get_timing_paths -max_paths 1 -hold]]

set unrouted_count [llength [get_nets -filter {ROUTE_STATUS == UNROUTED}]]
set route_errors  [llength [get_nets -filter {ROUTE_STATUS == FAILED}]]

set actual_period [expr {$target_period - $wns}]
set fmax_mhz [expr {1000.0 / $actual_period}]

puts ""
puts "======================================================================"
puts "FINAL RESULT: 4-PE Multi-Kernel Decoder PnR @ 300 MHz (Out-of-Context)"
puts "======================================================================"
puts [format "  Target Frequency : 300.00 MHz (Target Period: %.3f ns)" $target_period]
puts [format "  Worst Setup Slack: %+.3f ns (WNS)" $wns]
puts [format "  Worst Hold Slack : %+.3f ns (WHS)" $whs]
puts [format "  Achieved Fmax    : %.2f MHz (Period: %.3f ns)" $fmax_mhz $actual_period]
puts [format "  Unrouted nets    : %d" $unrouted_count]
puts [format "  Route errors     : %d" $route_errors]
puts "----------------------------------------------------------------------"
if {$wns >= 0.0 && $whs >= 0.0 && $unrouted_count == 0 && $route_errors == 0} {
    puts ">> RESULT: \[PASS\] TIMING CLOSED AT 300 MHz!"
} else {
    puts ">> RESULT: \[FAIL\] TIMING NOT CLOSED AT 300 MHz."
    if {$wns < 0.0} { puts [format "   >> Setup violation: WNS = %+.3f ns (Need %.2f MHz or pipeline adjustment)" $wns $fmax_mhz] }
    if {$whs < 0.0} { puts [format "   >> Hold violation:  WHS = %+.3f ns" $whs] }
    if {$unrouted_count > 0} { puts "   >> Unrouted: $unrouted_count nets" }
    if {$route_errors > 0}   { puts "   >> Failed routes: $route_errors nets" }
}
puts "======================================================================"
puts "Check full report at: [file join $output_dir timing_summary_300mhz.rpt]"
puts "Check worst paths at: [file join $output_dir worst_10_setup_paths_300mhz.rpt]"
puts "Routed checkpoint:    [file join $output_dir int4_decoder_multikernel_4pe_300mhz_routed.dcp]"
puts "======================================================================"

exit
