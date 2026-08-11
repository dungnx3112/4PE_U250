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
    id 73 \
    name current_cos \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename current_cos \
    op interface \
    ports { current_cos_address0 { O 6 vector } current_cos_ce0 { O 1 bit } current_cos_q0 { I 19 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'current_cos'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 74 \
    name current_sin \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename current_sin \
    op interface \
    ports { current_sin_address0 { O 6 vector } current_sin_ce0 { O 1 bit } current_sin_q0 { I 19 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'current_sin'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name cos_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cos_pe0 \
    op interface \
    ports { cos_pe0_din { O 19 vector } cos_pe0_num_data_valid { I 3 vector } cos_pe0_fifo_cap { I 3 vector } cos_pe0_full_n { I 1 bit } cos_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name cos_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cos_pe1 \
    op interface \
    ports { cos_pe1_din { O 19 vector } cos_pe1_num_data_valid { I 3 vector } cos_pe1_fifo_cap { I 3 vector } cos_pe1_full_n { I 1 bit } cos_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name cos_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cos_pe2 \
    op interface \
    ports { cos_pe2_din { O 19 vector } cos_pe2_num_data_valid { I 3 vector } cos_pe2_fifo_cap { I 3 vector } cos_pe2_full_n { I 1 bit } cos_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name cos_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cos_pe3 \
    op interface \
    ports { cos_pe3_din { O 19 vector } cos_pe3_num_data_valid { I 3 vector } cos_pe3_fifo_cap { I 3 vector } cos_pe3_full_n { I 1 bit } cos_pe3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name sin_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sin_pe0 \
    op interface \
    ports { sin_pe0_din { O 19 vector } sin_pe0_num_data_valid { I 3 vector } sin_pe0_fifo_cap { I 3 vector } sin_pe0_full_n { I 1 bit } sin_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name sin_pe1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sin_pe1 \
    op interface \
    ports { sin_pe1_din { O 19 vector } sin_pe1_num_data_valid { I 3 vector } sin_pe1_fifo_cap { I 3 vector } sin_pe1_full_n { I 1 bit } sin_pe1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name sin_pe2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sin_pe2 \
    op interface \
    ports { sin_pe2_din { O 19 vector } sin_pe2_num_data_valid { I 3 vector } sin_pe2_fifo_cap { I 3 vector } sin_pe2_full_n { I 1 bit } sin_pe2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name sin_pe3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sin_pe3 \
    op interface \
    ports { sin_pe3_din { O 19 vector } sin_pe3_num_data_valid { I 3 vector } sin_pe3_fifo_cap { I 3 vector } sin_pe3_full_n { I 1 bit } sin_pe3_write { O 1 bit } } \
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


