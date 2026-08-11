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
    id 546 \
    name update_phase_count \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_update_phase_count \
    op interface \
    ports { update_phase_count { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 547 \
    name engine2_phase_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_engine2_phase_stream \
    op interface \
    ports { engine2_phase_stream_din { O 57 vector } engine2_phase_stream_num_data_valid { I 4 vector } engine2_phase_stream_fifo_cap { I 4 vector } engine2_phase_stream_full_n { I 1 bit } engine2_phase_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 548 \
    name engine2_control_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_engine2_control_stream \
    op interface \
    ports { engine2_control_stream_dout { I 59 vector } engine2_control_stream_num_data_valid { I 3 vector } engine2_control_stream_fifo_cap { I 3 vector } engine2_control_stream_empty_n { I 1 bit } engine2_control_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 549 \
    name value0_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine2_stream \
    op interface \
    ports { value0_engine2_stream_dout { I 128 vector } value0_engine2_stream_num_data_valid { I 6 vector } value0_engine2_stream_fifo_cap { I 6 vector } value0_engine2_stream_empty_n { I 1 bit } value0_engine2_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 550 \
    name value1_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine2_stream \
    op interface \
    ports { value1_engine2_stream_dout { I 128 vector } value1_engine2_stream_num_data_valid { I 6 vector } value1_engine2_stream_fifo_cap { I 6 vector } value1_engine2_stream_empty_n { I 1 bit } value1_engine2_stream_read { O 1 bit } } \
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


