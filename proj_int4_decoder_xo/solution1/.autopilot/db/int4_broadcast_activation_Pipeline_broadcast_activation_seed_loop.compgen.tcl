# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1503 \
    name quantized \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename quantized \
    op interface \
    ports { quantized_address0 { O 9 vector } quantized_ce0 { O 1 bit } quantized_we0 { O 1 bit } quantized_d0 { O 480 vector } quantized_q0 { I 480 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'quantized'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1505 \
    name packed_scales \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename packed_scales \
    op interface \
    ports { packed_scales_address0 { O 5 vector } packed_scales_ce0 { O 1 bit } packed_scales_we0 { O 1 bit } packed_scales_d0 { O 512 vector } packed_scales_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'packed_scales'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1496 \
    name shl_ln \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl_ln \
    op interface \
    ports { shl_ln { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1497 \
    name active_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_active_3 \
    op interface \
    ports { active_3 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1498 \
    name active_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_active_2 \
    op interface \
    ports { active_2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1499 \
    name active_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_active_1 \
    op interface \
    ports { active_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1500 \
    name active_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_active_0 \
    op interface \
    ports { active_0 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1501 \
    name quantized_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_stream \
    op interface \
    ports { quantized_stream_dout { I 480 vector } quantized_stream_num_data_valid { I 3 vector } quantized_stream_fifo_cap { I 3 vector } quantized_stream_empty_n { I 1 bit } quantized_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1502 \
    name scale_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_stream \
    op interface \
    ports { scale_stream_dout { I 32 vector } scale_stream_num_data_valid { I 3 vector } scale_stream_fifo_cap { I 3 vector } scale_stream_empty_n { I 1 bit } scale_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1504 \
    name stream_activation \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stream_activation \
    op interface \
    ports { stream_activation { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1506 \
    name quantized_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe0 \
    op interface \
    ports { quantized_pe0_din { O 480 vector } quantized_pe0_num_data_valid { I 3 vector } quantized_pe0_fifo_cap { I 3 vector } quantized_pe0_full_n { I 1 bit } quantized_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1507 \
    name activation_scale_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe0 \
    op interface \
    ports { activation_scale_pe0_din { O 32 vector } activation_scale_pe0_num_data_valid { I 3 vector } activation_scale_pe0_fifo_cap { I 3 vector } activation_scale_pe0_full_n { I 1 bit } activation_scale_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1508 \
    name quantized_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe1 \
    op interface \
    ports { quantized_pe1_din { O 480 vector } quantized_pe1_num_data_valid { I 3 vector } quantized_pe1_fifo_cap { I 3 vector } quantized_pe1_full_n { I 1 bit } quantized_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1509 \
    name activation_scale_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe1 \
    op interface \
    ports { activation_scale_pe1_din { O 32 vector } activation_scale_pe1_num_data_valid { I 3 vector } activation_scale_pe1_fifo_cap { I 3 vector } activation_scale_pe1_full_n { I 1 bit } activation_scale_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1510 \
    name quantized_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe2 \
    op interface \
    ports { quantized_pe2_din { O 480 vector } quantized_pe2_num_data_valid { I 3 vector } quantized_pe2_fifo_cap { I 3 vector } quantized_pe2_full_n { I 1 bit } quantized_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1511 \
    name activation_scale_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe2 \
    op interface \
    ports { activation_scale_pe2_din { O 32 vector } activation_scale_pe2_num_data_valid { I 3 vector } activation_scale_pe2_fifo_cap { I 3 vector } activation_scale_pe2_full_n { I 1 bit } activation_scale_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1512 \
    name quantized_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe3 \
    op interface \
    ports { quantized_pe3_din { O 480 vector } quantized_pe3_num_data_valid { I 3 vector } quantized_pe3_fifo_cap { I 3 vector } quantized_pe3_full_n { I 1 bit } quantized_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1513 \
    name activation_scale_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe3 \
    op interface \
    ports { activation_scale_pe3_din { O 32 vector } activation_scale_pe3_num_data_valid { I 3 vector } activation_scale_pe3_fifo_cap { I 3 vector } activation_scale_pe3_full_n { I 1 bit } activation_scale_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1514 \
    name streamed_scale_word_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_streamed_scale_word_out \
    op interface \
    ports { streamed_scale_word_out { O 512 vector } streamed_scale_word_out_ap_vld { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
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
set InstName int4_decoder_token_controller_flow_control_loop_pipe_sequential_init_U
set CompName int4_decoder_token_controller_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
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


