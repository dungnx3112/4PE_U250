# Local structural validation for constraints/ila_o_projection.tcl.
# It synthesizes the current PE0 HLS RTL, inserts the ILA, and checks that the
# expected core and probe count exist. It does not run implementation.

set script_dir [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_dir ".."]]
set rtl_dir [file join $repo_root proj_int4_decoder_pe0 solution_300mhz syn verilog]
set run_dir [file join $repo_root _rtl_check o_projection_ila_validation]

if {![file isdirectory $rtl_dir]} {
    error "Generated PE0 RTL directory does not exist: $rtl_dir"
}

file mkdir $run_dir
create_project -force validate_o_projection_ila [file join $run_dir project] \
    -part xcu250-figd2104-2L-e
set_property target_language Verilog [current_project]

set rtl_files [lsort [glob -nocomplain -directory $rtl_dir *.v]]
if {[llength $rtl_files] == 0} {
    error "No generated Verilog files found under $rtl_dir"
}
read_verilog $rtl_files

foreach ip_tcl [lsort [glob -nocomplain -directory $rtl_dir *_ip.tcl]] {
    source $ip_tcl
}

set synth_dcp [file join $run_dir pe0_synth.dcp]
if {[file isfile $synth_dcp]} {
    open_checkpoint $synth_dcp
} else {
    set_property top int4_decoder_pe0_kernel [current_fileset]
    update_compile_order -fileset sources_1
    synth_design -top int4_decoder_pe0_kernel -part xcu250-figd2104-2L-e
    write_checkpoint -force $synth_dcp
}

set ::env(O_ILA_PE) 0
set ::env(O_ILA_DEPTH) 1024
set ::env(O_ILA_DATA_BITS) 32
source [file join $repo_root constraints ila_o_projection.tcl]

set cores [get_debug_cores -quiet ila_o_projection_pe0]
if {[llength $cores] != 1} {
    error "Expected one ila_o_projection_pe0 core, found [llength $cores]"
}
set probes [get_debug_ports -quiet ila_o_projection_pe0/probe*]
if {[llength $probes] < 18} {
    error "Expected at least 18 O-boundary probes, found [llength $probes]"
}

write_checkpoint -force [file join $run_dir pe0_with_o_projection_ila.dcp]
puts "PASS O_PROJECTION_ILA_INSERT core=ila_o_projection_pe0 probes=[llength $probes]"
close_project
