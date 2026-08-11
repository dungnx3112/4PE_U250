# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1414 \
    name quantized_pe0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe0 \
    op interface \
    ports { quantized_pe0_dout { I 480 vector } quantized_pe0_num_data_valid { I 3 vector } quantized_pe0_fifo_cap { I 3 vector } quantized_pe0_empty_n { I 1 bit } quantized_pe0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1415 \
    name quantized_pe1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe1 \
    op interface \
    ports { quantized_pe1_dout { I 480 vector } quantized_pe1_num_data_valid { I 3 vector } quantized_pe1_fifo_cap { I 3 vector } quantized_pe1_empty_n { I 1 bit } quantized_pe1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1416 \
    name quantized_pe2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe2 \
    op interface \
    ports { quantized_pe2_dout { I 480 vector } quantized_pe2_num_data_valid { I 3 vector } quantized_pe2_fifo_cap { I 3 vector } quantized_pe2_empty_n { I 1 bit } quantized_pe2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1417 \
    name quantized_pe3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe3 \
    op interface \
    ports { quantized_pe3_dout { I 480 vector } quantized_pe3_num_data_valid { I 3 vector } quantized_pe3_fifo_cap { I 3 vector } quantized_pe3_empty_n { I 1 bit } quantized_pe3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1418 \
    name scale_pe0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_pe0 \
    op interface \
    ports { scale_pe0_dout { I 32 vector } scale_pe0_num_data_valid { I 3 vector } scale_pe0_fifo_cap { I 3 vector } scale_pe0_empty_n { I 1 bit } scale_pe0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1419 \
    name scale_pe1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_pe1 \
    op interface \
    ports { scale_pe1_dout { I 32 vector } scale_pe1_num_data_valid { I 3 vector } scale_pe1_fifo_cap { I 3 vector } scale_pe1_empty_n { I 1 bit } scale_pe1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1420 \
    name scale_pe2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_pe2 \
    op interface \
    ports { scale_pe2_dout { I 32 vector } scale_pe2_num_data_valid { I 3 vector } scale_pe2_fifo_cap { I 3 vector } scale_pe2_empty_n { I 1 bit } scale_pe2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1421 \
    name scale_pe3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_pe3 \
    op interface \
    ports { scale_pe3_dout { I 32 vector } scale_pe3_num_data_valid { I 3 vector } scale_pe3_fifo_cap { I 3 vector } scale_pe3_empty_n { I 1 bit } scale_pe3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1422 \
    name quantized_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_stream \
    op interface \
    ports { quantized_stream_din { O 480 vector } quantized_stream_num_data_valid { I 3 vector } quantized_stream_fifo_cap { I 3 vector } quantized_stream_full_n { I 1 bit } quantized_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1423 \
    name scale_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_stream \
    op interface \
    ports { scale_stream_din { O 32 vector } scale_stream_num_data_valid { I 3 vector } scale_stream_fifo_cap { I 3 vector } scale_stream_full_n { I 1 bit } scale_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName int4_decoder_token_controller_flow_control_loop_pipe_U
set CompName int4_decoder_token_controller_flow_control_loop_pipe
set name flow_control_loop_pipe
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix int4_decoder_token_controller_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


