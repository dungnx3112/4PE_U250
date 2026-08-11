# This script segment is generated automatically by AutoPilot

set name int4_decoder_token_controller_fmul_32ns_32ns_32_4_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 3 ALLOW_PRAGMA 1
}


set name int4_decoder_token_controller_fdiv_32ns_32ns_32_12_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fdiv} IMPL {fabric} LATENCY 11 ALLOW_PRAGMA 1
}


set name int4_decoder_token_controller_fcmp_32ns_32ns_1_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fcmp} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_swiftkv_update_values_and_quantize_weighted_value_engine0_RAM_2P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_swiftkv_update_values_and_quantize_attention_group_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
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
    id 738 \
    name value_metadata_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value_metadata_stream \
    op interface \
    ports { value_metadata_stream_dout { I 40 vector } value_metadata_stream_num_data_valid { I 6 vector } value_metadata_stream_fifo_cap { I 6 vector } value_metadata_stream_empty_n { I 1 bit } value_metadata_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 739 \
    name value0_engine0_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine0_stream \
    op interface \
    ports { value0_engine0_stream_dout { I 128 vector } value0_engine0_stream_num_data_valid { I 6 vector } value0_engine0_stream_fifo_cap { I 6 vector } value0_engine0_stream_empty_n { I 1 bit } value0_engine0_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 740 \
    name value0_engine1_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine1_stream \
    op interface \
    ports { value0_engine1_stream_dout { I 128 vector } value0_engine1_stream_num_data_valid { I 6 vector } value0_engine1_stream_fifo_cap { I 6 vector } value0_engine1_stream_empty_n { I 1 bit } value0_engine1_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 741 \
    name value0_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine2_stream \
    op interface \
    ports { value0_engine2_stream_dout { I 128 vector } value0_engine2_stream_num_data_valid { I 6 vector } value0_engine2_stream_fifo_cap { I 6 vector } value0_engine2_stream_empty_n { I 1 bit } value0_engine2_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 742 \
    name value0_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value0_engine3_stream \
    op interface \
    ports { value0_engine3_stream_dout { I 128 vector } value0_engine3_stream_num_data_valid { I 6 vector } value0_engine3_stream_fifo_cap { I 6 vector } value0_engine3_stream_empty_n { I 1 bit } value0_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 743 \
    name value1_engine0_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine0_stream \
    op interface \
    ports { value1_engine0_stream_dout { I 128 vector } value1_engine0_stream_num_data_valid { I 6 vector } value1_engine0_stream_fifo_cap { I 6 vector } value1_engine0_stream_empty_n { I 1 bit } value1_engine0_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 744 \
    name value1_engine1_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine1_stream \
    op interface \
    ports { value1_engine1_stream_dout { I 128 vector } value1_engine1_stream_num_data_valid { I 6 vector } value1_engine1_stream_fifo_cap { I 6 vector } value1_engine1_stream_empty_n { I 1 bit } value1_engine1_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 745 \
    name value1_engine2_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine2_stream \
    op interface \
    ports { value1_engine2_stream_dout { I 128 vector } value1_engine2_stream_num_data_valid { I 6 vector } value1_engine2_stream_fifo_cap { I 6 vector } value1_engine2_stream_empty_n { I 1 bit } value1_engine2_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 746 \
    name value1_engine3_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value1_engine3_stream \
    op interface \
    ports { value1_engine3_stream_dout { I 128 vector } value1_engine3_stream_num_data_valid { I 6 vector } value1_engine3_stream_fifo_cap { I 6 vector } value1_engine3_stream_empty_n { I 1 bit } value1_engine3_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 747 \
    name control_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_control_stream \
    op interface \
    ports { control_stream_dout { I 19 vector } control_stream_num_data_valid { I 5 vector } control_stream_fifo_cap { I 5 vector } control_stream_empty_n { I 1 bit } control_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 748 \
    name inverse_normalization_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inverse_normalization_stream \
    op interface \
    ports { inverse_normalization_stream_dout { I 32 vector } inverse_normalization_stream_num_data_valid { I 3 vector } inverse_normalization_stream_fifo_cap { I 3 vector } inverse_normalization_stream_empty_n { I 1 bit } inverse_normalization_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 749 \
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
    id 750 \
    name quantized_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe0 \
    op interface \
    ports { quantized_pe0_din { O 480 vector } quantized_pe0_num_data_valid { I 3 vector } quantized_pe0_fifo_cap { I 3 vector } quantized_pe0_full_n { I 1 bit } quantized_pe0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 751 \
    name scale_pe0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_scale_pe0 \
    op interface \
    ports { scale_pe0_din { O 32 vector } scale_pe0_num_data_valid { I 3 vector } scale_pe0_fifo_cap { I 3 vector } scale_pe0_full_n { I 1 bit } scale_pe0_write { O 1 bit } } \
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


