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
    id 1462 \
    name rms_input_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe0 \
    op interface \
    ports { rms_input_pe0_address0 { O 6 vector } rms_input_pe0_ce0 { O 1 bit } rms_input_pe0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1463 \
    name rms_input_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe1 \
    op interface \
    ports { rms_input_pe1_address0 { O 6 vector } rms_input_pe1_ce0 { O 1 bit } rms_input_pe1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1464 \
    name rms_input_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe2 \
    op interface \
    ports { rms_input_pe2_address0 { O 6 vector } rms_input_pe2_ce0 { O 1 bit } rms_input_pe2_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1465 \
    name rms_input_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename rms_input_pe3 \
    op interface \
    ports { rms_input_pe3_address0 { O 6 vector } rms_input_pe3_ce0 { O 1 bit } rms_input_pe3_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'rms_input_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1466 \
    name gate_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe0 \
    op interface \
    ports { gate_pe0_address0 { O 8 vector } gate_pe0_ce0 { O 1 bit } gate_pe0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1467 \
    name gate_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe1 \
    op interface \
    ports { gate_pe1_address0 { O 8 vector } gate_pe1_ce0 { O 1 bit } gate_pe1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1468 \
    name gate_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe2 \
    op interface \
    ports { gate_pe2_address0 { O 8 vector } gate_pe2_ce0 { O 1 bit } gate_pe2_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1469 \
    name gate_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename gate_pe3 \
    op interface \
    ports { gate_pe3_address0 { O 8 vector } gate_pe3_ce0 { O 1 bit } gate_pe3_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'gate_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1470 \
    name up_pe0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe0 \
    op interface \
    ports { up_pe0_address0 { O 8 vector } up_pe0_ce0 { O 1 bit } up_pe0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1471 \
    name up_pe1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe1 \
    op interface \
    ports { up_pe1_address0 { O 8 vector } up_pe1_ce0 { O 1 bit } up_pe1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1472 \
    name up_pe2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe2 \
    op interface \
    ports { up_pe2_address0 { O 8 vector } up_pe2_ce0 { O 1 bit } up_pe2_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1473 \
    name up_pe3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename up_pe3 \
    op interface \
    ports { up_pe3_address0 { O 8 vector } up_pe3_ce0 { O 1 bit } up_pe3_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'up_pe3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1480 \
    name model_norm_cache0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache0 \
    op interface \
    ports { model_norm_cache0_address0 { O 13 vector } model_norm_cache0_ce0 { O 1 bit } model_norm_cache0_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1481 \
    name model_norm_cache1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache1 \
    op interface \
    ports { model_norm_cache1_address0 { O 13 vector } model_norm_cache1_ce0 { O 1 bit } model_norm_cache1_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1482 \
    name model_norm_cache2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache2 \
    op interface \
    ports { model_norm_cache2_address0 { O 13 vector } model_norm_cache2_ce0 { O 1 bit } model_norm_cache2_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 1483 \
    name model_norm_cache3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename model_norm_cache3 \
    op interface \
    ports { model_norm_cache3_address0 { O 13 vector } model_norm_cache3_ce0 { O 1 bit } model_norm_cache3_q0 { I 512 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'model_norm_cache3'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1461 \
    name preprocess_mode \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_preprocess_mode \
    op interface \
    ports { preprocess_mode { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1474 \
    name quantized_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_stream \
    op interface \
    ports { quantized_stream_din { O 480 vector } quantized_stream_num_data_valid { I 3 vector } quantized_stream_fifo_cap { I 3 vector } quantized_stream_full_n { I 1 bit } quantized_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1475 \
    name scale_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_stream \
    op interface \
    ports { scale_stream_din { O 32 vector } scale_stream_num_data_valid { I 3 vector } scale_stream_fifo_cap { I 3 vector } scale_stream_full_n { I 1 bit } scale_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1476 \
    name idx \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx \
    op interface \
    ports { idx { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1477 \
    name idx1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx1 \
    op interface \
    ports { idx1 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1478 \
    name idx2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx2 \
    op interface \
    ports { idx2 { I 13 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1479 \
    name idx3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx3 \
    op interface \
    ports { idx3 { I 13 vector } } \
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


