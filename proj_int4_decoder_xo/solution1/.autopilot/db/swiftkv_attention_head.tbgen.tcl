set moduleName swiftkv_attention_head
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
set C_modelName {swiftkv_attention_head}
set C_modelType { void 0 }
set C_modelArgList {
	{ query_0 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_1 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_2 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_3 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_4 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_5 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_6 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_7 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_8 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_9 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_10 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_11 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_12 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_13 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_14 int 32 regular {array 8 { 1 } 1 1 }  }
	{ query_15 int 32 regular {array 8 { 1 } 1 1 }  }
	{ gmem0 int 512 regular {axi_master 0}  }
	{ kv_cache int 64 regular  }
	{ head_base int 24 regular  }
	{ current_record_0_val1 int 512 regular  }
	{ current_record_1_val2 int 512 regular  }
	{ current_record_2_val3 int 512 regular  }
	{ current_record_3_val4 int 512 regular  }
	{ current_record_4_val5 int 512 regular  }
	{ position_val int 12 regular  }
	{ quantized_pe0 int 480 regular {fifo 1 volatile }  }
	{ scale_pe0 int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "query_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_8", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_9", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_10", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_11", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_12", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_13", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_14", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "query_15", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gmem0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank0","offset": { "type": "dynamic","port_name": "model_bank0","bundle": "control"},"direction": "READONLY"},{"cName": "rope_lut_ddr","offset": { "type": "dynamic","port_name": "rope_lut_ddr","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe0","offset": { "type": "dynamic","port_name": "residual_pe0","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe0","offset": { "type": "dynamic","port_name": "logits_pe0","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe0","offset": { "type": "dynamic","port_name": "kv_cache_pe0","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "kv_cache", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "head_base", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "current_record_0_val1", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "current_record_1_val2", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "current_record_2_val3", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "current_record_3_val4", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "current_record_4_val5", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "position_val", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe0", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_pe0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 155
set portList { 
	{ query_0_address0 sc_out sc_lv 3 signal 0 } 
	{ query_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ query_0_d0 sc_out sc_lv 32 signal 0 } 
	{ query_0_q0 sc_in sc_lv 32 signal 0 } 
	{ query_0_we0 sc_out sc_logic 1 signal 0 } 
	{ query_1_address0 sc_out sc_lv 3 signal 1 } 
	{ query_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ query_1_d0 sc_out sc_lv 32 signal 1 } 
	{ query_1_q0 sc_in sc_lv 32 signal 1 } 
	{ query_1_we0 sc_out sc_logic 1 signal 1 } 
	{ query_2_address0 sc_out sc_lv 3 signal 2 } 
	{ query_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ query_2_d0 sc_out sc_lv 32 signal 2 } 
	{ query_2_q0 sc_in sc_lv 32 signal 2 } 
	{ query_2_we0 sc_out sc_logic 1 signal 2 } 
	{ query_3_address0 sc_out sc_lv 3 signal 3 } 
	{ query_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ query_3_d0 sc_out sc_lv 32 signal 3 } 
	{ query_3_q0 sc_in sc_lv 32 signal 3 } 
	{ query_3_we0 sc_out sc_logic 1 signal 3 } 
	{ query_4_address0 sc_out sc_lv 3 signal 4 } 
	{ query_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ query_4_d0 sc_out sc_lv 32 signal 4 } 
	{ query_4_q0 sc_in sc_lv 32 signal 4 } 
	{ query_4_we0 sc_out sc_logic 1 signal 4 } 
	{ query_5_address0 sc_out sc_lv 3 signal 5 } 
	{ query_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ query_5_d0 sc_out sc_lv 32 signal 5 } 
	{ query_5_q0 sc_in sc_lv 32 signal 5 } 
	{ query_5_we0 sc_out sc_logic 1 signal 5 } 
	{ query_6_address0 sc_out sc_lv 3 signal 6 } 
	{ query_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ query_6_d0 sc_out sc_lv 32 signal 6 } 
	{ query_6_q0 sc_in sc_lv 32 signal 6 } 
	{ query_6_we0 sc_out sc_logic 1 signal 6 } 
	{ query_7_address0 sc_out sc_lv 3 signal 7 } 
	{ query_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ query_7_d0 sc_out sc_lv 32 signal 7 } 
	{ query_7_q0 sc_in sc_lv 32 signal 7 } 
	{ query_7_we0 sc_out sc_logic 1 signal 7 } 
	{ query_8_address0 sc_out sc_lv 3 signal 8 } 
	{ query_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ query_8_d0 sc_out sc_lv 32 signal 8 } 
	{ query_8_q0 sc_in sc_lv 32 signal 8 } 
	{ query_8_we0 sc_out sc_logic 1 signal 8 } 
	{ query_9_address0 sc_out sc_lv 3 signal 9 } 
	{ query_9_ce0 sc_out sc_logic 1 signal 9 } 
	{ query_9_d0 sc_out sc_lv 32 signal 9 } 
	{ query_9_q0 sc_in sc_lv 32 signal 9 } 
	{ query_9_we0 sc_out sc_logic 1 signal 9 } 
	{ query_10_address0 sc_out sc_lv 3 signal 10 } 
	{ query_10_ce0 sc_out sc_logic 1 signal 10 } 
	{ query_10_d0 sc_out sc_lv 32 signal 10 } 
	{ query_10_q0 sc_in sc_lv 32 signal 10 } 
	{ query_10_we0 sc_out sc_logic 1 signal 10 } 
	{ query_11_address0 sc_out sc_lv 3 signal 11 } 
	{ query_11_ce0 sc_out sc_logic 1 signal 11 } 
	{ query_11_d0 sc_out sc_lv 32 signal 11 } 
	{ query_11_q0 sc_in sc_lv 32 signal 11 } 
	{ query_11_we0 sc_out sc_logic 1 signal 11 } 
	{ query_12_address0 sc_out sc_lv 3 signal 12 } 
	{ query_12_ce0 sc_out sc_logic 1 signal 12 } 
	{ query_12_d0 sc_out sc_lv 32 signal 12 } 
	{ query_12_q0 sc_in sc_lv 32 signal 12 } 
	{ query_12_we0 sc_out sc_logic 1 signal 12 } 
	{ query_13_address0 sc_out sc_lv 3 signal 13 } 
	{ query_13_ce0 sc_out sc_logic 1 signal 13 } 
	{ query_13_d0 sc_out sc_lv 32 signal 13 } 
	{ query_13_q0 sc_in sc_lv 32 signal 13 } 
	{ query_13_we0 sc_out sc_logic 1 signal 13 } 
	{ query_14_address0 sc_out sc_lv 3 signal 14 } 
	{ query_14_ce0 sc_out sc_logic 1 signal 14 } 
	{ query_14_d0 sc_out sc_lv 32 signal 14 } 
	{ query_14_q0 sc_in sc_lv 32 signal 14 } 
	{ query_14_we0 sc_out sc_logic 1 signal 14 } 
	{ query_15_address0 sc_out sc_lv 3 signal 15 } 
	{ query_15_ce0 sc_out sc_logic 1 signal 15 } 
	{ query_15_d0 sc_out sc_lv 32 signal 15 } 
	{ query_15_q0 sc_in sc_lv 32 signal 15 } 
	{ query_15_we0 sc_out sc_logic 1 signal 15 } 
	{ m_axi_gmem0_AWVALID sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_AWREADY sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_AWADDR sc_out sc_lv 64 signal 16 } 
	{ m_axi_gmem0_AWID sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_AWLEN sc_out sc_lv 32 signal 16 } 
	{ m_axi_gmem0_AWSIZE sc_out sc_lv 3 signal 16 } 
	{ m_axi_gmem0_AWBURST sc_out sc_lv 2 signal 16 } 
	{ m_axi_gmem0_AWLOCK sc_out sc_lv 2 signal 16 } 
	{ m_axi_gmem0_AWCACHE sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_AWPROT sc_out sc_lv 3 signal 16 } 
	{ m_axi_gmem0_AWQOS sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_AWREGION sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_AWUSER sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_WVALID sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_WREADY sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_WDATA sc_out sc_lv 512 signal 16 } 
	{ m_axi_gmem0_WSTRB sc_out sc_lv 64 signal 16 } 
	{ m_axi_gmem0_WLAST sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_WID sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_WUSER sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_ARVALID sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_ARREADY sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_ARADDR sc_out sc_lv 64 signal 16 } 
	{ m_axi_gmem0_ARID sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_ARLEN sc_out sc_lv 32 signal 16 } 
	{ m_axi_gmem0_ARSIZE sc_out sc_lv 3 signal 16 } 
	{ m_axi_gmem0_ARBURST sc_out sc_lv 2 signal 16 } 
	{ m_axi_gmem0_ARLOCK sc_out sc_lv 2 signal 16 } 
	{ m_axi_gmem0_ARCACHE sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_ARPROT sc_out sc_lv 3 signal 16 } 
	{ m_axi_gmem0_ARQOS sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_ARREGION sc_out sc_lv 4 signal 16 } 
	{ m_axi_gmem0_ARUSER sc_out sc_lv 1 signal 16 } 
	{ m_axi_gmem0_RVALID sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_RREADY sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_RDATA sc_in sc_lv 512 signal 16 } 
	{ m_axi_gmem0_RLAST sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_RID sc_in sc_lv 1 signal 16 } 
	{ m_axi_gmem0_RFIFONUM sc_in sc_lv 12 signal 16 } 
	{ m_axi_gmem0_RUSER sc_in sc_lv 1 signal 16 } 
	{ m_axi_gmem0_RRESP sc_in sc_lv 2 signal 16 } 
	{ m_axi_gmem0_BVALID sc_in sc_logic 1 signal 16 } 
	{ m_axi_gmem0_BREADY sc_out sc_logic 1 signal 16 } 
	{ m_axi_gmem0_BRESP sc_in sc_lv 2 signal 16 } 
	{ m_axi_gmem0_BID sc_in sc_lv 1 signal 16 } 
	{ m_axi_gmem0_BUSER sc_in sc_lv 1 signal 16 } 
	{ kv_cache sc_in sc_lv 64 signal 17 } 
	{ head_base sc_in sc_lv 24 signal 18 } 
	{ current_record_0_val1 sc_in sc_lv 512 signal 19 } 
	{ current_record_1_val2 sc_in sc_lv 512 signal 20 } 
	{ current_record_2_val3 sc_in sc_lv 512 signal 21 } 
	{ current_record_3_val4 sc_in sc_lv 512 signal 22 } 
	{ current_record_4_val5 sc_in sc_lv 512 signal 23 } 
	{ position_val sc_in sc_lv 12 signal 24 } 
	{ quantized_pe0_din sc_out sc_lv 480 signal 25 } 
	{ quantized_pe0_full_n sc_in sc_logic 1 signal 25 } 
	{ quantized_pe0_write sc_out sc_logic 1 signal 25 } 
	{ scale_pe0_din sc_out sc_lv 32 signal 26 } 
	{ scale_pe0_full_n sc_in sc_logic 1 signal 26 } 
	{ scale_pe0_write sc_out sc_logic 1 signal 26 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ current_record_0_val1_ap_vld sc_in sc_logic 1 invld 19 } 
	{ current_record_1_val2_ap_vld sc_in sc_logic 1 invld 20 } 
	{ current_record_2_val3_ap_vld sc_in sc_logic 1 invld 21 } 
	{ current_record_3_val4_ap_vld sc_in sc_logic 1 invld 22 } 
	{ current_record_4_val5_ap_vld sc_in sc_logic 1 invld 23 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ kv_cache_ap_vld sc_in sc_logic 1 invld 17 } 
	{ head_base_ap_vld sc_in sc_logic 1 invld 18 } 
	{ position_val_ap_vld sc_in sc_logic 1 invld 24 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "query_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_0", "role": "address0" }} , 
 	{ "name": "query_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_0", "role": "ce0" }} , 
 	{ "name": "query_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_0", "role": "d0" }} , 
 	{ "name": "query_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_0", "role": "q0" }} , 
 	{ "name": "query_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_0", "role": "we0" }} , 
 	{ "name": "query_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_1", "role": "address0" }} , 
 	{ "name": "query_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_1", "role": "ce0" }} , 
 	{ "name": "query_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_1", "role": "d0" }} , 
 	{ "name": "query_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_1", "role": "q0" }} , 
 	{ "name": "query_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_1", "role": "we0" }} , 
 	{ "name": "query_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_2", "role": "address0" }} , 
 	{ "name": "query_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_2", "role": "ce0" }} , 
 	{ "name": "query_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_2", "role": "d0" }} , 
 	{ "name": "query_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_2", "role": "q0" }} , 
 	{ "name": "query_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_2", "role": "we0" }} , 
 	{ "name": "query_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_3", "role": "address0" }} , 
 	{ "name": "query_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_3", "role": "ce0" }} , 
 	{ "name": "query_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_3", "role": "d0" }} , 
 	{ "name": "query_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_3", "role": "q0" }} , 
 	{ "name": "query_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_3", "role": "we0" }} , 
 	{ "name": "query_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_4", "role": "address0" }} , 
 	{ "name": "query_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_4", "role": "ce0" }} , 
 	{ "name": "query_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_4", "role": "d0" }} , 
 	{ "name": "query_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_4", "role": "q0" }} , 
 	{ "name": "query_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_4", "role": "we0" }} , 
 	{ "name": "query_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_5", "role": "address0" }} , 
 	{ "name": "query_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_5", "role": "ce0" }} , 
 	{ "name": "query_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_5", "role": "d0" }} , 
 	{ "name": "query_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_5", "role": "q0" }} , 
 	{ "name": "query_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_5", "role": "we0" }} , 
 	{ "name": "query_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_6", "role": "address0" }} , 
 	{ "name": "query_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_6", "role": "ce0" }} , 
 	{ "name": "query_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_6", "role": "d0" }} , 
 	{ "name": "query_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_6", "role": "q0" }} , 
 	{ "name": "query_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_6", "role": "we0" }} , 
 	{ "name": "query_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_7", "role": "address0" }} , 
 	{ "name": "query_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_7", "role": "ce0" }} , 
 	{ "name": "query_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_7", "role": "d0" }} , 
 	{ "name": "query_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_7", "role": "q0" }} , 
 	{ "name": "query_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_7", "role": "we0" }} , 
 	{ "name": "query_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_8", "role": "address0" }} , 
 	{ "name": "query_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_8", "role": "ce0" }} , 
 	{ "name": "query_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_8", "role": "d0" }} , 
 	{ "name": "query_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_8", "role": "q0" }} , 
 	{ "name": "query_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_8", "role": "we0" }} , 
 	{ "name": "query_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_9", "role": "address0" }} , 
 	{ "name": "query_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_9", "role": "ce0" }} , 
 	{ "name": "query_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_9", "role": "d0" }} , 
 	{ "name": "query_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_9", "role": "q0" }} , 
 	{ "name": "query_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_9", "role": "we0" }} , 
 	{ "name": "query_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_10", "role": "address0" }} , 
 	{ "name": "query_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_10", "role": "ce0" }} , 
 	{ "name": "query_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_10", "role": "d0" }} , 
 	{ "name": "query_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_10", "role": "q0" }} , 
 	{ "name": "query_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_10", "role": "we0" }} , 
 	{ "name": "query_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_11", "role": "address0" }} , 
 	{ "name": "query_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_11", "role": "ce0" }} , 
 	{ "name": "query_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_11", "role": "d0" }} , 
 	{ "name": "query_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_11", "role": "q0" }} , 
 	{ "name": "query_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_11", "role": "we0" }} , 
 	{ "name": "query_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_12", "role": "address0" }} , 
 	{ "name": "query_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_12", "role": "ce0" }} , 
 	{ "name": "query_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_12", "role": "d0" }} , 
 	{ "name": "query_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_12", "role": "q0" }} , 
 	{ "name": "query_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_12", "role": "we0" }} , 
 	{ "name": "query_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_13", "role": "address0" }} , 
 	{ "name": "query_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_13", "role": "ce0" }} , 
 	{ "name": "query_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_13", "role": "d0" }} , 
 	{ "name": "query_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_13", "role": "q0" }} , 
 	{ "name": "query_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_13", "role": "we0" }} , 
 	{ "name": "query_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_14", "role": "address0" }} , 
 	{ "name": "query_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_14", "role": "ce0" }} , 
 	{ "name": "query_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_14", "role": "d0" }} , 
 	{ "name": "query_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_14", "role": "q0" }} , 
 	{ "name": "query_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_14", "role": "we0" }} , 
 	{ "name": "query_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_15", "role": "address0" }} , 
 	{ "name": "query_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_15", "role": "ce0" }} , 
 	{ "name": "query_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_15", "role": "d0" }} , 
 	{ "name": "query_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_15", "role": "q0" }} , 
 	{ "name": "query_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_15", "role": "we0" }} , 
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
 	{ "name": "kv_cache", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "kv_cache", "role": "default" }} , 
 	{ "name": "head_base", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "head_base", "role": "default" }} , 
 	{ "name": "current_record_0_val1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "current_record_0_val1", "role": "default" }} , 
 	{ "name": "current_record_1_val2", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "current_record_1_val2", "role": "default" }} , 
 	{ "name": "current_record_2_val3", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "current_record_2_val3", "role": "default" }} , 
 	{ "name": "current_record_3_val4", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "current_record_3_val4", "role": "default" }} , 
 	{ "name": "current_record_4_val5", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "current_record_4_val5", "role": "default" }} , 
 	{ "name": "position_val", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val", "role": "default" }} , 
 	{ "name": "quantized_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "din" }} , 
 	{ "name": "quantized_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "full_n" }} , 
 	{ "name": "quantized_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "write" }} , 
 	{ "name": "scale_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe0", "role": "din" }} , 
 	{ "name": "scale_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "full_n" }} , 
 	{ "name": "scale_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "current_record_0_val1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "current_record_0_val1", "role": "ap_vld" }} , 
 	{ "name": "current_record_1_val2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "current_record_1_val2", "role": "ap_vld" }} , 
 	{ "name": "current_record_2_val3_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "current_record_2_val3", "role": "ap_vld" }} , 
 	{ "name": "current_record_3_val4_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "current_record_3_val4", "role": "ap_vld" }} , 
 	{ "name": "current_record_4_val5_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "current_record_4_val5", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "kv_cache_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "kv_cache", "role": "ap_vld" }} , 
 	{ "name": "head_base_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "head_base", "role": "ap_vld" }} , 
 	{ "name": "position_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "position_val", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5", "11", "35", "44", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172"],
		"CDFG" : "swiftkv_attention_head",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "616", "EstimateLatencyMax" : "33376",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "entry_proc57_U0"},
			{"ID" : "2", "Name" : "swiftkv_read_compressed_kv_cache_U0"},
			{"ID" : "11", "Name" : "swiftkv_process_compressed_kv_U0"}],
		"OutputProcess" : [
			{"ID" : "44", "Name" : "swiftkv_update_values_and_quantize_U0"}],
		"Port" : [
			{"Name" : "query_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_0"}]},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_1"}]},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_2"}]},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_3"}]},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_4"}]},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_5"}]},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_6"}]},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_7"}]},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_8"}]},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_9"}]},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_10"}]},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_11"}]},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_12"}]},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_13"}]},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_14"}]},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_15"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "swiftkv_read_compressed_kv_cache_U0", "Port" : "gmem0"}]},
			{"Name" : "kv_cache", "Type" : "None", "Direction" : "I"},
			{"Name" : "head_base", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_0_val1", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_1_val2", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_2_val3", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_3_val4", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_4_val5", "Type" : "None", "Direction" : "I"},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "swiftkv_update_values_and_quantize_U0", "Port" : "quantized_pe0"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "swiftkv_update_values_and_quantize_U0", "Port" : "scale_pe0"}]},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "swiftkv_coefficient_producer_U0", "Port" : "SWIFTKV_EXP2_LUT_Q30"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.entry_proc57_U0", "Parent" : "0",
		"CDFG" : "entry_proc57",
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
			{"Name" : "current_record_0_val1", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_0_val1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "149", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_0_val1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_1_val2", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_1_val2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "150", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_1_val2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_2_val3", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_2_val3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "151", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_2_val3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_3_val4", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_3_val4_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "152", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_3_val4_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_4_val5", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_4_val5_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "153", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_4_val5_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_read_compressed_kv_cache_U0", "Parent" : "0", "Child" : ["3"],
		"CDFG" : "swiftkv_read_compressed_kv_cache",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "75", "EstimateLatencyMax" : "20551",
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
					{"Name" : "gmem0_blk_n_AR", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Port" : "gmem0", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "kv_cache", "Type" : "None", "Direction" : "I"},
			{"Name" : "head_base", "Type" : "None", "Direction" : "I"},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "154", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Port" : "cached_kv_word_stream", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "position_val_c14", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["5"], "DependentChan" : "155", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c14_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_read_compressed_kv_cache_U0.grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Parent" : "2", "Child" : ["4"],
		"CDFG" : "swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "20478",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cached_words", "Type" : "None", "Direction" : "I"},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "gmem0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln681", "Type" : "None", "Direction" : "I"},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "cached_kv_word_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "read_compressed_kv_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_read_compressed_kv_cache_U0.grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0", "Parent" : "0", "Child" : ["6", "8"],
		"CDFG" : "swiftkv_route_compressed_kv_cache",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "20489",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "155", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_0_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "149", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_0_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_1_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "150", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_1_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_2_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "151", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_2_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_3_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "152", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_3_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_4_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "153", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_4_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "154", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "cached_kv_word_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11"], "DependentChan" : "156", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key_metadata_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "157", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value_metadata_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11"], "DependentChan" : "158", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["11"], "DependentChan" : "159", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "160", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "161", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "162", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine2_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "163", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine3_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "164", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "165", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "166", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine2_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "167", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "8", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine3_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Parent" : "5", "Child" : ["7"],
		"CDFG" : "swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "20477",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln712", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cached_kv_word_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine2_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine3_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine2_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine3_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "route_cached_compressed_kv_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Parent" : "5", "Child" : ["9", "10"],
		"CDFG" : "swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop",
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
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_0_val_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_1_val_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_2_val_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_3_val_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_4_val_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "key1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine2_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value0_engine3_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine2_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "value1_engine3_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "stream_current_compressed_kv_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151.sparsemux_11_3_512_1_1_U382", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "swiftkv_process_compressed_kv",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "32786",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "query_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_4", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_5", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_6", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_7", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_8", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_9", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_10", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_12", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_13", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_14", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_15", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "156", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "158", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "159", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["35"], "DependentChan" : "168", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c13", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["35"], "DependentChan" : "169", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c13_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Parent" : "11", "Child" : ["13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
		"CDFG" : "swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "32784",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "total_phases", "Type" : "None", "Direction" : "I"},
			{"Name" : "query_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "key_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "key0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "key1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "score_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "compressed_dot_phase_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U419", "Parent" : "12"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U420", "Parent" : "12"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U421", "Parent" : "12"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U422", "Parent" : "12"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U423", "Parent" : "12"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U424", "Parent" : "12"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U425", "Parent" : "12"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U426", "Parent" : "12"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U427", "Parent" : "12"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U428", "Parent" : "12"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U429", "Parent" : "12"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U430", "Parent" : "12"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U431", "Parent" : "12"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U432", "Parent" : "12"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U433", "Parent" : "12"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U434", "Parent" : "12"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_44s_15ns_58_5_1_U435", "Parent" : "12"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_17_3_128_1_1_U436", "Parent" : "12"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_9_2_5_1_1_U437", "Parent" : "12"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.flow_control_loop_pipe_sequential_init_U", "Parent" : "12"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.frp_pipeline_valid_U", "Parent" : "12"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.pf_score_stream_U", "Parent" : "12"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0", "Parent" : "0", "Child" : ["36", "42"],
		"CDFG" : "swiftkv_coefficient_producer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "59", "EstimateLatencyMax" : "24629",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["11"], "DependentChan" : "168", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["11"], "DependentChan" : "169", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "170", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "171", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["44"], "DependentChan" : "172", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "SWIFTKV_EXP2_LUT_Q30", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Parent" : "35", "Child" : ["37", "38", "39", "40", "41"],
		"CDFG" : "swiftkv_coefficient_producer_Pipeline_coefficient_token_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "24588",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln1094", "Type" : "None", "Direction" : "I"},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "score_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "normalization_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "coefficient_token_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.SWIFTKV_EXP2_LUT_Q30_U", "Parent" : "36"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32ns_12ns_44_2_1_U486", "Parent" : "36"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32s_23ns_46_2_1_U487", "Parent" : "36"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_30ns_18ns_48_5_1_U488", "Parent" : "36"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_reciprocal_normalization_fu_93", "Parent" : "35", "Child" : ["43"],
		"CDFG" : "swiftkv_reciprocal_normalization",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "37", "EstimateLatencyMax" : "37",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalization_val", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "reciprocal_divide_bit_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_coefficient_producer_U0.grp_swiftkv_reciprocal_normalization_fu_93.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0", "Parent" : "0", "Child" : ["45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "134", "141", "146", "147", "148"],
		"CDFG" : "swiftkv_update_values_and_quantize",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "510", "EstimateLatencyMax" : "33270",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "157", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value_metadata_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "160", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "161", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "162", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "163", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "164", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "165", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "166", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["5"], "DependentChan" : "167", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["35"], "DependentChan" : "170", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "control_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["35"], "DependentChan" : "171", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["35"], "DependentChan" : "172", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "attention_quant_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "24", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state24"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_U", "Parent" : "44"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_1_U", "Parent" : "44"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_2_U", "Parent" : "44"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_3_U", "Parent" : "44"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_U", "Parent" : "44"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_1_U", "Parent" : "44"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_2_U", "Parent" : "44"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_3_U", "Parent" : "44"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_U", "Parent" : "44"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_1_U", "Parent" : "44"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_2_U", "Parent" : "44"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_3_U", "Parent" : "44"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_U", "Parent" : "44"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_1_U", "Parent" : "44"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_2_U", "Parent" : "44"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_3_U", "Parent" : "44"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.attention_group_U", "Parent" : "44"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262", "Parent" : "44", "Child" : ["63", "66", "70", "74", "78", "82", "91", "100", "109", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133"],
		"CDFG" : "swiftkv_accumulate_values_split",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32", "EstimateLatencyMax" : "32792",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "63", "Name" : "swiftkv_broadcast_update_controls_U0"},
			{"ID" : "82", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "91", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "100", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "109", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"OutputProcess" : [
			{"ID" : "82", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "91", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "100", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "109", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "63", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "value_metadata_stream"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value0_engine0_stream"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value0_engine1_stream"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "74", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value0_engine2_stream"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value0_engine3_stream"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value1_engine0_stream"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "70", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value1_engine1_stream"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "74", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value1_engine2_stream"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value1_engine3_stream"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "63", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "control_stream"}]},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine0_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine0_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine0_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "82", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine3_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine3_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine3_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine3_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "109", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_3"}]}]},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0", "Parent" : "62", "Child" : ["64"],
		"CDFG" : "swiftkv_broadcast_update_controls",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "4100",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "118", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["70"], "DependentChan" : "119", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "120", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["78"], "DependentChan" : "121", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c33", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["78"], "DependentChan" : "122", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c33_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c34", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["74"], "DependentChan" : "123", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c34_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c35", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["70"], "DependentChan" : "124", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c35_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c36", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "125", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c36_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "64", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Parent" : "63", "Child" : ["65"],
		"CDFG" : "swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "4098",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln1149", "Type" : "None", "Direction" : "I"},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine0_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine1_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine2_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine3_control_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "broadcast_update_control_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "65", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98.flow_control_loop_pipe_sequential_init_U", "Parent" : "64"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0", "Parent" : "62", "Child" : ["67"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "32773",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "118", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "125", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["82"], "DependentChan" : "126", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c32", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["82"], "DependentChan" : "127", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c32_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "67", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Parent" : "66", "Child" : ["68", "69"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "32771",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine0_phase_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine0_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value0_engine0_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value1_engine0_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "prepare_update_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "68", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.sparsemux_9_2_5_1_1_U521", "Parent" : "67"},
	{"ID" : "69", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "67"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0", "Parent" : "62", "Child" : ["71"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "32773",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "119", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "124", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["91"], "DependentChan" : "128", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c31", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["91"], "DependentChan" : "129", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c31_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Parent" : "70", "Child" : ["72", "73"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "32771",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine1_phase_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine1_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value0_engine1_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value1_engine1_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "prepare_update_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "72", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.sparsemux_9_2_5_1_1_U533", "Parent" : "71"},
	{"ID" : "73", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "71"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0", "Parent" : "62", "Child" : ["75"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "32773",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "120", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "123", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["100"], "DependentChan" : "130", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c30", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["100"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c30_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "75", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Parent" : "74", "Child" : ["76", "77"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "32771",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine2_phase_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine2_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value0_engine2_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value1_engine2_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "prepare_update_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "76", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.sparsemux_9_2_5_1_1_U545", "Parent" : "75"},
	{"ID" : "77", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "75"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0", "Parent" : "62", "Child" : ["79"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13", "EstimateLatencyMax" : "32773",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "121", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "122", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["109"], "DependentChan" : "132", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["109"], "DependentChan" : "133", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "79", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Parent" : "78", "Child" : ["80", "81"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "32771",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine3_phase_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine3_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value0_engine3_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value1_engine3_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "prepare_update_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.sparsemux_9_2_5_1_1_U557", "Parent" : "79"},
	{"ID" : "81", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0", "Parent" : "62", "Child" : ["83", "85"],
		"CDFG" : "swiftkv_update_value_engine_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30", "EstimateLatencyMax" : "32790",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "126", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine0_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "127", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "83", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "83", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "83", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "83", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "83", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Parent" : "82", "Child" : ["84"],
		"CDFG" : "swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "initialize_weighted_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "84", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "83"},
	{"ID" : "85", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "82", "Child" : ["86", "87", "88", "89", "90"],
		"CDFG" : "swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "32777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine0_phase_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "update_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U573", "Parent" : "85"},
	{"ID" : "87", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U574", "Parent" : "85"},
	{"ID" : "88", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U575", "Parent" : "85"},
	{"ID" : "89", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U576", "Parent" : "85"},
	{"ID" : "90", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0", "Parent" : "62", "Child" : ["92", "94"],
		"CDFG" : "swiftkv_update_value_engine_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30", "EstimateLatencyMax" : "32790",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["70"], "DependentChan" : "128", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "94", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine1_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["70"], "DependentChan" : "129", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "94", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "94", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "94", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "92", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "94", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "92", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Parent" : "91", "Child" : ["93"],
		"CDFG" : "swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "initialize_weighted_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "93", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "92"},
	{"ID" : "94", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "91", "Child" : ["95", "96", "97", "98", "99"],
		"CDFG" : "swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "32777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine1_phase_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "update_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "95", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U594", "Parent" : "94"},
	{"ID" : "96", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U595", "Parent" : "94"},
	{"ID" : "97", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U596", "Parent" : "94"},
	{"ID" : "98", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U597", "Parent" : "94"},
	{"ID" : "99", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "94"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0", "Parent" : "62", "Child" : ["101", "103"],
		"CDFG" : "swiftkv_update_value_engine_2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30", "EstimateLatencyMax" : "32790",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["74"], "DependentChan" : "130", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "103", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine2_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["74"], "DependentChan" : "131", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "101", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "103", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "101", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "103", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "101", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "103", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "101", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "103", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "101", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Parent" : "100", "Child" : ["102"],
		"CDFG" : "swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "initialize_weighted_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "102", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "101"},
	{"ID" : "103", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "100", "Child" : ["104", "105", "106", "107", "108"],
		"CDFG" : "swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "32777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine2_phase_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "update_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "104", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U614", "Parent" : "103"},
	{"ID" : "105", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U615", "Parent" : "103"},
	{"ID" : "106", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U616", "Parent" : "103"},
	{"ID" : "107", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U617", "Parent" : "103"},
	{"ID" : "108", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0", "Parent" : "62", "Child" : ["110", "112"],
		"CDFG" : "swiftkv_update_value_engine_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30", "EstimateLatencyMax" : "32790",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["78"], "DependentChan" : "132", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "112", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine3_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["78"], "DependentChan" : "133", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "112", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "112", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "112", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "112", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "110", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Parent" : "109", "Child" : ["111"],
		"CDFG" : "swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "initialize_weighted_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "111", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "110"},
	{"ID" : "112", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "109", "Child" : ["113", "114", "115", "116", "117"],
		"CDFG" : "swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "32777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine3_phase_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "update_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "113", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U634", "Parent" : "112"},
	{"ID" : "114", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U635", "Parent" : "112"},
	{"ID" : "115", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U636", "Parent" : "112"},
	{"ID" : "116", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U637", "Parent" : "112"},
	{"ID" : "117", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "112"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine0_control_stream_U", "Parent" : "62"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine1_control_stream_U", "Parent" : "62"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine2_control_stream_U", "Parent" : "62"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine3_control_stream_U", "Parent" : "62"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c33_U", "Parent" : "62"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c34_U", "Parent" : "62"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c35_U", "Parent" : "62"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c36_U", "Parent" : "62"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine0_phase_stream_U", "Parent" : "62"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c32_U", "Parent" : "62"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine1_phase_stream_U", "Parent" : "62"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c31_U", "Parent" : "62"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine2_phase_stream_U", "Parent" : "62"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c30_U", "Parent" : "62"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine3_phase_stream_U", "Parent" : "62"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c_U", "Parent" : "62"},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320", "Parent" : "44", "Child" : ["135", "136", "137", "138", "139", "140"],
		"CDFG" : "swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "41", "EstimateLatencyMax" : "41",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln1488", "Type" : "None", "Direction" : "I"},
			{"Name" : "attention_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_engine0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_engine1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine3_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine3_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weighted_value_engine3_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "attention_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "135", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.mul_32s_32s_49_5_1_U693", "Parent" : "134"},
	{"ID" : "136", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U694", "Parent" : "134"},
	{"ID" : "137", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U695", "Parent" : "134"},
	{"ID" : "138", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U696", "Parent" : "134"},
	{"ID" : "139", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U697", "Parent" : "134"},
	{"ID" : "140", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "134"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344", "Parent" : "44", "Child" : ["142", "143", "144", "145"],
		"CDFG" : "swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "56", "EstimateLatencyMax" : "56",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "attention_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "attention_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter23", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter23", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "142", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fadd_32ns_32ns_32_7_full_dsp_1_U720", "Parent" : "141"},
	{"ID" : "143", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U723", "Parent" : "141"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U724", "Parent" : "141"},
	{"ID" : "145", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.flow_control_loop_pipe_sequential_init_U", "Parent" : "141"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.fmul_32ns_32ns_32_4_max_dsp_1_U730", "Parent" : "44"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U731", "Parent" : "44"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_values_and_quantize_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U732", "Parent" : "44"},
	{"ID" : "149", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.current_record_0_val1_c_U", "Parent" : "0"},
	{"ID" : "150", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.current_record_1_val2_c_U", "Parent" : "0"},
	{"ID" : "151", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.current_record_2_val3_c_U", "Parent" : "0"},
	{"ID" : "152", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.current_record_3_val4_c_U", "Parent" : "0"},
	{"ID" : "153", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.current_record_4_val5_c_U", "Parent" : "0"},
	{"ID" : "154", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cached_kv_word_stream_U", "Parent" : "0"},
	{"ID" : "155", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c14_U", "Parent" : "0"},
	{"ID" : "156", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key_metadata_stream_U", "Parent" : "0"},
	{"ID" : "157", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value_metadata_stream_U", "Parent" : "0"},
	{"ID" : "158", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key0_stream_U", "Parent" : "0"},
	{"ID" : "159", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.key1_stream_U", "Parent" : "0"},
	{"ID" : "160", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value0_engine0_stream_U", "Parent" : "0"},
	{"ID" : "161", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value0_engine1_stream_U", "Parent" : "0"},
	{"ID" : "162", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value0_engine2_stream_U", "Parent" : "0"},
	{"ID" : "163", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value0_engine3_stream_U", "Parent" : "0"},
	{"ID" : "164", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value1_engine0_stream_U", "Parent" : "0"},
	{"ID" : "165", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value1_engine1_stream_U", "Parent" : "0"},
	{"ID" : "166", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value1_engine2_stream_U", "Parent" : "0"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.value1_engine3_stream_U", "Parent" : "0"},
	{"ID" : "168", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.score_stream_U", "Parent" : "0"},
	{"ID" : "169", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c13_U", "Parent" : "0"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_stream_U", "Parent" : "0"},
	{"ID" : "171", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inverse_normalization_stream_U", "Parent" : "0"},
	{"ID" : "172", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_attention_head {
		query_0 {Type I LastRead 1 FirstWrite -1}
		query_1 {Type I LastRead 1 FirstWrite -1}
		query_2 {Type I LastRead 1 FirstWrite -1}
		query_3 {Type I LastRead 1 FirstWrite -1}
		query_4 {Type I LastRead 1 FirstWrite -1}
		query_5 {Type I LastRead 1 FirstWrite -1}
		query_6 {Type I LastRead 1 FirstWrite -1}
		query_7 {Type I LastRead 1 FirstWrite -1}
		query_8 {Type I LastRead 1 FirstWrite -1}
		query_9 {Type I LastRead 1 FirstWrite -1}
		query_10 {Type I LastRead 1 FirstWrite -1}
		query_11 {Type I LastRead 1 FirstWrite -1}
		query_12 {Type I LastRead 1 FirstWrite -1}
		query_13 {Type I LastRead 1 FirstWrite -1}
		query_14 {Type I LastRead 1 FirstWrite -1}
		query_15 {Type I LastRead 1 FirstWrite -1}
		gmem0 {Type I LastRead 1 FirstWrite -1}
		kv_cache {Type I LastRead 0 FirstWrite -1}
		head_base {Type I LastRead 0 FirstWrite -1}
		current_record_0_val1 {Type I LastRead 0 FirstWrite -1}
		current_record_1_val2 {Type I LastRead 0 FirstWrite -1}
		current_record_2_val3 {Type I LastRead 0 FirstWrite -1}
		current_record_3_val4 {Type I LastRead 0 FirstWrite -1}
		current_record_4_val5 {Type I LastRead 0 FirstWrite -1}
		position_val {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 23}
		scale_pe0 {Type O LastRead -1 FirstWrite 23}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	entry_proc57 {
		current_record_0_val1 {Type I LastRead 0 FirstWrite -1}
		current_record_0_val1_c {Type O LastRead -1 FirstWrite 0}
		current_record_1_val2 {Type I LastRead 0 FirstWrite -1}
		current_record_1_val2_c {Type O LastRead -1 FirstWrite 0}
		current_record_2_val3 {Type I LastRead 0 FirstWrite -1}
		current_record_2_val3_c {Type O LastRead -1 FirstWrite 0}
		current_record_3_val4 {Type I LastRead 0 FirstWrite -1}
		current_record_3_val4_c {Type O LastRead -1 FirstWrite 0}
		current_record_4_val5 {Type I LastRead 0 FirstWrite -1}
		current_record_4_val5_c {Type O LastRead -1 FirstWrite 0}}
	swiftkv_read_compressed_kv_cache {
		gmem0 {Type I LastRead 1 FirstWrite -1}
		kv_cache {Type I LastRead 0 FirstWrite -1}
		head_base {Type I LastRead 0 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		cached_kv_word_stream {Type O LastRead -1 FirstWrite 2}
		position_val_c14 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop {
		cached_words {Type I LastRead 0 FirstWrite -1}
		gmem0 {Type I LastRead 1 FirstWrite -1}
		sext_ln681 {Type I LastRead 0 FirstWrite -1}
		cached_kv_word_stream {Type O LastRead -1 FirstWrite 2}}
	swiftkv_route_compressed_kv_cache {
		position {Type I LastRead 0 FirstWrite -1}
		current_record_0_val {Type I LastRead 0 FirstWrite -1}
		current_record_1_val {Type I LastRead 0 FirstWrite -1}
		current_record_2_val {Type I LastRead 0 FirstWrite -1}
		current_record_3_val {Type I LastRead 0 FirstWrite -1}
		current_record_4_val {Type I LastRead 0 FirstWrite -1}
		cached_kv_word_stream {Type I LastRead 1 FirstWrite -1}
		key_metadata_stream {Type O LastRead -1 FirstWrite 1}
		value_metadata_stream {Type O LastRead -1 FirstWrite 1}
		key0_stream {Type O LastRead -1 FirstWrite 1}
		key1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine3_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine3_stream {Type O LastRead -1 FirstWrite 1}}
	swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop {
		add_ln712 {Type I LastRead 0 FirstWrite -1}
		key_metadata_stream {Type O LastRead -1 FirstWrite 1}
		value_metadata_stream {Type O LastRead -1 FirstWrite 1}
		cached_kv_word_stream {Type I LastRead 1 FirstWrite -1}
		key0_stream {Type O LastRead -1 FirstWrite 1}
		key1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine3_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine3_stream {Type O LastRead -1 FirstWrite 1}}
	swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop {
		key_metadata_stream {Type O LastRead -1 FirstWrite 1}
		value_metadata_stream {Type O LastRead -1 FirstWrite 1}
		current_record_0_val_load {Type I LastRead 0 FirstWrite -1}
		current_record_1_val_load {Type I LastRead 0 FirstWrite -1}
		current_record_2_val_load {Type I LastRead 0 FirstWrite -1}
		current_record_3_val_load {Type I LastRead 0 FirstWrite -1}
		current_record_4_val_load {Type I LastRead 0 FirstWrite -1}
		key0_stream {Type O LastRead -1 FirstWrite 1}
		key1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value0_engine3_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine0_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine1_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine2_stream {Type O LastRead -1 FirstWrite 1}
		value1_engine3_stream {Type O LastRead -1 FirstWrite 1}}
	swiftkv_process_compressed_kv {
		query_0 {Type I LastRead 1 FirstWrite -1}
		query_1 {Type I LastRead 1 FirstWrite -1}
		query_2 {Type I LastRead 1 FirstWrite -1}
		query_3 {Type I LastRead 1 FirstWrite -1}
		query_4 {Type I LastRead 1 FirstWrite -1}
		query_5 {Type I LastRead 1 FirstWrite -1}
		query_6 {Type I LastRead 1 FirstWrite -1}
		query_7 {Type I LastRead 1 FirstWrite -1}
		query_8 {Type I LastRead 1 FirstWrite -1}
		query_9 {Type I LastRead 1 FirstWrite -1}
		query_10 {Type I LastRead 1 FirstWrite -1}
		query_11 {Type I LastRead 1 FirstWrite -1}
		query_12 {Type I LastRead 1 FirstWrite -1}
		query_13 {Type I LastRead 1 FirstWrite -1}
		query_14 {Type I LastRead 1 FirstWrite -1}
		query_15 {Type I LastRead 1 FirstWrite -1}
		key_metadata_stream {Type I LastRead 1 FirstWrite -1}
		key0_stream {Type I LastRead 1 FirstWrite -1}
		key1_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		score_stream {Type O LastRead -1 FirstWrite 15}
		position_val_c13 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop {
		total_phases {Type I LastRead 0 FirstWrite -1}
		query_0 {Type I LastRead 1 FirstWrite -1}
		query_1 {Type I LastRead 1 FirstWrite -1}
		query_2 {Type I LastRead 1 FirstWrite -1}
		query_3 {Type I LastRead 1 FirstWrite -1}
		query_4 {Type I LastRead 1 FirstWrite -1}
		query_5 {Type I LastRead 1 FirstWrite -1}
		query_6 {Type I LastRead 1 FirstWrite -1}
		query_7 {Type I LastRead 1 FirstWrite -1}
		query_8 {Type I LastRead 1 FirstWrite -1}
		query_9 {Type I LastRead 1 FirstWrite -1}
		query_10 {Type I LastRead 1 FirstWrite -1}
		query_11 {Type I LastRead 1 FirstWrite -1}
		query_12 {Type I LastRead 1 FirstWrite -1}
		query_13 {Type I LastRead 1 FirstWrite -1}
		query_14 {Type I LastRead 1 FirstWrite -1}
		query_15 {Type I LastRead 1 FirstWrite -1}
		key_metadata_stream {Type I LastRead 1 FirstWrite -1}
		key0_stream {Type I LastRead 1 FirstWrite -1}
		key1_stream {Type I LastRead 1 FirstWrite -1}
		score_stream {Type O LastRead -1 FirstWrite 15}}
	swiftkv_coefficient_producer {
		score_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		control_stream {Type O LastRead -1 FirstWrite 14}
		inverse_normalization_stream {Type O LastRead -1 FirstWrite 4}
		position_val_c {Type O LastRead -1 FirstWrite 0}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	swiftkv_coefficient_producer_Pipeline_coefficient_token_loop {
		add_ln1094 {Type I LastRead 0 FirstWrite -1}
		score_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type O LastRead -1 FirstWrite 14}
		normalization_out {Type O LastRead -1 FirstWrite 10}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	swiftkv_reciprocal_normalization {
		normalization_val {Type I LastRead 0 FirstWrite -1}}
	swiftkv_update_values_and_quantize {
		value_metadata_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine3_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine3_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type I LastRead 1 FirstWrite -1}
		inverse_normalization_stream {Type I LastRead 0 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 23}
		scale_pe0 {Type O LastRead -1 FirstWrite 23}}
	swiftkv_accumulate_values_split {
		value_metadata_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine3_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine3_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type I LastRead 1 FirstWrite -1}
		position_val {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine0_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine0_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine0_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine0_3 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine1_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine1_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine1_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine1_3 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine2_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine2_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine2_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine2_3 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine3_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine3_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine3_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_engine3_3 {Type IO LastRead 0 FirstWrite 0}}
	swiftkv_broadcast_update_controls {
		value_metadata_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		engine0_control_stream {Type O LastRead -1 FirstWrite 1}
		engine1_control_stream {Type O LastRead -1 FirstWrite 1}
		engine2_control_stream {Type O LastRead -1 FirstWrite 1}
		engine3_control_stream {Type O LastRead -1 FirstWrite 1}
		position_val_c33 {Type O LastRead -1 FirstWrite 0}
		position_val_c34 {Type O LastRead -1 FirstWrite 0}
		position_val_c35 {Type O LastRead -1 FirstWrite 0}
		position_val_c36 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop {
		add_ln1149 {Type I LastRead 0 FirstWrite -1}
		value_metadata_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type I LastRead 1 FirstWrite -1}
		engine0_control_stream {Type O LastRead -1 FirstWrite 1}
		engine1_control_stream {Type O LastRead -1 FirstWrite 1}
		engine2_control_stream {Type O LastRead -1 FirstWrite 1}
		engine3_control_stream {Type O LastRead -1 FirstWrite 1}}
	swiftkv_prepare_update_engine_phases_0_s {
		engine0_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine0_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		engine0_phase_stream {Type O LastRead -1 FirstWrite 2}
		position_val_c32 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3 {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		engine0_phase_stream {Type O LastRead -1 FirstWrite 2}
		engine0_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine0_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine0_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_prepare_update_engine_phases_1_s {
		engine1_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine1_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		engine1_phase_stream {Type O LastRead -1 FirstWrite 2}
		position_val_c31 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2 {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		engine1_phase_stream {Type O LastRead -1 FirstWrite 2}
		engine1_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine1_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine1_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_prepare_update_engine_phases_2_s {
		engine2_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine2_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		engine2_phase_stream {Type O LastRead -1 FirstWrite 2}
		position_val_c30 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1 {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		engine2_phase_stream {Type O LastRead -1 FirstWrite 2}
		engine2_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine2_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine2_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_prepare_update_engine_phases_3_s {
		engine3_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine3_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine3_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		engine3_phase_stream {Type O LastRead -1 FirstWrite 2}
		position_val_c {Type O LastRead -1 FirstWrite 0}}
	swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		engine3_phase_stream {Type O LastRead -1 FirstWrite 2}
		engine3_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine3_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine3_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_update_value_engine_0_s {
		engine0_phase_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 1 FirstWrite -1}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 0}}
	swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3 {
		weighted_value_3 {Type O LastRead -1 FirstWrite 0}
		weighted_value_2 {Type O LastRead -1 FirstWrite 0}
		weighted_value_1 {Type O LastRead -1 FirstWrite 0}
		weighted_value_0 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 8}
		engine0_phase_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_update_value_engine_1_s {
		engine1_phase_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 1 FirstWrite -1}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 0}}
	swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2 {
		weighted_value_3 {Type O LastRead -1 FirstWrite 0}
		weighted_value_2 {Type O LastRead -1 FirstWrite 0}
		weighted_value_1 {Type O LastRead -1 FirstWrite 0}
		weighted_value_0 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 8}
		engine1_phase_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_update_value_engine_2_s {
		engine2_phase_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 1 FirstWrite -1}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 0}}
	swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1 {
		weighted_value_3 {Type O LastRead -1 FirstWrite 0}
		weighted_value_2 {Type O LastRead -1 FirstWrite 0}
		weighted_value_1 {Type O LastRead -1 FirstWrite 0}
		weighted_value_0 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 8}
		engine2_phase_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_update_value_engine_3_s {
		engine3_phase_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 1 FirstWrite -1}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 0}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 0}}
	swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop {
		weighted_value_3 {Type O LastRead -1 FirstWrite 0}
		weighted_value_2 {Type O LastRead -1 FirstWrite 0}
		weighted_value_1 {Type O LastRead -1 FirstWrite 0}
		weighted_value_0 {Type O LastRead -1 FirstWrite 0}}
	swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 8}
		engine3_phase_stream {Type I LastRead 1 FirstWrite -1}}
	swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop {
		sext_ln1488 {Type I LastRead 0 FirstWrite -1}
		attention_group {Type O LastRead -1 FirstWrite 7}
		weighted_value_engine0 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine0_1 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine0_2 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine0_3 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine1 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine1_1 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine1_2 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine1_3 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine2 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine2_1 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine2_2 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine2_3 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine3 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine3_1 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine3_2 {Type I LastRead 0 FirstWrite -1}
		weighted_value_engine3_3 {Type I LastRead 0 FirstWrite -1}
		max_abs_out {Type O LastRead -1 FirstWrite 7}}
	swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop {
		attention_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 22}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "616", "Max" : "33376"}
	, {"Name" : "Interval", "Min" : "511", "Max" : "33271"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	query_0 { ap_memory {  { query_0_address0 mem_address 1 3 }  { query_0_ce0 mem_ce 1 1 }  { query_0_d0 mem_din 1 32 }  { query_0_q0 mem_dout 0 32 }  { query_0_we0 mem_we 1 1 } } }
	query_1 { ap_memory {  { query_1_address0 mem_address 1 3 }  { query_1_ce0 mem_ce 1 1 }  { query_1_d0 mem_din 1 32 }  { query_1_q0 mem_dout 0 32 }  { query_1_we0 mem_we 1 1 } } }
	query_2 { ap_memory {  { query_2_address0 mem_address 1 3 }  { query_2_ce0 mem_ce 1 1 }  { query_2_d0 mem_din 1 32 }  { query_2_q0 mem_dout 0 32 }  { query_2_we0 mem_we 1 1 } } }
	query_3 { ap_memory {  { query_3_address0 mem_address 1 3 }  { query_3_ce0 mem_ce 1 1 }  { query_3_d0 mem_din 1 32 }  { query_3_q0 mem_dout 0 32 }  { query_3_we0 mem_we 1 1 } } }
	query_4 { ap_memory {  { query_4_address0 mem_address 1 3 }  { query_4_ce0 mem_ce 1 1 }  { query_4_d0 mem_din 1 32 }  { query_4_q0 mem_dout 0 32 }  { query_4_we0 mem_we 1 1 } } }
	query_5 { ap_memory {  { query_5_address0 mem_address 1 3 }  { query_5_ce0 mem_ce 1 1 }  { query_5_d0 mem_din 1 32 }  { query_5_q0 mem_dout 0 32 }  { query_5_we0 mem_we 1 1 } } }
	query_6 { ap_memory {  { query_6_address0 mem_address 1 3 }  { query_6_ce0 mem_ce 1 1 }  { query_6_d0 mem_din 1 32 }  { query_6_q0 mem_dout 0 32 }  { query_6_we0 mem_we 1 1 } } }
	query_7 { ap_memory {  { query_7_address0 mem_address 1 3 }  { query_7_ce0 mem_ce 1 1 }  { query_7_d0 mem_din 1 32 }  { query_7_q0 mem_dout 0 32 }  { query_7_we0 mem_we 1 1 } } }
	query_8 { ap_memory {  { query_8_address0 mem_address 1 3 }  { query_8_ce0 mem_ce 1 1 }  { query_8_d0 mem_din 1 32 }  { query_8_q0 mem_dout 0 32 }  { query_8_we0 mem_we 1 1 } } }
	query_9 { ap_memory {  { query_9_address0 mem_address 1 3 }  { query_9_ce0 mem_ce 1 1 }  { query_9_d0 mem_din 1 32 }  { query_9_q0 mem_dout 0 32 }  { query_9_we0 mem_we 1 1 } } }
	query_10 { ap_memory {  { query_10_address0 mem_address 1 3 }  { query_10_ce0 mem_ce 1 1 }  { query_10_d0 mem_din 1 32 }  { query_10_q0 mem_dout 0 32 }  { query_10_we0 mem_we 1 1 } } }
	query_11 { ap_memory {  { query_11_address0 mem_address 1 3 }  { query_11_ce0 mem_ce 1 1 }  { query_11_d0 mem_din 1 32 }  { query_11_q0 mem_dout 0 32 }  { query_11_we0 mem_we 1 1 } } }
	query_12 { ap_memory {  { query_12_address0 mem_address 1 3 }  { query_12_ce0 mem_ce 1 1 }  { query_12_d0 mem_din 1 32 }  { query_12_q0 mem_dout 0 32 }  { query_12_we0 mem_we 1 1 } } }
	query_13 { ap_memory {  { query_13_address0 mem_address 1 3 }  { query_13_ce0 mem_ce 1 1 }  { query_13_d0 mem_din 1 32 }  { query_13_q0 mem_dout 0 32 }  { query_13_we0 mem_we 1 1 } } }
	query_14 { ap_memory {  { query_14_address0 mem_address 1 3 }  { query_14_ce0 mem_ce 1 1 }  { query_14_d0 mem_din 1 32 }  { query_14_q0 mem_dout 0 32 }  { query_14_we0 mem_we 1 1 } } }
	query_15 { ap_memory {  { query_15_address0 mem_address 1 3 }  { query_15_ce0 mem_ce 1 1 }  { query_15_d0 mem_din 1 32 }  { query_15_q0 mem_dout 0 32 }  { query_15_we0 mem_we 1 1 } } }
	 { m_axi {  { m_axi_gmem0_AWVALID VALID 1 1 }  { m_axi_gmem0_AWREADY READY 0 1 }  { m_axi_gmem0_AWADDR ADDR 1 64 }  { m_axi_gmem0_AWID ID 1 1 }  { m_axi_gmem0_AWLEN SIZE 1 32 }  { m_axi_gmem0_AWSIZE BURST 1 3 }  { m_axi_gmem0_AWBURST LOCK 1 2 }  { m_axi_gmem0_AWLOCK CACHE 1 2 }  { m_axi_gmem0_AWCACHE PROT 1 4 }  { m_axi_gmem0_AWPROT QOS 1 3 }  { m_axi_gmem0_AWQOS REGION 1 4 }  { m_axi_gmem0_AWREGION USER 1 4 }  { m_axi_gmem0_AWUSER DATA 1 1 }  { m_axi_gmem0_WVALID VALID 1 1 }  { m_axi_gmem0_WREADY READY 0 1 }  { m_axi_gmem0_WDATA FIFONUM 1 512 }  { m_axi_gmem0_WSTRB STRB 1 64 }  { m_axi_gmem0_WLAST LAST 1 1 }  { m_axi_gmem0_WID ID 1 1 }  { m_axi_gmem0_WUSER DATA 1 1 }  { m_axi_gmem0_ARVALID VALID 1 1 }  { m_axi_gmem0_ARREADY READY 0 1 }  { m_axi_gmem0_ARADDR ADDR 1 64 }  { m_axi_gmem0_ARID ID 1 1 }  { m_axi_gmem0_ARLEN SIZE 1 32 }  { m_axi_gmem0_ARSIZE BURST 1 3 }  { m_axi_gmem0_ARBURST LOCK 1 2 }  { m_axi_gmem0_ARLOCK CACHE 1 2 }  { m_axi_gmem0_ARCACHE PROT 1 4 }  { m_axi_gmem0_ARPROT QOS 1 3 }  { m_axi_gmem0_ARQOS REGION 1 4 }  { m_axi_gmem0_ARREGION USER 1 4 }  { m_axi_gmem0_ARUSER DATA 1 1 }  { m_axi_gmem0_RVALID VALID 0 1 }  { m_axi_gmem0_RREADY READY 1 1 }  { m_axi_gmem0_RDATA FIFONUM 0 512 }  { m_axi_gmem0_RLAST LAST 0 1 }  { m_axi_gmem0_RID ID 0 1 }  { m_axi_gmem0_RFIFONUM LEN 0 12 }  { m_axi_gmem0_RUSER DATA 0 1 }  { m_axi_gmem0_RRESP RESP 0 2 }  { m_axi_gmem0_BVALID VALID 0 1 }  { m_axi_gmem0_BREADY READY 1 1 }  { m_axi_gmem0_BRESP RESP 0 2 }  { m_axi_gmem0_BID ID 0 1 }  { m_axi_gmem0_BUSER DATA 0 1 } } }
	kv_cache { ap_none {  { kv_cache in_data 0 64 }  { kv_cache_ap_vld in_vld 0 1 } } }
	head_base { ap_none {  { head_base in_data 0 24 }  { head_base_ap_vld in_vld 0 1 } } }
	current_record_0_val1 { ap_none {  { current_record_0_val1 in_data 0 512 }  { current_record_0_val1_ap_vld in_vld 0 1 } } }
	current_record_1_val2 { ap_none {  { current_record_1_val2 in_data 0 512 }  { current_record_1_val2_ap_vld in_vld 0 1 } } }
	current_record_2_val3 { ap_none {  { current_record_2_val3 in_data 0 512 }  { current_record_2_val3_ap_vld in_vld 0 1 } } }
	current_record_3_val4 { ap_none {  { current_record_3_val4 in_data 0 512 }  { current_record_3_val4_ap_vld in_vld 0 1 } } }
	current_record_4_val5 { ap_none {  { current_record_4_val5 in_data 0 512 }  { current_record_4_val5_ap_vld in_vld 0 1 } } }
	position_val { ap_none {  { position_val in_data 0 12 }  { position_val_ap_vld in_vld 0 1 } } }
	quantized_pe0 { ap_fifo {  { quantized_pe0_din fifo_data_in 1 480 }  { quantized_pe0_full_n fifo_status 0 1 }  { quantized_pe0_write fifo_port_we 1 1 } } }
	scale_pe0 { ap_fifo {  { scale_pe0_din fifo_data_in 1 32 }  { scale_pe0_full_n fifo_status 0 1 }  { scale_pe0_write fifo_port_we 1 1 } } }
}
