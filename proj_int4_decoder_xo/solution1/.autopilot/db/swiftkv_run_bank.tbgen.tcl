set moduleName swiftkv_run_bank
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
set C_modelName {swiftkv_run_bank}
set C_modelType { void 0 }
set C_modelArgList {
	{ q int 512 regular {array 64 { 1 } 1 1 }  }
	{ k int 512 regular {array 64 { 1 } 1 1 }  }
	{ v int 512 regular {array 64 { 1 } 1 1 }  }
	{ gmem3 int 512 regular {axi_master 2}  }
	{ kv_cache int 64 regular  }
	{ cos_pe3 int 19 regular {fifo 0 volatile }  }
	{ sin_pe3 int 19 regular {fifo 0 volatile }  }
	{ quantized_pe3 int 480 regular {fifo 1 volatile }  }
	{ scale_pe3 int 32 regular {fifo 1 volatile }  }
	{ layer_index_val int 6 regular  }
	{ position_val int 12 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "q", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "k", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "v", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READWRITE", "bitSlice":[ {"cElement": [{"cName": "model_bank3","offset": { "type": "dynamic","port_name": "model_bank3","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe3","offset": { "type": "dynamic","port_name": "residual_pe3","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe3","offset": { "type": "dynamic","port_name": "logits_pe3","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe3","offset": { "type": "dynamic","port_name": "kv_cache_pe3","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "kv_cache", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "cos_pe3", "interface" : "fifo", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "sin_pe3", "interface" : "fifo", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "layer_index_val", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "position_val", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 84
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ q_address0 sc_out sc_lv 6 signal 0 } 
	{ q_ce0 sc_out sc_logic 1 signal 0 } 
	{ q_q0 sc_in sc_lv 512 signal 0 } 
	{ k_address0 sc_out sc_lv 6 signal 1 } 
	{ k_ce0 sc_out sc_logic 1 signal 1 } 
	{ k_q0 sc_in sc_lv 512 signal 1 } 
	{ v_address0 sc_out sc_lv 6 signal 2 } 
	{ v_ce0 sc_out sc_logic 1 signal 2 } 
	{ v_q0 sc_in sc_lv 512 signal 2 } 
	{ m_axi_gmem3_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem3_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_AWLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem3_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem3_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem3_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem3_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem3_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_WDATA sc_out sc_lv 512 signal 3 } 
	{ m_axi_gmem3_WSTRB sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem3_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_gmem3_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_ARLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_gmem3_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem3_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem3_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_gmem3_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_gmem3_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_gmem3_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_gmem3_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_RDATA sc_in sc_lv 512 signal 3 } 
	{ m_axi_gmem3_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem3_RFIFONUM sc_in sc_lv 12 signal 3 } 
	{ m_axi_gmem3_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem3_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem3_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_gmem3_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_gmem3_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_gmem3_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_gmem3_BUSER sc_in sc_lv 1 signal 3 } 
	{ kv_cache sc_in sc_lv 64 signal 4 } 
	{ cos_pe3_dout sc_in sc_lv 19 signal 5 } 
	{ cos_pe3_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ cos_pe3_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ cos_pe3_empty_n sc_in sc_logic 1 signal 5 } 
	{ cos_pe3_read sc_out sc_logic 1 signal 5 } 
	{ sin_pe3_dout sc_in sc_lv 19 signal 6 } 
	{ sin_pe3_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ sin_pe3_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ sin_pe3_empty_n sc_in sc_logic 1 signal 6 } 
	{ sin_pe3_read sc_out sc_logic 1 signal 6 } 
	{ quantized_pe3_din sc_out sc_lv 480 signal 7 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ quantized_pe3_full_n sc_in sc_logic 1 signal 7 } 
	{ quantized_pe3_write sc_out sc_logic 1 signal 7 } 
	{ scale_pe3_din sc_out sc_lv 32 signal 8 } 
	{ scale_pe3_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ scale_pe3_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ scale_pe3_full_n sc_in sc_logic 1 signal 8 } 
	{ scale_pe3_write sc_out sc_logic 1 signal 8 } 
	{ layer_index_val sc_in sc_lv 6 signal 9 } 
	{ position_val sc_in sc_lv 12 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "q_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "q", "role": "address0" }} , 
 	{ "name": "q_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q", "role": "ce0" }} , 
 	{ "name": "q_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q", "role": "q0" }} , 
 	{ "name": "k_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "k", "role": "address0" }} , 
 	{ "name": "k_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k", "role": "ce0" }} , 
 	{ "name": "k_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k", "role": "q0" }} , 
 	{ "name": "v_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "v", "role": "address0" }} , 
 	{ "name": "v_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v", "role": "ce0" }} , 
 	{ "name": "v_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v", "role": "q0" }} , 
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
 	{ "name": "kv_cache", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "kv_cache", "role": "default" }} , 
 	{ "name": "cos_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "cos_pe3", "role": "dout" }} , 
 	{ "name": "cos_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe3", "role": "num_data_valid" }} , 
 	{ "name": "cos_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe3", "role": "fifo_cap" }} , 
 	{ "name": "cos_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe3", "role": "empty_n" }} , 
 	{ "name": "cos_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe3", "role": "read" }} , 
 	{ "name": "sin_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sin_pe3", "role": "dout" }} , 
 	{ "name": "sin_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe3", "role": "num_data_valid" }} , 
 	{ "name": "sin_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe3", "role": "fifo_cap" }} , 
 	{ "name": "sin_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe3", "role": "empty_n" }} , 
 	{ "name": "sin_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe3", "role": "read" }} , 
 	{ "name": "quantized_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "din" }} , 
 	{ "name": "quantized_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "full_n" }} , 
 	{ "name": "quantized_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "write" }} , 
 	{ "name": "scale_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe3", "role": "din" }} , 
 	{ "name": "scale_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "full_n" }} , 
 	{ "name": "scale_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "write" }} , 
 	{ "name": "layer_index_val", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "layer_index_val", "role": "default" }} , 
 	{ "name": "position_val", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "25", "27", "29", "31", "37", "58", "61"],
		"CDFG" : "swiftkv_run_bank",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7949", "EstimateLatencyMax" : "270029",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "q", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "25", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288", "Port" : "q", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "k", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296", "Port" : "k", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "v", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304", "Port" : "v", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "IO",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem3_blk_n_B", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_swiftkv_attention_head_fu_355", "Port" : "gmem0", "Inst_start_state" : "80", "Inst_end_state" : "81"},
					{"ID" : "58", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343", "Port" : "gmem3", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "kv_cache", "Type" : "None", "Direction" : "I"},
			{"Name" : "cos_pe3", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278", "Port" : "cos_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "sin_pe3", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278", "Port" : "sin_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_swiftkv_attention_head_fu_355", "Port" : "quantized_pe0", "Inst_start_state" : "80", "Inst_end_state" : "81"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_swiftkv_attention_head_fu_355", "Port" : "scale_pe0", "Inst_start_state" : "80", "Inst_end_state" : "81"}]},
			{"Name" : "layer_index_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_swiftkv_attention_head_fu_355", "Port" : "SWIFTKV_EXP2_LUT_Q30", "Inst_start_state" : "80", "Inst_end_state" : "81"}]}],
		"Loop" : [
			{"Name" : "pe_head_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "81", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state81"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_cosine_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_sine_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_2_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_3_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_4_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_5_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_6_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_7_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_8_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_9_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_10_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_11_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_12_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_13_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_14_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.query_15_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.q_words_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.k_words_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.v_words_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rotated_k_words_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278", "Parent" : "0", "Child" : ["24"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cos_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "cos_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_cosine", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "sin_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "sin_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_sine", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pe_cache_rope_pair_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop_fu_278.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288", "Parent" : "0", "Child" : ["26"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_load_q_word_loop",
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
			{"Name" : "tmp_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "q", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "q_words", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pe_load_q_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_q_word_loop_fu_288.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296", "Parent" : "0", "Child" : ["28"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_load_k_word_loop",
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
			{"Name" : "tmp_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "k", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "k_words", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pe_load_k_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_k_word_loop_fu_296.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_load_v_word_loop",
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
			{"Name" : "tmp_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "v", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v_words", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pe_load_v_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_load_v_word_loop_fu_304.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312", "Parent" : "0", "Child" : ["32", "33", "34", "35", "36"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "137", "EstimateLatencyMax" : "137",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rotated_k_words", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "local_cosine", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "local_sine", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "q_words", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "k_words", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312.mul_32s_19s_51_4_1_U96", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312.mul_32s_19s_51_4_1_U97", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312.mul_32s_19s_51_4_1_U98", "Parent" : "31"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312.mul_32s_19s_51_4_1_U99", "Parent" : "31"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop_fu_312.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337", "Parent" : "0", "Child" : ["38", "48"],
		"CDFG" : "swiftkv_quantize_kv_record",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "137", "EstimateLatencyMax" : "137",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "k_words", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v_words", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "quantize_kv_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538", "Parent" : "37", "Child" : ["39", "40", "41", "42", "43", "44", "45", "46", "47"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty_612", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_613", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_614", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "maximum_v_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "maximum_k_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "find_kv_group_max_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U122", "Parent" : "38"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U123", "Parent" : "38"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U124", "Parent" : "38"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U125", "Parent" : "38"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U126", "Parent" : "38"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U127", "Parent" : "38"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U128", "Parent" : "38"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U129", "Parent" : "38"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608", "Parent" : "37", "Child" : ["49", "50", "51", "52", "53", "54", "55", "56", "57"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i313", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i328", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_609", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_610", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_611", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_k_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_kv_group_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U197", "Parent" : "48"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U198", "Parent" : "48"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U199", "Parent" : "48"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U200", "Parent" : "48"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U201", "Parent" : "48"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U202", "Parent" : "48"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U203", "Parent" : "48"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U204", "Parent" : "48"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_fu_337.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343", "Parent" : "0", "Child" : ["59", "60"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_write_kv_word_loop",
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
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln1952", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_4", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "pe_write_kv_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343.sparsemux_11_3_512_1_1_U339", "Parent" : "58"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_run_bank_Pipeline_pe_write_kv_word_loop_fu_343.flow_control_loop_pipe_sequential_init_U", "Parent" : "58"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355", "Parent" : "0", "Child" : ["62", "63", "66", "72", "96", "105", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233"],
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
			{"ID" : "62", "Name" : "entry_proc57_U0"},
			{"ID" : "63", "Name" : "swiftkv_read_compressed_kv_cache_U0"},
			{"ID" : "72", "Name" : "swiftkv_process_compressed_kv_U0"}],
		"OutputProcess" : [
			{"ID" : "105", "Name" : "swiftkv_update_values_and_quantize_U0"}],
		"Port" : [
			{"Name" : "query_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_0"}]},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_1"}]},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_2"}]},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_3"}]},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_4"}]},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_5"}]},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_6"}]},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_7"}]},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_8"}]},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_9"}]},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_10"}]},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_11"}]},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_12"}]},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_13"}]},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_14"}]},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "72", "SubInstance" : "swiftkv_process_compressed_kv_U0", "Port" : "query_15"}]},
			{"Name" : "gmem0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "63", "SubInstance" : "swiftkv_read_compressed_kv_cache_U0", "Port" : "gmem0"}]},
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
					{"ID" : "105", "SubInstance" : "swiftkv_update_values_and_quantize_U0", "Port" : "quantized_pe0"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "105", "SubInstance" : "swiftkv_update_values_and_quantize_U0", "Port" : "scale_pe0"}]},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "96", "SubInstance" : "swiftkv_coefficient_producer_U0", "Port" : "SWIFTKV_EXP2_LUT_Q30"}]}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.entry_proc57_U0", "Parent" : "61",
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
			{"Name" : "current_record_0_val1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "210", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_0_val1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_1_val2", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_1_val2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "211", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_1_val2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_2_val3", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_2_val3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "212", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_2_val3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_3_val4", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_3_val4_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "213", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_3_val4_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_4_val5", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_record_4_val5_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "214", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_4_val5_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_read_compressed_kv_cache_U0", "Parent" : "61", "Child" : ["64"],
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
					{"ID" : "64", "SubInstance" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Port" : "gmem0", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "kv_cache", "Type" : "None", "Direction" : "I"},
			{"Name" : "head_base", "Type" : "None", "Direction" : "I"},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "215", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "64", "SubInstance" : "grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Port" : "cached_kv_word_stream", "Inst_start_state" : "73", "Inst_end_state" : "74"}]},
			{"Name" : "position_val_c14", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "216", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c14_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_read_compressed_kv_cache_U0.grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114", "Parent" : "63", "Child" : ["65"],
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
	{"ID" : "65", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_read_compressed_kv_cache_U0.grp_swiftkv_read_compressed_kv_cache_Pipeline_read_compressed_kv_loop_fu_114.flow_control_loop_pipe_sequential_init_U", "Parent" : "64"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0", "Parent" : "61", "Child" : ["67", "69"],
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
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "216", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_0_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["62"], "DependentChan" : "210", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_0_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_1_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["62"], "DependentChan" : "211", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_1_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_2_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["62"], "DependentChan" : "212", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_2_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_3_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["62"], "DependentChan" : "213", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_3_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "current_record_4_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["62"], "DependentChan" : "214", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "current_record_4_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cached_kv_word_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["63"], "DependentChan" : "215", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "cached_kv_word_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["72"], "DependentChan" : "217", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key_metadata_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "218", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value_metadata_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["72"], "DependentChan" : "219", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["72"], "DependentChan" : "220", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "key1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "key1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "221", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "222", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "223", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine2_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "224", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value0_engine3_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "225", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine0_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "226", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine1_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "227", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine2_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "228", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "69", "SubInstance" : "grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Port" : "value1_engine3_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120", "Parent" : "66", "Child" : ["68"],
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
	{"ID" : "68", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop_fu_120.flow_control_loop_pipe_sequential_init_U", "Parent" : "67"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151", "Parent" : "66", "Child" : ["70", "71"],
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
	{"ID" : "70", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151.sparsemux_11_3_512_1_1_U382", "Parent" : "69"},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_route_compressed_kv_cache_U0.grp_swiftkv_route_compressed_kv_cache_Pipeline_stream_current_compressed_kv_loop_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "69"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0", "Parent" : "61", "Child" : ["73"],
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
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_4", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_5", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_6", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_7", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_8", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_9", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_10", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_12", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_13", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_14", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_15", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "217", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "219", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "220", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["96"], "DependentChan" : "229", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "73", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c13", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["96"], "DependentChan" : "230", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c13_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Parent" : "72", "Child" : ["74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95"],
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
	{"ID" : "74", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U419", "Parent" : "73"},
	{"ID" : "75", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U420", "Parent" : "73"},
	{"ID" : "76", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U421", "Parent" : "73"},
	{"ID" : "77", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U422", "Parent" : "73"},
	{"ID" : "78", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U423", "Parent" : "73"},
	{"ID" : "79", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U424", "Parent" : "73"},
	{"ID" : "80", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U425", "Parent" : "73"},
	{"ID" : "81", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U426", "Parent" : "73"},
	{"ID" : "82", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U427", "Parent" : "73"},
	{"ID" : "83", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U428", "Parent" : "73"},
	{"ID" : "84", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U429", "Parent" : "73"},
	{"ID" : "85", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U430", "Parent" : "73"},
	{"ID" : "86", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U431", "Parent" : "73"},
	{"ID" : "87", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U432", "Parent" : "73"},
	{"ID" : "88", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U433", "Parent" : "73"},
	{"ID" : "89", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U434", "Parent" : "73"},
	{"ID" : "90", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_44s_15ns_58_5_1_U435", "Parent" : "73"},
	{"ID" : "91", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_17_3_128_1_1_U436", "Parent" : "73"},
	{"ID" : "92", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_9_2_5_1_1_U437", "Parent" : "73"},
	{"ID" : "93", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.flow_control_loop_pipe_sequential_init_U", "Parent" : "73"},
	{"ID" : "94", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.frp_pipeline_valid_U", "Parent" : "73"},
	{"ID" : "95", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_process_compressed_kv_U0.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.pf_score_stream_U", "Parent" : "73"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0", "Parent" : "61", "Child" : ["97", "103"],
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
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["72"], "DependentChan" : "229", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "97", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["72"], "DependentChan" : "230", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "231", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "97", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "232", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["105"], "DependentChan" : "233", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "97", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "SWIFTKV_EXP2_LUT_Q30", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Parent" : "96", "Child" : ["98", "99", "100", "101", "102"],
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
	{"ID" : "98", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.SWIFTKV_EXP2_LUT_Q30_U", "Parent" : "97"},
	{"ID" : "99", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32ns_12ns_44_2_1_U486", "Parent" : "97"},
	{"ID" : "100", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32s_23ns_46_2_1_U487", "Parent" : "97"},
	{"ID" : "101", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_30ns_18ns_48_5_1_U488", "Parent" : "97"},
	{"ID" : "102", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.flow_control_loop_pipe_sequential_init_U", "Parent" : "97"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_reciprocal_normalization_fu_93", "Parent" : "96", "Child" : ["104"],
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
	{"ID" : "104", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_coefficient_producer_U0.grp_swiftkv_reciprocal_normalization_fu_93.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0", "Parent" : "61", "Child" : ["106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "195", "202", "207", "208", "209"],
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
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "218", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value_metadata_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "221", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "222", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "223", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "224", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "225", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "226", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "227", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "228", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["96"], "DependentChan" : "231", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "123", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "control_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["96"], "DependentChan" : "232", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["96"], "DependentChan" : "233", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_U", "Parent" : "105"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_1_U", "Parent" : "105"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_2_U", "Parent" : "105"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine0_3_U", "Parent" : "105"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_U", "Parent" : "105"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_1_U", "Parent" : "105"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_2_U", "Parent" : "105"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine1_3_U", "Parent" : "105"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_U", "Parent" : "105"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_1_U", "Parent" : "105"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_2_U", "Parent" : "105"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine2_3_U", "Parent" : "105"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_U", "Parent" : "105"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_1_U", "Parent" : "105"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_2_U", "Parent" : "105"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.weighted_value_engine3_3_U", "Parent" : "105"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.attention_group_U", "Parent" : "105"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262", "Parent" : "105", "Child" : ["124", "127", "131", "135", "139", "143", "152", "161", "170", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194"],
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
			{"ID" : "124", "Name" : "swiftkv_broadcast_update_controls_U0"},
			{"ID" : "143", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "152", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "161", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "170", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"OutputProcess" : [
			{"ID" : "143", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "152", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "161", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "170", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "124", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "value_metadata_stream"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "127", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value0_engine0_stream"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "131", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value0_engine1_stream"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value0_engine2_stream"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "139", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value0_engine3_stream"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "127", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value1_engine0_stream"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "131", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value1_engine1_stream"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "135", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value1_engine2_stream"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "139", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value1_engine3_stream"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "124", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "control_stream"}]},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "143", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine0_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "143", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine0_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "143", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine0_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "143", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "152", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "152", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "152", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "152", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine3_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine3_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine3_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine3_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_3"}]}]},
	{"ID" : "124", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0", "Parent" : "123", "Child" : ["125"],
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
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "179", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["131"], "DependentChan" : "180", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["135"], "DependentChan" : "181", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["139"], "DependentChan" : "182", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "125", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c33", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["139"], "DependentChan" : "183", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c33_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c34", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["135"], "DependentChan" : "184", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c34_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c35", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["131"], "DependentChan" : "185", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c35_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c36", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["127"], "DependentChan" : "186", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c36_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "125", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Parent" : "124", "Child" : ["126"],
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
	{"ID" : "126", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98.flow_control_loop_pipe_sequential_init_U", "Parent" : "125"},
	{"ID" : "127", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0", "Parent" : "123", "Child" : ["128"],
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
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "179", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "186", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["143"], "DependentChan" : "187", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c32", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["143"], "DependentChan" : "188", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c32_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "128", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Parent" : "127", "Child" : ["129", "130"],
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
	{"ID" : "129", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.sparsemux_9_2_5_1_1_U521", "Parent" : "128"},
	{"ID" : "130", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "128"},
	{"ID" : "131", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0", "Parent" : "123", "Child" : ["132"],
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
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "180", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "185", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "189", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "132", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c31", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["152"], "DependentChan" : "190", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c31_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "132", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Parent" : "131", "Child" : ["133", "134"],
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
	{"ID" : "133", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.sparsemux_9_2_5_1_1_U533", "Parent" : "132"},
	{"ID" : "134", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "132"},
	{"ID" : "135", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0", "Parent" : "123", "Child" : ["136"],
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
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "181", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "184", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["161"], "DependentChan" : "191", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "136", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c30", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["161"], "DependentChan" : "192", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c30_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "136", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Parent" : "135", "Child" : ["137", "138"],
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
	{"ID" : "137", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.sparsemux_9_2_5_1_1_U545", "Parent" : "136"},
	{"ID" : "138", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "136"},
	{"ID" : "139", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0", "Parent" : "123", "Child" : ["140"],
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
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "182", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "140", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "140", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "140", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["124"], "DependentChan" : "183", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["170"], "DependentChan" : "193", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "140", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["170"], "DependentChan" : "194", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "140", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Parent" : "139", "Child" : ["141", "142"],
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
	{"ID" : "141", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.sparsemux_9_2_5_1_1_U557", "Parent" : "140"},
	{"ID" : "142", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "140"},
	{"ID" : "143", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0", "Parent" : "123", "Child" : ["144", "146"],
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
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["127"], "DependentChan" : "187", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine0_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["127"], "DependentChan" : "188", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "144", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "144", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "144", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "144", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "144", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Parent" : "143", "Child" : ["145"],
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
	{"ID" : "145", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "144"},
	{"ID" : "146", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "143", "Child" : ["147", "148", "149", "150", "151"],
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
	{"ID" : "147", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U573", "Parent" : "146"},
	{"ID" : "148", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U574", "Parent" : "146"},
	{"ID" : "149", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U575", "Parent" : "146"},
	{"ID" : "150", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U576", "Parent" : "146"},
	{"ID" : "151", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "146"},
	{"ID" : "152", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0", "Parent" : "123", "Child" : ["153", "155"],
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
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["131"], "DependentChan" : "189", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "155", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine1_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["131"], "DependentChan" : "190", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "155", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "155", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "155", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "153", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "155", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "153", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Parent" : "152", "Child" : ["154"],
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
	{"ID" : "154", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "153"},
	{"ID" : "155", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "152", "Child" : ["156", "157", "158", "159", "160"],
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
	{"ID" : "156", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U594", "Parent" : "155"},
	{"ID" : "157", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U595", "Parent" : "155"},
	{"ID" : "158", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U596", "Parent" : "155"},
	{"ID" : "159", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U597", "Parent" : "155"},
	{"ID" : "160", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "155"},
	{"ID" : "161", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0", "Parent" : "123", "Child" : ["162", "164"],
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
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["135"], "DependentChan" : "191", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "164", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine2_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["135"], "DependentChan" : "192", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "162", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "164", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "162", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "164", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "162", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "164", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "162", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "164", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "162", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Parent" : "161", "Child" : ["163"],
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
	{"ID" : "163", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "162"},
	{"ID" : "164", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "161", "Child" : ["165", "166", "167", "168", "169"],
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
	{"ID" : "165", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U614", "Parent" : "164"},
	{"ID" : "166", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U615", "Parent" : "164"},
	{"ID" : "167", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U616", "Parent" : "164"},
	{"ID" : "168", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U617", "Parent" : "164"},
	{"ID" : "169", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "164"},
	{"ID" : "170", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0", "Parent" : "123", "Child" : ["171", "173"],
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
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["139"], "DependentChan" : "193", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "173", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine3_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["139"], "DependentChan" : "194", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "173", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "173", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "173", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "173", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "171", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Parent" : "170", "Child" : ["172"],
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
	{"ID" : "172", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "171"},
	{"ID" : "173", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "170", "Child" : ["174", "175", "176", "177", "178"],
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
	{"ID" : "174", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U634", "Parent" : "173"},
	{"ID" : "175", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U635", "Parent" : "173"},
	{"ID" : "176", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U636", "Parent" : "173"},
	{"ID" : "177", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U637", "Parent" : "173"},
	{"ID" : "178", "Level" : "6", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "173"},
	{"ID" : "179", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine0_control_stream_U", "Parent" : "123"},
	{"ID" : "180", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine1_control_stream_U", "Parent" : "123"},
	{"ID" : "181", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine2_control_stream_U", "Parent" : "123"},
	{"ID" : "182", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine3_control_stream_U", "Parent" : "123"},
	{"ID" : "183", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c33_U", "Parent" : "123"},
	{"ID" : "184", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c34_U", "Parent" : "123"},
	{"ID" : "185", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c35_U", "Parent" : "123"},
	{"ID" : "186", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c36_U", "Parent" : "123"},
	{"ID" : "187", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine0_phase_stream_U", "Parent" : "123"},
	{"ID" : "188", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c32_U", "Parent" : "123"},
	{"ID" : "189", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine1_phase_stream_U", "Parent" : "123"},
	{"ID" : "190", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c31_U", "Parent" : "123"},
	{"ID" : "191", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine2_phase_stream_U", "Parent" : "123"},
	{"ID" : "192", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c30_U", "Parent" : "123"},
	{"ID" : "193", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.engine3_phase_stream_U", "Parent" : "123"},
	{"ID" : "194", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_accumulate_values_split_fu_262.position_val_c_U", "Parent" : "123"},
	{"ID" : "195", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320", "Parent" : "105", "Child" : ["196", "197", "198", "199", "200", "201"],
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
	{"ID" : "196", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.mul_32s_32s_49_5_1_U693", "Parent" : "195"},
	{"ID" : "197", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U694", "Parent" : "195"},
	{"ID" : "198", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U695", "Parent" : "195"},
	{"ID" : "199", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U696", "Parent" : "195"},
	{"ID" : "200", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U697", "Parent" : "195"},
	{"ID" : "201", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "195"},
	{"ID" : "202", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344", "Parent" : "105", "Child" : ["203", "204", "205", "206"],
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
	{"ID" : "203", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fadd_32ns_32ns_32_7_full_dsp_1_U720", "Parent" : "202"},
	{"ID" : "204", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U723", "Parent" : "202"},
	{"ID" : "205", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U724", "Parent" : "202"},
	{"ID" : "206", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.flow_control_loop_pipe_sequential_init_U", "Parent" : "202"},
	{"ID" : "207", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.fmul_32ns_32ns_32_4_max_dsp_1_U730", "Parent" : "105"},
	{"ID" : "208", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U731", "Parent" : "105"},
	{"ID" : "209", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.swiftkv_update_values_and_quantize_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U732", "Parent" : "105"},
	{"ID" : "210", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.current_record_0_val1_c_U", "Parent" : "61"},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.current_record_1_val2_c_U", "Parent" : "61"},
	{"ID" : "212", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.current_record_2_val3_c_U", "Parent" : "61"},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.current_record_3_val4_c_U", "Parent" : "61"},
	{"ID" : "214", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.current_record_4_val5_c_U", "Parent" : "61"},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.cached_kv_word_stream_U", "Parent" : "61"},
	{"ID" : "216", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.position_val_c14_U", "Parent" : "61"},
	{"ID" : "217", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.key_metadata_stream_U", "Parent" : "61"},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value_metadata_stream_U", "Parent" : "61"},
	{"ID" : "219", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.key0_stream_U", "Parent" : "61"},
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.key1_stream_U", "Parent" : "61"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value0_engine0_stream_U", "Parent" : "61"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value0_engine1_stream_U", "Parent" : "61"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value0_engine2_stream_U", "Parent" : "61"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value0_engine3_stream_U", "Parent" : "61"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value1_engine0_stream_U", "Parent" : "61"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value1_engine1_stream_U", "Parent" : "61"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value1_engine2_stream_U", "Parent" : "61"},
	{"ID" : "228", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.value1_engine3_stream_U", "Parent" : "61"},
	{"ID" : "229", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.score_stream_U", "Parent" : "61"},
	{"ID" : "230", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.position_val_c13_U", "Parent" : "61"},
	{"ID" : "231", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.control_stream_U", "Parent" : "61"},
	{"ID" : "232", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.inverse_normalization_stream_U", "Parent" : "61"},
	{"ID" : "233", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_attention_head_fu_355.position_val_c_U", "Parent" : "61"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_run_bank {
		q {Type I LastRead 0 FirstWrite -1}
		k {Type I LastRead 0 FirstWrite -1}
		v {Type I LastRead 0 FirstWrite -1}
		gmem3 {Type IO LastRead 11 FirstWrite -1}
		kv_cache {Type I LastRead 0 FirstWrite -1}
		cos_pe3 {Type I LastRead 1 FirstWrite -1}
		sin_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 23}
		scale_pe3 {Type O LastRead -1 FirstWrite 23}
		layer_index_val {Type I LastRead 0 FirstWrite -1}
		position_val {Type I LastRead 0 FirstWrite -1}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	swiftkv_run_bank_Pipeline_pe_cache_rope_pair_loop {
		cos_pe3 {Type I LastRead 1 FirstWrite -1}
		local_cosine {Type O LastRead -1 FirstWrite 1}
		sin_pe3 {Type I LastRead 1 FirstWrite -1}
		local_sine {Type O LastRead -1 FirstWrite 1}}
	swiftkv_run_bank_Pipeline_pe_load_q_word_loop {
		tmp_13 {Type I LastRead 0 FirstWrite -1}
		q {Type I LastRead 0 FirstWrite -1}
		q_words {Type O LastRead -1 FirstWrite 1}}
	swiftkv_run_bank_Pipeline_pe_load_k_word_loop {
		tmp_13 {Type I LastRead 0 FirstWrite -1}
		k {Type I LastRead 0 FirstWrite -1}
		k_words {Type O LastRead -1 FirstWrite 1}}
	swiftkv_run_bank_Pipeline_pe_load_v_word_loop {
		tmp_13 {Type I LastRead 0 FirstWrite -1}
		v {Type I LastRead 0 FirstWrite -1}
		v_words {Type O LastRead -1 FirstWrite 1}}
	swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop {
		rotated_k_words {Type O LastRead -1 FirstWrite 8}
		query {Type O LastRead -1 FirstWrite 7}
		query_2 {Type O LastRead -1 FirstWrite 7}
		query_4 {Type O LastRead -1 FirstWrite 7}
		query_6 {Type O LastRead -1 FirstWrite 7}
		query_8 {Type O LastRead -1 FirstWrite 7}
		query_10 {Type O LastRead -1 FirstWrite 7}
		query_12 {Type O LastRead -1 FirstWrite 7}
		query_14 {Type O LastRead -1 FirstWrite 7}
		query_1 {Type O LastRead -1 FirstWrite 7}
		query_3 {Type O LastRead -1 FirstWrite 7}
		query_5 {Type O LastRead -1 FirstWrite 7}
		query_7 {Type O LastRead -1 FirstWrite 7}
		query_9 {Type O LastRead -1 FirstWrite 7}
		query_11 {Type O LastRead -1 FirstWrite 7}
		query_13 {Type O LastRead -1 FirstWrite 7}
		query_15 {Type O LastRead -1 FirstWrite 7}
		local_cosine {Type I LastRead 0 FirstWrite -1}
		local_sine {Type I LastRead 0 FirstWrite -1}
		q_words {Type I LastRead 0 FirstWrite -1}
		k_words {Type I LastRead 0 FirstWrite -1}}
	swiftkv_quantize_kv_record {
		k_words {Type I LastRead 2 FirstWrite -1}
		v_words {Type I LastRead 2 FirstWrite -1}}
	swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop {
		empty_612 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty_613 {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		empty_614 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		maximum_v_out {Type O LastRead -1 FirstWrite 1}
		maximum_k_out {Type O LastRead -1 FirstWrite 1}}
	swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop {
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i313 {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i328 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		empty_609 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty_610 {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		empty_611 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		quantized_k_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_out {Type O LastRead -1 FirstWrite 1}}
	swiftkv_run_bank_Pipeline_pe_write_kv_word_loop {
		gmem3 {Type O LastRead -1 FirstWrite 1}
		sext_ln1952 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_1 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_2 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_3 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_4 {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "7949", "Max" : "270029"}
	, {"Name" : "Interval", "Min" : "7949", "Max" : "270029"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	q { ap_memory {  { q_address0 mem_address 1 6 }  { q_ce0 mem_ce 1 1 }  { q_q0 mem_dout 0 512 } } }
	k { ap_memory {  { k_address0 mem_address 1 6 }  { k_ce0 mem_ce 1 1 }  { k_q0 mem_dout 0 512 } } }
	v { ap_memory {  { v_address0 mem_address 1 6 }  { v_ce0 mem_ce 1 1 }  { v_q0 mem_dout 0 512 } } }
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 512 }  { m_axi_gmem3_WSTRB STRB 1 64 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 512 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 12 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	kv_cache { ap_none {  { kv_cache in_data 0 64 } } }
	cos_pe3 { ap_fifo {  { cos_pe3_dout fifo_data_in 0 19 }  { cos_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { cos_pe3_fifo_cap fifo_update 0 3 }  { cos_pe3_empty_n fifo_status 0 1 }  { cos_pe3_read fifo_port_we 1 1 } } }
	sin_pe3 { ap_fifo {  { sin_pe3_dout fifo_data_in 0 19 }  { sin_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { sin_pe3_fifo_cap fifo_update 0 3 }  { sin_pe3_empty_n fifo_status 0 1 }  { sin_pe3_read fifo_port_we 1 1 } } }
	quantized_pe3 { ap_fifo {  { quantized_pe3_din fifo_data_in 1 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_full_n fifo_status 0 1 }  { quantized_pe3_write fifo_port_we 1 1 } } }
	scale_pe3 { ap_fifo {  { scale_pe3_din fifo_data_in 1 32 }  { scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe3_fifo_cap fifo_update 0 3 }  { scale_pe3_full_n fifo_status 0 1 }  { scale_pe3_write fifo_port_we 1 1 } } }
	layer_index_val { ap_none {  { layer_index_val in_data 0 6 } } }
	position_val { ap_none {  { position_val in_data 0 12 } } }
}
