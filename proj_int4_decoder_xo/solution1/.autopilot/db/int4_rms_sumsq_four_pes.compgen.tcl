# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {partial_0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {partial_1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {partial_2_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {partial_3_U}
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
    id 1297 \
    name input_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_pe0 \
    op interface \
    ports { input_pe0_address0 { O 6 vector } input_pe0_ce0 { O 1 bit } input_pe0_d0 { O 512 vector } input_pe0_q0 { I 512 vector } input_pe0_we0 { O 1 bit } input_pe0_address1 { O 6 vector } input_pe0_ce1 { O 1 bit } input_pe0_d1 { O 512 vector } input_pe0_q1 { I 512 vector } input_pe0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1298 \
    name input_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_pe1 \
    op interface \
    ports { input_pe1_address0 { O 6 vector } input_pe1_ce0 { O 1 bit } input_pe1_d0 { O 512 vector } input_pe1_q0 { I 512 vector } input_pe1_we0 { O 1 bit } input_pe1_address1 { O 6 vector } input_pe1_ce1 { O 1 bit } input_pe1_d1 { O 512 vector } input_pe1_q1 { I 512 vector } input_pe1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1299 \
    name input_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_pe2 \
    op interface \
    ports { input_pe2_address0 { O 6 vector } input_pe2_ce0 { O 1 bit } input_pe2_d0 { O 512 vector } input_pe2_q0 { I 512 vector } input_pe2_we0 { O 1 bit } input_pe2_address1 { O 6 vector } input_pe2_ce1 { O 1 bit } input_pe2_d1 { O 512 vector } input_pe2_q1 { I 512 vector } input_pe2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1300 \
    name input_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename input_pe3 \
    op interface \
    ports { input_pe3_address0 { O 6 vector } input_pe3_ce0 { O 1 bit } input_pe3_d0 { O 512 vector } input_pe3_q0 { I 512 vector } input_pe3_we0 { O 1 bit } input_pe3_address1 { O 6 vector } input_pe3_ce1 { O 1 bit } input_pe3_d1 { O 512 vector } input_pe3_q1 { I 512 vector } input_pe3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'input_pe3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1301 \
    name reciprocal_rms \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_reciprocal_rms \
    op interface \
    ports { reciprocal_rms { O 32 vector } reciprocal_rms_ap_vld { O 1 bit } } \
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


