set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

open_project proj_int4_decoder_300mhz
open_solution solution1
set patch_script [file normalize "patch_partitioned_entry_proc.tcl"]
if {![file exists $patch_script]} {
    error "Missing generated-RTL partition patch: $patch_script"
}
source $patch_script
set rtl_gate_script [file normalize "verify_generated_rtl_300mhz.tcl"]
if {![file exists $rtl_gate_script]} {
    error "Missing generated-RTL architecture gate: $rtl_gate_script"
}
source $rtl_gate_script
export_design -format xo -output int4_decoder_token_controller_300mhz.xo
set checksum_script [file normalize "write_xo_checksum.tcl"]
if {![file exists $checksum_script]} {
    error "Missing XO checksum writer: $checksum_script"
}
source $checksum_script
write_xo_checksum [file normalize "int4_decoder_token_controller_300mhz.xo"]
exit
