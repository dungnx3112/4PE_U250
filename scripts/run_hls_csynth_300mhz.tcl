set script_directory [file dirname [file normalize [info script]]]
cd $script_directory

# Fast verification flow: synthesize and generate reports without packaging XO.
open_project -reset proj_int4_decoder_300mhz
set_top int4_decoder_token_controller

set cflags "-std=c++11 -DAP_INT_MAX_W=4096"
foreach source_file [list \
    swiftkv_attention.cpp \
    int4_linear_controller.cpp \
    int4_decoder_controller.cpp \
    int4_decoder_blocks.cpp] {
    add_files $source_file -cflags $cflags
}

open_solution -reset solution1 -flow_target vitis
set_part {xcu250-figd2104-2L-e}
# Final implementation target: 300 MHz.
create_clock -period 3.333333 -name default
config_interface -m_axi_latency 32
config_interface -m_axi_alignment_byte_size 64
config_interface -m_axi_max_widen_bitwidth 512
# Register every M_AXI adapter input/output at the kernel boundary to shorten
# the BRAM/FIFO-to-PE routes that are critical at the 3.333 ns clock period.
config_interface -m_axi_register_io all
# Let HLS select BRAM, LUTRAM, or URAM for each M_AXI internal buffer.  This is
# intentionally "auto" rather than forcing wide buffers into LUTRAM.
config_interface -m_axi_buffer_impl auto
config_rtl -register_reset_num 3
config_dataflow -start_fifo_depth 8

csynth_design
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
exit
