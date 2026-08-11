set moduleName int4_preprocess_activation_stream
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
set C_modelName {int4_preprocess_activation_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ preprocess_mode int 2 regular  }
	{ rms_input_pe0 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ rms_input_pe1 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ rms_input_pe2 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ rms_input_pe3 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ gate_pe0 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe1 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe2 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe3 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe0 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe1 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe2 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe3 int 512 regular {array 176 { 1 } 1 1 }  }
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
	{ "Name" : "preprocess_mode", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "rms_input_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "rms_input_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "rms_input_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "rms_input_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
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
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ preprocess_mode sc_in sc_lv 2 signal 0 } 
	{ rms_input_pe0_address0 sc_out sc_lv 6 signal 1 } 
	{ rms_input_pe0_ce0 sc_out sc_logic 1 signal 1 } 
	{ rms_input_pe0_q0 sc_in sc_lv 512 signal 1 } 
	{ rms_input_pe1_address0 sc_out sc_lv 6 signal 2 } 
	{ rms_input_pe1_ce0 sc_out sc_logic 1 signal 2 } 
	{ rms_input_pe1_q0 sc_in sc_lv 512 signal 2 } 
	{ rms_input_pe2_address0 sc_out sc_lv 6 signal 3 } 
	{ rms_input_pe2_ce0 sc_out sc_logic 1 signal 3 } 
	{ rms_input_pe2_q0 sc_in sc_lv 512 signal 3 } 
	{ rms_input_pe3_address0 sc_out sc_lv 6 signal 4 } 
	{ rms_input_pe3_ce0 sc_out sc_logic 1 signal 4 } 
	{ rms_input_pe3_q0 sc_in sc_lv 512 signal 4 } 
	{ gate_pe0_address0 sc_out sc_lv 8 signal 5 } 
	{ gate_pe0_ce0 sc_out sc_logic 1 signal 5 } 
	{ gate_pe0_q0 sc_in sc_lv 512 signal 5 } 
	{ gate_pe1_address0 sc_out sc_lv 8 signal 6 } 
	{ gate_pe1_ce0 sc_out sc_logic 1 signal 6 } 
	{ gate_pe1_q0 sc_in sc_lv 512 signal 6 } 
	{ gate_pe2_address0 sc_out sc_lv 8 signal 7 } 
	{ gate_pe2_ce0 sc_out sc_logic 1 signal 7 } 
	{ gate_pe2_q0 sc_in sc_lv 512 signal 7 } 
	{ gate_pe3_address0 sc_out sc_lv 8 signal 8 } 
	{ gate_pe3_ce0 sc_out sc_logic 1 signal 8 } 
	{ gate_pe3_q0 sc_in sc_lv 512 signal 8 } 
	{ up_pe0_address0 sc_out sc_lv 8 signal 9 } 
	{ up_pe0_ce0 sc_out sc_logic 1 signal 9 } 
	{ up_pe0_q0 sc_in sc_lv 512 signal 9 } 
	{ up_pe1_address0 sc_out sc_lv 8 signal 10 } 
	{ up_pe1_ce0 sc_out sc_logic 1 signal 10 } 
	{ up_pe1_q0 sc_in sc_lv 512 signal 10 } 
	{ up_pe2_address0 sc_out sc_lv 8 signal 11 } 
	{ up_pe2_ce0 sc_out sc_logic 1 signal 11 } 
	{ up_pe2_q0 sc_in sc_lv 512 signal 11 } 
	{ up_pe3_address0 sc_out sc_lv 8 signal 12 } 
	{ up_pe3_ce0 sc_out sc_logic 1 signal 12 } 
	{ up_pe3_q0 sc_in sc_lv 512 signal 12 } 
	{ quantized_stream_din sc_out sc_lv 480 signal 13 } 
	{ quantized_stream_num_data_valid sc_in sc_lv 3 signal 13 } 
	{ quantized_stream_fifo_cap sc_in sc_lv 3 signal 13 } 
	{ quantized_stream_full_n sc_in sc_logic 1 signal 13 } 
	{ quantized_stream_write sc_out sc_logic 1 signal 13 } 
	{ scale_stream_din sc_out sc_lv 32 signal 14 } 
	{ scale_stream_num_data_valid sc_in sc_lv 3 signal 14 } 
	{ scale_stream_fifo_cap sc_in sc_lv 3 signal 14 } 
	{ scale_stream_full_n sc_in sc_logic 1 signal 14 } 
	{ scale_stream_write sc_out sc_logic 1 signal 14 } 
	{ idx sc_in sc_lv 13 signal 15 } 
	{ idx1 sc_in sc_lv 13 signal 16 } 
	{ idx2 sc_in sc_lv 13 signal 17 } 
	{ idx3 sc_in sc_lv 13 signal 18 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 19 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 19 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 19 } 
	{ model_norm_cache1_address0 sc_out sc_lv 13 signal 20 } 
	{ model_norm_cache1_ce0 sc_out sc_logic 1 signal 20 } 
	{ model_norm_cache1_q0 sc_in sc_lv 512 signal 20 } 
	{ model_norm_cache2_address0 sc_out sc_lv 13 signal 21 } 
	{ model_norm_cache2_ce0 sc_out sc_logic 1 signal 21 } 
	{ model_norm_cache2_q0 sc_in sc_lv 512 signal 21 } 
	{ model_norm_cache3_address0 sc_out sc_lv 13 signal 22 } 
	{ model_norm_cache3_ce0 sc_out sc_logic 1 signal 22 } 
	{ model_norm_cache3_q0 sc_in sc_lv 512 signal 22 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "preprocess_mode", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "preprocess_mode", "role": "default" }} , 
 	{ "name": "rms_input_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rms_input_pe0", "role": "address0" }} , 
 	{ "name": "rms_input_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rms_input_pe0", "role": "ce0" }} , 
 	{ "name": "rms_input_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rms_input_pe0", "role": "q0" }} , 
 	{ "name": "rms_input_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rms_input_pe1", "role": "address0" }} , 
 	{ "name": "rms_input_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rms_input_pe1", "role": "ce0" }} , 
 	{ "name": "rms_input_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rms_input_pe1", "role": "q0" }} , 
 	{ "name": "rms_input_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rms_input_pe2", "role": "address0" }} , 
 	{ "name": "rms_input_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rms_input_pe2", "role": "ce0" }} , 
 	{ "name": "rms_input_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rms_input_pe2", "role": "q0" }} , 
 	{ "name": "rms_input_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rms_input_pe3", "role": "address0" }} , 
 	{ "name": "rms_input_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rms_input_pe3", "role": "ce0" }} , 
 	{ "name": "rms_input_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rms_input_pe3", "role": "q0" }} , 
 	{ "name": "gate_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe0", "role": "address0" }} , 
 	{ "name": "gate_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "ce0" }} , 
 	{ "name": "gate_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "q0" }} , 
 	{ "name": "gate_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe1", "role": "address0" }} , 
 	{ "name": "gate_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "ce0" }} , 
 	{ "name": "gate_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "q0" }} , 
 	{ "name": "gate_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe2", "role": "address0" }} , 
 	{ "name": "gate_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "ce0" }} , 
 	{ "name": "gate_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "q0" }} , 
 	{ "name": "gate_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe3", "role": "address0" }} , 
 	{ "name": "gate_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "ce0" }} , 
 	{ "name": "gate_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "q0" }} , 
 	{ "name": "up_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe0", "role": "address0" }} , 
 	{ "name": "up_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "ce0" }} , 
 	{ "name": "up_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "q0" }} , 
 	{ "name": "up_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe1", "role": "address0" }} , 
 	{ "name": "up_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "ce0" }} , 
 	{ "name": "up_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "q0" }} , 
 	{ "name": "up_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe2", "role": "address0" }} , 
 	{ "name": "up_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "ce0" }} , 
 	{ "name": "up_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "q0" }} , 
 	{ "name": "up_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe3", "role": "address0" }} , 
 	{ "name": "up_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "ce0" }} , 
 	{ "name": "up_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "q0" }} , 
 	{ "name": "quantized_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream", "role": "din" }} , 
 	{ "name": "quantized_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "num_data_valid" }} , 
 	{ "name": "quantized_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "fifo_cap" }} , 
 	{ "name": "quantized_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "full_n" }} , 
 	{ "name": "quantized_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "write" }} , 
 	{ "name": "scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream", "role": "din" }} , 
 	{ "name": "scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "full_n" }} , 
 	{ "name": "scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "write" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx1", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx1", "role": "default" }} , 
 	{ "name": "idx2", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx2", "role": "default" }} , 
 	{ "name": "idx3", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx3", "role": "default" }} , 
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
 	{ "name": "model_norm_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "78"],
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
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "rms_input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "input_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_stream_4pe_fu_112", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "78", "SubInstance" : "grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Port" : "model_norm_cache3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112", "Parent" : "0", "Child" : ["2"],
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
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Parent" : "1", "Child" : ["3", "19", "35", "51", "67", "70", "71", "72", "73", "74", "75", "76", "77"],
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
			{"ID" : "3", "Name" : "int4_swiglu_quantize_pe0_U0"},
			{"ID" : "19", "Name" : "int4_swiglu_quantize_pe1_U0"},
			{"ID" : "35", "Name" : "int4_swiglu_quantize_pe2_U0"},
			{"ID" : "51", "Name" : "int4_swiglu_quantize_pe3_U0"}],
		"OutputProcess" : [
			{"ID" : "67", "Name" : "int4_swiglu_gather_streams_U0"}],
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "51", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "gate"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "up"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "up"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "up"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "51", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "up"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "scale_stream"}]}]},
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0", "Parent" : "2", "Child" : ["4", "5", "11", "15", "16", "17", "18"],
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
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "71", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "4", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.swiglu_group_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "3", "Child" : ["6", "7", "8", "9", "10"],
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
	{"ID" : "6", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U949", "Parent" : "5"},
	{"ID" : "7", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U951", "Parent" : "5"},
	{"ID" : "8", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U952", "Parent" : "5"},
	{"ID" : "9", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U953", "Parent" : "5"},
	{"ID" : "10", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "3", "Child" : ["12", "13", "14"],
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
	{"ID" : "12", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U964", "Parent" : "11"},
	{"ID" : "13", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U965", "Parent" : "11"},
	{"ID" : "14", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fmul_32ns_32ns_32_4_max_dsp_1_U969", "Parent" : "3"},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U970", "Parent" : "3"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U971", "Parent" : "3"},
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fadd_32ns_32ns_32_7_full_dsp_1_U972", "Parent" : "3"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0", "Parent" : "2", "Child" : ["20", "21", "27", "31", "32", "33", "34"],
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
					{"ID" : "21", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "21", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "72", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "73", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "20", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.swiglu_group_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "19", "Child" : ["22", "23", "24", "25", "26"],
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
	{"ID" : "22", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U980", "Parent" : "21"},
	{"ID" : "23", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U982", "Parent" : "21"},
	{"ID" : "24", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U983", "Parent" : "21"},
	{"ID" : "25", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U984", "Parent" : "21"},
	{"ID" : "26", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "27", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "19", "Child" : ["28", "29", "30"],
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
	{"ID" : "28", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U993", "Parent" : "27"},
	{"ID" : "29", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U994", "Parent" : "27"},
	{"ID" : "30", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "31", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fmul_32ns_32ns_32_4_max_dsp_1_U998", "Parent" : "19"},
	{"ID" : "32", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U999", "Parent" : "19"},
	{"ID" : "33", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1000", "Parent" : "19"},
	{"ID" : "34", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1001", "Parent" : "19"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0", "Parent" : "2", "Child" : ["36", "37", "43", "47", "48", "49", "50"],
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
					{"ID" : "37", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "36", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.swiglu_group_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "35", "Child" : ["38", "39", "40", "41", "42"],
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
	{"ID" : "38", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1008", "Parent" : "37"},
	{"ID" : "39", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1010", "Parent" : "37"},
	{"ID" : "40", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1011", "Parent" : "37"},
	{"ID" : "41", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1012", "Parent" : "37"},
	{"ID" : "42", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "43", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "35", "Child" : ["44", "45", "46"],
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
	{"ID" : "44", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1021", "Parent" : "43"},
	{"ID" : "45", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1022", "Parent" : "43"},
	{"ID" : "46", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "43"},
	{"ID" : "47", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1026", "Parent" : "35"},
	{"ID" : "48", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1027", "Parent" : "35"},
	{"ID" : "49", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1028", "Parent" : "35"},
	{"ID" : "50", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1029", "Parent" : "35"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0", "Parent" : "2", "Child" : ["52", "53", "59", "63", "64", "65", "66"],
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
					{"ID" : "53", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "53", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["67"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "52", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.swiglu_group_U", "Parent" : "51"},
	{"ID" : "53", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "51", "Child" : ["54", "55", "56", "57", "58"],
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
	{"ID" : "54", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1036", "Parent" : "53"},
	{"ID" : "55", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1038", "Parent" : "53"},
	{"ID" : "56", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1039", "Parent" : "53"},
	{"ID" : "57", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1040", "Parent" : "53"},
	{"ID" : "58", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "59", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "51", "Child" : ["60", "61", "62"],
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
	{"ID" : "60", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1049", "Parent" : "59"},
	{"ID" : "61", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1050", "Parent" : "59"},
	{"ID" : "62", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "59"},
	{"ID" : "63", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1054", "Parent" : "51"},
	{"ID" : "64", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1055", "Parent" : "51"},
	{"ID" : "65", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1056", "Parent" : "51"},
	{"ID" : "66", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1057", "Parent" : "51"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0", "Parent" : "2", "Child" : ["68"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "72", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["35"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["51"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["3"], "DependentChan" : "71", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "73", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["35"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["51"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_local_tile_loop_swiglu_stream_pe_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "68", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Parent" : "67", "Child" : ["69"],
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
	{"ID" : "69", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88.flow_control_loop_pipe_sequential_init_U", "Parent" : "68"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe0_U", "Parent" : "2"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe0_U", "Parent" : "2"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe1_U", "Parent" : "2"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe1_U", "Parent" : "2"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe2_U", "Parent" : "2"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe2_U", "Parent" : "2"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe3_U", "Parent" : "2"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_stream_4pe_fu_112.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe3_U", "Parent" : "2"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136", "Parent" : "0", "Child" : ["79", "128"],
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
					{"ID" : "79", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "79", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "quantized_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "scale_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "128", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}]},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88", "Parent" : "78", "Child" : ["80", "90", "100", "110", "120", "124", "125", "126", "127"],
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
			{"ID" : "80", "Name" : "int4_rms_sumsq_pe_U0"},
			{"ID" : "90", "Name" : "int4_rms_sumsq_pe_10_U0"},
			{"ID" : "100", "Name" : "int4_rms_sumsq_pe_11_U0"},
			{"ID" : "110", "Name" : "int4_rms_sumsq_pe_12_U0"}],
		"OutputProcess" : [
			{"ID" : "120", "Name" : "int4_rms_merge_and_rsqrt_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "80", "SubInstance" : "int4_rms_sumsq_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "90", "SubInstance" : "int4_rms_sumsq_pe_10_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "int4_rms_sumsq_pe_11_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "110", "SubInstance" : "int4_rms_sumsq_pe_12_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "120", "SubInstance" : "int4_rms_merge_and_rsqrt_U0", "Port" : "reciprocal_rms"}]}]},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0", "Parent" : "79", "Child" : ["81", "86", "89"],
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
					{"ID" : "81", "SubInstance" : "grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["120"], "DependentChan" : "124", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "81", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "80", "Child" : ["82", "83", "84", "85"],
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
	{"ID" : "82", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1112", "Parent" : "81"},
	{"ID" : "83", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1113", "Parent" : "81"},
	{"ID" : "84", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1114", "Parent" : "81"},
	{"ID" : "85", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "86", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "80", "Child" : ["87", "88"],
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
	{"ID" : "87", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1133", "Parent" : "86"},
	{"ID" : "88", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "86"},
	{"ID" : "89", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1151", "Parent" : "80"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0", "Parent" : "79", "Child" : ["91", "96", "99"],
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
					{"ID" : "91", "SubInstance" : "grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["120"], "DependentChan" : "125", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "91", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "90", "Child" : ["92", "93", "94", "95"],
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
	{"ID" : "92", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1156", "Parent" : "91"},
	{"ID" : "93", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1157", "Parent" : "91"},
	{"ID" : "94", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1158", "Parent" : "91"},
	{"ID" : "95", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "91"},
	{"ID" : "96", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "90", "Child" : ["97", "98"],
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
	{"ID" : "97", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1177", "Parent" : "96"},
	{"ID" : "98", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "96"},
	{"ID" : "99", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1195", "Parent" : "90"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0", "Parent" : "79", "Child" : ["101", "106", "109"],
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
					{"ID" : "101", "SubInstance" : "grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["120"], "DependentChan" : "126", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "101", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "100", "Child" : ["102", "103", "104", "105"],
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
	{"ID" : "102", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1199", "Parent" : "101"},
	{"ID" : "103", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1200", "Parent" : "101"},
	{"ID" : "104", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1201", "Parent" : "101"},
	{"ID" : "105", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "101"},
	{"ID" : "106", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "100", "Child" : ["107", "108"],
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
	{"ID" : "107", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1220", "Parent" : "106"},
	{"ID" : "108", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "106"},
	{"ID" : "109", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1238", "Parent" : "100"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0", "Parent" : "79", "Child" : ["111", "116", "119"],
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
					{"ID" : "111", "SubInstance" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["120"], "DependentChan" : "127", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "111", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "110", "Child" : ["112", "113", "114", "115"],
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
	{"ID" : "112", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1242", "Parent" : "111"},
	{"ID" : "113", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1243", "Parent" : "111"},
	{"ID" : "114", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1244", "Parent" : "111"},
	{"ID" : "115", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "111"},
	{"ID" : "116", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "110", "Child" : ["117", "118"],
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
	{"ID" : "117", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1263", "Parent" : "116"},
	{"ID" : "118", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "116"},
	{"ID" : "119", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1281", "Parent" : "110"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0", "Parent" : "79", "Child" : ["121", "122", "123"],
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
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["80"], "DependentChan" : "124", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["90"], "DependentChan" : "125", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["100"], "DependentChan" : "126", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["110"], "DependentChan" : "127", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "121", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1284", "Parent" : "120"},
	{"ID" : "122", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1285", "Parent" : "120"},
	{"ID" : "123", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.frsqrt_32ns_32ns_32_17_full_dsp_1_U1286", "Parent" : "120"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_0_U", "Parent" : "79"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_1_U", "Parent" : "79"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_2_U", "Parent" : "79"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_sumsq_four_pes_fu_88.partial_3_U", "Parent" : "79"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Parent" : "78", "Child" : ["129", "144", "159", "174", "189", "191", "192", "193", "194", "195", "196", "197", "198"],
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
			{"ID" : "129", "Name" : "int4_rms_normalize_quantize_pe_U0"},
			{"ID" : "144", "Name" : "int4_rms_normalize_quantize_pe_13_U0"},
			{"ID" : "159", "Name" : "int4_rms_normalize_quantize_pe_14_U0"},
			{"ID" : "174", "Name" : "int4_rms_normalize_quantize_pe_15_U0"}],
		"OutputProcess" : [
			{"ID" : "189", "Name" : "int4_rms_gather_streams_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "129", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "144", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "159", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "174", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "189", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "189", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "scale_stream"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "129", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "144", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "159", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "174", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "model_norm_cache3"}]}]},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0", "Parent" : "128", "Child" : ["130", "131", "136", "141", "142", "143"],
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
					{"ID" : "131", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "191", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "192", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "131", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "model_norm_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "130", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.normalized_U", "Parent" : "129"},
	{"ID" : "131", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Parent" : "129", "Child" : ["132", "133", "134", "135"],
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
	{"ID" : "132", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "131"},
	{"ID" : "133", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1304", "Parent" : "131"},
	{"ID" : "134", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1305", "Parent" : "131"},
	{"ID" : "135", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "131"},
	{"ID" : "136", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "129", "Child" : ["137", "138", "139", "140"],
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
	{"ID" : "137", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1313", "Parent" : "136"},
	{"ID" : "138", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1316", "Parent" : "136"},
	{"ID" : "139", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1317", "Parent" : "136"},
	{"ID" : "140", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "136"},
	{"ID" : "141", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1321", "Parent" : "129"},
	{"ID" : "142", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1322", "Parent" : "129"},
	{"ID" : "143", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1323", "Parent" : "129"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0", "Parent" : "128", "Child" : ["145", "146", "151", "156", "157", "158"],
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
					{"ID" : "146", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "193", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "194", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "146", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "145", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.normalized_U", "Parent" : "144"},
	{"ID" : "146", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "144", "Child" : ["147", "148", "149", "150"],
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
	{"ID" : "147", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1331", "Parent" : "146"},
	{"ID" : "148", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1332", "Parent" : "146"},
	{"ID" : "149", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1333", "Parent" : "146"},
	{"ID" : "150", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "146"},
	{"ID" : "151", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "144", "Child" : ["152", "153", "154", "155"],
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
	{"ID" : "152", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1341", "Parent" : "151"},
	{"ID" : "153", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1344", "Parent" : "151"},
	{"ID" : "154", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1345", "Parent" : "151"},
	{"ID" : "155", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "151"},
	{"ID" : "156", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1349", "Parent" : "144"},
	{"ID" : "157", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1350", "Parent" : "144"},
	{"ID" : "158", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1351", "Parent" : "144"},
	{"ID" : "159", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0", "Parent" : "128", "Child" : ["160", "161", "166", "171", "172", "173"],
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
					{"ID" : "161", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "195", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "196", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "161", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "160", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.normalized_U", "Parent" : "159"},
	{"ID" : "161", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "159", "Child" : ["162", "163", "164", "165"],
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
	{"ID" : "162", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1359", "Parent" : "161"},
	{"ID" : "163", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1360", "Parent" : "161"},
	{"ID" : "164", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1361", "Parent" : "161"},
	{"ID" : "165", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "161"},
	{"ID" : "166", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "159", "Child" : ["167", "168", "169", "170"],
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
	{"ID" : "167", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1369", "Parent" : "166"},
	{"ID" : "168", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1372", "Parent" : "166"},
	{"ID" : "169", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1373", "Parent" : "166"},
	{"ID" : "170", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "166"},
	{"ID" : "171", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1377", "Parent" : "159"},
	{"ID" : "172", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1378", "Parent" : "159"},
	{"ID" : "173", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1379", "Parent" : "159"},
	{"ID" : "174", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0", "Parent" : "128", "Child" : ["175", "176", "181", "186", "187", "188"],
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
					{"ID" : "176", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "197", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["189"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "176", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "175", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.normalized_U", "Parent" : "174"},
	{"ID" : "176", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "174", "Child" : ["177", "178", "179", "180"],
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
	{"ID" : "177", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1387", "Parent" : "176"},
	{"ID" : "178", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1388", "Parent" : "176"},
	{"ID" : "179", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1389", "Parent" : "176"},
	{"ID" : "180", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "176"},
	{"ID" : "181", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "174", "Child" : ["182", "183", "184", "185"],
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
	{"ID" : "182", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "181"},
	{"ID" : "183", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "181"},
	{"ID" : "184", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "181"},
	{"ID" : "185", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "181"},
	{"ID" : "186", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1405", "Parent" : "174"},
	{"ID" : "187", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1406", "Parent" : "174"},
	{"ID" : "188", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1407", "Parent" : "174"},
	{"ID" : "189", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0", "Parent" : "128", "Child" : ["190"],
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["129"], "DependentChan" : "191", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["144"], "DependentChan" : "193", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["159"], "DependentChan" : "195", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["174"], "DependentChan" : "197", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["129"], "DependentChan" : "192", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["144"], "DependentChan" : "194", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["159"], "DependentChan" : "196", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["174"], "DependentChan" : "198", "DependentChanDepth" : "4", "DependentChanType" : "0",
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
	{"ID" : "190", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0.flow_control_loop_pipe_U", "Parent" : "189"},
	{"ID" : "191", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe0_U", "Parent" : "128"},
	{"ID" : "192", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe0_U", "Parent" : "128"},
	{"ID" : "193", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe1_U", "Parent" : "128"},
	{"ID" : "194", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe1_U", "Parent" : "128"},
	{"ID" : "195", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe2_U", "Parent" : "128"},
	{"ID" : "196", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe2_U", "Parent" : "128"},
	{"ID" : "197", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe3_U", "Parent" : "128"},
	{"ID" : "198", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rmsnorm_quantize_stream_4pe_fu_136.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe3_U", "Parent" : "128"}]}


set ArgLastReadFirstWriteLatency {
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
		scale_stream {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "13203"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "13203"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	preprocess_mode { ap_none {  { preprocess_mode in_data 0 2 } } }
	rms_input_pe0 { ap_memory {  { rms_input_pe0_address0 mem_address 1 6 }  { rms_input_pe0_ce0 mem_ce 1 1 }  { rms_input_pe0_q0 mem_dout 0 512 } } }
	rms_input_pe1 { ap_memory {  { rms_input_pe1_address0 mem_address 1 6 }  { rms_input_pe1_ce0 mem_ce 1 1 }  { rms_input_pe1_q0 mem_dout 0 512 } } }
	rms_input_pe2 { ap_memory {  { rms_input_pe2_address0 mem_address 1 6 }  { rms_input_pe2_ce0 mem_ce 1 1 }  { rms_input_pe2_q0 mem_dout 0 512 } } }
	rms_input_pe3 { ap_memory {  { rms_input_pe3_address0 mem_address 1 6 }  { rms_input_pe3_ce0 mem_ce 1 1 }  { rms_input_pe3_q0 mem_dout 0 512 } } }
	gate_pe0 { ap_memory {  { gate_pe0_address0 mem_address 1 8 }  { gate_pe0_ce0 mem_ce 1 1 }  { gate_pe0_q0 mem_dout 0 512 } } }
	gate_pe1 { ap_memory {  { gate_pe1_address0 mem_address 1 8 }  { gate_pe1_ce0 mem_ce 1 1 }  { gate_pe1_q0 mem_dout 0 512 } } }
	gate_pe2 { ap_memory {  { gate_pe2_address0 mem_address 1 8 }  { gate_pe2_ce0 mem_ce 1 1 }  { gate_pe2_q0 mem_dout 0 512 } } }
	gate_pe3 { ap_memory {  { gate_pe3_address0 mem_address 1 8 }  { gate_pe3_ce0 mem_ce 1 1 }  { gate_pe3_q0 mem_dout 0 512 } } }
	up_pe0 { ap_memory {  { up_pe0_address0 mem_address 1 8 }  { up_pe0_ce0 mem_ce 1 1 }  { up_pe0_q0 mem_dout 0 512 } } }
	up_pe1 { ap_memory {  { up_pe1_address0 mem_address 1 8 }  { up_pe1_ce0 mem_ce 1 1 }  { up_pe1_q0 mem_dout 0 512 } } }
	up_pe2 { ap_memory {  { up_pe2_address0 mem_address 1 8 }  { up_pe2_ce0 mem_ce 1 1 }  { up_pe2_q0 mem_dout 0 512 } } }
	up_pe3 { ap_memory {  { up_pe3_address0 mem_address 1 8 }  { up_pe3_ce0 mem_ce 1 1 }  { up_pe3_q0 mem_dout 0 512 } } }
	quantized_stream { ap_fifo {  { quantized_stream_din fifo_data_in 1 480 }  { quantized_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_fifo_cap fifo_update 0 3 }  { quantized_stream_full_n fifo_status 0 1 }  { quantized_stream_write fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_din fifo_data_in 1 32 }  { scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_fifo_cap fifo_update 0 3 }  { scale_stream_full_n fifo_status 0 1 }  { scale_stream_write fifo_port_we 1 1 } } }
	idx { ap_none {  { idx in_data 0 13 } } }
	idx1 { ap_none {  { idx1 in_data 0 13 } } }
	idx2 { ap_none {  { idx2 in_data 0 13 } } }
	idx3 { ap_none {  { idx3 in_data 0 13 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_q0 mem_dout 0 512 } } }
	model_norm_cache1 { ap_memory {  { model_norm_cache1_address0 mem_address 1 13 }  { model_norm_cache1_ce0 mem_ce 1 1 }  { model_norm_cache1_q0 mem_dout 0 512 } } }
	model_norm_cache2 { ap_memory {  { model_norm_cache2_address0 mem_address 1 13 }  { model_norm_cache2_ce0 mem_ce 1 1 }  { model_norm_cache2_q0 mem_dout 0 512 } } }
	model_norm_cache3 { ap_memory {  { model_norm_cache3_address0 mem_address 1 13 }  { model_norm_cache3_ce0 mem_ce 1 1 }  { model_norm_cache3_q0 mem_dout 0 512 } } }
}
