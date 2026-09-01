open_project proj_int4_decoder_300mhz
open_solution solution1
set patch_script [file normalize "patch_partitioned_entry_proc.tcl"]
if {![file exists $patch_script]} {
    error "Missing generated-RTL partition patch: $patch_script"
}
source $patch_script
export_design -format xo -output int4_decoder_token_controller_300mhz.xo
exit
