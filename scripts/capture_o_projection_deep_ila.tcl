# Used by the existing automatic host/XVC wrapper when point=deep.
source [file join [file dirname [file normalize [info script]]] connect_o_projection_ila_hw.tcl]
set device $::O_ILA_DEVICE
set ilas {}
foreach core {inputs math} {
    set matched {}
    foreach ila [get_hw_ilas -quiet -of_objects $device] {
        if {[string match *ila_o_projection_pe0_deep_${core}_inst* [get_property CELL_NAME $ila]]} {
            lappend matched $ila
        }
    }
    if {[llength $matched] != 1} { error "Expected one deep-$core ILA, got $matched" }
    lappend ilas [lindex $matched 0]
}
set position 512
if {[info exists ::env(O_ILA_TRIGGER_POSITION)]} { set position $::env(O_ILA_TRIGGER_POSITION) }
set default_dir [file normalize [file join [file dirname [info script]] .. ila_captures \
    "[clock format [clock seconds] -format %Y%m%d-%H%M%S]-deep"]]
set out $default_dir
if {[info exists ::env(O_ILA_CAPTURE_DIR)]} { set out [file normalize $::env(O_ILA_CAPTURE_DIR)] }
file mkdir $out
set trigger_word 0
if {[info exists ::env(O_DEEP_TRIGGER_WORD)]} { set trigger_word $::env(O_DEEP_TRIGGER_WORD) }
if {![string is integer -strict $trigger_word] || $trigger_word < 0 || $trigger_word >= 32768} {
    error "O_DEEP_TRIGGER_WORD must be an O word index in 0..32767"
}
foreach ila $ilas {
    reset_hw_ila -reset_compare_values true $ila
    set_property CONTROL.TRIGGER_CONDITION AND $ila
    set_property CONTROL.TRIGGER_POSITION $position $ila
    if {$trigger_word == 0} {
        set comparisons [list o_deep_trigger {eq1'b1}]
    } else {
        set comparisons [list o_deep_is_o {eq1'b1} o_deep_weight_fire {eq1'b1} \
            o_deep_weight_index "eq20'h[format %05x $trigger_word]"]
    }
    foreach {signal comparison} $comparisons {
        set probe [get_hw_probes -quiet -of_objects $ila -filter "NAME =~ *${signal}*"]
        if {[llength $probe] != 1} { error "Deep trigger probe missing/ambiguous: $signal on $ila" }
        set_property TRIGGER_COMPARE_VALUE $comparison $probe
    }
    run_hw_ila $ila
}
puts "BOTH DEEP ILAS ARMED; trigger O accepted weight word index=$trigger_word."
if {[info exists ::env(O_ILA_CONTINUE_FIFO)] && $::env(O_ILA_CONTINUE_FIFO) ne ""} {
    set fifo [open $::env(O_ILA_CONTINUE_FIFO) w]
    puts $fifo ""
    flush $fifo
    close $fifo
} else { puts "Press Enter in the paused host now." }
foreach ila $ilas core {inputs math} {
    wait_on_hw_ila $ila
    set data [upload_hw_ila_data $ila]
    set base [file join $out o_projection_deep_${core}]
    write_hw_ila_data -force ${base}.ila $data
    write_hw_ila_data -force -csv_file ${base}.csv $data
    write_hw_ila_data -force -vcd_file ${base}.vcd $data
}
set handle [open [file join $out capture_info.txt] w]
puts $handle "capture_point=deep"
puts $handle "trigger_position=$position"
puts $handle "ltx=$::env(O_ILA_LTX)"
puts $handle "trigger_word=$trigger_word"
close $handle
puts "PASS DEEP_CAPTURE CAPTURE_DIR=$out"
