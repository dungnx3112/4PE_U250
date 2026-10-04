# Generate the ILA subcore and register its XCI in an unpacked HLS IP.
foreach name {O_ILA_IP_ROOT O_ILA_WORK_DIR O_ILA_PART O_ILA_DEPTH} {
    if {![info exists ::env($name)] || $::env($name) eq ""} {
        error "Missing required environment variable: $name"
    }
}

set ip_root [file normalize $::env(O_ILA_IP_ROOT)]
set work_dir [file normalize $::env(O_ILA_WORK_DIR)]
set part $::env(O_ILA_PART)
set depth $::env(O_ILA_DEPTH)
set component [file join $ip_root component.xml]
set ila_dir [file join $ip_root subcore ila_o_projection_pe0]

if {![file isfile $component]} {
    error "HLS component.xml not found: $component"
}
if {![string is integer -strict $depth] || $depth < 1024 || $depth > 131072} {
    error "O_ILA_DEPTH must be an integer in 1024..131072"
}

file mkdir $work_dir
file mkdir $ila_dir
create_project -force o_projection_ila_ip $work_dir -part $part
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]

create_ip -name ila -vendor xilinx.com -library ip \
    -module_name ila_o_projection_pe0 -dir $ila_dir
set ila [get_ips ila_o_projection_pe0]
set_property -dict [list \
    CONFIG.C_NUM_OF_PROBES {20} \
    CONFIG.C_DATA_DEPTH $depth \
    CONFIG.C_ADV_TRIGGER {true} \
    CONFIG.C_EN_STRG_QUAL {true} \
    CONFIG.C_INPUT_PIPE_STAGES {0} \
    CONFIG.C_PROBE0_WIDTH {1} \
    CONFIG.C_PROBE1_WIDTH {1} \
    CONFIG.C_PROBE2_WIDTH {1} \
    CONFIG.C_PROBE3_WIDTH {7} \
    CONFIG.C_PROBE4_WIDTH {1} \
    CONFIG.C_PROBE5_WIDTH {1} \
    CONFIG.C_PROBE6_WIDTH {32} \
    CONFIG.C_PROBE7_WIDTH {7} \
    CONFIG.C_PROBE8_WIDTH {1} \
    CONFIG.C_PROBE9_WIDTH {1} \
    CONFIG.C_PROBE10_WIDTH {8} \
    CONFIG.C_PROBE11_WIDTH {7} \
    CONFIG.C_PROBE12_WIDTH {1} \
    CONFIG.C_PROBE13_WIDTH {32} \
    CONFIG.C_PROBE14_WIDTH {7} \
    CONFIG.C_PROBE15_WIDTH {1} \
    CONFIG.C_PROBE16_WIDTH {8} \
    CONFIG.C_PROBE17_WIDTH {9} \
    CONFIG.C_PROBE18_WIDTH {1} \
    CONFIG.C_PROBE19_WIDTH {32}] $ila
generate_target all $ila

set xci [file normalize [get_property IP_FILE $ila]]
set expected_xci [file normalize [file join $ila_dir ila_o_projection_pe0.xci]]
if {$xci ne $expected_xci} {
    file copy -force $xci $expected_xci
}

set core [ipx::open_core $component]
set synth_group [ipx::get_file_groups xilinx_verilogsynthesis -of_objects $core]
if {[llength $synth_group] != 1} {
    error "Cannot resolve the parent IP Verilog synthesis file group"
}

set relative_xci "subcore/ila_o_projection_pe0/ila_o_projection_pe0.xci"
set old_file [ipx::get_files -quiet $relative_xci -of_objects $synth_group]
if {[llength $old_file] == 0} {
    set xci_file [ipx::add_file $relative_xci $synth_group]
    set_property TYPE xci $xci_file
}

set ila_vlnv [get_property IPDEF $ila]
if {$ila_vlnv eq ""} {
    set ila_vlnv "xilinx.com:ip:ila:6.2"
}
if {[llength [ipx::get_subcores -quiet $ila_vlnv -of_objects $synth_group]] == 0} {
    ipx::add_subcore $ila_vlnv $synth_group
}

ipx::update_checksums $core
ipx::save_core $core
ipx::unload_core $core
close_project

puts "PASS O_PROJECTION_ILA_IP xci=$relative_xci depth=$depth vlnv=$ila_vlnv"
