# Generate the two PE0 forensic ILA subcores and register their XCIs in an
# unpacked HLS IP.  The control core records addresses/handshakes/fingerprints;
# the data core records every bit of the 448/512-bit buses.
foreach name {O_ILA_IP_ROOT O_ILA_WORK_DIR O_ILA_PART O_ILA_DEPTH O_ILA_CONTROL_DEPTH} {
    if {![info exists ::env($name)] || $::env($name) eq ""} {
        error "Missing required environment variable: $name"
    }
}

set ip_root [file normalize $::env(O_ILA_IP_ROOT)]
set work_dir [file normalize $::env(O_ILA_WORK_DIR)]
set part $::env(O_ILA_PART)
set data_depth $::env(O_ILA_DEPTH)
set control_depth $::env(O_ILA_CONTROL_DEPTH)
set component [file join $ip_root component.xml]

if {![file isfile $component]} {
    error "HLS component.xml not found: $component"
}
foreach {label depth} [list O_ILA_DEPTH $data_depth O_ILA_CONTROL_DEPTH $control_depth] {
    if {![string is integer -strict $depth] || $depth < 1024 || $depth > 131072} {
        error "$label must be an integer in 1024..131072"
    }
}

proc create_forensic_ila {ip_root module_name depth widths advanced_trigger} {
    set ila_dir [file join $ip_root subcore $module_name]
    file mkdir $ila_dir
    create_ip -name ila -vendor xilinx.com -library ip \
        -module_name $module_name -dir $ila_dir
    set ila [get_ips $module_name]

    set config [list \
        CONFIG.C_NUM_OF_PROBES [llength $widths] \
        CONFIG.C_DATA_DEPTH $depth \
        CONFIG.C_ADV_TRIGGER $advanced_trigger \
        CONFIG.C_EN_STRG_QUAL {true} \
        CONFIG.C_INPUT_PIPE_STAGES {1}]
    set total_width 0
    set index 0
    foreach width $widths {
        incr total_width $width
        lappend config CONFIG.C_PROBE${index}_WIDTH $width
        incr index
    }
    if {$total_width > 4096} {
        error "$module_name total probe width exceeds 4096 bits: $total_width"
    }
    set_property -dict $config $ila
    generate_target all $ila

    set generated_xci [file normalize [get_property IP_FILE $ila]]
    set expected_xci [file normalize [file join $ila_dir ${module_name}.xci]]
    if {$generated_xci ne $expected_xci} {
        file copy -force $generated_xci $expected_xci
    }
    puts "O_ILA_CORE module=$module_name probes=[llength $widths] width=$total_width depth=$depth"
    return $ila
}

# probe0..probe56: O-qualified context, boundary checkpoints, fingerprints,
# residual add, and the AXI weight-read channel.
set control_widths {
    1 3 6 3 12 1 1 1 1 1 1 1 1 20
    1 7 32 1 7 32 1 7 8
    1 7 32 1 7 8
    1 1 32 1 1 32
    1 9 1 1 32
    1 9 32
    1 6 32
    1 6 32
    1 1 64 32 1 1 2 32
}

# probe0..probe39: complete O-boundary buses; total width is 3795 bits.
set data_widths {
    1 3 6 3 12 1 1
    1 7 448 8
    1 7 448 1 7 8
    1 7 448 1 7 8
    1 128 1 128
    1 9 512
    1 9 512
    1 6 512
    1 6 512
    20
}

file mkdir $work_dir
create_project -force o_projection_ila_ip $work_dir -part $part
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]

set control_name ila_o_projection_pe0_control
set data_name ila_o_projection_pe0_data
set control_ila [create_forensic_ila \
    $ip_root $control_name $control_depth $control_widths true]
set data_ila [create_forensic_ila \
    $ip_root $data_name $data_depth $data_widths false]

set core [ipx::open_core $component]
set synth_group [ipx::get_file_groups xilinx_verilogsynthesis -of_objects $core]
if {[llength $synth_group] != 1} {
    error "Cannot resolve the parent IP Verilog synthesis file group"
}

foreach ila [list $control_ila $data_ila] module_name [list $control_name $data_name] {
    set relative_xci "subcore/${module_name}/${module_name}.xci"
    set old_file [ipx::get_files -quiet $relative_xci -of_objects $synth_group]
    if {[llength $old_file] == 0} {
        set xci_file [ipx::add_file $relative_xci $synth_group]
        set_property TYPE xci $xci_file
    }
}

set ila_vlnv [get_property IPDEF $control_ila]
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

puts "PASS O_PROJECTION_FORENSIC_ILA cores=$control_name,$data_name vlnv=$ila_vlnv"
