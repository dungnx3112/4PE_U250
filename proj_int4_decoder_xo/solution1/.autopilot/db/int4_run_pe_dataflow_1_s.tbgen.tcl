set moduleName int4_run_pe_dataflow_1_s
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
set C_modelName {int4_run_pe_dataflow<1>}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem1 int 512 regular {axi_master 0}  }
	{ weight_mem int 64 regular  }
	{ quantized_pe1 int 480 regular {fifo 0 volatile }  }
	{ activation_scale_pe1 int 32 regular {fifo 0 volatile }  }
	{ linear_command_pe1 int 14 regular {fifo 0 volatile }  }
	{ output_mem int 512 regular {array 504 { 1 0 } 1 1 }  }
	{ idx int 25 regular  }
	{ idx1 int 11 regular  }
	{ model_scale_cache1 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gmem1", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank1","offset": { "type": "dynamic","port_name": "model_bank1","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe1","offset": { "type": "dynamic","port_name": "residual_pe1","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe1","offset": { "type": "dynamic","port_name": "logits_pe1","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe1","offset": { "type": "dynamic","port_name": "kv_cache_pe1","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "weight_mem", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe1", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "activation_scale_pe1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "linear_command_pe1", "interface" : "fifo", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "output_mem", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 25, "direction" : "READONLY"} , 
 	{ "Name" : "idx1", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "model_scale_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 83
set portList { 
	{ m_axi_gmem1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_gmem1_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_gmem1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RFIFONUM sc_in sc_lv 12 signal 0 } 
	{ m_axi_gmem1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem1_BUSER sc_in sc_lv 1 signal 0 } 
	{ weight_mem sc_in sc_lv 64 signal 1 } 
	{ quantized_pe1_dout sc_in sc_lv 480 signal 2 } 
	{ quantized_pe1_empty_n sc_in sc_logic 1 signal 2 } 
	{ quantized_pe1_read sc_out sc_logic 1 signal 2 } 
	{ activation_scale_pe1_dout sc_in sc_lv 32 signal 3 } 
	{ activation_scale_pe1_empty_n sc_in sc_logic 1 signal 3 } 
	{ activation_scale_pe1_read sc_out sc_logic 1 signal 3 } 
	{ linear_command_pe1_dout sc_in sc_lv 14 signal 4 } 
	{ linear_command_pe1_empty_n sc_in sc_logic 1 signal 4 } 
	{ linear_command_pe1_read sc_out sc_logic 1 signal 4 } 
	{ output_mem_address0 sc_out sc_lv 9 signal 5 } 
	{ output_mem_ce0 sc_out sc_logic 1 signal 5 } 
	{ output_mem_d0 sc_out sc_lv 512 signal 5 } 
	{ output_mem_q0 sc_in sc_lv 512 signal 5 } 
	{ output_mem_we0 sc_out sc_logic 1 signal 5 } 
	{ output_mem_address1 sc_out sc_lv 9 signal 5 } 
	{ output_mem_ce1 sc_out sc_logic 1 signal 5 } 
	{ output_mem_d1 sc_out sc_lv 512 signal 5 } 
	{ output_mem_q1 sc_in sc_lv 512 signal 5 } 
	{ output_mem_we1 sc_out sc_logic 1 signal 5 } 
	{ idx sc_in sc_lv 25 signal 6 } 
	{ idx1 sc_in sc_lv 11 signal 7 } 
	{ model_scale_cache1_address0 sc_out sc_lv 11 signal 8 } 
	{ model_scale_cache1_ce0 sc_out sc_logic 1 signal 8 } 
	{ model_scale_cache1_d0 sc_out sc_lv 512 signal 8 } 
	{ model_scale_cache1_q0 sc_in sc_lv 512 signal 8 } 
	{ model_scale_cache1_we0 sc_out sc_logic 1 signal 8 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ idx1_ap_vld sc_in sc_logic 1 invld 7 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ weight_mem_ap_vld sc_in sc_logic 1 invld 1 } 
	{ idx_ap_vld sc_in sc_logic 1 invld 6 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
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
 	{ "name": "weight_mem", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_mem", "role": "default" }} , 
 	{ "name": "quantized_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "dout" }} , 
 	{ "name": "quantized_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "empty_n" }} , 
 	{ "name": "quantized_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "read" }} , 
 	{ "name": "activation_scale_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "dout" }} , 
 	{ "name": "activation_scale_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "empty_n" }} , 
 	{ "name": "activation_scale_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "read" }} , 
 	{ "name": "linear_command_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "dout" }} , 
 	{ "name": "linear_command_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "empty_n" }} , 
 	{ "name": "linear_command_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "read" }} , 
 	{ "name": "output_mem_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_mem", "role": "address0" }} , 
 	{ "name": "output_mem_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_mem", "role": "ce0" }} , 
 	{ "name": "output_mem_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_mem", "role": "d0" }} , 
 	{ "name": "output_mem_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_mem", "role": "q0" }} , 
 	{ "name": "output_mem_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_mem", "role": "we0" }} , 
 	{ "name": "output_mem_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "output_mem", "role": "address1" }} , 
 	{ "name": "output_mem_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_mem", "role": "ce1" }} , 
 	{ "name": "output_mem_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_mem", "role": "d1" }} , 
 	{ "name": "output_mem_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_mem", "role": "q1" }} , 
 	{ "name": "output_mem_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_mem", "role": "we1" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":25, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx1", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "idx1", "role": "default" }} , 
 	{ "name": "model_scale_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "address0" }} , 
 	{ "name": "model_scale_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "ce0" }} , 
 	{ "name": "model_scale_cache1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "d0" }} , 
 	{ "name": "model_scale_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "q0" }} , 
 	{ "name": "model_scale_cache1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "we0" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "idx1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx1", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "weight_mem_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "weight_mem", "role": "ap_vld" }} , 
 	{ "name": "idx_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "6", "14", "146", "167", "170", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195"],
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
			{"ID" : "1", "Name" : "entry_proc55_U0"},
			{"ID" : "2", "Name" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0"},
			{"ID" : "4", "Name" : "int4_stream_pe_inputs_16_U0"},
			{"ID" : "146", "Name" : "int4_dequantize_final_blocks_17_U0"},
			{"ID" : "170", "Name" : "int4_write_outputs_8_U0"}],
		"OutputProcess" : [
			{"ID" : "170", "Name" : "int4_write_outputs_8_U0"}],
		"Port" : [
			{"Name" : "gmem1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "int4_stream_pe_inputs_16_U0", "Port" : "gmem1"}]},
			{"Name" : "weight_mem", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "quantized_pe1"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "int4_cache_and_replay_activation_1_U0", "Port" : "activation_scale_pe1"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Port" : "linear_command_pe1"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "170", "SubInstance" : "int4_write_outputs_8_U0", "Port" : "output_mem"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "int4_dequantize_final_blocks_17_U0", "Port" : "model_scale_cache1"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.entry_proc55_U0", "Parent" : "0",
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
			{"Name" : "idx1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["146"], "DependentChan" : "178", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_run_pe_dataflow_1_Block_entry2_proc21_U0", "Parent" : "0", "Child" : ["3"],
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
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_run_pe_dataflow_1_Block_entry2_proc21_U0.mul_6ns_6ns_12_1_1_U1843", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_stream_pe_inputs_16_U0", "Parent" : "0", "Child" : ["5"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["14"], "DependentChan" : "184", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "weight_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "179", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "stream_weight_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter73", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter73", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_stream_pe_inputs_16_U0.flow_control_loop_pipe_U", "Parent" : "4"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0", "Parent" : "0", "Child" : ["7", "8", "9", "11", "13"],
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
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["14"], "DependentChan" : "185", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["146"], "DependentChan" : "186", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "183", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "182", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["14"], "DependentChan" : "187", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["14"], "DependentChan" : "188", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.activation_cache_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.scale_cache_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "6", "Child" : ["10"],
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
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_1_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111", "Parent" : "6", "Child" : ["12"],
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
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_2_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_cache_and_replay_activation_1_U0.mul_6ns_9ns_15_1_1_U1861", "Parent" : "6"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0", "Parent" : "0", "Child" : ["15", "145"],
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "184", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "185", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["146"], "DependentChan" : "189", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "188", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "187", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["146"], "DependentChan" : "190", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["146"], "DependentChan" : "191", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "14", "Child" : ["16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144"],
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
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1870", "Parent" : "15"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1871", "Parent" : "15"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1872", "Parent" : "15"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1873", "Parent" : "15"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1874", "Parent" : "15"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1875", "Parent" : "15"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1876", "Parent" : "15"},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1877", "Parent" : "15"},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1878", "Parent" : "15"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1879", "Parent" : "15"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1880", "Parent" : "15"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1881", "Parent" : "15"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1882", "Parent" : "15"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1883", "Parent" : "15"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1884", "Parent" : "15"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1885", "Parent" : "15"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1886", "Parent" : "15"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1887", "Parent" : "15"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1888", "Parent" : "15"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1889", "Parent" : "15"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1890", "Parent" : "15"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1891", "Parent" : "15"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1892", "Parent" : "15"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1893", "Parent" : "15"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1894", "Parent" : "15"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1895", "Parent" : "15"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1896", "Parent" : "15"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1897", "Parent" : "15"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1898", "Parent" : "15"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1899", "Parent" : "15"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1900", "Parent" : "15"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1901", "Parent" : "15"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1902", "Parent" : "15"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1903", "Parent" : "15"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1904", "Parent" : "15"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1905", "Parent" : "15"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1906", "Parent" : "15"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1907", "Parent" : "15"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1908", "Parent" : "15"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1909", "Parent" : "15"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1910", "Parent" : "15"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1911", "Parent" : "15"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1912", "Parent" : "15"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1913", "Parent" : "15"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1914", "Parent" : "15"},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1915", "Parent" : "15"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1916", "Parent" : "15"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1917", "Parent" : "15"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1918", "Parent" : "15"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1919", "Parent" : "15"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1920", "Parent" : "15"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1921", "Parent" : "15"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1922", "Parent" : "15"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1923", "Parent" : "15"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1924", "Parent" : "15"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1925", "Parent" : "15"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1926", "Parent" : "15"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1927", "Parent" : "15"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1928", "Parent" : "15"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1929", "Parent" : "15"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1930", "Parent" : "15"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1931", "Parent" : "15"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1932", "Parent" : "15"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1933", "Parent" : "15"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1934", "Parent" : "15"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1935", "Parent" : "15"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1936", "Parent" : "15"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1937", "Parent" : "15"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1938", "Parent" : "15"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1939", "Parent" : "15"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1940", "Parent" : "15"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1941", "Parent" : "15"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1942", "Parent" : "15"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1943", "Parent" : "15"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1944", "Parent" : "15"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1945", "Parent" : "15"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1946", "Parent" : "15"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1947", "Parent" : "15"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1948", "Parent" : "15"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1949", "Parent" : "15"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1950", "Parent" : "15"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1951", "Parent" : "15"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1952", "Parent" : "15"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U1953", "Parent" : "15"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1954", "Parent" : "15"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1955", "Parent" : "15"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1956", "Parent" : "15"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U1957", "Parent" : "15"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1958", "Parent" : "15"},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1959", "Parent" : "15"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1960", "Parent" : "15"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1961", "Parent" : "15"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1962", "Parent" : "15"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1963", "Parent" : "15"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1964", "Parent" : "15"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1965", "Parent" : "15"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1966", "Parent" : "15"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1967", "Parent" : "15"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1968", "Parent" : "15"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1969", "Parent" : "15"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1970", "Parent" : "15"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1971", "Parent" : "15"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1972", "Parent" : "15"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1973", "Parent" : "15"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1974", "Parent" : "15"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1975", "Parent" : "15"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1976", "Parent" : "15"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1977", "Parent" : "15"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1978", "Parent" : "15"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1979", "Parent" : "15"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1980", "Parent" : "15"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1981", "Parent" : "15"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1982", "Parent" : "15"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1983", "Parent" : "15"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1984", "Parent" : "15"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U1985", "Parent" : "15"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1986", "Parent" : "15"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1987", "Parent" : "15"},
	{"ID" : "134", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1988", "Parent" : "15"},
	{"ID" : "135", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U1989", "Parent" : "15"},
	{"ID" : "136", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1990", "Parent" : "15"},
	{"ID" : "137", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U1991", "Parent" : "15"},
	{"ID" : "138", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1992", "Parent" : "15"},
	{"ID" : "139", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1993", "Parent" : "15"},
	{"ID" : "140", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1994", "Parent" : "15"},
	{"ID" : "141", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U1995", "Parent" : "15"},
	{"ID" : "142", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1996", "Parent" : "15"},
	{"ID" : "143", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U1997", "Parent" : "15"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.grp_int4_stream_integer_blocks_5_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_stream_integer_blocks_5_U0.mul_6ns_14ns_20_1_1_U2003", "Parent" : "14"},
	{"ID" : "146", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0", "Parent" : "0", "Child" : ["147", "166"],
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
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["14"], "DependentChan" : "189", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "147", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["6"], "DependentChan" : "186", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "147", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["167"], "DependentChan" : "192", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "147", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["14"], "DependentChan" : "191", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["14"], "DependentChan" : "190", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "178", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["167"], "DependentChan" : "193", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "147", "SubInstance" : "grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "146", "Child" : ["148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165"],
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
	{"ID" : "148", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "147"},
	{"ID" : "149", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_7_U", "Parent" : "147"},
	{"ID" : "150", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_8_U", "Parent" : "147"},
	{"ID" : "151", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_9_U", "Parent" : "147"},
	{"ID" : "152", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2011", "Parent" : "147"},
	{"ID" : "153", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2012", "Parent" : "147"},
	{"ID" : "154", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2013", "Parent" : "147"},
	{"ID" : "155", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2014", "Parent" : "147"},
	{"ID" : "156", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2015", "Parent" : "147"},
	{"ID" : "157", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2016", "Parent" : "147"},
	{"ID" : "158", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2017", "Parent" : "147"},
	{"ID" : "159", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2018", "Parent" : "147"},
	{"ID" : "160", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2019", "Parent" : "147"},
	{"ID" : "161", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2020", "Parent" : "147"},
	{"ID" : "162", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2021", "Parent" : "147"},
	{"ID" : "163", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2022", "Parent" : "147"},
	{"ID" : "164", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2023", "Parent" : "147"},
	{"ID" : "165", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.grp_int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "147"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_dequantize_final_blocks_17_U0.mul_6ns_14ns_20_1_1_U2032", "Parent" : "146"},
	{"ID" : "167", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_pack_dequantized_outputs_6_U0", "Parent" : "0", "Child" : ["168"],
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
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["146"], "DependentChan" : "192", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "168", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["170"], "DependentChan" : "194", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "168", "SubInstance" : "grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Port" : "output_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["146"], "DependentChan" : "193", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "180", "DependentChanDepth" : "5", "DependentChanType" : "1"},
			{"Name" : "local_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["170"], "DependentChan" : "195", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72", "Parent" : "167", "Child" : ["169"],
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
	{"ID" : "169", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_pack_dequantized_outputs_6_U0.grp_int4_pack_dequantized_outputs_6_Pipeline_pack_dequantized_value_loop_fu_72.flow_control_loop_pipe_sequential_init_U", "Parent" : "168"},
	{"ID" : "170", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0", "Parent" : "0", "Child" : ["171", "173"],
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
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["167"], "DependentChan" : "194", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}],
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "output_mem", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "171", "SubInstance" : "grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Port" : "output_mem", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["167"], "DependentChan" : "195", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "181", "DependentChanDepth" : "6", "DependentChanType" : "1"}],
		"Loop" : [
			{"Name" : "write_output_fused_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239", "Parent" : "170", "Child" : ["172"],
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
	{"ID" : "172", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_write_output_direct_loop_fu_239.flow_control_loop_pipe_sequential_init_U", "Parent" : "171"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248", "Parent" : "170", "Child" : ["174", "175", "176", "177"],
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
	{"ID" : "174", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.fadd_32ns_32ns_32_7_full_dsp_1_U2053", "Parent" : "173"},
	{"ID" : "175", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2054", "Parent" : "173"},
	{"ID" : "176", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.sparsemux_33_4_32_1_1_U2055", "Parent" : "173"},
	{"ID" : "177", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_write_outputs_8_U0.grp_int4_write_outputs_8_Pipeline_fused_residual_add_loop_fu_248.flow_control_loop_pipe_sequential_init_U", "Parent" : "173"},
	{"ID" : "178", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.idx1_c_U", "Parent" : "0"},
	{"ID" : "179", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_ln867_loc_channel_U", "Parent" : "0"},
	{"ID" : "180", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_fxp_loc_channel_U", "Parent" : "0"},
	{"ID" : "181", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fuse_residual_loc_channel_U", "Parent" : "0"},
	{"ID" : "182", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_tiles_loc_c17_channel_U", "Parent" : "0"},
	{"ID" : "183", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_tiles_loc_c21_channel_U", "Parent" : "0"},
	{"ID" : "184", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weight_stream_U", "Parent" : "0"},
	{"ID" : "185", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.replay_activation_stream_U", "Parent" : "0"},
	{"ID" : "186", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.replay_scale_stream_U", "Parent" : "0"},
	{"ID" : "187", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_tiles_loc_c16_U", "Parent" : "0"},
	{"ID" : "188", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_tiles_loc_c20_U", "Parent" : "0"},
	{"ID" : "189", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.group_stream_U", "Parent" : "0"},
	{"ID" : "190", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_tiles_loc_c_U", "Parent" : "0"},
	{"ID" : "191", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_tiles_loc_c19_U", "Parent" : "0"},
	{"ID" : "192", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.final_block_stream_U", "Parent" : "0"},
	{"ID" : "193", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_tiles_loc_c18_U", "Parent" : "0"},
	{"ID" : "194", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_stream_U", "Parent" : "0"},
	{"ID" : "195", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_tiles_loc_c_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		p_out15 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32878", "Max" : "693614"}
	, {"Name" : "Interval", "Min" : "32843", "Max" : "693532"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem1_AWVALID VALID 1 1 }  { m_axi_gmem1_AWREADY READY 0 1 }  { m_axi_gmem1_AWADDR ADDR 1 64 }  { m_axi_gmem1_AWID ID 1 1 }  { m_axi_gmem1_AWLEN SIZE 1 32 }  { m_axi_gmem1_AWSIZE BURST 1 3 }  { m_axi_gmem1_AWBURST LOCK 1 2 }  { m_axi_gmem1_AWLOCK CACHE 1 2 }  { m_axi_gmem1_AWCACHE PROT 1 4 }  { m_axi_gmem1_AWPROT QOS 1 3 }  { m_axi_gmem1_AWQOS REGION 1 4 }  { m_axi_gmem1_AWREGION USER 1 4 }  { m_axi_gmem1_AWUSER DATA 1 1 }  { m_axi_gmem1_WVALID VALID 1 1 }  { m_axi_gmem1_WREADY READY 0 1 }  { m_axi_gmem1_WDATA FIFONUM 1 512 }  { m_axi_gmem1_WSTRB STRB 1 64 }  { m_axi_gmem1_WLAST LAST 1 1 }  { m_axi_gmem1_WID ID 1 1 }  { m_axi_gmem1_WUSER DATA 1 1 }  { m_axi_gmem1_ARVALID VALID 1 1 }  { m_axi_gmem1_ARREADY READY 0 1 }  { m_axi_gmem1_ARADDR ADDR 1 64 }  { m_axi_gmem1_ARID ID 1 1 }  { m_axi_gmem1_ARLEN SIZE 1 32 }  { m_axi_gmem1_ARSIZE BURST 1 3 }  { m_axi_gmem1_ARBURST LOCK 1 2 }  { m_axi_gmem1_ARLOCK CACHE 1 2 }  { m_axi_gmem1_ARCACHE PROT 1 4 }  { m_axi_gmem1_ARPROT QOS 1 3 }  { m_axi_gmem1_ARQOS REGION 1 4 }  { m_axi_gmem1_ARREGION USER 1 4 }  { m_axi_gmem1_ARUSER DATA 1 1 }  { m_axi_gmem1_RVALID VALID 0 1 }  { m_axi_gmem1_RREADY READY 1 1 }  { m_axi_gmem1_RDATA FIFONUM 0 512 }  { m_axi_gmem1_RLAST LAST 0 1 }  { m_axi_gmem1_RID ID 0 1 }  { m_axi_gmem1_RFIFONUM LEN 0 12 }  { m_axi_gmem1_RUSER DATA 0 1 }  { m_axi_gmem1_RRESP RESP 0 2 }  { m_axi_gmem1_BVALID VALID 0 1 }  { m_axi_gmem1_BREADY READY 1 1 }  { m_axi_gmem1_BRESP RESP 0 2 }  { m_axi_gmem1_BID ID 0 1 }  { m_axi_gmem1_BUSER DATA 0 1 } } }
	weight_mem { ap_none {  { weight_mem in_data 0 64 }  { weight_mem_ap_vld in_vld 0 1 } } }
	quantized_pe1 { ap_fifo {  { quantized_pe1_dout fifo_data_in 0 480 }  { quantized_pe1_empty_n fifo_status 0 1 }  { quantized_pe1_read fifo_port_we 1 1 } } }
	activation_scale_pe1 { ap_fifo {  { activation_scale_pe1_dout fifo_data_in 0 32 }  { activation_scale_pe1_empty_n fifo_status 0 1 }  { activation_scale_pe1_read fifo_port_we 1 1 } } }
	linear_command_pe1 { ap_fifo {  { linear_command_pe1_dout fifo_data_in 0 14 }  { linear_command_pe1_empty_n fifo_status 0 1 }  { linear_command_pe1_read fifo_port_we 1 1 } } }
	output_mem { ap_memory {  { output_mem_address0 mem_address 1 9 }  { output_mem_ce0 mem_ce 1 1 }  { output_mem_d0 mem_din 1 512 }  { output_mem_q0 mem_dout 0 512 }  { output_mem_we0 mem_we 1 1 }  { output_mem_address1 MemPortADDR2 1 9 }  { output_mem_ce1 MemPortCE2 1 1 }  { output_mem_d1 MemPortDIN2 1 512 }  { output_mem_q1 mem_dout 0 512 }  { output_mem_we1 MemPortWE2 1 1 } } }
	idx { ap_none {  { idx in_data 0 25 }  { idx_ap_vld in_vld 0 1 } } }
	idx1 { ap_none {  { idx1 in_data 0 11 }  { idx1_ap_vld in_vld 0 1 } } }
	model_scale_cache1 { ap_memory {  { model_scale_cache1_address0 mem_address 1 11 }  { model_scale_cache1_ce0 mem_ce 1 1 }  { model_scale_cache1_d0 mem_din 1 512 }  { model_scale_cache1_q0 mem_dout 0 512 }  { model_scale_cache1_we0 mem_we 1 1 } } }
}
