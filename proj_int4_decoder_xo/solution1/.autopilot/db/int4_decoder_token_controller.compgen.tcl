# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_rope_lut_RAM_1P_URAM_2R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {uram} LATENCY 3 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_model_scale_cache0_RAM_1P_URAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {uram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_model_norm_cache0_RAM_1P_URAM_2R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {uram} LATENCY 3 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_residual_buffer0_RAM_2P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_2p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_linear_stage0_RAM_2P_URAM_1R1W BINDTYPE {storage} TYPE {ram_2p} IMPL {uram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_q_pe0_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_gate_pe0_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_activation_q_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_activation_scale_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_current_cos_RAM_1P_BRAM_1R1W BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_gmem0_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_gmem1_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_gmem2_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_gmem3_m_axi BINDTYPE {interface} TYPE {adapter} IMPL {m_axi}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
position { 
	dir I
	width 12
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
model_bank0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 24
	offset_end 35
}
model_bank1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 36
	offset_end 47
}
model_bank2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 48
	offset_end 59
}
model_bank3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 60
	offset_end 71
}
rope_lut_ddr { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 72
	offset_end 83
}
residual_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 84
	offset_end 95
}
residual_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 96
	offset_end 107
}
residual_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 108
	offset_end 119
}
residual_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 120
	offset_end 131
}
logits_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 132
	offset_end 143
}
logits_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 144
	offset_end 155
}
logits_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 156
	offset_end 167
}
logits_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 168
	offset_end 179
}
kv_cache_pe0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 180
	offset_end 191
}
kv_cache_pe1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 192
	offset_end 203
}
kv_cache_pe2 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 204
	offset_end 215
}
kv_cache_pe3 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 216
	offset_end 227
}
ap_start { }
ap_done { }
ap_ready { }
ap_continue { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 3117 \
			corename int4_decoder_token_controller_control_axilite \
			name int4_decoder_token_controller_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler int4_decoder_token_controller_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
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
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
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


