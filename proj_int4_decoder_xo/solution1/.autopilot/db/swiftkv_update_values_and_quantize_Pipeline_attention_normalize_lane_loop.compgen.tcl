# This script segment is generated automatically by AutoPilot

set name int4_decoder_token_controller_mul_32s_32s_49_5_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {dsp} LATENCY 4 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_sparsemux_9_2_32_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {auto}
}


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
    id 701 \
    name attention_group \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename attention_group \
    op interface \
    ports { attention_group_address0 { O 5 vector } attention_group_ce0 { O 1 bit } attention_group_we0 { O 1 bit } attention_group_d0 { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'attention_group'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 702 \
    name weighted_value_engine0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine0 \
    op interface \
    ports { weighted_value_engine0_address0 { O 3 vector } weighted_value_engine0_ce0 { O 1 bit } weighted_value_engine0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 703 \
    name weighted_value_engine0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine0_1 \
    op interface \
    ports { weighted_value_engine0_1_address0 { O 3 vector } weighted_value_engine0_1_ce0 { O 1 bit } weighted_value_engine0_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 704 \
    name weighted_value_engine0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine0_2 \
    op interface \
    ports { weighted_value_engine0_2_address0 { O 3 vector } weighted_value_engine0_2_ce0 { O 1 bit } weighted_value_engine0_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 705 \
    name weighted_value_engine0_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine0_3 \
    op interface \
    ports { weighted_value_engine0_3_address0 { O 3 vector } weighted_value_engine0_3_ce0 { O 1 bit } weighted_value_engine0_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 707 \
    name weighted_value_engine1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine1 \
    op interface \
    ports { weighted_value_engine1_address0 { O 3 vector } weighted_value_engine1_ce0 { O 1 bit } weighted_value_engine1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 708 \
    name weighted_value_engine1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine1_1 \
    op interface \
    ports { weighted_value_engine1_1_address0 { O 3 vector } weighted_value_engine1_1_ce0 { O 1 bit } weighted_value_engine1_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 709 \
    name weighted_value_engine1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine1_2 \
    op interface \
    ports { weighted_value_engine1_2_address0 { O 3 vector } weighted_value_engine1_2_ce0 { O 1 bit } weighted_value_engine1_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 710 \
    name weighted_value_engine1_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine1_3 \
    op interface \
    ports { weighted_value_engine1_3_address0 { O 3 vector } weighted_value_engine1_3_ce0 { O 1 bit } weighted_value_engine1_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 711 \
    name weighted_value_engine2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine2 \
    op interface \
    ports { weighted_value_engine2_address0 { O 3 vector } weighted_value_engine2_ce0 { O 1 bit } weighted_value_engine2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 712 \
    name weighted_value_engine2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine2_1 \
    op interface \
    ports { weighted_value_engine2_1_address0 { O 3 vector } weighted_value_engine2_1_ce0 { O 1 bit } weighted_value_engine2_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 713 \
    name weighted_value_engine2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine2_2 \
    op interface \
    ports { weighted_value_engine2_2_address0 { O 3 vector } weighted_value_engine2_2_ce0 { O 1 bit } weighted_value_engine2_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 714 \
    name weighted_value_engine2_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine2_3 \
    op interface \
    ports { weighted_value_engine2_3_address0 { O 3 vector } weighted_value_engine2_3_ce0 { O 1 bit } weighted_value_engine2_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 715 \
    name weighted_value_engine3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine3 \
    op interface \
    ports { weighted_value_engine3_address0 { O 3 vector } weighted_value_engine3_ce0 { O 1 bit } weighted_value_engine3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 716 \
    name weighted_value_engine3_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine3_1 \
    op interface \
    ports { weighted_value_engine3_1_address0 { O 3 vector } weighted_value_engine3_1_ce0 { O 1 bit } weighted_value_engine3_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 717 \
    name weighted_value_engine3_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine3_2 \
    op interface \
    ports { weighted_value_engine3_2_address0 { O 3 vector } weighted_value_engine3_2_ce0 { O 1 bit } weighted_value_engine3_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 718 \
    name weighted_value_engine3_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename weighted_value_engine3_3 \
    op interface \
    ports { weighted_value_engine3_3_address0 { O 3 vector } weighted_value_engine3_3_ce0 { O 1 bit } weighted_value_engine3_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 700 \
    name sext_ln1488 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln1488 \
    op interface \
    ports { sext_ln1488 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 706 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name max_abs_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_max_abs_out \
    op interface \
    ports { max_abs_out { O 32 vector } max_abs_out_ap_vld { O 1 bit } } \
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


