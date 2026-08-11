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
    id 606 \
    name weighted_value_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_0 \
    op interface \
    ports { weighted_value_0_address0 { O 3 vector } weighted_value_0_ce0 { O 1 bit } weighted_value_0_q0 { I 32 vector } weighted_value_0_address1 { O 3 vector } weighted_value_0_ce1 { O 1 bit } weighted_value_0_we1 { O 1 bit } weighted_value_0_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 607 \
    name weighted_value_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_1 \
    op interface \
    ports { weighted_value_1_address0 { O 3 vector } weighted_value_1_ce0 { O 1 bit } weighted_value_1_q0 { I 32 vector } weighted_value_1_address1 { O 3 vector } weighted_value_1_ce1 { O 1 bit } weighted_value_1_we1 { O 1 bit } weighted_value_1_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 608 \
    name weighted_value_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_2 \
    op interface \
    ports { weighted_value_2_address0 { O 3 vector } weighted_value_2_ce0 { O 1 bit } weighted_value_2_q0 { I 32 vector } weighted_value_2_address1 { O 3 vector } weighted_value_2_ce1 { O 1 bit } weighted_value_2_we1 { O 1 bit } weighted_value_2_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 609 \
    name weighted_value_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_3 \
    op interface \
    ports { weighted_value_3_address0 { O 3 vector } weighted_value_3_ce0 { O 1 bit } weighted_value_3_q0 { I 32 vector } weighted_value_3_address1 { O 3 vector } weighted_value_3_ce1 { O 1 bit } weighted_value_3_we1 { O 1 bit } weighted_value_3_d1 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 604 \
    name engine1_phase_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_engine1_phase_stream \
    op interface \
    ports { engine1_phase_stream_dout { I 57 vector } engine1_phase_stream_num_data_valid { I 4 vector } engine1_phase_stream_fifo_cap { I 4 vector } engine1_phase_stream_empty_n { I 1 bit } engine1_phase_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 605 \
    name position \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_position \
    op interface \
    ports { position_dout { I 12 vector } position_num_data_valid { I 3 vector } position_fifo_cap { I 3 vector } position_empty_n { I 1 bit } position_read { O 1 bit } } \
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


