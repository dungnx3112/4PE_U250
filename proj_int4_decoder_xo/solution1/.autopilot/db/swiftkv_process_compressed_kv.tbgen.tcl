set moduleName swiftkv_process_compressed_kv
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
set C_modelName {swiftkv_process_compressed_kv}
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
	{ key_metadata_stream int 40 regular {fifo 0 volatile }  }
	{ key0_stream int 512 regular {fifo 0 volatile }  }
	{ key1_stream int 512 regular {fifo 0 volatile }  }
	{ position int 12 regular  }
	{ score_stream int 32 regular {fifo 1 volatile }  }
	{ position_val_c13 int 12 regular {fifo 1}  }
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
 	{ "Name" : "key_metadata_stream", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "key0_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "key1_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "position", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "score_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "position_val_c13", "interface" : "fifo", "bitwidth" : 12, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 81
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ query_0_address0 sc_out sc_lv 3 signal 0 } 
	{ query_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ query_0_q0 sc_in sc_lv 32 signal 0 } 
	{ query_1_address0 sc_out sc_lv 3 signal 1 } 
	{ query_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ query_1_q0 sc_in sc_lv 32 signal 1 } 
	{ query_2_address0 sc_out sc_lv 3 signal 2 } 
	{ query_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ query_2_q0 sc_in sc_lv 32 signal 2 } 
	{ query_3_address0 sc_out sc_lv 3 signal 3 } 
	{ query_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ query_3_q0 sc_in sc_lv 32 signal 3 } 
	{ query_4_address0 sc_out sc_lv 3 signal 4 } 
	{ query_4_ce0 sc_out sc_logic 1 signal 4 } 
	{ query_4_q0 sc_in sc_lv 32 signal 4 } 
	{ query_5_address0 sc_out sc_lv 3 signal 5 } 
	{ query_5_ce0 sc_out sc_logic 1 signal 5 } 
	{ query_5_q0 sc_in sc_lv 32 signal 5 } 
	{ query_6_address0 sc_out sc_lv 3 signal 6 } 
	{ query_6_ce0 sc_out sc_logic 1 signal 6 } 
	{ query_6_q0 sc_in sc_lv 32 signal 6 } 
	{ query_7_address0 sc_out sc_lv 3 signal 7 } 
	{ query_7_ce0 sc_out sc_logic 1 signal 7 } 
	{ query_7_q0 sc_in sc_lv 32 signal 7 } 
	{ query_8_address0 sc_out sc_lv 3 signal 8 } 
	{ query_8_ce0 sc_out sc_logic 1 signal 8 } 
	{ query_8_q0 sc_in sc_lv 32 signal 8 } 
	{ query_9_address0 sc_out sc_lv 3 signal 9 } 
	{ query_9_ce0 sc_out sc_logic 1 signal 9 } 
	{ query_9_q0 sc_in sc_lv 32 signal 9 } 
	{ query_10_address0 sc_out sc_lv 3 signal 10 } 
	{ query_10_ce0 sc_out sc_logic 1 signal 10 } 
	{ query_10_q0 sc_in sc_lv 32 signal 10 } 
	{ query_11_address0 sc_out sc_lv 3 signal 11 } 
	{ query_11_ce0 sc_out sc_logic 1 signal 11 } 
	{ query_11_q0 sc_in sc_lv 32 signal 11 } 
	{ query_12_address0 sc_out sc_lv 3 signal 12 } 
	{ query_12_ce0 sc_out sc_logic 1 signal 12 } 
	{ query_12_q0 sc_in sc_lv 32 signal 12 } 
	{ query_13_address0 sc_out sc_lv 3 signal 13 } 
	{ query_13_ce0 sc_out sc_logic 1 signal 13 } 
	{ query_13_q0 sc_in sc_lv 32 signal 13 } 
	{ query_14_address0 sc_out sc_lv 3 signal 14 } 
	{ query_14_ce0 sc_out sc_logic 1 signal 14 } 
	{ query_14_q0 sc_in sc_lv 32 signal 14 } 
	{ query_15_address0 sc_out sc_lv 3 signal 15 } 
	{ query_15_ce0 sc_out sc_logic 1 signal 15 } 
	{ query_15_q0 sc_in sc_lv 32 signal 15 } 
	{ key_metadata_stream_dout sc_in sc_lv 40 signal 16 } 
	{ key_metadata_stream_num_data_valid sc_in sc_lv 6 signal 16 } 
	{ key_metadata_stream_fifo_cap sc_in sc_lv 6 signal 16 } 
	{ key_metadata_stream_empty_n sc_in sc_logic 1 signal 16 } 
	{ key_metadata_stream_read sc_out sc_logic 1 signal 16 } 
	{ key0_stream_dout sc_in sc_lv 512 signal 17 } 
	{ key0_stream_num_data_valid sc_in sc_lv 6 signal 17 } 
	{ key0_stream_fifo_cap sc_in sc_lv 6 signal 17 } 
	{ key0_stream_empty_n sc_in sc_logic 1 signal 17 } 
	{ key0_stream_read sc_out sc_logic 1 signal 17 } 
	{ key1_stream_dout sc_in sc_lv 512 signal 18 } 
	{ key1_stream_num_data_valid sc_in sc_lv 6 signal 18 } 
	{ key1_stream_fifo_cap sc_in sc_lv 6 signal 18 } 
	{ key1_stream_empty_n sc_in sc_logic 1 signal 18 } 
	{ key1_stream_read sc_out sc_logic 1 signal 18 } 
	{ position sc_in sc_lv 12 signal 19 } 
	{ score_stream_din sc_out sc_lv 32 signal 20 } 
	{ score_stream_num_data_valid sc_in sc_lv 3 signal 20 } 
	{ score_stream_fifo_cap sc_in sc_lv 3 signal 20 } 
	{ score_stream_full_n sc_in sc_logic 1 signal 20 } 
	{ score_stream_write sc_out sc_logic 1 signal 20 } 
	{ position_val_c13_din sc_out sc_lv 12 signal 21 } 
	{ position_val_c13_num_data_valid sc_in sc_lv 3 signal 21 } 
	{ position_val_c13_fifo_cap sc_in sc_lv 3 signal 21 } 
	{ position_val_c13_full_n sc_in sc_logic 1 signal 21 } 
	{ position_val_c13_write sc_out sc_logic 1 signal 21 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "query_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_0", "role": "address0" }} , 
 	{ "name": "query_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_0", "role": "ce0" }} , 
 	{ "name": "query_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_0", "role": "q0" }} , 
 	{ "name": "query_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_1", "role": "address0" }} , 
 	{ "name": "query_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_1", "role": "ce0" }} , 
 	{ "name": "query_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_1", "role": "q0" }} , 
 	{ "name": "query_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_2", "role": "address0" }} , 
 	{ "name": "query_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_2", "role": "ce0" }} , 
 	{ "name": "query_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_2", "role": "q0" }} , 
 	{ "name": "query_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_3", "role": "address0" }} , 
 	{ "name": "query_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_3", "role": "ce0" }} , 
 	{ "name": "query_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_3", "role": "q0" }} , 
 	{ "name": "query_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_4", "role": "address0" }} , 
 	{ "name": "query_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_4", "role": "ce0" }} , 
 	{ "name": "query_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_4", "role": "q0" }} , 
 	{ "name": "query_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_5", "role": "address0" }} , 
 	{ "name": "query_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_5", "role": "ce0" }} , 
 	{ "name": "query_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_5", "role": "q0" }} , 
 	{ "name": "query_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_6", "role": "address0" }} , 
 	{ "name": "query_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_6", "role": "ce0" }} , 
 	{ "name": "query_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_6", "role": "q0" }} , 
 	{ "name": "query_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_7", "role": "address0" }} , 
 	{ "name": "query_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_7", "role": "ce0" }} , 
 	{ "name": "query_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_7", "role": "q0" }} , 
 	{ "name": "query_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_8", "role": "address0" }} , 
 	{ "name": "query_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_8", "role": "ce0" }} , 
 	{ "name": "query_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_8", "role": "q0" }} , 
 	{ "name": "query_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_9", "role": "address0" }} , 
 	{ "name": "query_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_9", "role": "ce0" }} , 
 	{ "name": "query_9_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_9", "role": "q0" }} , 
 	{ "name": "query_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_10", "role": "address0" }} , 
 	{ "name": "query_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_10", "role": "ce0" }} , 
 	{ "name": "query_10_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_10", "role": "q0" }} , 
 	{ "name": "query_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_11", "role": "address0" }} , 
 	{ "name": "query_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_11", "role": "ce0" }} , 
 	{ "name": "query_11_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_11", "role": "q0" }} , 
 	{ "name": "query_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_12", "role": "address0" }} , 
 	{ "name": "query_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_12", "role": "ce0" }} , 
 	{ "name": "query_12_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_12", "role": "q0" }} , 
 	{ "name": "query_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_13", "role": "address0" }} , 
 	{ "name": "query_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_13", "role": "ce0" }} , 
 	{ "name": "query_13_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_13", "role": "q0" }} , 
 	{ "name": "query_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_14", "role": "address0" }} , 
 	{ "name": "query_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_14", "role": "ce0" }} , 
 	{ "name": "query_14_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_14", "role": "q0" }} , 
 	{ "name": "query_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_15", "role": "address0" }} , 
 	{ "name": "query_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_15", "role": "ce0" }} , 
 	{ "name": "query_15_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_15", "role": "q0" }} , 
 	{ "name": "key_metadata_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "dout" }} , 
 	{ "name": "key_metadata_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "num_data_valid" }} , 
 	{ "name": "key_metadata_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "fifo_cap" }} , 
 	{ "name": "key_metadata_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "empty_n" }} , 
 	{ "name": "key_metadata_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "read" }} , 
 	{ "name": "key0_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "key0_stream", "role": "dout" }} , 
 	{ "name": "key0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key0_stream", "role": "num_data_valid" }} , 
 	{ "name": "key0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key0_stream", "role": "fifo_cap" }} , 
 	{ "name": "key0_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key0_stream", "role": "empty_n" }} , 
 	{ "name": "key0_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key0_stream", "role": "read" }} , 
 	{ "name": "key1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "key1_stream", "role": "dout" }} , 
 	{ "name": "key1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key1_stream", "role": "num_data_valid" }} , 
 	{ "name": "key1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key1_stream", "role": "fifo_cap" }} , 
 	{ "name": "key1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key1_stream", "role": "empty_n" }} , 
 	{ "name": "key1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key1_stream", "role": "read" }} , 
 	{ "name": "position", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position", "role": "default" }} , 
 	{ "name": "score_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "score_stream", "role": "din" }} , 
 	{ "name": "score_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "score_stream", "role": "num_data_valid" }} , 
 	{ "name": "score_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "score_stream", "role": "fifo_cap" }} , 
 	{ "name": "score_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "score_stream", "role": "full_n" }} , 
 	{ "name": "score_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "score_stream", "role": "write" }} , 
 	{ "name": "position_val_c13_din", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val_c13", "role": "din" }} , 
 	{ "name": "position_val_c13_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position_val_c13", "role": "num_data_valid" }} , 
 	{ "name": "position_val_c13_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position_val_c13", "role": "fifo_cap" }} , 
 	{ "name": "position_val_c13_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_val_c13", "role": "full_n" }} , 
 	{ "name": "position_val_c13_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_val_c13", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_4", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_5", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_6", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_7", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_8", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_9", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_10", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_11", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_12", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_13", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_14", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "query_15", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "key1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "key1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c13", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c13_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U419", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U420", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U421", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U422", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U423", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U424", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U425", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U426", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U427", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U428", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U429", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U430", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U431", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U432", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U433", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_32s_8s_40_2_1_U434", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.mul_44s_15ns_58_5_1_U435", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_17_3_128_1_1_U436", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.sparsemux_9_2_5_1_1_U437", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.frp_pipeline_valid_U", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_process_compressed_kv_Pipeline_compressed_dot_phase_loop_fu_104.pf_score_stream_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
		score_stream {Type O LastRead -1 FirstWrite 15}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "26", "Max" : "32786"}
	, {"Name" : "Interval", "Min" : "26", "Max" : "32786"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	query_0 { ap_memory {  { query_0_address0 mem_address 1 3 }  { query_0_ce0 mem_ce 1 1 }  { query_0_q0 mem_dout 0 32 } } }
	query_1 { ap_memory {  { query_1_address0 mem_address 1 3 }  { query_1_ce0 mem_ce 1 1 }  { query_1_q0 mem_dout 0 32 } } }
	query_2 { ap_memory {  { query_2_address0 mem_address 1 3 }  { query_2_ce0 mem_ce 1 1 }  { query_2_q0 mem_dout 0 32 } } }
	query_3 { ap_memory {  { query_3_address0 mem_address 1 3 }  { query_3_ce0 mem_ce 1 1 }  { query_3_q0 mem_dout 0 32 } } }
	query_4 { ap_memory {  { query_4_address0 mem_address 1 3 }  { query_4_ce0 mem_ce 1 1 }  { query_4_q0 mem_dout 0 32 } } }
	query_5 { ap_memory {  { query_5_address0 mem_address 1 3 }  { query_5_ce0 mem_ce 1 1 }  { query_5_q0 mem_dout 0 32 } } }
	query_6 { ap_memory {  { query_6_address0 mem_address 1 3 }  { query_6_ce0 mem_ce 1 1 }  { query_6_q0 mem_dout 0 32 } } }
	query_7 { ap_memory {  { query_7_address0 mem_address 1 3 }  { query_7_ce0 mem_ce 1 1 }  { query_7_q0 mem_dout 0 32 } } }
	query_8 { ap_memory {  { query_8_address0 mem_address 1 3 }  { query_8_ce0 mem_ce 1 1 }  { query_8_q0 mem_dout 0 32 } } }
	query_9 { ap_memory {  { query_9_address0 mem_address 1 3 }  { query_9_ce0 mem_ce 1 1 }  { query_9_q0 mem_dout 0 32 } } }
	query_10 { ap_memory {  { query_10_address0 mem_address 1 3 }  { query_10_ce0 mem_ce 1 1 }  { query_10_q0 mem_dout 0 32 } } }
	query_11 { ap_memory {  { query_11_address0 mem_address 1 3 }  { query_11_ce0 mem_ce 1 1 }  { query_11_q0 mem_dout 0 32 } } }
	query_12 { ap_memory {  { query_12_address0 mem_address 1 3 }  { query_12_ce0 mem_ce 1 1 }  { query_12_q0 mem_dout 0 32 } } }
	query_13 { ap_memory {  { query_13_address0 mem_address 1 3 }  { query_13_ce0 mem_ce 1 1 }  { query_13_q0 mem_dout 0 32 } } }
	query_14 { ap_memory {  { query_14_address0 mem_address 1 3 }  { query_14_ce0 mem_ce 1 1 }  { query_14_q0 mem_dout 0 32 } } }
	query_15 { ap_memory {  { query_15_address0 mem_address 1 3 }  { query_15_ce0 mem_ce 1 1 }  { query_15_q0 mem_dout 0 32 } } }
	key_metadata_stream { ap_fifo {  { key_metadata_stream_dout fifo_data_in 0 40 }  { key_metadata_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key_metadata_stream_fifo_cap fifo_update 0 6 }  { key_metadata_stream_empty_n fifo_status 0 1 }  { key_metadata_stream_read fifo_port_we 1 1 } } }
	key0_stream { ap_fifo {  { key0_stream_dout fifo_data_in 0 512 }  { key0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key0_stream_fifo_cap fifo_update 0 6 }  { key0_stream_empty_n fifo_status 0 1 }  { key0_stream_read fifo_port_we 1 1 } } }
	key1_stream { ap_fifo {  { key1_stream_dout fifo_data_in 0 512 }  { key1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key1_stream_fifo_cap fifo_update 0 6 }  { key1_stream_empty_n fifo_status 0 1 }  { key1_stream_read fifo_port_we 1 1 } } }
	position { ap_none {  { position in_data 0 12 } } }
	score_stream { ap_fifo {  { score_stream_din fifo_data_in 1 32 }  { score_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { score_stream_fifo_cap fifo_update 0 3 }  { score_stream_full_n fifo_status 0 1 }  { score_stream_write fifo_port_we 1 1 } } }
	position_val_c13 { ap_fifo {  { position_val_c13_din fifo_data_in 1 12 }  { position_val_c13_num_data_valid fifo_status_num_data_valid 0 3 }  { position_val_c13_fifo_cap fifo_update 0 3 }  { position_val_c13_full_n fifo_status 0 1 }  { position_val_c13_write fifo_port_we 1 1 } } }
}
