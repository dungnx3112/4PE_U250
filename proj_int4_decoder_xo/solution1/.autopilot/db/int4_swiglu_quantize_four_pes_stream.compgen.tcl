# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe2_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe2_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe3_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x0 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe3_U}
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
    id 1091 \
    name gate_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe0 \
    op interface \
    ports { gate_pe0_address0 { O 8 vector } gate_pe0_ce0 { O 1 bit } gate_pe0_d0 { O 512 vector } gate_pe0_q0 { I 512 vector } gate_pe0_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1092 \
    name gate_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe1 \
    op interface \
    ports { gate_pe1_address0 { O 8 vector } gate_pe1_ce0 { O 1 bit } gate_pe1_d0 { O 512 vector } gate_pe1_q0 { I 512 vector } gate_pe1_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1093 \
    name gate_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe2 \
    op interface \
    ports { gate_pe2_address0 { O 8 vector } gate_pe2_ce0 { O 1 bit } gate_pe2_d0 { O 512 vector } gate_pe2_q0 { I 512 vector } gate_pe2_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1094 \
    name gate_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe3 \
    op interface \
    ports { gate_pe3_address0 { O 8 vector } gate_pe3_ce0 { O 1 bit } gate_pe3_d0 { O 512 vector } gate_pe3_q0 { I 512 vector } gate_pe3_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1095 \
    name up_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe0 \
    op interface \
    ports { up_pe0_address0 { O 8 vector } up_pe0_ce0 { O 1 bit } up_pe0_d0 { O 512 vector } up_pe0_q0 { I 512 vector } up_pe0_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1096 \
    name up_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe1 \
    op interface \
    ports { up_pe1_address0 { O 8 vector } up_pe1_ce0 { O 1 bit } up_pe1_d0 { O 512 vector } up_pe1_q0 { I 512 vector } up_pe1_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1097 \
    name up_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe2 \
    op interface \
    ports { up_pe2_address0 { O 8 vector } up_pe2_ce0 { O 1 bit } up_pe2_d0 { O 512 vector } up_pe2_q0 { I 512 vector } up_pe2_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1098 \
    name up_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe3 \
    op interface \
    ports { up_pe3_address0 { O 8 vector } up_pe3_ce0 { O 1 bit } up_pe3_d0 { O 512 vector } up_pe3_q0 { I 512 vector } up_pe3_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1099 \
    name quantized_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_stream \
    op interface \
    ports { quantized_stream_din { O 480 vector } quantized_stream_full_n { I 1 bit } quantized_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1100 \
    name scale_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_stream \
    op interface \
    ports { scale_stream_din { O 32 vector } scale_stream_full_n { I 1 bit } scale_stream_write { O 1 bit } } \
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


