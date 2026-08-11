set moduleName int4_broadcast_activation
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
set C_modelName {int4_broadcast_activation}
set C_modelType { void 0 }
set C_modelArgList {
	{ quantized int 480 regular {array 344 { 2 } 1 1 }  }
	{ packed_scales int 512 regular {array 22 { 2 } 1 1 }  }
	{ quantized_stream int 480 regular {fifo 0 volatile }  }
	{ scale_stream int 32 regular {fifo 0 volatile }  }
	{ stream_activation uint 1 regular  }
	{ quantized_pe0 int 480 regular {fifo 1 volatile }  }
	{ quantized_pe1 int 480 regular {fifo 1 volatile }  }
	{ quantized_pe2 int 480 regular {fifo 1 volatile }  }
	{ quantized_pe3 int 480 regular {fifo 1 volatile }  }
	{ activation_scale_pe0 int 32 regular {fifo 1 volatile }  }
	{ activation_scale_pe1 int 32 regular {fifo 1 volatile }  }
	{ activation_scale_pe2 int 32 regular {fifo 1 volatile }  }
	{ activation_scale_pe3 int 32 regular {fifo 1 volatile }  }
	{ local_tiles_0 int 6 regular  }
	{ local_tiles_1 int 6 regular  }
	{ local_tiles_2 int 6 regular  }
	{ local_tiles_3 int 6 regular  }
	{ input_tiles int 6 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "quantized", "interface" : "memory", "bitwidth" : 480, "direction" : "READWRITE"} , 
 	{ "Name" : "packed_scales", "interface" : "memory", "bitwidth" : 512, "direction" : "READWRITE"} , 
 	{ "Name" : "quantized_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "stream_activation", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe0", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_pe1", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_pe2", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale_pe0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale_pe1", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale_pe2", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_0", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_3", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 73
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ quantized_address0 sc_out sc_lv 9 signal 0 } 
	{ quantized_ce0 sc_out sc_logic 1 signal 0 } 
	{ quantized_we0 sc_out sc_logic 1 signal 0 } 
	{ quantized_d0 sc_out sc_lv 480 signal 0 } 
	{ quantized_q0 sc_in sc_lv 480 signal 0 } 
	{ packed_scales_address0 sc_out sc_lv 5 signal 1 } 
	{ packed_scales_ce0 sc_out sc_logic 1 signal 1 } 
	{ packed_scales_we0 sc_out sc_logic 1 signal 1 } 
	{ packed_scales_d0 sc_out sc_lv 512 signal 1 } 
	{ packed_scales_q0 sc_in sc_lv 512 signal 1 } 
	{ quantized_stream_dout sc_in sc_lv 480 signal 2 } 
	{ quantized_stream_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ quantized_stream_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ quantized_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ quantized_stream_read sc_out sc_logic 1 signal 2 } 
	{ scale_stream_dout sc_in sc_lv 32 signal 3 } 
	{ scale_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ scale_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ scale_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ scale_stream_read sc_out sc_logic 1 signal 3 } 
	{ stream_activation sc_in sc_lv 1 signal 4 } 
	{ quantized_pe0_din sc_out sc_lv 480 signal 5 } 
	{ quantized_pe0_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ quantized_pe0_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ quantized_pe0_full_n sc_in sc_logic 1 signal 5 } 
	{ quantized_pe0_write sc_out sc_logic 1 signal 5 } 
	{ quantized_pe1_din sc_out sc_lv 480 signal 6 } 
	{ quantized_pe1_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ quantized_pe1_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ quantized_pe1_full_n sc_in sc_logic 1 signal 6 } 
	{ quantized_pe1_write sc_out sc_logic 1 signal 6 } 
	{ quantized_pe2_din sc_out sc_lv 480 signal 7 } 
	{ quantized_pe2_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ quantized_pe2_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ quantized_pe2_full_n sc_in sc_logic 1 signal 7 } 
	{ quantized_pe2_write sc_out sc_logic 1 signal 7 } 
	{ quantized_pe3_din sc_out sc_lv 480 signal 8 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ quantized_pe3_full_n sc_in sc_logic 1 signal 8 } 
	{ quantized_pe3_write sc_out sc_logic 1 signal 8 } 
	{ activation_scale_pe0_din sc_out sc_lv 32 signal 9 } 
	{ activation_scale_pe0_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ activation_scale_pe0_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ activation_scale_pe0_full_n sc_in sc_logic 1 signal 9 } 
	{ activation_scale_pe0_write sc_out sc_logic 1 signal 9 } 
	{ activation_scale_pe1_din sc_out sc_lv 32 signal 10 } 
	{ activation_scale_pe1_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ activation_scale_pe1_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ activation_scale_pe1_full_n sc_in sc_logic 1 signal 10 } 
	{ activation_scale_pe1_write sc_out sc_logic 1 signal 10 } 
	{ activation_scale_pe2_din sc_out sc_lv 32 signal 11 } 
	{ activation_scale_pe2_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ activation_scale_pe2_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ activation_scale_pe2_full_n sc_in sc_logic 1 signal 11 } 
	{ activation_scale_pe2_write sc_out sc_logic 1 signal 11 } 
	{ activation_scale_pe3_din sc_out sc_lv 32 signal 12 } 
	{ activation_scale_pe3_num_data_valid sc_in sc_lv 3 signal 12 } 
	{ activation_scale_pe3_fifo_cap sc_in sc_lv 3 signal 12 } 
	{ activation_scale_pe3_full_n sc_in sc_logic 1 signal 12 } 
	{ activation_scale_pe3_write sc_out sc_logic 1 signal 12 } 
	{ local_tiles_0 sc_in sc_lv 6 signal 13 } 
	{ local_tiles_1 sc_in sc_lv 6 signal 14 } 
	{ local_tiles_2 sc_in sc_lv 6 signal 15 } 
	{ local_tiles_3 sc_in sc_lv 6 signal 16 } 
	{ input_tiles sc_in sc_lv 6 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "quantized_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "quantized", "role": "address0" }} , 
 	{ "name": "quantized_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized", "role": "ce0" }} , 
 	{ "name": "quantized_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized", "role": "we0" }} , 
 	{ "name": "quantized_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized", "role": "d0" }} , 
 	{ "name": "quantized_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized", "role": "q0" }} , 
 	{ "name": "packed_scales_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "packed_scales", "role": "address0" }} , 
 	{ "name": "packed_scales_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packed_scales", "role": "ce0" }} , 
 	{ "name": "packed_scales_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "packed_scales", "role": "we0" }} , 
 	{ "name": "packed_scales_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "packed_scales", "role": "d0" }} , 
 	{ "name": "packed_scales_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "packed_scales", "role": "q0" }} , 
 	{ "name": "quantized_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream", "role": "dout" }} , 
 	{ "name": "quantized_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "num_data_valid" }} , 
 	{ "name": "quantized_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "fifo_cap" }} , 
 	{ "name": "quantized_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "empty_n" }} , 
 	{ "name": "quantized_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "read" }} , 
 	{ "name": "scale_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream", "role": "dout" }} , 
 	{ "name": "scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "scale_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "empty_n" }} , 
 	{ "name": "scale_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "read" }} , 
 	{ "name": "stream_activation", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_activation", "role": "default" }} , 
 	{ "name": "quantized_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "din" }} , 
 	{ "name": "quantized_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "full_n" }} , 
 	{ "name": "quantized_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "write" }} , 
 	{ "name": "quantized_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "din" }} , 
 	{ "name": "quantized_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "full_n" }} , 
 	{ "name": "quantized_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "write" }} , 
 	{ "name": "quantized_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "din" }} , 
 	{ "name": "quantized_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "full_n" }} , 
 	{ "name": "quantized_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "write" }} , 
 	{ "name": "quantized_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "din" }} , 
 	{ "name": "quantized_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "full_n" }} , 
 	{ "name": "quantized_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "write" }} , 
 	{ "name": "activation_scale_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe0", "role": "din" }} , 
 	{ "name": "activation_scale_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe0", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe0", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe0", "role": "full_n" }} , 
 	{ "name": "activation_scale_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe0", "role": "write" }} , 
 	{ "name": "activation_scale_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "din" }} , 
 	{ "name": "activation_scale_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "full_n" }} , 
 	{ "name": "activation_scale_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe1", "role": "write" }} , 
 	{ "name": "activation_scale_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "din" }} , 
 	{ "name": "activation_scale_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "full_n" }} , 
 	{ "name": "activation_scale_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "write" }} , 
 	{ "name": "activation_scale_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "din" }} , 
 	{ "name": "activation_scale_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "full_n" }} , 
 	{ "name": "activation_scale_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "write" }} , 
 	{ "name": "local_tiles_0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_0", "role": "default" }} , 
 	{ "name": "local_tiles_1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_1", "role": "default" }} , 
 	{ "name": "local_tiles_2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_2", "role": "default" }} , 
 	{ "name": "local_tiles_3", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_3", "role": "default" }} , 
 	{ "name": "input_tiles", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_tiles", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "packed_scales", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "packed_scales", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "stream_activation", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141", "Parent" : "0", "Child" : ["2"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_broadcast_activation_Pipeline_broadcast_activation_seed_loop_fu_141.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
		streamed_scale_word_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "135", "Max" : "351"}
	, {"Name" : "Interval", "Min" : "135", "Max" : "351"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	quantized { ap_memory {  { quantized_address0 mem_address 1 9 }  { quantized_ce0 mem_ce 1 1 }  { quantized_we0 mem_we 1 1 }  { quantized_d0 mem_din 1 480 }  { quantized_q0 mem_dout 0 480 } } }
	packed_scales { ap_memory {  { packed_scales_address0 mem_address 1 5 }  { packed_scales_ce0 mem_ce 1 1 }  { packed_scales_we0 mem_we 1 1 }  { packed_scales_d0 mem_din 1 512 }  { packed_scales_q0 mem_dout 0 512 } } }
	quantized_stream { ap_fifo {  { quantized_stream_dout fifo_data_in 0 480 }  { quantized_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_fifo_cap fifo_update 0 3 }  { quantized_stream_empty_n fifo_status 0 1 }  { quantized_stream_read fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_dout fifo_data_in 0 32 }  { scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_fifo_cap fifo_update 0 3 }  { scale_stream_empty_n fifo_status 0 1 }  { scale_stream_read fifo_port_we 1 1 } } }
	stream_activation { ap_none {  { stream_activation in_data 0 1 } } }
	quantized_pe0 { ap_fifo {  { quantized_pe0_din fifo_data_in 1 480 }  { quantized_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe0_fifo_cap fifo_update 0 3 }  { quantized_pe0_full_n fifo_status 0 1 }  { quantized_pe0_write fifo_port_we 1 1 } } }
	quantized_pe1 { ap_fifo {  { quantized_pe1_din fifo_data_in 1 480 }  { quantized_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe1_fifo_cap fifo_update 0 3 }  { quantized_pe1_full_n fifo_status 0 1 }  { quantized_pe1_write fifo_port_we 1 1 } } }
	quantized_pe2 { ap_fifo {  { quantized_pe2_din fifo_data_in 1 480 }  { quantized_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe2_fifo_cap fifo_update 0 3 }  { quantized_pe2_full_n fifo_status 0 1 }  { quantized_pe2_write fifo_port_we 1 1 } } }
	quantized_pe3 { ap_fifo {  { quantized_pe3_din fifo_data_in 1 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_full_n fifo_status 0 1 }  { quantized_pe3_write fifo_port_we 1 1 } } }
	activation_scale_pe0 { ap_fifo {  { activation_scale_pe0_din fifo_data_in 1 32 }  { activation_scale_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe0_fifo_cap fifo_update 0 3 }  { activation_scale_pe0_full_n fifo_status 0 1 }  { activation_scale_pe0_write fifo_port_we 1 1 } } }
	activation_scale_pe1 { ap_fifo {  { activation_scale_pe1_din fifo_data_in 1 32 }  { activation_scale_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe1_fifo_cap fifo_update 0 3 }  { activation_scale_pe1_full_n fifo_status 0 1 }  { activation_scale_pe1_write fifo_port_we 1 1 } } }
	activation_scale_pe2 { ap_fifo {  { activation_scale_pe2_din fifo_data_in 1 32 }  { activation_scale_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe2_fifo_cap fifo_update 0 3 }  { activation_scale_pe2_full_n fifo_status 0 1 }  { activation_scale_pe2_write fifo_port_we 1 1 } } }
	activation_scale_pe3 { ap_fifo {  { activation_scale_pe3_din fifo_data_in 1 32 }  { activation_scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe3_fifo_cap fifo_update 0 3 }  { activation_scale_pe3_full_n fifo_status 0 1 }  { activation_scale_pe3_write fifo_port_we 1 1 } } }
	local_tiles_0 { ap_none {  { local_tiles_0 in_data 0 6 } } }
	local_tiles_1 { ap_none {  { local_tiles_1 in_data 0 6 } } }
	local_tiles_2 { ap_none {  { local_tiles_2 in_data 0 6 } } }
	local_tiles_3 { ap_none {  { local_tiles_3 in_data 0 6 } } }
	input_tiles { ap_none {  { input_tiles in_data 0 6 } } }
}
