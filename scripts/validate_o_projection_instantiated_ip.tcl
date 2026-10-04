# Validate an unpacked, HDL-instrumented PE0 HLS IP by synthesizing it OOC.
if {![info exists ::env(O_ILA_TEST_IP_REPO)] || $::env(O_ILA_TEST_IP_REPO) eq ""} {
    error "Set O_ILA_TEST_IP_REPO to the directory that contains the packaged HLS IP"
}

set script_dir [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_dir ..]]
set run_dir [file join $repo_root _iv]
set ip_repo [file normalize $::env(O_ILA_TEST_IP_REPO)]
set part xcu250-figd2104-2L-e

file mkdir $run_dir
create_project -force validate_o_projection_instantiated_ip \
    [file join $run_dir project] -part $part
set_property ip_repo_paths $ip_repo [current_project]
update_ip_catalog

set parent_vlnv xilinx.com:hls:int4_decoder_pe0_kernel:1.0
if {[llength [get_ipdefs -all -quiet $parent_vlnv]] != 1} {
    error "Instrumented PE0 IP is not visible in the repository: $ip_repo"
}
create_ip -vlnv $parent_vlnv -module_name pe0_o_projection_ila_test
set parent_ip [get_ips pe0_o_projection_ila_test]
generate_target synthesis $parent_ip
synth_ip -force $parent_ip

set ip_file [get_property IP_FILE $parent_ip]
set ip_dir [file dirname $ip_file]
set expected_dcp [file join $ip_dir pe0_o_projection_ila_test.dcp]
set dcp {}
if {[file isfile $expected_dcp]} {
    lappend dcp $expected_dcp
} else {
    set dcp [get_files -quiet -all -filter {FILE_TYPE == "Design Checkpoint"}]
}
if {[llength $dcp] == 0 || ![file isfile [lindex $dcp 0]]} {
    error "Parent-IP synthesis produced no DCP"
}

open_checkpoint [lindex $dcp 0]
set ila_cells {}
foreach instance {ila_o_projection_pe0_control_inst ila_o_projection_pe0_data_inst} {
    set cells [get_cells -hierarchical -quiet -regexp "^.*/${instance}$"]
    if {[llength $cells] != 1} {
        error "Synthesized PE0 IP expected one $instance, found [llength $cells]"
    }
    lappend ila_cells [lindex $cells 0]
}
puts "PASS O_PROJECTION_FORENSIC_ILA_HDL_INSTANCES cells=$ila_cells dcp=[lindex $dcp 0]"
close_project
