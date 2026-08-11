# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x0 BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe0_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x0 BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe1_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x0 BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe2_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe2_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x0 BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_pe3_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_pe3_U}
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
    id 1432 \
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
    id 1433 \
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
    id 1434 \
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
    id 1435 \
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


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1443 \
    name model_norm_cache0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache0 \
    op interface \
    ports { model_norm_cache0_address0 { O 13 vector } model_norm_cache0_ce0 { O 1 bit } model_norm_cache0_d0 { O 512 vector } model_norm_cache0_q0 { I 512 vector } model_norm_cache0_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1444 \
    name model_norm_cache1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache1 \
    op interface \
    ports { model_norm_cache1_address0 { O 13 vector } model_norm_cache1_ce0 { O 1 bit } model_norm_cache1_d0 { O 512 vector } model_norm_cache1_q0 { I 512 vector } model_norm_cache1_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1445 \
    name model_norm_cache2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache2 \
    op interface \
    ports { model_norm_cache2_address0 { O 13 vector } model_norm_cache2_ce0 { O 1 bit } model_norm_cache2_d0 { O 512 vector } model_norm_cache2_q0 { I 512 vector } model_norm_cache2_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1446 \
    name model_norm_cache3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache3 \
    op interface \
    ports { model_norm_cache3_address0 { O 13 vector } model_norm_cache3_ce0 { O 1 bit } model_norm_cache3_d0 { O 512 vector } model_norm_cache3_q0 { I 512 vector } model_norm_cache3_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1436 \
    name reciprocal_rms \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_reciprocal_rms \
    op interface \
    ports { reciprocal_rms { I 32 vector } reciprocal_rms_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1437 \
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
    id 1438 \
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
    id 1439 \
    name idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx \
    op interface \
    ports { idx { I 13 vector } idx_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1440 \
    name idx1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx1 \
    op interface \
    ports { idx1 { I 13 vector } idx1_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1441 \
    name idx2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx2 \
    op interface \
    ports { idx2 { I 13 vector } idx2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1442 \
    name idx3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx3 \
    op interface \
    ports { idx3 { I 13 vector } idx3_ap_vld { I 1 bit } } \
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


