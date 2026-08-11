set moduleName int4_rms_normalize_quantize_four_pes_stream
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
set C_modelName {int4_rms_normalize_quantize_four_pes_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_pe0 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe1 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe2 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe3 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ reciprocal_rms float 32 regular  }
	{ quantized_stream int 480 regular {fifo 1 volatile }  }
	{ scale_stream int 32 regular {fifo 1 volatile }  }
	{ idx int 13 regular  }
	{ idx1 int 13 regular  }
	{ idx2 int 13 regular  }
	{ idx3 int 13 regular  }
	{ model_norm_cache0 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache1 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache2 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache3 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "reciprocal_rms", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx1", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx2", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx3", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "model_norm_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 83
set portList { 
	{ input_pe0_address0 sc_out sc_lv 6 signal 0 } 
	{ input_pe0_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_pe0_d0 sc_out sc_lv 512 signal 0 } 
	{ input_pe0_q0 sc_in sc_lv 512 signal 0 } 
	{ input_pe0_we0 sc_out sc_logic 1 signal 0 } 
	{ input_pe0_address1 sc_out sc_lv 6 signal 0 } 
	{ input_pe0_ce1 sc_out sc_logic 1 signal 0 } 
	{ input_pe0_d1 sc_out sc_lv 512 signal 0 } 
	{ input_pe0_q1 sc_in sc_lv 512 signal 0 } 
	{ input_pe0_we1 sc_out sc_logic 1 signal 0 } 
	{ input_pe1_address0 sc_out sc_lv 6 signal 1 } 
	{ input_pe1_ce0 sc_out sc_logic 1 signal 1 } 
	{ input_pe1_d0 sc_out sc_lv 512 signal 1 } 
	{ input_pe1_q0 sc_in sc_lv 512 signal 1 } 
	{ input_pe1_we0 sc_out sc_logic 1 signal 1 } 
	{ input_pe1_address1 sc_out sc_lv 6 signal 1 } 
	{ input_pe1_ce1 sc_out sc_logic 1 signal 1 } 
	{ input_pe1_d1 sc_out sc_lv 512 signal 1 } 
	{ input_pe1_q1 sc_in sc_lv 512 signal 1 } 
	{ input_pe1_we1 sc_out sc_logic 1 signal 1 } 
	{ input_pe2_address0 sc_out sc_lv 6 signal 2 } 
	{ input_pe2_ce0 sc_out sc_logic 1 signal 2 } 
	{ input_pe2_d0 sc_out sc_lv 512 signal 2 } 
	{ input_pe2_q0 sc_in sc_lv 512 signal 2 } 
	{ input_pe2_we0 sc_out sc_logic 1 signal 2 } 
	{ input_pe2_address1 sc_out sc_lv 6 signal 2 } 
	{ input_pe2_ce1 sc_out sc_logic 1 signal 2 } 
	{ input_pe2_d1 sc_out sc_lv 512 signal 2 } 
	{ input_pe2_q1 sc_in sc_lv 512 signal 2 } 
	{ input_pe2_we1 sc_out sc_logic 1 signal 2 } 
	{ input_pe3_address0 sc_out sc_lv 6 signal 3 } 
	{ input_pe3_ce0 sc_out sc_logic 1 signal 3 } 
	{ input_pe3_d0 sc_out sc_lv 512 signal 3 } 
	{ input_pe3_q0 sc_in sc_lv 512 signal 3 } 
	{ input_pe3_we0 sc_out sc_logic 1 signal 3 } 
	{ input_pe3_address1 sc_out sc_lv 6 signal 3 } 
	{ input_pe3_ce1 sc_out sc_logic 1 signal 3 } 
	{ input_pe3_d1 sc_out sc_lv 512 signal 3 } 
	{ input_pe3_q1 sc_in sc_lv 512 signal 3 } 
	{ input_pe3_we1 sc_out sc_logic 1 signal 3 } 
	{ reciprocal_rms sc_in sc_lv 32 signal 4 } 
	{ quantized_stream_din sc_out sc_lv 480 signal 5 } 
	{ quantized_stream_full_n sc_in sc_logic 1 signal 5 } 
	{ quantized_stream_write sc_out sc_logic 1 signal 5 } 
	{ scale_stream_din sc_out sc_lv 32 signal 6 } 
	{ scale_stream_full_n sc_in sc_logic 1 signal 6 } 
	{ scale_stream_write sc_out sc_logic 1 signal 6 } 
	{ idx sc_in sc_lv 13 signal 7 } 
	{ idx1 sc_in sc_lv 13 signal 8 } 
	{ idx2 sc_in sc_lv 13 signal 9 } 
	{ idx3 sc_in sc_lv 13 signal 10 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 11 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 11 } 
	{ model_norm_cache0_d0 sc_out sc_lv 512 signal 11 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 11 } 
	{ model_norm_cache0_we0 sc_out sc_logic 1 signal 11 } 
	{ model_norm_cache1_address0 sc_out sc_lv 13 signal 12 } 
	{ model_norm_cache1_ce0 sc_out sc_logic 1 signal 12 } 
	{ model_norm_cache1_d0 sc_out sc_lv 512 signal 12 } 
	{ model_norm_cache1_q0 sc_in sc_lv 512 signal 12 } 
	{ model_norm_cache1_we0 sc_out sc_logic 1 signal 12 } 
	{ model_norm_cache2_address0 sc_out sc_lv 13 signal 13 } 
	{ model_norm_cache2_ce0 sc_out sc_logic 1 signal 13 } 
	{ model_norm_cache2_d0 sc_out sc_lv 512 signal 13 } 
	{ model_norm_cache2_q0 sc_in sc_lv 512 signal 13 } 
	{ model_norm_cache2_we0 sc_out sc_logic 1 signal 13 } 
	{ model_norm_cache3_address0 sc_out sc_lv 13 signal 14 } 
	{ model_norm_cache3_ce0 sc_out sc_logic 1 signal 14 } 
	{ model_norm_cache3_d0 sc_out sc_lv 512 signal 14 } 
	{ model_norm_cache3_q0 sc_in sc_lv 512 signal 14 } 
	{ model_norm_cache3_we0 sc_out sc_logic 1 signal 14 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ reciprocal_rms_ap_vld sc_in sc_logic 1 invld 4 } 
	{ idx_ap_vld sc_in sc_logic 1 invld 7 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ idx1_ap_vld sc_in sc_logic 1 invld 8 } 
	{ idx2_ap_vld sc_in sc_logic 1 invld 9 } 
	{ idx3_ap_vld sc_in sc_logic 1 invld 10 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "input_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe0", "role": "address0" }} , 
 	{ "name": "input_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe0", "role": "ce0" }} , 
 	{ "name": "input_pe0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe0", "role": "d0" }} , 
 	{ "name": "input_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe0", "role": "q0" }} , 
 	{ "name": "input_pe0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe0", "role": "we0" }} , 
 	{ "name": "input_pe0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe0", "role": "address1" }} , 
 	{ "name": "input_pe0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe0", "role": "ce1" }} , 
 	{ "name": "input_pe0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe0", "role": "d1" }} , 
 	{ "name": "input_pe0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe0", "role": "q1" }} , 
 	{ "name": "input_pe0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe0", "role": "we1" }} , 
 	{ "name": "input_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe1", "role": "address0" }} , 
 	{ "name": "input_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe1", "role": "ce0" }} , 
 	{ "name": "input_pe1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe1", "role": "d0" }} , 
 	{ "name": "input_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe1", "role": "q0" }} , 
 	{ "name": "input_pe1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe1", "role": "we0" }} , 
 	{ "name": "input_pe1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe1", "role": "address1" }} , 
 	{ "name": "input_pe1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe1", "role": "ce1" }} , 
 	{ "name": "input_pe1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe1", "role": "d1" }} , 
 	{ "name": "input_pe1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe1", "role": "q1" }} , 
 	{ "name": "input_pe1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe1", "role": "we1" }} , 
 	{ "name": "input_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe2", "role": "address0" }} , 
 	{ "name": "input_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe2", "role": "ce0" }} , 
 	{ "name": "input_pe2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe2", "role": "d0" }} , 
 	{ "name": "input_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe2", "role": "q0" }} , 
 	{ "name": "input_pe2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe2", "role": "we0" }} , 
 	{ "name": "input_pe2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe2", "role": "address1" }} , 
 	{ "name": "input_pe2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe2", "role": "ce1" }} , 
 	{ "name": "input_pe2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe2", "role": "d1" }} , 
 	{ "name": "input_pe2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe2", "role": "q1" }} , 
 	{ "name": "input_pe2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe2", "role": "we1" }} , 
 	{ "name": "input_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe3", "role": "address0" }} , 
 	{ "name": "input_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe3", "role": "ce0" }} , 
 	{ "name": "input_pe3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe3", "role": "d0" }} , 
 	{ "name": "input_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe3", "role": "q0" }} , 
 	{ "name": "input_pe3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe3", "role": "we0" }} , 
 	{ "name": "input_pe3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe3", "role": "address1" }} , 
 	{ "name": "input_pe3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe3", "role": "ce1" }} , 
 	{ "name": "input_pe3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe3", "role": "d1" }} , 
 	{ "name": "input_pe3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe3", "role": "q1" }} , 
 	{ "name": "input_pe3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe3", "role": "we1" }} , 
 	{ "name": "reciprocal_rms", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "reciprocal_rms", "role": "default" }} , 
 	{ "name": "quantized_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream", "role": "din" }} , 
 	{ "name": "quantized_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "full_n" }} , 
 	{ "name": "quantized_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "write" }} , 
 	{ "name": "scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream", "role": "din" }} , 
 	{ "name": "scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "full_n" }} , 
 	{ "name": "scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "write" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx1", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx1", "role": "default" }} , 
 	{ "name": "idx2", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx2", "role": "default" }} , 
 	{ "name": "idx3", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx3", "role": "default" }} , 
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
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "reciprocal_rms_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "reciprocal_rms", "role": "ap_vld" }} , 
 	{ "name": "idx_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "idx1_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx1", "role": "ap_vld" }} , 
 	{ "name": "idx2_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx2", "role": "ap_vld" }} , 
 	{ "name": "idx3_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "idx3", "role": "ap_vld" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "16", "31", "46", "61", "63", "64", "65", "66", "67", "68", "69", "70"],
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
			{"ID" : "1", "Name" : "int4_rms_normalize_quantize_pe_U0"},
			{"ID" : "16", "Name" : "int4_rms_normalize_quantize_pe_13_U0"},
			{"ID" : "31", "Name" : "int4_rms_normalize_quantize_pe_14_U0"},
			{"ID" : "46", "Name" : "int4_rms_normalize_quantize_pe_15_U0"}],
		"OutputProcess" : [
			{"ID" : "61", "Name" : "int4_rms_gather_streams_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "scale_stream"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "model_norm_cache3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0", "Parent" : "0", "Child" : ["2", "3", "8", "13", "14", "15"],
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
					{"ID" : "3", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "63", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "64", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "model_norm_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.normalized_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Parent" : "1", "Child" : ["4", "5", "6", "7"],
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
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "3"},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1304", "Parent" : "3"},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1305", "Parent" : "3"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "1", "Child" : ["9", "10", "11", "12"],
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
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1313", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1316", "Parent" : "8"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1317", "Parent" : "8"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1321", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1322", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1323", "Parent" : "1"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0", "Parent" : "0", "Child" : ["17", "18", "23", "28", "29", "30"],
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
					{"ID" : "18", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "65", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "66", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.normalized_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "16", "Child" : ["19", "20", "21", "22"],
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
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1331", "Parent" : "18"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1332", "Parent" : "18"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1333", "Parent" : "18"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "16", "Child" : ["24", "25", "26", "27"],
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
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1341", "Parent" : "23"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1344", "Parent" : "23"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1345", "Parent" : "23"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1349", "Parent" : "16"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1350", "Parent" : "16"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_13_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1351", "Parent" : "16"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0", "Parent" : "0", "Child" : ["32", "33", "38", "43", "44", "45"],
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
					{"ID" : "33", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "67", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "68", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.normalized_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "31", "Child" : ["34", "35", "36", "37"],
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
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1359", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1360", "Parent" : "33"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1361", "Parent" : "33"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "31", "Child" : ["39", "40", "41", "42"],
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
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1369", "Parent" : "38"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1372", "Parent" : "38"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1373", "Parent" : "38"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1377", "Parent" : "31"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1378", "Parent" : "31"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_14_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1379", "Parent" : "31"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0", "Parent" : "0", "Child" : ["47", "48", "53", "58", "59", "60"],
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
					{"ID" : "48", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "69", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["61"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.normalized_U", "Parent" : "46"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "46", "Child" : ["49", "50", "51", "52"],
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
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1387", "Parent" : "48"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1388", "Parent" : "48"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1389", "Parent" : "48"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "46", "Child" : ["54", "55", "56", "57"],
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
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "53"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "53"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "53"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1405", "Parent" : "46"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1406", "Parent" : "46"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_normalize_quantize_pe_15_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1407", "Parent" : "46"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.int4_rms_gather_streams_U0", "Parent" : "0", "Child" : ["62"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "63", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "65", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["31"], "DependentChan" : "67", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["46"], "DependentChan" : "69", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "64", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "66", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["31"], "DependentChan" : "68", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["46"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
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
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.int4_rms_gather_streams_U0.flow_control_loop_pipe_U", "Parent" : "61"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quantized_pe0_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.scale_pe0_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quantized_pe1_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.scale_pe1_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quantized_pe2_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.scale_pe2_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.quantized_pe3_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.scale_pe3_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		scale_stream {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3713", "Max" : "3713"}
	, {"Name" : "Interval", "Min" : "3714", "Max" : "3714"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_pe0 { ap_memory {  { input_pe0_address0 mem_address 1 6 }  { input_pe0_ce0 mem_ce 1 1 }  { input_pe0_d0 mem_din 1 512 }  { input_pe0_q0 mem_dout 0 512 }  { input_pe0_we0 mem_we 1 1 }  { input_pe0_address1 mem_address 1 6 }  { input_pe0_ce1 mem_ce 1 1 }  { input_pe0_d1 mem_din 1 512 }  { input_pe0_q1 mem_dout 0 512 }  { input_pe0_we1 mem_we 1 1 } } }
	input_pe1 { ap_memory {  { input_pe1_address0 mem_address 1 6 }  { input_pe1_ce0 mem_ce 1 1 }  { input_pe1_d0 mem_din 1 512 }  { input_pe1_q0 mem_dout 0 512 }  { input_pe1_we0 mem_we 1 1 }  { input_pe1_address1 mem_address 1 6 }  { input_pe1_ce1 mem_ce 1 1 }  { input_pe1_d1 mem_din 1 512 }  { input_pe1_q1 mem_dout 0 512 }  { input_pe1_we1 mem_we 1 1 } } }
	input_pe2 { ap_memory {  { input_pe2_address0 mem_address 1 6 }  { input_pe2_ce0 mem_ce 1 1 }  { input_pe2_d0 mem_din 1 512 }  { input_pe2_q0 mem_dout 0 512 }  { input_pe2_we0 mem_we 1 1 }  { input_pe2_address1 mem_address 1 6 }  { input_pe2_ce1 mem_ce 1 1 }  { input_pe2_d1 mem_din 1 512 }  { input_pe2_q1 mem_dout 0 512 }  { input_pe2_we1 mem_we 1 1 } } }
	input_pe3 { ap_memory {  { input_pe3_address0 mem_address 1 6 }  { input_pe3_ce0 mem_ce 1 1 }  { input_pe3_d0 mem_din 1 512 }  { input_pe3_q0 mem_dout 0 512 }  { input_pe3_we0 mem_we 1 1 }  { input_pe3_address1 mem_address 1 6 }  { input_pe3_ce1 mem_ce 1 1 }  { input_pe3_d1 mem_din 1 512 }  { input_pe3_q1 mem_dout 0 512 }  { input_pe3_we1 mem_we 1 1 } } }
	reciprocal_rms { ap_none {  { reciprocal_rms in_data 0 32 }  { reciprocal_rms_ap_vld in_vld 0 1 } } }
	quantized_stream { ap_fifo {  { quantized_stream_din fifo_data_in 1 480 }  { quantized_stream_full_n fifo_status 0 1 }  { quantized_stream_write fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_din fifo_data_in 1 32 }  { scale_stream_full_n fifo_status 0 1 }  { scale_stream_write fifo_port_we 1 1 } } }
	idx { ap_none {  { idx in_data 0 13 }  { idx_ap_vld in_vld 0 1 } } }
	idx1 { ap_none {  { idx1 in_data 0 13 }  { idx1_ap_vld in_vld 0 1 } } }
	idx2 { ap_none {  { idx2 in_data 0 13 }  { idx2_ap_vld in_vld 0 1 } } }
	idx3 { ap_none {  { idx3 in_data 0 13 }  { idx3_ap_vld in_vld 0 1 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_d0 mem_din 1 512 }  { model_norm_cache0_q0 mem_dout 0 512 }  { model_norm_cache0_we0 mem_we 1 1 } } }
	model_norm_cache1 { ap_memory {  { model_norm_cache1_address0 mem_address 1 13 }  { model_norm_cache1_ce0 mem_ce 1 1 }  { model_norm_cache1_d0 mem_din 1 512 }  { model_norm_cache1_q0 mem_dout 0 512 }  { model_norm_cache1_we0 mem_we 1 1 } } }
	model_norm_cache2 { ap_memory {  { model_norm_cache2_address0 mem_address 1 13 }  { model_norm_cache2_ce0 mem_ce 1 1 }  { model_norm_cache2_d0 mem_din 1 512 }  { model_norm_cache2_q0 mem_dout 0 512 }  { model_norm_cache2_we0 mem_we 1 1 } } }
	model_norm_cache3 { ap_memory {  { model_norm_cache3_address0 mem_address 1 13 }  { model_norm_cache3_ce0 mem_ce 1 1 }  { model_norm_cache3_d0 mem_din 1 512 }  { model_norm_cache3_q0 mem_dout 0 512 }  { model_norm_cache3_we0 mem_we 1 1 } } }
}
