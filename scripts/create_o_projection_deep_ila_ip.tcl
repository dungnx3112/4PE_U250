# Called after create_o_projection_ila_ip.tcl on the same unpacked IP.
set ip_root [file normalize $::env(O_ILA_IP_ROOT)]
set work_dir [file normalize $::env(O_ILA_WORK_DIR)]
set part $::env(O_ILA_PART)
set depth 4096
if {[info exists ::env(O_DEEP_ILA_DEPTH)]} { set depth $::env(O_DEEP_ILA_DEPTH) }
set math_depth 2048
if {[info exists ::env(O_DEEP_MATH_DEPTH)]} { set math_depth $::env(O_DEEP_MATH_DEPTH) }
foreach value [list $depth $math_depth] {
    if {$value ni {1024 2048 4096 8192 16384 32768 65536 131072}} {
        error "Deep ILA depths must be supported powers of two"
    }
}
source [file join $ip_root hdl verilog deep_ila_manifest.tcl]
file mkdir [file join $work_dir deep]
create_project -force o_deep_ila_ip [file join $work_dir deep] -part $part
set_property target_language Verilog [current_project]
set created {}
foreach spec $o_deep_core_specs {
    lassign $spec name widths
    set core_depth $depth
    if {[string match *deep_math $name]} { set core_depth $math_depth }
    set ila_dir [file join $ip_root subcore $name]
    file mkdir $ila_dir
    create_ip -name ila -vendor xilinx.com -library ip -module_name $name -dir $ila_dir
    set ip [get_ips $name]
    set config [list CONFIG.C_NUM_OF_PROBES [llength $widths] \
        CONFIG.C_DATA_DEPTH $core_depth CONFIG.C_ADV_TRIGGER false \
        CONFIG.C_EN_STRG_QUAL true CONFIG.C_INPUT_PIPE_STAGES 1]
    set index 0
    foreach width $widths {
        lappend config CONFIG.C_PROBE${index}_WIDTH $width
        incr index
    }
    set_property -dict $config $ip
    generate_target all $ip
    puts "DEEP_ILA_CORE name=$name depth=$core_depth probes=[llength $widths]"
    set generated [file normalize [get_property IP_FILE $ip]]
    set expected [file normalize [file join $ila_dir ${name}.xci]]
    if {$generated ne $expected} { file copy -force $generated $expected }
    lappend created $name
}
set core [ipx::open_core [file join $ip_root component.xml]]
set group [ipx::get_file_groups xilinx_verilogsynthesis -of_objects $core]
if {[llength $group] != 1} { error "Cannot resolve synthesis group" }
foreach name $created {
    set relative "subcore/${name}/${name}.xci"
    if {[llength [ipx::get_files -quiet $relative -of_objects $group]] == 0} {
        set file [ipx::add_file $relative $group]
        set_property TYPE xci $file
    }
}
set vlnv xilinx.com:ip:ila:6.2
if {[llength [ipx::get_subcores -quiet $vlnv -of_objects $group]] == 0} {
    ipx::add_subcore $vlnv $group
}
ipx::update_checksums $core
ipx::save_core $core
ipx::unload_core $core
close_project
puts "PASS O_PROJECTION_DEEP_ILA cores=$created inputs_depth=$depth math_depth=$math_depth"
