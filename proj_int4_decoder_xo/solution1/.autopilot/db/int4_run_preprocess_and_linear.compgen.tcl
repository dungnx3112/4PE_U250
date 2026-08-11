# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d4_B_x1 BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {quantized_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d4_S_x2 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {scale_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w1_d2_S BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {icmp_ln113_loc_i_channel_U}
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
    id 2820 \
    name activation_q \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename activation_q \
    op interface \
    ports { activation_q_address0 { O 9 vector } activation_q_ce0 { O 1 bit } activation_q_d0 { O 480 vector } activation_q_q0 { I 480 vector } activation_q_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'activation_q'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2821 \
    name activation_scale \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename activation_scale \
    op interface \
    ports { activation_scale_address0 { O 5 vector } activation_scale_ce0 { O 1 bit } activation_scale_d0 { O 512 vector } activation_scale_q0 { I 512 vector } activation_scale_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'activation_scale'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2822 \
    name rms_input_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe0 \
    op interface \
    ports { rms_input_pe0_address0 { O 6 vector } rms_input_pe0_ce0 { O 1 bit } rms_input_pe0_d0 { O 512 vector } rms_input_pe0_q0 { I 512 vector } rms_input_pe0_we0 { O 1 bit } rms_input_pe0_address1 { O 6 vector } rms_input_pe0_ce1 { O 1 bit } rms_input_pe0_d1 { O 512 vector } rms_input_pe0_q1 { I 512 vector } rms_input_pe0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2823 \
    name rms_input_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe1 \
    op interface \
    ports { rms_input_pe1_address0 { O 6 vector } rms_input_pe1_ce0 { O 1 bit } rms_input_pe1_d0 { O 512 vector } rms_input_pe1_q0 { I 512 vector } rms_input_pe1_we0 { O 1 bit } rms_input_pe1_address1 { O 6 vector } rms_input_pe1_ce1 { O 1 bit } rms_input_pe1_d1 { O 512 vector } rms_input_pe1_q1 { I 512 vector } rms_input_pe1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2824 \
    name rms_input_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe2 \
    op interface \
    ports { rms_input_pe2_address0 { O 6 vector } rms_input_pe2_ce0 { O 1 bit } rms_input_pe2_d0 { O 512 vector } rms_input_pe2_q0 { I 512 vector } rms_input_pe2_we0 { O 1 bit } rms_input_pe2_address1 { O 6 vector } rms_input_pe2_ce1 { O 1 bit } rms_input_pe2_d1 { O 512 vector } rms_input_pe2_q1 { I 512 vector } rms_input_pe2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2825 \
    name rms_input_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe3 \
    op interface \
    ports { rms_input_pe3_address0 { O 6 vector } rms_input_pe3_ce0 { O 1 bit } rms_input_pe3_d0 { O 512 vector } rms_input_pe3_q0 { I 512 vector } rms_input_pe3_we0 { O 1 bit } rms_input_pe3_address1 { O 6 vector } rms_input_pe3_ce1 { O 1 bit } rms_input_pe3_d1 { O 512 vector } rms_input_pe3_q1 { I 512 vector } rms_input_pe3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2826 \
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
    id 2827 \
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
    id 2828 \
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
    id 2829 \
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
    id 2830 \
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
    id 2831 \
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
    id 2832 \
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
    id 2833 \
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


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2835 \
    name output_pe0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename output_pe0 \
    op interface \
    ports { output_pe0_address0 { O 9 vector } output_pe0_ce0 { O 1 bit } output_pe0_d0 { O 512 vector } output_pe0_q0 { I 512 vector } output_pe0_we0 { O 1 bit } output_pe0_address1 { O 9 vector } output_pe0_ce1 { O 1 bit } output_pe0_d1 { O 512 vector } output_pe0_q1 { I 512 vector } output_pe0_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2836 \
    name output_pe1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename output_pe1 \
    op interface \
    ports { output_pe1_address0 { O 9 vector } output_pe1_ce0 { O 1 bit } output_pe1_d0 { O 512 vector } output_pe1_q0 { I 512 vector } output_pe1_we0 { O 1 bit } output_pe1_address1 { O 9 vector } output_pe1_ce1 { O 1 bit } output_pe1_d1 { O 512 vector } output_pe1_q1 { I 512 vector } output_pe1_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2837 \
    name output_pe2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename output_pe2 \
    op interface \
    ports { output_pe2_address0 { O 9 vector } output_pe2_ce0 { O 1 bit } output_pe2_d0 { O 512 vector } output_pe2_q0 { I 512 vector } output_pe2_we0 { O 1 bit } output_pe2_address1 { O 9 vector } output_pe2_ce1 { O 1 bit } output_pe2_d1 { O 512 vector } output_pe2_q1 { I 512 vector } output_pe2_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2838 \
    name output_pe3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename output_pe3 \
    op interface \
    ports { output_pe3_address0 { O 9 vector } output_pe3_ce0 { O 1 bit } output_pe3_d0 { O 512 vector } output_pe3_q0 { I 512 vector } output_pe3_we0 { O 1 bit } output_pe3_address1 { O 9 vector } output_pe3_ce1 { O 1 bit } output_pe3_d1 { O 512 vector } output_pe3_q1 { I 512 vector } output_pe3_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2858 \
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
    id 2859 \
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
    id 2860 \
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
    id 2861 \
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


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2864 \
    name model_scale_cache0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_scale_cache0 \
    op interface \
    ports { model_scale_cache0_address0 { O 11 vector } model_scale_cache0_ce0 { O 1 bit } model_scale_cache0_d0 { O 512 vector } model_scale_cache0_q0 { I 512 vector } model_scale_cache0_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_scale_cache0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2865 \
    name model_scale_cache1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_scale_cache1 \
    op interface \
    ports { model_scale_cache1_address0 { O 11 vector } model_scale_cache1_ce0 { O 1 bit } model_scale_cache1_d0 { O 512 vector } model_scale_cache1_q0 { I 512 vector } model_scale_cache1_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_scale_cache1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2866 \
    name model_scale_cache2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_scale_cache2 \
    op interface \
    ports { model_scale_cache2_address0 { O 11 vector } model_scale_cache2_ce0 { O 1 bit } model_scale_cache2_d0 { O 512 vector } model_scale_cache2_q0 { I 512 vector } model_scale_cache2_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_scale_cache2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2867 \
    name model_scale_cache3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_scale_cache3 \
    op interface \
    ports { model_scale_cache3_address0 { O 11 vector } model_scale_cache3_ce0 { O 1 bit } model_scale_cache3_d0 { O 512 vector } model_scale_cache3_q0 { I 512 vector } model_scale_cache3_we0 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_scale_cache3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2812 \
    name gmem0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem0 \
    op interface \
    ports { m_axi_gmem0_AWVALID { O 1 bit } m_axi_gmem0_AWREADY { I 1 bit } m_axi_gmem0_AWADDR { O 64 vector } m_axi_gmem0_AWID { O 1 vector } m_axi_gmem0_AWLEN { O 32 vector } m_axi_gmem0_AWSIZE { O 3 vector } m_axi_gmem0_AWBURST { O 2 vector } m_axi_gmem0_AWLOCK { O 2 vector } m_axi_gmem0_AWCACHE { O 4 vector } m_axi_gmem0_AWPROT { O 3 vector } m_axi_gmem0_AWQOS { O 4 vector } m_axi_gmem0_AWREGION { O 4 vector } m_axi_gmem0_AWUSER { O 1 vector } m_axi_gmem0_WVALID { O 1 bit } m_axi_gmem0_WREADY { I 1 bit } m_axi_gmem0_WDATA { O 512 vector } m_axi_gmem0_WSTRB { O 64 vector } m_axi_gmem0_WLAST { O 1 bit } m_axi_gmem0_WID { O 1 vector } m_axi_gmem0_WUSER { O 1 vector } m_axi_gmem0_ARVALID { O 1 bit } m_axi_gmem0_ARREADY { I 1 bit } m_axi_gmem0_ARADDR { O 64 vector } m_axi_gmem0_ARID { O 1 vector } m_axi_gmem0_ARLEN { O 32 vector } m_axi_gmem0_ARSIZE { O 3 vector } m_axi_gmem0_ARBURST { O 2 vector } m_axi_gmem0_ARLOCK { O 2 vector } m_axi_gmem0_ARCACHE { O 4 vector } m_axi_gmem0_ARPROT { O 3 vector } m_axi_gmem0_ARQOS { O 4 vector } m_axi_gmem0_ARREGION { O 4 vector } m_axi_gmem0_ARUSER { O 1 vector } m_axi_gmem0_RVALID { I 1 bit } m_axi_gmem0_RREADY { O 1 bit } m_axi_gmem0_RDATA { I 512 vector } m_axi_gmem0_RLAST { I 1 bit } m_axi_gmem0_RID { I 1 vector } m_axi_gmem0_RFIFONUM { I 12 vector } m_axi_gmem0_RUSER { I 1 vector } m_axi_gmem0_RRESP { I 2 vector } m_axi_gmem0_BVALID { I 1 bit } m_axi_gmem0_BREADY { O 1 bit } m_axi_gmem0_BRESP { I 2 vector } m_axi_gmem0_BID { I 1 vector } m_axi_gmem0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2813 \
    name weight_bank0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank0 \
    op interface \
    ports { weight_bank0 { I 64 vector } weight_bank0_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2814 \
    name gmem1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem1 \
    op interface \
    ports { m_axi_gmem1_AWVALID { O 1 bit } m_axi_gmem1_AWREADY { I 1 bit } m_axi_gmem1_AWADDR { O 64 vector } m_axi_gmem1_AWID { O 1 vector } m_axi_gmem1_AWLEN { O 32 vector } m_axi_gmem1_AWSIZE { O 3 vector } m_axi_gmem1_AWBURST { O 2 vector } m_axi_gmem1_AWLOCK { O 2 vector } m_axi_gmem1_AWCACHE { O 4 vector } m_axi_gmem1_AWPROT { O 3 vector } m_axi_gmem1_AWQOS { O 4 vector } m_axi_gmem1_AWREGION { O 4 vector } m_axi_gmem1_AWUSER { O 1 vector } m_axi_gmem1_WVALID { O 1 bit } m_axi_gmem1_WREADY { I 1 bit } m_axi_gmem1_WDATA { O 512 vector } m_axi_gmem1_WSTRB { O 64 vector } m_axi_gmem1_WLAST { O 1 bit } m_axi_gmem1_WID { O 1 vector } m_axi_gmem1_WUSER { O 1 vector } m_axi_gmem1_ARVALID { O 1 bit } m_axi_gmem1_ARREADY { I 1 bit } m_axi_gmem1_ARADDR { O 64 vector } m_axi_gmem1_ARID { O 1 vector } m_axi_gmem1_ARLEN { O 32 vector } m_axi_gmem1_ARSIZE { O 3 vector } m_axi_gmem1_ARBURST { O 2 vector } m_axi_gmem1_ARLOCK { O 2 vector } m_axi_gmem1_ARCACHE { O 4 vector } m_axi_gmem1_ARPROT { O 3 vector } m_axi_gmem1_ARQOS { O 4 vector } m_axi_gmem1_ARREGION { O 4 vector } m_axi_gmem1_ARUSER { O 1 vector } m_axi_gmem1_RVALID { I 1 bit } m_axi_gmem1_RREADY { O 1 bit } m_axi_gmem1_RDATA { I 512 vector } m_axi_gmem1_RLAST { I 1 bit } m_axi_gmem1_RID { I 1 vector } m_axi_gmem1_RFIFONUM { I 12 vector } m_axi_gmem1_RUSER { I 1 vector } m_axi_gmem1_RRESP { I 2 vector } m_axi_gmem1_BVALID { I 1 bit } m_axi_gmem1_BREADY { O 1 bit } m_axi_gmem1_BRESP { I 2 vector } m_axi_gmem1_BID { I 1 vector } m_axi_gmem1_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2815 \
    name weight_bank1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank1 \
    op interface \
    ports { weight_bank1 { I 64 vector } weight_bank1_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2816 \
    name gmem2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem2 \
    op interface \
    ports { m_axi_gmem2_AWVALID { O 1 bit } m_axi_gmem2_AWREADY { I 1 bit } m_axi_gmem2_AWADDR { O 64 vector } m_axi_gmem2_AWID { O 1 vector } m_axi_gmem2_AWLEN { O 32 vector } m_axi_gmem2_AWSIZE { O 3 vector } m_axi_gmem2_AWBURST { O 2 vector } m_axi_gmem2_AWLOCK { O 2 vector } m_axi_gmem2_AWCACHE { O 4 vector } m_axi_gmem2_AWPROT { O 3 vector } m_axi_gmem2_AWQOS { O 4 vector } m_axi_gmem2_AWREGION { O 4 vector } m_axi_gmem2_AWUSER { O 1 vector } m_axi_gmem2_WVALID { O 1 bit } m_axi_gmem2_WREADY { I 1 bit } m_axi_gmem2_WDATA { O 512 vector } m_axi_gmem2_WSTRB { O 64 vector } m_axi_gmem2_WLAST { O 1 bit } m_axi_gmem2_WID { O 1 vector } m_axi_gmem2_WUSER { O 1 vector } m_axi_gmem2_ARVALID { O 1 bit } m_axi_gmem2_ARREADY { I 1 bit } m_axi_gmem2_ARADDR { O 64 vector } m_axi_gmem2_ARID { O 1 vector } m_axi_gmem2_ARLEN { O 32 vector } m_axi_gmem2_ARSIZE { O 3 vector } m_axi_gmem2_ARBURST { O 2 vector } m_axi_gmem2_ARLOCK { O 2 vector } m_axi_gmem2_ARCACHE { O 4 vector } m_axi_gmem2_ARPROT { O 3 vector } m_axi_gmem2_ARQOS { O 4 vector } m_axi_gmem2_ARREGION { O 4 vector } m_axi_gmem2_ARUSER { O 1 vector } m_axi_gmem2_RVALID { I 1 bit } m_axi_gmem2_RREADY { O 1 bit } m_axi_gmem2_RDATA { I 512 vector } m_axi_gmem2_RLAST { I 1 bit } m_axi_gmem2_RID { I 1 vector } m_axi_gmem2_RFIFONUM { I 12 vector } m_axi_gmem2_RUSER { I 1 vector } m_axi_gmem2_RRESP { I 2 vector } m_axi_gmem2_BVALID { I 1 bit } m_axi_gmem2_BREADY { O 1 bit } m_axi_gmem2_BRESP { I 2 vector } m_axi_gmem2_BID { I 1 vector } m_axi_gmem2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2817 \
    name weight_bank2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank2 \
    op interface \
    ports { weight_bank2 { I 64 vector } weight_bank2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2818 \
    name gmem3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_gmem3 \
    op interface \
    ports { m_axi_gmem3_AWVALID { O 1 bit } m_axi_gmem3_AWREADY { I 1 bit } m_axi_gmem3_AWADDR { O 64 vector } m_axi_gmem3_AWID { O 1 vector } m_axi_gmem3_AWLEN { O 32 vector } m_axi_gmem3_AWSIZE { O 3 vector } m_axi_gmem3_AWBURST { O 2 vector } m_axi_gmem3_AWLOCK { O 2 vector } m_axi_gmem3_AWCACHE { O 4 vector } m_axi_gmem3_AWPROT { O 3 vector } m_axi_gmem3_AWQOS { O 4 vector } m_axi_gmem3_AWREGION { O 4 vector } m_axi_gmem3_AWUSER { O 1 vector } m_axi_gmem3_WVALID { O 1 bit } m_axi_gmem3_WREADY { I 1 bit } m_axi_gmem3_WDATA { O 512 vector } m_axi_gmem3_WSTRB { O 64 vector } m_axi_gmem3_WLAST { O 1 bit } m_axi_gmem3_WID { O 1 vector } m_axi_gmem3_WUSER { O 1 vector } m_axi_gmem3_ARVALID { O 1 bit } m_axi_gmem3_ARREADY { I 1 bit } m_axi_gmem3_ARADDR { O 64 vector } m_axi_gmem3_ARID { O 1 vector } m_axi_gmem3_ARLEN { O 32 vector } m_axi_gmem3_ARSIZE { O 3 vector } m_axi_gmem3_ARBURST { O 2 vector } m_axi_gmem3_ARLOCK { O 2 vector } m_axi_gmem3_ARCACHE { O 4 vector } m_axi_gmem3_ARPROT { O 3 vector } m_axi_gmem3_ARQOS { O 4 vector } m_axi_gmem3_ARREGION { O 4 vector } m_axi_gmem3_ARUSER { O 1 vector } m_axi_gmem3_RVALID { I 1 bit } m_axi_gmem3_RREADY { O 1 bit } m_axi_gmem3_RDATA { I 512 vector } m_axi_gmem3_RLAST { I 1 bit } m_axi_gmem3_RID { I 1 vector } m_axi_gmem3_RFIFONUM { I 12 vector } m_axi_gmem3_RUSER { I 1 vector } m_axi_gmem3_RRESP { I 2 vector } m_axi_gmem3_BVALID { I 1 bit } m_axi_gmem3_BREADY { O 1 bit } m_axi_gmem3_BRESP { I 2 vector } m_axi_gmem3_BID { I 1 vector } m_axi_gmem3_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2819 \
    name weight_bank3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_bank3 \
    op interface \
    ports { weight_bank3 { I 64 vector } weight_bank3_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2834 \
    name preprocess_mode \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_preprocess_mode \
    op interface \
    ports { preprocess_mode { I 2 vector } preprocess_mode_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2839 \
    name controller_run_rmsnorm \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_run_rmsnorm \
    op interface \
    ports { controller_run_rmsnorm { O 1 vector } controller_run_rmsnorm_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2840 \
    name controller_rmsnorm_mode \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_rmsnorm_mode \
    op interface \
    ports { controller_rmsnorm_mode { O 2 vector } controller_rmsnorm_mode_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2841 \
    name p_read \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read \
    op interface \
    ports { p_read { I 1 vector } p_read_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2842 \
    name controller_run_linear_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_run_linear_out \
    op interface \
    ports { controller_run_linear_out { O 1 vector } controller_run_linear_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2843 \
    name p_read1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read1 \
    op interface \
    ports { p_read1 { I 3 vector } p_read1_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2844 \
    name controller_linear_mode_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_linear_mode_out \
    op interface \
    ports { controller_linear_mode_out { O 3 vector } controller_linear_mode_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2845 \
    name controller_run_rope \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_run_rope \
    op interface \
    ports { controller_run_rope { O 1 vector } controller_run_rope_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2846 \
    name controller_run_swiglu \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_run_swiglu \
    op interface \
    ports { controller_run_swiglu { O 1 vector } controller_run_swiglu_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2847 \
    name p_read2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_read2 \
    op interface \
    ports { p_read2 { I 6 vector } p_read2_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2848 \
    name controller_layer_index_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_layer_index_out \
    op interface \
    ports { controller_layer_index_out { O 6 vector } controller_layer_index_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2849 \
    name controller_exit \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_exit \
    op interface \
    ports { controller_exit { O 1 vector } controller_exit_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2850 \
    name idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx \
    op interface \
    ports { idx { I 25 vector } idx_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2851 \
    name idx4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx4 \
    op interface \
    ports { idx4 { I 11 vector } idx4_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2852 \
    name idx8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx8 \
    op interface \
    ports { idx8 { I 13 vector } idx8_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2853 \
    name idx9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx9 \
    op interface \
    ports { idx9 { I 13 vector } idx9_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2854 \
    name idx10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx10 \
    op interface \
    ports { idx10 { I 13 vector } idx10_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2855 \
    name idx11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx11 \
    op interface \
    ports { idx11 { I 13 vector } idx11_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2856 \
    name controller_weight_scale_word_offset_constprop_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_weight_scale_word_offset_constprop_out \
    op interface \
    ports { controller_weight_scale_word_offset_constprop_out { O 11 vector } controller_weight_scale_word_offset_constprop_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2857 \
    name controller_weight_word_offset_constprop_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_weight_word_offset_constprop_out \
    op interface \
    ports { controller_weight_word_offset_constprop_out { O 24 vector } controller_weight_word_offset_constprop_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2862 \
    name controller_weight_word_offset_constprop \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_weight_word_offset_constprop \
    op interface \
    ports { controller_weight_word_offset_constprop { I 24 vector } controller_weight_word_offset_constprop_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2863 \
    name controller_weight_scale_word_offset_constprop \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_controller_weight_scale_word_offset_constprop \
    op interface \
    ports { controller_weight_scale_word_offset_constprop { I 11 vector } controller_weight_scale_word_offset_constprop_ap_vld { I 1 bit } } \
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


