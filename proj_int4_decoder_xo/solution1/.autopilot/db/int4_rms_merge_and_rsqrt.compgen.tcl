# This script segment is generated automatically by AutoPilot

set name int4_decoder_token_controller_frsqrt_32ns_32ns_32_17_full_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {frsqrt} IMPL {fulldsp} LATENCY 16 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1288 \
    name partial_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_partial_0 \
    op interface \
    ports { partial_0_dout { I 32 vector } partial_0_num_data_valid { I 3 vector } partial_0_fifo_cap { I 3 vector } partial_0_empty_n { I 1 bit } partial_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1289 \
    name partial_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_partial_1 \
    op interface \
    ports { partial_1_dout { I 32 vector } partial_1_num_data_valid { I 3 vector } partial_1_fifo_cap { I 3 vector } partial_1_empty_n { I 1 bit } partial_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1290 \
    name partial_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_partial_2 \
    op interface \
    ports { partial_2_dout { I 32 vector } partial_2_num_data_valid { I 3 vector } partial_2_fifo_cap { I 3 vector } partial_2_empty_n { I 1 bit } partial_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1291 \
    name partial_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_partial_3 \
    op interface \
    ports { partial_3_dout { I 32 vector } partial_3_num_data_valid { I 3 vector } partial_3_fifo_cap { I 3 vector } partial_3_empty_n { I 1 bit } partial_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1292 \
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


