set moduleName int4_dispatch_linear_registered
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {int4_dispatch_linear_registered}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 512 regular {axi_master 2}  }
	{ weight_bank0 int 64 regular  }
	{ gmem1 int 512 regular {axi_master 2}  }
	{ weight_bank1 int 64 regular  }
	{ gmem2 int 512 regular {axi_master 2}  }
	{ weight_bank2 int 64 regular  }
	{ gmem3 int 512 regular {axi_master 2}  }
	{ weight_bank3 int 64 regular  }
	{ activation_q int 480 regular {array 344 { 2 } 1 1 }  }
	{ activation_scale int 512 regular {array 22 { 2 } 1 1 }  }
	{ residual_pe0 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe1 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe2 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe3 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ preprocess_mode int 2 regular  }
	{ linear_stage0 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ linear_stage1 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ linear_stage2 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ linear_stage3 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ q_pe0 int 512 regular {array 64 { 0 } 0 1 }  }
	{ q_pe1 int 512 regular {array 64 { 0 } 0 1 }  }
	{ q_pe2 int 512 regular {array 64 { 0 } 0 1 }  }
	{ q_pe3 int 512 regular {array 64 { 0 } 0 1 }  }
	{ k_pe0 int 512 regular {array 64 { 0 } 0 1 }  }
	{ k_pe1 int 512 regular {array 64 { 0 } 0 1 }  }
	{ k_pe2 int 512 regular {array 64 { 0 } 0 1 }  }
	{ k_pe3 int 512 regular {array 64 { 0 } 0 1 }  }
	{ v_pe0 int 512 regular {array 64 { 0 } 0 1 }  }
	{ v_pe1 int 512 regular {array 64 { 0 } 0 1 }  }
	{ v_pe2 int 512 regular {array 64 { 0 } 0 1 }  }
	{ v_pe3 int 512 regular {array 64 { 0 } 0 1 }  }
	{ gate_pe0 int 512 regular {array 176 { 2 } 1 1 }  }
	{ gate_pe1 int 512 regular {array 176 { 2 } 1 1 }  }
	{ gate_pe2 int 512 regular {array 176 { 2 } 1 1 }  }
	{ gate_pe3 int 512 regular {array 176 { 2 } 1 1 }  }
	{ up_pe0 int 512 regular {array 176 { 2 } 1 1 }  }
	{ up_pe1 int 512 regular {array 176 { 2 } 1 1 }  }
	{ up_pe2 int 512 regular {array 176 { 2 } 1 1 }  }
	{ up_pe3 int 512 regular {array 176 { 2 } 1 1 }  }
	{ logits_pe0 int 64 regular  }
	{ logits_pe1 int 64 regular  }
	{ logits_pe2 int 64 regular  }
	{ logits_pe3 int 64 regular  }
	{ controller_run_rmsnorm int 1 regular {pointer 1}  }
	{ controller_rmsnorm_mode int 2 regular {pointer 1}  }
	{ p_read int 1 regular  }
	{ controller_run_linear_out int 1 regular {pointer 1}  }
	{ p_read1 int 3 regular  }
	{ controller_linear_mode_out int 3 regular {pointer 1}  }
	{ controller_run_rope int 1 regular {pointer 1}  }
	{ controller_run_swiglu int 1 regular {pointer 1}  }
	{ p_read2 int 6 regular  }
	{ controller_layer_index_out int 6 regular {pointer 1}  }
	{ controller_exit int 1 regular {pointer 1}  }
	{ idx int 13 regular  }
	{ controller_weight_word_offset_constprop int 24 regular {pointer 2} {global 2}  }
	{ controller_weight_scale_word_offset_constprop int 11 regular {pointer 2} {global 2}  }
	{ model_norm_cache0 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache1 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache2 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache3 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_scale_cache0 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache1 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache2 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache3 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank0","offset": { "type": "dynamic","port_name": "model_bank0","bundle": "control"},"direction": "READONLY"},{"cName": "rope_lut_ddr","offset": { "type": "dynamic","port_name": "rope_lut_ddr","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe0","offset": { "type": "dynamic","port_name": "residual_pe0","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe0","offset": { "type": "dynamic","port_name": "logits_pe0","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe0","offset": { "type": "dynamic","port_name": "kv_cache_pe0","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank1","offset": { "type": "dynamic","port_name": "model_bank1","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe1","offset": { "type": "dynamic","port_name": "residual_pe1","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe1","offset": { "type": "dynamic","port_name": "logits_pe1","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe1","offset": { "type": "dynamic","port_name": "kv_cache_pe1","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank2","offset": { "type": "dynamic","port_name": "model_bank2","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe2","offset": { "type": "dynamic","port_name": "residual_pe2","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe2","offset": { "type": "dynamic","port_name": "logits_pe2","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe2","offset": { "type": "dynamic","port_name": "kv_cache_pe2","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank3","offset": { "type": "dynamic","port_name": "model_bank3","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe3","offset": { "type": "dynamic","port_name": "residual_pe3","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe3","offset": { "type": "dynamic","port_name": "logits_pe3","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe3","offset": { "type": "dynamic","port_name": "kv_cache_pe3","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activation_q", "interface" : "memory", "bitwidth" : 480, "direction" : "READWRITE"} , 
 	{ "Name" : "activation_scale", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "preprocess_mode", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "linear_stage0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "linear_stage1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "linear_stage2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "linear_stage3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "q_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "q_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "q_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "q_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "k_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "v_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "gate_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "gate_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "gate_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "gate_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "up_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "up_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "up_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "up_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "logits_pe0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_rmsnorm", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_rmsnorm_mode", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_linear_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "controller_linear_mode_out", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_rope", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_swiglu", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "controller_layer_index_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_exit", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "controller_weight_word_offset_constprop", "interface" : "wire", "bitwidth" : 24, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "controller_weight_scale_word_offset_constprop", "interface" : "wire", "bitwidth" : 11, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "model_norm_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 471
set portList { 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 12 signal 0 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 0 } 
	{ weight_bank0 sc_in sc_lv 64 signal 1 } 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 512 signal 2 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 512 signal 2 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem1_RFIFONUM sc_in sc_lv 12 signal 2 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 2 } 
	{ weight_bank1 sc_in sc_lv 64 signal 3 } 
	{ m_axi_gmem2_AWVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_AWREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_AWADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem2_AWID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_AWLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_gmem2_AWSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem2_AWBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem2_AWLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem2_AWCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_AWPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem2_AWQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_AWREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_AWUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_WVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_WREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_WDATA sc_out sc_lv 512 signal 4 } 
	{ m_axi_gmem2_WSTRB sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem2_WLAST sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_WID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_WUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_ARVALID sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_ARREADY sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_ARADDR sc_out sc_lv 64 signal 4 } 
	{ m_axi_gmem2_ARID sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_ARLEN sc_out sc_lv 32 signal 4 } 
	{ m_axi_gmem2_ARSIZE sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem2_ARBURST sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem2_ARLOCK sc_out sc_lv 2 signal 4 } 
	{ m_axi_gmem2_ARCACHE sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_ARPROT sc_out sc_lv 3 signal 4 } 
	{ m_axi_gmem2_ARQOS sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_ARREGION sc_out sc_lv 4 signal 4 } 
	{ m_axi_gmem2_ARUSER sc_out sc_lv 1 signal 4 } 
	{ m_axi_gmem2_RVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_RREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_RDATA sc_in sc_lv 512 signal 4 } 
	{ m_axi_gmem2_RLAST sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_RID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem2_RFIFONUM sc_in sc_lv 12 signal 4 } 
	{ m_axi_gmem2_RUSER sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem2_RRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem2_BVALID sc_in sc_logic 1 signal 4 } 
	{ m_axi_gmem2_BREADY sc_out sc_logic 1 signal 4 } 
	{ m_axi_gmem2_BRESP sc_in sc_lv 2 signal 4 } 
	{ m_axi_gmem2_BID sc_in sc_lv 1 signal 4 } 
	{ m_axi_gmem2_BUSER sc_in sc_lv 1 signal 4 } 
	{ weight_bank2 sc_in sc_lv 64 signal 5 } 
	{ m_axi_gmem3_AWVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_AWREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_AWADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem3_AWID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_AWLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem3_AWSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem3_AWBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem3_AWLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem3_AWCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_AWPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem3_AWQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_AWREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_AWUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_WVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_WREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_WDATA sc_out sc_lv 512 signal 6 } 
	{ m_axi_gmem3_WSTRB sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem3_WLAST sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_WID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_WUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_ARVALID sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_ARREADY sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_ARADDR sc_out sc_lv 64 signal 6 } 
	{ m_axi_gmem3_ARID sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_ARLEN sc_out sc_lv 32 signal 6 } 
	{ m_axi_gmem3_ARSIZE sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem3_ARBURST sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem3_ARLOCK sc_out sc_lv 2 signal 6 } 
	{ m_axi_gmem3_ARCACHE sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_ARPROT sc_out sc_lv 3 signal 6 } 
	{ m_axi_gmem3_ARQOS sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_ARREGION sc_out sc_lv 4 signal 6 } 
	{ m_axi_gmem3_ARUSER sc_out sc_lv 1 signal 6 } 
	{ m_axi_gmem3_RVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_RREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_RDATA sc_in sc_lv 512 signal 6 } 
	{ m_axi_gmem3_RLAST sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_RID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem3_RFIFONUM sc_in sc_lv 12 signal 6 } 
	{ m_axi_gmem3_RUSER sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem3_RRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem3_BVALID sc_in sc_logic 1 signal 6 } 
	{ m_axi_gmem3_BREADY sc_out sc_logic 1 signal 6 } 
	{ m_axi_gmem3_BRESP sc_in sc_lv 2 signal 6 } 
	{ m_axi_gmem3_BID sc_in sc_lv 1 signal 6 } 
	{ m_axi_gmem3_BUSER sc_in sc_lv 1 signal 6 } 
	{ weight_bank3 sc_in sc_lv 64 signal 7 } 
	{ activation_q_address0 sc_out sc_lv 9 signal 8 } 
	{ activation_q_ce0 sc_out sc_logic 1 signal 8 } 
	{ activation_q_d0 sc_out sc_lv 480 signal 8 } 
	{ activation_q_q0 sc_in sc_lv 480 signal 8 } 
	{ activation_q_we0 sc_out sc_logic 1 signal 8 } 
	{ activation_scale_address0 sc_out sc_lv 5 signal 9 } 
	{ activation_scale_ce0 sc_out sc_logic 1 signal 9 } 
	{ activation_scale_d0 sc_out sc_lv 512 signal 9 } 
	{ activation_scale_q0 sc_in sc_lv 512 signal 9 } 
	{ activation_scale_we0 sc_out sc_logic 1 signal 9 } 
	{ residual_pe0_address0 sc_out sc_lv 6 signal 10 } 
	{ residual_pe0_ce0 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_d0 sc_out sc_lv 512 signal 10 } 
	{ residual_pe0_q0 sc_in sc_lv 512 signal 10 } 
	{ residual_pe0_we0 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_address1 sc_out sc_lv 6 signal 10 } 
	{ residual_pe0_ce1 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_d1 sc_out sc_lv 512 signal 10 } 
	{ residual_pe0_q1 sc_in sc_lv 512 signal 10 } 
	{ residual_pe0_we1 sc_out sc_logic 1 signal 10 } 
	{ residual_pe1_address0 sc_out sc_lv 6 signal 11 } 
	{ residual_pe1_ce0 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_d0 sc_out sc_lv 512 signal 11 } 
	{ residual_pe1_q0 sc_in sc_lv 512 signal 11 } 
	{ residual_pe1_we0 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_address1 sc_out sc_lv 6 signal 11 } 
	{ residual_pe1_ce1 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_d1 sc_out sc_lv 512 signal 11 } 
	{ residual_pe1_q1 sc_in sc_lv 512 signal 11 } 
	{ residual_pe1_we1 sc_out sc_logic 1 signal 11 } 
	{ residual_pe2_address0 sc_out sc_lv 6 signal 12 } 
	{ residual_pe2_ce0 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_d0 sc_out sc_lv 512 signal 12 } 
	{ residual_pe2_q0 sc_in sc_lv 512 signal 12 } 
	{ residual_pe2_we0 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_address1 sc_out sc_lv 6 signal 12 } 
	{ residual_pe2_ce1 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_d1 sc_out sc_lv 512 signal 12 } 
	{ residual_pe2_q1 sc_in sc_lv 512 signal 12 } 
	{ residual_pe2_we1 sc_out sc_logic 1 signal 12 } 
	{ residual_pe3_address0 sc_out sc_lv 6 signal 13 } 
	{ residual_pe3_ce0 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_d0 sc_out sc_lv 512 signal 13 } 
	{ residual_pe3_q0 sc_in sc_lv 512 signal 13 } 
	{ residual_pe3_we0 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_address1 sc_out sc_lv 6 signal 13 } 
	{ residual_pe3_ce1 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_d1 sc_out sc_lv 512 signal 13 } 
	{ residual_pe3_q1 sc_in sc_lv 512 signal 13 } 
	{ residual_pe3_we1 sc_out sc_logic 1 signal 13 } 
	{ preprocess_mode sc_in sc_lv 2 signal 14 } 
	{ linear_stage0_address0 sc_out sc_lv 9 signal 15 } 
	{ linear_stage0_ce0 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_d0 sc_out sc_lv 512 signal 15 } 
	{ linear_stage0_q0 sc_in sc_lv 512 signal 15 } 
	{ linear_stage0_we0 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_address1 sc_out sc_lv 9 signal 15 } 
	{ linear_stage0_ce1 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_d1 sc_out sc_lv 512 signal 15 } 
	{ linear_stage0_q1 sc_in sc_lv 512 signal 15 } 
	{ linear_stage0_we1 sc_out sc_logic 1 signal 15 } 
	{ linear_stage1_address0 sc_out sc_lv 9 signal 16 } 
	{ linear_stage1_ce0 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_d0 sc_out sc_lv 512 signal 16 } 
	{ linear_stage1_q0 sc_in sc_lv 512 signal 16 } 
	{ linear_stage1_we0 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_address1 sc_out sc_lv 9 signal 16 } 
	{ linear_stage1_ce1 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_d1 sc_out sc_lv 512 signal 16 } 
	{ linear_stage1_q1 sc_in sc_lv 512 signal 16 } 
	{ linear_stage1_we1 sc_out sc_logic 1 signal 16 } 
	{ linear_stage2_address0 sc_out sc_lv 9 signal 17 } 
	{ linear_stage2_ce0 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_d0 sc_out sc_lv 512 signal 17 } 
	{ linear_stage2_q0 sc_in sc_lv 512 signal 17 } 
	{ linear_stage2_we0 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_address1 sc_out sc_lv 9 signal 17 } 
	{ linear_stage2_ce1 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_d1 sc_out sc_lv 512 signal 17 } 
	{ linear_stage2_q1 sc_in sc_lv 512 signal 17 } 
	{ linear_stage2_we1 sc_out sc_logic 1 signal 17 } 
	{ linear_stage3_address0 sc_out sc_lv 9 signal 18 } 
	{ linear_stage3_ce0 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_d0 sc_out sc_lv 512 signal 18 } 
	{ linear_stage3_q0 sc_in sc_lv 512 signal 18 } 
	{ linear_stage3_we0 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_address1 sc_out sc_lv 9 signal 18 } 
	{ linear_stage3_ce1 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_d1 sc_out sc_lv 512 signal 18 } 
	{ linear_stage3_q1 sc_in sc_lv 512 signal 18 } 
	{ linear_stage3_we1 sc_out sc_logic 1 signal 18 } 
	{ q_pe0_address0 sc_out sc_lv 6 signal 19 } 
	{ q_pe0_ce0 sc_out sc_logic 1 signal 19 } 
	{ q_pe0_d0 sc_out sc_lv 512 signal 19 } 
	{ q_pe0_q0 sc_in sc_lv 512 signal 19 } 
	{ q_pe0_we0 sc_out sc_logic 1 signal 19 } 
	{ q_pe1_address0 sc_out sc_lv 6 signal 20 } 
	{ q_pe1_ce0 sc_out sc_logic 1 signal 20 } 
	{ q_pe1_d0 sc_out sc_lv 512 signal 20 } 
	{ q_pe1_q0 sc_in sc_lv 512 signal 20 } 
	{ q_pe1_we0 sc_out sc_logic 1 signal 20 } 
	{ q_pe2_address0 sc_out sc_lv 6 signal 21 } 
	{ q_pe2_ce0 sc_out sc_logic 1 signal 21 } 
	{ q_pe2_d0 sc_out sc_lv 512 signal 21 } 
	{ q_pe2_q0 sc_in sc_lv 512 signal 21 } 
	{ q_pe2_we0 sc_out sc_logic 1 signal 21 } 
	{ q_pe3_address0 sc_out sc_lv 6 signal 22 } 
	{ q_pe3_ce0 sc_out sc_logic 1 signal 22 } 
	{ q_pe3_d0 sc_out sc_lv 512 signal 22 } 
	{ q_pe3_q0 sc_in sc_lv 512 signal 22 } 
	{ q_pe3_we0 sc_out sc_logic 1 signal 22 } 
	{ k_pe0_address0 sc_out sc_lv 6 signal 23 } 
	{ k_pe0_ce0 sc_out sc_logic 1 signal 23 } 
	{ k_pe0_d0 sc_out sc_lv 512 signal 23 } 
	{ k_pe0_q0 sc_in sc_lv 512 signal 23 } 
	{ k_pe0_we0 sc_out sc_logic 1 signal 23 } 
	{ k_pe1_address0 sc_out sc_lv 6 signal 24 } 
	{ k_pe1_ce0 sc_out sc_logic 1 signal 24 } 
	{ k_pe1_d0 sc_out sc_lv 512 signal 24 } 
	{ k_pe1_q0 sc_in sc_lv 512 signal 24 } 
	{ k_pe1_we0 sc_out sc_logic 1 signal 24 } 
	{ k_pe2_address0 sc_out sc_lv 6 signal 25 } 
	{ k_pe2_ce0 sc_out sc_logic 1 signal 25 } 
	{ k_pe2_d0 sc_out sc_lv 512 signal 25 } 
	{ k_pe2_q0 sc_in sc_lv 512 signal 25 } 
	{ k_pe2_we0 sc_out sc_logic 1 signal 25 } 
	{ k_pe3_address0 sc_out sc_lv 6 signal 26 } 
	{ k_pe3_ce0 sc_out sc_logic 1 signal 26 } 
	{ k_pe3_d0 sc_out sc_lv 512 signal 26 } 
	{ k_pe3_q0 sc_in sc_lv 512 signal 26 } 
	{ k_pe3_we0 sc_out sc_logic 1 signal 26 } 
	{ v_pe0_address0 sc_out sc_lv 6 signal 27 } 
	{ v_pe0_ce0 sc_out sc_logic 1 signal 27 } 
	{ v_pe0_d0 sc_out sc_lv 512 signal 27 } 
	{ v_pe0_q0 sc_in sc_lv 512 signal 27 } 
	{ v_pe0_we0 sc_out sc_logic 1 signal 27 } 
	{ v_pe1_address0 sc_out sc_lv 6 signal 28 } 
	{ v_pe1_ce0 sc_out sc_logic 1 signal 28 } 
	{ v_pe1_d0 sc_out sc_lv 512 signal 28 } 
	{ v_pe1_q0 sc_in sc_lv 512 signal 28 } 
	{ v_pe1_we0 sc_out sc_logic 1 signal 28 } 
	{ v_pe2_address0 sc_out sc_lv 6 signal 29 } 
	{ v_pe2_ce0 sc_out sc_logic 1 signal 29 } 
	{ v_pe2_d0 sc_out sc_lv 512 signal 29 } 
	{ v_pe2_q0 sc_in sc_lv 512 signal 29 } 
	{ v_pe2_we0 sc_out sc_logic 1 signal 29 } 
	{ v_pe3_address0 sc_out sc_lv 6 signal 30 } 
	{ v_pe3_ce0 sc_out sc_logic 1 signal 30 } 
	{ v_pe3_d0 sc_out sc_lv 512 signal 30 } 
	{ v_pe3_q0 sc_in sc_lv 512 signal 30 } 
	{ v_pe3_we0 sc_out sc_logic 1 signal 30 } 
	{ gate_pe0_address0 sc_out sc_lv 8 signal 31 } 
	{ gate_pe0_ce0 sc_out sc_logic 1 signal 31 } 
	{ gate_pe0_d0 sc_out sc_lv 512 signal 31 } 
	{ gate_pe0_q0 sc_in sc_lv 512 signal 31 } 
	{ gate_pe0_we0 sc_out sc_logic 1 signal 31 } 
	{ gate_pe1_address0 sc_out sc_lv 8 signal 32 } 
	{ gate_pe1_ce0 sc_out sc_logic 1 signal 32 } 
	{ gate_pe1_d0 sc_out sc_lv 512 signal 32 } 
	{ gate_pe1_q0 sc_in sc_lv 512 signal 32 } 
	{ gate_pe1_we0 sc_out sc_logic 1 signal 32 } 
	{ gate_pe2_address0 sc_out sc_lv 8 signal 33 } 
	{ gate_pe2_ce0 sc_out sc_logic 1 signal 33 } 
	{ gate_pe2_d0 sc_out sc_lv 512 signal 33 } 
	{ gate_pe2_q0 sc_in sc_lv 512 signal 33 } 
	{ gate_pe2_we0 sc_out sc_logic 1 signal 33 } 
	{ gate_pe3_address0 sc_out sc_lv 8 signal 34 } 
	{ gate_pe3_ce0 sc_out sc_logic 1 signal 34 } 
	{ gate_pe3_d0 sc_out sc_lv 512 signal 34 } 
	{ gate_pe3_q0 sc_in sc_lv 512 signal 34 } 
	{ gate_pe3_we0 sc_out sc_logic 1 signal 34 } 
	{ up_pe0_address0 sc_out sc_lv 8 signal 35 } 
	{ up_pe0_ce0 sc_out sc_logic 1 signal 35 } 
	{ up_pe0_d0 sc_out sc_lv 512 signal 35 } 
	{ up_pe0_q0 sc_in sc_lv 512 signal 35 } 
	{ up_pe0_we0 sc_out sc_logic 1 signal 35 } 
	{ up_pe1_address0 sc_out sc_lv 8 signal 36 } 
	{ up_pe1_ce0 sc_out sc_logic 1 signal 36 } 
	{ up_pe1_d0 sc_out sc_lv 512 signal 36 } 
	{ up_pe1_q0 sc_in sc_lv 512 signal 36 } 
	{ up_pe1_we0 sc_out sc_logic 1 signal 36 } 
	{ up_pe2_address0 sc_out sc_lv 8 signal 37 } 
	{ up_pe2_ce0 sc_out sc_logic 1 signal 37 } 
	{ up_pe2_d0 sc_out sc_lv 512 signal 37 } 
	{ up_pe2_q0 sc_in sc_lv 512 signal 37 } 
	{ up_pe2_we0 sc_out sc_logic 1 signal 37 } 
	{ up_pe3_address0 sc_out sc_lv 8 signal 38 } 
	{ up_pe3_ce0 sc_out sc_logic 1 signal 38 } 
	{ up_pe3_d0 sc_out sc_lv 512 signal 38 } 
	{ up_pe3_q0 sc_in sc_lv 512 signal 38 } 
	{ up_pe3_we0 sc_out sc_logic 1 signal 38 } 
	{ logits_pe0 sc_in sc_lv 64 signal 39 } 
	{ logits_pe1 sc_in sc_lv 64 signal 40 } 
	{ logits_pe2 sc_in sc_lv 64 signal 41 } 
	{ logits_pe3 sc_in sc_lv 64 signal 42 } 
	{ controller_run_rmsnorm sc_out sc_lv 1 signal 43 } 
	{ controller_rmsnorm_mode sc_out sc_lv 2 signal 44 } 
	{ p_read sc_in sc_lv 1 signal 45 } 
	{ controller_run_linear_out sc_out sc_lv 1 signal 46 } 
	{ p_read1 sc_in sc_lv 3 signal 47 } 
	{ controller_linear_mode_out sc_out sc_lv 3 signal 48 } 
	{ controller_run_rope sc_out sc_lv 1 signal 49 } 
	{ controller_run_swiglu sc_out sc_lv 1 signal 50 } 
	{ p_read2 sc_in sc_lv 6 signal 51 } 
	{ controller_layer_index_out sc_out sc_lv 6 signal 52 } 
	{ controller_exit sc_out sc_lv 1 signal 53 } 
	{ idx sc_in sc_lv 13 signal 54 } 
	{ controller_weight_word_offset_constprop_i sc_in sc_lv 24 signal 55 } 
	{ controller_weight_word_offset_constprop_o sc_out sc_lv 24 signal 55 } 
	{ controller_weight_scale_word_offset_constprop_i sc_in sc_lv 11 signal 56 } 
	{ controller_weight_scale_word_offset_constprop_o sc_out sc_lv 11 signal 56 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 57 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 57 } 
	{ model_norm_cache0_d0 sc_out sc_lv 512 signal 57 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 57 } 
	{ model_norm_cache0_we0 sc_out sc_logic 1 signal 57 } 
	{ model_norm_cache1_address0 sc_out sc_lv 13 signal 58 } 
	{ model_norm_cache1_ce0 sc_out sc_logic 1 signal 58 } 
	{ model_norm_cache1_d0 sc_out sc_lv 512 signal 58 } 
	{ model_norm_cache1_q0 sc_in sc_lv 512 signal 58 } 
	{ model_norm_cache1_we0 sc_out sc_logic 1 signal 58 } 
	{ model_norm_cache2_address0 sc_out sc_lv 13 signal 59 } 
	{ model_norm_cache2_ce0 sc_out sc_logic 1 signal 59 } 
	{ model_norm_cache2_d0 sc_out sc_lv 512 signal 59 } 
	{ model_norm_cache2_q0 sc_in sc_lv 512 signal 59 } 
	{ model_norm_cache2_we0 sc_out sc_logic 1 signal 59 } 
	{ model_norm_cache3_address0 sc_out sc_lv 13 signal 60 } 
	{ model_norm_cache3_ce0 sc_out sc_logic 1 signal 60 } 
	{ model_norm_cache3_d0 sc_out sc_lv 512 signal 60 } 
	{ model_norm_cache3_q0 sc_in sc_lv 512 signal 60 } 
	{ model_norm_cache3_we0 sc_out sc_logic 1 signal 60 } 
	{ model_scale_cache0_address0 sc_out sc_lv 11 signal 61 } 
	{ model_scale_cache0_ce0 sc_out sc_logic 1 signal 61 } 
	{ model_scale_cache0_d0 sc_out sc_lv 512 signal 61 } 
	{ model_scale_cache0_q0 sc_in sc_lv 512 signal 61 } 
	{ model_scale_cache0_we0 sc_out sc_logic 1 signal 61 } 
	{ model_scale_cache1_address0 sc_out sc_lv 11 signal 62 } 
	{ model_scale_cache1_ce0 sc_out sc_logic 1 signal 62 } 
	{ model_scale_cache1_d0 sc_out sc_lv 512 signal 62 } 
	{ model_scale_cache1_q0 sc_in sc_lv 512 signal 62 } 
	{ model_scale_cache1_we0 sc_out sc_logic 1 signal 62 } 
	{ model_scale_cache2_address0 sc_out sc_lv 11 signal 63 } 
	{ model_scale_cache2_ce0 sc_out sc_logic 1 signal 63 } 
	{ model_scale_cache2_d0 sc_out sc_lv 512 signal 63 } 
	{ model_scale_cache2_q0 sc_in sc_lv 512 signal 63 } 
	{ model_scale_cache2_we0 sc_out sc_logic 1 signal 63 } 
	{ model_scale_cache3_address0 sc_out sc_lv 11 signal 64 } 
	{ model_scale_cache3_ce0 sc_out sc_logic 1 signal 64 } 
	{ model_scale_cache3_d0 sc_out sc_lv 512 signal 64 } 
	{ model_scale_cache3_q0 sc_in sc_lv 512 signal 64 } 
	{ model_scale_cache3_we0 sc_out sc_logic 1 signal 64 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ weight_bank0_ap_vld sc_in sc_logic 1 invld 1 } 
	{ weight_bank1_ap_vld sc_in sc_logic 1 invld 3 } 
	{ weight_bank2_ap_vld sc_in sc_logic 1 invld 5 } 
	{ weight_bank3_ap_vld sc_in sc_logic 1 invld 7 } 
	{ logits_pe0_ap_vld sc_in sc_logic 1 invld 39 } 
	{ logits_pe1_ap_vld sc_in sc_logic 1 invld 40 } 
	{ logits_pe2_ap_vld sc_in sc_logic 1 invld 41 } 
	{ logits_pe3_ap_vld sc_in sc_logic 1 invld 42 } 
	{ p_read_ap_vld sc_in sc_logic 1 invld 45 } 
	{ p_read1_ap_vld sc_in sc_logic 1 invld 47 } 
	{ p_read2_ap_vld sc_in sc_logic 1 invld 51 } 
	{ idx_ap_vld sc_in sc_logic 1 invld 54 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ preprocess_mode_ap_vld sc_in sc_logic 1 invld 14 } 
	{ controller_run_rmsnorm_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ controller_rmsnorm_mode_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ controller_run_linear_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ controller_linear_mode_out_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ controller_run_rope_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ controller_run_swiglu_ap_vld sc_out sc_logic 1 outvld 50 } 
	{ controller_layer_index_out_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ controller_exit_ap_vld sc_out sc_logic 1 outvld 53 } 
	{ controller_weight_word_offset_constprop_i_ap_vld sc_in sc_logic 1 invld 55 } 
	{ controller_weight_word_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 55 } 
	{ controller_weight_scale_word_offset_constprop_i_ap_vld sc_in sc_logic 1 invld 56 } 
	{ controller_weight_scale_word_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 56 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "m_axi_gmem0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem0", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WID" }} , 
 	{ "name": "m_axi_gmem0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem0", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RID" }} , 
 	{ "name": "m_axi_gmem0_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "gmem0", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem0", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BID" }} , 
 	{ "name": "m_axi_gmem0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem0", "role": "BUSER" }} , 
 	{ "name": "weight_bank0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank0", "role": "default" }} , 
 	{ "name": "m_axi_gmem1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem1", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WID" }} , 
 	{ "name": "m_axi_gmem1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem1", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RID" }} , 
 	{ "name": "m_axi_gmem1_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "gmem1", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem1", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BID" }} , 
 	{ "name": "m_axi_gmem1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem1", "role": "BUSER" }} , 
 	{ "name": "weight_bank1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank1", "role": "default" }} , 
 	{ "name": "m_axi_gmem2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem2", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WID" }} , 
 	{ "name": "m_axi_gmem2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem2", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RID" }} , 
 	{ "name": "m_axi_gmem2_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "gmem2", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem2", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BID" }} , 
 	{ "name": "m_axi_gmem2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem2", "role": "BUSER" }} , 
 	{ "name": "weight_bank2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank2", "role": "default" }} , 
 	{ "name": "m_axi_gmem3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem3_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem3_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem3_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem3_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem3_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem3_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem3_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem3_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem3_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem3_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem3_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem3", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem3_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem3_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem3_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WID" }} , 
 	{ "name": "m_axi_gmem3_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem3_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem3_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem3_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem3_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem3_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem3_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem3_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem3_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem3_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem3_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem3_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem3_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem3_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem3_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem3_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem3", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem3_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem3_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RID" }} , 
 	{ "name": "m_axi_gmem3_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "gmem3", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem3_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem3_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem3_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem3_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem3_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem3_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BID" }} , 
 	{ "name": "m_axi_gmem3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BUSER" }} , 
 	{ "name": "weight_bank3", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank3", "role": "default" }} , 
 	{ "name": "activation_q_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "activation_q", "role": "address0" }} , 
 	{ "name": "activation_q_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_q", "role": "ce0" }} , 
 	{ "name": "activation_q_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_q", "role": "d0" }} , 
 	{ "name": "activation_q_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_q", "role": "q0" }} , 
 	{ "name": "activation_q_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_q", "role": "we0" }} , 
 	{ "name": "activation_scale_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "activation_scale", "role": "address0" }} , 
 	{ "name": "activation_scale_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "ce0" }} , 
 	{ "name": "activation_scale_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "activation_scale", "role": "d0" }} , 
 	{ "name": "activation_scale_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "activation_scale", "role": "q0" }} , 
 	{ "name": "activation_scale_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "we0" }} , 
 	{ "name": "residual_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe0", "role": "address0" }} , 
 	{ "name": "residual_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "ce0" }} , 
 	{ "name": "residual_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "d0" }} , 
 	{ "name": "residual_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "q0" }} , 
 	{ "name": "residual_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "we0" }} , 
 	{ "name": "residual_pe0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe0", "role": "address1" }} , 
 	{ "name": "residual_pe0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "ce1" }} , 
 	{ "name": "residual_pe0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "d1" }} , 
 	{ "name": "residual_pe0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "q1" }} , 
 	{ "name": "residual_pe0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "we1" }} , 
 	{ "name": "residual_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe1", "role": "address0" }} , 
 	{ "name": "residual_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "ce0" }} , 
 	{ "name": "residual_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "d0" }} , 
 	{ "name": "residual_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "q0" }} , 
 	{ "name": "residual_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "we0" }} , 
 	{ "name": "residual_pe1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe1", "role": "address1" }} , 
 	{ "name": "residual_pe1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "ce1" }} , 
 	{ "name": "residual_pe1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "d1" }} , 
 	{ "name": "residual_pe1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "q1" }} , 
 	{ "name": "residual_pe1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "we1" }} , 
 	{ "name": "residual_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe2", "role": "address0" }} , 
 	{ "name": "residual_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "ce0" }} , 
 	{ "name": "residual_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "d0" }} , 
 	{ "name": "residual_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "q0" }} , 
 	{ "name": "residual_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "we0" }} , 
 	{ "name": "residual_pe2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe2", "role": "address1" }} , 
 	{ "name": "residual_pe2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "ce1" }} , 
 	{ "name": "residual_pe2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "d1" }} , 
 	{ "name": "residual_pe2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "q1" }} , 
 	{ "name": "residual_pe2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "we1" }} , 
 	{ "name": "residual_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe3", "role": "address0" }} , 
 	{ "name": "residual_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "ce0" }} , 
 	{ "name": "residual_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "d0" }} , 
 	{ "name": "residual_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "q0" }} , 
 	{ "name": "residual_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "we0" }} , 
 	{ "name": "residual_pe3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe3", "role": "address1" }} , 
 	{ "name": "residual_pe3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "ce1" }} , 
 	{ "name": "residual_pe3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "d1" }} , 
 	{ "name": "residual_pe3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "q1" }} , 
 	{ "name": "residual_pe3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "we1" }} , 
 	{ "name": "preprocess_mode", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "preprocess_mode", "role": "default" }} , 
 	{ "name": "linear_stage0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage0", "role": "address0" }} , 
 	{ "name": "linear_stage0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "ce0" }} , 
 	{ "name": "linear_stage0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "d0" }} , 
 	{ "name": "linear_stage0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "q0" }} , 
 	{ "name": "linear_stage0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "we0" }} , 
 	{ "name": "linear_stage0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage0", "role": "address1" }} , 
 	{ "name": "linear_stage0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "ce1" }} , 
 	{ "name": "linear_stage0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "d1" }} , 
 	{ "name": "linear_stage0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "q1" }} , 
 	{ "name": "linear_stage0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "we1" }} , 
 	{ "name": "linear_stage1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage1", "role": "address0" }} , 
 	{ "name": "linear_stage1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "ce0" }} , 
 	{ "name": "linear_stage1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "d0" }} , 
 	{ "name": "linear_stage1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "q0" }} , 
 	{ "name": "linear_stage1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "we0" }} , 
 	{ "name": "linear_stage1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage1", "role": "address1" }} , 
 	{ "name": "linear_stage1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "ce1" }} , 
 	{ "name": "linear_stage1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "d1" }} , 
 	{ "name": "linear_stage1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "q1" }} , 
 	{ "name": "linear_stage1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "we1" }} , 
 	{ "name": "linear_stage2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage2", "role": "address0" }} , 
 	{ "name": "linear_stage2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "ce0" }} , 
 	{ "name": "linear_stage2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "d0" }} , 
 	{ "name": "linear_stage2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "q0" }} , 
 	{ "name": "linear_stage2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "we0" }} , 
 	{ "name": "linear_stage2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage2", "role": "address1" }} , 
 	{ "name": "linear_stage2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "ce1" }} , 
 	{ "name": "linear_stage2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "d1" }} , 
 	{ "name": "linear_stage2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "q1" }} , 
 	{ "name": "linear_stage2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "we1" }} , 
 	{ "name": "linear_stage3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage3", "role": "address0" }} , 
 	{ "name": "linear_stage3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "ce0" }} , 
 	{ "name": "linear_stage3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "d0" }} , 
 	{ "name": "linear_stage3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "q0" }} , 
 	{ "name": "linear_stage3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "we0" }} , 
 	{ "name": "linear_stage3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage3", "role": "address1" }} , 
 	{ "name": "linear_stage3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "ce1" }} , 
 	{ "name": "linear_stage3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "d1" }} , 
 	{ "name": "linear_stage3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "q1" }} , 
 	{ "name": "linear_stage3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "we1" }} , 
 	{ "name": "q_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe0", "role": "address0" }} , 
 	{ "name": "q_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe0", "role": "ce0" }} , 
 	{ "name": "q_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe0", "role": "d0" }} , 
 	{ "name": "q_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe0", "role": "q0" }} , 
 	{ "name": "q_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe0", "role": "we0" }} , 
 	{ "name": "q_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe1", "role": "address0" }} , 
 	{ "name": "q_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe1", "role": "ce0" }} , 
 	{ "name": "q_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe1", "role": "d0" }} , 
 	{ "name": "q_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe1", "role": "q0" }} , 
 	{ "name": "q_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe1", "role": "we0" }} , 
 	{ "name": "q_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe2", "role": "address0" }} , 
 	{ "name": "q_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe2", "role": "ce0" }} , 
 	{ "name": "q_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe2", "role": "d0" }} , 
 	{ "name": "q_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe2", "role": "q0" }} , 
 	{ "name": "q_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe2", "role": "we0" }} , 
 	{ "name": "q_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe3", "role": "address0" }} , 
 	{ "name": "q_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe3", "role": "ce0" }} , 
 	{ "name": "q_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe3", "role": "d0" }} , 
 	{ "name": "q_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe3", "role": "q0" }} , 
 	{ "name": "q_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe3", "role": "we0" }} , 
 	{ "name": "k_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe0", "role": "address0" }} , 
 	{ "name": "k_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe0", "role": "ce0" }} , 
 	{ "name": "k_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe0", "role": "d0" }} , 
 	{ "name": "k_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe0", "role": "q0" }} , 
 	{ "name": "k_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe0", "role": "we0" }} , 
 	{ "name": "k_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe1", "role": "address0" }} , 
 	{ "name": "k_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe1", "role": "ce0" }} , 
 	{ "name": "k_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe1", "role": "d0" }} , 
 	{ "name": "k_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe1", "role": "q0" }} , 
 	{ "name": "k_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe1", "role": "we0" }} , 
 	{ "name": "k_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe2", "role": "address0" }} , 
 	{ "name": "k_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe2", "role": "ce0" }} , 
 	{ "name": "k_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe2", "role": "d0" }} , 
 	{ "name": "k_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe2", "role": "q0" }} , 
 	{ "name": "k_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe2", "role": "we0" }} , 
 	{ "name": "k_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe3", "role": "address0" }} , 
 	{ "name": "k_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe3", "role": "ce0" }} , 
 	{ "name": "k_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe3", "role": "d0" }} , 
 	{ "name": "k_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe3", "role": "q0" }} , 
 	{ "name": "k_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe3", "role": "we0" }} , 
 	{ "name": "v_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe0", "role": "address0" }} , 
 	{ "name": "v_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe0", "role": "ce0" }} , 
 	{ "name": "v_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe0", "role": "d0" }} , 
 	{ "name": "v_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe0", "role": "q0" }} , 
 	{ "name": "v_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe0", "role": "we0" }} , 
 	{ "name": "v_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe1", "role": "address0" }} , 
 	{ "name": "v_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe1", "role": "ce0" }} , 
 	{ "name": "v_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe1", "role": "d0" }} , 
 	{ "name": "v_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe1", "role": "q0" }} , 
 	{ "name": "v_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe1", "role": "we0" }} , 
 	{ "name": "v_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe2", "role": "address0" }} , 
 	{ "name": "v_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe2", "role": "ce0" }} , 
 	{ "name": "v_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe2", "role": "d0" }} , 
 	{ "name": "v_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe2", "role": "q0" }} , 
 	{ "name": "v_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe2", "role": "we0" }} , 
 	{ "name": "v_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe3", "role": "address0" }} , 
 	{ "name": "v_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe3", "role": "ce0" }} , 
 	{ "name": "v_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe3", "role": "d0" }} , 
 	{ "name": "v_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe3", "role": "q0" }} , 
 	{ "name": "v_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe3", "role": "we0" }} , 
 	{ "name": "gate_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe0", "role": "address0" }} , 
 	{ "name": "gate_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "ce0" }} , 
 	{ "name": "gate_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "d0" }} , 
 	{ "name": "gate_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "q0" }} , 
 	{ "name": "gate_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "we0" }} , 
 	{ "name": "gate_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe1", "role": "address0" }} , 
 	{ "name": "gate_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "ce0" }} , 
 	{ "name": "gate_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "d0" }} , 
 	{ "name": "gate_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "q0" }} , 
 	{ "name": "gate_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "we0" }} , 
 	{ "name": "gate_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe2", "role": "address0" }} , 
 	{ "name": "gate_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "ce0" }} , 
 	{ "name": "gate_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "d0" }} , 
 	{ "name": "gate_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "q0" }} , 
 	{ "name": "gate_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "we0" }} , 
 	{ "name": "gate_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe3", "role": "address0" }} , 
 	{ "name": "gate_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "ce0" }} , 
 	{ "name": "gate_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "d0" }} , 
 	{ "name": "gate_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "q0" }} , 
 	{ "name": "gate_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "we0" }} , 
 	{ "name": "up_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe0", "role": "address0" }} , 
 	{ "name": "up_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "ce0" }} , 
 	{ "name": "up_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "d0" }} , 
 	{ "name": "up_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "q0" }} , 
 	{ "name": "up_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "we0" }} , 
 	{ "name": "up_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe1", "role": "address0" }} , 
 	{ "name": "up_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "ce0" }} , 
 	{ "name": "up_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "d0" }} , 
 	{ "name": "up_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "q0" }} , 
 	{ "name": "up_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "we0" }} , 
 	{ "name": "up_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe2", "role": "address0" }} , 
 	{ "name": "up_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "ce0" }} , 
 	{ "name": "up_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "d0" }} , 
 	{ "name": "up_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "q0" }} , 
 	{ "name": "up_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "we0" }} , 
 	{ "name": "up_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe3", "role": "address0" }} , 
 	{ "name": "up_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "ce0" }} , 
 	{ "name": "up_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "d0" }} , 
 	{ "name": "up_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "q0" }} , 
 	{ "name": "up_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "we0" }} , 
 	{ "name": "logits_pe0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe0", "role": "default" }} , 
 	{ "name": "logits_pe1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe1", "role": "default" }} , 
 	{ "name": "logits_pe2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe2", "role": "default" }} , 
 	{ "name": "logits_pe3", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe3", "role": "default" }} , 
 	{ "name": "controller_run_rmsnorm", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rmsnorm", "role": "default" }} , 
 	{ "name": "controller_rmsnorm_mode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "controller_rmsnorm_mode", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "controller_run_linear_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_out", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "controller_linear_mode_out", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_out", "role": "default" }} , 
 	{ "name": "controller_run_rope", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rope", "role": "default" }} , 
 	{ "name": "controller_run_swiglu", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_swiglu", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "controller_layer_index_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "controller_layer_index_out", "role": "default" }} , 
 	{ "name": "controller_exit", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_exit", "role": "default" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "controller_weight_word_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "i" }} , 
 	{ "name": "controller_weight_word_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "o" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "i" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "o" }} , 
 	{ "name": "model_norm_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "address0" }} , 
 	{ "name": "model_norm_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "ce0" }} , 
 	{ "name": "model_norm_cache0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "d0" }} , 
 	{ "name": "model_norm_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "q0" }} , 
 	{ "name": "model_norm_cache0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "we0" }} , 
 	{ "name": "model_norm_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "address0" }} , 
 	{ "name": "model_norm_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "ce0" }} , 
 	{ "name": "model_norm_cache1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "d0" }} , 
 	{ "name": "model_norm_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "q0" }} , 
 	{ "name": "model_norm_cache1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "we0" }} , 
 	{ "name": "model_norm_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "address0" }} , 
 	{ "name": "model_norm_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "ce0" }} , 
 	{ "name": "model_norm_cache2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "d0" }} , 
 	{ "name": "model_norm_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "q0" }} , 
 	{ "name": "model_norm_cache2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "we0" }} , 
 	{ "name": "model_norm_cache3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "address0" }} , 
 	{ "name": "model_norm_cache3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "ce0" }} , 
 	{ "name": "model_norm_cache3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "d0" }} , 
 	{ "name": "model_norm_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "q0" }} , 
 	{ "name": "model_norm_cache3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "we0" }} , 
 	{ "name": "model_scale_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "address0" }} , 
 	{ "name": "model_scale_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "ce0" }} , 
 	{ "name": "model_scale_cache0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "d0" }} , 
 	{ "name": "model_scale_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "q0" }} , 
 	{ "name": "model_scale_cache0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "we0" }} , 
 	{ "name": "model_scale_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "address0" }} , 
 	{ "name": "model_scale_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "ce0" }} , 
 	{ "name": "model_scale_cache1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "d0" }} , 
 	{ "name": "model_scale_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "q0" }} , 
 	{ "name": "model_scale_cache1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "we0" }} , 
 	{ "name": "model_scale_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "address0" }} , 
 	{ "name": "model_scale_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "ce0" }} , 
 	{ "name": "model_scale_cache2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "d0" }} , 
 	{ "name": "model_scale_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "q0" }} , 
 	{ "name": "model_scale_cache2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "we0" }} , 
 	{ "name": "model_scale_cache3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "address0" }} , 
 	{ "name": "model_scale_cache3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "ce0" }} , 
 	{ "name": "model_scale_cache3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "d0" }} , 
 	{ "name": "model_scale_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "q0" }} , 
 	{ "name": "model_scale_cache3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "we0" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "weight_bank0_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "weight_bank0", "role": "ap_vld" }} , 
 	{ "name": "weight_bank1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "weight_bank1", "role": "ap_vld" }} , 
 	{ "name": "weight_bank2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "weight_bank2", "role": "ap_vld" }} , 
 	{ "name": "weight_bank3_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "weight_bank3", "role": "ap_vld" }} , 
 	{ "name": "logits_pe0_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "logits_pe0", "role": "ap_vld" }} , 
 	{ "name": "logits_pe1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "logits_pe1", "role": "ap_vld" }} , 
 	{ "name": "logits_pe2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "logits_pe2", "role": "ap_vld" }} , 
 	{ "name": "logits_pe3_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "logits_pe3", "role": "ap_vld" }} , 
 	{ "name": "p_read_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "p_read", "role": "ap_vld" }} , 
 	{ "name": "p_read1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "p_read1", "role": "ap_vld" }} , 
 	{ "name": "p_read2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "p_read2", "role": "ap_vld" }} , 
 	{ "name": "idx_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "preprocess_mode_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "preprocess_mode", "role": "ap_vld" }} , 
 	{ "name": "controller_run_rmsnorm_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rmsnorm", "role": "ap_vld" }} , 
 	{ "name": "controller_rmsnorm_mode_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_rmsnorm_mode", "role": "ap_vld" }} , 
 	{ "name": "controller_run_linear_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_linear_out", "role": "ap_vld" }} , 
 	{ "name": "controller_linear_mode_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_linear_mode_out", "role": "ap_vld" }} , 
 	{ "name": "controller_run_rope_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rope", "role": "ap_vld" }} , 
 	{ "name": "controller_run_swiglu_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_swiglu", "role": "ap_vld" }} , 
 	{ "name": "controller_layer_index_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_layer_index_out", "role": "ap_vld" }} , 
 	{ "name": "controller_exit_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_exit", "role": "ap_vld" }} , 
 	{ "name": "controller_weight_word_offset_constprop_i_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "i_ap_vld" }} , 
 	{ "name": "controller_weight_word_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_i_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "i_ap_vld" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "1027", "1028", "1029", "1030", "1031", "1032", "1033", "1034", "1035", "1036", "1037", "1038", "1039"],
		"CDFG" : "int4_dispatch_linear_registered",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "80", "EstimateLatencyMax" : "694274",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "entry_proc58_U0"},
			{"ID" : "2", "Name" : "int4_dispatch_linear_registered_Block_entry1_proc24_U0"},
			{"ID" : "3", "Name" : "int4_execute_dispatch_linear_U0"}],
		"OutputProcess" : [
			{"ID" : "3", "Name" : "int4_execute_dispatch_linear_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "activation_q"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "activation_scale"}]},
			{"Name" : "residual_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "residual_pe0"}]},
			{"Name" : "residual_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "residual_pe1"}]},
			{"Name" : "residual_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "residual_pe2"}]},
			{"Name" : "residual_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "residual_pe3"}]},
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"},
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "linear_stage0"}]},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "linear_stage1"}]},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "linear_stage2"}]},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "linear_stage3"}]},
			{"Name" : "q_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "q_pe0"}]},
			{"Name" : "q_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "q_pe1"}]},
			{"Name" : "q_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "q_pe2"}]},
			{"Name" : "q_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "q_pe3"}]},
			{"Name" : "k_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "k_pe0"}]},
			{"Name" : "k_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "k_pe1"}]},
			{"Name" : "k_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "k_pe2"}]},
			{"Name" : "k_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "k_pe3"}]},
			{"Name" : "v_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "v_pe0"}]},
			{"Name" : "v_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "v_pe1"}]},
			{"Name" : "v_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "v_pe2"}]},
			{"Name" : "v_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "v_pe3"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gate_pe0"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gate_pe1"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gate_pe2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "gate_pe3"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "up_pe0"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "up_pe1"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "up_pe2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "up_pe3"}]},
			{"Name" : "logits_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_run_rmsnorm"}]},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_rmsnorm_mode"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_run_linear_out"}]},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_linear_mode_out"}]},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_run_rope"}]},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_run_swiglu"}]},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_layer_index_out"}]},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_exit"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_weight_word_offset_constprop"}]},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "controller_weight_scale_word_offset_constprop"}]},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_norm_cache3"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_execute_dispatch_linear_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.entry_proc58_U0", "Parent" : "0",
		"CDFG" : "entry_proc58",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank0_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1027", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank0_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1028", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1029", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1030", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe0_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1031", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe0_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1032", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1033", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1034", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1035", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_run_linear_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1036", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_linear_mode_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1037", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_layer_index_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1038", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_dispatch_linear_registered_Block_entry1_proc24_U0", "Parent" : "0",
		"CDFG" : "int4_dispatch_linear_registered_Block_entry1_proc24",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"},
			{"Name" : "command_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["3"], "DependentChan" : "1039", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "command_stream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0", "Parent" : "0", "Child" : ["4", "6", "1012", "1014", "1016", "1018", "1020", "1022", "1024"],
		"CDFG" : "int4_execute_dispatch_linear",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "79", "EstimateLatencyMax" : "694273",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1027", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1028", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1029", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem3", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1030", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "activation_q", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "activation_scale", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "command_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "1039", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "command_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1024", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage3", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1020", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "4", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1018", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1016", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1014", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1012", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "logits_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1031", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1032", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1033", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1034", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_rmsnorm", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_rmsnorm_mode", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_run_linear_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1035", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_run_linear_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_linear_mode_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1036", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_linear_mode_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_rope", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_swiglu", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_layer_index_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1037", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_layer_index_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_exit", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "idx", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "1038", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_weight_word_offset_constprop", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_weight_scale_word_offset_constprop", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Parent" : "3", "Child" : ["5"],
		"CDFG" : "int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_pe0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "residual_pe1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "residual_pe2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "residual_pe3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "seed_linear_stage_with_residual_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377", "Parent" : "3", "Child" : ["7", "206", "207", "1009", "1010", "1011"],
		"CDFG" : "int4_run_preprocess_and_linear",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "693623",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "7", "Name" : "int4_preprocess_activation_stream_U0"},
			{"ID" : "206", "Name" : "int4_run_preprocess_and_linear_Block_entry13_proc_U0"},
			{"ID" : "207", "Name" : "int4_linear_4pe_from_stream_U0"}],
		"OutputProcess" : [
			{"ID" : "207", "Name" : "int4_linear_4pe_from_stream_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "activation_q"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "activation_scale"}]},
			{"Name" : "rms_input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe0"}]},
			{"Name" : "rms_input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe1"}]},
			{"Name" : "rms_input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe2"}]},
			{"Name" : "rms_input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe3"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe0"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe1"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe3"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe0"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe1"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe3"}]},
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe0"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe1"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe2"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe3"}]},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_rmsnorm"}]},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_rmsnorm_mode"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_linear_out"}]},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_linear_mode_out"}]},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_rope"}]},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_swiglu"}]},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_layer_index_out"}]},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_exit"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx4", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx8", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx9", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx10", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx11", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_weight_scale_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_scale_word_offset_constprop_out"}]},
			{"Name" : "controller_weight_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_word_offset_constprop_out"}]},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache3"}]},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_word_offset_constprop"}]},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_scale_word_offset_constprop"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0", "Parent" : "6", "Child" : ["8", "85"],
		"CDFG" : "int4_preprocess_activation_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "13203",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"},
			{"Name" : "rms_input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["207"], "DependentChan" : "1009", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["207"], "DependentChan" : "1010", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "8", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112", "Parent" : "7", "Child" : ["9"],
		"CDFG" : "int4_swiglu_quantize_stream_4pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13202", "EstimateLatencyMax" : "13202",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "9", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Parent" : "8", "Child" : ["10", "26", "42", "58", "74", "77", "78", "79", "80", "81", "82", "83", "84"],
		"CDFG" : "int4_swiglu_quantize_four_pes_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "10", "Name" : "int4_swiglu_quantize_pe0_U0"},
			{"ID" : "26", "Name" : "int4_swiglu_quantize_pe1_U0"},
			{"ID" : "42", "Name" : "int4_swiglu_quantize_pe2_U0"},
			{"ID" : "58", "Name" : "int4_swiglu_quantize_pe3_U0"}],
		"OutputProcess" : [
			{"ID" : "74", "Name" : "int4_swiglu_gather_streams_U0"}],
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "58", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "gate"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "up"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "up"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "up"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "58", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "up"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "74", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "74", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "scale_stream"}]}]},
	{"ID" : "10", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0", "Parent" : "9", "Child" : ["11", "12", "18", "22", "23", "24", "25"],
		"CDFG" : "int4_swiglu_quantize_pe0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "78", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "11", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.swiglu_group_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "10", "Child" : ["13", "14", "15", "16", "17"],
		"CDFG" : "int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "13", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U949", "Parent" : "12"},
	{"ID" : "14", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U951", "Parent" : "12"},
	{"ID" : "15", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U952", "Parent" : "12"},
	{"ID" : "16", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U953", "Parent" : "12"},
	{"ID" : "17", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "18", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "10", "Child" : ["19", "20", "21"],
		"CDFG" : "int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U964", "Parent" : "18"},
	{"ID" : "20", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U965", "Parent" : "18"},
	{"ID" : "21", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "22", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fmul_32ns_32ns_32_4_max_dsp_1_U969", "Parent" : "10"},
	{"ID" : "23", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U970", "Parent" : "10"},
	{"ID" : "24", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U971", "Parent" : "10"},
	{"ID" : "25", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fadd_32ns_32ns_32_7_full_dsp_1_U972", "Parent" : "10"},
	{"ID" : "26", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0", "Parent" : "9", "Child" : ["27", "28", "34", "38", "39", "40", "41"],
		"CDFG" : "int4_swiglu_quantize_pe1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "28", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "79", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "80", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "27", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.swiglu_group_U", "Parent" : "26"},
	{"ID" : "28", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "26", "Child" : ["29", "30", "31", "32", "33"],
		"CDFG" : "int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "29", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U980", "Parent" : "28"},
	{"ID" : "30", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U982", "Parent" : "28"},
	{"ID" : "31", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U983", "Parent" : "28"},
	{"ID" : "32", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U984", "Parent" : "28"},
	{"ID" : "33", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "34", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "26", "Child" : ["35", "36", "37"],
		"CDFG" : "int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "35", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U993", "Parent" : "34"},
	{"ID" : "36", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U994", "Parent" : "34"},
	{"ID" : "37", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "34"},
	{"ID" : "38", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fmul_32ns_32ns_32_4_max_dsp_1_U998", "Parent" : "26"},
	{"ID" : "39", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U999", "Parent" : "26"},
	{"ID" : "40", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1000", "Parent" : "26"},
	{"ID" : "41", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1001", "Parent" : "26"},
	{"ID" : "42", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0", "Parent" : "9", "Child" : ["43", "44", "50", "54", "55", "56", "57"],
		"CDFG" : "int4_swiglu_quantize_pe2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12601", "EstimateLatencyMax" : "12601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "81", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "82", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "43", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.swiglu_group_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "42", "Child" : ["45", "46", "47", "48", "49"],
		"CDFG" : "int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "45", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1008", "Parent" : "44"},
	{"ID" : "46", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1010", "Parent" : "44"},
	{"ID" : "47", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1011", "Parent" : "44"},
	{"ID" : "48", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1012", "Parent" : "44"},
	{"ID" : "49", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "44"},
	{"ID" : "50", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "42", "Child" : ["51", "52", "53"],
		"CDFG" : "int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "51", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1021", "Parent" : "50"},
	{"ID" : "52", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1022", "Parent" : "50"},
	{"ID" : "53", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "50"},
	{"ID" : "54", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1026", "Parent" : "42"},
	{"ID" : "55", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1027", "Parent" : "42"},
	{"ID" : "56", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1028", "Parent" : "42"},
	{"ID" : "57", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1029", "Parent" : "42"},
	{"ID" : "58", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0", "Parent" : "9", "Child" : ["59", "60", "66", "70", "71", "72", "73"],
		"CDFG" : "int4_swiglu_quantize_pe3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12601", "EstimateLatencyMax" : "12601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "60", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "83", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "84", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "59", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.swiglu_group_U", "Parent" : "58"},
	{"ID" : "60", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "58", "Child" : ["61", "62", "63", "64", "65"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "61", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1036", "Parent" : "60"},
	{"ID" : "62", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1038", "Parent" : "60"},
	{"ID" : "63", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1039", "Parent" : "60"},
	{"ID" : "64", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1040", "Parent" : "60"},
	{"ID" : "65", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "60"},
	{"ID" : "66", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "58", "Child" : ["67", "68", "69"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "67", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1049", "Parent" : "66"},
	{"ID" : "68", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1050", "Parent" : "66"},
	{"ID" : "69", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "66"},
	{"ID" : "70", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1054", "Parent" : "58"},
	{"ID" : "71", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1055", "Parent" : "58"},
	{"ID" : "72", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1056", "Parent" : "58"},
	{"ID" : "73", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1057", "Parent" : "58"},
	{"ID" : "74", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0", "Parent" : "9", "Child" : ["75"],
		"CDFG" : "int4_swiglu_gather_streams",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "177", "EstimateLatencyMax" : "881",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["26"], "DependentChan" : "79", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["42"], "DependentChan" : "81", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["58"], "DependentChan" : "83", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "78", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["26"], "DependentChan" : "80", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["42"], "DependentChan" : "82", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["58"], "DependentChan" : "84", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_local_tile_loop_swiglu_stream_pe_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "75", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Parent" : "74", "Child" : ["76"],
		"CDFG" : "int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "select_ln946", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "76", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88.flow_control_loop_pipe_sequential_init_U", "Parent" : "75"},
	{"ID" : "77", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe0_U", "Parent" : "9"},
	{"ID" : "78", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe0_U", "Parent" : "9"},
	{"ID" : "79", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe1_U", "Parent" : "9"},
	{"ID" : "80", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe1_U", "Parent" : "9"},
	{"ID" : "81", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe2_U", "Parent" : "9"},
	{"ID" : "82", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe2_U", "Parent" : "9"},
	{"ID" : "83", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe3_U", "Parent" : "9"},
	{"ID" : "84", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe3_U", "Parent" : "9"},
	{"ID" : "85", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Parent" : "7", "Child" : ["86", "135"],
		"CDFG" : "int4_rmsnorm_quantize_stream_4pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7892", "EstimateLatencyMax" : "7892",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "86", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "86", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "86", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "86", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "quantized_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "scale_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}]},
	{"ID" : "86", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88", "Parent" : "85", "Child" : ["87", "97", "107", "117", "127", "131", "132", "133", "134"],
		"CDFG" : "int4_rms_sumsq_four_pes",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "87", "Name" : "int4_rms_sumsq_pe_U0"},
			{"ID" : "97", "Name" : "int4_rms_sumsq_pe_10_U0"},
			{"ID" : "107", "Name" : "int4_rms_sumsq_pe_11_U0"},
			{"ID" : "117", "Name" : "int4_rms_sumsq_pe_12_U0"}],
		"OutputProcess" : [
			{"ID" : "127", "Name" : "int4_rms_merge_and_rsqrt_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "87", "SubInstance" : "int4_rms_sumsq_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "97", "SubInstance" : "int4_rms_sumsq_pe_10_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "107", "SubInstance" : "int4_rms_sumsq_pe_11_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "117", "SubInstance" : "int4_rms_sumsq_pe_12_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "127", "SubInstance" : "int4_rms_merge_and_rsqrt_U0", "Port" : "reciprocal_rms"}]}]},
	{"ID" : "87", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0", "Parent" : "86", "Child" : ["88", "93", "96"],
		"CDFG" : "int4_rms_sumsq_pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "88", "SubInstance" : "grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "88", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "87", "Child" : ["89", "90", "91", "92"],
		"CDFG" : "int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "89", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1112", "Parent" : "88"},
	{"ID" : "90", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1113", "Parent" : "88"},
	{"ID" : "91", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1114", "Parent" : "88"},
	{"ID" : "92", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "88"},
	{"ID" : "93", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "87", "Child" : ["94", "95"],
		"CDFG" : "int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "94", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1133", "Parent" : "93"},
	{"ID" : "95", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "93"},
	{"ID" : "96", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1151", "Parent" : "87"},
	{"ID" : "97", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0", "Parent" : "86", "Child" : ["98", "103", "106"],
		"CDFG" : "int4_rms_sumsq_pe_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "132", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "98", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "97", "Child" : ["99", "100", "101", "102"],
		"CDFG" : "int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "99", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1156", "Parent" : "98"},
	{"ID" : "100", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1157", "Parent" : "98"},
	{"ID" : "101", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1158", "Parent" : "98"},
	{"ID" : "102", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "98"},
	{"ID" : "103", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "97", "Child" : ["104", "105"],
		"CDFG" : "int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "104", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1177", "Parent" : "103"},
	{"ID" : "105", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "106", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1195", "Parent" : "97"},
	{"ID" : "107", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0", "Parent" : "86", "Child" : ["108", "113", "116"],
		"CDFG" : "int4_rms_sumsq_pe_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "108", "SubInstance" : "grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "133", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "108", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "107", "Child" : ["109", "110", "111", "112"],
		"CDFG" : "int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "109", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1199", "Parent" : "108"},
	{"ID" : "110", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1200", "Parent" : "108"},
	{"ID" : "111", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1201", "Parent" : "108"},
	{"ID" : "112", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "108"},
	{"ID" : "113", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "107", "Child" : ["114", "115"],
		"CDFG" : "int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "114", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1220", "Parent" : "113"},
	{"ID" : "115", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "113"},
	{"ID" : "116", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1238", "Parent" : "107"},
	{"ID" : "117", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0", "Parent" : "86", "Child" : ["118", "123", "126"],
		"CDFG" : "int4_rms_sumsq_pe_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "118", "SubInstance" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "134", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "118", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "117", "Child" : ["119", "120", "121", "122"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "119", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1242", "Parent" : "118"},
	{"ID" : "120", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1243", "Parent" : "118"},
	{"ID" : "121", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1244", "Parent" : "118"},
	{"ID" : "122", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "118"},
	{"ID" : "123", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "117", "Child" : ["124", "125"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "124", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1263", "Parent" : "123"},
	{"ID" : "125", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "123"},
	{"ID" : "126", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1281", "Parent" : "117"},
	{"ID" : "127", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0", "Parent" : "86", "Child" : ["128", "129", "130"],
		"CDFG" : "int4_rms_merge_and_rsqrt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49", "EstimateLatencyMax" : "49",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["87"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["97"], "DependentChan" : "132", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["107"], "DependentChan" : "133", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["117"], "DependentChan" : "134", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "128", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1284", "Parent" : "127"},
	{"ID" : "129", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1285", "Parent" : "127"},
	{"ID" : "130", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.frsqrt_32ns_32ns_32_17_full_dsp_1_U1286", "Parent" : "127"},
	{"ID" : "131", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_0_U", "Parent" : "86"},
	{"ID" : "132", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_1_U", "Parent" : "86"},
	{"ID" : "133", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_2_U", "Parent" : "86"},
	{"ID" : "134", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_3_U", "Parent" : "86"},
	{"ID" : "135", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Parent" : "85", "Child" : ["136", "151", "166", "181", "196", "198", "199", "200", "201", "202", "203", "204", "205"],
		"CDFG" : "int4_rms_normalize_quantize_four_pes_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "136", "Name" : "int4_rms_normalize_quantize_pe_U0"},
			{"ID" : "151", "Name" : "int4_rms_normalize_quantize_pe_13_U0"},
			{"ID" : "166", "Name" : "int4_rms_normalize_quantize_pe_14_U0"},
			{"ID" : "181", "Name" : "int4_rms_normalize_quantize_pe_15_U0"}],
		"OutputProcess" : [
			{"ID" : "196", "Name" : "int4_rms_gather_streams_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "151", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "166", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "181", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "196", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "196", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "scale_stream"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "151", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "166", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "181", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "model_norm_cache3"}]}]},
	{"ID" : "136", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0", "Parent" : "135", "Child" : ["137", "138", "143", "148", "149", "150"],
		"CDFG" : "int4_rms_normalize_quantize_pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "138", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "199", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "138", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "model_norm_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "137", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.normalized_U", "Parent" : "136"},
	{"ID" : "138", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Parent" : "136", "Child" : ["139", "140", "141", "142"],
		"CDFG" : "int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "139", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "138"},
	{"ID" : "140", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1304", "Parent" : "138"},
	{"ID" : "141", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1305", "Parent" : "138"},
	{"ID" : "142", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "138"},
	{"ID" : "143", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "136", "Child" : ["144", "145", "146", "147"],
		"CDFG" : "int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_07_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "144", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1313", "Parent" : "143"},
	{"ID" : "145", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1316", "Parent" : "143"},
	{"ID" : "146", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1317", "Parent" : "143"},
	{"ID" : "147", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "143"},
	{"ID" : "148", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1321", "Parent" : "136"},
	{"ID" : "149", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1322", "Parent" : "136"},
	{"ID" : "150", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1323", "Parent" : "136"},
	{"ID" : "151", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0", "Parent" : "135", "Child" : ["152", "153", "158", "163", "164", "165"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "200", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "201", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "152", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.normalized_U", "Parent" : "151"},
	{"ID" : "153", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "151", "Child" : ["154", "155", "156", "157"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "154", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1331", "Parent" : "153"},
	{"ID" : "155", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1332", "Parent" : "153"},
	{"ID" : "156", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1333", "Parent" : "153"},
	{"ID" : "157", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "153"},
	{"ID" : "158", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "151", "Child" : ["159", "160", "161", "162"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_07_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "159", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1341", "Parent" : "158"},
	{"ID" : "160", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1344", "Parent" : "158"},
	{"ID" : "161", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1345", "Parent" : "158"},
	{"ID" : "162", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "158"},
	{"ID" : "163", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1349", "Parent" : "151"},
	{"ID" : "164", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1350", "Parent" : "151"},
	{"ID" : "165", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1351", "Parent" : "151"},
	{"ID" : "166", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0", "Parent" : "135", "Child" : ["167", "168", "173", "178", "179", "180"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "168", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "202", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "203", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "168", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "167", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.normalized_U", "Parent" : "166"},
	{"ID" : "168", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "166", "Child" : ["169", "170", "171", "172"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "169", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1359", "Parent" : "168"},
	{"ID" : "170", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1360", "Parent" : "168"},
	{"ID" : "171", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1361", "Parent" : "168"},
	{"ID" : "172", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "168"},
	{"ID" : "173", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "166", "Child" : ["174", "175", "176", "177"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "174", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1369", "Parent" : "173"},
	{"ID" : "175", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1372", "Parent" : "173"},
	{"ID" : "176", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1373", "Parent" : "173"},
	{"ID" : "177", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "173"},
	{"ID" : "178", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1377", "Parent" : "166"},
	{"ID" : "179", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1378", "Parent" : "166"},
	{"ID" : "180", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1379", "Parent" : "166"},
	{"ID" : "181", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0", "Parent" : "135", "Child" : ["182", "183", "188", "193", "194", "195"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "183", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "204", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["196"], "DependentChan" : "205", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "183", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "182", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.normalized_U", "Parent" : "181"},
	{"ID" : "183", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "181", "Child" : ["184", "185", "186", "187"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "184", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1387", "Parent" : "183"},
	{"ID" : "185", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1388", "Parent" : "183"},
	{"ID" : "186", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1389", "Parent" : "183"},
	{"ID" : "187", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "183"},
	{"ID" : "188", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "181", "Child" : ["189", "190", "191", "192"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "189", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "188"},
	{"ID" : "190", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "188"},
	{"ID" : "191", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "188"},
	{"ID" : "192", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "188"},
	{"ID" : "193", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1405", "Parent" : "181"},
	{"ID" : "194", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1406", "Parent" : "181"},
	{"ID" : "195", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1407", "Parent" : "181"},
	{"ID" : "196", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0", "Parent" : "135", "Child" : ["197"],
		"CDFG" : "int4_rms_gather_streams",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["136"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["151"], "DependentChan" : "200", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["166"], "DependentChan" : "202", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["181"], "DependentChan" : "204", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["136"], "DependentChan" : "199", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["151"], "DependentChan" : "201", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["166"], "DependentChan" : "203", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["181"], "DependentChan" : "205", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "rms_stream_local_tile_loop_rms_stream_pe_loop_rms_stream_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "197", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0.flow_control_loop_pipe_U", "Parent" : "196"},
	{"ID" : "198", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe0_U", "Parent" : "135"},
	{"ID" : "199", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe0_U", "Parent" : "135"},
	{"ID" : "200", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe1_U", "Parent" : "135"},
	{"ID" : "201", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe1_U", "Parent" : "135"},
	{"ID" : "202", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe2_U", "Parent" : "135"},
	{"ID" : "203", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe2_U", "Parent" : "135"},
	{"ID" : "204", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe3_U", "Parent" : "135"},
	{"ID" : "205", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe3_U", "Parent" : "135"},
	{"ID" : "206", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_run_preprocess_and_linear_Block_entry13_proc_U0", "Parent" : "6",
		"CDFG" : "int4_run_preprocess_and_linear_Block_entry13_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "207", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0", "Parent" : "6", "Child" : ["208"],
		"CDFG" : "int4_linear_4pe_from_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "693618",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "1009", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "1010", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "1011", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx4", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_weight_scale_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_weight_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "208", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572", "Parent" : "207", "Child" : ["209", "210", "213", "409", "605", "801", "997", "998", "999", "1000", "1001", "1002", "1003", "1004", "1005", "1006", "1007", "1008"],
		"CDFG" : "int4_run_four_pes",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32879", "EstimateLatencyMax" : "693615",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "209", "Name" : "int4_broadcast_linear_commands_U0"},
			{"ID" : "210", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "213", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "409", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "605", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "801", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"OutputProcess" : [
			{"ID" : "210", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "213", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "409", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "605", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "801", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "213", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "409", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "605", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "801", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "packed_scales"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "scale_stream"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "213", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "409", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "605", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "801", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "output_mem"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_fxp", "Type" : "None", "Direction" : "I"},
			{"Name" : "fuse_residual", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx4", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx5", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx6", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx7", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "213", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "409", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "605", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "801", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "209", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_linear_commands_U0", "Parent" : "208",
		"CDFG" : "int4_broadcast_linear_commands",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["213","215"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["409","411"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["605","607"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["801","803"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_fxp", "Type" : "None", "Direction" : "I"},
			{"Name" : "fuse_residual", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "210", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0", "Parent" : "208", "Child" : ["211"],
		"CDFG" : "int4_broadcast_activation",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "135", "EstimateLatencyMax" : "351",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["213","219"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["409","415"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["605","611"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["801","807"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["213","219"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["409","415"], "DependentChan" : "1006", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["605","611"], "DependentChan" : "1007", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["801","807"], "DependentChan" : "1008", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "211", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Parent" : "210", "Child" : ["212"],
		"CDFG" : "int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "132", "EstimateLatencyMax" : "348",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "active_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "active_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "active_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "active_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "streamed_scale_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "broadcast_activation_seed_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "212", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141.flow_control_loop_pipe_sequential_init_U", "Parent" : "211"},
	{"ID" : "213", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0", "Parent" : "208", "Child" : ["214", "215", "217", "219", "227", "359", "380", "383", "391", "392", "393", "394", "395", "396", "397", "398", "399", "400", "401", "402", "403", "404", "405", "406", "407", "408"],
		"CDFG" : "int4_run_pe_dataflow_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32878", "EstimateLatencyMax" : "693614",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "214", "Name" : "entry_proc56_U0"},
			{"ID" : "215", "Name" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0"},
			{"ID" : "217", "Name" : "int4_stream_pe_inputs_U0"},
			{"ID" : "359", "Name" : "int4_dequantize_final_blocks_U0"},
			{"ID" : "383", "Name" : "int4_write_outputs_9_U0"}],
		"OutputProcess" : [
			{"ID" : "383", "Name" : "int4_write_outputs_9_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "int4_stream_pe_inputs_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "quantized_pe0"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "activation_scale_pe0"}]},
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "215", "SubInstance" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Port" : "linear_command_pe0"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "383", "SubInstance" : "int4_write_outputs_9_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "359", "SubInstance" : "int4_dequantize_final_blocks_U0", "Port" : "model_scale_cache0"}]}]},
	{"ID" : "214", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.entry_proc56_U0", "Parent" : "213",
		"CDFG" : "entry_proc56",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["359"], "DependentChan" : "391", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "215", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Parent" : "213", "Child" : ["216"],
		"CDFG" : "int4_run_pe_dataflow_0_Block_entry2_proc20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "216", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0.mul_6ns_6ns_12_1_1_U1535", "Parent" : "215"},
	{"ID" : "217", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0", "Parent" : "213", "Child" : ["218"],
		"CDFG" : "int4_stream_pe_inputs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32842", "EstimateLatencyMax" : "258122",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["227"], "DependentChan" : "397", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["215"], "DependentChan" : "392", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "218", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0.flow_control_loop_pipe_U", "Parent" : "217"},
	{"ID" : "219", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0", "Parent" : "213", "Child" : ["220", "221", "222", "224", "226"],
		"CDFG" : "int4_cache_and_replay_activation_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1161", "EstimateLatencyMax" : "22025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "222", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "222", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["227"], "DependentChan" : "398", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "224", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["359"], "DependentChan" : "399", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "224", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["215"], "DependentChan" : "396", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["215"], "DependentChan" : "395", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["227"], "DependentChan" : "400", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["227"], "DependentChan" : "401", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "220", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.activation_cache_U", "Parent" : "219"},
	{"ID" : "221", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.scale_cache_U", "Parent" : "219"},
	{"ID" : "222", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "219", "Child" : ["223"],
		"CDFG" : "int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "223", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "222"},
	{"ID" : "224", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Parent" : "219", "Child" : ["225"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "225", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "224"},
	{"ID" : "226", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.mul_6ns_9ns_15_1_1_U1554", "Parent" : "219"},
	{"ID" : "227", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0", "Parent" : "213", "Child" : ["228", "358"],
		"CDFG" : "int4_stream_integer_blocks",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32789", "EstimateLatencyMax" : "693525",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["217"], "DependentChan" : "397", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "228", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["219"], "DependentChan" : "398", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "228", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["359"], "DependentChan" : "402", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "228", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["219"], "DependentChan" : "401", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["219"], "DependentChan" : "400", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["359"], "DependentChan" : "403", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["359"], "DependentChan" : "404", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "228", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Parent" : "227", "Child" : ["229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "352", "353", "354", "355", "356", "357"],
		"CDFG" : "int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32786", "EstimateLatencyMax" : "693522",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound19", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bound6", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter18", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter18", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "229", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1566", "Parent" : "228"},
	{"ID" : "230", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1567", "Parent" : "228"},
	{"ID" : "231", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1568", "Parent" : "228"},
	{"ID" : "232", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1569", "Parent" : "228"},
	{"ID" : "233", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1570", "Parent" : "228"},
	{"ID" : "234", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1571", "Parent" : "228"},
	{"ID" : "235", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1572", "Parent" : "228"},
	{"ID" : "236", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1573", "Parent" : "228"},
	{"ID" : "237", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1574", "Parent" : "228"},
	{"ID" : "238", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1575", "Parent" : "228"},
	{"ID" : "239", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1576", "Parent" : "228"},
	{"ID" : "240", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1577", "Parent" : "228"},
	{"ID" : "241", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1578", "Parent" : "228"},
	{"ID" : "242", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1579", "Parent" : "228"},
	{"ID" : "243", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1580", "Parent" : "228"},
	{"ID" : "244", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1581", "Parent" : "228"},
	{"ID" : "245", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1582", "Parent" : "228"},
	{"ID" : "246", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1583", "Parent" : "228"},
	{"ID" : "247", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1584", "Parent" : "228"},
	{"ID" : "248", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1585", "Parent" : "228"},
	{"ID" : "249", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1586", "Parent" : "228"},
	{"ID" : "250", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1587", "Parent" : "228"},
	{"ID" : "251", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1588", "Parent" : "228"},
	{"ID" : "252", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1589", "Parent" : "228"},
	{"ID" : "253", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1590", "Parent" : "228"},
	{"ID" : "254", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1591", "Parent" : "228"},
	{"ID" : "255", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1592", "Parent" : "228"},
	{"ID" : "256", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1593", "Parent" : "228"},
	{"ID" : "257", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1594", "Parent" : "228"},
	{"ID" : "258", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1595", "Parent" : "228"},
	{"ID" : "259", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1596", "Parent" : "228"},
	{"ID" : "260", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1597", "Parent" : "228"},
	{"ID" : "261", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1598", "Parent" : "228"},
	{"ID" : "262", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1599", "Parent" : "228"},
	{"ID" : "263", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1600", "Parent" : "228"},
	{"ID" : "264", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1601", "Parent" : "228"},
	{"ID" : "265", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1602", "Parent" : "228"},
	{"ID" : "266", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1603", "Parent" : "228"},
	{"ID" : "267", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1604", "Parent" : "228"},
	{"ID" : "268", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1605", "Parent" : "228"},
	{"ID" : "269", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1606", "Parent" : "228"},
	{"ID" : "270", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1607", "Parent" : "228"},
	{"ID" : "271", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1608", "Parent" : "228"},
	{"ID" : "272", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1609", "Parent" : "228"},
	{"ID" : "273", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1610", "Parent" : "228"},
	{"ID" : "274", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1611", "Parent" : "228"},
	{"ID" : "275", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1612", "Parent" : "228"},
	{"ID" : "276", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1613", "Parent" : "228"},
	{"ID" : "277", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1614", "Parent" : "228"},
	{"ID" : "278", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1615", "Parent" : "228"},
	{"ID" : "279", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1616", "Parent" : "228"},
	{"ID" : "280", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1617", "Parent" : "228"},
	{"ID" : "281", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1618", "Parent" : "228"},
	{"ID" : "282", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1619", "Parent" : "228"},
	{"ID" : "283", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1620", "Parent" : "228"},
	{"ID" : "284", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1621", "Parent" : "228"},
	{"ID" : "285", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1622", "Parent" : "228"},
	{"ID" : "286", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1623", "Parent" : "228"},
	{"ID" : "287", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1624", "Parent" : "228"},
	{"ID" : "288", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1625", "Parent" : "228"},
	{"ID" : "289", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1626", "Parent" : "228"},
	{"ID" : "290", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1627", "Parent" : "228"},
	{"ID" : "291", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1628", "Parent" : "228"},
	{"ID" : "292", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1629", "Parent" : "228"},
	{"ID" : "293", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1630", "Parent" : "228"},
	{"ID" : "294", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1631", "Parent" : "228"},
	{"ID" : "295", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1632", "Parent" : "228"},
	{"ID" : "296", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1633", "Parent" : "228"},
	{"ID" : "297", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1634", "Parent" : "228"},
	{"ID" : "298", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1635", "Parent" : "228"},
	{"ID" : "299", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1636", "Parent" : "228"},
	{"ID" : "300", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1637", "Parent" : "228"},
	{"ID" : "301", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1638", "Parent" : "228"},
	{"ID" : "302", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1639", "Parent" : "228"},
	{"ID" : "303", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1640", "Parent" : "228"},
	{"ID" : "304", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1641", "Parent" : "228"},
	{"ID" : "305", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1642", "Parent" : "228"},
	{"ID" : "306", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1643", "Parent" : "228"},
	{"ID" : "307", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1644", "Parent" : "228"},
	{"ID" : "308", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1645", "Parent" : "228"},
	{"ID" : "309", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1646", "Parent" : "228"},
	{"ID" : "310", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1647", "Parent" : "228"},
	{"ID" : "311", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1648", "Parent" : "228"},
	{"ID" : "312", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1649", "Parent" : "228"},
	{"ID" : "313", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1650", "Parent" : "228"},
	{"ID" : "314", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1651", "Parent" : "228"},
	{"ID" : "315", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1652", "Parent" : "228"},
	{"ID" : "316", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1653", "Parent" : "228"},
	{"ID" : "317", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1654", "Parent" : "228"},
	{"ID" : "318", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1655", "Parent" : "228"},
	{"ID" : "319", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1656", "Parent" : "228"},
	{"ID" : "320", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1657", "Parent" : "228"},
	{"ID" : "321", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1658", "Parent" : "228"},
	{"ID" : "322", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1659", "Parent" : "228"},
	{"ID" : "323", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1660", "Parent" : "228"},
	{"ID" : "324", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1661", "Parent" : "228"},
	{"ID" : "325", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1662", "Parent" : "228"},
	{"ID" : "326", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1663", "Parent" : "228"},
	{"ID" : "327", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1664", "Parent" : "228"},
	{"ID" : "328", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1665", "Parent" : "228"},
	{"ID" : "329", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1666", "Parent" : "228"},
	{"ID" : "330", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1667", "Parent" : "228"},
	{"ID" : "331", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1668", "Parent" : "228"},
	{"ID" : "332", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1669", "Parent" : "228"},
	{"ID" : "333", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1670", "Parent" : "228"},
	{"ID" : "334", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1671", "Parent" : "228"},
	{"ID" : "335", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1672", "Parent" : "228"},
	{"ID" : "336", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1673", "Parent" : "228"},
	{"ID" : "337", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1674", "Parent" : "228"},
	{"ID" : "338", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1675", "Parent" : "228"},
	{"ID" : "339", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1676", "Parent" : "228"},
	{"ID" : "340", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1677", "Parent" : "228"},
	{"ID" : "341", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1678", "Parent" : "228"},
	{"ID" : "342", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1679", "Parent" : "228"},
	{"ID" : "343", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1680", "Parent" : "228"},
	{"ID" : "344", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1681", "Parent" : "228"},
	{"ID" : "345", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1682", "Parent" : "228"},
	{"ID" : "346", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1683", "Parent" : "228"},
	{"ID" : "347", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1684", "Parent" : "228"},
	{"ID" : "348", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1685", "Parent" : "228"},
	{"ID" : "349", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1686", "Parent" : "228"},
	{"ID" : "350", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1687", "Parent" : "228"},
	{"ID" : "351", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1688", "Parent" : "228"},
	{"ID" : "352", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1689", "Parent" : "228"},
	{"ID" : "353", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1690", "Parent" : "228"},
	{"ID" : "354", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1691", "Parent" : "228"},
	{"ID" : "355", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1692", "Parent" : "228"},
	{"ID" : "356", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1693", "Parent" : "228"},
	{"ID" : "357", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "228"},
	{"ID" : "358", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.mul_6ns_14ns_20_1_1_U1706", "Parent" : "227"},
	{"ID" : "359", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0", "Parent" : "213", "Child" : ["360", "379"],
		"CDFG" : "int4_dequantize_final_blocks",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32795", "EstimateLatencyMax" : "693531",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["227"], "DependentChan" : "402", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "360", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["219"], "DependentChan" : "399", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "360", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["380"], "DependentChan" : "405", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "360", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["227"], "DependentChan" : "404", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["227"], "DependentChan" : "403", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "391", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["380"], "DependentChan" : "406", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "360", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "360", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Parent" : "359", "Child" : ["361", "362", "363", "364", "365", "366", "367", "368", "369", "370", "371", "372", "373", "374", "375", "376", "377", "378"],
		"CDFG" : "int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32793", "EstimateLatencyMax" : "693529",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "block_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "361", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_U", "Parent" : "360"},
	{"ID" : "362", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_3_U", "Parent" : "360"},
	{"ID" : "363", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_2_U", "Parent" : "360"},
	{"ID" : "364", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_1_U", "Parent" : "360"},
	{"ID" : "365", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1715", "Parent" : "360"},
	{"ID" : "366", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1716", "Parent" : "360"},
	{"ID" : "367", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1717", "Parent" : "360"},
	{"ID" : "368", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1718", "Parent" : "360"},
	{"ID" : "369", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1719", "Parent" : "360"},
	{"ID" : "370", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1720", "Parent" : "360"},
	{"ID" : "371", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1721", "Parent" : "360"},
	{"ID" : "372", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1722", "Parent" : "360"},
	{"ID" : "373", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1723", "Parent" : "360"},
	{"ID" : "374", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1724", "Parent" : "360"},
	{"ID" : "375", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1725", "Parent" : "360"},
	{"ID" : "376", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1726", "Parent" : "360"},
	{"ID" : "377", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1727", "Parent" : "360"},
	{"ID" : "378", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "360"},
	{"ID" : "379", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.mul_6ns_14ns_20_1_1_U1738", "Parent" : "359"},
	{"ID" : "380", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0", "Parent" : "213", "Child" : ["381"],
		"CDFG" : "int4_pack_dequantized_outputs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "8071",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["359"], "DependentChan" : "405", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "381", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["383"], "DependentChan" : "407", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "381", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["359"], "DependentChan" : "406", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["215"], "DependentChan" : "393", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["383"], "DependentChan" : "408", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "381", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "380", "Child" : ["382"],
		"CDFG" : "int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1029", "EstimateLatencyMax" : "8069",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "pack_dequantized_value_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "382", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "381"},
	{"ID" : "383", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0", "Parent" : "213", "Child" : ["384", "386"],
		"CDFG" : "int4_write_outputs_9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "1857",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["380"], "DependentChan" : "407", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "384", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "384", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["380"], "DependentChan" : "408", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["215"], "DependentChan" : "394", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "384", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Parent" : "383", "Child" : ["385"],
		"CDFG" : "int4_write_outputs_9_Pipeline_write_output_direct_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "507",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "write_output_direct_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "385", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "384"},
	{"ID" : "386", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "383", "Child" : ["387", "388", "389", "390"],
		"CDFG" : "int4_write_outputs_9_Pipeline_fused_residual_add_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "fused_residual_add_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "387", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U1759", "Parent" : "386"},
	{"ID" : "388", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1760", "Parent" : "386"},
	{"ID" : "389", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1761", "Parent" : "386"},
	{"ID" : "390", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "386"},
	{"ID" : "391", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.idx1_c_U", "Parent" : "213"},
	{"ID" : "392", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.mul_ln867_loc_channel_U", "Parent" : "213"},
	{"ID" : "393", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_fxp_loc_channel_U", "Parent" : "213"},
	{"ID" : "394", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.fuse_residual_loc_channel_U", "Parent" : "213"},
	{"ID" : "395", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c17_channel_U", "Parent" : "213"},
	{"ID" : "396", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c21_channel_U", "Parent" : "213"},
	{"ID" : "397", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.weight_stream_U", "Parent" : "213"},
	{"ID" : "398", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_activation_stream_U", "Parent" : "213"},
	{"ID" : "399", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_scale_stream_U", "Parent" : "213"},
	{"ID" : "400", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c16_U", "Parent" : "213"},
	{"ID" : "401", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c20_U", "Parent" : "213"},
	{"ID" : "402", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.group_stream_U", "Parent" : "213"},
	{"ID" : "403", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c_U", "Parent" : "213"},
	{"ID" : "404", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c19_U", "Parent" : "213"},
	{"ID" : "405", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.final_block_stream_U", "Parent" : "213"},
	{"ID" : "406", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c18_U", "Parent" : "213"},
	{"ID" : "407", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_stream_U", "Parent" : "213"},
	{"ID" : "408", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c_U", "Parent" : "213"},
	{"ID" : "409", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0", "Parent" : "208", "Child" : ["410", "411", "413", "415", "423", "555", "576", "579", "587", "588", "589", "590", "591", "592", "593", "594", "595", "596", "597", "598", "599", "600", "601", "602", "603", "604"],
		"CDFG" : "int4_run_pe_dataflow_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32878", "EstimateLatencyMax" : "693614",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "410", "Name" : "entry_proc55_U0"},
			{"ID" : "411", "Name" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0"},
			{"ID" : "413", "Name" : "int4_stream_pe_inputs_16_U0"},
			{"ID" : "555", "Name" : "int4_dequantize_final_blocks_17_U0"},
			{"ID" : "579", "Name" : "int4_write_outputs_8_U0"}],
		"OutputProcess" : [
			{"ID" : "579", "Name" : "int4_write_outputs_8_U0"}],
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "413", "SubInstance" : "int4_stream_pe_inputs_16_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "415", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "quantized_pe1"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1006", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "415", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "activation_scale_pe1"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "411", "SubInstance" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Port" : "linear_command_pe1"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "579", "SubInstance" : "int4_write_outputs_8_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "555", "SubInstance" : "int4_dequantize_final_blocks_17_U0", "Port" : "model_scale_cache1"}]}]},
	{"ID" : "410", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.entry_proc55_U0", "Parent" : "409",
		"CDFG" : "entry_proc55",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["555"], "DependentChan" : "587", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "411", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Parent" : "409", "Child" : ["412"],
		"CDFG" : "int4_run_pe_dataflow_1_Block_entry2_proc21",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "412", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0.mul_6ns_6ns_12_1_1_U1843", "Parent" : "411"},
	{"ID" : "413", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0", "Parent" : "409", "Child" : ["414"],
		"CDFG" : "int4_stream_pe_inputs_16",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32842", "EstimateLatencyMax" : "258122",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["423"], "DependentChan" : "593", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["411"], "DependentChan" : "588", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "414", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0.flow_control_loop_pipe_U", "Parent" : "413"},
	{"ID" : "415", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0", "Parent" : "409", "Child" : ["416", "417", "418", "420", "422"],
		"CDFG" : "int4_cache_and_replay_activation_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1161", "EstimateLatencyMax" : "22025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "418", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1006", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "418", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["423"], "DependentChan" : "594", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "420", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["555"], "DependentChan" : "595", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "420", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["411"], "DependentChan" : "592", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["411"], "DependentChan" : "591", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["423"], "DependentChan" : "596", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["423"], "DependentChan" : "597", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "416", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.activation_cache_U", "Parent" : "415"},
	{"ID" : "417", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.scale_cache_U", "Parent" : "415"},
	{"ID" : "418", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "415", "Child" : ["419"],
		"CDFG" : "int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "419", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "418"},
	{"ID" : "420", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Parent" : "415", "Child" : ["421"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "421", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "420"},
	{"ID" : "422", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.mul_6ns_9ns_15_1_1_U1861", "Parent" : "415"},
	{"ID" : "423", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0", "Parent" : "409", "Child" : ["424", "554"],
		"CDFG" : "int4_stream_integer_blocks_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32789", "EstimateLatencyMax" : "693525",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["413"], "DependentChan" : "593", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "424", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["415"], "DependentChan" : "594", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "424", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["555"], "DependentChan" : "598", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "424", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["415"], "DependentChan" : "597", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["415"], "DependentChan" : "596", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["555"], "DependentChan" : "599", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["555"], "DependentChan" : "600", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "424", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "423", "Child" : ["425", "426", "427", "428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440", "441", "442", "443", "444", "445", "446", "447", "448", "449", "450", "451", "452", "453", "454", "455", "456", "457", "458", "459", "460", "461", "462", "463", "464", "465", "466", "467", "468", "469", "470", "471", "472", "473", "474", "475", "476", "477", "478", "479", "480", "481", "482", "483", "484", "485", "486", "487", "488", "489", "490", "491", "492", "493", "494", "495", "496", "497", "498", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512", "513", "514", "515", "516", "517", "518", "519", "520", "521", "522", "523", "524", "525", "526", "527", "528", "529", "530", "531", "532", "533", "534", "535", "536", "537", "538", "539", "540", "541", "542", "543", "544", "545", "546", "547", "548", "549", "550", "551", "552", "553"],
		"CDFG" : "int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32786", "EstimateLatencyMax" : "693522",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound19", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bound6", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter18", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter18", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "425", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1870", "Parent" : "424"},
	{"ID" : "426", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1871", "Parent" : "424"},
	{"ID" : "427", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1872", "Parent" : "424"},
	{"ID" : "428", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1873", "Parent" : "424"},
	{"ID" : "429", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1874", "Parent" : "424"},
	{"ID" : "430", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1875", "Parent" : "424"},
	{"ID" : "431", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1876", "Parent" : "424"},
	{"ID" : "432", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1877", "Parent" : "424"},
	{"ID" : "433", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1878", "Parent" : "424"},
	{"ID" : "434", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1879", "Parent" : "424"},
	{"ID" : "435", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1880", "Parent" : "424"},
	{"ID" : "436", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1881", "Parent" : "424"},
	{"ID" : "437", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1882", "Parent" : "424"},
	{"ID" : "438", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1883", "Parent" : "424"},
	{"ID" : "439", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1884", "Parent" : "424"},
	{"ID" : "440", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1885", "Parent" : "424"},
	{"ID" : "441", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1886", "Parent" : "424"},
	{"ID" : "442", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1887", "Parent" : "424"},
	{"ID" : "443", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1888", "Parent" : "424"},
	{"ID" : "444", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1889", "Parent" : "424"},
	{"ID" : "445", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1890", "Parent" : "424"},
	{"ID" : "446", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1891", "Parent" : "424"},
	{"ID" : "447", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1892", "Parent" : "424"},
	{"ID" : "448", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1893", "Parent" : "424"},
	{"ID" : "449", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1894", "Parent" : "424"},
	{"ID" : "450", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1895", "Parent" : "424"},
	{"ID" : "451", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1896", "Parent" : "424"},
	{"ID" : "452", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1897", "Parent" : "424"},
	{"ID" : "453", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1898", "Parent" : "424"},
	{"ID" : "454", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1899", "Parent" : "424"},
	{"ID" : "455", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1900", "Parent" : "424"},
	{"ID" : "456", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1901", "Parent" : "424"},
	{"ID" : "457", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1902", "Parent" : "424"},
	{"ID" : "458", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1903", "Parent" : "424"},
	{"ID" : "459", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1904", "Parent" : "424"},
	{"ID" : "460", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1905", "Parent" : "424"},
	{"ID" : "461", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1906", "Parent" : "424"},
	{"ID" : "462", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1907", "Parent" : "424"},
	{"ID" : "463", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1908", "Parent" : "424"},
	{"ID" : "464", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1909", "Parent" : "424"},
	{"ID" : "465", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1910", "Parent" : "424"},
	{"ID" : "466", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1911", "Parent" : "424"},
	{"ID" : "467", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1912", "Parent" : "424"},
	{"ID" : "468", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1913", "Parent" : "424"},
	{"ID" : "469", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1914", "Parent" : "424"},
	{"ID" : "470", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1915", "Parent" : "424"},
	{"ID" : "471", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1916", "Parent" : "424"},
	{"ID" : "472", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1917", "Parent" : "424"},
	{"ID" : "473", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1918", "Parent" : "424"},
	{"ID" : "474", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1919", "Parent" : "424"},
	{"ID" : "475", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1920", "Parent" : "424"},
	{"ID" : "476", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1921", "Parent" : "424"},
	{"ID" : "477", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1922", "Parent" : "424"},
	{"ID" : "478", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1923", "Parent" : "424"},
	{"ID" : "479", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1924", "Parent" : "424"},
	{"ID" : "480", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1925", "Parent" : "424"},
	{"ID" : "481", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1926", "Parent" : "424"},
	{"ID" : "482", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1927", "Parent" : "424"},
	{"ID" : "483", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1928", "Parent" : "424"},
	{"ID" : "484", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1929", "Parent" : "424"},
	{"ID" : "485", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1930", "Parent" : "424"},
	{"ID" : "486", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1931", "Parent" : "424"},
	{"ID" : "487", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1932", "Parent" : "424"},
	{"ID" : "488", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1933", "Parent" : "424"},
	{"ID" : "489", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1934", "Parent" : "424"},
	{"ID" : "490", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1935", "Parent" : "424"},
	{"ID" : "491", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1936", "Parent" : "424"},
	{"ID" : "492", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1937", "Parent" : "424"},
	{"ID" : "493", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1938", "Parent" : "424"},
	{"ID" : "494", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1939", "Parent" : "424"},
	{"ID" : "495", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1940", "Parent" : "424"},
	{"ID" : "496", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1941", "Parent" : "424"},
	{"ID" : "497", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1942", "Parent" : "424"},
	{"ID" : "498", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1943", "Parent" : "424"},
	{"ID" : "499", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1944", "Parent" : "424"},
	{"ID" : "500", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1945", "Parent" : "424"},
	{"ID" : "501", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1946", "Parent" : "424"},
	{"ID" : "502", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1947", "Parent" : "424"},
	{"ID" : "503", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1948", "Parent" : "424"},
	{"ID" : "504", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1949", "Parent" : "424"},
	{"ID" : "505", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1950", "Parent" : "424"},
	{"ID" : "506", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1951", "Parent" : "424"},
	{"ID" : "507", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1952", "Parent" : "424"},
	{"ID" : "508", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1953", "Parent" : "424"},
	{"ID" : "509", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1954", "Parent" : "424"},
	{"ID" : "510", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1955", "Parent" : "424"},
	{"ID" : "511", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1956", "Parent" : "424"},
	{"ID" : "512", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1957", "Parent" : "424"},
	{"ID" : "513", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1958", "Parent" : "424"},
	{"ID" : "514", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1959", "Parent" : "424"},
	{"ID" : "515", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1960", "Parent" : "424"},
	{"ID" : "516", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1961", "Parent" : "424"},
	{"ID" : "517", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1962", "Parent" : "424"},
	{"ID" : "518", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1963", "Parent" : "424"},
	{"ID" : "519", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1964", "Parent" : "424"},
	{"ID" : "520", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1965", "Parent" : "424"},
	{"ID" : "521", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1966", "Parent" : "424"},
	{"ID" : "522", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1967", "Parent" : "424"},
	{"ID" : "523", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1968", "Parent" : "424"},
	{"ID" : "524", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1969", "Parent" : "424"},
	{"ID" : "525", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1970", "Parent" : "424"},
	{"ID" : "526", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1971", "Parent" : "424"},
	{"ID" : "527", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1972", "Parent" : "424"},
	{"ID" : "528", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1973", "Parent" : "424"},
	{"ID" : "529", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1974", "Parent" : "424"},
	{"ID" : "530", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1975", "Parent" : "424"},
	{"ID" : "531", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1976", "Parent" : "424"},
	{"ID" : "532", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1977", "Parent" : "424"},
	{"ID" : "533", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1978", "Parent" : "424"},
	{"ID" : "534", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1979", "Parent" : "424"},
	{"ID" : "535", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1980", "Parent" : "424"},
	{"ID" : "536", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1981", "Parent" : "424"},
	{"ID" : "537", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1982", "Parent" : "424"},
	{"ID" : "538", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1983", "Parent" : "424"},
	{"ID" : "539", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1984", "Parent" : "424"},
	{"ID" : "540", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1985", "Parent" : "424"},
	{"ID" : "541", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1986", "Parent" : "424"},
	{"ID" : "542", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1987", "Parent" : "424"},
	{"ID" : "543", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1988", "Parent" : "424"},
	{"ID" : "544", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1989", "Parent" : "424"},
	{"ID" : "545", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1990", "Parent" : "424"},
	{"ID" : "546", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1991", "Parent" : "424"},
	{"ID" : "547", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1992", "Parent" : "424"},
	{"ID" : "548", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1993", "Parent" : "424"},
	{"ID" : "549", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1994", "Parent" : "424"},
	{"ID" : "550", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1995", "Parent" : "424"},
	{"ID" : "551", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1996", "Parent" : "424"},
	{"ID" : "552", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1997", "Parent" : "424"},
	{"ID" : "553", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "424"},
	{"ID" : "554", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.mul_6ns_14ns_20_1_1_U2003", "Parent" : "423"},
	{"ID" : "555", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0", "Parent" : "409", "Child" : ["556", "575"],
		"CDFG" : "int4_dequantize_final_blocks_17",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32795", "EstimateLatencyMax" : "693531",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["423"], "DependentChan" : "598", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "556", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["415"], "DependentChan" : "595", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "556", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["576"], "DependentChan" : "601", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "556", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["423"], "DependentChan" : "600", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["423"], "DependentChan" : "599", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["410"], "DependentChan" : "587", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["576"], "DependentChan" : "602", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "556", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "556", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "555", "Child" : ["557", "558", "559", "560", "561", "562", "563", "564", "565", "566", "567", "568", "569", "570", "571", "572", "573", "574"],
		"CDFG" : "int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32793", "EstimateLatencyMax" : "693529",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "block_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "557", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "556"},
	{"ID" : "558", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_7_U", "Parent" : "556"},
	{"ID" : "559", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_8_U", "Parent" : "556"},
	{"ID" : "560", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_9_U", "Parent" : "556"},
	{"ID" : "561", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2011", "Parent" : "556"},
	{"ID" : "562", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2012", "Parent" : "556"},
	{"ID" : "563", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2013", "Parent" : "556"},
	{"ID" : "564", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2014", "Parent" : "556"},
	{"ID" : "565", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2015", "Parent" : "556"},
	{"ID" : "566", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2016", "Parent" : "556"},
	{"ID" : "567", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2017", "Parent" : "556"},
	{"ID" : "568", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2018", "Parent" : "556"},
	{"ID" : "569", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2019", "Parent" : "556"},
	{"ID" : "570", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2020", "Parent" : "556"},
	{"ID" : "571", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2021", "Parent" : "556"},
	{"ID" : "572", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2022", "Parent" : "556"},
	{"ID" : "573", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2023", "Parent" : "556"},
	{"ID" : "574", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "556"},
	{"ID" : "575", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.mul_6ns_14ns_20_1_1_U2032", "Parent" : "555"},
	{"ID" : "576", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0", "Parent" : "409", "Child" : ["577"],
		"CDFG" : "int4_pack_dequantized_outputs_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "8071",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["555"], "DependentChan" : "601", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "577", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["579"], "DependentChan" : "603", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "577", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["555"], "DependentChan" : "602", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["411"], "DependentChan" : "589", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["579"], "DependentChan" : "604", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "577", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "576", "Child" : ["578"],
		"CDFG" : "int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1029", "EstimateLatencyMax" : "8069",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "pack_dequantized_value_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "578", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "577"},
	{"ID" : "579", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0", "Parent" : "409", "Child" : ["580", "582"],
		"CDFG" : "int4_write_outputs_8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "1857",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["576"], "DependentChan" : "603", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "580", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "580", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["576"], "DependentChan" : "604", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["411"], "DependentChan" : "590", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "580", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Parent" : "579", "Child" : ["581"],
		"CDFG" : "int4_write_outputs_8_Pipeline_write_output_direct_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "507",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "write_output_direct_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "581", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "580"},
	{"ID" : "582", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "579", "Child" : ["583", "584", "585", "586"],
		"CDFG" : "int4_write_outputs_8_Pipeline_fused_residual_add_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "fused_residual_add_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "583", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2053", "Parent" : "582"},
	{"ID" : "584", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2054", "Parent" : "582"},
	{"ID" : "585", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2055", "Parent" : "582"},
	{"ID" : "586", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "582"},
	{"ID" : "587", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.idx1_c_U", "Parent" : "409"},
	{"ID" : "588", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.mul_ln867_loc_channel_U", "Parent" : "409"},
	{"ID" : "589", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_fxp_loc_channel_U", "Parent" : "409"},
	{"ID" : "590", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.fuse_residual_loc_channel_U", "Parent" : "409"},
	{"ID" : "591", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c17_channel_U", "Parent" : "409"},
	{"ID" : "592", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c21_channel_U", "Parent" : "409"},
	{"ID" : "593", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.weight_stream_U", "Parent" : "409"},
	{"ID" : "594", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_activation_stream_U", "Parent" : "409"},
	{"ID" : "595", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_scale_stream_U", "Parent" : "409"},
	{"ID" : "596", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c16_U", "Parent" : "409"},
	{"ID" : "597", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c20_U", "Parent" : "409"},
	{"ID" : "598", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.group_stream_U", "Parent" : "409"},
	{"ID" : "599", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c_U", "Parent" : "409"},
	{"ID" : "600", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c19_U", "Parent" : "409"},
	{"ID" : "601", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.final_block_stream_U", "Parent" : "409"},
	{"ID" : "602", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c18_U", "Parent" : "409"},
	{"ID" : "603", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_stream_U", "Parent" : "409"},
	{"ID" : "604", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c_U", "Parent" : "409"},
	{"ID" : "605", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0", "Parent" : "208", "Child" : ["606", "607", "609", "611", "619", "751", "772", "775", "783", "784", "785", "786", "787", "788", "789", "790", "791", "792", "793", "794", "795", "796", "797", "798", "799", "800"],
		"CDFG" : "int4_run_pe_dataflow_2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32878", "EstimateLatencyMax" : "693614",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "606", "Name" : "entry_proc54_U0"},
			{"ID" : "607", "Name" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0"},
			{"ID" : "609", "Name" : "int4_stream_pe_inputs_18_U0"},
			{"ID" : "751", "Name" : "int4_dequantize_final_blocks_19_U0"},
			{"ID" : "775", "Name" : "int4_write_outputs_7_U0"}],
		"OutputProcess" : [
			{"ID" : "775", "Name" : "int4_write_outputs_7_U0"}],
		"Port" : [
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "609", "SubInstance" : "int4_stream_pe_inputs_18_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "611", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "quantized_pe2"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1007", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "611", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "activation_scale_pe2"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "607", "SubInstance" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Port" : "linear_command_pe2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "775", "SubInstance" : "int4_write_outputs_7_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "751", "SubInstance" : "int4_dequantize_final_blocks_19_U0", "Port" : "model_scale_cache2"}]}]},
	{"ID" : "606", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.entry_proc54_U0", "Parent" : "605",
		"CDFG" : "entry_proc54",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["751"], "DependentChan" : "783", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "607", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Parent" : "605", "Child" : ["608"],
		"CDFG" : "int4_run_pe_dataflow_2_Block_entry2_proc22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "608", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0.mul_6ns_6ns_12_1_1_U2137", "Parent" : "607"},
	{"ID" : "609", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0", "Parent" : "605", "Child" : ["610"],
		"CDFG" : "int4_stream_pe_inputs_18",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32842", "EstimateLatencyMax" : "258122",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["619"], "DependentChan" : "789", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["607"], "DependentChan" : "784", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "610", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0.flow_control_loop_pipe_U", "Parent" : "609"},
	{"ID" : "611", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0", "Parent" : "605", "Child" : ["612", "613", "614", "616", "618"],
		"CDFG" : "int4_cache_and_replay_activation_2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1161", "EstimateLatencyMax" : "22025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "614", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1007", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "614", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["619"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "616", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["751"], "DependentChan" : "791", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "616", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["607"], "DependentChan" : "788", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["607"], "DependentChan" : "787", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["619"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["619"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "612", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.activation_cache_U", "Parent" : "611"},
	{"ID" : "613", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.scale_cache_U", "Parent" : "611"},
	{"ID" : "614", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "611", "Child" : ["615"],
		"CDFG" : "int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "615", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "614"},
	{"ID" : "616", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Parent" : "611", "Child" : ["617"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "617", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "616"},
	{"ID" : "618", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.mul_6ns_9ns_15_1_1_U2155", "Parent" : "611"},
	{"ID" : "619", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0", "Parent" : "605", "Child" : ["620", "750"],
		"CDFG" : "int4_stream_integer_blocks_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32789", "EstimateLatencyMax" : "693525",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["609"], "DependentChan" : "789", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "620", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["611"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "620", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["751"], "DependentChan" : "794", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "620", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["611"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["611"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["751"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["751"], "DependentChan" : "796", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "620", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "619", "Child" : ["621", "622", "623", "624", "625", "626", "627", "628", "629", "630", "631", "632", "633", "634", "635", "636", "637", "638", "639", "640", "641", "642", "643", "644", "645", "646", "647", "648", "649", "650", "651", "652", "653", "654", "655", "656", "657", "658", "659", "660", "661", "662", "663", "664", "665", "666", "667", "668", "669", "670", "671", "672", "673", "674", "675", "676", "677", "678", "679", "680", "681", "682", "683", "684", "685", "686", "687", "688", "689", "690", "691", "692", "693", "694", "695", "696", "697", "698", "699", "700", "701", "702", "703", "704", "705", "706", "707", "708", "709", "710", "711", "712", "713", "714", "715", "716", "717", "718", "719", "720", "721", "722", "723", "724", "725", "726", "727", "728", "729", "730", "731", "732", "733", "734", "735", "736", "737", "738", "739", "740", "741", "742", "743", "744", "745", "746", "747", "748", "749"],
		"CDFG" : "int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32786", "EstimateLatencyMax" : "693522",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound19", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bound6", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter18", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter18", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "621", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2164", "Parent" : "620"},
	{"ID" : "622", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2165", "Parent" : "620"},
	{"ID" : "623", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2166", "Parent" : "620"},
	{"ID" : "624", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2167", "Parent" : "620"},
	{"ID" : "625", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2168", "Parent" : "620"},
	{"ID" : "626", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2169", "Parent" : "620"},
	{"ID" : "627", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2170", "Parent" : "620"},
	{"ID" : "628", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2171", "Parent" : "620"},
	{"ID" : "629", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2172", "Parent" : "620"},
	{"ID" : "630", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2173", "Parent" : "620"},
	{"ID" : "631", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2174", "Parent" : "620"},
	{"ID" : "632", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2175", "Parent" : "620"},
	{"ID" : "633", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2176", "Parent" : "620"},
	{"ID" : "634", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2177", "Parent" : "620"},
	{"ID" : "635", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2178", "Parent" : "620"},
	{"ID" : "636", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2179", "Parent" : "620"},
	{"ID" : "637", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2180", "Parent" : "620"},
	{"ID" : "638", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2181", "Parent" : "620"},
	{"ID" : "639", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2182", "Parent" : "620"},
	{"ID" : "640", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2183", "Parent" : "620"},
	{"ID" : "641", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2184", "Parent" : "620"},
	{"ID" : "642", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2185", "Parent" : "620"},
	{"ID" : "643", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2186", "Parent" : "620"},
	{"ID" : "644", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2187", "Parent" : "620"},
	{"ID" : "645", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2188", "Parent" : "620"},
	{"ID" : "646", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2189", "Parent" : "620"},
	{"ID" : "647", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2190", "Parent" : "620"},
	{"ID" : "648", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2191", "Parent" : "620"},
	{"ID" : "649", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2192", "Parent" : "620"},
	{"ID" : "650", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2193", "Parent" : "620"},
	{"ID" : "651", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2194", "Parent" : "620"},
	{"ID" : "652", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2195", "Parent" : "620"},
	{"ID" : "653", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2196", "Parent" : "620"},
	{"ID" : "654", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2197", "Parent" : "620"},
	{"ID" : "655", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2198", "Parent" : "620"},
	{"ID" : "656", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2199", "Parent" : "620"},
	{"ID" : "657", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2200", "Parent" : "620"},
	{"ID" : "658", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2201", "Parent" : "620"},
	{"ID" : "659", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2202", "Parent" : "620"},
	{"ID" : "660", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2203", "Parent" : "620"},
	{"ID" : "661", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2204", "Parent" : "620"},
	{"ID" : "662", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2205", "Parent" : "620"},
	{"ID" : "663", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2206", "Parent" : "620"},
	{"ID" : "664", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2207", "Parent" : "620"},
	{"ID" : "665", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2208", "Parent" : "620"},
	{"ID" : "666", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2209", "Parent" : "620"},
	{"ID" : "667", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2210", "Parent" : "620"},
	{"ID" : "668", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2211", "Parent" : "620"},
	{"ID" : "669", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2212", "Parent" : "620"},
	{"ID" : "670", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2213", "Parent" : "620"},
	{"ID" : "671", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2214", "Parent" : "620"},
	{"ID" : "672", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2215", "Parent" : "620"},
	{"ID" : "673", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2216", "Parent" : "620"},
	{"ID" : "674", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2217", "Parent" : "620"},
	{"ID" : "675", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2218", "Parent" : "620"},
	{"ID" : "676", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2219", "Parent" : "620"},
	{"ID" : "677", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2220", "Parent" : "620"},
	{"ID" : "678", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2221", "Parent" : "620"},
	{"ID" : "679", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2222", "Parent" : "620"},
	{"ID" : "680", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2223", "Parent" : "620"},
	{"ID" : "681", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2224", "Parent" : "620"},
	{"ID" : "682", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2225", "Parent" : "620"},
	{"ID" : "683", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2226", "Parent" : "620"},
	{"ID" : "684", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2227", "Parent" : "620"},
	{"ID" : "685", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2228", "Parent" : "620"},
	{"ID" : "686", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2229", "Parent" : "620"},
	{"ID" : "687", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2230", "Parent" : "620"},
	{"ID" : "688", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2231", "Parent" : "620"},
	{"ID" : "689", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2232", "Parent" : "620"},
	{"ID" : "690", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2233", "Parent" : "620"},
	{"ID" : "691", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2234", "Parent" : "620"},
	{"ID" : "692", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2235", "Parent" : "620"},
	{"ID" : "693", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2236", "Parent" : "620"},
	{"ID" : "694", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2237", "Parent" : "620"},
	{"ID" : "695", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2238", "Parent" : "620"},
	{"ID" : "696", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2239", "Parent" : "620"},
	{"ID" : "697", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2240", "Parent" : "620"},
	{"ID" : "698", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2241", "Parent" : "620"},
	{"ID" : "699", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2242", "Parent" : "620"},
	{"ID" : "700", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2243", "Parent" : "620"},
	{"ID" : "701", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2244", "Parent" : "620"},
	{"ID" : "702", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2245", "Parent" : "620"},
	{"ID" : "703", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2246", "Parent" : "620"},
	{"ID" : "704", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2247", "Parent" : "620"},
	{"ID" : "705", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2248", "Parent" : "620"},
	{"ID" : "706", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2249", "Parent" : "620"},
	{"ID" : "707", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2250", "Parent" : "620"},
	{"ID" : "708", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2251", "Parent" : "620"},
	{"ID" : "709", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2252", "Parent" : "620"},
	{"ID" : "710", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2253", "Parent" : "620"},
	{"ID" : "711", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2254", "Parent" : "620"},
	{"ID" : "712", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2255", "Parent" : "620"},
	{"ID" : "713", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2256", "Parent" : "620"},
	{"ID" : "714", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2257", "Parent" : "620"},
	{"ID" : "715", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2258", "Parent" : "620"},
	{"ID" : "716", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2259", "Parent" : "620"},
	{"ID" : "717", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2260", "Parent" : "620"},
	{"ID" : "718", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2261", "Parent" : "620"},
	{"ID" : "719", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2262", "Parent" : "620"},
	{"ID" : "720", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2263", "Parent" : "620"},
	{"ID" : "721", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2264", "Parent" : "620"},
	{"ID" : "722", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2265", "Parent" : "620"},
	{"ID" : "723", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2266", "Parent" : "620"},
	{"ID" : "724", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2267", "Parent" : "620"},
	{"ID" : "725", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2268", "Parent" : "620"},
	{"ID" : "726", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2269", "Parent" : "620"},
	{"ID" : "727", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2270", "Parent" : "620"},
	{"ID" : "728", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2271", "Parent" : "620"},
	{"ID" : "729", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2272", "Parent" : "620"},
	{"ID" : "730", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2273", "Parent" : "620"},
	{"ID" : "731", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2274", "Parent" : "620"},
	{"ID" : "732", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2275", "Parent" : "620"},
	{"ID" : "733", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2276", "Parent" : "620"},
	{"ID" : "734", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2277", "Parent" : "620"},
	{"ID" : "735", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2278", "Parent" : "620"},
	{"ID" : "736", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2279", "Parent" : "620"},
	{"ID" : "737", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2280", "Parent" : "620"},
	{"ID" : "738", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2281", "Parent" : "620"},
	{"ID" : "739", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2282", "Parent" : "620"},
	{"ID" : "740", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2283", "Parent" : "620"},
	{"ID" : "741", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2284", "Parent" : "620"},
	{"ID" : "742", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2285", "Parent" : "620"},
	{"ID" : "743", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2286", "Parent" : "620"},
	{"ID" : "744", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2287", "Parent" : "620"},
	{"ID" : "745", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2288", "Parent" : "620"},
	{"ID" : "746", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2289", "Parent" : "620"},
	{"ID" : "747", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2290", "Parent" : "620"},
	{"ID" : "748", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2291", "Parent" : "620"},
	{"ID" : "749", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "620"},
	{"ID" : "750", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.mul_6ns_14ns_20_1_1_U2297", "Parent" : "619"},
	{"ID" : "751", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0", "Parent" : "605", "Child" : ["752", "771"],
		"CDFG" : "int4_dequantize_final_blocks_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32795", "EstimateLatencyMax" : "693531",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["619"], "DependentChan" : "794", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "752", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["611"], "DependentChan" : "791", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "752", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["772"], "DependentChan" : "797", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "752", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["619"], "DependentChan" : "796", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["619"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["606"], "DependentChan" : "783", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["772"], "DependentChan" : "798", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "752", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "752", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "751", "Child" : ["753", "754", "755", "756", "757", "758", "759", "760", "761", "762", "763", "764", "765", "766", "767", "768", "769", "770"],
		"CDFG" : "int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32793", "EstimateLatencyMax" : "693529",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "block_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "753", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "752"},
	{"ID" : "754", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_4_U", "Parent" : "752"},
	{"ID" : "755", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_5_U", "Parent" : "752"},
	{"ID" : "756", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_6_U", "Parent" : "752"},
	{"ID" : "757", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2305", "Parent" : "752"},
	{"ID" : "758", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2306", "Parent" : "752"},
	{"ID" : "759", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2307", "Parent" : "752"},
	{"ID" : "760", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2308", "Parent" : "752"},
	{"ID" : "761", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2309", "Parent" : "752"},
	{"ID" : "762", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2310", "Parent" : "752"},
	{"ID" : "763", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2311", "Parent" : "752"},
	{"ID" : "764", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2312", "Parent" : "752"},
	{"ID" : "765", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2313", "Parent" : "752"},
	{"ID" : "766", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2314", "Parent" : "752"},
	{"ID" : "767", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2315", "Parent" : "752"},
	{"ID" : "768", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2316", "Parent" : "752"},
	{"ID" : "769", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2317", "Parent" : "752"},
	{"ID" : "770", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "752"},
	{"ID" : "771", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.mul_6ns_14ns_20_1_1_U2326", "Parent" : "751"},
	{"ID" : "772", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0", "Parent" : "605", "Child" : ["773"],
		"CDFG" : "int4_pack_dequantized_outputs_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "8071",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["751"], "DependentChan" : "797", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "773", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["775"], "DependentChan" : "799", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "773", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["751"], "DependentChan" : "798", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["607"], "DependentChan" : "785", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["775"], "DependentChan" : "800", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "773", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "772", "Child" : ["774"],
		"CDFG" : "int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1029", "EstimateLatencyMax" : "8069",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "pack_dequantized_value_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "774", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "773"},
	{"ID" : "775", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0", "Parent" : "605", "Child" : ["776", "778"],
		"CDFG" : "int4_write_outputs_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "1857",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["772"], "DependentChan" : "799", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "776", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "776", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["772"], "DependentChan" : "800", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["607"], "DependentChan" : "786", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "776", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Parent" : "775", "Child" : ["777"],
		"CDFG" : "int4_write_outputs_7_Pipeline_write_output_direct_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "507",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "write_output_direct_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "777", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "776"},
	{"ID" : "778", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "775", "Child" : ["779", "780", "781", "782"],
		"CDFG" : "int4_write_outputs_7_Pipeline_fused_residual_add_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "fused_residual_add_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "779", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2347", "Parent" : "778"},
	{"ID" : "780", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2348", "Parent" : "778"},
	{"ID" : "781", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2349", "Parent" : "778"},
	{"ID" : "782", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "778"},
	{"ID" : "783", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.idx1_c_U", "Parent" : "605"},
	{"ID" : "784", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.mul_ln867_loc_channel_U", "Parent" : "605"},
	{"ID" : "785", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_fxp_loc_channel_U", "Parent" : "605"},
	{"ID" : "786", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.fuse_residual_loc_channel_U", "Parent" : "605"},
	{"ID" : "787", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c17_channel_U", "Parent" : "605"},
	{"ID" : "788", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c21_channel_U", "Parent" : "605"},
	{"ID" : "789", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.weight_stream_U", "Parent" : "605"},
	{"ID" : "790", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_activation_stream_U", "Parent" : "605"},
	{"ID" : "791", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_scale_stream_U", "Parent" : "605"},
	{"ID" : "792", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c16_U", "Parent" : "605"},
	{"ID" : "793", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c20_U", "Parent" : "605"},
	{"ID" : "794", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.group_stream_U", "Parent" : "605"},
	{"ID" : "795", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c_U", "Parent" : "605"},
	{"ID" : "796", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c19_U", "Parent" : "605"},
	{"ID" : "797", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.final_block_stream_U", "Parent" : "605"},
	{"ID" : "798", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c18_U", "Parent" : "605"},
	{"ID" : "799", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_stream_U", "Parent" : "605"},
	{"ID" : "800", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c_U", "Parent" : "605"},
	{"ID" : "801", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0", "Parent" : "208", "Child" : ["802", "803", "805", "807", "815", "947", "968", "971", "979", "980", "981", "982", "983", "984", "985", "986", "987", "988", "989", "990", "991", "992", "993", "994", "995", "996"],
		"CDFG" : "int4_run_pe_dataflow_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32878", "EstimateLatencyMax" : "693614",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "802", "Name" : "entry_proc_U0"},
			{"ID" : "803", "Name" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0"},
			{"ID" : "805", "Name" : "int4_stream_pe_inputs_20_U0"},
			{"ID" : "947", "Name" : "int4_dequantize_final_blocks_21_U0"},
			{"ID" : "971", "Name" : "int4_write_outputs_U0"}],
		"OutputProcess" : [
			{"ID" : "971", "Name" : "int4_write_outputs_U0"}],
		"Port" : [
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "805", "SubInstance" : "int4_stream_pe_inputs_20_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "807", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "quantized_pe3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1008", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "807", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "activation_scale_pe3"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "803", "SubInstance" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Port" : "linear_command_pe3"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "971", "SubInstance" : "int4_write_outputs_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "947", "SubInstance" : "int4_dequantize_final_blocks_21_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "802", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.entry_proc_U0", "Parent" : "801",
		"CDFG" : "entry_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["947"], "DependentChan" : "979", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "803", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Parent" : "801", "Child" : ["804"],
		"CDFG" : "int4_run_pe_dataflow_3_Block_entry2_proc23",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["209"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "804", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0.mul_6ns_6ns_12_1_1_U2431", "Parent" : "803"},
	{"ID" : "805", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0", "Parent" : "801", "Child" : ["806"],
		"CDFG" : "int4_stream_pe_inputs_20",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32842", "EstimateLatencyMax" : "258122",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["815"], "DependentChan" : "985", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["803"], "DependentChan" : "980", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "806", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0.flow_control_loop_pipe_U", "Parent" : "805"},
	{"ID" : "807", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0", "Parent" : "801", "Child" : ["808", "809", "810", "812", "814"],
		"CDFG" : "int4_cache_and_replay_activation_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1161", "EstimateLatencyMax" : "22025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "810", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["210"], "DependentChan" : "1008", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "810", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["815"], "DependentChan" : "986", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "812", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["947"], "DependentChan" : "987", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "812", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["803"], "DependentChan" : "984", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["803"], "DependentChan" : "983", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["815"], "DependentChan" : "988", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["815"], "DependentChan" : "989", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "808", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.activation_cache_U", "Parent" : "807"},
	{"ID" : "809", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.scale_cache_U", "Parent" : "807"},
	{"ID" : "810", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "807", "Child" : ["811"],
		"CDFG" : "int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "811", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "810"},
	{"ID" : "812", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Parent" : "807", "Child" : ["813"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "813", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "812"},
	{"ID" : "814", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.mul_6ns_9ns_15_1_1_U2449", "Parent" : "807"},
	{"ID" : "815", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0", "Parent" : "801", "Child" : ["816", "946"],
		"CDFG" : "int4_stream_integer_blocks_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32789", "EstimateLatencyMax" : "693525",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["805"], "DependentChan" : "985", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "816", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["807"], "DependentChan" : "986", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "816", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["947"], "DependentChan" : "990", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "816", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["807"], "DependentChan" : "989", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["807"], "DependentChan" : "988", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["947"], "DependentChan" : "991", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["947"], "DependentChan" : "992", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "816", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "815", "Child" : ["817", "818", "819", "820", "821", "822", "823", "824", "825", "826", "827", "828", "829", "830", "831", "832", "833", "834", "835", "836", "837", "838", "839", "840", "841", "842", "843", "844", "845", "846", "847", "848", "849", "850", "851", "852", "853", "854", "855", "856", "857", "858", "859", "860", "861", "862", "863", "864", "865", "866", "867", "868", "869", "870", "871", "872", "873", "874", "875", "876", "877", "878", "879", "880", "881", "882", "883", "884", "885", "886", "887", "888", "889", "890", "891", "892", "893", "894", "895", "896", "897", "898", "899", "900", "901", "902", "903", "904", "905", "906", "907", "908", "909", "910", "911", "912", "913", "914", "915", "916", "917", "918", "919", "920", "921", "922", "923", "924", "925", "926", "927", "928", "929", "930", "931", "932", "933", "934", "935", "936", "937", "938", "939", "940", "941", "942", "943", "944", "945"],
		"CDFG" : "int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32786", "EstimateLatencyMax" : "693522",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound19", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "bound6", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "integer_local_tile_loop_integer_col_tile_loop_integer_group_loop_integer_row_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter18", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter18", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "817", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2458", "Parent" : "816"},
	{"ID" : "818", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2459", "Parent" : "816"},
	{"ID" : "819", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2460", "Parent" : "816"},
	{"ID" : "820", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2461", "Parent" : "816"},
	{"ID" : "821", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2462", "Parent" : "816"},
	{"ID" : "822", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2463", "Parent" : "816"},
	{"ID" : "823", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2464", "Parent" : "816"},
	{"ID" : "824", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2465", "Parent" : "816"},
	{"ID" : "825", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2466", "Parent" : "816"},
	{"ID" : "826", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2467", "Parent" : "816"},
	{"ID" : "827", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2468", "Parent" : "816"},
	{"ID" : "828", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2469", "Parent" : "816"},
	{"ID" : "829", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2470", "Parent" : "816"},
	{"ID" : "830", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2471", "Parent" : "816"},
	{"ID" : "831", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2472", "Parent" : "816"},
	{"ID" : "832", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2473", "Parent" : "816"},
	{"ID" : "833", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2474", "Parent" : "816"},
	{"ID" : "834", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2475", "Parent" : "816"},
	{"ID" : "835", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2476", "Parent" : "816"},
	{"ID" : "836", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2477", "Parent" : "816"},
	{"ID" : "837", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2478", "Parent" : "816"},
	{"ID" : "838", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2479", "Parent" : "816"},
	{"ID" : "839", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2480", "Parent" : "816"},
	{"ID" : "840", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2481", "Parent" : "816"},
	{"ID" : "841", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2482", "Parent" : "816"},
	{"ID" : "842", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2483", "Parent" : "816"},
	{"ID" : "843", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2484", "Parent" : "816"},
	{"ID" : "844", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2485", "Parent" : "816"},
	{"ID" : "845", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2486", "Parent" : "816"},
	{"ID" : "846", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2487", "Parent" : "816"},
	{"ID" : "847", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2488", "Parent" : "816"},
	{"ID" : "848", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2489", "Parent" : "816"},
	{"ID" : "849", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2490", "Parent" : "816"},
	{"ID" : "850", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2491", "Parent" : "816"},
	{"ID" : "851", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2492", "Parent" : "816"},
	{"ID" : "852", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2493", "Parent" : "816"},
	{"ID" : "853", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2494", "Parent" : "816"},
	{"ID" : "854", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2495", "Parent" : "816"},
	{"ID" : "855", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2496", "Parent" : "816"},
	{"ID" : "856", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2497", "Parent" : "816"},
	{"ID" : "857", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2498", "Parent" : "816"},
	{"ID" : "858", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2499", "Parent" : "816"},
	{"ID" : "859", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2500", "Parent" : "816"},
	{"ID" : "860", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2501", "Parent" : "816"},
	{"ID" : "861", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2502", "Parent" : "816"},
	{"ID" : "862", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2503", "Parent" : "816"},
	{"ID" : "863", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2504", "Parent" : "816"},
	{"ID" : "864", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2505", "Parent" : "816"},
	{"ID" : "865", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2506", "Parent" : "816"},
	{"ID" : "866", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2507", "Parent" : "816"},
	{"ID" : "867", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2508", "Parent" : "816"},
	{"ID" : "868", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2509", "Parent" : "816"},
	{"ID" : "869", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2510", "Parent" : "816"},
	{"ID" : "870", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2511", "Parent" : "816"},
	{"ID" : "871", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2512", "Parent" : "816"},
	{"ID" : "872", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2513", "Parent" : "816"},
	{"ID" : "873", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2514", "Parent" : "816"},
	{"ID" : "874", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2515", "Parent" : "816"},
	{"ID" : "875", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2516", "Parent" : "816"},
	{"ID" : "876", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2517", "Parent" : "816"},
	{"ID" : "877", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2518", "Parent" : "816"},
	{"ID" : "878", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2519", "Parent" : "816"},
	{"ID" : "879", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2520", "Parent" : "816"},
	{"ID" : "880", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2521", "Parent" : "816"},
	{"ID" : "881", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2522", "Parent" : "816"},
	{"ID" : "882", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2523", "Parent" : "816"},
	{"ID" : "883", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2524", "Parent" : "816"},
	{"ID" : "884", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2525", "Parent" : "816"},
	{"ID" : "885", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2526", "Parent" : "816"},
	{"ID" : "886", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2527", "Parent" : "816"},
	{"ID" : "887", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2528", "Parent" : "816"},
	{"ID" : "888", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2529", "Parent" : "816"},
	{"ID" : "889", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2530", "Parent" : "816"},
	{"ID" : "890", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2531", "Parent" : "816"},
	{"ID" : "891", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2532", "Parent" : "816"},
	{"ID" : "892", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2533", "Parent" : "816"},
	{"ID" : "893", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2534", "Parent" : "816"},
	{"ID" : "894", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2535", "Parent" : "816"},
	{"ID" : "895", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2536", "Parent" : "816"},
	{"ID" : "896", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2537", "Parent" : "816"},
	{"ID" : "897", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2538", "Parent" : "816"},
	{"ID" : "898", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2539", "Parent" : "816"},
	{"ID" : "899", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2540", "Parent" : "816"},
	{"ID" : "900", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2541", "Parent" : "816"},
	{"ID" : "901", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2542", "Parent" : "816"},
	{"ID" : "902", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2543", "Parent" : "816"},
	{"ID" : "903", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2544", "Parent" : "816"},
	{"ID" : "904", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2545", "Parent" : "816"},
	{"ID" : "905", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2546", "Parent" : "816"},
	{"ID" : "906", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2547", "Parent" : "816"},
	{"ID" : "907", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2548", "Parent" : "816"},
	{"ID" : "908", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2549", "Parent" : "816"},
	{"ID" : "909", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2550", "Parent" : "816"},
	{"ID" : "910", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2551", "Parent" : "816"},
	{"ID" : "911", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2552", "Parent" : "816"},
	{"ID" : "912", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2553", "Parent" : "816"},
	{"ID" : "913", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2554", "Parent" : "816"},
	{"ID" : "914", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2555", "Parent" : "816"},
	{"ID" : "915", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2556", "Parent" : "816"},
	{"ID" : "916", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2557", "Parent" : "816"},
	{"ID" : "917", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2558", "Parent" : "816"},
	{"ID" : "918", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2559", "Parent" : "816"},
	{"ID" : "919", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2560", "Parent" : "816"},
	{"ID" : "920", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2561", "Parent" : "816"},
	{"ID" : "921", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2562", "Parent" : "816"},
	{"ID" : "922", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2563", "Parent" : "816"},
	{"ID" : "923", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2564", "Parent" : "816"},
	{"ID" : "924", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2565", "Parent" : "816"},
	{"ID" : "925", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2566", "Parent" : "816"},
	{"ID" : "926", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2567", "Parent" : "816"},
	{"ID" : "927", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2568", "Parent" : "816"},
	{"ID" : "928", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2569", "Parent" : "816"},
	{"ID" : "929", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2570", "Parent" : "816"},
	{"ID" : "930", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2571", "Parent" : "816"},
	{"ID" : "931", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2572", "Parent" : "816"},
	{"ID" : "932", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2573", "Parent" : "816"},
	{"ID" : "933", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2574", "Parent" : "816"},
	{"ID" : "934", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2575", "Parent" : "816"},
	{"ID" : "935", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2576", "Parent" : "816"},
	{"ID" : "936", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2577", "Parent" : "816"},
	{"ID" : "937", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2578", "Parent" : "816"},
	{"ID" : "938", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2579", "Parent" : "816"},
	{"ID" : "939", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2580", "Parent" : "816"},
	{"ID" : "940", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2581", "Parent" : "816"},
	{"ID" : "941", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2582", "Parent" : "816"},
	{"ID" : "942", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2583", "Parent" : "816"},
	{"ID" : "943", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2584", "Parent" : "816"},
	{"ID" : "944", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2585", "Parent" : "816"},
	{"ID" : "945", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "816"},
	{"ID" : "946", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.mul_6ns_14ns_20_1_1_U2591", "Parent" : "815"},
	{"ID" : "947", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0", "Parent" : "801", "Child" : ["948", "967"],
		"CDFG" : "int4_dequantize_final_blocks_21",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32795", "EstimateLatencyMax" : "693531",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["815"], "DependentChan" : "990", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "948", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["807"], "DependentChan" : "987", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "948", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["968"], "DependentChan" : "993", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "948", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["815"], "DependentChan" : "992", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["815"], "DependentChan" : "991", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["802"], "DependentChan" : "979", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["968"], "DependentChan" : "994", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "948", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "948", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "947", "Child" : ["949", "950", "951", "952", "953", "954", "955", "956", "957", "958", "959", "960", "961", "962", "963", "964", "965", "966"],
		"CDFG" : "int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32793", "EstimateLatencyMax" : "693529",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "block_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "949", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "948"},
	{"ID" : "950", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_1_U", "Parent" : "948"},
	{"ID" : "951", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_2_U", "Parent" : "948"},
	{"ID" : "952", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_3_U", "Parent" : "948"},
	{"ID" : "953", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2599", "Parent" : "948"},
	{"ID" : "954", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2600", "Parent" : "948"},
	{"ID" : "955", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2601", "Parent" : "948"},
	{"ID" : "956", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2602", "Parent" : "948"},
	{"ID" : "957", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2603", "Parent" : "948"},
	{"ID" : "958", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2604", "Parent" : "948"},
	{"ID" : "959", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2605", "Parent" : "948"},
	{"ID" : "960", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2606", "Parent" : "948"},
	{"ID" : "961", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2607", "Parent" : "948"},
	{"ID" : "962", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2608", "Parent" : "948"},
	{"ID" : "963", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2609", "Parent" : "948"},
	{"ID" : "964", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2610", "Parent" : "948"},
	{"ID" : "965", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2611", "Parent" : "948"},
	{"ID" : "966", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "948"},
	{"ID" : "967", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.mul_6ns_14ns_20_1_1_U2620", "Parent" : "947"},
	{"ID" : "968", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0", "Parent" : "801", "Child" : ["969"],
		"CDFG" : "int4_pack_dequantized_outputs_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1031", "EstimateLatencyMax" : "8071",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["947"], "DependentChan" : "993", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "969", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["971"], "DependentChan" : "995", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "969", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["947"], "DependentChan" : "994", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["803"], "DependentChan" : "981", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["971"], "DependentChan" : "996", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "969", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "968", "Child" : ["970"],
		"CDFG" : "int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1029", "EstimateLatencyMax" : "8069",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "pack_dequantized_value_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "970", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "969"},
	{"ID" : "971", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0", "Parent" : "801", "Child" : ["972", "974"],
		"CDFG" : "int4_write_outputs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "68", "EstimateLatencyMax" : "1857",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["968"], "DependentChan" : "995", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "972", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "972", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["968"], "DependentChan" : "996", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["803"], "DependentChan" : "982", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "972", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Parent" : "971", "Child" : ["973"],
		"CDFG" : "int4_write_outputs_Pipeline_write_output_direct_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "507",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "write_output_direct_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "973", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "972"},
	{"ID" : "974", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "971", "Child" : ["975", "976", "977", "978"],
		"CDFG" : "int4_write_outputs_Pipeline_fused_residual_add_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_46", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_48", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_49", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_50", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_53", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_54", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_56", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_57", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_58", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_59", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_60", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_46", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_48", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_49", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_50", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_51", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_52", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_53", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_54", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_56", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_57", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_58", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_59", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_60", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "fused_residual_add_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "975", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2641", "Parent" : "974"},
	{"ID" : "976", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2642", "Parent" : "974"},
	{"ID" : "977", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2643", "Parent" : "974"},
	{"ID" : "978", "Level" : "8", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "974"},
	{"ID" : "979", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.idx1_c_U", "Parent" : "801"},
	{"ID" : "980", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.mul_ln867_loc_channel_U", "Parent" : "801"},
	{"ID" : "981", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_fxp_loc_channel_U", "Parent" : "801"},
	{"ID" : "982", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.fuse_residual_loc_channel_U", "Parent" : "801"},
	{"ID" : "983", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c17_channel_U", "Parent" : "801"},
	{"ID" : "984", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c21_channel_U", "Parent" : "801"},
	{"ID" : "985", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.weight_stream_U", "Parent" : "801"},
	{"ID" : "986", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_activation_stream_U", "Parent" : "801"},
	{"ID" : "987", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_scale_stream_U", "Parent" : "801"},
	{"ID" : "988", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c16_U", "Parent" : "801"},
	{"ID" : "989", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c20_U", "Parent" : "801"},
	{"ID" : "990", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.group_stream_U", "Parent" : "801"},
	{"ID" : "991", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c_U", "Parent" : "801"},
	{"ID" : "992", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c19_U", "Parent" : "801"},
	{"ID" : "993", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.final_block_stream_U", "Parent" : "801"},
	{"ID" : "994", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c18_U", "Parent" : "801"},
	{"ID" : "995", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_stream_U", "Parent" : "801"},
	{"ID" : "996", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c_U", "Parent" : "801"},
	{"ID" : "997", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe0_U", "Parent" : "208"},
	{"ID" : "998", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe1_U", "Parent" : "208"},
	{"ID" : "999", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe2_U", "Parent" : "208"},
	{"ID" : "1000", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe3_U", "Parent" : "208"},
	{"ID" : "1001", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe0_U", "Parent" : "208"},
	{"ID" : "1002", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe1_U", "Parent" : "208"},
	{"ID" : "1003", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe2_U", "Parent" : "208"},
	{"ID" : "1004", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe3_U", "Parent" : "208"},
	{"ID" : "1005", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe0_U", "Parent" : "208"},
	{"ID" : "1006", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe1_U", "Parent" : "208"},
	{"ID" : "1007", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe2_U", "Parent" : "208"},
	{"ID" : "1008", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe3_U", "Parent" : "208"},
	{"ID" : "1009", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.quantized_stream_U", "Parent" : "6"},
	{"ID" : "1010", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.scale_stream_U", "Parent" : "6"},
	{"ID" : "1011", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_run_preprocess_and_linear_fu_377.icmp_ln113_loc_i_channel_U", "Parent" : "6"},
	{"ID" : "1012", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_5_s_fu_474", "Parent" : "3", "Child" : ["1013"],
		"CDFG" : "int4_route_linear_projection_5_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1013", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_5_s_fu_474.flow_control_loop_pipe_sequential_init_U", "Parent" : "1012"},
	{"ID" : "1014", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_4_s_fu_494", "Parent" : "3", "Child" : ["1015"],
		"CDFG" : "int4_route_linear_projection_4_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "179", "EstimateLatencyMax" : "179",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1015", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_4_s_fu_494.flow_control_loop_pipe_sequential_init_U", "Parent" : "1014"},
	{"ID" : "1016", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_2_s_fu_514", "Parent" : "3", "Child" : ["1017"],
		"CDFG" : "int4_route_linear_projection_2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1017", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_2_s_fu_514.flow_control_loop_pipe_sequential_init_U", "Parent" : "1016"},
	{"ID" : "1018", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_1_s_fu_534", "Parent" : "3", "Child" : ["1019"],
		"CDFG" : "int4_route_linear_projection_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1019", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_1_s_fu_534.flow_control_loop_pipe_sequential_init_U", "Parent" : "1018"},
	{"ID" : "1020", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_6_s_fu_554", "Parent" : "3", "Child" : ["1021"],
		"CDFG" : "int4_route_linear_projection_6_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1021", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_6_s_fu_554.flow_control_loop_pipe_sequential_init_U", "Parent" : "1020"},
	{"ID" : "1022", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_0_s_fu_574", "Parent" : "3", "Child" : ["1023"],
		"CDFG" : "int4_route_linear_projection_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1023", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_0_s_fu_574.flow_control_loop_pipe_sequential_init_U", "Parent" : "1022"},
	{"ID" : "1024", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_7_s_fu_594", "Parent" : "3", "Child" : ["1025"],
		"CDFG" : "int4_route_linear_projection_7_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "577", "EstimateLatencyMax" : "577",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1025", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output3", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1025", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_7_s_fu_594.grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Parent" : "1024", "Child" : ["1026"],
		"CDFG" : "int4_route_linear_projection_7_Pipeline_route_linear_projection_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "507", "EstimateLatencyMax" : "507",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln157", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln157_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln157_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln157_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1026", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.int4_execute_dispatch_linear_U0.grp_int4_route_linear_projection_7_s_fu_594.grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134.flow_control_loop_pipe_sequential_init_U", "Parent" : "1025"},
	{"ID" : "1027", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weight_bank0_c_U", "Parent" : "0"},
	{"ID" : "1028", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weight_bank1_c_U", "Parent" : "0"},
	{"ID" : "1029", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weight_bank2_c_U", "Parent" : "0"},
	{"ID" : "1030", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weight_bank3_c_U", "Parent" : "0"},
	{"ID" : "1031", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.logits_pe0_c_U", "Parent" : "0"},
	{"ID" : "1032", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.logits_pe1_c_U", "Parent" : "0"},
	{"ID" : "1033", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.logits_pe2_c_U", "Parent" : "0"},
	{"ID" : "1034", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.logits_pe3_c_U", "Parent" : "0"},
	{"ID" : "1035", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.controller_run_linear_in_c_U", "Parent" : "0"},
	{"ID" : "1036", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.controller_linear_mode_in_c_U", "Parent" : "0"},
	{"ID" : "1037", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.controller_layer_index_in_c_U", "Parent" : "0"},
	{"ID" : "1038", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.idx_c_U", "Parent" : "0"},
	{"ID" : "1039", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.command_stream_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_dispatch_linear_registered {
		gmem0 {Type IO LastRead 72 FirstWrite -1}
		weight_bank0 {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type IO LastRead 72 FirstWrite -1}
		weight_bank1 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type IO LastRead 72 FirstWrite -1}
		weight_bank2 {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type IO LastRead 72 FirstWrite -1}
		weight_bank3 {Type I LastRead 0 FirstWrite -1}
		activation_q {Type IO LastRead 1 FirstWrite 1}
		activation_scale {Type IO LastRead 1 FirstWrite 1}
		residual_pe0 {Type IO LastRead 1 FirstWrite -1}
		residual_pe1 {Type IO LastRead 1 FirstWrite -1}
		residual_pe2 {Type IO LastRead 1 FirstWrite -1}
		residual_pe3 {Type IO LastRead 1 FirstWrite -1}
		preprocess_mode {Type I LastRead 0 FirstWrite -1}
		linear_stage0 {Type IO LastRead 1 FirstWrite -1}
		linear_stage1 {Type IO LastRead 1 FirstWrite -1}
		linear_stage2 {Type IO LastRead 1 FirstWrite -1}
		linear_stage3 {Type IO LastRead 1 FirstWrite -1}
		q_pe0 {Type O LastRead -1 FirstWrite 2}
		q_pe1 {Type O LastRead -1 FirstWrite 2}
		q_pe2 {Type O LastRead -1 FirstWrite 2}
		q_pe3 {Type O LastRead -1 FirstWrite 2}
		k_pe0 {Type O LastRead -1 FirstWrite 2}
		k_pe1 {Type O LastRead -1 FirstWrite 2}
		k_pe2 {Type O LastRead -1 FirstWrite 2}
		k_pe3 {Type O LastRead -1 FirstWrite 2}
		v_pe0 {Type O LastRead -1 FirstWrite 2}
		v_pe1 {Type O LastRead -1 FirstWrite 2}
		v_pe2 {Type O LastRead -1 FirstWrite 2}
		v_pe3 {Type O LastRead -1 FirstWrite 2}
		gate_pe0 {Type IO LastRead 1 FirstWrite -1}
		gate_pe1 {Type IO LastRead 1 FirstWrite -1}
		gate_pe2 {Type IO LastRead 1 FirstWrite -1}
		gate_pe3 {Type IO LastRead 1 FirstWrite -1}
		up_pe0 {Type IO LastRead 38 FirstWrite -1}
		up_pe1 {Type IO LastRead 38 FirstWrite -1}
		up_pe2 {Type IO LastRead 38 FirstWrite -1}
		up_pe3 {Type IO LastRead 38 FirstWrite -1}
		logits_pe0 {Type I LastRead 0 FirstWrite -1}
		logits_pe1 {Type I LastRead 0 FirstWrite -1}
		logits_pe2 {Type I LastRead 0 FirstWrite -1}
		logits_pe3 {Type I LastRead 0 FirstWrite -1}
		controller_run_rmsnorm {Type O LastRead -1 FirstWrite 3}
		controller_rmsnorm_mode {Type O LastRead -1 FirstWrite 3}
		p_read {Type I LastRead 0 FirstWrite -1}
		controller_run_linear_out {Type O LastRead -1 FirstWrite 6}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		controller_linear_mode_out {Type O LastRead -1 FirstWrite 6}
		controller_run_rope {Type O LastRead -1 FirstWrite 3}
		controller_run_swiglu {Type O LastRead -1 FirstWrite 3}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		controller_layer_index_out {Type O LastRead -1 FirstWrite 6}
		controller_exit {Type O LastRead -1 FirstWrite 3}
		idx {Type I LastRead 0 FirstWrite -1}
		controller_weight_word_offset_constprop {Type IO LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop {Type IO LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	entry_proc58 {
		weight_bank0 {Type I LastRead 0 FirstWrite -1}
		weight_bank0_c {Type O LastRead -1 FirstWrite 0}
		weight_bank1 {Type I LastRead 0 FirstWrite -1}
		weight_bank1_c {Type O LastRead -1 FirstWrite 0}
		weight_bank2 {Type I LastRead 0 FirstWrite -1}
		weight_bank2_c {Type O LastRead -1 FirstWrite 0}
		weight_bank3 {Type I LastRead 0 FirstWrite -1}
		weight_bank3_c {Type O LastRead -1 FirstWrite 0}
		logits_pe0 {Type I LastRead 0 FirstWrite -1}
		logits_pe0_c {Type O LastRead -1 FirstWrite 0}
		logits_pe1 {Type I LastRead 0 FirstWrite -1}
		logits_pe1_c {Type O LastRead -1 FirstWrite 0}
		logits_pe2 {Type I LastRead 0 FirstWrite -1}
		logits_pe2_c {Type O LastRead -1 FirstWrite 0}
		logits_pe3 {Type I LastRead 0 FirstWrite -1}
		logits_pe3_c {Type O LastRead -1 FirstWrite 0}
		p_read {Type I LastRead 0 FirstWrite -1}
		controller_run_linear_in_c {Type O LastRead -1 FirstWrite 0}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		controller_linear_mode_in_c {Type O LastRead -1 FirstWrite 0}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		controller_layer_index_in_c {Type O LastRead -1 FirstWrite 0}
		idx {Type I LastRead 0 FirstWrite -1}
		idx_c {Type O LastRead -1 FirstWrite 0}}
	int4_dispatch_linear_registered_Block_entry1_proc24 {
		preprocess_mode {Type I LastRead 0 FirstWrite -1}
		command_stream {Type O LastRead -1 FirstWrite 0}}
	int4_execute_dispatch_linear {
		gmem0 {Type IO LastRead 72 FirstWrite -1}
		weight_bank0 {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type IO LastRead 72 FirstWrite -1}
		weight_bank1 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type IO LastRead 72 FirstWrite -1}
		weight_bank2 {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type IO LastRead 72 FirstWrite -1}
		weight_bank3 {Type I LastRead 0 FirstWrite -1}
		activation_q {Type IO LastRead 1 FirstWrite 1}
		activation_scale {Type IO LastRead 1 FirstWrite 1}
		residual_pe0 {Type IO LastRead 1 FirstWrite -1}
		residual_pe1 {Type IO LastRead 1 FirstWrite -1}
		residual_pe2 {Type IO LastRead 1 FirstWrite -1}
		residual_pe3 {Type IO LastRead 1 FirstWrite -1}
		command_stream {Type I LastRead 0 FirstWrite -1}
		linear_stage0 {Type IO LastRead 1 FirstWrite -1}
		linear_stage1 {Type IO LastRead 1 FirstWrite -1}
		linear_stage2 {Type IO LastRead 1 FirstWrite -1}
		linear_stage3 {Type IO LastRead 1 FirstWrite -1}
		q_pe0 {Type O LastRead -1 FirstWrite 2}
		q_pe1 {Type O LastRead -1 FirstWrite 2}
		q_pe2 {Type O LastRead -1 FirstWrite 2}
		q_pe3 {Type O LastRead -1 FirstWrite 2}
		k_pe0 {Type O LastRead -1 FirstWrite 2}
		k_pe1 {Type O LastRead -1 FirstWrite 2}
		k_pe2 {Type O LastRead -1 FirstWrite 2}
		k_pe3 {Type O LastRead -1 FirstWrite 2}
		v_pe0 {Type O LastRead -1 FirstWrite 2}
		v_pe1 {Type O LastRead -1 FirstWrite 2}
		v_pe2 {Type O LastRead -1 FirstWrite 2}
		v_pe3 {Type O LastRead -1 FirstWrite 2}
		gate_pe0 {Type IO LastRead 1 FirstWrite -1}
		gate_pe1 {Type IO LastRead 1 FirstWrite -1}
		gate_pe2 {Type IO LastRead 1 FirstWrite -1}
		gate_pe3 {Type IO LastRead 1 FirstWrite -1}
		up_pe0 {Type IO LastRead 38 FirstWrite -1}
		up_pe1 {Type IO LastRead 38 FirstWrite -1}
		up_pe2 {Type IO LastRead 38 FirstWrite -1}
		up_pe3 {Type IO LastRead 38 FirstWrite -1}
		logits_pe0 {Type I LastRead 0 FirstWrite -1}
		logits_pe1 {Type I LastRead 0 FirstWrite -1}
		logits_pe2 {Type I LastRead 0 FirstWrite -1}
		logits_pe3 {Type I LastRead 0 FirstWrite -1}
		controller_run_rmsnorm {Type O LastRead -1 FirstWrite 3}
		controller_rmsnorm_mode {Type O LastRead -1 FirstWrite 3}
		controller_run_linear_in {Type I LastRead 0 FirstWrite -1}
		controller_run_linear_out {Type O LastRead -1 FirstWrite 6}
		controller_linear_mode_in {Type I LastRead 0 FirstWrite -1}
		controller_linear_mode_out {Type O LastRead -1 FirstWrite 6}
		controller_run_rope {Type O LastRead -1 FirstWrite 3}
		controller_run_swiglu {Type O LastRead -1 FirstWrite 3}
		controller_layer_index_in {Type I LastRead 0 FirstWrite -1}
		controller_layer_index_out {Type O LastRead -1 FirstWrite 6}
		controller_exit {Type O LastRead -1 FirstWrite 3}
		idx {Type I LastRead 0 FirstWrite -1}
		controller_weight_word_offset_constprop {Type IO LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop {Type IO LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop {
		residual_pe0 {Type I LastRead 0 FirstWrite -1}
		linear_stage0 {Type O LastRead -1 FirstWrite 2}
		residual_pe1 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type O LastRead -1 FirstWrite 2}
		residual_pe2 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type O LastRead -1 FirstWrite 2}
		residual_pe3 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type O LastRead -1 FirstWrite 2}}
	int4_run_preprocess_and_linear {
		gmem0 {Type I LastRead 72 FirstWrite -1}
		weight_bank0 {Type I LastRead 2 FirstWrite -1}
		gmem1 {Type I LastRead 72 FirstWrite -1}
		weight_bank1 {Type I LastRead 2 FirstWrite -1}
		gmem2 {Type I LastRead 72 FirstWrite -1}
		weight_bank2 {Type I LastRead 2 FirstWrite -1}
		gmem3 {Type I LastRead 72 FirstWrite -1}
		weight_bank3 {Type I LastRead 2 FirstWrite -1}
		activation_q {Type IO LastRead 1 FirstWrite 1}
		activation_scale {Type IO LastRead 1 FirstWrite 1}
		rms_input_pe0 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe1 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe2 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe3 {Type I LastRead 1 FirstWrite -1}
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		preprocess_mode {Type I LastRead 0 FirstWrite -1}
		output_pe0 {Type IO LastRead 1 FirstWrite 2}
		output_pe1 {Type IO LastRead 1 FirstWrite 2}
		output_pe2 {Type IO LastRead 1 FirstWrite 2}
		output_pe3 {Type IO LastRead 1 FirstWrite 2}
		controller_run_rmsnorm {Type O LastRead -1 FirstWrite 3}
		controller_rmsnorm_mode {Type O LastRead -1 FirstWrite 3}
		p_read {Type I LastRead 2 FirstWrite -1}
		controller_run_linear_out {Type O LastRead -1 FirstWrite 3}
		p_read1 {Type I LastRead 2 FirstWrite -1}
		controller_linear_mode_out {Type O LastRead -1 FirstWrite 3}
		controller_run_rope {Type O LastRead -1 FirstWrite 3}
		controller_run_swiglu {Type O LastRead -1 FirstWrite 3}
		p_read2 {Type I LastRead 2 FirstWrite -1}
		controller_layer_index_out {Type O LastRead -1 FirstWrite 3}
		controller_exit {Type O LastRead -1 FirstWrite 3}
		idx {Type I LastRead 2 FirstWrite -1}
		idx4 {Type I LastRead 2 FirstWrite -1}
		idx8 {Type I LastRead 0 FirstWrite -1}
		idx9 {Type I LastRead 0 FirstWrite -1}
		idx10 {Type I LastRead 0 FirstWrite -1}
		idx11 {Type I LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop_out {Type O LastRead -1 FirstWrite 3}
		controller_weight_word_offset_constprop_out {Type O LastRead -1 FirstWrite 3}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}
		controller_weight_word_offset_constprop {Type I LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop {Type I LastRead 0 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_preprocess_activation_stream {
		preprocess_mode {Type I LastRead 0 FirstWrite -1}
		rms_input_pe0 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe1 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe2 {Type I LastRead 1 FirstWrite -1}
		rms_input_pe3 {Type I LastRead 1 FirstWrite -1}
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		idx {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx2 {Type I LastRead 0 FirstWrite -1}
		idx3 {Type I LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_swiglu_quantize_stream_4pe {
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_swiglu_quantize_four_pes_stream {
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_swiglu_quantize_pe0 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 19}
		scale_pe0 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_55 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_4_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe1 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe1 {Type O LastRead -1 FirstWrite 19}
		scale_pe1 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_47 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_3_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe2 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe2 {Type O LastRead -1 FirstWrite 19}
		scale_pe2 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_39 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_2_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe3 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 19}
		scale_pe3 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_31 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_1_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_gather_streams {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop {
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		select_ln946 {Type I LastRead 0 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}}
	int4_rmsnorm_quantize_stream_4pe {
		input_pe0 {Type I LastRead 1 FirstWrite -1}
		input_pe1 {Type I LastRead 1 FirstWrite -1}
		input_pe2 {Type I LastRead 1 FirstWrite -1}
		input_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		idx {Type I LastRead 3 FirstWrite -1}
		idx1 {Type I LastRead 3 FirstWrite -1}
		idx2 {Type I LastRead 3 FirstWrite -1}
		idx3 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_sumsq_four_pes {
		input_pe0 {Type I LastRead 0 FirstWrite -1}
		input_pe1 {Type I LastRead 0 FirstWrite -1}
		input_pe2 {Type I LastRead 0 FirstWrite -1}
		input_pe3 {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type O LastRead -1 FirstWrite 49}}
	int4_rms_sumsq_pe {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_0 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_10 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_1 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_11 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_2 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_12 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_merge_and_rsqrt {
		partial_0 {Type I LastRead 0 FirstWrite -1}
		partial_1 {Type I LastRead 0 FirstWrite -1}
		partial_2 {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type O LastRead -1 FirstWrite 49}}
	int4_rms_normalize_quantize_four_pes_stream {
		input_pe0 {Type I LastRead 1 FirstWrite -1}
		input_pe1 {Type I LastRead 1 FirstWrite -1}
		input_pe2 {Type I LastRead 1 FirstWrite -1}
		input_pe3 {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		idx {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx2 {Type I LastRead 0 FirstWrite -1}
		idx3 {Type I LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 19}
		scale_pe0 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_8_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_07_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_13 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe1 {Type O LastRead -1 FirstWrite 19}
		scale_pe1 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_7_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_07_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_14 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe2 {Type O LastRead -1 FirstWrite 19}
		scale_pe2 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_6_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_15 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 19}
		scale_pe3 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_5_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_gather_streams {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_run_preprocess_and_linear_Block_entry13_proc {
		preprocess_mode {Type I LastRead 0 FirstWrite -1}}
	int4_linear_4pe_from_stream {
		gmem0 {Type I LastRead 72 FirstWrite -1}
		weight_bank0 {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type I LastRead 72 FirstWrite -1}
		weight_bank1 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type I LastRead 72 FirstWrite -1}
		weight_bank2 {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type I LastRead 72 FirstWrite -1}
		weight_bank3 {Type I LastRead 0 FirstWrite -1}
		activation_q {Type IO LastRead 1 FirstWrite 1}
		activation_scale {Type IO LastRead 1 FirstWrite 1}
		quantized_stream_i {Type I LastRead 1 FirstWrite -1}
		scale_stream_i {Type I LastRead 1 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		output_pe0 {Type IO LastRead 1 FirstWrite 2}
		output_pe1 {Type IO LastRead 1 FirstWrite 2}
		output_pe2 {Type IO LastRead 1 FirstWrite 2}
		output_pe3 {Type IO LastRead 1 FirstWrite 2}
		controller_run_rmsnorm {Type O LastRead -1 FirstWrite 3}
		controller_rmsnorm_mode {Type O LastRead -1 FirstWrite 3}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		controller_run_linear_out {Type O LastRead -1 FirstWrite 3}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		controller_linear_mode_out {Type O LastRead -1 FirstWrite 3}
		controller_run_rope {Type O LastRead -1 FirstWrite 3}
		controller_run_swiglu {Type O LastRead -1 FirstWrite 3}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		controller_layer_index_out {Type O LastRead -1 FirstWrite 3}
		controller_exit {Type O LastRead -1 FirstWrite 3}
		idx {Type I LastRead 0 FirstWrite -1}
		idx4 {Type I LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop_out {Type O LastRead -1 FirstWrite 3}
		controller_weight_word_offset_constprop_out {Type O LastRead -1 FirstWrite 3}
		controller_weight_word_offset_constprop {Type I LastRead 0 FirstWrite -1}
		controller_weight_scale_word_offset_constprop {Type I LastRead 0 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_run_four_pes {
		gmem0 {Type I LastRead 72 FirstWrite -1}
		weight_pe0 {Type I LastRead 2 FirstWrite -1}
		gmem1 {Type I LastRead 72 FirstWrite -1}
		weight_pe1 {Type I LastRead 2 FirstWrite -1}
		gmem2 {Type I LastRead 72 FirstWrite -1}
		weight_pe2 {Type I LastRead 2 FirstWrite -1}
		gmem3 {Type I LastRead 72 FirstWrite -1}
		weight_pe3 {Type I LastRead 2 FirstWrite -1}
		quantized {Type IO LastRead 1 FirstWrite 1}
		packed_scales {Type IO LastRead 1 FirstWrite 1}
		quantized_stream {Type I LastRead 1 FirstWrite -1}
		scale_stream {Type I LastRead 1 FirstWrite -1}
		stream_activation {Type I LastRead 0 FirstWrite -1}
		output_pe0 {Type IO LastRead 1 FirstWrite 2}
		output_pe1 {Type IO LastRead 1 FirstWrite 2}
		output_pe2 {Type IO LastRead 1 FirstWrite 2}
		output_pe3 {Type IO LastRead 1 FirstWrite 2}
		local_tiles_0 {Type I LastRead 0 FirstWrite -1}
		local_tiles_1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_2 {Type I LastRead 0 FirstWrite -1}
		local_tiles_3 {Type I LastRead 0 FirstWrite -1}
		input_tiles {Type I LastRead 0 FirstWrite -1}
		output_fxp {Type I LastRead 0 FirstWrite -1}
		fuse_residual {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 2 FirstWrite -1}
		idx1 {Type I LastRead 2 FirstWrite -1}
		idx2 {Type I LastRead 2 FirstWrite -1}
		idx3 {Type I LastRead 2 FirstWrite -1}
		idx4 {Type I LastRead 2 FirstWrite -1}
		idx5 {Type I LastRead 2 FirstWrite -1}
		idx6 {Type I LastRead 2 FirstWrite -1}
		idx7 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_broadcast_linear_commands {
		linear_command_pe0 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe1 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe2 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe3 {Type O LastRead -1 FirstWrite 0}
		local_tiles_0 {Type I LastRead 0 FirstWrite -1}
		local_tiles_1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_2 {Type I LastRead 0 FirstWrite -1}
		local_tiles_3 {Type I LastRead 0 FirstWrite -1}
		input_tiles {Type I LastRead 0 FirstWrite -1}
		output_fxp {Type I LastRead 0 FirstWrite -1}
		fuse_residual {Type I LastRead 0 FirstWrite -1}}
	int4_broadcast_activation {
		quantized {Type IO LastRead 1 FirstWrite 1}
		packed_scales {Type IO LastRead 1 FirstWrite 1}
		quantized_stream {Type I LastRead 1 FirstWrite -1}
		scale_stream {Type I LastRead 1 FirstWrite -1}
		stream_activation {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 3}
		quantized_pe1 {Type O LastRead -1 FirstWrite 3}
		quantized_pe2 {Type O LastRead -1 FirstWrite 3}
		quantized_pe3 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe0 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe1 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe2 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe3 {Type O LastRead -1 FirstWrite 3}
		local_tiles_0 {Type I LastRead 0 FirstWrite -1}
		local_tiles_1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_2 {Type I LastRead 0 FirstWrite -1}
		local_tiles_3 {Type I LastRead 0 FirstWrite -1}
		input_tiles {Type I LastRead 0 FirstWrite -1}}
	int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		active_3 {Type I LastRead 0 FirstWrite -1}
		active_2 {Type I LastRead 0 FirstWrite -1}
		active_1 {Type I LastRead 0 FirstWrite -1}
		active_0 {Type I LastRead 0 FirstWrite -1}
		quantized_stream {Type I LastRead 1 FirstWrite -1}
		scale_stream {Type I LastRead 1 FirstWrite -1}
		quantized {Type IO LastRead 1 FirstWrite 1}
		stream_activation {Type I LastRead 0 FirstWrite -1}
		packed_scales {Type IO LastRead 1 FirstWrite 1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe0 {Type O LastRead -1 FirstWrite 3}
		quantized_pe1 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe1 {Type O LastRead -1 FirstWrite 3}
		quantized_pe2 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe2 {Type O LastRead -1 FirstWrite 3}
		quantized_pe3 {Type O LastRead -1 FirstWrite 3}
		activation_scale_pe3 {Type O LastRead -1 FirstWrite 3}
		streamed_scale_word_out {Type O LastRead -1 FirstWrite 2}}
	int4_run_pe_dataflow_0_s {
		gmem0 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 2 FirstWrite -1}
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe0 {Type I LastRead 1 FirstWrite -1}
		linear_command_pe0 {Type I LastRead 0 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		idx {Type I LastRead 2 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}}
	entry_proc56 {
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx1_c {Type O LastRead -1 FirstWrite 0}}
	int4_run_pe_dataflow_0_Block_entry2_proc20 {
		linear_command_pe0 {Type I LastRead 0 FirstWrite -1}}
	int4_stream_pe_inputs {
		gmem0 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type O LastRead -1 FirstWrite 73}
		p_read {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	int4_cache_and_replay_activation_0_s {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe0 {Type I LastRead 1 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c16 {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c20 {Type O LastRead -1 FirstWrite 0}}
	int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3 {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}
	int4_stream_integer_blocks {
		weight_stream {Type I LastRead 2 FirstWrite -1}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c19 {Type O LastRead -1 FirstWrite 0}}
	int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}
	int4_dequantize_final_blocks {
		group_stream {Type I LastRead 8 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c18 {Type O LastRead -1 FirstWrite 0}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}}
	int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache0 {Type I LastRead 2 FirstWrite -1}}
	int4_pack_dequantized_outputs {
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c {Type O LastRead -1 FirstWrite 0}}
	int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}}
	int4_write_outputs_9 {
		output_stream {Type I LastRead 3 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}}
	int4_write_outputs_9_Pipeline_write_output_direct_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 1 FirstWrite -1}
		output_mem {Type O LastRead -1 FirstWrite 2}}
	int4_write_outputs_9_Pipeline_fused_residual_add_loop {
		residual_values {Type I LastRead 0 FirstWrite -1}
		residual_values_1 {Type I LastRead 0 FirstWrite -1}
		residual_values_2 {Type I LastRead 0 FirstWrite -1}
		residual_values_3 {Type I LastRead 0 FirstWrite -1}
		residual_values_4 {Type I LastRead 0 FirstWrite -1}
		residual_values_5 {Type I LastRead 0 FirstWrite -1}
		residual_values_6 {Type I LastRead 0 FirstWrite -1}
		residual_values_7 {Type I LastRead 0 FirstWrite -1}
		residual_values_8 {Type I LastRead 0 FirstWrite -1}
		residual_values_9 {Type I LastRead 0 FirstWrite -1}
		residual_values_10 {Type I LastRead 0 FirstWrite -1}
		residual_values_11 {Type I LastRead 0 FirstWrite -1}
		residual_values_12 {Type I LastRead 0 FirstWrite -1}
		residual_values_13 {Type I LastRead 0 FirstWrite -1}
		residual_values_14 {Type I LastRead 0 FirstWrite -1}
		residual_values_15 {Type I LastRead 0 FirstWrite -1}
		branch_values {Type I LastRead 0 FirstWrite -1}
		branch_values_1 {Type I LastRead 0 FirstWrite -1}
		branch_values_2 {Type I LastRead 0 FirstWrite -1}
		branch_values_3 {Type I LastRead 0 FirstWrite -1}
		branch_values_4 {Type I LastRead 0 FirstWrite -1}
		branch_values_5 {Type I LastRead 0 FirstWrite -1}
		branch_values_6 {Type I LastRead 0 FirstWrite -1}
		branch_values_7 {Type I LastRead 0 FirstWrite -1}
		branch_values_8 {Type I LastRead 0 FirstWrite -1}
		branch_values_9 {Type I LastRead 0 FirstWrite -1}
		branch_values_10 {Type I LastRead 0 FirstWrite -1}
		branch_values_11 {Type I LastRead 0 FirstWrite -1}
		branch_values_12 {Type I LastRead 0 FirstWrite -1}
		branch_values_13 {Type I LastRead 0 FirstWrite -1}
		branch_values_14 {Type I LastRead 0 FirstWrite -1}
		branch_values_15 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 6}
		p_out1 {Type O LastRead -1 FirstWrite 6}
		p_out2 {Type O LastRead -1 FirstWrite 6}
		p_out3 {Type O LastRead -1 FirstWrite 6}
		p_out4 {Type O LastRead -1 FirstWrite 6}
		p_out5 {Type O LastRead -1 FirstWrite 6}
		p_out6 {Type O LastRead -1 FirstWrite 6}
		p_out7 {Type O LastRead -1 FirstWrite 6}
		p_out8 {Type O LastRead -1 FirstWrite 6}
		p_out9 {Type O LastRead -1 FirstWrite 6}
		p_out10 {Type O LastRead -1 FirstWrite 6}
		p_out11 {Type O LastRead -1 FirstWrite 6}
		p_out12 {Type O LastRead -1 FirstWrite 6}
		p_out13 {Type O LastRead -1 FirstWrite 6}
		p_out14 {Type O LastRead -1 FirstWrite 6}
		p_out15 {Type O LastRead -1 FirstWrite 6}}
	int4_run_pe_dataflow_1_s {
		gmem1 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 2 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe1 {Type I LastRead 1 FirstWrite -1}
		linear_command_pe1 {Type I LastRead 0 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		idx {Type I LastRead 2 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}}
	entry_proc55 {
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx1_c {Type O LastRead -1 FirstWrite 0}}
	int4_run_pe_dataflow_1_Block_entry2_proc21 {
		linear_command_pe1 {Type I LastRead 0 FirstWrite -1}}
	int4_stream_pe_inputs_16 {
		gmem1 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type O LastRead -1 FirstWrite 73}
		p_read {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	int4_cache_and_replay_activation_1_s {
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe1 {Type I LastRead 1 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c16 {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c20 {Type O LastRead -1 FirstWrite 0}}
	int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2 {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}
	int4_stream_integer_blocks_5 {
		weight_stream {Type I LastRead 2 FirstWrite -1}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c19 {Type O LastRead -1 FirstWrite 0}}
	int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}
	int4_dequantize_final_blocks_17 {
		group_stream {Type I LastRead 8 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c18 {Type O LastRead -1 FirstWrite 0}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}}
	int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}}
	int4_pack_dequantized_outputs_6 {
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c {Type O LastRead -1 FirstWrite 0}}
	int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}}
	int4_write_outputs_8 {
		output_stream {Type I LastRead 3 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}}
	int4_write_outputs_8_Pipeline_write_output_direct_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 1 FirstWrite -1}
		output_mem {Type O LastRead -1 FirstWrite 2}}
	int4_write_outputs_8_Pipeline_fused_residual_add_loop {
		residual_values {Type I LastRead 0 FirstWrite -1}
		residual_values_16 {Type I LastRead 0 FirstWrite -1}
		residual_values_17 {Type I LastRead 0 FirstWrite -1}
		residual_values_18 {Type I LastRead 0 FirstWrite -1}
		residual_values_19 {Type I LastRead 0 FirstWrite -1}
		residual_values_20 {Type I LastRead 0 FirstWrite -1}
		residual_values_21 {Type I LastRead 0 FirstWrite -1}
		residual_values_22 {Type I LastRead 0 FirstWrite -1}
		residual_values_23 {Type I LastRead 0 FirstWrite -1}
		residual_values_24 {Type I LastRead 0 FirstWrite -1}
		residual_values_25 {Type I LastRead 0 FirstWrite -1}
		residual_values_26 {Type I LastRead 0 FirstWrite -1}
		residual_values_27 {Type I LastRead 0 FirstWrite -1}
		residual_values_28 {Type I LastRead 0 FirstWrite -1}
		residual_values_29 {Type I LastRead 0 FirstWrite -1}
		residual_values_30 {Type I LastRead 0 FirstWrite -1}
		branch_values {Type I LastRead 0 FirstWrite -1}
		branch_values_16 {Type I LastRead 0 FirstWrite -1}
		branch_values_17 {Type I LastRead 0 FirstWrite -1}
		branch_values_18 {Type I LastRead 0 FirstWrite -1}
		branch_values_19 {Type I LastRead 0 FirstWrite -1}
		branch_values_20 {Type I LastRead 0 FirstWrite -1}
		branch_values_21 {Type I LastRead 0 FirstWrite -1}
		branch_values_22 {Type I LastRead 0 FirstWrite -1}
		branch_values_23 {Type I LastRead 0 FirstWrite -1}
		branch_values_24 {Type I LastRead 0 FirstWrite -1}
		branch_values_25 {Type I LastRead 0 FirstWrite -1}
		branch_values_26 {Type I LastRead 0 FirstWrite -1}
		branch_values_27 {Type I LastRead 0 FirstWrite -1}
		branch_values_28 {Type I LastRead 0 FirstWrite -1}
		branch_values_29 {Type I LastRead 0 FirstWrite -1}
		branch_values_30 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 6}
		p_out1 {Type O LastRead -1 FirstWrite 6}
		p_out2 {Type O LastRead -1 FirstWrite 6}
		p_out3 {Type O LastRead -1 FirstWrite 6}
		p_out4 {Type O LastRead -1 FirstWrite 6}
		p_out5 {Type O LastRead -1 FirstWrite 6}
		p_out6 {Type O LastRead -1 FirstWrite 6}
		p_out7 {Type O LastRead -1 FirstWrite 6}
		p_out8 {Type O LastRead -1 FirstWrite 6}
		p_out9 {Type O LastRead -1 FirstWrite 6}
		p_out10 {Type O LastRead -1 FirstWrite 6}
		p_out11 {Type O LastRead -1 FirstWrite 6}
		p_out12 {Type O LastRead -1 FirstWrite 6}
		p_out13 {Type O LastRead -1 FirstWrite 6}
		p_out14 {Type O LastRead -1 FirstWrite 6}
		p_out15 {Type O LastRead -1 FirstWrite 6}}
	int4_run_pe_dataflow_2_s {
		gmem2 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 2 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe2 {Type I LastRead 1 FirstWrite -1}
		linear_command_pe2 {Type I LastRead 0 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		idx {Type I LastRead 2 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}}
	entry_proc54 {
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx1_c {Type O LastRead -1 FirstWrite 0}}
	int4_run_pe_dataflow_2_Block_entry2_proc22 {
		linear_command_pe2 {Type I LastRead 0 FirstWrite -1}}
	int4_stream_pe_inputs_18 {
		gmem2 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type O LastRead -1 FirstWrite 73}
		p_read {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	int4_cache_and_replay_activation_2_s {
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe2 {Type I LastRead 1 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c16 {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c20 {Type O LastRead -1 FirstWrite 0}}
	int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1 {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}
	int4_stream_integer_blocks_3 {
		weight_stream {Type I LastRead 2 FirstWrite -1}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c19 {Type O LastRead -1 FirstWrite 0}}
	int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}
	int4_dequantize_final_blocks_19 {
		group_stream {Type I LastRead 8 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c18 {Type O LastRead -1 FirstWrite 0}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}}
	int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}}
	int4_pack_dequantized_outputs_4 {
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c {Type O LastRead -1 FirstWrite 0}}
	int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}}
	int4_write_outputs_7 {
		output_stream {Type I LastRead 3 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}}
	int4_write_outputs_7_Pipeline_write_output_direct_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 1 FirstWrite -1}
		output_mem {Type O LastRead -1 FirstWrite 2}}
	int4_write_outputs_7_Pipeline_fused_residual_add_loop {
		residual_values {Type I LastRead 0 FirstWrite -1}
		residual_values_31 {Type I LastRead 0 FirstWrite -1}
		residual_values_32 {Type I LastRead 0 FirstWrite -1}
		residual_values_33 {Type I LastRead 0 FirstWrite -1}
		residual_values_34 {Type I LastRead 0 FirstWrite -1}
		residual_values_35 {Type I LastRead 0 FirstWrite -1}
		residual_values_36 {Type I LastRead 0 FirstWrite -1}
		residual_values_37 {Type I LastRead 0 FirstWrite -1}
		residual_values_38 {Type I LastRead 0 FirstWrite -1}
		residual_values_39 {Type I LastRead 0 FirstWrite -1}
		residual_values_40 {Type I LastRead 0 FirstWrite -1}
		residual_values_41 {Type I LastRead 0 FirstWrite -1}
		residual_values_42 {Type I LastRead 0 FirstWrite -1}
		residual_values_43 {Type I LastRead 0 FirstWrite -1}
		residual_values_44 {Type I LastRead 0 FirstWrite -1}
		residual_values_45 {Type I LastRead 0 FirstWrite -1}
		branch_values {Type I LastRead 0 FirstWrite -1}
		branch_values_31 {Type I LastRead 0 FirstWrite -1}
		branch_values_32 {Type I LastRead 0 FirstWrite -1}
		branch_values_33 {Type I LastRead 0 FirstWrite -1}
		branch_values_34 {Type I LastRead 0 FirstWrite -1}
		branch_values_35 {Type I LastRead 0 FirstWrite -1}
		branch_values_36 {Type I LastRead 0 FirstWrite -1}
		branch_values_37 {Type I LastRead 0 FirstWrite -1}
		branch_values_38 {Type I LastRead 0 FirstWrite -1}
		branch_values_39 {Type I LastRead 0 FirstWrite -1}
		branch_values_40 {Type I LastRead 0 FirstWrite -1}
		branch_values_41 {Type I LastRead 0 FirstWrite -1}
		branch_values_42 {Type I LastRead 0 FirstWrite -1}
		branch_values_43 {Type I LastRead 0 FirstWrite -1}
		branch_values_44 {Type I LastRead 0 FirstWrite -1}
		branch_values_45 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 6}
		p_out1 {Type O LastRead -1 FirstWrite 6}
		p_out2 {Type O LastRead -1 FirstWrite 6}
		p_out3 {Type O LastRead -1 FirstWrite 6}
		p_out4 {Type O LastRead -1 FirstWrite 6}
		p_out5 {Type O LastRead -1 FirstWrite 6}
		p_out6 {Type O LastRead -1 FirstWrite 6}
		p_out7 {Type O LastRead -1 FirstWrite 6}
		p_out8 {Type O LastRead -1 FirstWrite 6}
		p_out9 {Type O LastRead -1 FirstWrite 6}
		p_out10 {Type O LastRead -1 FirstWrite 6}
		p_out11 {Type O LastRead -1 FirstWrite 6}
		p_out12 {Type O LastRead -1 FirstWrite 6}
		p_out13 {Type O LastRead -1 FirstWrite 6}
		p_out14 {Type O LastRead -1 FirstWrite 6}
		p_out15 {Type O LastRead -1 FirstWrite 6}}
	int4_run_pe_dataflow_3_s {
		gmem3 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 2 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe3 {Type I LastRead 1 FirstWrite -1}
		linear_command_pe3 {Type I LastRead 0 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		idx {Type I LastRead 2 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	entry_proc {
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx1_c {Type O LastRead -1 FirstWrite 0}}
	int4_run_pe_dataflow_3_Block_entry2_proc23 {
		linear_command_pe3 {Type I LastRead 0 FirstWrite -1}}
	int4_stream_pe_inputs_20 {
		gmem3 {Type I LastRead 72 FirstWrite -1}
		weight_mem {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type O LastRead -1 FirstWrite 73}
		p_read {Type I LastRead 0 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}}
	int4_cache_and_replay_activation_3_s {
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe3 {Type I LastRead 1 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c16 {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c20 {Type O LastRead -1 FirstWrite 0}}
	int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}
	int4_stream_integer_blocks_1 {
		weight_stream {Type I LastRead 2 FirstWrite -1}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c19 {Type O LastRead -1 FirstWrite 0}}
	int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}
	int4_dequantize_final_blocks_21 {
		group_stream {Type I LastRead 8 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c18 {Type O LastRead -1 FirstWrite 0}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache3 {Type I LastRead 2 FirstWrite -1}}
	int4_pack_dequantized_outputs_2 {
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c {Type O LastRead -1 FirstWrite 0}}
	int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}}
	int4_write_outputs {
		output_stream {Type I LastRead 3 FirstWrite -1}
		output_mem {Type IO LastRead 1 FirstWrite 2}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}}
	int4_write_outputs_Pipeline_write_output_direct_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 1 FirstWrite -1}
		output_mem {Type O LastRead -1 FirstWrite 2}}
	int4_write_outputs_Pipeline_fused_residual_add_loop {
		residual_values {Type I LastRead 0 FirstWrite -1}
		residual_values_46 {Type I LastRead 0 FirstWrite -1}
		residual_values_47 {Type I LastRead 0 FirstWrite -1}
		residual_values_48 {Type I LastRead 0 FirstWrite -1}
		residual_values_49 {Type I LastRead 0 FirstWrite -1}
		residual_values_50 {Type I LastRead 0 FirstWrite -1}
		residual_values_51 {Type I LastRead 0 FirstWrite -1}
		residual_values_52 {Type I LastRead 0 FirstWrite -1}
		residual_values_53 {Type I LastRead 0 FirstWrite -1}
		residual_values_54 {Type I LastRead 0 FirstWrite -1}
		residual_values_55 {Type I LastRead 0 FirstWrite -1}
		residual_values_56 {Type I LastRead 0 FirstWrite -1}
		residual_values_57 {Type I LastRead 0 FirstWrite -1}
		residual_values_58 {Type I LastRead 0 FirstWrite -1}
		residual_values_59 {Type I LastRead 0 FirstWrite -1}
		residual_values_60 {Type I LastRead 0 FirstWrite -1}
		branch_values {Type I LastRead 0 FirstWrite -1}
		branch_values_46 {Type I LastRead 0 FirstWrite -1}
		branch_values_47 {Type I LastRead 0 FirstWrite -1}
		branch_values_48 {Type I LastRead 0 FirstWrite -1}
		branch_values_49 {Type I LastRead 0 FirstWrite -1}
		branch_values_50 {Type I LastRead 0 FirstWrite -1}
		branch_values_51 {Type I LastRead 0 FirstWrite -1}
		branch_values_52 {Type I LastRead 0 FirstWrite -1}
		branch_values_53 {Type I LastRead 0 FirstWrite -1}
		branch_values_54 {Type I LastRead 0 FirstWrite -1}
		branch_values_55 {Type I LastRead 0 FirstWrite -1}
		branch_values_56 {Type I LastRead 0 FirstWrite -1}
		branch_values_57 {Type I LastRead 0 FirstWrite -1}
		branch_values_58 {Type I LastRead 0 FirstWrite -1}
		branch_values_59 {Type I LastRead 0 FirstWrite -1}
		branch_values_60 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 6}
		p_out1 {Type O LastRead -1 FirstWrite 6}
		p_out2 {Type O LastRead -1 FirstWrite 6}
		p_out3 {Type O LastRead -1 FirstWrite 6}
		p_out4 {Type O LastRead -1 FirstWrite 6}
		p_out5 {Type O LastRead -1 FirstWrite 6}
		p_out6 {Type O LastRead -1 FirstWrite 6}
		p_out7 {Type O LastRead -1 FirstWrite 6}
		p_out8 {Type O LastRead -1 FirstWrite 6}
		p_out9 {Type O LastRead -1 FirstWrite 6}
		p_out10 {Type O LastRead -1 FirstWrite 6}
		p_out11 {Type O LastRead -1 FirstWrite 6}
		p_out12 {Type O LastRead -1 FirstWrite 6}
		p_out13 {Type O LastRead -1 FirstWrite 6}
		p_out14 {Type O LastRead -1 FirstWrite 6}
		p_out15 {Type O LastRead -1 FirstWrite 6}}
	int4_route_linear_projection_5_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_4_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_2_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_1_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_6_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_0_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}
	int4_route_linear_projection_7_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type O LastRead 3 FirstWrite 2}
		output0 {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type O LastRead 3 FirstWrite 2}
		output1 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead 3 FirstWrite 2}
		output2 {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type O LastRead 3 FirstWrite 2}
		output3 {Type I LastRead 0 FirstWrite -1}}
	int4_route_linear_projection_7_Pipeline_route_linear_projection_loop {
		gmem0 {Type O LastRead -1 FirstWrite 2}
		sext_ln157 {Type I LastRead 0 FirstWrite -1}
		gmem1 {Type O LastRead -1 FirstWrite 2}
		sext_ln157_1 {Type I LastRead 0 FirstWrite -1}
		gmem2 {Type O LastRead -1 FirstWrite 2}
		sext_ln157_2 {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type O LastRead -1 FirstWrite 2}
		sext_ln157_3 {Type I LastRead 0 FirstWrite -1}
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "80", "Max" : "694274"}
	, {"Name" : "Interval", "Min" : "80", "Max" : "694274"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 512 }  { m_axi_gmem0_WSTRB STRB 1 64 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 512 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 12 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	weight_bank0 { ap_none {  { weight_bank0 in_data 0 64 }  { weight_bank0_ap_vld in_vld 0 1 } } }
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 512 }  { m_axi_gmem1_WSTRB STRB 1 64 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 512 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 12 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	weight_bank1 { ap_none {  { weight_bank1 in_data 0 64 }  { weight_bank1_ap_vld in_vld 0 1 } } }
	 { m_axi {  { m_axi_gmem2_AWVALID VALID 1 1 }  { m_axi_gmem2_AWREADY READY 0 1 }  { m_axi_gmem2_AWADDR ADDR 1 64 }  { m_axi_gmem2_AWID ID 1 1 }  { m_axi_gmem2_AWLEN SIZE 1 32 }  { m_axi_gmem2_AWSIZE BURST 1 3 }  { m_axi_gmem2_AWBURST LOCK 1 2 }  { m_axi_gmem2_AWLOCK CACHE 1 2 }  { m_axi_gmem2_AWCACHE PROT 1 4 }  { m_axi_gmem2_AWPROT QOS 1 3 }  { m_axi_gmem2_AWQOS REGION 1 4 }  { m_axi_gmem2_AWREGION USER 1 4 }  { m_axi_gmem2_AWUSER DATA 1 1 }  { m_axi_gmem2_WVALID VALID 1 1 }  { m_axi_gmem2_WREADY READY 0 1 }  { m_axi_gmem2_WDATA FIFONUM 1 512 }  { m_axi_gmem2_WSTRB STRB 1 64 }  { m_axi_gmem2_WLAST LAST 1 1 }  { m_axi_gmem2_WID ID 1 1 }  { m_axi_gmem2_WUSER DATA 1 1 }  { m_axi_gmem2_ARVALID VALID 1 1 }  { m_axi_gmem2_ARREADY READY 0 1 }  { m_axi_gmem2_ARADDR ADDR 1 64 }  { m_axi_gmem2_ARID ID 1 1 }  { m_axi_gmem2_ARLEN SIZE 1 32 }  { m_axi_gmem2_ARSIZE BURST 1 3 }  { m_axi_gmem2_ARBURST LOCK 1 2 }  { m_axi_gmem2_ARLOCK CACHE 1 2 }  { m_axi_gmem2_ARCACHE PROT 1 4 }  { m_axi_gmem2_ARPROT QOS 1 3 }  { m_axi_gmem2_ARQOS REGION 1 4 }  { m_axi_gmem2_ARREGION USER 1 4 }  { m_axi_gmem2_ARUSER DATA 1 1 }  { m_axi_gmem2_RVALID VALID 0 1 }  { m_axi_gmem2_RREADY READY 1 1 }  { m_axi_gmem2_RDATA FIFONUM 0 512 }  { m_axi_gmem2_RLAST LAST 0 1 }  { m_axi_gmem2_RID ID 0 1 }  { m_axi_gmem2_RFIFONUM LEN 0 12 }  { m_axi_gmem2_RUSER DATA 0 1 }  { m_axi_gmem2_RRESP RESP 0 2 }  { m_axi_gmem2_BVALID VALID 0 1 }  { m_axi_gmem2_BREADY READY 1 1 }  { m_axi_gmem2_BRESP RESP 0 2 }  { m_axi_gmem2_BID ID 0 1 }  { m_axi_gmem2_BUSER DATA 0 1 } } }
	weight_bank2 { ap_none {  { weight_bank2 in_data 0 64 }  { weight_bank2_ap_vld in_vld 0 1 } } }
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 512 }  { m_axi_gmem3_WSTRB STRB 1 64 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 512 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 12 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	weight_bank3 { ap_none {  { weight_bank3 in_data 0 64 }  { weight_bank3_ap_vld in_vld 0 1 } } }
	activation_q { ap_memory {  { activation_q_address0 mem_address 1 9 }  { activation_q_ce0 mem_ce 1 1 }  { activation_q_d0 mem_din 1 480 }  { activation_q_q0 mem_dout 0 480 }  { activation_q_we0 mem_we 1 1 } } }
	activation_scale { ap_memory {  { activation_scale_address0 mem_address 1 5 }  { activation_scale_ce0 mem_ce 1 1 }  { activation_scale_d0 mem_din 1 512 }  { activation_scale_q0 mem_dout 0 512 }  { activation_scale_we0 mem_we 1 1 } } }
	residual_pe0 { ap_memory {  { residual_pe0_address0 mem_address 1 6 }  { residual_pe0_ce0 mem_ce 1 1 }  { residual_pe0_d0 mem_din 1 512 }  { residual_pe0_q0 mem_dout 0 512 }  { residual_pe0_we0 mem_we 1 1 }  { residual_pe0_address1 MemPortADDR2 1 6 }  { residual_pe0_ce1 MemPortCE2 1 1 }  { residual_pe0_d1 MemPortDIN2 1 512 }  { residual_pe0_q1 mem_dout 0 512 }  { residual_pe0_we1 MemPortWE2 1 1 } } }
	residual_pe1 { ap_memory {  { residual_pe1_address0 mem_address 1 6 }  { residual_pe1_ce0 mem_ce 1 1 }  { residual_pe1_d0 mem_din 1 512 }  { residual_pe1_q0 mem_dout 0 512 }  { residual_pe1_we0 mem_we 1 1 }  { residual_pe1_address1 MemPortADDR2 1 6 }  { residual_pe1_ce1 MemPortCE2 1 1 }  { residual_pe1_d1 MemPortDIN2 1 512 }  { residual_pe1_q1 mem_dout 0 512 }  { residual_pe1_we1 MemPortWE2 1 1 } } }
	residual_pe2 { ap_memory {  { residual_pe2_address0 mem_address 1 6 }  { residual_pe2_ce0 mem_ce 1 1 }  { residual_pe2_d0 mem_din 1 512 }  { residual_pe2_q0 mem_dout 0 512 }  { residual_pe2_we0 mem_we 1 1 }  { residual_pe2_address1 MemPortADDR2 1 6 }  { residual_pe2_ce1 MemPortCE2 1 1 }  { residual_pe2_d1 MemPortDIN2 1 512 }  { residual_pe2_q1 mem_dout 0 512 }  { residual_pe2_we1 MemPortWE2 1 1 } } }
	residual_pe3 { ap_memory {  { residual_pe3_address0 mem_address 1 6 }  { residual_pe3_ce0 mem_ce 1 1 }  { residual_pe3_d0 mem_din 1 512 }  { residual_pe3_q0 mem_dout 0 512 }  { residual_pe3_we0 mem_we 1 1 }  { residual_pe3_address1 MemPortADDR2 1 6 }  { residual_pe3_ce1 MemPortCE2 1 1 }  { residual_pe3_d1 MemPortDIN2 1 512 }  { residual_pe3_q1 mem_dout 0 512 }  { residual_pe3_we1 MemPortWE2 1 1 } } }
	preprocess_mode { ap_none {  { preprocess_mode in_data 0 2 }  { preprocess_mode_ap_vld in_vld 0 1 } } }
	linear_stage0 { ap_memory {  { linear_stage0_address0 mem_address 1 9 }  { linear_stage0_ce0 mem_ce 1 1 }  { linear_stage0_d0 mem_din 1 512 }  { linear_stage0_q0 mem_dout 0 512 }  { linear_stage0_we0 mem_we 1 1 }  { linear_stage0_address1 MemPortADDR2 1 9 }  { linear_stage0_ce1 MemPortCE2 1 1 }  { linear_stage0_d1 MemPortDIN2 1 512 }  { linear_stage0_q1 mem_dout 0 512 }  { linear_stage0_we1 MemPortWE2 1 1 } } }
	linear_stage1 { ap_memory {  { linear_stage1_address0 mem_address 1 9 }  { linear_stage1_ce0 mem_ce 1 1 }  { linear_stage1_d0 mem_din 1 512 }  { linear_stage1_q0 mem_dout 0 512 }  { linear_stage1_we0 mem_we 1 1 }  { linear_stage1_address1 MemPortADDR2 1 9 }  { linear_stage1_ce1 MemPortCE2 1 1 }  { linear_stage1_d1 MemPortDIN2 1 512 }  { linear_stage1_q1 mem_dout 0 512 }  { linear_stage1_we1 MemPortWE2 1 1 } } }
	linear_stage2 { ap_memory {  { linear_stage2_address0 mem_address 1 9 }  { linear_stage2_ce0 mem_ce 1 1 }  { linear_stage2_d0 mem_din 1 512 }  { linear_stage2_q0 mem_dout 0 512 }  { linear_stage2_we0 mem_we 1 1 }  { linear_stage2_address1 MemPortADDR2 1 9 }  { linear_stage2_ce1 MemPortCE2 1 1 }  { linear_stage2_d1 MemPortDIN2 1 512 }  { linear_stage2_q1 mem_dout 0 512 }  { linear_stage2_we1 MemPortWE2 1 1 } } }
	linear_stage3 { ap_memory {  { linear_stage3_address0 mem_address 1 9 }  { linear_stage3_ce0 mem_ce 1 1 }  { linear_stage3_d0 mem_din 1 512 }  { linear_stage3_q0 mem_dout 0 512 }  { linear_stage3_we0 mem_we 1 1 }  { linear_stage3_address1 MemPortADDR2 1 9 }  { linear_stage3_ce1 MemPortCE2 1 1 }  { linear_stage3_d1 MemPortDIN2 1 512 }  { linear_stage3_q1 mem_dout 0 512 }  { linear_stage3_we1 MemPortWE2 1 1 } } }
	q_pe0 { ap_memory {  { q_pe0_address0 mem_address 1 6 }  { q_pe0_ce0 mem_ce 1 1 }  { q_pe0_d0 mem_din 1 512 }  { q_pe0_q0 mem_dout 0 512 }  { q_pe0_we0 mem_we 1 1 } } }
	q_pe1 { ap_memory {  { q_pe1_address0 mem_address 1 6 }  { q_pe1_ce0 mem_ce 1 1 }  { q_pe1_d0 mem_din 1 512 }  { q_pe1_q0 mem_dout 0 512 }  { q_pe1_we0 mem_we 1 1 } } }
	q_pe2 { ap_memory {  { q_pe2_address0 mem_address 1 6 }  { q_pe2_ce0 mem_ce 1 1 }  { q_pe2_d0 mem_din 1 512 }  { q_pe2_q0 mem_dout 0 512 }  { q_pe2_we0 mem_we 1 1 } } }
	q_pe3 { ap_memory {  { q_pe3_address0 mem_address 1 6 }  { q_pe3_ce0 mem_ce 1 1 }  { q_pe3_d0 mem_din 1 512 }  { q_pe3_q0 mem_dout 0 512 }  { q_pe3_we0 mem_we 1 1 } } }
	k_pe0 { ap_memory {  { k_pe0_address0 mem_address 1 6 }  { k_pe0_ce0 mem_ce 1 1 }  { k_pe0_d0 mem_din 1 512 }  { k_pe0_q0 mem_dout 0 512 }  { k_pe0_we0 mem_we 1 1 } } }
	k_pe1 { ap_memory {  { k_pe1_address0 mem_address 1 6 }  { k_pe1_ce0 mem_ce 1 1 }  { k_pe1_d0 mem_din 1 512 }  { k_pe1_q0 mem_dout 0 512 }  { k_pe1_we0 mem_we 1 1 } } }
	k_pe2 { ap_memory {  { k_pe2_address0 mem_address 1 6 }  { k_pe2_ce0 mem_ce 1 1 }  { k_pe2_d0 mem_din 1 512 }  { k_pe2_q0 mem_dout 0 512 }  { k_pe2_we0 mem_we 1 1 } } }
	k_pe3 { ap_memory {  { k_pe3_address0 mem_address 1 6 }  { k_pe3_ce0 mem_ce 1 1 }  { k_pe3_d0 mem_din 1 512 }  { k_pe3_q0 mem_dout 0 512 }  { k_pe3_we0 mem_we 1 1 } } }
	v_pe0 { ap_memory {  { v_pe0_address0 mem_address 1 6 }  { v_pe0_ce0 mem_ce 1 1 }  { v_pe0_d0 mem_din 1 512 }  { v_pe0_q0 mem_dout 0 512 }  { v_pe0_we0 mem_we 1 1 } } }
	v_pe1 { ap_memory {  { v_pe1_address0 mem_address 1 6 }  { v_pe1_ce0 mem_ce 1 1 }  { v_pe1_d0 mem_din 1 512 }  { v_pe1_q0 mem_dout 0 512 }  { v_pe1_we0 mem_we 1 1 } } }
	v_pe2 { ap_memory {  { v_pe2_address0 mem_address 1 6 }  { v_pe2_ce0 mem_ce 1 1 }  { v_pe2_d0 mem_din 1 512 }  { v_pe2_q0 mem_dout 0 512 }  { v_pe2_we0 mem_we 1 1 } } }
	v_pe3 { ap_memory {  { v_pe3_address0 mem_address 1 6 }  { v_pe3_ce0 mem_ce 1 1 }  { v_pe3_d0 mem_din 1 512 }  { v_pe3_q0 mem_dout 0 512 }  { v_pe3_we0 mem_we 1 1 } } }
	gate_pe0 { ap_memory {  { gate_pe0_address0 mem_address 1 8 }  { gate_pe0_ce0 mem_ce 1 1 }  { gate_pe0_d0 mem_din 1 512 }  { gate_pe0_q0 mem_dout 0 512 }  { gate_pe0_we0 mem_we 1 1 } } }
	gate_pe1 { ap_memory {  { gate_pe1_address0 mem_address 1 8 }  { gate_pe1_ce0 mem_ce 1 1 }  { gate_pe1_d0 mem_din 1 512 }  { gate_pe1_q0 mem_dout 0 512 }  { gate_pe1_we0 mem_we 1 1 } } }
	gate_pe2 { ap_memory {  { gate_pe2_address0 mem_address 1 8 }  { gate_pe2_ce0 mem_ce 1 1 }  { gate_pe2_d0 mem_din 1 512 }  { gate_pe2_q0 mem_dout 0 512 }  { gate_pe2_we0 mem_we 1 1 } } }
	gate_pe3 { ap_memory {  { gate_pe3_address0 mem_address 1 8 }  { gate_pe3_ce0 mem_ce 1 1 }  { gate_pe3_d0 mem_din 1 512 }  { gate_pe3_q0 mem_dout 0 512 }  { gate_pe3_we0 mem_we 1 1 } } }
	up_pe0 { ap_memory {  { up_pe0_address0 mem_address 1 8 }  { up_pe0_ce0 mem_ce 1 1 }  { up_pe0_d0 mem_din 1 512 }  { up_pe0_q0 mem_dout 0 512 }  { up_pe0_we0 mem_we 1 1 } } }
	up_pe1 { ap_memory {  { up_pe1_address0 mem_address 1 8 }  { up_pe1_ce0 mem_ce 1 1 }  { up_pe1_d0 mem_din 1 512 }  { up_pe1_q0 mem_dout 0 512 }  { up_pe1_we0 mem_we 1 1 } } }
	up_pe2 { ap_memory {  { up_pe2_address0 mem_address 1 8 }  { up_pe2_ce0 mem_ce 1 1 }  { up_pe2_d0 mem_din 1 512 }  { up_pe2_q0 mem_dout 0 512 }  { up_pe2_we0 mem_we 1 1 } } }
	up_pe3 { ap_memory {  { up_pe3_address0 mem_address 1 8 }  { up_pe3_ce0 mem_ce 1 1 }  { up_pe3_d0 mem_din 1 512 }  { up_pe3_q0 mem_dout 0 512 }  { up_pe3_we0 mem_we 1 1 } } }
	logits_pe0 { ap_none {  { logits_pe0 in_data 0 64 }  { logits_pe0_ap_vld in_vld 0 1 } } }
	logits_pe1 { ap_none {  { logits_pe1 in_data 0 64 }  { logits_pe1_ap_vld in_vld 0 1 } } }
	logits_pe2 { ap_none {  { logits_pe2 in_data 0 64 }  { logits_pe2_ap_vld in_vld 0 1 } } }
	logits_pe3 { ap_none {  { logits_pe3 in_data 0 64 }  { logits_pe3_ap_vld in_vld 0 1 } } }
	controller_run_rmsnorm { ap_vld {  { controller_run_rmsnorm out_data 1 1 }  { controller_run_rmsnorm_ap_vld out_vld 1 1 } } }
	controller_rmsnorm_mode { ap_vld {  { controller_rmsnorm_mode out_data 1 2 }  { controller_rmsnorm_mode_ap_vld out_vld 1 1 } } }
	p_read { ap_none {  { p_read in_data 0 1 }  { p_read_ap_vld in_vld 0 1 } } }
	controller_run_linear_out { ap_vld {  { controller_run_linear_out out_data 1 1 }  { controller_run_linear_out_ap_vld out_vld 1 1 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 3 }  { p_read1_ap_vld in_vld 0 1 } } }
	controller_linear_mode_out { ap_vld {  { controller_linear_mode_out out_data 1 3 }  { controller_linear_mode_out_ap_vld out_vld 1 1 } } }
	controller_run_rope { ap_vld {  { controller_run_rope out_data 1 1 }  { controller_run_rope_ap_vld out_vld 1 1 } } }
	controller_run_swiglu { ap_vld {  { controller_run_swiglu out_data 1 1 }  { controller_run_swiglu_ap_vld out_vld 1 1 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 6 }  { p_read2_ap_vld in_vld 0 1 } } }
	controller_layer_index_out { ap_vld {  { controller_layer_index_out out_data 1 6 }  { controller_layer_index_out_ap_vld out_vld 1 1 } } }
	controller_exit { ap_vld {  { controller_exit out_data 1 1 }  { controller_exit_ap_vld out_vld 1 1 } } }
	idx { ap_none {  { idx in_data 0 13 }  { idx_ap_vld in_vld 0 1 } } }
	controller_weight_word_offset_constprop { ap_ovld {  { controller_weight_word_offset_constprop_i in_data 0 24 }  { controller_weight_word_offset_constprop_o out_data 1 24 }  { controller_weight_word_offset_constprop_i_ap_vld in_vld 0 1 }  { controller_weight_word_offset_constprop_o_ap_vld out_vld 1 1 } } }
	controller_weight_scale_word_offset_constprop { ap_ovld {  { controller_weight_scale_word_offset_constprop_i in_data 0 11 }  { controller_weight_scale_word_offset_constprop_o out_data 1 11 }  { controller_weight_scale_word_offset_constprop_i_ap_vld in_vld 0 1 }  { controller_weight_scale_word_offset_constprop_o_ap_vld out_vld 1 1 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_d0 mem_din 1 512 }  { model_norm_cache0_q0 mem_dout 0 512 }  { model_norm_cache0_we0 mem_we 1 1 } } }
	model_norm_cache1 { ap_memory {  { model_norm_cache1_address0 mem_address 1 13 }  { model_norm_cache1_ce0 mem_ce 1 1 }  { model_norm_cache1_d0 mem_din 1 512 }  { model_norm_cache1_q0 mem_dout 0 512 }  { model_norm_cache1_we0 mem_we 1 1 } } }
	model_norm_cache2 { ap_memory {  { model_norm_cache2_address0 mem_address 1 13 }  { model_norm_cache2_ce0 mem_ce 1 1 }  { model_norm_cache2_d0 mem_din 1 512 }  { model_norm_cache2_q0 mem_dout 0 512 }  { model_norm_cache2_we0 mem_we 1 1 } } }
	model_norm_cache3 { ap_memory {  { model_norm_cache3_address0 mem_address 1 13 }  { model_norm_cache3_ce0 mem_ce 1 1 }  { model_norm_cache3_d0 mem_din 1 512 }  { model_norm_cache3_q0 mem_dout 0 512 }  { model_norm_cache3_we0 mem_we 1 1 } } }
	model_scale_cache0 { ap_memory {  { model_scale_cache0_address0 mem_address 1 11 }  { model_scale_cache0_ce0 mem_ce 1 1 }  { model_scale_cache0_d0 mem_din 1 512 }  { model_scale_cache0_q0 mem_dout 0 512 }  { model_scale_cache0_we0 mem_we 1 1 } } }
	model_scale_cache1 { ap_memory {  { model_scale_cache1_address0 mem_address 1 11 }  { model_scale_cache1_ce0 mem_ce 1 1 }  { model_scale_cache1_d0 mem_din 1 512 }  { model_scale_cache1_q0 mem_dout 0 512 }  { model_scale_cache1_we0 mem_we 1 1 } } }
	model_scale_cache2 { ap_memory {  { model_scale_cache2_address0 mem_address 1 11 }  { model_scale_cache2_ce0 mem_ce 1 1 }  { model_scale_cache2_d0 mem_din 1 512 }  { model_scale_cache2_q0 mem_dout 0 512 }  { model_scale_cache2_we0 mem_we 1 1 } } }
	model_scale_cache3 { ap_memory {  { model_scale_cache3_address0 mem_address 1 11 }  { model_scale_cache3_ce0 mem_ce 1 1 }  { model_scale_cache3_d0 mem_din 1 512 }  { model_scale_cache3_q0 mem_dout 0 512 }  { model_scale_cache3_we0 mem_we 1 1 } } }
}
