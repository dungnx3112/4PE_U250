# Arm, wait for, upload, and save both PE0 O-projection forensic ILAs.
#
# Prerequisite in the same Vivado Tcl Console:
#   source scripts/connect_o_projection_ila_hw.tcl
#
# Default use:
#   source scripts/capture_o_projection_ila.tcl
#
# Select one checkpoint before sourcing this script:
#   set ::env(O_ILA_CAPTURE_POINT) input_write
#   set ::env(O_ILA_CAPTURE_POINT) input_read
#   set ::env(O_ILA_CAPTURE_POINT) partial
#   set ::env(O_ILA_CAPTURE_POINT) completed
#   set ::env(O_ILA_CAPTURE_POINT) output
#   set ::env(O_ILA_CAPTURE_POINT) projection_read
#   set ::env(O_ILA_CAPTURE_POINT) residual
#
# Optional:
#   set ::env(O_ILA_TRIGGER_POSITION) 960
#   set ::env(O_ILA_CAPTURE_DIR) /absolute/output/directory

namespace eval ::o_projection_capture {
    variable script_dir [file dirname [file normalize [info script]]]
    variable repo_root [file normalize [file join $script_dir ..]]
}

proc ::o_projection_capture::env_or_default {name default_value} {
    if {[info exists ::env($name)] && $::env($name) ne ""} {
        return $::env($name)
    }
    return $default_value
}

proc ::o_projection_capture::banner {text} {
    puts ""
    puts "================================================================"
    puts $text
    puts "================================================================"
}

proc ::o_projection_capture::require_connected_ila {variable_name label} {
    if {![info exists ::$variable_name]} {
        error "$label is not connected. First run: source scripts/connect_o_projection_ila_hw.tcl"
    }
    set ila [set ::$variable_name]
    if {$ila eq "" || [llength [get_hw_ilas -quiet $ila]] != 1} {
        error "$label is stale or unavailable. Re-run: source scripts/connect_o_projection_ila_hw.tcl"
    }
    return $ila
}

proc ::o_projection_capture::find_unique_probe {ila signal_name label} {
    set probes [get_hw_probes -quiet -of_objects $ila \
        -filter "NAME =~ *${signal_name}*"]
    if {[llength $probes] != 1} {
        puts "ERROR: Probe lookup for $label matched [llength $probes] object(s): $probes"
        puts "Available probes containing o_ila_o_:"
        foreach probe [get_hw_probes -quiet -of_objects $ila \
                -filter {NAME =~ *o_ila_o_*}] {
            puts "  $probe"
        }
        error "Expected exactly one $label probe containing '$signal_name' on $ila"
    }
    return [lindex $probes 0]
}

proc ::o_projection_capture::write_capture {capture base_path} {
    write_hw_ila_data -force ${base_path}.ila $capture
    write_hw_ila_data -force -csv_file ${base_path}.csv $capture
    write_hw_ila_data -force -vcd_file ${base_path}.vcd $capture
}

proc ::o_projection_capture::main {} {
    variable repo_root

    set control_ila [require_connected_ila O_ILA_CONTROL_ILA "Control ILA"]
    set data_ila [require_connected_ila O_ILA_DATA_ILA "Data ILA"]

    set point [string tolower [env_or_default O_ILA_CAPTURE_POINT output]]
    set point_to_signal [dict create \
        input_write     o_ila_o_swift_q_we \
        input_read      o_ila_o_q_ce \
        partial         o_ila_o_partial_write \
        completed       o_ila_o_completed_read \
        output          o_ila_o_output_we \
        projection_read o_ila_o_projection_read_ce \
        residual        o_ila_o_residual_we]
    if {![dict exists $point_to_signal $point]} {
        error "Invalid O_ILA_CAPTURE_POINT '$point'. Valid values: [join [dict keys $point_to_signal] {, }]"
    }
    set signal_name [dict get $point_to_signal $point]

    set trigger_position [env_or_default O_ILA_TRIGGER_POSITION 960]
    if {![string is integer -strict $trigger_position] || $trigger_position < 0} {
        error "O_ILA_TRIGGER_POSITION must be a non-negative integer"
    }

    set default_dir [file join $repo_root ila_captures \
        "[clock format [clock seconds] -format %Y%m%d-%H%M%S]-$point"]
    set capture_dir [file normalize \
        [env_or_default O_ILA_CAPTURE_DIR $default_dir]]
    file mkdir $capture_dir

    banner "PE0 O-PROJECTION CAPTURE: $point"
    puts "INFO: Qualified trigger signal: $signal_name"
    puts "INFO: Trigger position        : $trigger_position"
    puts "INFO: Capture directory       : $capture_dir"

    set control_probe [find_unique_probe $control_ila $signal_name \
        "control trigger"]
    set data_probe [find_unique_probe $data_ila $signal_name \
        "data trigger"]
    puts "INFO: Control trigger probe   : $control_probe"
    puts "INFO: Data trigger probe      : $data_probe"

    reset_hw_ila -reset_compare_values true $control_ila
    reset_hw_ila -reset_compare_values true $data_ila

    foreach ila [list $control_ila $data_ila] {
        if {[catch {
            set_property CONTROL.TRIGGER_POSITION $trigger_position $ila
        } position_error]} {
            error "Cannot set trigger position $trigger_position on $ila: $position_error"
        }
    }
    set_property TRIGGER_COMPARE_VALUE {eq1'b1} $control_probe
    set_property TRIGGER_COMPARE_VALUE {eq1'b1} $data_probe

    # Arm the wide data core first, then the control core. Do not set
    # CONTROL.TRIGGER_MODE: that property is read-only in Vivado 2023.2.
    run_hw_ila $data_ila
    run_hw_ila $control_ila

    banner "BOTH O-PROJECTION ILAS ARMED"
    puts "Return to the paused host program and press Enter now."
    puts "Vivado will wait until the selected O-only checkpoint occurs."

    wait_on_hw_ila $control_ila
    wait_on_hw_ila $data_ila

    set control_capture [upload_hw_ila_data $control_ila]
    set data_capture [upload_hw_ila_data $data_ila]

    set control_base [file join $capture_dir o_projection_${point}_control]
    set data_base [file join $capture_dir o_projection_${point}_data]
    write_capture $control_capture $control_base
    write_capture $data_capture $data_base

    set metadata_path [file join $capture_dir capture_info.txt]
    set metadata [open $metadata_path w]
    puts $metadata "capture_point=$point"
    puts $metadata "trigger_signal=$signal_name"
    puts $metadata "trigger_position=$trigger_position"
    puts $metadata "control_ila=$control_ila"
    puts $metadata "data_ila=$data_ila"
    puts $metadata "timestamp=[clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
    close $metadata

    banner "PASS O_PROJECTION_CAPTURES_SAVED"
    puts "CAPTURE_POINT=$point"
    puts "CAPTURE_DIR=$capture_dir"
    puts "Files:"
    puts "  ${control_base}.ila/.csv/.vcd"
    puts "  ${data_base}.ila/.csv/.vcd"
    puts "  $metadata_path"
}

::o_projection_capture::main
