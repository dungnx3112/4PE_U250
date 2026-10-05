# Connect Vivado Hardware Manager to the PE0 O-projection forensic ILAs.
#
# From an already-open Vivado Tcl Console:
#   source scripts/connect_o_projection_ila_hw.tcl
#
# Or launch Vivado from the repository root:
#   vivado -mode gui -source scripts/connect_o_projection_ila_hw.tcl
#
# Optional environment overrides:
#   O_ILA_LTX=/absolute/path/to/file.xclbin.ltx
#   O_ILA_HW_SERVER_URL=localhost:3121
#   O_ILA_XVC_URL=localhost:10200

proc env_or_default {name default_value} {
    if {[info exists ::env($name)] && $::env($name) ne ""} {
        return $::env($name)
    }
    return $default_value
}

set script_dir [file dirname [file normalize [info script]]]
set repo_root [file normalize [file join $script_dir ..]]
set default_ltx [file join $repo_root \
    int4_decoder_multikernel_100mhz_o_projection_forensic_final.xclbin.ltx]

set ltx_file [file normalize [env_or_default O_ILA_LTX $default_ltx]]
set hw_server_url [env_or_default O_ILA_HW_SERVER_URL localhost:3121]
set xvc_url [env_or_default O_ILA_XVC_URL localhost:10200]

if {![file isfile $ltx_file] || [file size $ltx_file] == 0} {
    error "ILA probes file is missing or empty: $ltx_file"
}

catch {open_hw_manager}

# connect_hw_server reports an error when this GUI is already connected.  That
# case is harmless; open_hw_target below remains the authoritative check.
if {[catch {connect_hw_server -url $hw_server_url} connect_message]} {
    puts "INFO: hw_server connection result: $connect_message"
}

puts "INFO: Opening XVC target at $xvc_url"
set active_target [current_hw_target -quiet]
if {$active_target eq ""} {
    if {[catch {open_hw_target -xvc_url $xvc_url} target_message]} {
        error "Cannot open XVC target $xvc_url: $target_message"
    }
} else {
    puts "INFO: Reusing open hardware target: $active_target"
}

set devices [get_hw_devices -quiet *debug_bridge*]
if {[llength $devices] == 0} {
    set devices [get_hw_devices -quiet]
}
if {[llength $devices] == 0} {
    error "XVC target opened, but Vivado found no hardware device"
}

set device [lindex $devices 0]
current_hw_device $device
set_property PROBES.FILE $ltx_file $device
catch {set_property FULL_PROBES.FILE {} $device}

puts "INFO: Loading probes from $ltx_file"
refresh_hw_device $device

set ilas [get_hw_ilas -quiet -of_objects $device]
set control_ila {}
set data_ila {}
foreach ila $ilas {
    set cell_name [get_property CELL_NAME $ila]
    puts "FOUND_ILA hw_name=$ila cell_name=$cell_name"
    if {[string match *ila_o_projection_pe0_control_inst* $cell_name]} {
        set control_ila $ila
    }
    if {[string match *ila_o_projection_pe0_data_inst* $cell_name]} {
        set data_ila $ila
    }
}

if {$control_ila eq "" || $data_ila eq ""} {
    error "Expected PE0 control and data ILAs; found [llength $ilas] ILA core(s)"
}

puts "PASS O_PROJECTION_ILA_HW_CONNECTED"
puts "  device:  $device"
puts "  control: $control_ila"
puts "  data:    $data_ila"
puts "  ltx:     $ltx_file"
puts "Next: set control probe28 == 1 and data probe10 == 1, then arm both cores."
