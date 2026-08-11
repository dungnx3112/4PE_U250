set moduleName swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {swiftkv_route_compressed_kv_cache_Pipeline_route_cached_compressed_kv_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ add_ln712 int 15 regular  }
	{ key_metadata_stream int 40 regular {fifo 1 volatile }  }
	{ value_metadata_stream int 40 regular {fifo 1 volatile }  }
	{ cached_kv_word_stream int 512 regular {fifo 0 volatile }  }
	{ key0_stream int 512 regular {fifo 1 volatile }  }
	{ key1_stream int 512 regular {fifo 1 volatile }  }
	{ value0_engine0_stream int 128 regular {fifo 1 volatile }  }
	{ value0_engine1_stream int 128 regular {fifo 1 volatile }  }
	{ value0_engine2_stream int 128 regular {fifo 1 volatile }  }
	{ value0_engine3_stream int 128 regular {fifo 1 volatile }  }
	{ value1_engine0_stream int 128 regular {fifo 1 volatile }  }
	{ value1_engine1_stream int 128 regular {fifo 1 volatile }  }
	{ value1_engine2_stream int 128 regular {fifo 1 volatile }  }
	{ value1_engine3_stream int 128 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "add_ln712", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "key_metadata_stream", "interface" : "fifo", "bitwidth" : 40, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value_metadata_stream", "interface" : "fifo", "bitwidth" : 40, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cached_kv_word_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "key0_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "key1_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value0_engine0_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value0_engine1_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value0_engine2_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value0_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value1_engine0_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value1_engine1_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value1_engine2_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "value1_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 72
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cached_kv_word_stream_dout sc_in sc_lv 512 signal 3 } 
	{ cached_kv_word_stream_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ cached_kv_word_stream_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ cached_kv_word_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ cached_kv_word_stream_read sc_out sc_logic 1 signal 3 } 
	{ value0_engine0_stream_din sc_out sc_lv 128 signal 6 } 
	{ value0_engine0_stream_num_data_valid sc_in sc_lv 6 signal 6 } 
	{ value0_engine0_stream_fifo_cap sc_in sc_lv 6 signal 6 } 
	{ value0_engine0_stream_full_n sc_in sc_logic 1 signal 6 } 
	{ value0_engine0_stream_write sc_out sc_logic 1 signal 6 } 
	{ value0_engine1_stream_din sc_out sc_lv 128 signal 7 } 
	{ value0_engine1_stream_num_data_valid sc_in sc_lv 6 signal 7 } 
	{ value0_engine1_stream_fifo_cap sc_in sc_lv 6 signal 7 } 
	{ value0_engine1_stream_full_n sc_in sc_logic 1 signal 7 } 
	{ value0_engine1_stream_write sc_out sc_logic 1 signal 7 } 
	{ value0_engine2_stream_din sc_out sc_lv 128 signal 8 } 
	{ value0_engine2_stream_num_data_valid sc_in sc_lv 6 signal 8 } 
	{ value0_engine2_stream_fifo_cap sc_in sc_lv 6 signal 8 } 
	{ value0_engine2_stream_full_n sc_in sc_logic 1 signal 8 } 
	{ value0_engine2_stream_write sc_out sc_logic 1 signal 8 } 
	{ value0_engine3_stream_din sc_out sc_lv 128 signal 9 } 
	{ value0_engine3_stream_num_data_valid sc_in sc_lv 6 signal 9 } 
	{ value0_engine3_stream_fifo_cap sc_in sc_lv 6 signal 9 } 
	{ value0_engine3_stream_full_n sc_in sc_logic 1 signal 9 } 
	{ value0_engine3_stream_write sc_out sc_logic 1 signal 9 } 
	{ key1_stream_din sc_out sc_lv 512 signal 5 } 
	{ key1_stream_num_data_valid sc_in sc_lv 6 signal 5 } 
	{ key1_stream_fifo_cap sc_in sc_lv 6 signal 5 } 
	{ key1_stream_full_n sc_in sc_logic 1 signal 5 } 
	{ key1_stream_write sc_out sc_logic 1 signal 5 } 
	{ key0_stream_din sc_out sc_lv 512 signal 4 } 
	{ key0_stream_num_data_valid sc_in sc_lv 6 signal 4 } 
	{ key0_stream_fifo_cap sc_in sc_lv 6 signal 4 } 
	{ key0_stream_full_n sc_in sc_logic 1 signal 4 } 
	{ key0_stream_write sc_out sc_logic 1 signal 4 } 
	{ key_metadata_stream_din sc_out sc_lv 40 signal 1 } 
	{ key_metadata_stream_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ key_metadata_stream_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ key_metadata_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ key_metadata_stream_write sc_out sc_logic 1 signal 1 } 
	{ value_metadata_stream_din sc_out sc_lv 40 signal 2 } 
	{ value_metadata_stream_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ value_metadata_stream_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ value_metadata_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ value_metadata_stream_write sc_out sc_logic 1 signal 2 } 
	{ value1_engine0_stream_din sc_out sc_lv 128 signal 10 } 
	{ value1_engine0_stream_num_data_valid sc_in sc_lv 6 signal 10 } 
	{ value1_engine0_stream_fifo_cap sc_in sc_lv 6 signal 10 } 
	{ value1_engine0_stream_full_n sc_in sc_logic 1 signal 10 } 
	{ value1_engine0_stream_write sc_out sc_logic 1 signal 10 } 
	{ value1_engine1_stream_din sc_out sc_lv 128 signal 11 } 
	{ value1_engine1_stream_num_data_valid sc_in sc_lv 6 signal 11 } 
	{ value1_engine1_stream_fifo_cap sc_in sc_lv 6 signal 11 } 
	{ value1_engine1_stream_full_n sc_in sc_logic 1 signal 11 } 
	{ value1_engine1_stream_write sc_out sc_logic 1 signal 11 } 
	{ value1_engine2_stream_din sc_out sc_lv 128 signal 12 } 
	{ value1_engine2_stream_num_data_valid sc_in sc_lv 6 signal 12 } 
	{ value1_engine2_stream_fifo_cap sc_in sc_lv 6 signal 12 } 
	{ value1_engine2_stream_full_n sc_in sc_logic 1 signal 12 } 
	{ value1_engine2_stream_write sc_out sc_logic 1 signal 12 } 
	{ value1_engine3_stream_din sc_out sc_lv 128 signal 13 } 
	{ value1_engine3_stream_num_data_valid sc_in sc_lv 6 signal 13 } 
	{ value1_engine3_stream_fifo_cap sc_in sc_lv 6 signal 13 } 
	{ value1_engine3_stream_full_n sc_in sc_logic 1 signal 13 } 
	{ value1_engine3_stream_write sc_out sc_logic 1 signal 13 } 
	{ add_ln712 sc_in sc_lv 15 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cached_kv_word_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "cached_kv_word_stream", "role": "dout" }} , 
 	{ "name": "cached_kv_word_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "cached_kv_word_stream", "role": "num_data_valid" }} , 
 	{ "name": "cached_kv_word_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "cached_kv_word_stream", "role": "fifo_cap" }} , 
 	{ "name": "cached_kv_word_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cached_kv_word_stream", "role": "empty_n" }} , 
 	{ "name": "cached_kv_word_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cached_kv_word_stream", "role": "read" }} , 
 	{ "name": "value0_engine0_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "din" }} , 
 	{ "name": "value0_engine0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine0_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "full_n" }} , 
 	{ "name": "value0_engine0_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "write" }} , 
 	{ "name": "value0_engine1_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "din" }} , 
 	{ "name": "value0_engine1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine1_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "full_n" }} , 
 	{ "name": "value0_engine1_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "write" }} , 
 	{ "name": "value0_engine2_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "din" }} , 
 	{ "name": "value0_engine2_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine2_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine2_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "full_n" }} , 
 	{ "name": "value0_engine2_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "write" }} , 
 	{ "name": "value0_engine3_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "din" }} , 
 	{ "name": "value0_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine3_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "full_n" }} , 
 	{ "name": "value0_engine3_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "write" }} , 
 	{ "name": "key1_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "key1_stream", "role": "din" }} , 
 	{ "name": "key1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key1_stream", "role": "num_data_valid" }} , 
 	{ "name": "key1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key1_stream", "role": "fifo_cap" }} , 
 	{ "name": "key1_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key1_stream", "role": "full_n" }} , 
 	{ "name": "key1_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key1_stream", "role": "write" }} , 
 	{ "name": "key0_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "key0_stream", "role": "din" }} , 
 	{ "name": "key0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key0_stream", "role": "num_data_valid" }} , 
 	{ "name": "key0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key0_stream", "role": "fifo_cap" }} , 
 	{ "name": "key0_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key0_stream", "role": "full_n" }} , 
 	{ "name": "key0_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key0_stream", "role": "write" }} , 
 	{ "name": "key_metadata_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "din" }} , 
 	{ "name": "key_metadata_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "num_data_valid" }} , 
 	{ "name": "key_metadata_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "fifo_cap" }} , 
 	{ "name": "key_metadata_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "full_n" }} , 
 	{ "name": "key_metadata_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_metadata_stream", "role": "write" }} , 
 	{ "name": "value_metadata_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "din" }} , 
 	{ "name": "value_metadata_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "num_data_valid" }} , 
 	{ "name": "value_metadata_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "fifo_cap" }} , 
 	{ "name": "value_metadata_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "full_n" }} , 
 	{ "name": "value_metadata_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "write" }} , 
 	{ "name": "value1_engine0_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "din" }} , 
 	{ "name": "value1_engine0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine0_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "full_n" }} , 
 	{ "name": "value1_engine0_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "write" }} , 
 	{ "name": "value1_engine1_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "din" }} , 
 	{ "name": "value1_engine1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine1_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "full_n" }} , 
 	{ "name": "value1_engine1_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "write" }} , 
 	{ "name": "value1_engine2_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "din" }} , 
 	{ "name": "value1_engine2_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine2_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine2_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "full_n" }} , 
 	{ "name": "value1_engine2_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "write" }} , 
 	{ "name": "value1_engine3_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "din" }} , 
 	{ "name": "value1_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine3_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "full_n" }} , 
 	{ "name": "value1_engine3_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "write" }} , 
 	{ "name": "add_ln712", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "add_ln712", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		value1_engine3_stream {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "20477"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "20477"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	add_ln712 { ap_none {  { add_ln712 in_data 0 15 } } }
	key_metadata_stream { ap_fifo {  { key_metadata_stream_din fifo_data_in 1 40 }  { key_metadata_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key_metadata_stream_fifo_cap fifo_update 0 6 }  { key_metadata_stream_full_n fifo_status 0 1 }  { key_metadata_stream_write fifo_port_we 1 1 } } }
	value_metadata_stream { ap_fifo {  { value_metadata_stream_din fifo_data_in 1 40 }  { value_metadata_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value_metadata_stream_fifo_cap fifo_update 0 6 }  { value_metadata_stream_full_n fifo_status 0 1 }  { value_metadata_stream_write fifo_port_we 1 1 } } }
	cached_kv_word_stream { ap_fifo {  { cached_kv_word_stream_dout fifo_data_in 0 512 }  { cached_kv_word_stream_num_data_valid fifo_status_num_data_valid 0 7 }  { cached_kv_word_stream_fifo_cap fifo_update 0 7 }  { cached_kv_word_stream_empty_n fifo_status 0 1 }  { cached_kv_word_stream_read fifo_port_we 1 1 } } }
	key0_stream { ap_fifo {  { key0_stream_din fifo_data_in 1 512 }  { key0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key0_stream_fifo_cap fifo_update 0 6 }  { key0_stream_full_n fifo_status 0 1 }  { key0_stream_write fifo_port_we 1 1 } } }
	key1_stream { ap_fifo {  { key1_stream_din fifo_data_in 1 512 }  { key1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { key1_stream_fifo_cap fifo_update 0 6 }  { key1_stream_full_n fifo_status 0 1 }  { key1_stream_write fifo_port_we 1 1 } } }
	value0_engine0_stream { ap_fifo {  { value0_engine0_stream_din fifo_data_in 1 128 }  { value0_engine0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine0_stream_fifo_cap fifo_update 0 6 }  { value0_engine0_stream_full_n fifo_status 0 1 }  { value0_engine0_stream_write fifo_port_we 1 1 } } }
	value0_engine1_stream { ap_fifo {  { value0_engine1_stream_din fifo_data_in 1 128 }  { value0_engine1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine1_stream_fifo_cap fifo_update 0 6 }  { value0_engine1_stream_full_n fifo_status 0 1 }  { value0_engine1_stream_write fifo_port_we 1 1 } } }
	value0_engine2_stream { ap_fifo {  { value0_engine2_stream_din fifo_data_in 1 128 }  { value0_engine2_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine2_stream_fifo_cap fifo_update 0 6 }  { value0_engine2_stream_full_n fifo_status 0 1 }  { value0_engine2_stream_write fifo_port_we 1 1 } } }
	value0_engine3_stream { ap_fifo {  { value0_engine3_stream_din fifo_data_in 1 128 }  { value0_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine3_stream_fifo_cap fifo_update 0 6 }  { value0_engine3_stream_full_n fifo_status 0 1 }  { value0_engine3_stream_write fifo_port_we 1 1 } } }
	value1_engine0_stream { ap_fifo {  { value1_engine0_stream_din fifo_data_in 1 128 }  { value1_engine0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine0_stream_fifo_cap fifo_update 0 6 }  { value1_engine0_stream_full_n fifo_status 0 1 }  { value1_engine0_stream_write fifo_port_we 1 1 } } }
	value1_engine1_stream { ap_fifo {  { value1_engine1_stream_din fifo_data_in 1 128 }  { value1_engine1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine1_stream_fifo_cap fifo_update 0 6 }  { value1_engine1_stream_full_n fifo_status 0 1 }  { value1_engine1_stream_write fifo_port_we 1 1 } } }
	value1_engine2_stream { ap_fifo {  { value1_engine2_stream_din fifo_data_in 1 128 }  { value1_engine2_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine2_stream_fifo_cap fifo_update 0 6 }  { value1_engine2_stream_full_n fifo_status 0 1 }  { value1_engine2_stream_write fifo_port_we 1 1 } } }
	value1_engine3_stream { ap_fifo {  { value1_engine3_stream_din fifo_data_in 1 128 }  { value1_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine3_stream_fifo_cap fifo_update 0 6 }  { value1_engine3_stream_full_n fifo_status 0 1 }  { value1_engine3_stream_write fifo_port_we 1 1 } } }
}
