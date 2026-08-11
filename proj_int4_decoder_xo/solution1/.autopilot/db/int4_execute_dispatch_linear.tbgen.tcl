set moduleName int4_execute_dispatch_linear
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
set C_modelName {int4_execute_dispatch_linear}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem0 int 512 regular {axi_master 2}  }
	{ weight_bank0 int 64 regular {fifo 0}  }
	{ gmem1 int 512 regular {axi_master 2}  }
	{ weight_bank1 int 64 regular {fifo 0}  }
	{ gmem2 int 512 regular {axi_master 2}  }
	{ weight_bank2 int 64 regular {fifo 0}  }
	{ gmem3 int 512 regular {axi_master 2}  }
	{ weight_bank3 int 64 regular {fifo 0}  }
	{ activation_q int 480 regular {array 344 { 2 } 1 1 }  }
	{ activation_scale int 512 regular {array 22 { 2 } 1 1 }  }
	{ residual_pe0 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe1 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe2 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ residual_pe3 int 512 regular {array 64 { 1 0 } 1 1 }  }
	{ command_stream int 2 regular {fifo 0 volatile }  }
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
	{ logits_pe0 int 64 regular {fifo 0}  }
	{ logits_pe1 int 64 regular {fifo 0}  }
	{ logits_pe2 int 64 regular {fifo 0}  }
	{ logits_pe3 int 64 regular {fifo 0}  }
	{ controller_run_rmsnorm int 1 regular {pointer 1}  }
	{ controller_rmsnorm_mode int 2 regular {pointer 1}  }
	{ controller_run_linear_in int 1 regular {fifo 0}  }
	{ controller_run_linear_out int 1 regular {pointer 1}  }
	{ controller_linear_mode_in int 3 regular {fifo 0}  }
	{ controller_linear_mode_out int 3 regular {pointer 1}  }
	{ controller_run_rope int 1 regular {pointer 1}  }
	{ controller_run_swiglu int 1 regular {pointer 1}  }
	{ controller_layer_index_in int 6 regular {fifo 0}  }
	{ controller_layer_index_out int 6 regular {pointer 1}  }
	{ controller_exit int 1 regular {pointer 1}  }
	{ idx int 13 regular {fifo 0}  }
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
 	{ "Name" : "weight_bank0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank1","offset": { "type": "dynamic","port_name": "model_bank1","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe1","offset": { "type": "dynamic","port_name": "residual_pe1","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe1","offset": { "type": "dynamic","port_name": "logits_pe1","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe1","offset": { "type": "dynamic","port_name": "kv_cache_pe1","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank1", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem2", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank2","offset": { "type": "dynamic","port_name": "model_bank2","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe2","offset": { "type": "dynamic","port_name": "residual_pe2","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe2","offset": { "type": "dynamic","port_name": "logits_pe2","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe2","offset": { "type": "dynamic","port_name": "kv_cache_pe2","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank3","offset": { "type": "dynamic","port_name": "model_bank3","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe3","offset": { "type": "dynamic","port_name": "residual_pe3","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe3","offset": { "type": "dynamic","port_name": "logits_pe3","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe3","offset": { "type": "dynamic","port_name": "kv_cache_pe3","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_bank3", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "activation_q", "interface" : "memory", "bitwidth" : 480, "direction" : "READWRITE"} , 
 	{ "Name" : "activation_scale", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "residual_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "command_stream", "interface" : "fifo", "bitwidth" : 2, "direction" : "READONLY"} , 
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
 	{ "Name" : "logits_pe0", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe1", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe3", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_rmsnorm", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_rmsnorm_mode", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_linear_in", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_linear_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_linear_mode_in", "interface" : "fifo", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "controller_linear_mode_out", "interface" : "wire", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_rope", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_run_swiglu", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_layer_index_in", "interface" : "fifo", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "controller_layer_index_out", "interface" : "wire", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "controller_exit", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "fifo", "bitwidth" : 13, "direction" : "READONLY"} , 
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
set portNum 456
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
	{ weight_bank0_dout sc_in sc_lv 64 signal 1 } 
	{ weight_bank0_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ weight_bank0_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ weight_bank0_empty_n sc_in sc_logic 1 signal 1 } 
	{ weight_bank0_read sc_out sc_logic 1 signal 1 } 
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
	{ weight_bank1_dout sc_in sc_lv 64 signal 3 } 
	{ weight_bank1_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ weight_bank1_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ weight_bank1_empty_n sc_in sc_logic 1 signal 3 } 
	{ weight_bank1_read sc_out sc_logic 1 signal 3 } 
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
	{ weight_bank2_dout sc_in sc_lv 64 signal 5 } 
	{ weight_bank2_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ weight_bank2_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ weight_bank2_empty_n sc_in sc_logic 1 signal 5 } 
	{ weight_bank2_read sc_out sc_logic 1 signal 5 } 
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
	{ weight_bank3_dout sc_in sc_lv 64 signal 7 } 
	{ weight_bank3_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ weight_bank3_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ weight_bank3_empty_n sc_in sc_logic 1 signal 7 } 
	{ weight_bank3_read sc_out sc_logic 1 signal 7 } 
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
	{ residual_pe0_address0 sc_out sc_lv 6 signal 10 } 
	{ residual_pe0_ce0 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_q0 sc_in sc_lv 512 signal 10 } 
	{ residual_pe0_address1 sc_out sc_lv 6 signal 10 } 
	{ residual_pe0_ce1 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_we1 sc_out sc_logic 1 signal 10 } 
	{ residual_pe0_d1 sc_out sc_lv 512 signal 10 } 
	{ residual_pe1_address0 sc_out sc_lv 6 signal 11 } 
	{ residual_pe1_ce0 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_q0 sc_in sc_lv 512 signal 11 } 
	{ residual_pe1_address1 sc_out sc_lv 6 signal 11 } 
	{ residual_pe1_ce1 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_we1 sc_out sc_logic 1 signal 11 } 
	{ residual_pe1_d1 sc_out sc_lv 512 signal 11 } 
	{ residual_pe2_address0 sc_out sc_lv 6 signal 12 } 
	{ residual_pe2_ce0 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_q0 sc_in sc_lv 512 signal 12 } 
	{ residual_pe2_address1 sc_out sc_lv 6 signal 12 } 
	{ residual_pe2_ce1 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_we1 sc_out sc_logic 1 signal 12 } 
	{ residual_pe2_d1 sc_out sc_lv 512 signal 12 } 
	{ residual_pe3_address0 sc_out sc_lv 6 signal 13 } 
	{ residual_pe3_ce0 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_q0 sc_in sc_lv 512 signal 13 } 
	{ residual_pe3_address1 sc_out sc_lv 6 signal 13 } 
	{ residual_pe3_ce1 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_we1 sc_out sc_logic 1 signal 13 } 
	{ residual_pe3_d1 sc_out sc_lv 512 signal 13 } 
	{ command_stream_dout sc_in sc_lv 2 signal 14 } 
	{ command_stream_num_data_valid sc_in sc_lv 3 signal 14 } 
	{ command_stream_fifo_cap sc_in sc_lv 3 signal 14 } 
	{ command_stream_empty_n sc_in sc_logic 1 signal 14 } 
	{ command_stream_read sc_out sc_logic 1 signal 14 } 
	{ linear_stage0_address0 sc_out sc_lv 9 signal 15 } 
	{ linear_stage0_ce0 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_q0 sc_in sc_lv 512 signal 15 } 
	{ linear_stage0_address1 sc_out sc_lv 9 signal 15 } 
	{ linear_stage0_ce1 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_we1 sc_out sc_logic 1 signal 15 } 
	{ linear_stage0_d1 sc_out sc_lv 512 signal 15 } 
	{ linear_stage1_address0 sc_out sc_lv 9 signal 16 } 
	{ linear_stage1_ce0 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_q0 sc_in sc_lv 512 signal 16 } 
	{ linear_stage1_address1 sc_out sc_lv 9 signal 16 } 
	{ linear_stage1_ce1 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_we1 sc_out sc_logic 1 signal 16 } 
	{ linear_stage1_d1 sc_out sc_lv 512 signal 16 } 
	{ linear_stage2_address0 sc_out sc_lv 9 signal 17 } 
	{ linear_stage2_ce0 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_q0 sc_in sc_lv 512 signal 17 } 
	{ linear_stage2_address1 sc_out sc_lv 9 signal 17 } 
	{ linear_stage2_ce1 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_we1 sc_out sc_logic 1 signal 17 } 
	{ linear_stage2_d1 sc_out sc_lv 512 signal 17 } 
	{ linear_stage3_address0 sc_out sc_lv 9 signal 18 } 
	{ linear_stage3_ce0 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_q0 sc_in sc_lv 512 signal 18 } 
	{ linear_stage3_address1 sc_out sc_lv 9 signal 18 } 
	{ linear_stage3_ce1 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_we1 sc_out sc_logic 1 signal 18 } 
	{ linear_stage3_d1 sc_out sc_lv 512 signal 18 } 
	{ q_pe0_address0 sc_out sc_lv 6 signal 19 } 
	{ q_pe0_ce0 sc_out sc_logic 1 signal 19 } 
	{ q_pe0_we0 sc_out sc_logic 1 signal 19 } 
	{ q_pe0_d0 sc_out sc_lv 512 signal 19 } 
	{ q_pe1_address0 sc_out sc_lv 6 signal 20 } 
	{ q_pe1_ce0 sc_out sc_logic 1 signal 20 } 
	{ q_pe1_we0 sc_out sc_logic 1 signal 20 } 
	{ q_pe1_d0 sc_out sc_lv 512 signal 20 } 
	{ q_pe2_address0 sc_out sc_lv 6 signal 21 } 
	{ q_pe2_ce0 sc_out sc_logic 1 signal 21 } 
	{ q_pe2_we0 sc_out sc_logic 1 signal 21 } 
	{ q_pe2_d0 sc_out sc_lv 512 signal 21 } 
	{ q_pe3_address0 sc_out sc_lv 6 signal 22 } 
	{ q_pe3_ce0 sc_out sc_logic 1 signal 22 } 
	{ q_pe3_we0 sc_out sc_logic 1 signal 22 } 
	{ q_pe3_d0 sc_out sc_lv 512 signal 22 } 
	{ k_pe0_address0 sc_out sc_lv 6 signal 23 } 
	{ k_pe0_ce0 sc_out sc_logic 1 signal 23 } 
	{ k_pe0_we0 sc_out sc_logic 1 signal 23 } 
	{ k_pe0_d0 sc_out sc_lv 512 signal 23 } 
	{ k_pe1_address0 sc_out sc_lv 6 signal 24 } 
	{ k_pe1_ce0 sc_out sc_logic 1 signal 24 } 
	{ k_pe1_we0 sc_out sc_logic 1 signal 24 } 
	{ k_pe1_d0 sc_out sc_lv 512 signal 24 } 
	{ k_pe2_address0 sc_out sc_lv 6 signal 25 } 
	{ k_pe2_ce0 sc_out sc_logic 1 signal 25 } 
	{ k_pe2_we0 sc_out sc_logic 1 signal 25 } 
	{ k_pe2_d0 sc_out sc_lv 512 signal 25 } 
	{ k_pe3_address0 sc_out sc_lv 6 signal 26 } 
	{ k_pe3_ce0 sc_out sc_logic 1 signal 26 } 
	{ k_pe3_we0 sc_out sc_logic 1 signal 26 } 
	{ k_pe3_d0 sc_out sc_lv 512 signal 26 } 
	{ v_pe0_address0 sc_out sc_lv 6 signal 27 } 
	{ v_pe0_ce0 sc_out sc_logic 1 signal 27 } 
	{ v_pe0_we0 sc_out sc_logic 1 signal 27 } 
	{ v_pe0_d0 sc_out sc_lv 512 signal 27 } 
	{ v_pe1_address0 sc_out sc_lv 6 signal 28 } 
	{ v_pe1_ce0 sc_out sc_logic 1 signal 28 } 
	{ v_pe1_we0 sc_out sc_logic 1 signal 28 } 
	{ v_pe1_d0 sc_out sc_lv 512 signal 28 } 
	{ v_pe2_address0 sc_out sc_lv 6 signal 29 } 
	{ v_pe2_ce0 sc_out sc_logic 1 signal 29 } 
	{ v_pe2_we0 sc_out sc_logic 1 signal 29 } 
	{ v_pe2_d0 sc_out sc_lv 512 signal 29 } 
	{ v_pe3_address0 sc_out sc_lv 6 signal 30 } 
	{ v_pe3_ce0 sc_out sc_logic 1 signal 30 } 
	{ v_pe3_we0 sc_out sc_logic 1 signal 30 } 
	{ v_pe3_d0 sc_out sc_lv 512 signal 30 } 
	{ gate_pe0_address0 sc_out sc_lv 8 signal 31 } 
	{ gate_pe0_ce0 sc_out sc_logic 1 signal 31 } 
	{ gate_pe0_we0 sc_out sc_logic 1 signal 31 } 
	{ gate_pe0_d0 sc_out sc_lv 512 signal 31 } 
	{ gate_pe0_q0 sc_in sc_lv 512 signal 31 } 
	{ gate_pe1_address0 sc_out sc_lv 8 signal 32 } 
	{ gate_pe1_ce0 sc_out sc_logic 1 signal 32 } 
	{ gate_pe1_we0 sc_out sc_logic 1 signal 32 } 
	{ gate_pe1_d0 sc_out sc_lv 512 signal 32 } 
	{ gate_pe1_q0 sc_in sc_lv 512 signal 32 } 
	{ gate_pe2_address0 sc_out sc_lv 8 signal 33 } 
	{ gate_pe2_ce0 sc_out sc_logic 1 signal 33 } 
	{ gate_pe2_we0 sc_out sc_logic 1 signal 33 } 
	{ gate_pe2_d0 sc_out sc_lv 512 signal 33 } 
	{ gate_pe2_q0 sc_in sc_lv 512 signal 33 } 
	{ gate_pe3_address0 sc_out sc_lv 8 signal 34 } 
	{ gate_pe3_ce0 sc_out sc_logic 1 signal 34 } 
	{ gate_pe3_we0 sc_out sc_logic 1 signal 34 } 
	{ gate_pe3_d0 sc_out sc_lv 512 signal 34 } 
	{ gate_pe3_q0 sc_in sc_lv 512 signal 34 } 
	{ up_pe0_address0 sc_out sc_lv 8 signal 35 } 
	{ up_pe0_ce0 sc_out sc_logic 1 signal 35 } 
	{ up_pe0_we0 sc_out sc_logic 1 signal 35 } 
	{ up_pe0_d0 sc_out sc_lv 512 signal 35 } 
	{ up_pe0_q0 sc_in sc_lv 512 signal 35 } 
	{ up_pe1_address0 sc_out sc_lv 8 signal 36 } 
	{ up_pe1_ce0 sc_out sc_logic 1 signal 36 } 
	{ up_pe1_we0 sc_out sc_logic 1 signal 36 } 
	{ up_pe1_d0 sc_out sc_lv 512 signal 36 } 
	{ up_pe1_q0 sc_in sc_lv 512 signal 36 } 
	{ up_pe2_address0 sc_out sc_lv 8 signal 37 } 
	{ up_pe2_ce0 sc_out sc_logic 1 signal 37 } 
	{ up_pe2_we0 sc_out sc_logic 1 signal 37 } 
	{ up_pe2_d0 sc_out sc_lv 512 signal 37 } 
	{ up_pe2_q0 sc_in sc_lv 512 signal 37 } 
	{ up_pe3_address0 sc_out sc_lv 8 signal 38 } 
	{ up_pe3_ce0 sc_out sc_logic 1 signal 38 } 
	{ up_pe3_we0 sc_out sc_logic 1 signal 38 } 
	{ up_pe3_d0 sc_out sc_lv 512 signal 38 } 
	{ up_pe3_q0 sc_in sc_lv 512 signal 38 } 
	{ logits_pe0_dout sc_in sc_lv 64 signal 39 } 
	{ logits_pe0_num_data_valid sc_in sc_lv 3 signal 39 } 
	{ logits_pe0_fifo_cap sc_in sc_lv 3 signal 39 } 
	{ logits_pe0_empty_n sc_in sc_logic 1 signal 39 } 
	{ logits_pe0_read sc_out sc_logic 1 signal 39 } 
	{ logits_pe1_dout sc_in sc_lv 64 signal 40 } 
	{ logits_pe1_num_data_valid sc_in sc_lv 3 signal 40 } 
	{ logits_pe1_fifo_cap sc_in sc_lv 3 signal 40 } 
	{ logits_pe1_empty_n sc_in sc_logic 1 signal 40 } 
	{ logits_pe1_read sc_out sc_logic 1 signal 40 } 
	{ logits_pe2_dout sc_in sc_lv 64 signal 41 } 
	{ logits_pe2_num_data_valid sc_in sc_lv 3 signal 41 } 
	{ logits_pe2_fifo_cap sc_in sc_lv 3 signal 41 } 
	{ logits_pe2_empty_n sc_in sc_logic 1 signal 41 } 
	{ logits_pe2_read sc_out sc_logic 1 signal 41 } 
	{ logits_pe3_dout sc_in sc_lv 64 signal 42 } 
	{ logits_pe3_num_data_valid sc_in sc_lv 3 signal 42 } 
	{ logits_pe3_fifo_cap sc_in sc_lv 3 signal 42 } 
	{ logits_pe3_empty_n sc_in sc_logic 1 signal 42 } 
	{ logits_pe3_read sc_out sc_logic 1 signal 42 } 
	{ controller_run_rmsnorm sc_out sc_lv 1 signal 43 } 
	{ controller_run_rmsnorm_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ controller_rmsnorm_mode sc_out sc_lv 2 signal 44 } 
	{ controller_rmsnorm_mode_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ controller_run_linear_in_dout sc_in sc_lv 1 signal 45 } 
	{ controller_run_linear_in_num_data_valid sc_in sc_lv 3 signal 45 } 
	{ controller_run_linear_in_fifo_cap sc_in sc_lv 3 signal 45 } 
	{ controller_run_linear_in_empty_n sc_in sc_logic 1 signal 45 } 
	{ controller_run_linear_in_read sc_out sc_logic 1 signal 45 } 
	{ controller_run_linear_out sc_out sc_lv 1 signal 46 } 
	{ controller_run_linear_out_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ controller_linear_mode_in_dout sc_in sc_lv 3 signal 47 } 
	{ controller_linear_mode_in_num_data_valid sc_in sc_lv 3 signal 47 } 
	{ controller_linear_mode_in_fifo_cap sc_in sc_lv 3 signal 47 } 
	{ controller_linear_mode_in_empty_n sc_in sc_logic 1 signal 47 } 
	{ controller_linear_mode_in_read sc_out sc_logic 1 signal 47 } 
	{ controller_linear_mode_out sc_out sc_lv 3 signal 48 } 
	{ controller_linear_mode_out_ap_vld sc_out sc_logic 1 outvld 48 } 
	{ controller_run_rope sc_out sc_lv 1 signal 49 } 
	{ controller_run_rope_ap_vld sc_out sc_logic 1 outvld 49 } 
	{ controller_run_swiglu sc_out sc_lv 1 signal 50 } 
	{ controller_run_swiglu_ap_vld sc_out sc_logic 1 outvld 50 } 
	{ controller_layer_index_in_dout sc_in sc_lv 6 signal 51 } 
	{ controller_layer_index_in_num_data_valid sc_in sc_lv 3 signal 51 } 
	{ controller_layer_index_in_fifo_cap sc_in sc_lv 3 signal 51 } 
	{ controller_layer_index_in_empty_n sc_in sc_logic 1 signal 51 } 
	{ controller_layer_index_in_read sc_out sc_logic 1 signal 51 } 
	{ controller_layer_index_out sc_out sc_lv 6 signal 52 } 
	{ controller_layer_index_out_ap_vld sc_out sc_logic 1 outvld 52 } 
	{ controller_exit sc_out sc_lv 1 signal 53 } 
	{ controller_exit_ap_vld sc_out sc_logic 1 outvld 53 } 
	{ idx_dout sc_in sc_lv 13 signal 54 } 
	{ idx_num_data_valid sc_in sc_lv 3 signal 54 } 
	{ idx_fifo_cap sc_in sc_lv 3 signal 54 } 
	{ idx_empty_n sc_in sc_logic 1 signal 54 } 
	{ idx_read sc_out sc_logic 1 signal 54 } 
	{ controller_weight_word_offset_constprop_i sc_in sc_lv 24 signal 55 } 
	{ controller_weight_word_offset_constprop_o sc_out sc_lv 24 signal 55 } 
	{ controller_weight_word_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 55 } 
	{ controller_weight_scale_word_offset_constprop_i sc_in sc_lv 11 signal 56 } 
	{ controller_weight_scale_word_offset_constprop_o sc_out sc_lv 11 signal 56 } 
	{ controller_weight_scale_word_offset_constprop_o_ap_vld sc_out sc_logic 1 outvld 56 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 57 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 57 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 57 } 
	{ model_norm_cache1_address0 sc_out sc_lv 13 signal 58 } 
	{ model_norm_cache1_ce0 sc_out sc_logic 1 signal 58 } 
	{ model_norm_cache1_q0 sc_in sc_lv 512 signal 58 } 
	{ model_norm_cache2_address0 sc_out sc_lv 13 signal 59 } 
	{ model_norm_cache2_ce0 sc_out sc_logic 1 signal 59 } 
	{ model_norm_cache2_q0 sc_in sc_lv 512 signal 59 } 
	{ model_norm_cache3_address0 sc_out sc_lv 13 signal 60 } 
	{ model_norm_cache3_ce0 sc_out sc_logic 1 signal 60 } 
	{ model_norm_cache3_q0 sc_in sc_lv 512 signal 60 } 
	{ model_scale_cache0_address0 sc_out sc_lv 11 signal 61 } 
	{ model_scale_cache0_ce0 sc_out sc_logic 1 signal 61 } 
	{ model_scale_cache0_q0 sc_in sc_lv 512 signal 61 } 
	{ model_scale_cache1_address0 sc_out sc_lv 11 signal 62 } 
	{ model_scale_cache1_ce0 sc_out sc_logic 1 signal 62 } 
	{ model_scale_cache1_q0 sc_in sc_lv 512 signal 62 } 
	{ model_scale_cache2_address0 sc_out sc_lv 11 signal 63 } 
	{ model_scale_cache2_ce0 sc_out sc_logic 1 signal 63 } 
	{ model_scale_cache2_q0 sc_in sc_lv 512 signal 63 } 
	{ model_scale_cache3_address0 sc_out sc_lv 11 signal 64 } 
	{ model_scale_cache3_ce0 sc_out sc_logic 1 signal 64 } 
	{ model_scale_cache3_q0 sc_in sc_lv 512 signal 64 } 
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
 	{ "name": "weight_bank0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank0", "role": "dout" }} , 
 	{ "name": "weight_bank0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank0", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank0", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank0", "role": "empty_n" }} , 
 	{ "name": "weight_bank0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank0", "role": "read" }} , 
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
 	{ "name": "weight_bank1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank1", "role": "dout" }} , 
 	{ "name": "weight_bank1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank1", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank1", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank1", "role": "empty_n" }} , 
 	{ "name": "weight_bank1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank1", "role": "read" }} , 
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
 	{ "name": "weight_bank2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank2", "role": "dout" }} , 
 	{ "name": "weight_bank2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank2", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank2", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank2", "role": "empty_n" }} , 
 	{ "name": "weight_bank2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank2", "role": "read" }} , 
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
 	{ "name": "weight_bank3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank3", "role": "dout" }} , 
 	{ "name": "weight_bank3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank3", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank3", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank3", "role": "empty_n" }} , 
 	{ "name": "weight_bank3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank3", "role": "read" }} , 
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
 	{ "name": "residual_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe0", "role": "address0" }} , 
 	{ "name": "residual_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "ce0" }} , 
 	{ "name": "residual_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "q0" }} , 
 	{ "name": "residual_pe0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe0", "role": "address1" }} , 
 	{ "name": "residual_pe0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "ce1" }} , 
 	{ "name": "residual_pe0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe0", "role": "we1" }} , 
 	{ "name": "residual_pe0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe0", "role": "d1" }} , 
 	{ "name": "residual_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe1", "role": "address0" }} , 
 	{ "name": "residual_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "ce0" }} , 
 	{ "name": "residual_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "q0" }} , 
 	{ "name": "residual_pe1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe1", "role": "address1" }} , 
 	{ "name": "residual_pe1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "ce1" }} , 
 	{ "name": "residual_pe1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe1", "role": "we1" }} , 
 	{ "name": "residual_pe1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe1", "role": "d1" }} , 
 	{ "name": "residual_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe2", "role": "address0" }} , 
 	{ "name": "residual_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "ce0" }} , 
 	{ "name": "residual_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "q0" }} , 
 	{ "name": "residual_pe2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe2", "role": "address1" }} , 
 	{ "name": "residual_pe2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "ce1" }} , 
 	{ "name": "residual_pe2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe2", "role": "we1" }} , 
 	{ "name": "residual_pe2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe2", "role": "d1" }} , 
 	{ "name": "residual_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe3", "role": "address0" }} , 
 	{ "name": "residual_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "ce0" }} , 
 	{ "name": "residual_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "q0" }} , 
 	{ "name": "residual_pe3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "residual_pe3", "role": "address1" }} , 
 	{ "name": "residual_pe3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "ce1" }} , 
 	{ "name": "residual_pe3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "residual_pe3", "role": "we1" }} , 
 	{ "name": "residual_pe3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "residual_pe3", "role": "d1" }} , 
 	{ "name": "command_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "command_stream", "role": "dout" }} , 
 	{ "name": "command_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "command_stream", "role": "num_data_valid" }} , 
 	{ "name": "command_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "command_stream", "role": "fifo_cap" }} , 
 	{ "name": "command_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "command_stream", "role": "empty_n" }} , 
 	{ "name": "command_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "command_stream", "role": "read" }} , 
 	{ "name": "linear_stage0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage0", "role": "address0" }} , 
 	{ "name": "linear_stage0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "ce0" }} , 
 	{ "name": "linear_stage0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "q0" }} , 
 	{ "name": "linear_stage0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage0", "role": "address1" }} , 
 	{ "name": "linear_stage0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "ce1" }} , 
 	{ "name": "linear_stage0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "we1" }} , 
 	{ "name": "linear_stage0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "d1" }} , 
 	{ "name": "linear_stage1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage1", "role": "address0" }} , 
 	{ "name": "linear_stage1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "ce0" }} , 
 	{ "name": "linear_stage1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "q0" }} , 
 	{ "name": "linear_stage1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage1", "role": "address1" }} , 
 	{ "name": "linear_stage1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "ce1" }} , 
 	{ "name": "linear_stage1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "we1" }} , 
 	{ "name": "linear_stage1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "d1" }} , 
 	{ "name": "linear_stage2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage2", "role": "address0" }} , 
 	{ "name": "linear_stage2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "ce0" }} , 
 	{ "name": "linear_stage2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "q0" }} , 
 	{ "name": "linear_stage2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage2", "role": "address1" }} , 
 	{ "name": "linear_stage2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "ce1" }} , 
 	{ "name": "linear_stage2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "we1" }} , 
 	{ "name": "linear_stage2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "d1" }} , 
 	{ "name": "linear_stage3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage3", "role": "address0" }} , 
 	{ "name": "linear_stage3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "ce0" }} , 
 	{ "name": "linear_stage3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "q0" }} , 
 	{ "name": "linear_stage3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage3", "role": "address1" }} , 
 	{ "name": "linear_stage3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "ce1" }} , 
 	{ "name": "linear_stage3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "we1" }} , 
 	{ "name": "linear_stage3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "d1" }} , 
 	{ "name": "q_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe0", "role": "address0" }} , 
 	{ "name": "q_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe0", "role": "ce0" }} , 
 	{ "name": "q_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe0", "role": "we0" }} , 
 	{ "name": "q_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe0", "role": "d0" }} , 
 	{ "name": "q_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe1", "role": "address0" }} , 
 	{ "name": "q_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe1", "role": "ce0" }} , 
 	{ "name": "q_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe1", "role": "we0" }} , 
 	{ "name": "q_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe1", "role": "d0" }} , 
 	{ "name": "q_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe2", "role": "address0" }} , 
 	{ "name": "q_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe2", "role": "ce0" }} , 
 	{ "name": "q_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe2", "role": "we0" }} , 
 	{ "name": "q_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe2", "role": "d0" }} , 
 	{ "name": "q_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q_pe3", "role": "address0" }} , 
 	{ "name": "q_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe3", "role": "ce0" }} , 
 	{ "name": "q_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_pe3", "role": "we0" }} , 
 	{ "name": "q_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_pe3", "role": "d0" }} , 
 	{ "name": "k_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe0", "role": "address0" }} , 
 	{ "name": "k_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe0", "role": "ce0" }} , 
 	{ "name": "k_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe0", "role": "we0" }} , 
 	{ "name": "k_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe0", "role": "d0" }} , 
 	{ "name": "k_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe1", "role": "address0" }} , 
 	{ "name": "k_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe1", "role": "ce0" }} , 
 	{ "name": "k_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe1", "role": "we0" }} , 
 	{ "name": "k_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe1", "role": "d0" }} , 
 	{ "name": "k_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe2", "role": "address0" }} , 
 	{ "name": "k_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe2", "role": "ce0" }} , 
 	{ "name": "k_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe2", "role": "we0" }} , 
 	{ "name": "k_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe2", "role": "d0" }} , 
 	{ "name": "k_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k_pe3", "role": "address0" }} , 
 	{ "name": "k_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe3", "role": "ce0" }} , 
 	{ "name": "k_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_pe3", "role": "we0" }} , 
 	{ "name": "k_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_pe3", "role": "d0" }} , 
 	{ "name": "v_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe0", "role": "address0" }} , 
 	{ "name": "v_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe0", "role": "ce0" }} , 
 	{ "name": "v_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe0", "role": "we0" }} , 
 	{ "name": "v_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe0", "role": "d0" }} , 
 	{ "name": "v_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe1", "role": "address0" }} , 
 	{ "name": "v_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe1", "role": "ce0" }} , 
 	{ "name": "v_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe1", "role": "we0" }} , 
 	{ "name": "v_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe1", "role": "d0" }} , 
 	{ "name": "v_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe2", "role": "address0" }} , 
 	{ "name": "v_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe2", "role": "ce0" }} , 
 	{ "name": "v_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe2", "role": "we0" }} , 
 	{ "name": "v_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe2", "role": "d0" }} , 
 	{ "name": "v_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v_pe3", "role": "address0" }} , 
 	{ "name": "v_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe3", "role": "ce0" }} , 
 	{ "name": "v_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_pe3", "role": "we0" }} , 
 	{ "name": "v_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_pe3", "role": "d0" }} , 
 	{ "name": "gate_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe0", "role": "address0" }} , 
 	{ "name": "gate_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "ce0" }} , 
 	{ "name": "gate_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "we0" }} , 
 	{ "name": "gate_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "d0" }} , 
 	{ "name": "gate_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "q0" }} , 
 	{ "name": "gate_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe1", "role": "address0" }} , 
 	{ "name": "gate_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "ce0" }} , 
 	{ "name": "gate_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "we0" }} , 
 	{ "name": "gate_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "d0" }} , 
 	{ "name": "gate_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "q0" }} , 
 	{ "name": "gate_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe2", "role": "address0" }} , 
 	{ "name": "gate_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "ce0" }} , 
 	{ "name": "gate_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "we0" }} , 
 	{ "name": "gate_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "d0" }} , 
 	{ "name": "gate_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "q0" }} , 
 	{ "name": "gate_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe3", "role": "address0" }} , 
 	{ "name": "gate_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "ce0" }} , 
 	{ "name": "gate_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "we0" }} , 
 	{ "name": "gate_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "d0" }} , 
 	{ "name": "gate_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "q0" }} , 
 	{ "name": "up_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe0", "role": "address0" }} , 
 	{ "name": "up_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "ce0" }} , 
 	{ "name": "up_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "we0" }} , 
 	{ "name": "up_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "d0" }} , 
 	{ "name": "up_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "q0" }} , 
 	{ "name": "up_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe1", "role": "address0" }} , 
 	{ "name": "up_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "ce0" }} , 
 	{ "name": "up_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "we0" }} , 
 	{ "name": "up_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "d0" }} , 
 	{ "name": "up_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "q0" }} , 
 	{ "name": "up_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe2", "role": "address0" }} , 
 	{ "name": "up_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "ce0" }} , 
 	{ "name": "up_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "we0" }} , 
 	{ "name": "up_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "d0" }} , 
 	{ "name": "up_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "q0" }} , 
 	{ "name": "up_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe3", "role": "address0" }} , 
 	{ "name": "up_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "ce0" }} , 
 	{ "name": "up_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "we0" }} , 
 	{ "name": "up_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "d0" }} , 
 	{ "name": "up_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "q0" }} , 
 	{ "name": "logits_pe0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe0", "role": "dout" }} , 
 	{ "name": "logits_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe0", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe0", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe0", "role": "empty_n" }} , 
 	{ "name": "logits_pe0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe0", "role": "read" }} , 
 	{ "name": "logits_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe1", "role": "dout" }} , 
 	{ "name": "logits_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe1", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe1", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe1", "role": "empty_n" }} , 
 	{ "name": "logits_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe1", "role": "read" }} , 
 	{ "name": "logits_pe2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe2", "role": "dout" }} , 
 	{ "name": "logits_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe2", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe2", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe2", "role": "empty_n" }} , 
 	{ "name": "logits_pe2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe2", "role": "read" }} , 
 	{ "name": "logits_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe3", "role": "dout" }} , 
 	{ "name": "logits_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe3", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe3", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe3", "role": "empty_n" }} , 
 	{ "name": "logits_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe3", "role": "read" }} , 
 	{ "name": "controller_run_rmsnorm", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rmsnorm", "role": "default" }} , 
 	{ "name": "controller_run_rmsnorm_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rmsnorm", "role": "ap_vld" }} , 
 	{ "name": "controller_rmsnorm_mode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "controller_rmsnorm_mode", "role": "default" }} , 
 	{ "name": "controller_rmsnorm_mode_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_rmsnorm_mode", "role": "ap_vld" }} , 
 	{ "name": "controller_run_linear_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in", "role": "dout" }} , 
 	{ "name": "controller_run_linear_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_run_linear_in", "role": "num_data_valid" }} , 
 	{ "name": "controller_run_linear_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_run_linear_in", "role": "fifo_cap" }} , 
 	{ "name": "controller_run_linear_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in", "role": "empty_n" }} , 
 	{ "name": "controller_run_linear_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in", "role": "read" }} , 
 	{ "name": "controller_run_linear_out", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_out", "role": "default" }} , 
 	{ "name": "controller_run_linear_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_linear_out", "role": "ap_vld" }} , 
 	{ "name": "controller_linear_mode_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in", "role": "dout" }} , 
 	{ "name": "controller_linear_mode_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in", "role": "num_data_valid" }} , 
 	{ "name": "controller_linear_mode_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in", "role": "fifo_cap" }} , 
 	{ "name": "controller_linear_mode_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_linear_mode_in", "role": "empty_n" }} , 
 	{ "name": "controller_linear_mode_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_linear_mode_in", "role": "read" }} , 
 	{ "name": "controller_linear_mode_out", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_out", "role": "default" }} , 
 	{ "name": "controller_linear_mode_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_linear_mode_out", "role": "ap_vld" }} , 
 	{ "name": "controller_run_rope", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_rope", "role": "default" }} , 
 	{ "name": "controller_run_rope_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_rope", "role": "ap_vld" }} , 
 	{ "name": "controller_run_swiglu", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_swiglu", "role": "default" }} , 
 	{ "name": "controller_run_swiglu_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_run_swiglu", "role": "ap_vld" }} , 
 	{ "name": "controller_layer_index_in_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "controller_layer_index_in", "role": "dout" }} , 
 	{ "name": "controller_layer_index_in_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_layer_index_in", "role": "num_data_valid" }} , 
 	{ "name": "controller_layer_index_in_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_layer_index_in", "role": "fifo_cap" }} , 
 	{ "name": "controller_layer_index_in_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_layer_index_in", "role": "empty_n" }} , 
 	{ "name": "controller_layer_index_in_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_layer_index_in", "role": "read" }} , 
 	{ "name": "controller_layer_index_out", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "controller_layer_index_out", "role": "default" }} , 
 	{ "name": "controller_layer_index_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_layer_index_out", "role": "ap_vld" }} , 
 	{ "name": "controller_exit", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_exit", "role": "default" }} , 
 	{ "name": "controller_exit_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_exit", "role": "ap_vld" }} , 
 	{ "name": "idx_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "dout" }} , 
 	{ "name": "idx_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "idx", "role": "num_data_valid" }} , 
 	{ "name": "idx_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "idx", "role": "fifo_cap" }} , 
 	{ "name": "idx_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx", "role": "empty_n" }} , 
 	{ "name": "idx_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx", "role": "read" }} , 
 	{ "name": "controller_weight_word_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "i" }} , 
 	{ "name": "controller_weight_word_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "o" }} , 
 	{ "name": "controller_weight_word_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_word_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_i", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "i" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_o", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "o" }} , 
 	{ "name": "controller_weight_scale_word_offset_constprop_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "controller_weight_scale_word_offset_constprop", "role": "o_ap_vld" }} , 
 	{ "name": "model_norm_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "address0" }} , 
 	{ "name": "model_norm_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "ce0" }} , 
 	{ "name": "model_norm_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "q0" }} , 
 	{ "name": "model_norm_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "address0" }} , 
 	{ "name": "model_norm_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "ce0" }} , 
 	{ "name": "model_norm_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "q0" }} , 
 	{ "name": "model_norm_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "address0" }} , 
 	{ "name": "model_norm_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "ce0" }} , 
 	{ "name": "model_norm_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "q0" }} , 
 	{ "name": "model_norm_cache3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "address0" }} , 
 	{ "name": "model_norm_cache3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "ce0" }} , 
 	{ "name": "model_norm_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "q0" }} , 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "1009", "1011", "1013", "1015", "1017", "1019", "1021"],
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
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "gmem3", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gmem3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weight_bank3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "activation_q", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "activation_scale", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "residual_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "residual_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "rms_input_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "command_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "command_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage0", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage1", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage2", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1021", "SubInstance" : "grp_int4_route_linear_projection_7_s_fu_594", "Port" : "linear_stage3", "Inst_start_state" : "6", "Inst_end_state" : "7"},
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1017", "SubInstance" : "grp_int4_route_linear_projection_6_s_fu_554", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "1", "SubInstance" : "grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Port" : "linear_stage3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "output_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "linear_stage3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "q_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1019", "SubInstance" : "grp_int4_route_linear_projection_0_s_fu_574", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "k_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1015", "SubInstance" : "grp_int4_route_linear_projection_1_s_fu_534", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe2", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "v_pe3", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1013", "SubInstance" : "grp_int4_route_linear_projection_2_s_fu_514", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "gate_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "1011", "SubInstance" : "grp_int4_route_linear_projection_4_s_fu_494", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output0", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output1", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output2", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1009", "SubInstance" : "grp_int4_route_linear_projection_5_s_fu_474", "Port" : "output3", "Inst_start_state" : "5", "Inst_end_state" : "8"},
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "up_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "logits_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_rmsnorm", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_rmsnorm_mode", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_run_linear_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_run_linear_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_linear_mode_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_linear_mode_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_rope", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_run_swiglu", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_layer_index_in", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_layer_index_in_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_exit", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "idx", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_weight_word_offset_constprop", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "controller_weight_scale_word_offset_constprop", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_norm_cache3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_run_preprocess_and_linear_fu_377", "Port" : "model_scale_cache3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_execute_dispatch_linear_Pipeline_seed_linear_stage_with_residual_loop_fu_357.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377", "Parent" : "0", "Child" : ["4", "203", "204", "1006", "1007", "1008"],
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
			{"ID" : "4", "Name" : "int4_preprocess_activation_stream_U0"},
			{"ID" : "203", "Name" : "int4_run_preprocess_and_linear_Block_entry13_proc_U0"},
			{"ID" : "204", "Name" : "int4_linear_4pe_from_stream_U0"}],
		"OutputProcess" : [
			{"ID" : "204", "Name" : "int4_linear_4pe_from_stream_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "activation_q"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "activation_scale"}]},
			{"Name" : "rms_input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe0"}]},
			{"Name" : "rms_input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe1"}]},
			{"Name" : "rms_input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe2"}]},
			{"Name" : "rms_input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "rms_input_pe3"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe0"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe1"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "gate_pe3"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe0"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe1"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "up_pe3"}]},
			{"Name" : "preprocess_mode", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe0"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe1"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe2"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "output_pe3"}]},
			{"Name" : "controller_run_rmsnorm", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_rmsnorm"}]},
			{"Name" : "controller_rmsnorm_mode", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_rmsnorm_mode"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_linear_out"}]},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_linear_mode_out"}]},
			{"Name" : "controller_run_rope", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_rope"}]},
			{"Name" : "controller_run_swiglu", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_run_swiglu"}]},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_layer_index_out"}]},
			{"Name" : "controller_exit", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_exit"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx4", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx8", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx9", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx10", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx11", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_weight_scale_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_scale_word_offset_constprop_out"}]},
			{"Name" : "controller_weight_word_offset_constprop_out", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_word_offset_constprop_out"}]},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_preprocess_activation_stream_U0", "Port" : "model_norm_cache3"}]},
			{"Name" : "controller_weight_word_offset_constprop", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_word_offset_constprop"}]},
			{"Name" : "controller_weight_scale_word_offset_constprop", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "controller_weight_scale_word_offset_constprop"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "204", "SubInstance" : "int4_linear_4pe_from_stream_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0", "Parent" : "3", "Child" : ["5", "82"],
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
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["204"], "DependentChan" : "1006", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["204"], "DependentChan" : "1007", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112", "Parent" : "4", "Child" : ["6"],
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
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "6", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Parent" : "5", "Child" : ["7", "23", "39", "55", "71", "74", "75", "76", "77", "78", "79", "80", "81"],
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
			{"ID" : "7", "Name" : "int4_swiglu_quantize_pe0_U0"},
			{"ID" : "23", "Name" : "int4_swiglu_quantize_pe1_U0"},
			{"ID" : "39", "Name" : "int4_swiglu_quantize_pe2_U0"},
			{"ID" : "55", "Name" : "int4_swiglu_quantize_pe3_U0"}],
		"OutputProcess" : [
			{"ID" : "71", "Name" : "int4_swiglu_gather_streams_U0"}],
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "gate"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "up"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "up"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "up"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "55", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "up"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "scale_stream"}]}]},
	{"ID" : "7", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0", "Parent" : "6", "Child" : ["8", "9", "15", "19", "20", "21", "22"],
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
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "8", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.swiglu_group_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "7", "Child" : ["10", "11", "12", "13", "14"],
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
	{"ID" : "10", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U949", "Parent" : "9"},
	{"ID" : "11", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U951", "Parent" : "9"},
	{"ID" : "12", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U952", "Parent" : "9"},
	{"ID" : "13", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U953", "Parent" : "9"},
	{"ID" : "14", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "7", "Child" : ["16", "17", "18"],
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
	{"ID" : "16", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U964", "Parent" : "15"},
	{"ID" : "17", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U965", "Parent" : "15"},
	{"ID" : "18", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "19", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fmul_32ns_32ns_32_4_max_dsp_1_U969", "Parent" : "7"},
	{"ID" : "20", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U970", "Parent" : "7"},
	{"ID" : "21", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U971", "Parent" : "7"},
	{"ID" : "22", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fadd_32ns_32ns_32_7_full_dsp_1_U972", "Parent" : "7"},
	{"ID" : "23", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0", "Parent" : "6", "Child" : ["24", "25", "31", "35", "36", "37", "38"],
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
					{"ID" : "25", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "24", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.swiglu_group_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "23", "Child" : ["26", "27", "28", "29", "30"],
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
	{"ID" : "26", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U980", "Parent" : "25"},
	{"ID" : "27", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U982", "Parent" : "25"},
	{"ID" : "28", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U983", "Parent" : "25"},
	{"ID" : "29", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U984", "Parent" : "25"},
	{"ID" : "30", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "31", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "23", "Child" : ["32", "33", "34"],
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
	{"ID" : "32", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U993", "Parent" : "31"},
	{"ID" : "33", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U994", "Parent" : "31"},
	{"ID" : "34", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "35", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fmul_32ns_32ns_32_4_max_dsp_1_U998", "Parent" : "23"},
	{"ID" : "36", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U999", "Parent" : "23"},
	{"ID" : "37", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1000", "Parent" : "23"},
	{"ID" : "38", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1001", "Parent" : "23"},
	{"ID" : "39", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0", "Parent" : "6", "Child" : ["40", "41", "47", "51", "52", "53", "54"],
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
					{"ID" : "41", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "78", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "79", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "40", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.swiglu_group_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "39", "Child" : ["42", "43", "44", "45", "46"],
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
	{"ID" : "42", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1008", "Parent" : "41"},
	{"ID" : "43", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1010", "Parent" : "41"},
	{"ID" : "44", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1011", "Parent" : "41"},
	{"ID" : "45", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1012", "Parent" : "41"},
	{"ID" : "46", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "47", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "39", "Child" : ["48", "49", "50"],
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
	{"ID" : "48", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1021", "Parent" : "47"},
	{"ID" : "49", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1022", "Parent" : "47"},
	{"ID" : "50", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "47"},
	{"ID" : "51", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1026", "Parent" : "39"},
	{"ID" : "52", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1027", "Parent" : "39"},
	{"ID" : "53", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1028", "Parent" : "39"},
	{"ID" : "54", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1029", "Parent" : "39"},
	{"ID" : "55", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0", "Parent" : "6", "Child" : ["56", "57", "63", "67", "68", "69", "70"],
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
					{"ID" : "57", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "80", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "81", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "56", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.swiglu_group_U", "Parent" : "55"},
	{"ID" : "57", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "55", "Child" : ["58", "59", "60", "61", "62"],
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
	{"ID" : "58", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1036", "Parent" : "57"},
	{"ID" : "59", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1038", "Parent" : "57"},
	{"ID" : "60", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1039", "Parent" : "57"},
	{"ID" : "61", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1040", "Parent" : "57"},
	{"ID" : "62", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "63", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "55", "Child" : ["64", "65", "66"],
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
	{"ID" : "64", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1049", "Parent" : "63"},
	{"ID" : "65", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1050", "Parent" : "63"},
	{"ID" : "66", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "63"},
	{"ID" : "67", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1054", "Parent" : "55"},
	{"ID" : "68", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1055", "Parent" : "55"},
	{"ID" : "69", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1056", "Parent" : "55"},
	{"ID" : "70", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1057", "Parent" : "55"},
	{"ID" : "71", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0", "Parent" : "6", "Child" : ["72"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["23"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["39"], "DependentChan" : "78", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["55"], "DependentChan" : "80", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["7"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["23"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["39"], "DependentChan" : "79", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["55"], "DependentChan" : "81", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_local_tile_loop_swiglu_stream_pe_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "72", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Parent" : "71", "Child" : ["73"],
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
	{"ID" : "73", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88.flow_control_loop_pipe_sequential_init_U", "Parent" : "72"},
	{"ID" : "74", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe0_U", "Parent" : "6"},
	{"ID" : "75", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe0_U", "Parent" : "6"},
	{"ID" : "76", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe1_U", "Parent" : "6"},
	{"ID" : "77", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe1_U", "Parent" : "6"},
	{"ID" : "78", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe2_U", "Parent" : "6"},
	{"ID" : "79", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe2_U", "Parent" : "6"},
	{"ID" : "80", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe3_U", "Parent" : "6"},
	{"ID" : "81", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe3_U", "Parent" : "6"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Parent" : "4", "Child" : ["83", "132"],
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
					{"ID" : "83", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "quantized_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "scale_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}]},
	{"ID" : "83", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88", "Parent" : "82", "Child" : ["84", "94", "104", "114", "124", "128", "129", "130", "131"],
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
			{"ID" : "84", "Name" : "int4_rms_sumsq_pe_U0"},
			{"ID" : "94", "Name" : "int4_rms_sumsq_pe_10_U0"},
			{"ID" : "104", "Name" : "int4_rms_sumsq_pe_11_U0"},
			{"ID" : "114", "Name" : "int4_rms_sumsq_pe_12_U0"}],
		"OutputProcess" : [
			{"ID" : "124", "Name" : "int4_rms_merge_and_rsqrt_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "84", "SubInstance" : "int4_rms_sumsq_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "int4_rms_sumsq_pe_10_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "104", "SubInstance" : "int4_rms_sumsq_pe_11_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "114", "SubInstance" : "int4_rms_sumsq_pe_12_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "124", "SubInstance" : "int4_rms_merge_and_rsqrt_U0", "Port" : "reciprocal_rms"}]}]},
	{"ID" : "84", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0", "Parent" : "83", "Child" : ["85", "90", "93"],
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
					{"ID" : "85", "SubInstance" : "grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["124"], "DependentChan" : "128", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "85", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "84", "Child" : ["86", "87", "88", "89"],
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
	{"ID" : "86", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1112", "Parent" : "85"},
	{"ID" : "87", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1113", "Parent" : "85"},
	{"ID" : "88", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1114", "Parent" : "85"},
	{"ID" : "89", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "90", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "84", "Child" : ["91", "92"],
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
	{"ID" : "91", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1133", "Parent" : "90"},
	{"ID" : "92", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "90"},
	{"ID" : "93", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1151", "Parent" : "84"},
	{"ID" : "94", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0", "Parent" : "83", "Child" : ["95", "100", "103"],
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
					{"ID" : "95", "SubInstance" : "grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["124"], "DependentChan" : "129", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "95", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "94", "Child" : ["96", "97", "98", "99"],
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
	{"ID" : "96", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1156", "Parent" : "95"},
	{"ID" : "97", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1157", "Parent" : "95"},
	{"ID" : "98", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1158", "Parent" : "95"},
	{"ID" : "99", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "95"},
	{"ID" : "100", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "94", "Child" : ["101", "102"],
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
	{"ID" : "101", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1177", "Parent" : "100"},
	{"ID" : "102", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "100"},
	{"ID" : "103", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1195", "Parent" : "94"},
	{"ID" : "104", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0", "Parent" : "83", "Child" : ["105", "110", "113"],
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
					{"ID" : "105", "SubInstance" : "grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["124"], "DependentChan" : "130", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "105", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "104", "Child" : ["106", "107", "108", "109"],
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
	{"ID" : "106", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1199", "Parent" : "105"},
	{"ID" : "107", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1200", "Parent" : "105"},
	{"ID" : "108", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1201", "Parent" : "105"},
	{"ID" : "109", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "105"},
	{"ID" : "110", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "104", "Child" : ["111", "112"],
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
	{"ID" : "111", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1220", "Parent" : "110"},
	{"ID" : "112", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "110"},
	{"ID" : "113", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1238", "Parent" : "104"},
	{"ID" : "114", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0", "Parent" : "83", "Child" : ["115", "120", "123"],
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
					{"ID" : "115", "SubInstance" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["124"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "115", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "114", "Child" : ["116", "117", "118", "119"],
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
	{"ID" : "116", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1242", "Parent" : "115"},
	{"ID" : "117", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1243", "Parent" : "115"},
	{"ID" : "118", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1244", "Parent" : "115"},
	{"ID" : "119", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "115"},
	{"ID" : "120", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "114", "Child" : ["121", "122"],
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
	{"ID" : "121", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1263", "Parent" : "120"},
	{"ID" : "122", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "120"},
	{"ID" : "123", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1281", "Parent" : "114"},
	{"ID" : "124", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0", "Parent" : "83", "Child" : ["125", "126", "127"],
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
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["84"], "DependentChan" : "128", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["94"], "DependentChan" : "129", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["104"], "DependentChan" : "130", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["114"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "125", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1284", "Parent" : "124"},
	{"ID" : "126", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1285", "Parent" : "124"},
	{"ID" : "127", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.frsqrt_32ns_32ns_32_17_full_dsp_1_U1286", "Parent" : "124"},
	{"ID" : "128", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_0_U", "Parent" : "83"},
	{"ID" : "129", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_1_U", "Parent" : "83"},
	{"ID" : "130", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_2_U", "Parent" : "83"},
	{"ID" : "131", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_3_U", "Parent" : "83"},
	{"ID" : "132", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Parent" : "82", "Child" : ["133", "148", "163", "178", "193", "195", "196", "197", "198", "199", "200", "201", "202"],
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
			{"ID" : "133", "Name" : "int4_rms_normalize_quantize_pe_U0"},
			{"ID" : "148", "Name" : "int4_rms_normalize_quantize_pe_13_U0"},
			{"ID" : "163", "Name" : "int4_rms_normalize_quantize_pe_14_U0"},
			{"ID" : "178", "Name" : "int4_rms_normalize_quantize_pe_15_U0"}],
		"OutputProcess" : [
			{"ID" : "193", "Name" : "int4_rms_gather_streams_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "133", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "148", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "163", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "178", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "193", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "193", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "scale_stream"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "133", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "148", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "163", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "178", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "model_norm_cache3"}]}]},
	{"ID" : "133", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0", "Parent" : "132", "Child" : ["134", "135", "140", "145", "146", "147"],
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
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "195", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "196", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "model_norm_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "134", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.normalized_U", "Parent" : "133"},
	{"ID" : "135", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Parent" : "133", "Child" : ["136", "137", "138", "139"],
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
	{"ID" : "136", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "135"},
	{"ID" : "137", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1304", "Parent" : "135"},
	{"ID" : "138", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1305", "Parent" : "135"},
	{"ID" : "139", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "135"},
	{"ID" : "140", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "133", "Child" : ["141", "142", "143", "144"],
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
	{"ID" : "141", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1313", "Parent" : "140"},
	{"ID" : "142", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1316", "Parent" : "140"},
	{"ID" : "143", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1317", "Parent" : "140"},
	{"ID" : "144", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "140"},
	{"ID" : "145", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1321", "Parent" : "133"},
	{"ID" : "146", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1322", "Parent" : "133"},
	{"ID" : "147", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1323", "Parent" : "133"},
	{"ID" : "148", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0", "Parent" : "132", "Child" : ["149", "150", "155", "160", "161", "162"],
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
					{"ID" : "150", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "197", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "150", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "149", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.normalized_U", "Parent" : "148"},
	{"ID" : "150", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "148", "Child" : ["151", "152", "153", "154"],
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
	{"ID" : "151", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1331", "Parent" : "150"},
	{"ID" : "152", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1332", "Parent" : "150"},
	{"ID" : "153", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1333", "Parent" : "150"},
	{"ID" : "154", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "150"},
	{"ID" : "155", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "148", "Child" : ["156", "157", "158", "159"],
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
	{"ID" : "156", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1341", "Parent" : "155"},
	{"ID" : "157", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1344", "Parent" : "155"},
	{"ID" : "158", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1345", "Parent" : "155"},
	{"ID" : "159", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "155"},
	{"ID" : "160", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1349", "Parent" : "148"},
	{"ID" : "161", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1350", "Parent" : "148"},
	{"ID" : "162", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1351", "Parent" : "148"},
	{"ID" : "163", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0", "Parent" : "132", "Child" : ["164", "165", "170", "175", "176", "177"],
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
					{"ID" : "165", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "199", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "200", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "165", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "164", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.normalized_U", "Parent" : "163"},
	{"ID" : "165", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "163", "Child" : ["166", "167", "168", "169"],
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
	{"ID" : "166", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1359", "Parent" : "165"},
	{"ID" : "167", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1360", "Parent" : "165"},
	{"ID" : "168", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1361", "Parent" : "165"},
	{"ID" : "169", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "165"},
	{"ID" : "170", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "163", "Child" : ["171", "172", "173", "174"],
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
	{"ID" : "171", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1369", "Parent" : "170"},
	{"ID" : "172", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1372", "Parent" : "170"},
	{"ID" : "173", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1373", "Parent" : "170"},
	{"ID" : "174", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "170"},
	{"ID" : "175", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1377", "Parent" : "163"},
	{"ID" : "176", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1378", "Parent" : "163"},
	{"ID" : "177", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1379", "Parent" : "163"},
	{"ID" : "178", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0", "Parent" : "132", "Child" : ["179", "180", "185", "190", "191", "192"],
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
					{"ID" : "180", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "201", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["193"], "DependentChan" : "202", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "180", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "179", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.normalized_U", "Parent" : "178"},
	{"ID" : "180", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "178", "Child" : ["181", "182", "183", "184"],
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
	{"ID" : "181", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1387", "Parent" : "180"},
	{"ID" : "182", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1388", "Parent" : "180"},
	{"ID" : "183", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1389", "Parent" : "180"},
	{"ID" : "184", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "180"},
	{"ID" : "185", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "178", "Child" : ["186", "187", "188", "189"],
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
	{"ID" : "186", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "185"},
	{"ID" : "187", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "185"},
	{"ID" : "188", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "185"},
	{"ID" : "189", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "185"},
	{"ID" : "190", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1405", "Parent" : "178"},
	{"ID" : "191", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1406", "Parent" : "178"},
	{"ID" : "192", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1407", "Parent" : "178"},
	{"ID" : "193", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0", "Parent" : "132", "Child" : ["194"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["133"], "DependentChan" : "195", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["148"], "DependentChan" : "197", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["163"], "DependentChan" : "199", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["178"], "DependentChan" : "201", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["133"], "DependentChan" : "196", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["148"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["163"], "DependentChan" : "200", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["178"], "DependentChan" : "202", "DependentChanDepth" : "4", "DependentChanType" : "0",
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
	{"ID" : "194", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0.flow_control_loop_pipe_U", "Parent" : "193"},
	{"ID" : "195", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe0_U", "Parent" : "132"},
	{"ID" : "196", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe0_U", "Parent" : "132"},
	{"ID" : "197", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe1_U", "Parent" : "132"},
	{"ID" : "198", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe1_U", "Parent" : "132"},
	{"ID" : "199", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe2_U", "Parent" : "132"},
	{"ID" : "200", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe2_U", "Parent" : "132"},
	{"ID" : "201", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe3_U", "Parent" : "132"},
	{"ID" : "202", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_preprocess_activation_stream_U0.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe3_U", "Parent" : "132"},
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_run_preprocess_and_linear_Block_entry13_proc_U0", "Parent" : "3",
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
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0", "Parent" : "3", "Child" : ["205"],
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
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "1006", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream_i", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "1007", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["203"], "DependentChan" : "1008", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "output_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
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
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "205", "SubInstance" : "grp_int4_run_four_pes_fu_572", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "205", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572", "Parent" : "204", "Child" : ["206", "207", "210", "406", "602", "798", "994", "995", "996", "997", "998", "999", "1000", "1001", "1002", "1003", "1004", "1005"],
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
			{"ID" : "206", "Name" : "int4_broadcast_linear_commands_U0"},
			{"ID" : "207", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "210", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "406", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "602", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "798", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"OutputProcess" : [
			{"ID" : "207", "Name" : "int4_broadcast_activation_U0"},
			{"ID" : "210", "Name" : "int4_run_pe_dataflow_0_U0"},
			{"ID" : "406", "Name" : "int4_run_pe_dataflow_1_U0"},
			{"ID" : "602", "Name" : "int4_run_pe_dataflow_2_U0"},
			{"ID" : "798", "Name" : "int4_run_pe_dataflow_3_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "406", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "602", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "798", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "packed_scales"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "207", "SubInstance" : "int4_broadcast_activation_U0", "Port" : "scale_stream"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_pe0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "210", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "406", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "602", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "output_mem"}]},
			{"Name" : "output_pe3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "798", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "output_mem"}]},
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
					{"ID" : "210", "SubInstance" : "int4_run_pe_dataflow_0_U0", "Port" : "model_scale_cache0"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "406", "SubInstance" : "int4_run_pe_dataflow_1_U0", "Port" : "model_scale_cache1"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "602", "SubInstance" : "int4_run_pe_dataflow_2_U0", "Port" : "model_scale_cache2"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "798", "SubInstance" : "int4_run_pe_dataflow_3_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "206", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_linear_commands_U0", "Parent" : "205",
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
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210","212"], "DependentChan" : "994", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["406","408"], "DependentChan" : "995", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["602","604"], "DependentChan" : "996", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["798","800"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_fxp", "Type" : "None", "Direction" : "I"},
			{"Name" : "fuse_residual", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "207", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0", "Parent" : "205", "Child" : ["208"],
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
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210","216"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["406","412"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["602","608"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["798","804"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["210","216"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["406","412"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["602","608"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["798","804"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "208", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "208", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Parent" : "207", "Child" : ["209"],
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
	{"ID" : "209", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_broadcast_activation_U0.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141.flow_control_loop_pipe_sequential_init_U", "Parent" : "208"},
	{"ID" : "210", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0", "Parent" : "205", "Child" : ["211", "212", "214", "216", "224", "356", "377", "380", "388", "389", "390", "391", "392", "393", "394", "395", "396", "397", "398", "399", "400", "401", "402", "403", "404", "405"],
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
			{"ID" : "211", "Name" : "entry_proc56_U0"},
			{"ID" : "212", "Name" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0"},
			{"ID" : "214", "Name" : "int4_stream_pe_inputs_U0"},
			{"ID" : "356", "Name" : "int4_dequantize_final_blocks_U0"},
			{"ID" : "380", "Name" : "int4_write_outputs_9_U0"}],
		"OutputProcess" : [
			{"ID" : "380", "Name" : "int4_write_outputs_9_U0"}],
		"Port" : [
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "214", "SubInstance" : "int4_stream_pe_inputs_U0", "Port" : "gmem0"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "216", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "quantized_pe0"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "216", "SubInstance" : "int4_cache_and_replay_activation_0_U0", "Port" : "activation_scale_pe0"}]},
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "994", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "212", "SubInstance" : "int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Port" : "linear_command_pe0"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "380", "SubInstance" : "int4_write_outputs_9_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "356", "SubInstance" : "int4_dequantize_final_blocks_U0", "Port" : "model_scale_cache0"}]}]},
	{"ID" : "211", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.entry_proc56_U0", "Parent" : "210",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["356"], "DependentChan" : "388", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "212", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0", "Parent" : "210", "Child" : ["213"],
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
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "994", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "213", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_run_pe_dataflow_0_Block_entry2_proc20_U0.mul_6ns_6ns_12_1_1_U1535", "Parent" : "212"},
	{"ID" : "214", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0", "Parent" : "210", "Child" : ["215"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["224"], "DependentChan" : "394", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "389", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "215", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_pe_inputs_U0.flow_control_loop_pipe_U", "Parent" : "214"},
	{"ID" : "216", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0", "Parent" : "210", "Child" : ["217", "218", "219", "221", "223"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "998", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1002", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "219", "SubInstance" : "grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["224"], "DependentChan" : "395", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "221", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["356"], "DependentChan" : "396", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "221", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "393", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "392", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["224"], "DependentChan" : "397", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["224"], "DependentChan" : "398", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "217", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.activation_cache_U", "Parent" : "216"},
	{"ID" : "218", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.scale_cache_U", "Parent" : "216"},
	{"ID" : "219", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "216", "Child" : ["220"],
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
	{"ID" : "220", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_0_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "219"},
	{"ID" : "221", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111", "Parent" : "216", "Child" : ["222"],
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
	{"ID" : "222", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_3_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "221"},
	{"ID" : "223", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_cache_and_replay_activation_0_U0.mul_6ns_9ns_15_1_1_U1554", "Parent" : "216"},
	{"ID" : "224", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0", "Parent" : "210", "Child" : ["225", "355"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["214"], "DependentChan" : "394", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "225", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "395", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "225", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["356"], "DependentChan" : "399", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "225", "SubInstance" : "grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "398", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "397", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["356"], "DependentChan" : "400", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["356"], "DependentChan" : "401", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "225", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86", "Parent" : "224", "Child" : ["226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "352", "353", "354"],
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
	{"ID" : "226", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1566", "Parent" : "225"},
	{"ID" : "227", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1567", "Parent" : "225"},
	{"ID" : "228", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1568", "Parent" : "225"},
	{"ID" : "229", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1569", "Parent" : "225"},
	{"ID" : "230", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1570", "Parent" : "225"},
	{"ID" : "231", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1571", "Parent" : "225"},
	{"ID" : "232", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1572", "Parent" : "225"},
	{"ID" : "233", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1573", "Parent" : "225"},
	{"ID" : "234", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1574", "Parent" : "225"},
	{"ID" : "235", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1575", "Parent" : "225"},
	{"ID" : "236", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1576", "Parent" : "225"},
	{"ID" : "237", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1577", "Parent" : "225"},
	{"ID" : "238", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1578", "Parent" : "225"},
	{"ID" : "239", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1579", "Parent" : "225"},
	{"ID" : "240", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1580", "Parent" : "225"},
	{"ID" : "241", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1581", "Parent" : "225"},
	{"ID" : "242", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1582", "Parent" : "225"},
	{"ID" : "243", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1583", "Parent" : "225"},
	{"ID" : "244", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1584", "Parent" : "225"},
	{"ID" : "245", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1585", "Parent" : "225"},
	{"ID" : "246", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1586", "Parent" : "225"},
	{"ID" : "247", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1587", "Parent" : "225"},
	{"ID" : "248", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1588", "Parent" : "225"},
	{"ID" : "249", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1589", "Parent" : "225"},
	{"ID" : "250", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1590", "Parent" : "225"},
	{"ID" : "251", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1591", "Parent" : "225"},
	{"ID" : "252", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1592", "Parent" : "225"},
	{"ID" : "253", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1593", "Parent" : "225"},
	{"ID" : "254", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1594", "Parent" : "225"},
	{"ID" : "255", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1595", "Parent" : "225"},
	{"ID" : "256", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1596", "Parent" : "225"},
	{"ID" : "257", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1597", "Parent" : "225"},
	{"ID" : "258", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1598", "Parent" : "225"},
	{"ID" : "259", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1599", "Parent" : "225"},
	{"ID" : "260", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1600", "Parent" : "225"},
	{"ID" : "261", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1601", "Parent" : "225"},
	{"ID" : "262", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1602", "Parent" : "225"},
	{"ID" : "263", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1603", "Parent" : "225"},
	{"ID" : "264", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1604", "Parent" : "225"},
	{"ID" : "265", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1605", "Parent" : "225"},
	{"ID" : "266", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1606", "Parent" : "225"},
	{"ID" : "267", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1607", "Parent" : "225"},
	{"ID" : "268", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1608", "Parent" : "225"},
	{"ID" : "269", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1609", "Parent" : "225"},
	{"ID" : "270", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1610", "Parent" : "225"},
	{"ID" : "271", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1611", "Parent" : "225"},
	{"ID" : "272", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1612", "Parent" : "225"},
	{"ID" : "273", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1613", "Parent" : "225"},
	{"ID" : "274", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1614", "Parent" : "225"},
	{"ID" : "275", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1615", "Parent" : "225"},
	{"ID" : "276", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1616", "Parent" : "225"},
	{"ID" : "277", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1617", "Parent" : "225"},
	{"ID" : "278", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1618", "Parent" : "225"},
	{"ID" : "279", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1619", "Parent" : "225"},
	{"ID" : "280", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1620", "Parent" : "225"},
	{"ID" : "281", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1621", "Parent" : "225"},
	{"ID" : "282", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1622", "Parent" : "225"},
	{"ID" : "283", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1623", "Parent" : "225"},
	{"ID" : "284", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1624", "Parent" : "225"},
	{"ID" : "285", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1625", "Parent" : "225"},
	{"ID" : "286", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1626", "Parent" : "225"},
	{"ID" : "287", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1627", "Parent" : "225"},
	{"ID" : "288", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1628", "Parent" : "225"},
	{"ID" : "289", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1629", "Parent" : "225"},
	{"ID" : "290", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1630", "Parent" : "225"},
	{"ID" : "291", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1631", "Parent" : "225"},
	{"ID" : "292", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1632", "Parent" : "225"},
	{"ID" : "293", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1633", "Parent" : "225"},
	{"ID" : "294", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1634", "Parent" : "225"},
	{"ID" : "295", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1635", "Parent" : "225"},
	{"ID" : "296", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1636", "Parent" : "225"},
	{"ID" : "297", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1637", "Parent" : "225"},
	{"ID" : "298", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1638", "Parent" : "225"},
	{"ID" : "299", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1639", "Parent" : "225"},
	{"ID" : "300", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1640", "Parent" : "225"},
	{"ID" : "301", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1641", "Parent" : "225"},
	{"ID" : "302", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1642", "Parent" : "225"},
	{"ID" : "303", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1643", "Parent" : "225"},
	{"ID" : "304", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1644", "Parent" : "225"},
	{"ID" : "305", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1645", "Parent" : "225"},
	{"ID" : "306", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1646", "Parent" : "225"},
	{"ID" : "307", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1647", "Parent" : "225"},
	{"ID" : "308", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1648", "Parent" : "225"},
	{"ID" : "309", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mul_27s_15s_42_5_1_U1649", "Parent" : "225"},
	{"ID" : "310", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1650", "Parent" : "225"},
	{"ID" : "311", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1651", "Parent" : "225"},
	{"ID" : "312", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1652", "Parent" : "225"},
	{"ID" : "313", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.add_27ns_27s_27_2_1_U1653", "Parent" : "225"},
	{"ID" : "314", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1654", "Parent" : "225"},
	{"ID" : "315", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1655", "Parent" : "225"},
	{"ID" : "316", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1656", "Parent" : "225"},
	{"ID" : "317", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1657", "Parent" : "225"},
	{"ID" : "318", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1658", "Parent" : "225"},
	{"ID" : "319", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1659", "Parent" : "225"},
	{"ID" : "320", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1660", "Parent" : "225"},
	{"ID" : "321", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1661", "Parent" : "225"},
	{"ID" : "322", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1662", "Parent" : "225"},
	{"ID" : "323", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1663", "Parent" : "225"},
	{"ID" : "324", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1664", "Parent" : "225"},
	{"ID" : "325", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1665", "Parent" : "225"},
	{"ID" : "326", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1666", "Parent" : "225"},
	{"ID" : "327", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1667", "Parent" : "225"},
	{"ID" : "328", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1668", "Parent" : "225"},
	{"ID" : "329", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1669", "Parent" : "225"},
	{"ID" : "330", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1670", "Parent" : "225"},
	{"ID" : "331", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1671", "Parent" : "225"},
	{"ID" : "332", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1672", "Parent" : "225"},
	{"ID" : "333", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1673", "Parent" : "225"},
	{"ID" : "334", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1674", "Parent" : "225"},
	{"ID" : "335", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1675", "Parent" : "225"},
	{"ID" : "336", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1676", "Parent" : "225"},
	{"ID" : "337", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1677", "Parent" : "225"},
	{"ID" : "338", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1678", "Parent" : "225"},
	{"ID" : "339", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1679", "Parent" : "225"},
	{"ID" : "340", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1680", "Parent" : "225"},
	{"ID" : "341", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1681", "Parent" : "225"},
	{"ID" : "342", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1682", "Parent" : "225"},
	{"ID" : "343", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1683", "Parent" : "225"},
	{"ID" : "344", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1684", "Parent" : "225"},
	{"ID" : "345", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1685", "Parent" : "225"},
	{"ID" : "346", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1686", "Parent" : "225"},
	{"ID" : "347", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1687", "Parent" : "225"},
	{"ID" : "348", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1688", "Parent" : "225"},
	{"ID" : "349", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1689", "Parent" : "225"},
	{"ID" : "350", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1690", "Parent" : "225"},
	{"ID" : "351", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1691", "Parent" : "225"},
	{"ID" : "352", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1692", "Parent" : "225"},
	{"ID" : "353", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1693", "Parent" : "225"},
	{"ID" : "354", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.grp_int4_stream_integer_blocks_Pipeline_integer_local_tile_loop_integer_col_tile_loo_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "225"},
	{"ID" : "355", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_stream_integer_blocks_U0.mul_6ns_14ns_20_1_1_U1706", "Parent" : "224"},
	{"ID" : "356", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0", "Parent" : "210", "Child" : ["357", "376"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["224"], "DependentChan" : "399", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "357", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["216"], "DependentChan" : "396", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "357", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["377"], "DependentChan" : "402", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "357", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["224"], "DependentChan" : "401", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["224"], "DependentChan" : "400", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["211"], "DependentChan" : "388", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["377"], "DependentChan" : "403", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "357", "SubInstance" : "grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Port" : "model_scale_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "357", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90", "Parent" : "356", "Child" : ["358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369", "370", "371", "372", "373", "374", "375"],
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
	{"ID" : "358", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_U", "Parent" : "357"},
	{"ID" : "359", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_3_U", "Parent" : "357"},
	{"ID" : "360", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_2_U", "Parent" : "357"},
	{"ID" : "361", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.partial_1_U", "Parent" : "357"},
	{"ID" : "362", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1715", "Parent" : "357"},
	{"ID" : "363", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1716", "Parent" : "357"},
	{"ID" : "364", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1717", "Parent" : "357"},
	{"ID" : "365", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U1718", "Parent" : "357"},
	{"ID" : "366", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1719", "Parent" : "357"},
	{"ID" : "367", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1720", "Parent" : "357"},
	{"ID" : "368", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1721", "Parent" : "357"},
	{"ID" : "369", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1722", "Parent" : "357"},
	{"ID" : "370", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U1723", "Parent" : "357"},
	{"ID" : "371", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1724", "Parent" : "357"},
	{"ID" : "372", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1725", "Parent" : "357"},
	{"ID" : "373", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1726", "Parent" : "357"},
	{"ID" : "374", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.sitofp_32s_32_5_no_dsp_1_U1727", "Parent" : "357"},
	{"ID" : "375", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.grp_int4_dequantize_final_blocks_Pipeline_dequant_local_tile_loop_dequant_flat_block_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "357"},
	{"ID" : "376", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_dequantize_final_blocks_U0.mul_6ns_14ns_20_1_1_U1738", "Parent" : "356"},
	{"ID" : "377", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0", "Parent" : "210", "Child" : ["378"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["356"], "DependentChan" : "402", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "378", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["380"], "DependentChan" : "404", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "378", "SubInstance" : "grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["356"], "DependentChan" : "403", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "390", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["380"], "DependentChan" : "405", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "378", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "377", "Child" : ["379"],
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
	{"ID" : "379", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_pack_dequantized_outputs_U0.grp_int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "378"},
	{"ID" : "380", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0", "Parent" : "210", "Child" : ["381", "383"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["377"], "DependentChan" : "404", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "381", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "381", "SubInstance" : "grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["377"], "DependentChan" : "405", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["212"], "DependentChan" : "391", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "381", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239", "Parent" : "380", "Child" : ["382"],
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
	{"ID" : "382", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "381"},
	{"ID" : "383", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "380", "Child" : ["384", "385", "386", "387"],
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
	{"ID" : "384", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U1759", "Parent" : "383"},
	{"ID" : "385", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1760", "Parent" : "383"},
	{"ID" : "386", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U1761", "Parent" : "383"},
	{"ID" : "387", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.int4_write_outputs_9_U0.grp_int4_write_outputs_9_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "383"},
	{"ID" : "388", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.idx1_c_U", "Parent" : "210"},
	{"ID" : "389", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.mul_ln867_loc_channel_U", "Parent" : "210"},
	{"ID" : "390", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_fxp_loc_channel_U", "Parent" : "210"},
	{"ID" : "391", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.fuse_residual_loc_channel_U", "Parent" : "210"},
	{"ID" : "392", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c17_channel_U", "Parent" : "210"},
	{"ID" : "393", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c21_channel_U", "Parent" : "210"},
	{"ID" : "394", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.weight_stream_U", "Parent" : "210"},
	{"ID" : "395", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_activation_stream_U", "Parent" : "210"},
	{"ID" : "396", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.replay_scale_stream_U", "Parent" : "210"},
	{"ID" : "397", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c16_U", "Parent" : "210"},
	{"ID" : "398", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c20_U", "Parent" : "210"},
	{"ID" : "399", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.group_stream_U", "Parent" : "210"},
	{"ID" : "400", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.input_tiles_loc_c_U", "Parent" : "210"},
	{"ID" : "401", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c19_U", "Parent" : "210"},
	{"ID" : "402", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.final_block_stream_U", "Parent" : "210"},
	{"ID" : "403", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c18_U", "Parent" : "210"},
	{"ID" : "404", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.output_stream_U", "Parent" : "210"},
	{"ID" : "405", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_0_U0.local_tiles_loc_c_U", "Parent" : "210"},
	{"ID" : "406", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0", "Parent" : "205", "Child" : ["407", "408", "410", "412", "420", "552", "573", "576", "584", "585", "586", "587", "588", "589", "590", "591", "592", "593", "594", "595", "596", "597", "598", "599", "600", "601"],
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
			{"ID" : "407", "Name" : "entry_proc55_U0"},
			{"ID" : "408", "Name" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0"},
			{"ID" : "410", "Name" : "int4_stream_pe_inputs_16_U0"},
			{"ID" : "552", "Name" : "int4_dequantize_final_blocks_17_U0"},
			{"ID" : "576", "Name" : "int4_write_outputs_8_U0"}],
		"OutputProcess" : [
			{"ID" : "576", "Name" : "int4_write_outputs_8_U0"}],
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "410", "SubInstance" : "int4_stream_pe_inputs_16_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "412", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "quantized_pe1"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "412", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "activation_scale_pe1"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "995", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "408", "SubInstance" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Port" : "linear_command_pe1"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "576", "SubInstance" : "int4_write_outputs_8_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "552", "SubInstance" : "int4_dequantize_final_blocks_17_U0", "Port" : "model_scale_cache1"}]}]},
	{"ID" : "407", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.entry_proc55_U0", "Parent" : "406",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["552"], "DependentChan" : "584", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "408", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Parent" : "406", "Child" : ["409"],
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
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "995", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "409", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_run_pe_dataflow_1_Block_entry2_proc21_U0.mul_6ns_6ns_12_1_1_U1843", "Parent" : "408"},
	{"ID" : "410", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0", "Parent" : "406", "Child" : ["411"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["420"], "DependentChan" : "590", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["408"], "DependentChan" : "585", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "411", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_pe_inputs_16_U0.flow_control_loop_pipe_U", "Parent" : "410"},
	{"ID" : "412", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0", "Parent" : "406", "Child" : ["413", "414", "415", "417", "419"],
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
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "999", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "415", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1003", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "415", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["420"], "DependentChan" : "591", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "417", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["552"], "DependentChan" : "592", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "417", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["408"], "DependentChan" : "589", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["408"], "DependentChan" : "588", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["420"], "DependentChan" : "593", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["420"], "DependentChan" : "594", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "413", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.activation_cache_U", "Parent" : "412"},
	{"ID" : "414", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.scale_cache_U", "Parent" : "412"},
	{"ID" : "415", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "412", "Child" : ["416"],
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
	{"ID" : "416", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "415"},
	{"ID" : "417", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Parent" : "412", "Child" : ["418"],
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
	{"ID" : "418", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "417"},
	{"ID" : "419", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_cache_and_replay_activation_1_U0.mul_6ns_9ns_15_1_1_U1861", "Parent" : "412"},
	{"ID" : "420", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0", "Parent" : "406", "Child" : ["421", "551"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["410"], "DependentChan" : "590", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "421", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "591", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "421", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["552"], "DependentChan" : "595", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "421", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "594", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "593", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["552"], "DependentChan" : "596", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["552"], "DependentChan" : "597", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "421", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "420", "Child" : ["422", "423", "424", "425", "426", "427", "428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440", "441", "442", "443", "444", "445", "446", "447", "448", "449", "450", "451", "452", "453", "454", "455", "456", "457", "458", "459", "460", "461", "462", "463", "464", "465", "466", "467", "468", "469", "470", "471", "472", "473", "474", "475", "476", "477", "478", "479", "480", "481", "482", "483", "484", "485", "486", "487", "488", "489", "490", "491", "492", "493", "494", "495", "496", "497", "498", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512", "513", "514", "515", "516", "517", "518", "519", "520", "521", "522", "523", "524", "525", "526", "527", "528", "529", "530", "531", "532", "533", "534", "535", "536", "537", "538", "539", "540", "541", "542", "543", "544", "545", "546", "547", "548", "549", "550"],
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
	{"ID" : "422", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1870", "Parent" : "421"},
	{"ID" : "423", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1871", "Parent" : "421"},
	{"ID" : "424", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1872", "Parent" : "421"},
	{"ID" : "425", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1873", "Parent" : "421"},
	{"ID" : "426", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1874", "Parent" : "421"},
	{"ID" : "427", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1875", "Parent" : "421"},
	{"ID" : "428", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1876", "Parent" : "421"},
	{"ID" : "429", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1877", "Parent" : "421"},
	{"ID" : "430", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1878", "Parent" : "421"},
	{"ID" : "431", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1879", "Parent" : "421"},
	{"ID" : "432", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1880", "Parent" : "421"},
	{"ID" : "433", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1881", "Parent" : "421"},
	{"ID" : "434", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1882", "Parent" : "421"},
	{"ID" : "435", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1883", "Parent" : "421"},
	{"ID" : "436", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1884", "Parent" : "421"},
	{"ID" : "437", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1885", "Parent" : "421"},
	{"ID" : "438", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1886", "Parent" : "421"},
	{"ID" : "439", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1887", "Parent" : "421"},
	{"ID" : "440", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1888", "Parent" : "421"},
	{"ID" : "441", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1889", "Parent" : "421"},
	{"ID" : "442", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1890", "Parent" : "421"},
	{"ID" : "443", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1891", "Parent" : "421"},
	{"ID" : "444", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1892", "Parent" : "421"},
	{"ID" : "445", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1893", "Parent" : "421"},
	{"ID" : "446", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1894", "Parent" : "421"},
	{"ID" : "447", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1895", "Parent" : "421"},
	{"ID" : "448", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1896", "Parent" : "421"},
	{"ID" : "449", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1897", "Parent" : "421"},
	{"ID" : "450", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1898", "Parent" : "421"},
	{"ID" : "451", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1899", "Parent" : "421"},
	{"ID" : "452", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1900", "Parent" : "421"},
	{"ID" : "453", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1901", "Parent" : "421"},
	{"ID" : "454", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1902", "Parent" : "421"},
	{"ID" : "455", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1903", "Parent" : "421"},
	{"ID" : "456", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1904", "Parent" : "421"},
	{"ID" : "457", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1905", "Parent" : "421"},
	{"ID" : "458", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1906", "Parent" : "421"},
	{"ID" : "459", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1907", "Parent" : "421"},
	{"ID" : "460", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1908", "Parent" : "421"},
	{"ID" : "461", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1909", "Parent" : "421"},
	{"ID" : "462", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1910", "Parent" : "421"},
	{"ID" : "463", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1911", "Parent" : "421"},
	{"ID" : "464", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1912", "Parent" : "421"},
	{"ID" : "465", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1913", "Parent" : "421"},
	{"ID" : "466", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1914", "Parent" : "421"},
	{"ID" : "467", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1915", "Parent" : "421"},
	{"ID" : "468", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1916", "Parent" : "421"},
	{"ID" : "469", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1917", "Parent" : "421"},
	{"ID" : "470", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1918", "Parent" : "421"},
	{"ID" : "471", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1919", "Parent" : "421"},
	{"ID" : "472", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1920", "Parent" : "421"},
	{"ID" : "473", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1921", "Parent" : "421"},
	{"ID" : "474", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1922", "Parent" : "421"},
	{"ID" : "475", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1923", "Parent" : "421"},
	{"ID" : "476", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1924", "Parent" : "421"},
	{"ID" : "477", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1925", "Parent" : "421"},
	{"ID" : "478", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1926", "Parent" : "421"},
	{"ID" : "479", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1927", "Parent" : "421"},
	{"ID" : "480", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1928", "Parent" : "421"},
	{"ID" : "481", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1929", "Parent" : "421"},
	{"ID" : "482", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1930", "Parent" : "421"},
	{"ID" : "483", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1931", "Parent" : "421"},
	{"ID" : "484", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1932", "Parent" : "421"},
	{"ID" : "485", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1933", "Parent" : "421"},
	{"ID" : "486", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1934", "Parent" : "421"},
	{"ID" : "487", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1935", "Parent" : "421"},
	{"ID" : "488", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1936", "Parent" : "421"},
	{"ID" : "489", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1937", "Parent" : "421"},
	{"ID" : "490", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1938", "Parent" : "421"},
	{"ID" : "491", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1939", "Parent" : "421"},
	{"ID" : "492", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1940", "Parent" : "421"},
	{"ID" : "493", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1941", "Parent" : "421"},
	{"ID" : "494", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1942", "Parent" : "421"},
	{"ID" : "495", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1943", "Parent" : "421"},
	{"ID" : "496", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1944", "Parent" : "421"},
	{"ID" : "497", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1945", "Parent" : "421"},
	{"ID" : "498", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1946", "Parent" : "421"},
	{"ID" : "499", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1947", "Parent" : "421"},
	{"ID" : "500", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1948", "Parent" : "421"},
	{"ID" : "501", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1949", "Parent" : "421"},
	{"ID" : "502", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1950", "Parent" : "421"},
	{"ID" : "503", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1951", "Parent" : "421"},
	{"ID" : "504", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1952", "Parent" : "421"},
	{"ID" : "505", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1953", "Parent" : "421"},
	{"ID" : "506", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1954", "Parent" : "421"},
	{"ID" : "507", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1955", "Parent" : "421"},
	{"ID" : "508", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1956", "Parent" : "421"},
	{"ID" : "509", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1957", "Parent" : "421"},
	{"ID" : "510", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1958", "Parent" : "421"},
	{"ID" : "511", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1959", "Parent" : "421"},
	{"ID" : "512", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1960", "Parent" : "421"},
	{"ID" : "513", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1961", "Parent" : "421"},
	{"ID" : "514", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1962", "Parent" : "421"},
	{"ID" : "515", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1963", "Parent" : "421"},
	{"ID" : "516", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1964", "Parent" : "421"},
	{"ID" : "517", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1965", "Parent" : "421"},
	{"ID" : "518", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1966", "Parent" : "421"},
	{"ID" : "519", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1967", "Parent" : "421"},
	{"ID" : "520", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1968", "Parent" : "421"},
	{"ID" : "521", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1969", "Parent" : "421"},
	{"ID" : "522", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1970", "Parent" : "421"},
	{"ID" : "523", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1971", "Parent" : "421"},
	{"ID" : "524", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1972", "Parent" : "421"},
	{"ID" : "525", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1973", "Parent" : "421"},
	{"ID" : "526", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1974", "Parent" : "421"},
	{"ID" : "527", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1975", "Parent" : "421"},
	{"ID" : "528", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1976", "Parent" : "421"},
	{"ID" : "529", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1977", "Parent" : "421"},
	{"ID" : "530", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1978", "Parent" : "421"},
	{"ID" : "531", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1979", "Parent" : "421"},
	{"ID" : "532", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1980", "Parent" : "421"},
	{"ID" : "533", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1981", "Parent" : "421"},
	{"ID" : "534", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1982", "Parent" : "421"},
	{"ID" : "535", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1983", "Parent" : "421"},
	{"ID" : "536", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1984", "Parent" : "421"},
	{"ID" : "537", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1985", "Parent" : "421"},
	{"ID" : "538", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1986", "Parent" : "421"},
	{"ID" : "539", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1987", "Parent" : "421"},
	{"ID" : "540", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1988", "Parent" : "421"},
	{"ID" : "541", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1989", "Parent" : "421"},
	{"ID" : "542", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1990", "Parent" : "421"},
	{"ID" : "543", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1991", "Parent" : "421"},
	{"ID" : "544", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1992", "Parent" : "421"},
	{"ID" : "545", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1993", "Parent" : "421"},
	{"ID" : "546", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1994", "Parent" : "421"},
	{"ID" : "547", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1995", "Parent" : "421"},
	{"ID" : "548", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1996", "Parent" : "421"},
	{"ID" : "549", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1997", "Parent" : "421"},
	{"ID" : "550", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "421"},
	{"ID" : "551", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_stream_integer_blocks_5_U0.mul_6ns_14ns_20_1_1_U2003", "Parent" : "420"},
	{"ID" : "552", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0", "Parent" : "406", "Child" : ["553", "572"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["420"], "DependentChan" : "595", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "553", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["412"], "DependentChan" : "592", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "553", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["573"], "DependentChan" : "598", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "553", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["420"], "DependentChan" : "597", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["420"], "DependentChan" : "596", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["407"], "DependentChan" : "584", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["573"], "DependentChan" : "599", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "553", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "553", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "552", "Child" : ["554", "555", "556", "557", "558", "559", "560", "561", "562", "563", "564", "565", "566", "567", "568", "569", "570", "571"],
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
	{"ID" : "554", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "553"},
	{"ID" : "555", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_7_U", "Parent" : "553"},
	{"ID" : "556", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_8_U", "Parent" : "553"},
	{"ID" : "557", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_9_U", "Parent" : "553"},
	{"ID" : "558", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2011", "Parent" : "553"},
	{"ID" : "559", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2012", "Parent" : "553"},
	{"ID" : "560", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2013", "Parent" : "553"},
	{"ID" : "561", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2014", "Parent" : "553"},
	{"ID" : "562", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2015", "Parent" : "553"},
	{"ID" : "563", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2016", "Parent" : "553"},
	{"ID" : "564", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2017", "Parent" : "553"},
	{"ID" : "565", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2018", "Parent" : "553"},
	{"ID" : "566", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2019", "Parent" : "553"},
	{"ID" : "567", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2020", "Parent" : "553"},
	{"ID" : "568", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2021", "Parent" : "553"},
	{"ID" : "569", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2022", "Parent" : "553"},
	{"ID" : "570", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2023", "Parent" : "553"},
	{"ID" : "571", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "553"},
	{"ID" : "572", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_dequantize_final_blocks_17_U0.mul_6ns_14ns_20_1_1_U2032", "Parent" : "552"},
	{"ID" : "573", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0", "Parent" : "406", "Child" : ["574"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["552"], "DependentChan" : "598", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "574", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["576"], "DependentChan" : "600", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "574", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["552"], "DependentChan" : "599", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["408"], "DependentChan" : "586", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["576"], "DependentChan" : "601", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "574", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "573", "Child" : ["575"],
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
	{"ID" : "575", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "574"},
	{"ID" : "576", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0", "Parent" : "406", "Child" : ["577", "579"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["573"], "DependentChan" : "600", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "577", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "577", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["573"], "DependentChan" : "601", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["408"], "DependentChan" : "587", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "577", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Parent" : "576", "Child" : ["578"],
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
	{"ID" : "578", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "577"},
	{"ID" : "579", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "576", "Child" : ["580", "581", "582", "583"],
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
	{"ID" : "580", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2053", "Parent" : "579"},
	{"ID" : "581", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2054", "Parent" : "579"},
	{"ID" : "582", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2055", "Parent" : "579"},
	{"ID" : "583", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "579"},
	{"ID" : "584", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.idx1_c_U", "Parent" : "406"},
	{"ID" : "585", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.mul_ln867_loc_channel_U", "Parent" : "406"},
	{"ID" : "586", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_fxp_loc_channel_U", "Parent" : "406"},
	{"ID" : "587", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.fuse_residual_loc_channel_U", "Parent" : "406"},
	{"ID" : "588", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c17_channel_U", "Parent" : "406"},
	{"ID" : "589", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c21_channel_U", "Parent" : "406"},
	{"ID" : "590", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.weight_stream_U", "Parent" : "406"},
	{"ID" : "591", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_activation_stream_U", "Parent" : "406"},
	{"ID" : "592", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.replay_scale_stream_U", "Parent" : "406"},
	{"ID" : "593", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c16_U", "Parent" : "406"},
	{"ID" : "594", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c20_U", "Parent" : "406"},
	{"ID" : "595", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.group_stream_U", "Parent" : "406"},
	{"ID" : "596", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.input_tiles_loc_c_U", "Parent" : "406"},
	{"ID" : "597", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c19_U", "Parent" : "406"},
	{"ID" : "598", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.final_block_stream_U", "Parent" : "406"},
	{"ID" : "599", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c18_U", "Parent" : "406"},
	{"ID" : "600", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.output_stream_U", "Parent" : "406"},
	{"ID" : "601", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_1_U0.local_tiles_loc_c_U", "Parent" : "406"},
	{"ID" : "602", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0", "Parent" : "205", "Child" : ["603", "604", "606", "608", "616", "748", "769", "772", "780", "781", "782", "783", "784", "785", "786", "787", "788", "789", "790", "791", "792", "793", "794", "795", "796", "797"],
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
			{"ID" : "603", "Name" : "entry_proc54_U0"},
			{"ID" : "604", "Name" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0"},
			{"ID" : "606", "Name" : "int4_stream_pe_inputs_18_U0"},
			{"ID" : "748", "Name" : "int4_dequantize_final_blocks_19_U0"},
			{"ID" : "772", "Name" : "int4_write_outputs_7_U0"}],
		"OutputProcess" : [
			{"ID" : "772", "Name" : "int4_write_outputs_7_U0"}],
		"Port" : [
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "606", "SubInstance" : "int4_stream_pe_inputs_18_U0", "Port" : "gmem2"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "608", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "quantized_pe2"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "608", "SubInstance" : "int4_cache_and_replay_activation_2_U0", "Port" : "activation_scale_pe2"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "996", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "604", "SubInstance" : "int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Port" : "linear_command_pe2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "772", "SubInstance" : "int4_write_outputs_7_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "748", "SubInstance" : "int4_dequantize_final_blocks_19_U0", "Port" : "model_scale_cache2"}]}]},
	{"ID" : "603", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.entry_proc54_U0", "Parent" : "602",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["748"], "DependentChan" : "780", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "604", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0", "Parent" : "602", "Child" : ["605"],
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
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "996", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "605", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_run_pe_dataflow_2_Block_entry2_proc22_U0.mul_6ns_6ns_12_1_1_U2137", "Parent" : "604"},
	{"ID" : "606", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0", "Parent" : "602", "Child" : ["607"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["616"], "DependentChan" : "786", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["604"], "DependentChan" : "781", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "607", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_pe_inputs_18_U0.flow_control_loop_pipe_U", "Parent" : "606"},
	{"ID" : "608", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0", "Parent" : "602", "Child" : ["609", "610", "611", "613", "615"],
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
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1000", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "611", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1004", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "611", "SubInstance" : "grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["616"], "DependentChan" : "787", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "613", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["748"], "DependentChan" : "788", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "613", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["604"], "DependentChan" : "785", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["604"], "DependentChan" : "784", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["616"], "DependentChan" : "789", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["616"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "609", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.activation_cache_U", "Parent" : "608"},
	{"ID" : "610", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.scale_cache_U", "Parent" : "608"},
	{"ID" : "611", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "608", "Child" : ["612"],
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
	{"ID" : "612", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "611"},
	{"ID" : "613", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111", "Parent" : "608", "Child" : ["614"],
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
	{"ID" : "614", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "613"},
	{"ID" : "615", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_cache_and_replay_activation_2_U0.mul_6ns_9ns_15_1_1_U2155", "Parent" : "608"},
	{"ID" : "616", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0", "Parent" : "602", "Child" : ["617", "747"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["606"], "DependentChan" : "786", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "617", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "787", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "617", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["748"], "DependentChan" : "791", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "617", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "790", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "789", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["748"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["748"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "617", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "616", "Child" : ["618", "619", "620", "621", "622", "623", "624", "625", "626", "627", "628", "629", "630", "631", "632", "633", "634", "635", "636", "637", "638", "639", "640", "641", "642", "643", "644", "645", "646", "647", "648", "649", "650", "651", "652", "653", "654", "655", "656", "657", "658", "659", "660", "661", "662", "663", "664", "665", "666", "667", "668", "669", "670", "671", "672", "673", "674", "675", "676", "677", "678", "679", "680", "681", "682", "683", "684", "685", "686", "687", "688", "689", "690", "691", "692", "693", "694", "695", "696", "697", "698", "699", "700", "701", "702", "703", "704", "705", "706", "707", "708", "709", "710", "711", "712", "713", "714", "715", "716", "717", "718", "719", "720", "721", "722", "723", "724", "725", "726", "727", "728", "729", "730", "731", "732", "733", "734", "735", "736", "737", "738", "739", "740", "741", "742", "743", "744", "745", "746"],
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
	{"ID" : "618", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2164", "Parent" : "617"},
	{"ID" : "619", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2165", "Parent" : "617"},
	{"ID" : "620", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2166", "Parent" : "617"},
	{"ID" : "621", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2167", "Parent" : "617"},
	{"ID" : "622", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2168", "Parent" : "617"},
	{"ID" : "623", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2169", "Parent" : "617"},
	{"ID" : "624", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2170", "Parent" : "617"},
	{"ID" : "625", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2171", "Parent" : "617"},
	{"ID" : "626", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2172", "Parent" : "617"},
	{"ID" : "627", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2173", "Parent" : "617"},
	{"ID" : "628", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2174", "Parent" : "617"},
	{"ID" : "629", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2175", "Parent" : "617"},
	{"ID" : "630", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2176", "Parent" : "617"},
	{"ID" : "631", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2177", "Parent" : "617"},
	{"ID" : "632", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2178", "Parent" : "617"},
	{"ID" : "633", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2179", "Parent" : "617"},
	{"ID" : "634", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2180", "Parent" : "617"},
	{"ID" : "635", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2181", "Parent" : "617"},
	{"ID" : "636", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2182", "Parent" : "617"},
	{"ID" : "637", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2183", "Parent" : "617"},
	{"ID" : "638", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2184", "Parent" : "617"},
	{"ID" : "639", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2185", "Parent" : "617"},
	{"ID" : "640", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2186", "Parent" : "617"},
	{"ID" : "641", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2187", "Parent" : "617"},
	{"ID" : "642", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2188", "Parent" : "617"},
	{"ID" : "643", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2189", "Parent" : "617"},
	{"ID" : "644", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2190", "Parent" : "617"},
	{"ID" : "645", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2191", "Parent" : "617"},
	{"ID" : "646", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2192", "Parent" : "617"},
	{"ID" : "647", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2193", "Parent" : "617"},
	{"ID" : "648", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2194", "Parent" : "617"},
	{"ID" : "649", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2195", "Parent" : "617"},
	{"ID" : "650", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2196", "Parent" : "617"},
	{"ID" : "651", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2197", "Parent" : "617"},
	{"ID" : "652", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2198", "Parent" : "617"},
	{"ID" : "653", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2199", "Parent" : "617"},
	{"ID" : "654", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2200", "Parent" : "617"},
	{"ID" : "655", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2201", "Parent" : "617"},
	{"ID" : "656", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2202", "Parent" : "617"},
	{"ID" : "657", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2203", "Parent" : "617"},
	{"ID" : "658", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2204", "Parent" : "617"},
	{"ID" : "659", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2205", "Parent" : "617"},
	{"ID" : "660", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2206", "Parent" : "617"},
	{"ID" : "661", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2207", "Parent" : "617"},
	{"ID" : "662", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2208", "Parent" : "617"},
	{"ID" : "663", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2209", "Parent" : "617"},
	{"ID" : "664", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2210", "Parent" : "617"},
	{"ID" : "665", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2211", "Parent" : "617"},
	{"ID" : "666", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2212", "Parent" : "617"},
	{"ID" : "667", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2213", "Parent" : "617"},
	{"ID" : "668", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2214", "Parent" : "617"},
	{"ID" : "669", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2215", "Parent" : "617"},
	{"ID" : "670", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2216", "Parent" : "617"},
	{"ID" : "671", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2217", "Parent" : "617"},
	{"ID" : "672", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2218", "Parent" : "617"},
	{"ID" : "673", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2219", "Parent" : "617"},
	{"ID" : "674", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2220", "Parent" : "617"},
	{"ID" : "675", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2221", "Parent" : "617"},
	{"ID" : "676", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2222", "Parent" : "617"},
	{"ID" : "677", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2223", "Parent" : "617"},
	{"ID" : "678", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2224", "Parent" : "617"},
	{"ID" : "679", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2225", "Parent" : "617"},
	{"ID" : "680", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2226", "Parent" : "617"},
	{"ID" : "681", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2227", "Parent" : "617"},
	{"ID" : "682", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2228", "Parent" : "617"},
	{"ID" : "683", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2229", "Parent" : "617"},
	{"ID" : "684", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2230", "Parent" : "617"},
	{"ID" : "685", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2231", "Parent" : "617"},
	{"ID" : "686", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2232", "Parent" : "617"},
	{"ID" : "687", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2233", "Parent" : "617"},
	{"ID" : "688", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2234", "Parent" : "617"},
	{"ID" : "689", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2235", "Parent" : "617"},
	{"ID" : "690", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2236", "Parent" : "617"},
	{"ID" : "691", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2237", "Parent" : "617"},
	{"ID" : "692", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2238", "Parent" : "617"},
	{"ID" : "693", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2239", "Parent" : "617"},
	{"ID" : "694", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2240", "Parent" : "617"},
	{"ID" : "695", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2241", "Parent" : "617"},
	{"ID" : "696", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2242", "Parent" : "617"},
	{"ID" : "697", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2243", "Parent" : "617"},
	{"ID" : "698", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2244", "Parent" : "617"},
	{"ID" : "699", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2245", "Parent" : "617"},
	{"ID" : "700", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2246", "Parent" : "617"},
	{"ID" : "701", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2247", "Parent" : "617"},
	{"ID" : "702", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2248", "Parent" : "617"},
	{"ID" : "703", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2249", "Parent" : "617"},
	{"ID" : "704", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2250", "Parent" : "617"},
	{"ID" : "705", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2251", "Parent" : "617"},
	{"ID" : "706", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2252", "Parent" : "617"},
	{"ID" : "707", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2253", "Parent" : "617"},
	{"ID" : "708", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2254", "Parent" : "617"},
	{"ID" : "709", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2255", "Parent" : "617"},
	{"ID" : "710", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2256", "Parent" : "617"},
	{"ID" : "711", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2257", "Parent" : "617"},
	{"ID" : "712", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2258", "Parent" : "617"},
	{"ID" : "713", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2259", "Parent" : "617"},
	{"ID" : "714", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2260", "Parent" : "617"},
	{"ID" : "715", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2261", "Parent" : "617"},
	{"ID" : "716", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2262", "Parent" : "617"},
	{"ID" : "717", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2263", "Parent" : "617"},
	{"ID" : "718", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2264", "Parent" : "617"},
	{"ID" : "719", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2265", "Parent" : "617"},
	{"ID" : "720", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2266", "Parent" : "617"},
	{"ID" : "721", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2267", "Parent" : "617"},
	{"ID" : "722", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2268", "Parent" : "617"},
	{"ID" : "723", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2269", "Parent" : "617"},
	{"ID" : "724", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2270", "Parent" : "617"},
	{"ID" : "725", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2271", "Parent" : "617"},
	{"ID" : "726", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2272", "Parent" : "617"},
	{"ID" : "727", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2273", "Parent" : "617"},
	{"ID" : "728", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2274", "Parent" : "617"},
	{"ID" : "729", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2275", "Parent" : "617"},
	{"ID" : "730", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2276", "Parent" : "617"},
	{"ID" : "731", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2277", "Parent" : "617"},
	{"ID" : "732", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2278", "Parent" : "617"},
	{"ID" : "733", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2279", "Parent" : "617"},
	{"ID" : "734", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2280", "Parent" : "617"},
	{"ID" : "735", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2281", "Parent" : "617"},
	{"ID" : "736", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2282", "Parent" : "617"},
	{"ID" : "737", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2283", "Parent" : "617"},
	{"ID" : "738", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2284", "Parent" : "617"},
	{"ID" : "739", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2285", "Parent" : "617"},
	{"ID" : "740", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2286", "Parent" : "617"},
	{"ID" : "741", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2287", "Parent" : "617"},
	{"ID" : "742", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2288", "Parent" : "617"},
	{"ID" : "743", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2289", "Parent" : "617"},
	{"ID" : "744", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2290", "Parent" : "617"},
	{"ID" : "745", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2291", "Parent" : "617"},
	{"ID" : "746", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "617"},
	{"ID" : "747", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_stream_integer_blocks_3_U0.mul_6ns_14ns_20_1_1_U2297", "Parent" : "616"},
	{"ID" : "748", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0", "Parent" : "602", "Child" : ["749", "768"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["616"], "DependentChan" : "791", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "749", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["608"], "DependentChan" : "788", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "749", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["769"], "DependentChan" : "794", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "749", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["616"], "DependentChan" : "793", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["616"], "DependentChan" : "792", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["603"], "DependentChan" : "780", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["769"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "749", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "749", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "748", "Child" : ["750", "751", "752", "753", "754", "755", "756", "757", "758", "759", "760", "761", "762", "763", "764", "765", "766", "767"],
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
	{"ID" : "750", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "749"},
	{"ID" : "751", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_4_U", "Parent" : "749"},
	{"ID" : "752", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_5_U", "Parent" : "749"},
	{"ID" : "753", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_6_U", "Parent" : "749"},
	{"ID" : "754", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2305", "Parent" : "749"},
	{"ID" : "755", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2306", "Parent" : "749"},
	{"ID" : "756", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2307", "Parent" : "749"},
	{"ID" : "757", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2308", "Parent" : "749"},
	{"ID" : "758", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2309", "Parent" : "749"},
	{"ID" : "759", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2310", "Parent" : "749"},
	{"ID" : "760", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2311", "Parent" : "749"},
	{"ID" : "761", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2312", "Parent" : "749"},
	{"ID" : "762", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2313", "Parent" : "749"},
	{"ID" : "763", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2314", "Parent" : "749"},
	{"ID" : "764", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2315", "Parent" : "749"},
	{"ID" : "765", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2316", "Parent" : "749"},
	{"ID" : "766", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2317", "Parent" : "749"},
	{"ID" : "767", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "749"},
	{"ID" : "768", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_dequantize_final_blocks_19_U0.mul_6ns_14ns_20_1_1_U2326", "Parent" : "748"},
	{"ID" : "769", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0", "Parent" : "602", "Child" : ["770"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["748"], "DependentChan" : "794", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "770", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["772"], "DependentChan" : "796", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "770", "SubInstance" : "grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["748"], "DependentChan" : "795", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["604"], "DependentChan" : "782", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["772"], "DependentChan" : "797", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "770", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "769", "Child" : ["771"],
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
	{"ID" : "771", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_pack_dequantized_outputs_4_U0.grp_int4_pack_dequantized_outputs_4_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "770"},
	{"ID" : "772", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0", "Parent" : "602", "Child" : ["773", "775"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["769"], "DependentChan" : "796", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "773", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "773", "SubInstance" : "grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["769"], "DependentChan" : "797", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["604"], "DependentChan" : "783", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "773", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239", "Parent" : "772", "Child" : ["774"],
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
	{"ID" : "774", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "773"},
	{"ID" : "775", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "772", "Child" : ["776", "777", "778", "779"],
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
	{"ID" : "776", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2347", "Parent" : "775"},
	{"ID" : "777", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2348", "Parent" : "775"},
	{"ID" : "778", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2349", "Parent" : "775"},
	{"ID" : "779", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.int4_write_outputs_7_U0.grp_int4_write_outputs_7_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "775"},
	{"ID" : "780", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.idx1_c_U", "Parent" : "602"},
	{"ID" : "781", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.mul_ln867_loc_channel_U", "Parent" : "602"},
	{"ID" : "782", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_fxp_loc_channel_U", "Parent" : "602"},
	{"ID" : "783", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.fuse_residual_loc_channel_U", "Parent" : "602"},
	{"ID" : "784", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c17_channel_U", "Parent" : "602"},
	{"ID" : "785", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c21_channel_U", "Parent" : "602"},
	{"ID" : "786", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.weight_stream_U", "Parent" : "602"},
	{"ID" : "787", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_activation_stream_U", "Parent" : "602"},
	{"ID" : "788", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.replay_scale_stream_U", "Parent" : "602"},
	{"ID" : "789", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c16_U", "Parent" : "602"},
	{"ID" : "790", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c20_U", "Parent" : "602"},
	{"ID" : "791", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.group_stream_U", "Parent" : "602"},
	{"ID" : "792", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.input_tiles_loc_c_U", "Parent" : "602"},
	{"ID" : "793", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c19_U", "Parent" : "602"},
	{"ID" : "794", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.final_block_stream_U", "Parent" : "602"},
	{"ID" : "795", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c18_U", "Parent" : "602"},
	{"ID" : "796", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.output_stream_U", "Parent" : "602"},
	{"ID" : "797", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_2_U0.local_tiles_loc_c_U", "Parent" : "602"},
	{"ID" : "798", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0", "Parent" : "205", "Child" : ["799", "800", "802", "804", "812", "944", "965", "968", "976", "977", "978", "979", "980", "981", "982", "983", "984", "985", "986", "987", "988", "989", "990", "991", "992", "993"],
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
			{"ID" : "799", "Name" : "entry_proc_U0"},
			{"ID" : "800", "Name" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0"},
			{"ID" : "802", "Name" : "int4_stream_pe_inputs_20_U0"},
			{"ID" : "944", "Name" : "int4_dequantize_final_blocks_21_U0"},
			{"ID" : "968", "Name" : "int4_write_outputs_U0"}],
		"OutputProcess" : [
			{"ID" : "968", "Name" : "int4_write_outputs_U0"}],
		"Port" : [
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "802", "SubInstance" : "int4_stream_pe_inputs_20_U0", "Port" : "gmem3"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "804", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "quantized_pe3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "804", "SubInstance" : "int4_cache_and_replay_activation_3_U0", "Port" : "activation_scale_pe3"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "800", "SubInstance" : "int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Port" : "linear_command_pe3"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "968", "SubInstance" : "int4_write_outputs_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "944", "SubInstance" : "int4_dequantize_final_blocks_21_U0", "Port" : "model_scale_cache3"}]}]},
	{"ID" : "799", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.entry_proc_U0", "Parent" : "798",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["944"], "DependentChan" : "976", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "800", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0", "Parent" : "798", "Child" : ["801"],
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
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["206"], "DependentChan" : "997", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "801", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_run_pe_dataflow_3_Block_entry2_proc23_U0.mul_6ns_6ns_12_1_1_U2431", "Parent" : "800"},
	{"ID" : "802", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0", "Parent" : "798", "Child" : ["803"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["812"], "DependentChan" : "982", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["800"], "DependentChan" : "977", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "803", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_pe_inputs_20_U0.flow_control_loop_pipe_U", "Parent" : "802"},
	{"ID" : "804", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0", "Parent" : "798", "Child" : ["805", "806", "807", "809", "811"],
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
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1001", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "807", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["207"], "DependentChan" : "1005", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "807", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["812"], "DependentChan" : "983", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "809", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["944"], "DependentChan" : "984", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "809", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["800"], "DependentChan" : "981", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["800"], "DependentChan" : "980", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["812"], "DependentChan" : "985", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["812"], "DependentChan" : "986", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "805", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.activation_cache_U", "Parent" : "804"},
	{"ID" : "806", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.scale_cache_U", "Parent" : "804"},
	{"ID" : "807", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "804", "Child" : ["808"],
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
	{"ID" : "808", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "807"},
	{"ID" : "809", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Parent" : "804", "Child" : ["810"],
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
	{"ID" : "810", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "809"},
	{"ID" : "811", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_cache_and_replay_activation_3_U0.mul_6ns_9ns_15_1_1_U2449", "Parent" : "804"},
	{"ID" : "812", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0", "Parent" : "798", "Child" : ["813", "943"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["802"], "DependentChan" : "982", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "813", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["804"], "DependentChan" : "983", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "813", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["944"], "DependentChan" : "987", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "813", "SubInstance" : "grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["804"], "DependentChan" : "986", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["804"], "DependentChan" : "985", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["944"], "DependentChan" : "988", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["944"], "DependentChan" : "989", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "813", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "812", "Child" : ["814", "815", "816", "817", "818", "819", "820", "821", "822", "823", "824", "825", "826", "827", "828", "829", "830", "831", "832", "833", "834", "835", "836", "837", "838", "839", "840", "841", "842", "843", "844", "845", "846", "847", "848", "849", "850", "851", "852", "853", "854", "855", "856", "857", "858", "859", "860", "861", "862", "863", "864", "865", "866", "867", "868", "869", "870", "871", "872", "873", "874", "875", "876", "877", "878", "879", "880", "881", "882", "883", "884", "885", "886", "887", "888", "889", "890", "891", "892", "893", "894", "895", "896", "897", "898", "899", "900", "901", "902", "903", "904", "905", "906", "907", "908", "909", "910", "911", "912", "913", "914", "915", "916", "917", "918", "919", "920", "921", "922", "923", "924", "925", "926", "927", "928", "929", "930", "931", "932", "933", "934", "935", "936", "937", "938", "939", "940", "941", "942"],
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
	{"ID" : "814", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2458", "Parent" : "813"},
	{"ID" : "815", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2459", "Parent" : "813"},
	{"ID" : "816", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2460", "Parent" : "813"},
	{"ID" : "817", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2461", "Parent" : "813"},
	{"ID" : "818", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2462", "Parent" : "813"},
	{"ID" : "819", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2463", "Parent" : "813"},
	{"ID" : "820", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2464", "Parent" : "813"},
	{"ID" : "821", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2465", "Parent" : "813"},
	{"ID" : "822", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2466", "Parent" : "813"},
	{"ID" : "823", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2467", "Parent" : "813"},
	{"ID" : "824", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2468", "Parent" : "813"},
	{"ID" : "825", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2469", "Parent" : "813"},
	{"ID" : "826", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2470", "Parent" : "813"},
	{"ID" : "827", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2471", "Parent" : "813"},
	{"ID" : "828", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2472", "Parent" : "813"},
	{"ID" : "829", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2473", "Parent" : "813"},
	{"ID" : "830", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2474", "Parent" : "813"},
	{"ID" : "831", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2475", "Parent" : "813"},
	{"ID" : "832", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2476", "Parent" : "813"},
	{"ID" : "833", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2477", "Parent" : "813"},
	{"ID" : "834", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2478", "Parent" : "813"},
	{"ID" : "835", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2479", "Parent" : "813"},
	{"ID" : "836", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2480", "Parent" : "813"},
	{"ID" : "837", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2481", "Parent" : "813"},
	{"ID" : "838", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2482", "Parent" : "813"},
	{"ID" : "839", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2483", "Parent" : "813"},
	{"ID" : "840", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2484", "Parent" : "813"},
	{"ID" : "841", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2485", "Parent" : "813"},
	{"ID" : "842", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2486", "Parent" : "813"},
	{"ID" : "843", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2487", "Parent" : "813"},
	{"ID" : "844", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2488", "Parent" : "813"},
	{"ID" : "845", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2489", "Parent" : "813"},
	{"ID" : "846", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2490", "Parent" : "813"},
	{"ID" : "847", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2491", "Parent" : "813"},
	{"ID" : "848", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2492", "Parent" : "813"},
	{"ID" : "849", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2493", "Parent" : "813"},
	{"ID" : "850", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2494", "Parent" : "813"},
	{"ID" : "851", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2495", "Parent" : "813"},
	{"ID" : "852", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2496", "Parent" : "813"},
	{"ID" : "853", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2497", "Parent" : "813"},
	{"ID" : "854", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2498", "Parent" : "813"},
	{"ID" : "855", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2499", "Parent" : "813"},
	{"ID" : "856", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2500", "Parent" : "813"},
	{"ID" : "857", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2501", "Parent" : "813"},
	{"ID" : "858", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2502", "Parent" : "813"},
	{"ID" : "859", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2503", "Parent" : "813"},
	{"ID" : "860", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2504", "Parent" : "813"},
	{"ID" : "861", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2505", "Parent" : "813"},
	{"ID" : "862", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2506", "Parent" : "813"},
	{"ID" : "863", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2507", "Parent" : "813"},
	{"ID" : "864", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2508", "Parent" : "813"},
	{"ID" : "865", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2509", "Parent" : "813"},
	{"ID" : "866", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2510", "Parent" : "813"},
	{"ID" : "867", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2511", "Parent" : "813"},
	{"ID" : "868", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2512", "Parent" : "813"},
	{"ID" : "869", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2513", "Parent" : "813"},
	{"ID" : "870", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2514", "Parent" : "813"},
	{"ID" : "871", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2515", "Parent" : "813"},
	{"ID" : "872", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2516", "Parent" : "813"},
	{"ID" : "873", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2517", "Parent" : "813"},
	{"ID" : "874", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2518", "Parent" : "813"},
	{"ID" : "875", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2519", "Parent" : "813"},
	{"ID" : "876", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2520", "Parent" : "813"},
	{"ID" : "877", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2521", "Parent" : "813"},
	{"ID" : "878", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2522", "Parent" : "813"},
	{"ID" : "879", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2523", "Parent" : "813"},
	{"ID" : "880", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2524", "Parent" : "813"},
	{"ID" : "881", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2525", "Parent" : "813"},
	{"ID" : "882", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2526", "Parent" : "813"},
	{"ID" : "883", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2527", "Parent" : "813"},
	{"ID" : "884", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2528", "Parent" : "813"},
	{"ID" : "885", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2529", "Parent" : "813"},
	{"ID" : "886", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2530", "Parent" : "813"},
	{"ID" : "887", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2531", "Parent" : "813"},
	{"ID" : "888", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2532", "Parent" : "813"},
	{"ID" : "889", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2533", "Parent" : "813"},
	{"ID" : "890", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2534", "Parent" : "813"},
	{"ID" : "891", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2535", "Parent" : "813"},
	{"ID" : "892", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2536", "Parent" : "813"},
	{"ID" : "893", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2537", "Parent" : "813"},
	{"ID" : "894", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2538", "Parent" : "813"},
	{"ID" : "895", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2539", "Parent" : "813"},
	{"ID" : "896", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2540", "Parent" : "813"},
	{"ID" : "897", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2541", "Parent" : "813"},
	{"ID" : "898", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2542", "Parent" : "813"},
	{"ID" : "899", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2543", "Parent" : "813"},
	{"ID" : "900", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2544", "Parent" : "813"},
	{"ID" : "901", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2545", "Parent" : "813"},
	{"ID" : "902", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2546", "Parent" : "813"},
	{"ID" : "903", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2547", "Parent" : "813"},
	{"ID" : "904", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2548", "Parent" : "813"},
	{"ID" : "905", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2549", "Parent" : "813"},
	{"ID" : "906", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2550", "Parent" : "813"},
	{"ID" : "907", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2551", "Parent" : "813"},
	{"ID" : "908", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2552", "Parent" : "813"},
	{"ID" : "909", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2553", "Parent" : "813"},
	{"ID" : "910", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2554", "Parent" : "813"},
	{"ID" : "911", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2555", "Parent" : "813"},
	{"ID" : "912", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2556", "Parent" : "813"},
	{"ID" : "913", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2557", "Parent" : "813"},
	{"ID" : "914", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2558", "Parent" : "813"},
	{"ID" : "915", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2559", "Parent" : "813"},
	{"ID" : "916", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2560", "Parent" : "813"},
	{"ID" : "917", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2561", "Parent" : "813"},
	{"ID" : "918", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2562", "Parent" : "813"},
	{"ID" : "919", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2563", "Parent" : "813"},
	{"ID" : "920", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2564", "Parent" : "813"},
	{"ID" : "921", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2565", "Parent" : "813"},
	{"ID" : "922", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2566", "Parent" : "813"},
	{"ID" : "923", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2567", "Parent" : "813"},
	{"ID" : "924", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2568", "Parent" : "813"},
	{"ID" : "925", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2569", "Parent" : "813"},
	{"ID" : "926", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2570", "Parent" : "813"},
	{"ID" : "927", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2571", "Parent" : "813"},
	{"ID" : "928", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2572", "Parent" : "813"},
	{"ID" : "929", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2573", "Parent" : "813"},
	{"ID" : "930", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2574", "Parent" : "813"},
	{"ID" : "931", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2575", "Parent" : "813"},
	{"ID" : "932", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2576", "Parent" : "813"},
	{"ID" : "933", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2577", "Parent" : "813"},
	{"ID" : "934", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2578", "Parent" : "813"},
	{"ID" : "935", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2579", "Parent" : "813"},
	{"ID" : "936", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2580", "Parent" : "813"},
	{"ID" : "937", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2581", "Parent" : "813"},
	{"ID" : "938", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2582", "Parent" : "813"},
	{"ID" : "939", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2583", "Parent" : "813"},
	{"ID" : "940", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2584", "Parent" : "813"},
	{"ID" : "941", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2585", "Parent" : "813"},
	{"ID" : "942", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.grp_int4_stream_integer_blocks_1_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "813"},
	{"ID" : "943", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_stream_integer_blocks_1_U0.mul_6ns_14ns_20_1_1_U2591", "Parent" : "812"},
	{"ID" : "944", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0", "Parent" : "798", "Child" : ["945", "964"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["812"], "DependentChan" : "987", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "945", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["804"], "DependentChan" : "984", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "945", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["965"], "DependentChan" : "990", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "945", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["812"], "DependentChan" : "989", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["812"], "DependentChan" : "988", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["799"], "DependentChan" : "976", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["965"], "DependentChan" : "991", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "945", "SubInstance" : "grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "945", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "944", "Child" : ["946", "947", "948", "949", "950", "951", "952", "953", "954", "955", "956", "957", "958", "959", "960", "961", "962", "963"],
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
	{"ID" : "946", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "945"},
	{"ID" : "947", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_1_U", "Parent" : "945"},
	{"ID" : "948", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_2_U", "Parent" : "945"},
	{"ID" : "949", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_3_U", "Parent" : "945"},
	{"ID" : "950", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2599", "Parent" : "945"},
	{"ID" : "951", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2600", "Parent" : "945"},
	{"ID" : "952", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2601", "Parent" : "945"},
	{"ID" : "953", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2602", "Parent" : "945"},
	{"ID" : "954", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2603", "Parent" : "945"},
	{"ID" : "955", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2604", "Parent" : "945"},
	{"ID" : "956", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2605", "Parent" : "945"},
	{"ID" : "957", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2606", "Parent" : "945"},
	{"ID" : "958", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2607", "Parent" : "945"},
	{"ID" : "959", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2608", "Parent" : "945"},
	{"ID" : "960", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2609", "Parent" : "945"},
	{"ID" : "961", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2610", "Parent" : "945"},
	{"ID" : "962", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2611", "Parent" : "945"},
	{"ID" : "963", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.grp_int4_dequantize_final_blocks_21_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "945"},
	{"ID" : "964", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_dequantize_final_blocks_21_U0.mul_6ns_14ns_20_1_1_U2620", "Parent" : "944"},
	{"ID" : "965", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0", "Parent" : "798", "Child" : ["966"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["944"], "DependentChan" : "990", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "966", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["968"], "DependentChan" : "992", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "966", "SubInstance" : "grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["944"], "DependentChan" : "991", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["800"], "DependentChan" : "978", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["968"], "DependentChan" : "993", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "966", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "965", "Child" : ["967"],
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
	{"ID" : "967", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_pack_dequantized_outputs_2_U0.grp_int4_pack_dequantized_outputs_2_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "966"},
	{"ID" : "968", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0", "Parent" : "798", "Child" : ["969", "971"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["965"], "DependentChan" : "992", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "969", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "969", "SubInstance" : "grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["965"], "DependentChan" : "993", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["800"], "DependentChan" : "979", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "969", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239", "Parent" : "968", "Child" : ["970"],
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
	{"ID" : "970", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "969"},
	{"ID" : "971", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "968", "Child" : ["972", "973", "974", "975"],
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
	{"ID" : "972", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2641", "Parent" : "971"},
	{"ID" : "973", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2642", "Parent" : "971"},
	{"ID" : "974", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2643", "Parent" : "971"},
	{"ID" : "975", "Level" : "7", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.int4_write_outputs_U0.grp_int4_write_outputs_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "971"},
	{"ID" : "976", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.idx1_c_U", "Parent" : "798"},
	{"ID" : "977", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.mul_ln867_loc_channel_U", "Parent" : "798"},
	{"ID" : "978", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_fxp_loc_channel_U", "Parent" : "798"},
	{"ID" : "979", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.fuse_residual_loc_channel_U", "Parent" : "798"},
	{"ID" : "980", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c17_channel_U", "Parent" : "798"},
	{"ID" : "981", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c21_channel_U", "Parent" : "798"},
	{"ID" : "982", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.weight_stream_U", "Parent" : "798"},
	{"ID" : "983", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_activation_stream_U", "Parent" : "798"},
	{"ID" : "984", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.replay_scale_stream_U", "Parent" : "798"},
	{"ID" : "985", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c16_U", "Parent" : "798"},
	{"ID" : "986", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c20_U", "Parent" : "798"},
	{"ID" : "987", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.group_stream_U", "Parent" : "798"},
	{"ID" : "988", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.input_tiles_loc_c_U", "Parent" : "798"},
	{"ID" : "989", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c19_U", "Parent" : "798"},
	{"ID" : "990", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.final_block_stream_U", "Parent" : "798"},
	{"ID" : "991", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c18_U", "Parent" : "798"},
	{"ID" : "992", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.output_stream_U", "Parent" : "798"},
	{"ID" : "993", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.int4_run_pe_dataflow_3_U0.local_tiles_loc_c_U", "Parent" : "798"},
	{"ID" : "994", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe0_U", "Parent" : "205"},
	{"ID" : "995", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe1_U", "Parent" : "205"},
	{"ID" : "996", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe2_U", "Parent" : "205"},
	{"ID" : "997", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.linear_command_pe3_U", "Parent" : "205"},
	{"ID" : "998", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe0_U", "Parent" : "205"},
	{"ID" : "999", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe1_U", "Parent" : "205"},
	{"ID" : "1000", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe2_U", "Parent" : "205"},
	{"ID" : "1001", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.quantized_pe3_U", "Parent" : "205"},
	{"ID" : "1002", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe0_U", "Parent" : "205"},
	{"ID" : "1003", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe1_U", "Parent" : "205"},
	{"ID" : "1004", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe2_U", "Parent" : "205"},
	{"ID" : "1005", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.int4_linear_4pe_from_stream_U0.grp_int4_run_four_pes_fu_572.activation_scale_pe3_U", "Parent" : "205"},
	{"ID" : "1006", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.quantized_stream_U", "Parent" : "3"},
	{"ID" : "1007", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.scale_stream_U", "Parent" : "3"},
	{"ID" : "1008", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_run_preprocess_and_linear_fu_377.icmp_ln113_loc_i_channel_U", "Parent" : "3"},
	{"ID" : "1009", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_5_s_fu_474", "Parent" : "0", "Child" : ["1010"],
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
	{"ID" : "1010", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_5_s_fu_474.flow_control_loop_pipe_sequential_init_U", "Parent" : "1009"},
	{"ID" : "1011", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_4_s_fu_494", "Parent" : "0", "Child" : ["1012"],
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
	{"ID" : "1012", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_4_s_fu_494.flow_control_loop_pipe_sequential_init_U", "Parent" : "1011"},
	{"ID" : "1013", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_2_s_fu_514", "Parent" : "0", "Child" : ["1014"],
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
	{"ID" : "1014", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_2_s_fu_514.flow_control_loop_pipe_sequential_init_U", "Parent" : "1013"},
	{"ID" : "1015", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_1_s_fu_534", "Parent" : "0", "Child" : ["1016"],
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
	{"ID" : "1016", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_1_s_fu_534.flow_control_loop_pipe_sequential_init_U", "Parent" : "1015"},
	{"ID" : "1017", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_6_s_fu_554", "Parent" : "0", "Child" : ["1018"],
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
	{"ID" : "1018", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_6_s_fu_554.flow_control_loop_pipe_sequential_init_U", "Parent" : "1017"},
	{"ID" : "1019", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_0_s_fu_574", "Parent" : "0", "Child" : ["1020"],
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
	{"ID" : "1020", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_0_s_fu_574.flow_control_loop_pipe_sequential_init_U", "Parent" : "1019"},
	{"ID" : "1021", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_7_s_fu_594", "Parent" : "0", "Child" : ["1022"],
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
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "linear_stage3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem0_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output0", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem1_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output1", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem2_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output2", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "1022", "SubInstance" : "grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Port" : "gmem3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output3", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1022", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_7_s_fu_594.grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134", "Parent" : "1021", "Child" : ["1023"],
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
	{"ID" : "1023", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_route_linear_projection_7_s_fu_594.grp_int4_route_linear_projection_7_Pipeline_route_linear_projection_loop_fu_134.flow_control_loop_pipe_sequential_init_U", "Parent" : "1022"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "79", "Max" : "694273"}
	, {"Name" : "Interval", "Min" : "79", "Max" : "694273"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 512 }  { m_axi_gmem0_WSTRB STRB 1 64 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 512 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 12 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	weight_bank0 { ap_fifo {  { weight_bank0_dout fifo_data_in 0 64 }  { weight_bank0_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank0_fifo_cap fifo_update 0 3 }  { weight_bank0_empty_n fifo_status 0 1 }  { weight_bank0_read fifo_port_we 1 1 } } }
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 512 }  { m_axi_gmem1_WSTRB STRB 1 64 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 512 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 12 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	weight_bank1 { ap_fifo {  { weight_bank1_dout fifo_data_in 0 64 }  { weight_bank1_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank1_fifo_cap fifo_update 0 3 }  { weight_bank1_empty_n fifo_status 0 1 }  { weight_bank1_read fifo_port_we 1 1 } } }
	 { m_axi {  { m_axi_gmem2_AWVALID VALID 1 1 }  { m_axi_gmem2_AWREADY READY 0 1 }  { m_axi_gmem2_AWADDR ADDR 1 64 }  { m_axi_gmem2_AWID ID 1 1 }  { m_axi_gmem2_AWLEN SIZE 1 32 }  { m_axi_gmem2_AWSIZE BURST 1 3 }  { m_axi_gmem2_AWBURST LOCK 1 2 }  { m_axi_gmem2_AWLOCK CACHE 1 2 }  { m_axi_gmem2_AWCACHE PROT 1 4 }  { m_axi_gmem2_AWPROT QOS 1 3 }  { m_axi_gmem2_AWQOS REGION 1 4 }  { m_axi_gmem2_AWREGION USER 1 4 }  { m_axi_gmem2_AWUSER DATA 1 1 }  { m_axi_gmem2_WVALID VALID 1 1 }  { m_axi_gmem2_WREADY READY 0 1 }  { m_axi_gmem2_WDATA FIFONUM 1 512 }  { m_axi_gmem2_WSTRB STRB 1 64 }  { m_axi_gmem2_WLAST LAST 1 1 }  { m_axi_gmem2_WID ID 1 1 }  { m_axi_gmem2_WUSER DATA 1 1 }  { m_axi_gmem2_ARVALID VALID 1 1 }  { m_axi_gmem2_ARREADY READY 0 1 }  { m_axi_gmem2_ARADDR ADDR 1 64 }  { m_axi_gmem2_ARID ID 1 1 }  { m_axi_gmem2_ARLEN SIZE 1 32 }  { m_axi_gmem2_ARSIZE BURST 1 3 }  { m_axi_gmem2_ARBURST LOCK 1 2 }  { m_axi_gmem2_ARLOCK CACHE 1 2 }  { m_axi_gmem2_ARCACHE PROT 1 4 }  { m_axi_gmem2_ARPROT QOS 1 3 }  { m_axi_gmem2_ARQOS REGION 1 4 }  { m_axi_gmem2_ARREGION USER 1 4 }  { m_axi_gmem2_ARUSER DATA 1 1 }  { m_axi_gmem2_RVALID VALID 0 1 }  { m_axi_gmem2_RREADY READY 1 1 }  { m_axi_gmem2_RDATA FIFONUM 0 512 }  { m_axi_gmem2_RLAST LAST 0 1 }  { m_axi_gmem2_RID ID 0 1 }  { m_axi_gmem2_RFIFONUM LEN 0 12 }  { m_axi_gmem2_RUSER DATA 0 1 }  { m_axi_gmem2_RRESP RESP 0 2 }  { m_axi_gmem2_BVALID VALID 0 1 }  { m_axi_gmem2_BREADY READY 1 1 }  { m_axi_gmem2_BRESP RESP 0 2 }  { m_axi_gmem2_BID ID 0 1 }  { m_axi_gmem2_BUSER DATA 0 1 } } }
	weight_bank2 { ap_fifo {  { weight_bank2_dout fifo_data_in 0 64 }  { weight_bank2_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank2_fifo_cap fifo_update 0 3 }  { weight_bank2_empty_n fifo_status 0 1 }  { weight_bank2_read fifo_port_we 1 1 } } }
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 512 }  { m_axi_gmem3_WSTRB STRB 1 64 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 512 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 12 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	weight_bank3 { ap_fifo {  { weight_bank3_dout fifo_data_in 0 64 }  { weight_bank3_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank3_fifo_cap fifo_update 0 3 }  { weight_bank3_empty_n fifo_status 0 1 }  { weight_bank3_read fifo_port_we 1 1 } } }
	activation_q { ap_memory {  { activation_q_address0 mem_address 1 9 }  { activation_q_ce0 mem_ce 1 1 }  { activation_q_we0 mem_we 1 1 }  { activation_q_d0 mem_din 1 480 }  { activation_q_q0 mem_dout 0 480 } } }
	activation_scale { ap_memory {  { activation_scale_address0 mem_address 1 5 }  { activation_scale_ce0 mem_ce 1 1 }  { activation_scale_we0 mem_we 1 1 }  { activation_scale_d0 mem_din 1 512 }  { activation_scale_q0 mem_dout 0 512 } } }
	residual_pe0 { ap_memory {  { residual_pe0_address0 mem_address 1 6 }  { residual_pe0_ce0 mem_ce 1 1 }  { residual_pe0_q0 mem_dout 0 512 }  { residual_pe0_address1 MemPortADDR2 1 6 }  { residual_pe0_ce1 MemPortCE2 1 1 }  { residual_pe0_we1 MemPortWE2 1 1 }  { residual_pe0_d1 MemPortDIN2 1 512 } } }
	residual_pe1 { ap_memory {  { residual_pe1_address0 mem_address 1 6 }  { residual_pe1_ce0 mem_ce 1 1 }  { residual_pe1_q0 mem_dout 0 512 }  { residual_pe1_address1 MemPortADDR2 1 6 }  { residual_pe1_ce1 MemPortCE2 1 1 }  { residual_pe1_we1 MemPortWE2 1 1 }  { residual_pe1_d1 MemPortDIN2 1 512 } } }
	residual_pe2 { ap_memory {  { residual_pe2_address0 mem_address 1 6 }  { residual_pe2_ce0 mem_ce 1 1 }  { residual_pe2_q0 mem_dout 0 512 }  { residual_pe2_address1 MemPortADDR2 1 6 }  { residual_pe2_ce1 MemPortCE2 1 1 }  { residual_pe2_we1 MemPortWE2 1 1 }  { residual_pe2_d1 MemPortDIN2 1 512 } } }
	residual_pe3 { ap_memory {  { residual_pe3_address0 mem_address 1 6 }  { residual_pe3_ce0 mem_ce 1 1 }  { residual_pe3_q0 mem_dout 0 512 }  { residual_pe3_address1 MemPortADDR2 1 6 }  { residual_pe3_ce1 MemPortCE2 1 1 }  { residual_pe3_we1 MemPortWE2 1 1 }  { residual_pe3_d1 MemPortDIN2 1 512 } } }
	command_stream { ap_fifo {  { command_stream_dout fifo_data_in 0 2 }  { command_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { command_stream_fifo_cap fifo_update 0 3 }  { command_stream_empty_n fifo_status 0 1 }  { command_stream_read fifo_port_we 1 1 } } }
	linear_stage0 { ap_memory {  { linear_stage0_address0 mem_address 1 9 }  { linear_stage0_ce0 mem_ce 1 1 }  { linear_stage0_q0 mem_dout 0 512 }  { linear_stage0_address1 MemPortADDR2 1 9 }  { linear_stage0_ce1 MemPortCE2 1 1 }  { linear_stage0_we1 MemPortWE2 1 1 }  { linear_stage0_d1 MemPortDIN2 1 512 } } }
	linear_stage1 { ap_memory {  { linear_stage1_address0 mem_address 1 9 }  { linear_stage1_ce0 mem_ce 1 1 }  { linear_stage1_q0 mem_dout 0 512 }  { linear_stage1_address1 MemPortADDR2 1 9 }  { linear_stage1_ce1 MemPortCE2 1 1 }  { linear_stage1_we1 MemPortWE2 1 1 }  { linear_stage1_d1 MemPortDIN2 1 512 } } }
	linear_stage2 { ap_memory {  { linear_stage2_address0 mem_address 1 9 }  { linear_stage2_ce0 mem_ce 1 1 }  { linear_stage2_q0 mem_dout 0 512 }  { linear_stage2_address1 MemPortADDR2 1 9 }  { linear_stage2_ce1 MemPortCE2 1 1 }  { linear_stage2_we1 MemPortWE2 1 1 }  { linear_stage2_d1 MemPortDIN2 1 512 } } }
	linear_stage3 { ap_memory {  { linear_stage3_address0 mem_address 1 9 }  { linear_stage3_ce0 mem_ce 1 1 }  { linear_stage3_q0 mem_dout 0 512 }  { linear_stage3_address1 MemPortADDR2 1 9 }  { linear_stage3_ce1 MemPortCE2 1 1 }  { linear_stage3_we1 MemPortWE2 1 1 }  { linear_stage3_d1 MemPortDIN2 1 512 } } }
	q_pe0 { ap_memory {  { q_pe0_address0 mem_address 1 6 }  { q_pe0_ce0 mem_ce 1 1 }  { q_pe0_we0 mem_we 1 1 }  { q_pe0_d0 mem_din 1 512 } } }
	q_pe1 { ap_memory {  { q_pe1_address0 mem_address 1 6 }  { q_pe1_ce0 mem_ce 1 1 }  { q_pe1_we0 mem_we 1 1 }  { q_pe1_d0 mem_din 1 512 } } }
	q_pe2 { ap_memory {  { q_pe2_address0 mem_address 1 6 }  { q_pe2_ce0 mem_ce 1 1 }  { q_pe2_we0 mem_we 1 1 }  { q_pe2_d0 mem_din 1 512 } } }
	q_pe3 { ap_memory {  { q_pe3_address0 mem_address 1 6 }  { q_pe3_ce0 mem_ce 1 1 }  { q_pe3_we0 mem_we 1 1 }  { q_pe3_d0 mem_din 1 512 } } }
	k_pe0 { ap_memory {  { k_pe0_address0 mem_address 1 6 }  { k_pe0_ce0 mem_ce 1 1 }  { k_pe0_we0 mem_we 1 1 }  { k_pe0_d0 mem_din 1 512 } } }
	k_pe1 { ap_memory {  { k_pe1_address0 mem_address 1 6 }  { k_pe1_ce0 mem_ce 1 1 }  { k_pe1_we0 mem_we 1 1 }  { k_pe1_d0 mem_din 1 512 } } }
	k_pe2 { ap_memory {  { k_pe2_address0 mem_address 1 6 }  { k_pe2_ce0 mem_ce 1 1 }  { k_pe2_we0 mem_we 1 1 }  { k_pe2_d0 mem_din 1 512 } } }
	k_pe3 { ap_memory {  { k_pe3_address0 mem_address 1 6 }  { k_pe3_ce0 mem_ce 1 1 }  { k_pe3_we0 mem_we 1 1 }  { k_pe3_d0 mem_din 1 512 } } }
	v_pe0 { ap_memory {  { v_pe0_address0 mem_address 1 6 }  { v_pe0_ce0 mem_ce 1 1 }  { v_pe0_we0 mem_we 1 1 }  { v_pe0_d0 mem_din 1 512 } } }
	v_pe1 { ap_memory {  { v_pe1_address0 mem_address 1 6 }  { v_pe1_ce0 mem_ce 1 1 }  { v_pe1_we0 mem_we 1 1 }  { v_pe1_d0 mem_din 1 512 } } }
	v_pe2 { ap_memory {  { v_pe2_address0 mem_address 1 6 }  { v_pe2_ce0 mem_ce 1 1 }  { v_pe2_we0 mem_we 1 1 }  { v_pe2_d0 mem_din 1 512 } } }
	v_pe3 { ap_memory {  { v_pe3_address0 mem_address 1 6 }  { v_pe3_ce0 mem_ce 1 1 }  { v_pe3_we0 mem_we 1 1 }  { v_pe3_d0 mem_din 1 512 } } }
	gate_pe0 { ap_memory {  { gate_pe0_address0 mem_address 1 8 }  { gate_pe0_ce0 mem_ce 1 1 }  { gate_pe0_we0 mem_we 1 1 }  { gate_pe0_d0 mem_din 1 512 }  { gate_pe0_q0 mem_dout 0 512 } } }
	gate_pe1 { ap_memory {  { gate_pe1_address0 mem_address 1 8 }  { gate_pe1_ce0 mem_ce 1 1 }  { gate_pe1_we0 mem_we 1 1 }  { gate_pe1_d0 mem_din 1 512 }  { gate_pe1_q0 mem_dout 0 512 } } }
	gate_pe2 { ap_memory {  { gate_pe2_address0 mem_address 1 8 }  { gate_pe2_ce0 mem_ce 1 1 }  { gate_pe2_we0 mem_we 1 1 }  { gate_pe2_d0 mem_din 1 512 }  { gate_pe2_q0 mem_dout 0 512 } } }
	gate_pe3 { ap_memory {  { gate_pe3_address0 mem_address 1 8 }  { gate_pe3_ce0 mem_ce 1 1 }  { gate_pe3_we0 mem_we 1 1 }  { gate_pe3_d0 mem_din 1 512 }  { gate_pe3_q0 mem_dout 0 512 } } }
	up_pe0 { ap_memory {  { up_pe0_address0 mem_address 1 8 }  { up_pe0_ce0 mem_ce 1 1 }  { up_pe0_we0 mem_we 1 1 }  { up_pe0_d0 mem_din 1 512 }  { up_pe0_q0 mem_dout 0 512 } } }
	up_pe1 { ap_memory {  { up_pe1_address0 mem_address 1 8 }  { up_pe1_ce0 mem_ce 1 1 }  { up_pe1_we0 mem_we 1 1 }  { up_pe1_d0 mem_din 1 512 }  { up_pe1_q0 mem_dout 0 512 } } }
	up_pe2 { ap_memory {  { up_pe2_address0 mem_address 1 8 }  { up_pe2_ce0 mem_ce 1 1 }  { up_pe2_we0 mem_we 1 1 }  { up_pe2_d0 mem_din 1 512 }  { up_pe2_q0 mem_dout 0 512 } } }
	up_pe3 { ap_memory {  { up_pe3_address0 mem_address 1 8 }  { up_pe3_ce0 mem_ce 1 1 }  { up_pe3_we0 mem_we 1 1 }  { up_pe3_d0 mem_din 1 512 }  { up_pe3_q0 mem_dout 0 512 } } }
	logits_pe0 { ap_fifo {  { logits_pe0_dout fifo_data_in 0 64 }  { logits_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe0_fifo_cap fifo_update 0 3 }  { logits_pe0_empty_n fifo_status 0 1 }  { logits_pe0_read fifo_port_we 1 1 } } }
	logits_pe1 { ap_fifo {  { logits_pe1_dout fifo_data_in 0 64 }  { logits_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe1_fifo_cap fifo_update 0 3 }  { logits_pe1_empty_n fifo_status 0 1 }  { logits_pe1_read fifo_port_we 1 1 } } }
	logits_pe2 { ap_fifo {  { logits_pe2_dout fifo_data_in 0 64 }  { logits_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe2_fifo_cap fifo_update 0 3 }  { logits_pe2_empty_n fifo_status 0 1 }  { logits_pe2_read fifo_port_we 1 1 } } }
	logits_pe3 { ap_fifo {  { logits_pe3_dout fifo_data_in 0 64 }  { logits_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe3_fifo_cap fifo_update 0 3 }  { logits_pe3_empty_n fifo_status 0 1 }  { logits_pe3_read fifo_port_we 1 1 } } }
	controller_run_rmsnorm { ap_vld {  { controller_run_rmsnorm out_data 1 1 }  { controller_run_rmsnorm_ap_vld out_vld 1 1 } } }
	controller_rmsnorm_mode { ap_vld {  { controller_rmsnorm_mode out_data 1 2 }  { controller_rmsnorm_mode_ap_vld out_vld 1 1 } } }
	controller_run_linear_in { ap_fifo {  { controller_run_linear_in_dout fifo_data_in 0 1 }  { controller_run_linear_in_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_run_linear_in_fifo_cap fifo_update 0 3 }  { controller_run_linear_in_empty_n fifo_status 0 1 }  { controller_run_linear_in_read fifo_port_we 1 1 } } }
	controller_run_linear_out { ap_vld {  { controller_run_linear_out out_data 1 1 }  { controller_run_linear_out_ap_vld out_vld 1 1 } } }
	controller_linear_mode_in { ap_fifo {  { controller_linear_mode_in_dout fifo_data_in 0 3 }  { controller_linear_mode_in_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_linear_mode_in_fifo_cap fifo_update 0 3 }  { controller_linear_mode_in_empty_n fifo_status 0 1 }  { controller_linear_mode_in_read fifo_port_we 1 1 } } }
	controller_linear_mode_out { ap_vld {  { controller_linear_mode_out out_data 1 3 }  { controller_linear_mode_out_ap_vld out_vld 1 1 } } }
	controller_run_rope { ap_vld {  { controller_run_rope out_data 1 1 }  { controller_run_rope_ap_vld out_vld 1 1 } } }
	controller_run_swiglu { ap_vld {  { controller_run_swiglu out_data 1 1 }  { controller_run_swiglu_ap_vld out_vld 1 1 } } }
	controller_layer_index_in { ap_fifo {  { controller_layer_index_in_dout fifo_data_in 0 6 }  { controller_layer_index_in_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_layer_index_in_fifo_cap fifo_update 0 3 }  { controller_layer_index_in_empty_n fifo_status 0 1 }  { controller_layer_index_in_read fifo_port_we 1 1 } } }
	controller_layer_index_out { ap_vld {  { controller_layer_index_out out_data 1 6 }  { controller_layer_index_out_ap_vld out_vld 1 1 } } }
	controller_exit { ap_vld {  { controller_exit out_data 1 1 }  { controller_exit_ap_vld out_vld 1 1 } } }
	idx { ap_fifo {  { idx_dout fifo_data_in 0 13 }  { idx_num_data_valid fifo_status_num_data_valid 0 3 }  { idx_fifo_cap fifo_update 0 3 }  { idx_empty_n fifo_status 0 1 }  { idx_read fifo_port_we 1 1 } } }
	controller_weight_word_offset_constprop { ap_ovld {  { controller_weight_word_offset_constprop_i in_data 0 24 }  { controller_weight_word_offset_constprop_o out_data 1 24 }  { controller_weight_word_offset_constprop_o_ap_vld out_vld 1 1 } } }
	controller_weight_scale_word_offset_constprop { ap_ovld {  { controller_weight_scale_word_offset_constprop_i in_data 0 11 }  { controller_weight_scale_word_offset_constprop_o out_data 1 11 }  { controller_weight_scale_word_offset_constprop_o_ap_vld out_vld 1 1 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_q0 mem_dout 0 512 } } }
	model_norm_cache1 { ap_memory {  { model_norm_cache1_address0 mem_address 1 13 }  { model_norm_cache1_ce0 mem_ce 1 1 }  { model_norm_cache1_q0 mem_dout 0 512 } } }
	model_norm_cache2 { ap_memory {  { model_norm_cache2_address0 mem_address 1 13 }  { model_norm_cache2_ce0 mem_ce 1 1 }  { model_norm_cache2_q0 mem_dout 0 512 } } }
	model_norm_cache3 { ap_memory {  { model_norm_cache3_address0 mem_address 1 13 }  { model_norm_cache3_ce0 mem_ce 1 1 }  { model_norm_cache3_q0 mem_dout 0 512 } } }
	model_scale_cache0 { ap_memory {  { model_scale_cache0_address0 mem_address 1 11 }  { model_scale_cache0_ce0 mem_ce 1 1 }  { model_scale_cache0_q0 mem_dout 0 512 } } }
	model_scale_cache1 { ap_memory {  { model_scale_cache1_address0 mem_address 1 11 }  { model_scale_cache1_ce0 mem_ce 1 1 }  { model_scale_cache1_q0 mem_dout 0 512 } } }
	model_scale_cache2 { ap_memory {  { model_scale_cache2_address0 mem_address 1 11 }  { model_scale_cache2_ce0 mem_ce 1 1 }  { model_scale_cache2_q0 mem_dout 0 512 } } }
	model_scale_cache3 { ap_memory {  { model_scale_cache3_address0 mem_address 1 11 }  { model_scale_cache3_ce0 mem_ce 1 1 }  { model_scale_cache3_q0 mem_dout 0 512 } } }
}
