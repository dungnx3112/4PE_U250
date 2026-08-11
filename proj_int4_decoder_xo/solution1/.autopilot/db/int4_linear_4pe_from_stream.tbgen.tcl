set moduleName int4_linear_4pe_from_stream
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {int4_linear_4pe_from_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 512 regular {axi_master 0}  }
	{ weight_bank0 int 64 regular  }
	{ gmem1 int 512 regular {axi_master 0}  }
	{ weight_bank1 int 64 regular  }
	{ gmem2 int 512 regular {axi_master 0}  }
	{ weight_bank2 int 64 regular  }
	{ gmem3 int 512 regular {axi_master 0}  }
	{ weight_bank3 int 64 regular  }
	{ activation_q int 480 regular {array 344 { 2 } 1 1 }  }
	{ activation_scale int 512 regular {array 22 { 2 } 1 1 }  }
	{ quantized_stream_i int 480 regular {fifo 0 volatile }  }
	{ scale_stream_i int 32 regular {fifo 0 volatile }  }
	{ p_read int 1 regular  }
	{ output_pe0 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ output_pe1 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ output_pe2 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ output_pe3 int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ controller_run_rmsnorm int 1 regular {pointer 1}  }
	{ controller_rmsnorm_mode int 2 regular {pointer 1}  }
	{ p_read1 int 1 regular  }
	{ controller_run_linear_out int 1 regular {pointer 1}  }
	{ p_read2 int 3 regular  }
	{ controller_linear_mode_out int 3 regular {pointer 1}  }
	{ controller_run_rope int 1 regular {pointer 1}  }
	{ controller_run_swiglu int 1 regular {pointer 1}  }
	{ p_read3 int 6 regular  }
	{ controller_layer_index_out int 6 regular {pointer 1}  }
	{ controller_exit int 1 regular {pointer 1}  }
	{ idx int 25 regular  }
	{ idx4 int 11 regular  }
	{ controller_weight_scale_word_offset_constprop_out int 11 regular {pointer 1}  }
	{ controller_weight_word_offset_constprop_out int 24 regular {pointer 1}  }
	{ controller_weight_word_offset_constprop int 24 regular {pointer 0} {global 0}  }
	{ controller_weight_scale_word_offset_constprop int 11 regular {pointer 0} {global 0}  }
	{ model_scale_cache0 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache1 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache2 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
	{ model_scale_cache3 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank0","offset": { "type": "dynamic","port_name": "model_bank0","bundle": "control"},"direction": "READONLY"},{"cName": "rope_lut_ddr","offset": { "type": "dynamic","port_name": "rope_lut_ddr","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe0","offset": { "type": "dynamic","port_name": "residual_pe0","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe0","offset": { "type": "dynamic","port_name": "logits_pe0","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe0","offset": { "type": "dynamic","port_name": "kv_cache_pe0","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank1","offset": { "type": "dynamic","port_name": "model_bank1","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe1","offset": { "type": "dynamic","port_name": "residual_pe1","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe1","offset": { "type": "dynamic","port_name": "logits_pe1","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe1","offset": { "type": "dynamic","port_name": "kv_cache_pe1","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank2","offset": { "type": "dynamic","port_name": "model_bank2","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe2","offset": { "type": "dynamic","port_name": "residual_pe2","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe2","offset": { "type": "dynamic","port_name": "logits_pe2","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe2","offset": { "type": "dynamic","port_name": "kv_cache_pe2","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank3","offset": { "type": "dynamic","port_name": "model_bank3","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe3","offset": { "type": "dynamic","port_name": "residual_pe3","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe3","offset": { "type": "dynamic","port_name": "logits_pe3","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe3","offset": { "type": "dynamic","port_name": "kv_cache_pe3","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activation_q", "interface" : "memory", "bitwidth" : 480, "direction" : "READWRITE"} , 
 	{ "Name" : "activation_scale", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "quantized_stream_i", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_stream_i", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "output_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "output_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "output_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "output_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "controller_run_rmsnorm", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_rmsnorm_mode", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_linear_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "controller_linear_mode_out", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_rope", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_swiglu", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "controller_layer_index_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_exit", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 25, "direction" : "READONLY"} , 
 	{ "Name" : "idx4", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "controller_weight_scale_word_offset_constprop_out", "interface" : "wire", "bitwidth" : 11, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_weight_word_offset_constprop_out", "interface" : "wire", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_weight_word_offset_constprop", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "controller_weight_scale_word_offset_constprop", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_scale_cache3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 283
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
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
	{ activation_q_we0 sc_out sc_logic 1 signal 8 } 
	{ activation_q_d0 sc_out sc_lv 480 signal 8 } 
	{ activation_q_q0 sc_in sc_lv 480 signal 8 } 
	{ activation_scale_address0 sc_out sc_lv 5 signal 9 } 
	{ activation_scale_ce0 sc_out sc_logic 1 signal 9 } 
	{ activation_scale_we0 sc_out sc_logic 1 signal 9 } 
	{ activation_scale_d0 sc_out sc_lv 512 signal 9 } 
	{ activation_scale_q0 sc_in sc_lv 512 signal 9 } 
	{ quantized_stream_i_dout sc_in sc_lv 480 signal 10 } 
	{ quantized_stream_i_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ quantized_stream_i_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ quantized_stream_i_empty_n sc_in sc_logic 1 signal 10 } 
	{ quantized_stream_i_read sc_out sc_logic 1 signal 10 } 
	{ scale_stream_i_dout sc_in sc_lv 32 signal 11 } 
	{ scale_stream_i_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ scale_stream_i_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ scale_stream_i_empty_n sc_in sc_logic 1 signal 11 } 
	{ scale_stream_i_read sc_out sc_logic 1 signal 11 } 
	{ p_read sc_in sc_lv 1 signal 12 } 
	{ output_pe0_address0 sc_out sc_lv 9 signal 13 } 
	{ output_pe0_ce0 sc_out sc_logic 1 signal 13 } 
	{ output_pe0_q0 sc_in sc_lv 512 signal 13 } 
	{ output_pe0_address1 sc_out sc_lv 9 signal 13 } 
	{ output_pe0_ce1 sc_out sc_logic 1 signal 13 } 
	{ output_pe0_we1 sc_out sc_logic 1 signal 13 } 
	{ output_pe0_d1 sc_out sc_lv 512 signal 13 } 
	{ output_pe1_address0 sc_out sc_lv 9 signal 14 } 
	{ output_pe1_ce0 sc_out sc_logic 1 signal 14 } 
	{ output_pe1_q0 sc_in sc_lv 512 signal 14 } 
	{ output_pe1_address1 sc_out sc_lv 9 signal 14 } 
	{ output_pe1_ce1 sc_out sc_logic 1 signal 14 } 
	{ output_pe1_we1 sc_out sc_logic 1 signal 14 } 
	{ output_pe1_d1 sc_out sc_lv 512 signal 14 } 
	{ output_pe2_address0 sc_out sc_lv 9 signal 15 } 
	{ output_pe2_ce0 sc_out sc_logic 1 signal 15 } 
	{ output_pe2_q0 sc_in sc_lv 512 signal 15 } 
	{ output_pe2_address1 sc_out sc_lv 9 signal 15 } 
	{ output_pe2_ce1 sc_out sc_logic 1 signal 15 } 
	{ output_pe2_we1 sc_out sc_logic 1 signal 15 } 
	{ output_pe2_d1 sc_out sc_lv 512 signal 15 } 
	{ output_pe3_address0 sc_out sc_lv 9 signal 16 } 
	{ output_pe3_ce0 sc_out sc_logic 1 signal 16 } 
	{ output_pe3_q0 sc_in sc_lv 512 signal 16 } 
	{ output_pe3_address1 sc_out sc_lv 9 signal 16 } 
	{ output_pe3_ce1 sc_out sc_logic 1 signal 16 } 
	{ output_pe3_we1 sc_out sc_logic 1 signal 16 } 
	{ output_pe3_d1 sc_out sc_lv 512 signal 16 } 
	{ controller_run_rmsnorm sc_out sc_lv 1 signal 17 } 
	{ controller_run_rmsnorm_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ controller_rmsnorm_mode sc_out sc_lv 2 signal 18 } 
	{ controller_rmsnorm_mode_ap_vld sc_out sc_logic 1 outvld 18 } 
	{ p_read1 sc_in sc_lv 1 signal 19 } 
	{ controller_run_linear_out sc_out sc_lv 1 signal 20 } 
	{ controller_run_linear_out_ap_vld sc_out sc_logic 1 outvld 20 } 
	{ p_read2 sc_in sc_lv 3 signal 21 } 
	{ controller_linear_mode_out sc_out sc_lv 3 signal 22 } 
	{ controller_linear_mode_out_ap_vld sc_out sc_logic 1 outvld 22 } 
	{ controller_run_rope sc_out sc_lv 1 signal 23 } 
	{ controller_run_rope_ap_vld sc_out sc_logic 1 outvld 23 } 
	{ controller_run_swiglu sc_out sc_lv 1 signal 24 } 
	{ controller_run_swiglu_ap_vld sc_out sc_logic 1 outvld 24 } 
	{ p_read3 sc_in sc_lv 6 signal 25 } 
	{ controller_layer_index_out sc_out sc_lv 6 signal 26 } 
	{ controller_layer_index_out_ap_vld sc_out sc_logic 1 outvld 26 } 
	{ controller_exit sc_out sc_lv 1 signal 27 } 
	{ controller_exit_ap_vld sc_out sc_logic 1 outvld 27 } 
	{ idx sc_in sc_lv 25 signal 28 } 
	{ idx4 sc_in sc_lv 11 signal 29 } 
	{ controller_weight_scale_word_offset_constprop_out sc_out sc_lv 11 signal 30 } 
	{ controller_weight_scale_word_offset_constprop_out_ap_vld sc_out sc_logic 1 outvld 30 } 
	{ controller_weight_word_offset_constprop_out sc_out sc_lv 24 signal 31 } 
	{ controller_weight_word_offset_constprop_out_ap_vld sc_out sc_logic 1 outvld 31 } 
	{ controller_weight_word_offset_constprop sc_in sc_lv 24 signal 32 } 
	{ controller_weight_scale_word_offset_constprop sc_in sc_lv 11 signal 33 } 
	{ model_scale_cache0_address0 sc_out sc_lv 11 signal 34 } 
	{ model_scale_cache0_ce0 sc_out sc_logic 1 signal 34 } 
	{ model_scale_cache0_q0 sc_in sc_lv 512 signal 34 } 
	{ model_scale_cache1_address0 sc_out sc_lv 11 signal 35 } 
	{ model_scale_cache1_ce0 sc_out sc_logic 1 signal 35 } 
	{ model_scale_cache1_q0 sc_in sc_lv 512 signal 35 } 
	{ model_scale_cache2_address0 sc_out sc_lv 11 signal 36 } 
	{ model_scale_cache2_ce0 sc_out sc_logic 1 signal 36 } 
	{ model_scale_cache2_q0 sc_in sc_lv 512 signal 36 } 
	{ model_scale_cache3_address0 sc_out sc_lv 11 signal 37 } 
	{ model_scale_cache3_ce0 sc_out sc_logic 1 signal 37 } 
	{ model_scale_cache3_q0 sc_in sc_lv 512 signal 37 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "activation_q_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_q", "role": "we0" }} , 
 	{ "name": "activation_q_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_q", "role": "d0" }} , 
 	{ "name": "activation_q_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_q", "role": "q0" }} , 
 	{ "name": "activation_scale_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "activation_scale", "role": "address0" }} , 
 	{ "name": "activation_scale_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "ce0" }} , 
 	{ "name": "activation_scale_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "we0" }} , 
 	{ "name": "activation_scale_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "activation_scale", "role": "d0" }} , 
 	{ "name": "activation_scale_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "activation_scale", "role": "q0" }} , 
 	{ "name": "quantized_stream_i_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream_i", "role": "dout" }} , 
 	{ "name": "quantized_stream_i_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream_i", "role": "num_data_valid" }} , 
 	{ "name": "quantized_stream_i_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream_i", "role": "fifo_cap" }} , 
 	{ "name": "quantized_stream_i_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream_i", "role": "empty_n" }} , 
 	{ "name": "quantized_stream_i_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream_i", "role": "read" }} , 
 	{ "name": "scale_stream_i_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream_i", "role": "dout" }} , 
 	{ "name": "scale_stream_i_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream_i", "role": "num_data_valid" }} , 
 	{ "name": "scale_stream_i_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream_i", "role": "fifo_cap" }} , 
 	{ "name": "scale_stream_i_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream_i", "role": "empty_n" }} , 
 	{ "name": "scale_stream_i_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream_i", "role": "read" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "output_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe0", "role": "address0" }} , 
 	{ "name": "output_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe0", "role": "ce0" }} , 
 	{ "name": "output_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe0", "role": "q0" }} , 
 	{ "name": "output_pe0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe0", "role": "address1" }} , 
 	{ "name": "output_pe0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe0", "role": "ce1" }} , 
 	{ "name": "output_pe0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe0", "role": "we1" }} , 
 	{ "name": "output_pe0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe0", "role": "d1" }} , 
 	{ "name": "output_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe1", "role": "address0" }} , 
 	{ "name": "output_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe1", "role": "ce0" }} , 
 	{ "name": "output_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe1", "role": "q0" }} , 
 	{ "name": "output_pe1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe1", "role": "address1" }} , 
 	{ "name": "output_pe1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe1", "role": "ce1" }} , 
 	{ "name": "output_pe1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe1", "role": "we1" }} , 
 	{ "name": "output_pe1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe1", "role": "d1" }} , 
 	{ "name": "output_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe2", "role": "address0" }} , 
 	{ "name": "output_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe2", "role": "ce0" }} , 
 	{ "name": "output_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe2", "role": "q0" }} , 
 	{ "name": "output_pe2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe2", "role": "address1" }} , 
 	{ "name": "output_pe2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe2", "role": "ce1" }} , 
 	{ "name": "output_pe2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe2", "role": "we1" }} , 
 	{ "name": "output_pe2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe2", "role": "d1" }} , 
 	{ "name": "output_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe3", "role": "address0" }} , 
 	{ "name": "output_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe3", "role": "ce0" }} , 
 	{ "name": "output_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe3", "role": "q0" }} , 
 	{ "name": "output_pe3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_pe3", "role": "address1" }} , 
 	{ "name": "output_pe3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe3", "role": "ce1" }} , 
 	{ "name": "output_pe3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_pe3", "role": "we1" }} , 
 	{ "name": "output_pe3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_pe3", "role": "d1" }} , 
 	{ "name": "controller_run_rmsnorm", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rmsnorm", "role": "default" }} , 
 	{ "name": "controller_run_rmsnorm_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rmsnorm", "role": "ap_vld" }} , 
 	{ "name": "controller_rmsnorm_mode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "controller_rmsnorm_mode", "role": "default" }} , 
 	{ "name": "controller_rmsnorm_mode_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_rmsnorm_mode", "role": "ap_vld" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "controller_run_linear_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_out", "role": "default" }} , 
 	{ "name": "controller_run_linear_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_linear_out", "role": "ap_vld" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "controller_linear_mode_out", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_out", "role": "default" }} , 
 	{ "name": "controller_linear_mode_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_linear_mode_out", "role": "ap_vld" }} , 
 	{ "name": "controller_run_rope", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rope", "role": "default" }} , 
 	{ "name": "controller_run_rope_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rope", "role": "ap_vld" }} , 
 	{ "name": "controller_run_swiglu", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_swiglu", "role": "default" }} , 
 	{ "name": "controller_run_swiglu_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_swiglu", "role": "ap_vld" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "controller_layer_index_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "controller_layer_index_out", "role": "default" }} , 
 	{ "name": "controller_layer_index_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_layer_index_out", "role": "ap_vld" }} , 
 	{ "name": "controller_exit", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_exit", "role": "default" }} , 
 	{ "name": "controller_exit_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_exit", "role": "ap_vld" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":25, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx4", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "idx4", "role": "default" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_out", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop_out", "role": "default" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_scale_word_offset_constprop_out", "role": "ap_vld" }} , 
 	{ "name": "controller_weight_word_offset_constprop_out", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop_out", "role": "default" }} , 
 	{ "name": "controller_weight_word_offset_constprop_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_word_offset_constprop_out", "role": "ap_vld" }} , 
 	{ "name": "controller_weight_word_offset_constprop", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "default" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "default" }} , 
 	{ "name": "model_scale_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "address0" }} , 
 	{ "name": "model_scale_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "ce0" }} , 
 	{ "name": "model_scale_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache0", "role": "q0" }} , 
 	{ "name": "model_scale_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "address0" }} , 
 	{ "name": "model_scale_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "ce0" }} , 
 	{ "name": "model_scale_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "q0" }} , 
 	{ "name": "model_scale_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "address0" }} , 
 	{ "name": "model_scale_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "ce0" }} , 
 	{ "name": "model_scale_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "q0" }} , 
 	{ "name": "model_scale_cache3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "address0" }} , 
 	{ "name": "model_scale_cache3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "ce0" }} , 
 	{ "name": "model_scale_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache3", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
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
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572", "Parent" : "0", "Child" : ["2", "3", "6", "202", "398", "594", "790", "791", "792", "793", "794", "795", "796", "797", "798", "799", "800", "801"],
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
			{"ID" : "2", "Name" : "int4_broadcast_linear_commands_U0"},
			{"ID" : "3", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "6", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "202", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "398", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "594", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"OutputProcess" : [
			{"ID" : "3", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "6", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "202", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "398", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "594", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "398", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "594", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "packed_scales"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "scale_stream"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "398", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "594", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "output_mem"}]},
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
					{"ID" : "6", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "202", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "398", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "594", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_broadcast_linear_commands_U0", "Parent" : "1",
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
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6","8"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202","204"], "DependentChan" : "791", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["398","400"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["594","596"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_fxp", "Type" : "None", "Direction" : "I"},
			{"Name" : "fuse_residual", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0", "Parent" : "1", "Child" : ["4"],
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
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6","12"], "DependentChan" : "794", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202","208"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["398","404"], "DependentChan" : "796", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["594","600"], "DependentChan" : "797", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["6","12"], "DependentChan" : "798", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["202","208"], "DependentChan" : "799", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["398","404"], "DependentChan" : "800", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["594","600"], "DependentChan" : "801", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Parent" : "3", "Child" : ["5"],
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
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0", "Parent" : "1", "Child" : ["7", "8", "10", "12", "20", "152", "173", "176", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201"],
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
			{"ID" : "7", "Name" : "entry_proc56_U0"},
			{"ID" : "8", "Name" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0"},
			{"ID" : "10", "Name" : "int4_stream_pe_inputs_U0"},
			{"ID" : "152", "Name" : "int4_dequantize_final_blocks_U0"},
			{"ID" : "176", "Name" : "int4_write_outputs_9_U0"}],
		"OutputProcess" : [
			{"ID" : "176", "Name" : "int4_write_outputs_9_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "int4_stream_pe_inputs_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "794", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "quantized_pe0"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "798", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "activation_scale_pe0"}]},
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Port" : "linear_command_pe0"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "176", "SubInstance" : "int4_write_outputs_9_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "152", "SubInstance" : "int4_dequantize_final_blocks_U0", "Port" : "model_scale_cache0"}]}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.entry_proc56_U0", "Parent" : "6",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "184", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Parent" : "6", "Child" : ["9"],
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
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0.mul_6ns_6ns_12_1_1_U1535", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0", "Parent" : "6", "Child" : ["11"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "190", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "185", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0.flow_control_loop_pipe_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0", "Parent" : "6", "Child" : ["13", "14", "15", "17", "19"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "794", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "798", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "191", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "192", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "189", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "188", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "193", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "194", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "13", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.activation_cache_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.scale_cache_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "12", "Child" : ["16"],
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
	{"ID" : "16", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Parent" : "12", "Child" : ["18"],
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
	{"ID" : "18", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.mul_6ns_9ns_15_1_1_U1554", "Parent" : "12"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0", "Parent" : "6", "Child" : ["21", "151"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["10"], "DependentChan" : "190", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "191", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "195", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "194", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "193", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "196", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "197", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Parent" : "20", "Child" : ["22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150"],
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
	{"ID" : "22", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1566", "Parent" : "21"},
	{"ID" : "23", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1567", "Parent" : "21"},
	{"ID" : "24", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1568", "Parent" : "21"},
	{"ID" : "25", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1569", "Parent" : "21"},
	{"ID" : "26", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1570", "Parent" : "21"},
	{"ID" : "27", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1571", "Parent" : "21"},
	{"ID" : "28", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1572", "Parent" : "21"},
	{"ID" : "29", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1573", "Parent" : "21"},
	{"ID" : "30", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1574", "Parent" : "21"},
	{"ID" : "31", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1575", "Parent" : "21"},
	{"ID" : "32", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1576", "Parent" : "21"},
	{"ID" : "33", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1577", "Parent" : "21"},
	{"ID" : "34", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1578", "Parent" : "21"},
	{"ID" : "35", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1579", "Parent" : "21"},
	{"ID" : "36", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1580", "Parent" : "21"},
	{"ID" : "37", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1581", "Parent" : "21"},
	{"ID" : "38", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1582", "Parent" : "21"},
	{"ID" : "39", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1583", "Parent" : "21"},
	{"ID" : "40", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1584", "Parent" : "21"},
	{"ID" : "41", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1585", "Parent" : "21"},
	{"ID" : "42", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1586", "Parent" : "21"},
	{"ID" : "43", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1587", "Parent" : "21"},
	{"ID" : "44", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1588", "Parent" : "21"},
	{"ID" : "45", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1589", "Parent" : "21"},
	{"ID" : "46", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1590", "Parent" : "21"},
	{"ID" : "47", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1591", "Parent" : "21"},
	{"ID" : "48", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1592", "Parent" : "21"},
	{"ID" : "49", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1593", "Parent" : "21"},
	{"ID" : "50", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1594", "Parent" : "21"},
	{"ID" : "51", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1595", "Parent" : "21"},
	{"ID" : "52", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1596", "Parent" : "21"},
	{"ID" : "53", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1597", "Parent" : "21"},
	{"ID" : "54", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1598", "Parent" : "21"},
	{"ID" : "55", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1599", "Parent" : "21"},
	{"ID" : "56", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1600", "Parent" : "21"},
	{"ID" : "57", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1601", "Parent" : "21"},
	{"ID" : "58", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1602", "Parent" : "21"},
	{"ID" : "59", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1603", "Parent" : "21"},
	{"ID" : "60", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1604", "Parent" : "21"},
	{"ID" : "61", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1605", "Parent" : "21"},
	{"ID" : "62", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1606", "Parent" : "21"},
	{"ID" : "63", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1607", "Parent" : "21"},
	{"ID" : "64", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1608", "Parent" : "21"},
	{"ID" : "65", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1609", "Parent" : "21"},
	{"ID" : "66", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1610", "Parent" : "21"},
	{"ID" : "67", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1611", "Parent" : "21"},
	{"ID" : "68", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1612", "Parent" : "21"},
	{"ID" : "69", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1613", "Parent" : "21"},
	{"ID" : "70", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1614", "Parent" : "21"},
	{"ID" : "71", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1615", "Parent" : "21"},
	{"ID" : "72", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1616", "Parent" : "21"},
	{"ID" : "73", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1617", "Parent" : "21"},
	{"ID" : "74", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1618", "Parent" : "21"},
	{"ID" : "75", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1619", "Parent" : "21"},
	{"ID" : "76", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1620", "Parent" : "21"},
	{"ID" : "77", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1621", "Parent" : "21"},
	{"ID" : "78", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1622", "Parent" : "21"},
	{"ID" : "79", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1623", "Parent" : "21"},
	{"ID" : "80", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1624", "Parent" : "21"},
	{"ID" : "81", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1625", "Parent" : "21"},
	{"ID" : "82", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1626", "Parent" : "21"},
	{"ID" : "83", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1627", "Parent" : "21"},
	{"ID" : "84", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1628", "Parent" : "21"},
	{"ID" : "85", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1629", "Parent" : "21"},
	{"ID" : "86", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1630", "Parent" : "21"},
	{"ID" : "87", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1631", "Parent" : "21"},
	{"ID" : "88", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1632", "Parent" : "21"},
	{"ID" : "89", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1633", "Parent" : "21"},
	{"ID" : "90", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1634", "Parent" : "21"},
	{"ID" : "91", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1635", "Parent" : "21"},
	{"ID" : "92", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1636", "Parent" : "21"},
	{"ID" : "93", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1637", "Parent" : "21"},
	{"ID" : "94", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1638", "Parent" : "21"},
	{"ID" : "95", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1639", "Parent" : "21"},
	{"ID" : "96", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1640", "Parent" : "21"},
	{"ID" : "97", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1641", "Parent" : "21"},
	{"ID" : "98", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1642", "Parent" : "21"},
	{"ID" : "99", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1643", "Parent" : "21"},
	{"ID" : "100", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1644", "Parent" : "21"},
	{"ID" : "101", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1645", "Parent" : "21"},
	{"ID" : "102", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1646", "Parent" : "21"},
	{"ID" : "103", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1647", "Parent" : "21"},
	{"ID" : "104", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1648", "Parent" : "21"},
	{"ID" : "105", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1649", "Parent" : "21"},
	{"ID" : "106", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1650", "Parent" : "21"},
	{"ID" : "107", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1651", "Parent" : "21"},
	{"ID" : "108", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1652", "Parent" : "21"},
	{"ID" : "109", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1653", "Parent" : "21"},
	{"ID" : "110", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1654", "Parent" : "21"},
	{"ID" : "111", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1655", "Parent" : "21"},
	{"ID" : "112", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1656", "Parent" : "21"},
	{"ID" : "113", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1657", "Parent" : "21"},
	{"ID" : "114", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1658", "Parent" : "21"},
	{"ID" : "115", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1659", "Parent" : "21"},
	{"ID" : "116", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1660", "Parent" : "21"},
	{"ID" : "117", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1661", "Parent" : "21"},
	{"ID" : "118", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1662", "Parent" : "21"},
	{"ID" : "119", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1663", "Parent" : "21"},
	{"ID" : "120", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1664", "Parent" : "21"},
	{"ID" : "121", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1665", "Parent" : "21"},
	{"ID" : "122", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1666", "Parent" : "21"},
	{"ID" : "123", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1667", "Parent" : "21"},
	{"ID" : "124", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1668", "Parent" : "21"},
	{"ID" : "125", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1669", "Parent" : "21"},
	{"ID" : "126", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1670", "Parent" : "21"},
	{"ID" : "127", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1671", "Parent" : "21"},
	{"ID" : "128", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1672", "Parent" : "21"},
	{"ID" : "129", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1673", "Parent" : "21"},
	{"ID" : "130", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1674", "Parent" : "21"},
	{"ID" : "131", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1675", "Parent" : "21"},
	{"ID" : "132", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1676", "Parent" : "21"},
	{"ID" : "133", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1677", "Parent" : "21"},
	{"ID" : "134", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1678", "Parent" : "21"},
	{"ID" : "135", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1679", "Parent" : "21"},
	{"ID" : "136", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1680", "Parent" : "21"},
	{"ID" : "137", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1681", "Parent" : "21"},
	{"ID" : "138", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1682", "Parent" : "21"},
	{"ID" : "139", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1683", "Parent" : "21"},
	{"ID" : "140", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1684", "Parent" : "21"},
	{"ID" : "141", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1685", "Parent" : "21"},
	{"ID" : "142", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1686", "Parent" : "21"},
	{"ID" : "143", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1687", "Parent" : "21"},
	{"ID" : "144", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1688", "Parent" : "21"},
	{"ID" : "145", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1689", "Parent" : "21"},
	{"ID" : "146", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1690", "Parent" : "21"},
	{"ID" : "147", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1691", "Parent" : "21"},
	{"ID" : "148", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1692", "Parent" : "21"},
	{"ID" : "149", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1693", "Parent" : "21"},
	{"ID" : "150", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "151", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.mul_6ns_14ns_20_1_1_U1706", "Parent" : "20"},
	{"ID" : "152", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0", "Parent" : "6", "Child" : ["153", "172"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["20"], "DependentChan" : "195", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "192", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["173"], "DependentChan" : "198", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["20"], "DependentChan" : "197", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["20"], "DependentChan" : "196", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "184", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["173"], "DependentChan" : "199", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "153", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Parent" : "152", "Child" : ["154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171"],
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
	{"ID" : "154", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_U", "Parent" : "153"},
	{"ID" : "155", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_3_U", "Parent" : "153"},
	{"ID" : "156", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_2_U", "Parent" : "153"},
	{"ID" : "157", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_1_U", "Parent" : "153"},
	{"ID" : "158", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1715", "Parent" : "153"},
	{"ID" : "159", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1716", "Parent" : "153"},
	{"ID" : "160", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1717", "Parent" : "153"},
	{"ID" : "161", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1718", "Parent" : "153"},
	{"ID" : "162", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1719", "Parent" : "153"},
	{"ID" : "163", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1720", "Parent" : "153"},
	{"ID" : "164", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1721", "Parent" : "153"},
	{"ID" : "165", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1722", "Parent" : "153"},
	{"ID" : "166", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1723", "Parent" : "153"},
	{"ID" : "167", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1724", "Parent" : "153"},
	{"ID" : "168", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1725", "Parent" : "153"},
	{"ID" : "169", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1726", "Parent" : "153"},
	{"ID" : "170", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1727", "Parent" : "153"},
	{"ID" : "171", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "153"},
	{"ID" : "172", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.mul_6ns_14ns_20_1_1_U1738", "Parent" : "152"},
	{"ID" : "173", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0", "Parent" : "6", "Child" : ["174"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["152"], "DependentChan" : "198", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "174", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["176"], "DependentChan" : "200", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "174", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["152"], "DependentChan" : "199", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "186", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["176"], "DependentChan" : "201", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "174", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "173", "Child" : ["175"],
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
	{"ID" : "175", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "174"},
	{"ID" : "176", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0", "Parent" : "6", "Child" : ["177", "179"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["173"], "DependentChan" : "200", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "177", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "177", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["173"], "DependentChan" : "201", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "187", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "177", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Parent" : "176", "Child" : ["178"],
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
	{"ID" : "178", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "177"},
	{"ID" : "179", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "176", "Child" : ["180", "181", "182", "183"],
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
	{"ID" : "180", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U1759", "Parent" : "179"},
	{"ID" : "181", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1760", "Parent" : "179"},
	{"ID" : "182", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1761", "Parent" : "179"},
	{"ID" : "183", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "179"},
	{"ID" : "184", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.idx1_c_U", "Parent" : "6"},
	{"ID" : "185", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.mul_ln867_loc_channel_U", "Parent" : "6"},
	{"ID" : "186", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_fxp_loc_channel_U", "Parent" : "6"},
	{"ID" : "187", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.fuse_residual_loc_channel_U", "Parent" : "6"},
	{"ID" : "188", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c17_channel_U", "Parent" : "6"},
	{"ID" : "189", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c21_channel_U", "Parent" : "6"},
	{"ID" : "190", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.weight_stream_U", "Parent" : "6"},
	{"ID" : "191", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_activation_stream_U", "Parent" : "6"},
	{"ID" : "192", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_scale_stream_U", "Parent" : "6"},
	{"ID" : "193", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c16_U", "Parent" : "6"},
	{"ID" : "194", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c20_U", "Parent" : "6"},
	{"ID" : "195", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.group_stream_U", "Parent" : "6"},
	{"ID" : "196", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c_U", "Parent" : "6"},
	{"ID" : "197", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c19_U", "Parent" : "6"},
	{"ID" : "198", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.final_block_stream_U", "Parent" : "6"},
	{"ID" : "199", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c18_U", "Parent" : "6"},
	{"ID" : "200", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_stream_U", "Parent" : "6"},
	{"ID" : "201", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c_U", "Parent" : "6"},
	{"ID" : "202", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0", "Parent" : "1", "Child" : ["203", "204", "206", "208", "216", "348", "369", "372", "380", "381", "382", "383", "384", "385", "386", "387", "388", "389", "390", "391", "392", "393", "394", "395", "396", "397"],
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
			{"ID" : "203", "Name" : "entry_proc55_U0"},
			{"ID" : "204", "Name" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0"},
			{"ID" : "206", "Name" : "int4_stream_pe_inputs_16_U0"},
			{"ID" : "348", "Name" : "int4_dequantize_final_blocks_17_U0"},
			{"ID" : "372", "Name" : "int4_write_outputs_8_U0"}],
		"OutputProcess" : [
			{"ID" : "372", "Name" : "int4_write_outputs_8_U0"}],
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "206", "SubInstance" : "int4_stream_pe_inputs_16_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "quantized_pe1"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "799", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "activation_scale_pe1"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "791", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Port" : "linear_command_pe1"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "372", "SubInstance" : "int4_write_outputs_8_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "348", "SubInstance" : "int4_dequantize_final_blocks_17_U0", "Port" : "model_scale_cache1"}]}]},
	{"ID" : "203", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.entry_proc55_U0", "Parent" : "202",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["348"], "DependentChan" : "380", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "204", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Parent" : "202", "Child" : ["205"],
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
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "791", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "205", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0.mul_6ns_6ns_12_1_1_U1843", "Parent" : "204"},
	{"ID" : "206", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0", "Parent" : "202", "Child" : ["207"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["216"], "DependentChan" : "386", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["204"], "DependentChan" : "381", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "207", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0.flow_control_loop_pipe_U", "Parent" : "206"},
	{"ID" : "208", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0", "Parent" : "202", "Child" : ["209", "210", "211", "213", "215"],
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
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "799", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "211", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["216"], "DependentChan" : "387", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "213", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["348"], "DependentChan" : "388", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "213", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["204"], "DependentChan" : "385", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["204"], "DependentChan" : "384", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["216"], "DependentChan" : "389", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["216"], "DependentChan" : "390", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "209", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.activation_cache_U", "Parent" : "208"},
	{"ID" : "210", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.scale_cache_U", "Parent" : "208"},
	{"ID" : "211", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "208", "Child" : ["212"],
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
	{"ID" : "212", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "211"},
	{"ID" : "213", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Parent" : "208", "Child" : ["214"],
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
	{"ID" : "214", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "213"},
	{"ID" : "215", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.mul_6ns_9ns_15_1_1_U1861", "Parent" : "208"},
	{"ID" : "216", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0", "Parent" : "202", "Child" : ["217", "347"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "386", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["208"], "DependentChan" : "387", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["348"], "DependentChan" : "391", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "217", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["208"], "DependentChan" : "390", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["208"], "DependentChan" : "389", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["348"], "DependentChan" : "392", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["348"], "DependentChan" : "393", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "217", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "216", "Child" : ["218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346"],
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
	{"ID" : "218", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1870", "Parent" : "217"},
	{"ID" : "219", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1871", "Parent" : "217"},
	{"ID" : "220", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1872", "Parent" : "217"},
	{"ID" : "221", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1873", "Parent" : "217"},
	{"ID" : "222", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1874", "Parent" : "217"},
	{"ID" : "223", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1875", "Parent" : "217"},
	{"ID" : "224", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1876", "Parent" : "217"},
	{"ID" : "225", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1877", "Parent" : "217"},
	{"ID" : "226", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1878", "Parent" : "217"},
	{"ID" : "227", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1879", "Parent" : "217"},
	{"ID" : "228", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1880", "Parent" : "217"},
	{"ID" : "229", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1881", "Parent" : "217"},
	{"ID" : "230", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1882", "Parent" : "217"},
	{"ID" : "231", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1883", "Parent" : "217"},
	{"ID" : "232", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1884", "Parent" : "217"},
	{"ID" : "233", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1885", "Parent" : "217"},
	{"ID" : "234", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1886", "Parent" : "217"},
	{"ID" : "235", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1887", "Parent" : "217"},
	{"ID" : "236", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1888", "Parent" : "217"},
	{"ID" : "237", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1889", "Parent" : "217"},
	{"ID" : "238", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1890", "Parent" : "217"},
	{"ID" : "239", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1891", "Parent" : "217"},
	{"ID" : "240", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1892", "Parent" : "217"},
	{"ID" : "241", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1893", "Parent" : "217"},
	{"ID" : "242", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1894", "Parent" : "217"},
	{"ID" : "243", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1895", "Parent" : "217"},
	{"ID" : "244", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1896", "Parent" : "217"},
	{"ID" : "245", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1897", "Parent" : "217"},
	{"ID" : "246", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1898", "Parent" : "217"},
	{"ID" : "247", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1899", "Parent" : "217"},
	{"ID" : "248", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1900", "Parent" : "217"},
	{"ID" : "249", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1901", "Parent" : "217"},
	{"ID" : "250", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1902", "Parent" : "217"},
	{"ID" : "251", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1903", "Parent" : "217"},
	{"ID" : "252", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1904", "Parent" : "217"},
	{"ID" : "253", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1905", "Parent" : "217"},
	{"ID" : "254", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1906", "Parent" : "217"},
	{"ID" : "255", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1907", "Parent" : "217"},
	{"ID" : "256", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1908", "Parent" : "217"},
	{"ID" : "257", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1909", "Parent" : "217"},
	{"ID" : "258", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1910", "Parent" : "217"},
	{"ID" : "259", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1911", "Parent" : "217"},
	{"ID" : "260", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1912", "Parent" : "217"},
	{"ID" : "261", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1913", "Parent" : "217"},
	{"ID" : "262", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1914", "Parent" : "217"},
	{"ID" : "263", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1915", "Parent" : "217"},
	{"ID" : "264", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1916", "Parent" : "217"},
	{"ID" : "265", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1917", "Parent" : "217"},
	{"ID" : "266", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1918", "Parent" : "217"},
	{"ID" : "267", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1919", "Parent" : "217"},
	{"ID" : "268", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1920", "Parent" : "217"},
	{"ID" : "269", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1921", "Parent" : "217"},
	{"ID" : "270", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1922", "Parent" : "217"},
	{"ID" : "271", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1923", "Parent" : "217"},
	{"ID" : "272", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1924", "Parent" : "217"},
	{"ID" : "273", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1925", "Parent" : "217"},
	{"ID" : "274", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1926", "Parent" : "217"},
	{"ID" : "275", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1927", "Parent" : "217"},
	{"ID" : "276", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1928", "Parent" : "217"},
	{"ID" : "277", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1929", "Parent" : "217"},
	{"ID" : "278", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1930", "Parent" : "217"},
	{"ID" : "279", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1931", "Parent" : "217"},
	{"ID" : "280", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1932", "Parent" : "217"},
	{"ID" : "281", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1933", "Parent" : "217"},
	{"ID" : "282", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1934", "Parent" : "217"},
	{"ID" : "283", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1935", "Parent" : "217"},
	{"ID" : "284", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1936", "Parent" : "217"},
	{"ID" : "285", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1937", "Parent" : "217"},
	{"ID" : "286", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1938", "Parent" : "217"},
	{"ID" : "287", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1939", "Parent" : "217"},
	{"ID" : "288", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1940", "Parent" : "217"},
	{"ID" : "289", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1941", "Parent" : "217"},
	{"ID" : "290", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1942", "Parent" : "217"},
	{"ID" : "291", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1943", "Parent" : "217"},
	{"ID" : "292", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1944", "Parent" : "217"},
	{"ID" : "293", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1945", "Parent" : "217"},
	{"ID" : "294", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1946", "Parent" : "217"},
	{"ID" : "295", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1947", "Parent" : "217"},
	{"ID" : "296", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1948", "Parent" : "217"},
	{"ID" : "297", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1949", "Parent" : "217"},
	{"ID" : "298", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1950", "Parent" : "217"},
	{"ID" : "299", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1951", "Parent" : "217"},
	{"ID" : "300", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1952", "Parent" : "217"},
	{"ID" : "301", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1953", "Parent" : "217"},
	{"ID" : "302", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1954", "Parent" : "217"},
	{"ID" : "303", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1955", "Parent" : "217"},
	{"ID" : "304", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1956", "Parent" : "217"},
	{"ID" : "305", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1957", "Parent" : "217"},
	{"ID" : "306", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1958", "Parent" : "217"},
	{"ID" : "307", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1959", "Parent" : "217"},
	{"ID" : "308", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1960", "Parent" : "217"},
	{"ID" : "309", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1961", "Parent" : "217"},
	{"ID" : "310", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1962", "Parent" : "217"},
	{"ID" : "311", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1963", "Parent" : "217"},
	{"ID" : "312", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1964", "Parent" : "217"},
	{"ID" : "313", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1965", "Parent" : "217"},
	{"ID" : "314", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1966", "Parent" : "217"},
	{"ID" : "315", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1967", "Parent" : "217"},
	{"ID" : "316", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1968", "Parent" : "217"},
	{"ID" : "317", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1969", "Parent" : "217"},
	{"ID" : "318", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1970", "Parent" : "217"},
	{"ID" : "319", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1971", "Parent" : "217"},
	{"ID" : "320", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1972", "Parent" : "217"},
	{"ID" : "321", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1973", "Parent" : "217"},
	{"ID" : "322", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1974", "Parent" : "217"},
	{"ID" : "323", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1975", "Parent" : "217"},
	{"ID" : "324", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1976", "Parent" : "217"},
	{"ID" : "325", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1977", "Parent" : "217"},
	{"ID" : "326", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1978", "Parent" : "217"},
	{"ID" : "327", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1979", "Parent" : "217"},
	{"ID" : "328", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1980", "Parent" : "217"},
	{"ID" : "329", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1981", "Parent" : "217"},
	{"ID" : "330", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1982", "Parent" : "217"},
	{"ID" : "331", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1983", "Parent" : "217"},
	{"ID" : "332", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1984", "Parent" : "217"},
	{"ID" : "333", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1985", "Parent" : "217"},
	{"ID" : "334", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1986", "Parent" : "217"},
	{"ID" : "335", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1987", "Parent" : "217"},
	{"ID" : "336", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1988", "Parent" : "217"},
	{"ID" : "337", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1989", "Parent" : "217"},
	{"ID" : "338", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1990", "Parent" : "217"},
	{"ID" : "339", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1991", "Parent" : "217"},
	{"ID" : "340", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1992", "Parent" : "217"},
	{"ID" : "341", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1993", "Parent" : "217"},
	{"ID" : "342", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1994", "Parent" : "217"},
	{"ID" : "343", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1995", "Parent" : "217"},
	{"ID" : "344", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1996", "Parent" : "217"},
	{"ID" : "345", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1997", "Parent" : "217"},
	{"ID" : "346", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "217"},
	{"ID" : "347", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.mul_6ns_14ns_20_1_1_U2003", "Parent" : "216"},
	{"ID" : "348", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0", "Parent" : "202", "Child" : ["349", "368"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "391", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "349", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["208"], "DependentChan" : "388", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "349", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["369"], "DependentChan" : "394", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "349", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "393", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "392", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["203"], "DependentChan" : "380", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["369"], "DependentChan" : "395", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "349", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "349", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "348", "Child" : ["350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367"],
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
	{"ID" : "350", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "349"},
	{"ID" : "351", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_7_U", "Parent" : "349"},
	{"ID" : "352", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_8_U", "Parent" : "349"},
	{"ID" : "353", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_9_U", "Parent" : "349"},
	{"ID" : "354", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2011", "Parent" : "349"},
	{"ID" : "355", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2012", "Parent" : "349"},
	{"ID" : "356", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2013", "Parent" : "349"},
	{"ID" : "357", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2014", "Parent" : "349"},
	{"ID" : "358", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2015", "Parent" : "349"},
	{"ID" : "359", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2016", "Parent" : "349"},
	{"ID" : "360", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2017", "Parent" : "349"},
	{"ID" : "361", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2018", "Parent" : "349"},
	{"ID" : "362", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2019", "Parent" : "349"},
	{"ID" : "363", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2020", "Parent" : "349"},
	{"ID" : "364", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2021", "Parent" : "349"},
	{"ID" : "365", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2022", "Parent" : "349"},
	{"ID" : "366", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2023", "Parent" : "349"},
	{"ID" : "367", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "349"},
	{"ID" : "368", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.mul_6ns_14ns_20_1_1_U2032", "Parent" : "348"},
	{"ID" : "369", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0", "Parent" : "202", "Child" : ["370"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["348"], "DependentChan" : "394", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "370", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["372"], "DependentChan" : "396", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "370", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["348"], "DependentChan" : "395", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["204"], "DependentChan" : "382", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["372"], "DependentChan" : "397", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "370", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "369", "Child" : ["371"],
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
	{"ID" : "371", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "370"},
	{"ID" : "372", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0", "Parent" : "202", "Child" : ["373", "375"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["369"], "DependentChan" : "396", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "373", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "373", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["369"], "DependentChan" : "397", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["204"], "DependentChan" : "383", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "373", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Parent" : "372", "Child" : ["374"],
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
	{"ID" : "374", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "373"},
	{"ID" : "375", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "372", "Child" : ["376", "377", "378", "379"],
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
	{"ID" : "376", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2053", "Parent" : "375"},
	{"ID" : "377", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2054", "Parent" : "375"},
	{"ID" : "378", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2055", "Parent" : "375"},
	{"ID" : "379", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "375"},
	{"ID" : "380", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.idx1_c_U", "Parent" : "202"},
	{"ID" : "381", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.mul_ln867_loc_channel_U", "Parent" : "202"},
	{"ID" : "382", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_fxp_loc_channel_U", "Parent" : "202"},
	{"ID" : "383", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.fuse_residual_loc_channel_U", "Parent" : "202"},
	{"ID" : "384", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c17_channel_U", "Parent" : "202"},
	{"ID" : "385", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c21_channel_U", "Parent" : "202"},
	{"ID" : "386", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.weight_stream_U", "Parent" : "202"},
	{"ID" : "387", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_activation_stream_U", "Parent" : "202"},
	{"ID" : "388", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_scale_stream_U", "Parent" : "202"},
	{"ID" : "389", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c16_U", "Parent" : "202"},
	{"ID" : "390", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c20_U", "Parent" : "202"},
	{"ID" : "391", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.group_stream_U", "Parent" : "202"},
	{"ID" : "392", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c_U", "Parent" : "202"},
	{"ID" : "393", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c19_U", "Parent" : "202"},
	{"ID" : "394", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.final_block_stream_U", "Parent" : "202"},
	{"ID" : "395", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c18_U", "Parent" : "202"},
	{"ID" : "396", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_stream_U", "Parent" : "202"},
	{"ID" : "397", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c_U", "Parent" : "202"},
	{"ID" : "398", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0", "Parent" : "1", "Child" : ["399", "400", "402", "404", "412", "544", "565", "568", "576", "577", "578", "579", "580", "581", "582", "583", "584", "585", "586", "587", "588", "589", "590", "591", "592", "593"],
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
			{"ID" : "399", "Name" : "entry_proc54_U0"},
			{"ID" : "400", "Name" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0"},
			{"ID" : "402", "Name" : "int4_stream_pe_inputs_18_U0"},
			{"ID" : "544", "Name" : "int4_dequantize_final_blocks_19_U0"},
			{"ID" : "568", "Name" : "int4_write_outputs_7_U0"}],
		"OutputProcess" : [
			{"ID" : "568", "Name" : "int4_write_outputs_7_U0"}],
		"Port" : [
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "402", "SubInstance" : "int4_stream_pe_inputs_18_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "796", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "404", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "quantized_pe2"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "800", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "404", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "activation_scale_pe2"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "400", "SubInstance" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Port" : "linear_command_pe2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "568", "SubInstance" : "int4_write_outputs_7_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "544", "SubInstance" : "int4_dequantize_final_blocks_19_U0", "Port" : "model_scale_cache2"}]}]},
	{"ID" : "399", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.entry_proc54_U0", "Parent" : "398",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["544"], "DependentChan" : "576", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "400", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Parent" : "398", "Child" : ["401"],
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
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "401", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0.mul_6ns_6ns_12_1_1_U2137", "Parent" : "400"},
	{"ID" : "402", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0", "Parent" : "398", "Child" : ["403"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["412"], "DependentChan" : "582", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["400"], "DependentChan" : "577", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "403", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0.flow_control_loop_pipe_U", "Parent" : "402"},
	{"ID" : "404", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0", "Parent" : "398", "Child" : ["405", "406", "407", "409", "411"],
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
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "796", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "407", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "800", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "407", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["412"], "DependentChan" : "583", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "409", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["544"], "DependentChan" : "584", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "409", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["400"], "DependentChan" : "581", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["400"], "DependentChan" : "580", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["412"], "DependentChan" : "585", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["412"], "DependentChan" : "586", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "405", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.activation_cache_U", "Parent" : "404"},
	{"ID" : "406", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.scale_cache_U", "Parent" : "404"},
	{"ID" : "407", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "404", "Child" : ["408"],
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
	{"ID" : "408", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "407"},
	{"ID" : "409", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Parent" : "404", "Child" : ["410"],
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
	{"ID" : "410", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "409"},
	{"ID" : "411", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.mul_6ns_9ns_15_1_1_U2155", "Parent" : "404"},
	{"ID" : "412", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0", "Parent" : "398", "Child" : ["413", "543"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["402"], "DependentChan" : "582", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "413", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["404"], "DependentChan" : "583", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "413", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["544"], "DependentChan" : "587", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "413", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["404"], "DependentChan" : "586", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["404"], "DependentChan" : "585", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["544"], "DependentChan" : "588", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["544"], "DependentChan" : "589", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "413", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "412", "Child" : ["414", "415", "416", "417", "418", "419", "420", "421", "422", "423", "424", "425", "426", "427", "428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440", "441", "442", "443", "444", "445", "446", "447", "448", "449", "450", "451", "452", "453", "454", "455", "456", "457", "458", "459", "460", "461", "462", "463", "464", "465", "466", "467", "468", "469", "470", "471", "472", "473", "474", "475", "476", "477", "478", "479", "480", "481", "482", "483", "484", "485", "486", "487", "488", "489", "490", "491", "492", "493", "494", "495", "496", "497", "498", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512", "513", "514", "515", "516", "517", "518", "519", "520", "521", "522", "523", "524", "525", "526", "527", "528", "529", "530", "531", "532", "533", "534", "535", "536", "537", "538", "539", "540", "541", "542"],
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
	{"ID" : "414", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2164", "Parent" : "413"},
	{"ID" : "415", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2165", "Parent" : "413"},
	{"ID" : "416", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2166", "Parent" : "413"},
	{"ID" : "417", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2167", "Parent" : "413"},
	{"ID" : "418", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2168", "Parent" : "413"},
	{"ID" : "419", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2169", "Parent" : "413"},
	{"ID" : "420", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2170", "Parent" : "413"},
	{"ID" : "421", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2171", "Parent" : "413"},
	{"ID" : "422", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2172", "Parent" : "413"},
	{"ID" : "423", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2173", "Parent" : "413"},
	{"ID" : "424", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2174", "Parent" : "413"},
	{"ID" : "425", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2175", "Parent" : "413"},
	{"ID" : "426", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2176", "Parent" : "413"},
	{"ID" : "427", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2177", "Parent" : "413"},
	{"ID" : "428", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2178", "Parent" : "413"},
	{"ID" : "429", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2179", "Parent" : "413"},
	{"ID" : "430", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2180", "Parent" : "413"},
	{"ID" : "431", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2181", "Parent" : "413"},
	{"ID" : "432", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2182", "Parent" : "413"},
	{"ID" : "433", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2183", "Parent" : "413"},
	{"ID" : "434", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2184", "Parent" : "413"},
	{"ID" : "435", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2185", "Parent" : "413"},
	{"ID" : "436", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2186", "Parent" : "413"},
	{"ID" : "437", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2187", "Parent" : "413"},
	{"ID" : "438", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2188", "Parent" : "413"},
	{"ID" : "439", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2189", "Parent" : "413"},
	{"ID" : "440", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2190", "Parent" : "413"},
	{"ID" : "441", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2191", "Parent" : "413"},
	{"ID" : "442", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2192", "Parent" : "413"},
	{"ID" : "443", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2193", "Parent" : "413"},
	{"ID" : "444", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2194", "Parent" : "413"},
	{"ID" : "445", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2195", "Parent" : "413"},
	{"ID" : "446", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2196", "Parent" : "413"},
	{"ID" : "447", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2197", "Parent" : "413"},
	{"ID" : "448", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2198", "Parent" : "413"},
	{"ID" : "449", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2199", "Parent" : "413"},
	{"ID" : "450", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2200", "Parent" : "413"},
	{"ID" : "451", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2201", "Parent" : "413"},
	{"ID" : "452", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2202", "Parent" : "413"},
	{"ID" : "453", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2203", "Parent" : "413"},
	{"ID" : "454", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2204", "Parent" : "413"},
	{"ID" : "455", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2205", "Parent" : "413"},
	{"ID" : "456", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2206", "Parent" : "413"},
	{"ID" : "457", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2207", "Parent" : "413"},
	{"ID" : "458", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2208", "Parent" : "413"},
	{"ID" : "459", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2209", "Parent" : "413"},
	{"ID" : "460", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2210", "Parent" : "413"},
	{"ID" : "461", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2211", "Parent" : "413"},
	{"ID" : "462", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2212", "Parent" : "413"},
	{"ID" : "463", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2213", "Parent" : "413"},
	{"ID" : "464", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2214", "Parent" : "413"},
	{"ID" : "465", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2215", "Parent" : "413"},
	{"ID" : "466", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2216", "Parent" : "413"},
	{"ID" : "467", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2217", "Parent" : "413"},
	{"ID" : "468", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2218", "Parent" : "413"},
	{"ID" : "469", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2219", "Parent" : "413"},
	{"ID" : "470", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2220", "Parent" : "413"},
	{"ID" : "471", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2221", "Parent" : "413"},
	{"ID" : "472", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2222", "Parent" : "413"},
	{"ID" : "473", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2223", "Parent" : "413"},
	{"ID" : "474", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2224", "Parent" : "413"},
	{"ID" : "475", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2225", "Parent" : "413"},
	{"ID" : "476", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2226", "Parent" : "413"},
	{"ID" : "477", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2227", "Parent" : "413"},
	{"ID" : "478", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2228", "Parent" : "413"},
	{"ID" : "479", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2229", "Parent" : "413"},
	{"ID" : "480", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2230", "Parent" : "413"},
	{"ID" : "481", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2231", "Parent" : "413"},
	{"ID" : "482", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2232", "Parent" : "413"},
	{"ID" : "483", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2233", "Parent" : "413"},
	{"ID" : "484", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2234", "Parent" : "413"},
	{"ID" : "485", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2235", "Parent" : "413"},
	{"ID" : "486", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2236", "Parent" : "413"},
	{"ID" : "487", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2237", "Parent" : "413"},
	{"ID" : "488", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2238", "Parent" : "413"},
	{"ID" : "489", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2239", "Parent" : "413"},
	{"ID" : "490", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2240", "Parent" : "413"},
	{"ID" : "491", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2241", "Parent" : "413"},
	{"ID" : "492", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2242", "Parent" : "413"},
	{"ID" : "493", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2243", "Parent" : "413"},
	{"ID" : "494", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2244", "Parent" : "413"},
	{"ID" : "495", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2245", "Parent" : "413"},
	{"ID" : "496", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2246", "Parent" : "413"},
	{"ID" : "497", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2247", "Parent" : "413"},
	{"ID" : "498", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2248", "Parent" : "413"},
	{"ID" : "499", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2249", "Parent" : "413"},
	{"ID" : "500", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2250", "Parent" : "413"},
	{"ID" : "501", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2251", "Parent" : "413"},
	{"ID" : "502", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2252", "Parent" : "413"},
	{"ID" : "503", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2253", "Parent" : "413"},
	{"ID" : "504", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2254", "Parent" : "413"},
	{"ID" : "505", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2255", "Parent" : "413"},
	{"ID" : "506", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2256", "Parent" : "413"},
	{"ID" : "507", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2257", "Parent" : "413"},
	{"ID" : "508", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2258", "Parent" : "413"},
	{"ID" : "509", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2259", "Parent" : "413"},
	{"ID" : "510", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2260", "Parent" : "413"},
	{"ID" : "511", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2261", "Parent" : "413"},
	{"ID" : "512", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2262", "Parent" : "413"},
	{"ID" : "513", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2263", "Parent" : "413"},
	{"ID" : "514", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2264", "Parent" : "413"},
	{"ID" : "515", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2265", "Parent" : "413"},
	{"ID" : "516", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2266", "Parent" : "413"},
	{"ID" : "517", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2267", "Parent" : "413"},
	{"ID" : "518", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2268", "Parent" : "413"},
	{"ID" : "519", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2269", "Parent" : "413"},
	{"ID" : "520", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2270", "Parent" : "413"},
	{"ID" : "521", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2271", "Parent" : "413"},
	{"ID" : "522", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2272", "Parent" : "413"},
	{"ID" : "523", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2273", "Parent" : "413"},
	{"ID" : "524", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2274", "Parent" : "413"},
	{"ID" : "525", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2275", "Parent" : "413"},
	{"ID" : "526", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2276", "Parent" : "413"},
	{"ID" : "527", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2277", "Parent" : "413"},
	{"ID" : "528", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2278", "Parent" : "413"},
	{"ID" : "529", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2279", "Parent" : "413"},
	{"ID" : "530", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2280", "Parent" : "413"},
	{"ID" : "531", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2281", "Parent" : "413"},
	{"ID" : "532", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2282", "Parent" : "413"},
	{"ID" : "533", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2283", "Parent" : "413"},
	{"ID" : "534", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2284", "Parent" : "413"},
	{"ID" : "535", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2285", "Parent" : "413"},
	{"ID" : "536", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2286", "Parent" : "413"},
	{"ID" : "537", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2287", "Parent" : "413"},
	{"ID" : "538", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2288", "Parent" : "413"},
	{"ID" : "539", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2289", "Parent" : "413"},
	{"ID" : "540", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2290", "Parent" : "413"},
	{"ID" : "541", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2291", "Parent" : "413"},
	{"ID" : "542", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "413"},
	{"ID" : "543", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.mul_6ns_14ns_20_1_1_U2297", "Parent" : "412"},
	{"ID" : "544", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0", "Parent" : "398", "Child" : ["545", "564"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "587", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "545", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["404"], "DependentChan" : "584", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "545", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["565"], "DependentChan" : "590", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "545", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "589", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "588", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["399"], "DependentChan" : "576", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["565"], "DependentChan" : "591", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "545", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "545", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "544", "Child" : ["546", "547", "548", "549", "550", "551", "552", "553", "554", "555", "556", "557", "558", "559", "560", "561", "562", "563"],
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
	{"ID" : "546", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "545"},
	{"ID" : "547", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_4_U", "Parent" : "545"},
	{"ID" : "548", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_5_U", "Parent" : "545"},
	{"ID" : "549", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_6_U", "Parent" : "545"},
	{"ID" : "550", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2305", "Parent" : "545"},
	{"ID" : "551", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2306", "Parent" : "545"},
	{"ID" : "552", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2307", "Parent" : "545"},
	{"ID" : "553", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2308", "Parent" : "545"},
	{"ID" : "554", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2309", "Parent" : "545"},
	{"ID" : "555", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2310", "Parent" : "545"},
	{"ID" : "556", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2311", "Parent" : "545"},
	{"ID" : "557", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2312", "Parent" : "545"},
	{"ID" : "558", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2313", "Parent" : "545"},
	{"ID" : "559", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2314", "Parent" : "545"},
	{"ID" : "560", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2315", "Parent" : "545"},
	{"ID" : "561", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2316", "Parent" : "545"},
	{"ID" : "562", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2317", "Parent" : "545"},
	{"ID" : "563", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "545"},
	{"ID" : "564", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.mul_6ns_14ns_20_1_1_U2326", "Parent" : "544"},
	{"ID" : "565", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0", "Parent" : "398", "Child" : ["566"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["544"], "DependentChan" : "590", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "566", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["568"], "DependentChan" : "592", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "566", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["544"], "DependentChan" : "591", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["400"], "DependentChan" : "578", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["568"], "DependentChan" : "593", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "566", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "565", "Child" : ["567"],
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
	{"ID" : "567", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "566"},
	{"ID" : "568", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0", "Parent" : "398", "Child" : ["569", "571"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["565"], "DependentChan" : "592", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "569", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "569", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["565"], "DependentChan" : "593", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["400"], "DependentChan" : "579", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "569", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Parent" : "568", "Child" : ["570"],
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
	{"ID" : "570", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "569"},
	{"ID" : "571", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "568", "Child" : ["572", "573", "574", "575"],
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
	{"ID" : "572", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2347", "Parent" : "571"},
	{"ID" : "573", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2348", "Parent" : "571"},
	{"ID" : "574", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2349", "Parent" : "571"},
	{"ID" : "575", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "571"},
	{"ID" : "576", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.idx1_c_U", "Parent" : "398"},
	{"ID" : "577", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.mul_ln867_loc_channel_U", "Parent" : "398"},
	{"ID" : "578", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_fxp_loc_channel_U", "Parent" : "398"},
	{"ID" : "579", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.fuse_residual_loc_channel_U", "Parent" : "398"},
	{"ID" : "580", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c17_channel_U", "Parent" : "398"},
	{"ID" : "581", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c21_channel_U", "Parent" : "398"},
	{"ID" : "582", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.weight_stream_U", "Parent" : "398"},
	{"ID" : "583", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_activation_stream_U", "Parent" : "398"},
	{"ID" : "584", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_scale_stream_U", "Parent" : "398"},
	{"ID" : "585", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c16_U", "Parent" : "398"},
	{"ID" : "586", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c20_U", "Parent" : "398"},
	{"ID" : "587", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.group_stream_U", "Parent" : "398"},
	{"ID" : "588", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c_U", "Parent" : "398"},
	{"ID" : "589", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c19_U", "Parent" : "398"},
	{"ID" : "590", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.final_block_stream_U", "Parent" : "398"},
	{"ID" : "591", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c18_U", "Parent" : "398"},
	{"ID" : "592", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_stream_U", "Parent" : "398"},
	{"ID" : "593", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c_U", "Parent" : "398"},
	{"ID" : "594", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0", "Parent" : "1", "Child" : ["595", "596", "598", "600", "608", "740", "761", "764", "772", "773", "774", "775", "776", "777", "778", "779", "780", "781", "782", "783", "784", "785", "786", "787", "788", "789"],
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
			{"ID" : "595", "Name" : "entry_proc_U0"},
			{"ID" : "596", "Name" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0"},
			{"ID" : "598", "Name" : "int4_stream_pe_inputs_20_U0"},
			{"ID" : "740", "Name" : "int4_dequantize_final_blocks_21_U0"},
			{"ID" : "764", "Name" : "int4_write_outputs_U0"}],
		"OutputProcess" : [
			{"ID" : "764", "Name" : "int4_write_outputs_U0"}],
		"Port" : [
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "598", "SubInstance" : "int4_stream_pe_inputs_20_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "797", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "600", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "quantized_pe3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "801", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "600", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "activation_scale_pe3"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "596", "SubInstance" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Port" : "linear_command_pe3"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "764", "SubInstance" : "int4_write_outputs_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "740", "SubInstance" : "int4_dequantize_final_blocks_21_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "595", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.entry_proc_U0", "Parent" : "594",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["740"], "DependentChan" : "772", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "596", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Parent" : "594", "Child" : ["597"],
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
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "597", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0.mul_6ns_6ns_12_1_1_U2431", "Parent" : "596"},
	{"ID" : "598", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0", "Parent" : "594", "Child" : ["599"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["608"], "DependentChan" : "778", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["596"], "DependentChan" : "773", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "599", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0.flow_control_loop_pipe_U", "Parent" : "598"},
	{"ID" : "600", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0", "Parent" : "594", "Child" : ["601", "602", "603", "605", "607"],
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
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "797", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "801", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "603", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["608"], "DependentChan" : "779", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "605", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["740"], "DependentChan" : "780", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "605", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["596"], "DependentChan" : "777", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["596"], "DependentChan" : "776", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["608"], "DependentChan" : "781", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["608"], "DependentChan" : "782", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "601", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.activation_cache_U", "Parent" : "600"},
	{"ID" : "602", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.scale_cache_U", "Parent" : "600"},
	{"ID" : "603", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "600", "Child" : ["604"],
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
	{"ID" : "604", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "603"},
	{"ID" : "605", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Parent" : "600", "Child" : ["606"],
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
	{"ID" : "606", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "605"},
	{"ID" : "607", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.mul_6ns_9ns_15_1_1_U2449", "Parent" : "600"},
	{"ID" : "608", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0", "Parent" : "594", "Child" : ["609", "739"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["598"], "DependentChan" : "778", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "609", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["600"], "DependentChan" : "779", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "609", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["740"], "DependentChan" : "783", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "609", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["600"], "DependentChan" : "782", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["600"], "DependentChan" : "781", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["740"], "DependentChan" : "784", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["740"], "DependentChan" : "785", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "609", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "608", "Child" : ["610", "611", "612", "613", "614", "615", "616", "617", "618", "619", "620", "621", "622", "623", "624", "625", "626", "627", "628", "629", "630", "631", "632", "633", "634", "635", "636", "637", "638", "639", "640", "641", "642", "643", "644", "645", "646", "647", "648", "649", "650", "651", "652", "653", "654", "655", "656", "657", "658", "659", "660", "661", "662", "663", "664", "665", "666", "667", "668", "669", "670", "671", "672", "673", "674", "675", "676", "677", "678", "679", "680", "681", "682", "683", "684", "685", "686", "687", "688", "689", "690", "691", "692", "693", "694", "695", "696", "697", "698", "699", "700", "701", "702", "703", "704", "705", "706", "707", "708", "709", "710", "711", "712", "713", "714", "715", "716", "717", "718", "719", "720", "721", "722", "723", "724", "725", "726", "727", "728", "729", "730", "731", "732", "733", "734", "735", "736", "737", "738"],
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
	{"ID" : "610", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2458", "Parent" : "609"},
	{"ID" : "611", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2459", "Parent" : "609"},
	{"ID" : "612", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2460", "Parent" : "609"},
	{"ID" : "613", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2461", "Parent" : "609"},
	{"ID" : "614", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2462", "Parent" : "609"},
	{"ID" : "615", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2463", "Parent" : "609"},
	{"ID" : "616", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2464", "Parent" : "609"},
	{"ID" : "617", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2465", "Parent" : "609"},
	{"ID" : "618", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2466", "Parent" : "609"},
	{"ID" : "619", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2467", "Parent" : "609"},
	{"ID" : "620", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2468", "Parent" : "609"},
	{"ID" : "621", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2469", "Parent" : "609"},
	{"ID" : "622", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2470", "Parent" : "609"},
	{"ID" : "623", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2471", "Parent" : "609"},
	{"ID" : "624", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2472", "Parent" : "609"},
	{"ID" : "625", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2473", "Parent" : "609"},
	{"ID" : "626", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2474", "Parent" : "609"},
	{"ID" : "627", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2475", "Parent" : "609"},
	{"ID" : "628", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2476", "Parent" : "609"},
	{"ID" : "629", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2477", "Parent" : "609"},
	{"ID" : "630", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2478", "Parent" : "609"},
	{"ID" : "631", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2479", "Parent" : "609"},
	{"ID" : "632", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2480", "Parent" : "609"},
	{"ID" : "633", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2481", "Parent" : "609"},
	{"ID" : "634", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2482", "Parent" : "609"},
	{"ID" : "635", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2483", "Parent" : "609"},
	{"ID" : "636", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2484", "Parent" : "609"},
	{"ID" : "637", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2485", "Parent" : "609"},
	{"ID" : "638", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2486", "Parent" : "609"},
	{"ID" : "639", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2487", "Parent" : "609"},
	{"ID" : "640", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2488", "Parent" : "609"},
	{"ID" : "641", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2489", "Parent" : "609"},
	{"ID" : "642", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2490", "Parent" : "609"},
	{"ID" : "643", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2491", "Parent" : "609"},
	{"ID" : "644", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2492", "Parent" : "609"},
	{"ID" : "645", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2493", "Parent" : "609"},
	{"ID" : "646", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2494", "Parent" : "609"},
	{"ID" : "647", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2495", "Parent" : "609"},
	{"ID" : "648", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2496", "Parent" : "609"},
	{"ID" : "649", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2497", "Parent" : "609"},
	{"ID" : "650", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2498", "Parent" : "609"},
	{"ID" : "651", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2499", "Parent" : "609"},
	{"ID" : "652", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2500", "Parent" : "609"},
	{"ID" : "653", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2501", "Parent" : "609"},
	{"ID" : "654", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2502", "Parent" : "609"},
	{"ID" : "655", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2503", "Parent" : "609"},
	{"ID" : "656", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2504", "Parent" : "609"},
	{"ID" : "657", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2505", "Parent" : "609"},
	{"ID" : "658", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2506", "Parent" : "609"},
	{"ID" : "659", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2507", "Parent" : "609"},
	{"ID" : "660", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2508", "Parent" : "609"},
	{"ID" : "661", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2509", "Parent" : "609"},
	{"ID" : "662", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2510", "Parent" : "609"},
	{"ID" : "663", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2511", "Parent" : "609"},
	{"ID" : "664", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2512", "Parent" : "609"},
	{"ID" : "665", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2513", "Parent" : "609"},
	{"ID" : "666", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2514", "Parent" : "609"},
	{"ID" : "667", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2515", "Parent" : "609"},
	{"ID" : "668", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2516", "Parent" : "609"},
	{"ID" : "669", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2517", "Parent" : "609"},
	{"ID" : "670", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2518", "Parent" : "609"},
	{"ID" : "671", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2519", "Parent" : "609"},
	{"ID" : "672", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2520", "Parent" : "609"},
	{"ID" : "673", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2521", "Parent" : "609"},
	{"ID" : "674", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2522", "Parent" : "609"},
	{"ID" : "675", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2523", "Parent" : "609"},
	{"ID" : "676", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2524", "Parent" : "609"},
	{"ID" : "677", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2525", "Parent" : "609"},
	{"ID" : "678", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2526", "Parent" : "609"},
	{"ID" : "679", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2527", "Parent" : "609"},
	{"ID" : "680", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2528", "Parent" : "609"},
	{"ID" : "681", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2529", "Parent" : "609"},
	{"ID" : "682", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2530", "Parent" : "609"},
	{"ID" : "683", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2531", "Parent" : "609"},
	{"ID" : "684", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2532", "Parent" : "609"},
	{"ID" : "685", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2533", "Parent" : "609"},
	{"ID" : "686", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2534", "Parent" : "609"},
	{"ID" : "687", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2535", "Parent" : "609"},
	{"ID" : "688", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2536", "Parent" : "609"},
	{"ID" : "689", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2537", "Parent" : "609"},
	{"ID" : "690", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2538", "Parent" : "609"},
	{"ID" : "691", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2539", "Parent" : "609"},
	{"ID" : "692", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2540", "Parent" : "609"},
	{"ID" : "693", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2541", "Parent" : "609"},
	{"ID" : "694", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2542", "Parent" : "609"},
	{"ID" : "695", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2543", "Parent" : "609"},
	{"ID" : "696", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2544", "Parent" : "609"},
	{"ID" : "697", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2545", "Parent" : "609"},
	{"ID" : "698", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2546", "Parent" : "609"},
	{"ID" : "699", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2547", "Parent" : "609"},
	{"ID" : "700", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2548", "Parent" : "609"},
	{"ID" : "701", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2549", "Parent" : "609"},
	{"ID" : "702", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2550", "Parent" : "609"},
	{"ID" : "703", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2551", "Parent" : "609"},
	{"ID" : "704", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2552", "Parent" : "609"},
	{"ID" : "705", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2553", "Parent" : "609"},
	{"ID" : "706", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2554", "Parent" : "609"},
	{"ID" : "707", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2555", "Parent" : "609"},
	{"ID" : "708", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2556", "Parent" : "609"},
	{"ID" : "709", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2557", "Parent" : "609"},
	{"ID" : "710", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2558", "Parent" : "609"},
	{"ID" : "711", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2559", "Parent" : "609"},
	{"ID" : "712", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2560", "Parent" : "609"},
	{"ID" : "713", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2561", "Parent" : "609"},
	{"ID" : "714", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2562", "Parent" : "609"},
	{"ID" : "715", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2563", "Parent" : "609"},
	{"ID" : "716", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2564", "Parent" : "609"},
	{"ID" : "717", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2565", "Parent" : "609"},
	{"ID" : "718", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2566", "Parent" : "609"},
	{"ID" : "719", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2567", "Parent" : "609"},
	{"ID" : "720", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2568", "Parent" : "609"},
	{"ID" : "721", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2569", "Parent" : "609"},
	{"ID" : "722", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2570", "Parent" : "609"},
	{"ID" : "723", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2571", "Parent" : "609"},
	{"ID" : "724", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2572", "Parent" : "609"},
	{"ID" : "725", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2573", "Parent" : "609"},
	{"ID" : "726", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2574", "Parent" : "609"},
	{"ID" : "727", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2575", "Parent" : "609"},
	{"ID" : "728", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2576", "Parent" : "609"},
	{"ID" : "729", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2577", "Parent" : "609"},
	{"ID" : "730", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2578", "Parent" : "609"},
	{"ID" : "731", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2579", "Parent" : "609"},
	{"ID" : "732", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2580", "Parent" : "609"},
	{"ID" : "733", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2581", "Parent" : "609"},
	{"ID" : "734", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2582", "Parent" : "609"},
	{"ID" : "735", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2583", "Parent" : "609"},
	{"ID" : "736", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2584", "Parent" : "609"},
	{"ID" : "737", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2585", "Parent" : "609"},
	{"ID" : "738", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "609"},
	{"ID" : "739", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.mul_6ns_14ns_20_1_1_U2591", "Parent" : "608"},
	{"ID" : "740", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0", "Parent" : "594", "Child" : ["741", "760"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "783", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "741", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["600"], "DependentChan" : "780", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "741", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["761"], "DependentChan" : "786", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "741", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "785", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "784", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["595"], "DependentChan" : "772", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["761"], "DependentChan" : "787", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "741", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "741", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "740", "Child" : ["742", "743", "744", "745", "746", "747", "748", "749", "750", "751", "752", "753", "754", "755", "756", "757", "758", "759"],
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
	{"ID" : "742", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "741"},
	{"ID" : "743", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_1_U", "Parent" : "741"},
	{"ID" : "744", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_2_U", "Parent" : "741"},
	{"ID" : "745", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_3_U", "Parent" : "741"},
	{"ID" : "746", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2599", "Parent" : "741"},
	{"ID" : "747", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2600", "Parent" : "741"},
	{"ID" : "748", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2601", "Parent" : "741"},
	{"ID" : "749", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2602", "Parent" : "741"},
	{"ID" : "750", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2603", "Parent" : "741"},
	{"ID" : "751", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2604", "Parent" : "741"},
	{"ID" : "752", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2605", "Parent" : "741"},
	{"ID" : "753", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2606", "Parent" : "741"},
	{"ID" : "754", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2607", "Parent" : "741"},
	{"ID" : "755", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2608", "Parent" : "741"},
	{"ID" : "756", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2609", "Parent" : "741"},
	{"ID" : "757", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2610", "Parent" : "741"},
	{"ID" : "758", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2611", "Parent" : "741"},
	{"ID" : "759", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "741"},
	{"ID" : "760", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.mul_6ns_14ns_20_1_1_U2620", "Parent" : "740"},
	{"ID" : "761", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0", "Parent" : "594", "Child" : ["762"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["740"], "DependentChan" : "786", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "762", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["764"], "DependentChan" : "788", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "762", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["740"], "DependentChan" : "787", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["596"], "DependentChan" : "774", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["764"], "DependentChan" : "789", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "762", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "761", "Child" : ["763"],
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
	{"ID" : "763", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "762"},
	{"ID" : "764", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0", "Parent" : "594", "Child" : ["765", "767"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["761"], "DependentChan" : "788", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "765", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "765", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["761"], "DependentChan" : "789", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["596"], "DependentChan" : "775", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "765", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Parent" : "764", "Child" : ["766"],
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
	{"ID" : "766", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "765"},
	{"ID" : "767", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "764", "Child" : ["768", "769", "770", "771"],
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
	{"ID" : "768", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2641", "Parent" : "767"},
	{"ID" : "769", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2642", "Parent" : "767"},
	{"ID" : "770", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2643", "Parent" : "767"},
	{"ID" : "771", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "767"},
	{"ID" : "772", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.idx1_c_U", "Parent" : "594"},
	{"ID" : "773", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.mul_ln867_loc_channel_U", "Parent" : "594"},
	{"ID" : "774", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_fxp_loc_channel_U", "Parent" : "594"},
	{"ID" : "775", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.fuse_residual_loc_channel_U", "Parent" : "594"},
	{"ID" : "776", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c17_channel_U", "Parent" : "594"},
	{"ID" : "777", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c21_channel_U", "Parent" : "594"},
	{"ID" : "778", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.weight_stream_U", "Parent" : "594"},
	{"ID" : "779", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_activation_stream_U", "Parent" : "594"},
	{"ID" : "780", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_scale_stream_U", "Parent" : "594"},
	{"ID" : "781", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c16_U", "Parent" : "594"},
	{"ID" : "782", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c20_U", "Parent" : "594"},
	{"ID" : "783", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.group_stream_U", "Parent" : "594"},
	{"ID" : "784", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c_U", "Parent" : "594"},
	{"ID" : "785", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c19_U", "Parent" : "594"},
	{"ID" : "786", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.final_block_stream_U", "Parent" : "594"},
	{"ID" : "787", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c18_U", "Parent" : "594"},
	{"ID" : "788", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_stream_U", "Parent" : "594"},
	{"ID" : "789", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c_U", "Parent" : "594"},
	{"ID" : "790", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.linear_command_pe0_U", "Parent" : "1"},
	{"ID" : "791", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.linear_command_pe1_U", "Parent" : "1"},
	{"ID" : "792", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.linear_command_pe2_U", "Parent" : "1"},
	{"ID" : "793", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.linear_command_pe3_U", "Parent" : "1"},
	{"ID" : "794", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.quantized_pe0_U", "Parent" : "1"},
	{"ID" : "795", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.quantized_pe1_U", "Parent" : "1"},
	{"ID" : "796", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.quantized_pe2_U", "Parent" : "1"},
	{"ID" : "797", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.quantized_pe3_U", "Parent" : "1"},
	{"ID" : "798", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.activation_scale_pe0_U", "Parent" : "1"},
	{"ID" : "799", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.activation_scale_pe1_U", "Parent" : "1"},
	{"ID" : "800", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.activation_scale_pe2_U", "Parent" : "1"},
	{"ID" : "801", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_four_pes_fu_572.activation_scale_pe3_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
		p_out15 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "693618"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "693618"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 512 }  { m_axi_gmem0_WSTRB STRB 1 64 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 512 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 12 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	weight_bank0 { ap_none {  { weight_bank0 in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 512 }  { m_axi_gmem1_WSTRB STRB 1 64 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 512 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 12 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	weight_bank1 { ap_none {  { weight_bank1 in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem2_AWVALID VALID 1 1 }  { m_axi_gmem2_AWREADY READY 0 1 }  { m_axi_gmem2_AWADDR ADDR 1 64 }  { m_axi_gmem2_AWID ID 1 1 }  { m_axi_gmem2_AWLEN SIZE 1 32 }  { m_axi_gmem2_AWSIZE BURST 1 3 }  { m_axi_gmem2_AWBURST LOCK 1 2 }  { m_axi_gmem2_AWLOCK CACHE 1 2 }  { m_axi_gmem2_AWCACHE PROT 1 4 }  { m_axi_gmem2_AWPROT QOS 1 3 }  { m_axi_gmem2_AWQOS REGION 1 4 }  { m_axi_gmem2_AWREGION USER 1 4 }  { m_axi_gmem2_AWUSER DATA 1 1 }  { m_axi_gmem2_WVALID VALID 1 1 }  { m_axi_gmem2_WREADY READY 0 1 }  { m_axi_gmem2_WDATA FIFONUM 1 512 }  { m_axi_gmem2_WSTRB STRB 1 64 }  { m_axi_gmem2_WLAST LAST 1 1 }  { m_axi_gmem2_WID ID 1 1 }  { m_axi_gmem2_WUSER DATA 1 1 }  { m_axi_gmem2_ARVALID VALID 1 1 }  { m_axi_gmem2_ARREADY READY 0 1 }  { m_axi_gmem2_ARADDR ADDR 1 64 }  { m_axi_gmem2_ARID ID 1 1 }  { m_axi_gmem2_ARLEN SIZE 1 32 }  { m_axi_gmem2_ARSIZE BURST 1 3 }  { m_axi_gmem2_ARBURST LOCK 1 2 }  { m_axi_gmem2_ARLOCK CACHE 1 2 }  { m_axi_gmem2_ARCACHE PROT 1 4 }  { m_axi_gmem2_ARPROT QOS 1 3 }  { m_axi_gmem2_ARQOS REGION 1 4 }  { m_axi_gmem2_ARREGION USER 1 4 }  { m_axi_gmem2_ARUSER DATA 1 1 }  { m_axi_gmem2_RVALID VALID 0 1 }  { m_axi_gmem2_RREADY READY 1 1 }  { m_axi_gmem2_RDATA FIFONUM 0 512 }  { m_axi_gmem2_RLAST LAST 0 1 }  { m_axi_gmem2_RID ID 0 1 }  { m_axi_gmem2_RFIFONUM LEN 0 12 }  { m_axi_gmem2_RUSER DATA 0 1 }  { m_axi_gmem2_RRESP RESP 0 2 }  { m_axi_gmem2_BVALID VALID 0 1 }  { m_axi_gmem2_BREADY READY 1 1 }  { m_axi_gmem2_BRESP RESP 0 2 }  { m_axi_gmem2_BID ID 0 1 }  { m_axi_gmem2_BUSER DATA 0 1 } } }
	weight_bank2 { ap_none {  { weight_bank2 in_data 0 64 } } }
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 512 }  { m_axi_gmem3_WSTRB STRB 1 64 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 512 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 12 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	weight_bank3 { ap_none {  { weight_bank3 in_data 0 64 } } }
	activation_q { ap_memory {  { activation_q_address0 mem_address 1 9 }  { activation_q_ce0 mem_ce 1 1 }  { activation_q_we0 mem_we 1 1 }  { activation_q_d0 mem_din 1 480 }  { activation_q_q0 mem_dout 0 480 } } }
	activation_scale { ap_memory {  { activation_scale_address0 mem_address 1 5 }  { activation_scale_ce0 mem_ce 1 1 }  { activation_scale_we0 mem_we 1 1 }  { activation_scale_d0 mem_din 1 512 }  { activation_scale_q0 mem_dout 0 512 } } }
	quantized_stream_i { ap_fifo {  { quantized_stream_i_dout fifo_data_in 0 480 }  { quantized_stream_i_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_i_fifo_cap fifo_update 0 3 }  { quantized_stream_i_empty_n fifo_status 0 1 }  { quantized_stream_i_read fifo_port_we 1 1 } } }
	scale_stream_i { ap_fifo {  { scale_stream_i_dout fifo_data_in 0 32 }  { scale_stream_i_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_i_fifo_cap fifo_update 0 3 }  { scale_stream_i_empty_n fifo_status 0 1 }  { scale_stream_i_read fifo_port_we 1 1 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	output_pe0 { ap_memory {  { output_pe0_address0 mem_address 1 9 }  { output_pe0_ce0 mem_ce 1 1 }  { output_pe0_q0 mem_dout 0 512 }  { output_pe0_address1 MemPortADDR2 1 9 }  { output_pe0_ce1 MemPortCE2 1 1 }  { output_pe0_we1 MemPortWE2 1 1 }  { output_pe0_d1 MemPortDIN2 1 512 } } }
	output_pe1 { ap_memory {  { output_pe1_address0 mem_address 1 9 }  { output_pe1_ce0 mem_ce 1 1 }  { output_pe1_q0 mem_dout 0 512 }  { output_pe1_address1 MemPortADDR2 1 9 }  { output_pe1_ce1 MemPortCE2 1 1 }  { output_pe1_we1 MemPortWE2 1 1 }  { output_pe1_d1 MemPortDIN2 1 512 } } }
	output_pe2 { ap_memory {  { output_pe2_address0 mem_address 1 9 }  { output_pe2_ce0 mem_ce 1 1 }  { output_pe2_q0 mem_dout 0 512 }  { output_pe2_address1 MemPortADDR2 1 9 }  { output_pe2_ce1 MemPortCE2 1 1 }  { output_pe2_we1 MemPortWE2 1 1 }  { output_pe2_d1 MemPortDIN2 1 512 } } }
	output_pe3 { ap_memory {  { output_pe3_address0 mem_address 1 9 }  { output_pe3_ce0 mem_ce 1 1 }  { output_pe3_q0 mem_dout 0 512 }  { output_pe3_address1 MemPortADDR2 1 9 }  { output_pe3_ce1 MemPortCE2 1 1 }  { output_pe3_we1 MemPortWE2 1 1 }  { output_pe3_d1 MemPortDIN2 1 512 } } }
	controller_run_rmsnorm { ap_vld {  { controller_run_rmsnorm out_data 1 1 }  { controller_run_rmsnorm_ap_vld out_vld 1 1 } } }
	controller_rmsnorm_mode { ap_vld {  { controller_rmsnorm_mode out_data 1 2 }  { controller_rmsnorm_mode_ap_vld out_vld 1 1 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 1 } } }
	controller_run_linear_out { ap_vld {  { controller_run_linear_out out_data 1 1 }  { controller_run_linear_out_ap_vld out_vld 1 1 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 3 } } }
	controller_linear_mode_out { ap_vld {  { controller_linear_mode_out out_data 1 3 }  { controller_linear_mode_out_ap_vld out_vld 1 1 } } }
	controller_run_rope { ap_vld {  { controller_run_rope out_data 1 1 }  { controller_run_rope_ap_vld out_vld 1 1 } } }
	controller_run_swiglu { ap_vld {  { controller_run_swiglu out_data 1 1 }  { controller_run_swiglu_ap_vld out_vld 1 1 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 6 } } }
	controller_layer_index_out { ap_vld {  { controller_layer_index_out out_data 1 6 }  { controller_layer_index_out_ap_vld out_vld 1 1 } } }
	controller_exit { ap_vld {  { controller_exit out_data 1 1 }  { controller_exit_ap_vld out_vld 1 1 } } }
	idx { ap_none {  { idx in_data 0 25 } } }
	idx4 { ap_none {  { idx4 in_data 0 11 } } }
	controller_weight_scale_word_offset_constprop_out { ap_vld {  { controller_weight_scale_word_offset_constprop_out out_data 1 11 }  { controller_weight_scale_word_offset_constprop_out_ap_vld out_vld 1 1 } } }
	controller_weight_word_offset_constprop_out { ap_vld {  { controller_weight_word_offset_constprop_out out_data 1 24 }  { controller_weight_word_offset_constprop_out_ap_vld out_vld 1 1 } } }
	controller_weight_word_offset_constprop { ap_none {  { controller_weight_word_offset_constprop in_data 0 24 } } }
	controller_weight_scale_word_offset_constprop { ap_none {  { controller_weight_scale_word_offset_constprop in_data 0 11 } } }
	model_scale_cache0 { ap_memory {  { model_scale_cache0_address0 mem_address 1 11 }  { model_scale_cache0_ce0 mem_ce 1 1 }  { model_scale_cache0_q0 mem_dout 0 512 } } }
	model_scale_cache1 { ap_memory {  { model_scale_cache1_address0 mem_address 1 11 }  { model_scale_cache1_ce0 mem_ce 1 1 }  { model_scale_cache1_q0 mem_dout 0 512 } } }
	model_scale_cache2 { ap_memory {  { model_scale_cache2_address0 mem_address 1 11 }  { model_scale_cache2_ce0 mem_ce 1 1 }  { model_scale_cache2_q0 mem_dout 0 512 } } }
	model_scale_cache3 { ap_memory {  { model_scale_cache3_address0 mem_address 1 11 }  { model_scale_cache3_ce0 mem_ce 1 1 }  { model_scale_cache3_q0 mem_dout 0 512 } } }
}
