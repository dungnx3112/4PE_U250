# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w11_d5_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {idx1_c_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w12_d2_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {mul_ln867_loc_channel_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w1_d5_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {output_fxp_loc_channel_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w1_d6_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {fuse_residual_loc_channel_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {input_tiles_loc_c17_channel_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {local_tiles_loc_c21_channel_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w512_d16384_U_x BINDTYPE {storage} TYPE {fifo} IMPL {uram} ALLOW_PRAGMA 1 INSTNAME {weight_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w480_d2_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {replay_activation_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w32_d2_S_x1 BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {replay_scale_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {input_tiles_loc_c16_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {local_tiles_loc_c20_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w92_d64_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {group_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {input_tiles_loc_c_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {local_tiles_loc_c19_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w128_d32_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {final_block_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {local_tiles_loc_c18_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w512_d16_B_x BINDTYPE {storage} TYPE {fifo} IMPL {bram} ALLOW_PRAGMA 1 INSTNAME {output_stream_U}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_fifo_w6_d2_S_x BINDTYPE {storage} TYPE {fifo} IMPL {srl} ALLOW_PRAGMA 1 INSTNAME {local_tiles_loc_c_U}
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
    id 2131 \
    name output_mem \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename output_mem \
    op interface \
    ports { output_mem_address0 { O 9 vector } output_mem_ce0 { O 1 bit } output_mem_d0 { O 512 vector } output_mem_q0 { I 512 vector } output_mem_we0 { O 1 bit } output_mem_address1 { O 9 vector } output_mem_ce1 { O 1 bit } output_mem_d1 { O 512 vector } output_mem_q1 { I 512 vector } output_mem_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'output_mem'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 2134 \
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


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2126 \
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
    id 2127 \
    name weight_mem \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_weight_mem \
    op interface \
    ports { weight_mem { I 64 vector } weight_mem_ap_vld { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2128 \
    name quantized_pe1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_quantized_pe1 \
    op interface \
    ports { quantized_pe1_dout { I 480 vector } quantized_pe1_empty_n { I 1 bit } quantized_pe1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2129 \
    name activation_scale_pe1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_activation_scale_pe1 \
    op interface \
    ports { activation_scale_pe1_dout { I 32 vector } activation_scale_pe1_empty_n { I 1 bit } activation_scale_pe1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2130 \
    name linear_command_pe1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_linear_command_pe1 \
    op interface \
    ports { linear_command_pe1_dout { I 14 vector } linear_command_pe1_empty_n { I 1 bit } linear_command_pe1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2132 \
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
    id 2133 \
    name idx1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx1 \
    op interface \
    ports { idx1 { I 11 vector } idx1_ap_vld { I 1 bit } } \
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


