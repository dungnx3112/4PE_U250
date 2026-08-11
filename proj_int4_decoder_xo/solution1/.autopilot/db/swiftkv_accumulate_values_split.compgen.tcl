# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w59_d4_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine0_control_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w59_d4_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine1_control_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w59_d4_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine2_control_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w59_d4_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine3_control_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c33_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c34_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c35_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c36_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w57_d8_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine0_phase_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c32_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w57_d8_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine1_phase_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c31_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w57_d8_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine2_phase_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c30_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w57_d8_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {engine3_phase_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {position_val_c_U}
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
    id 677 \
    name weighted_value_engine0_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine0_0 \
    op interface \
    ports { weighted_value_engine0_0_address0 { O 3 vector } weighted_value_engine0_0_ce0 { O 1 bit } weighted_value_engine0_0_d0 { O 32 vector } weighted_value_engine0_0_q0 { I 32 vector } weighted_value_engine0_0_we0 { O 1 bit } weighted_value_engine0_0_address1 { O 3 vector } weighted_value_engine0_0_ce1 { O 1 bit } weighted_value_engine0_0_d1 { O 32 vector } weighted_value_engine0_0_q1 { I 32 vector } weighted_value_engine0_0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 678 \
    name weighted_value_engine0_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine0_1 \
    op interface \
    ports { weighted_value_engine0_1_address0 { O 3 vector } weighted_value_engine0_1_ce0 { O 1 bit } weighted_value_engine0_1_d0 { O 32 vector } weighted_value_engine0_1_q0 { I 32 vector } weighted_value_engine0_1_we0 { O 1 bit } weighted_value_engine0_1_address1 { O 3 vector } weighted_value_engine0_1_ce1 { O 1 bit } weighted_value_engine0_1_d1 { O 32 vector } weighted_value_engine0_1_q1 { I 32 vector } weighted_value_engine0_1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 679 \
    name weighted_value_engine0_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine0_2 \
    op interface \
    ports { weighted_value_engine0_2_address0 { O 3 vector } weighted_value_engine0_2_ce0 { O 1 bit } weighted_value_engine0_2_d0 { O 32 vector } weighted_value_engine0_2_q0 { I 32 vector } weighted_value_engine0_2_we0 { O 1 bit } weighted_value_engine0_2_address1 { O 3 vector } weighted_value_engine0_2_ce1 { O 1 bit } weighted_value_engine0_2_d1 { O 32 vector } weighted_value_engine0_2_q1 { I 32 vector } weighted_value_engine0_2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 680 \
    name weighted_value_engine0_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine0_3 \
    op interface \
    ports { weighted_value_engine0_3_address0 { O 3 vector } weighted_value_engine0_3_ce0 { O 1 bit } weighted_value_engine0_3_d0 { O 32 vector } weighted_value_engine0_3_q0 { I 32 vector } weighted_value_engine0_3_we0 { O 1 bit } weighted_value_engine0_3_address1 { O 3 vector } weighted_value_engine0_3_ce1 { O 1 bit } weighted_value_engine0_3_d1 { O 32 vector } weighted_value_engine0_3_q1 { I 32 vector } weighted_value_engine0_3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine0_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 681 \
    name weighted_value_engine1_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine1_0 \
    op interface \
    ports { weighted_value_engine1_0_address0 { O 3 vector } weighted_value_engine1_0_ce0 { O 1 bit } weighted_value_engine1_0_d0 { O 32 vector } weighted_value_engine1_0_q0 { I 32 vector } weighted_value_engine1_0_we0 { O 1 bit } weighted_value_engine1_0_address1 { O 3 vector } weighted_value_engine1_0_ce1 { O 1 bit } weighted_value_engine1_0_d1 { O 32 vector } weighted_value_engine1_0_q1 { I 32 vector } weighted_value_engine1_0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 682 \
    name weighted_value_engine1_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine1_1 \
    op interface \
    ports { weighted_value_engine1_1_address0 { O 3 vector } weighted_value_engine1_1_ce0 { O 1 bit } weighted_value_engine1_1_d0 { O 32 vector } weighted_value_engine1_1_q0 { I 32 vector } weighted_value_engine1_1_we0 { O 1 bit } weighted_value_engine1_1_address1 { O 3 vector } weighted_value_engine1_1_ce1 { O 1 bit } weighted_value_engine1_1_d1 { O 32 vector } weighted_value_engine1_1_q1 { I 32 vector } weighted_value_engine1_1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 683 \
    name weighted_value_engine1_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine1_2 \
    op interface \
    ports { weighted_value_engine1_2_address0 { O 3 vector } weighted_value_engine1_2_ce0 { O 1 bit } weighted_value_engine1_2_d0 { O 32 vector } weighted_value_engine1_2_q0 { I 32 vector } weighted_value_engine1_2_we0 { O 1 bit } weighted_value_engine1_2_address1 { O 3 vector } weighted_value_engine1_2_ce1 { O 1 bit } weighted_value_engine1_2_d1 { O 32 vector } weighted_value_engine1_2_q1 { I 32 vector } weighted_value_engine1_2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 684 \
    name weighted_value_engine1_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine1_3 \
    op interface \
    ports { weighted_value_engine1_3_address0 { O 3 vector } weighted_value_engine1_3_ce0 { O 1 bit } weighted_value_engine1_3_d0 { O 32 vector } weighted_value_engine1_3_q0 { I 32 vector } weighted_value_engine1_3_we0 { O 1 bit } weighted_value_engine1_3_address1 { O 3 vector } weighted_value_engine1_3_ce1 { O 1 bit } weighted_value_engine1_3_d1 { O 32 vector } weighted_value_engine1_3_q1 { I 32 vector } weighted_value_engine1_3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine1_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 685 \
    name weighted_value_engine2_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine2_0 \
    op interface \
    ports { weighted_value_engine2_0_address0 { O 3 vector } weighted_value_engine2_0_ce0 { O 1 bit } weighted_value_engine2_0_d0 { O 32 vector } weighted_value_engine2_0_q0 { I 32 vector } weighted_value_engine2_0_we0 { O 1 bit } weighted_value_engine2_0_address1 { O 3 vector } weighted_value_engine2_0_ce1 { O 1 bit } weighted_value_engine2_0_d1 { O 32 vector } weighted_value_engine2_0_q1 { I 32 vector } weighted_value_engine2_0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 686 \
    name weighted_value_engine2_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine2_1 \
    op interface \
    ports { weighted_value_engine2_1_address0 { O 3 vector } weighted_value_engine2_1_ce0 { O 1 bit } weighted_value_engine2_1_d0 { O 32 vector } weighted_value_engine2_1_q0 { I 32 vector } weighted_value_engine2_1_we0 { O 1 bit } weighted_value_engine2_1_address1 { O 3 vector } weighted_value_engine2_1_ce1 { O 1 bit } weighted_value_engine2_1_d1 { O 32 vector } weighted_value_engine2_1_q1 { I 32 vector } weighted_value_engine2_1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 687 \
    name weighted_value_engine2_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine2_2 \
    op interface \
    ports { weighted_value_engine2_2_address0 { O 3 vector } weighted_value_engine2_2_ce0 { O 1 bit } weighted_value_engine2_2_d0 { O 32 vector } weighted_value_engine2_2_q0 { I 32 vector } weighted_value_engine2_2_we0 { O 1 bit } weighted_value_engine2_2_address1 { O 3 vector } weighted_value_engine2_2_ce1 { O 1 bit } weighted_value_engine2_2_d1 { O 32 vector } weighted_value_engine2_2_q1 { I 32 vector } weighted_value_engine2_2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 688 \
    name weighted_value_engine2_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine2_3 \
    op interface \
    ports { weighted_value_engine2_3_address0 { O 3 vector } weighted_value_engine2_3_ce0 { O 1 bit } weighted_value_engine2_3_d0 { O 32 vector } weighted_value_engine2_3_q0 { I 32 vector } weighted_value_engine2_3_we0 { O 1 bit } weighted_value_engine2_3_address1 { O 3 vector } weighted_value_engine2_3_ce1 { O 1 bit } weighted_value_engine2_3_d1 { O 32 vector } weighted_value_engine2_3_q1 { I 32 vector } weighted_value_engine2_3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine2_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 689 \
    name weighted_value_engine3_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine3_0 \
    op interface \
    ports { weighted_value_engine3_0_address0 { O 3 vector } weighted_value_engine3_0_ce0 { O 1 bit } weighted_value_engine3_0_d0 { O 32 vector } weighted_value_engine3_0_q0 { I 32 vector } weighted_value_engine3_0_we0 { O 1 bit } weighted_value_engine3_0_address1 { O 3 vector } weighted_value_engine3_0_ce1 { O 1 bit } weighted_value_engine3_0_d1 { O 32 vector } weighted_value_engine3_0_q1 { I 32 vector } weighted_value_engine3_0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 690 \
    name weighted_value_engine3_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine3_1 \
    op interface \
    ports { weighted_value_engine3_1_address0 { O 3 vector } weighted_value_engine3_1_ce0 { O 1 bit } weighted_value_engine3_1_d0 { O 32 vector } weighted_value_engine3_1_q0 { I 32 vector } weighted_value_engine3_1_we0 { O 1 bit } weighted_value_engine3_1_address1 { O 3 vector } weighted_value_engine3_1_ce1 { O 1 bit } weighted_value_engine3_1_d1 { O 32 vector } weighted_value_engine3_1_q1 { I 32 vector } weighted_value_engine3_1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 691 \
    name weighted_value_engine3_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine3_2 \
    op interface \
    ports { weighted_value_engine3_2_address0 { O 3 vector } weighted_value_engine3_2_ce0 { O 1 bit } weighted_value_engine3_2_d0 { O 32 vector } weighted_value_engine3_2_q0 { I 32 vector } weighted_value_engine3_2_we0 { O 1 bit } weighted_value_engine3_2_address1 { O 3 vector } weighted_value_engine3_2_ce1 { O 1 bit } weighted_value_engine3_2_d1 { O 32 vector } weighted_value_engine3_2_q1 { I 32 vector } weighted_value_engine3_2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 692 \
    name weighted_value_engine3_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename weighted_value_engine3_3 \
    op interface \
    ports { weighted_value_engine3_3_address0 { O 3 vector } weighted_value_engine3_3_ce0 { O 1 bit } weighted_value_engine3_3_d0 { O 32 vector } weighted_value_engine3_3_q0 { I 32 vector } weighted_value_engine3_3_we0 { O 1 bit } weighted_value_engine3_3_address1 { O 3 vector } weighted_value_engine3_3_ce1 { O 1 bit } weighted_value_engine3_3_d1 { O 32 vector } weighted_value_engine3_3_q1 { I 32 vector } weighted_value_engine3_3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'weighted_value_engine3_3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 666 \
    name value_metadata_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value_metadata_stream \
    op interface \
    ports { value_metadata_stream_dout { I 40 vector } value_metadata_stream_empty_n { I 1 bit } value_metadata_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 667 \
    name value0_engine0_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine0_stream \
    op interface \
    ports { value0_engine0_stream_dout { I 128 vector } value0_engine0_stream_empty_n { I 1 bit } value0_engine0_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 668 \
    name value0_engine1_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine1_stream \
    op interface \
    ports { value0_engine1_stream_dout { I 128 vector } value0_engine1_stream_empty_n { I 1 bit } value0_engine1_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 669 \
    name value0_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine2_stream \
    op interface \
    ports { value0_engine2_stream_dout { I 128 vector } value0_engine2_stream_empty_n { I 1 bit } value0_engine2_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 670 \
    name value0_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine3_stream \
    op interface \
    ports { value0_engine3_stream_dout { I 128 vector } value0_engine3_stream_empty_n { I 1 bit } value0_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name value1_engine0_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine0_stream \
    op interface \
    ports { value1_engine0_stream_dout { I 128 vector } value1_engine0_stream_empty_n { I 1 bit } value1_engine0_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name value1_engine1_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine1_stream \
    op interface \
    ports { value1_engine1_stream_dout { I 128 vector } value1_engine1_stream_empty_n { I 1 bit } value1_engine1_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name value1_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine2_stream \
    op interface \
    ports { value1_engine2_stream_dout { I 128 vector } value1_engine2_stream_empty_n { I 1 bit } value1_engine2_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name value1_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine3_stream \
    op interface \
    ports { value1_engine3_stream_dout { I 128 vector } value1_engine3_stream_empty_n { I 1 bit } value1_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name control_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_stream \
    op interface \
    ports { control_stream_dout { I 19 vector } control_stream_empty_n { I 1 bit } control_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name position_val \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_position_val \
    op interface \
    ports { position_val { I 12 vector } position_val_ap_vld { I 1 bit } } \
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


