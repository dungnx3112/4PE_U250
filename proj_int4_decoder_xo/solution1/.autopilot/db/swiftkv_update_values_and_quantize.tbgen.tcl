set moduleName swiftkv_update_values_and_quantize
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
set C_modelName {swiftkv_update_values_and_quantize}
set C_modelType { void 0 }
set C_modelArgList {
	{ value_metadata_stream int 40 regular {fifo 0 volatile }  }
	{ value0_engine0_stream int 128 regular {fifo 0 volatile }  }
	{ value0_engine1_stream int 128 regular {fifo 0 volatile }  }
	{ value0_engine2_stream int 128 regular {fifo 0 volatile }  }
	{ value0_engine3_stream int 128 regular {fifo 0 volatile }  }
	{ value1_engine0_stream int 128 regular {fifo 0 volatile }  }
	{ value1_engine1_stream int 128 regular {fifo 0 volatile }  }
	{ value1_engine2_stream int 128 regular {fifo 0 volatile }  }
	{ value1_engine3_stream int 128 regular {fifo 0 volatile }  }
	{ control_stream int 19 regular {fifo 0 volatile }  }
	{ inverse_normalization_stream int 32 regular {fifo 0 volatile }  }
	{ position int 12 regular {fifo 0}  }
	{ quantized_pe0 int 480 regular {fifo 1 volatile }  }
	{ scale_pe0 int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "value_metadata_stream", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "value0_engine0_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value0_engine1_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value0_engine2_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value0_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value1_engine0_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value1_engine1_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value1_engine2_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value1_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "control_stream", "interface" : "fifo", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "inverse_normalization_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "position", "interface" : "fifo", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe0", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_pe0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 77
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ value_metadata_stream_dout sc_in sc_lv 40 signal 0 } 
	{ value_metadata_stream_num_data_valid sc_in sc_lv 6 signal 0 } 
	{ value_metadata_stream_fifo_cap sc_in sc_lv 6 signal 0 } 
	{ value_metadata_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ value_metadata_stream_read sc_out sc_logic 1 signal 0 } 
	{ value0_engine0_stream_dout sc_in sc_lv 128 signal 1 } 
	{ value0_engine0_stream_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ value0_engine0_stream_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ value0_engine0_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ value0_engine0_stream_read sc_out sc_logic 1 signal 1 } 
	{ value0_engine1_stream_dout sc_in sc_lv 128 signal 2 } 
	{ value0_engine1_stream_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ value0_engine1_stream_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ value0_engine1_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ value0_engine1_stream_read sc_out sc_logic 1 signal 2 } 
	{ value0_engine2_stream_dout sc_in sc_lv 128 signal 3 } 
	{ value0_engine2_stream_num_data_valid sc_in sc_lv 6 signal 3 } 
	{ value0_engine2_stream_fifo_cap sc_in sc_lv 6 signal 3 } 
	{ value0_engine2_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ value0_engine2_stream_read sc_out sc_logic 1 signal 3 } 
	{ value0_engine3_stream_dout sc_in sc_lv 128 signal 4 } 
	{ value0_engine3_stream_num_data_valid sc_in sc_lv 6 signal 4 } 
	{ value0_engine3_stream_fifo_cap sc_in sc_lv 6 signal 4 } 
	{ value0_engine3_stream_empty_n sc_in sc_logic 1 signal 4 } 
	{ value0_engine3_stream_read sc_out sc_logic 1 signal 4 } 
	{ value1_engine0_stream_dout sc_in sc_lv 128 signal 5 } 
	{ value1_engine0_stream_num_data_valid sc_in sc_lv 6 signal 5 } 
	{ value1_engine0_stream_fifo_cap sc_in sc_lv 6 signal 5 } 
	{ value1_engine0_stream_empty_n sc_in sc_logic 1 signal 5 } 
	{ value1_engine0_stream_read sc_out sc_logic 1 signal 5 } 
	{ value1_engine1_stream_dout sc_in sc_lv 128 signal 6 } 
	{ value1_engine1_stream_num_data_valid sc_in sc_lv 6 signal 6 } 
	{ value1_engine1_stream_fifo_cap sc_in sc_lv 6 signal 6 } 
	{ value1_engine1_stream_empty_n sc_in sc_logic 1 signal 6 } 
	{ value1_engine1_stream_read sc_out sc_logic 1 signal 6 } 
	{ value1_engine2_stream_dout sc_in sc_lv 128 signal 7 } 
	{ value1_engine2_stream_num_data_valid sc_in sc_lv 6 signal 7 } 
	{ value1_engine2_stream_fifo_cap sc_in sc_lv 6 signal 7 } 
	{ value1_engine2_stream_empty_n sc_in sc_logic 1 signal 7 } 
	{ value1_engine2_stream_read sc_out sc_logic 1 signal 7 } 
	{ value1_engine3_stream_dout sc_in sc_lv 128 signal 8 } 
	{ value1_engine3_stream_num_data_valid sc_in sc_lv 6 signal 8 } 
	{ value1_engine3_stream_fifo_cap sc_in sc_lv 6 signal 8 } 
	{ value1_engine3_stream_empty_n sc_in sc_logic 1 signal 8 } 
	{ value1_engine3_stream_read sc_out sc_logic 1 signal 8 } 
	{ control_stream_dout sc_in sc_lv 19 signal 9 } 
	{ control_stream_num_data_valid sc_in sc_lv 5 signal 9 } 
	{ control_stream_fifo_cap sc_in sc_lv 5 signal 9 } 
	{ control_stream_empty_n sc_in sc_logic 1 signal 9 } 
	{ control_stream_read sc_out sc_logic 1 signal 9 } 
	{ inverse_normalization_stream_dout sc_in sc_lv 32 signal 10 } 
	{ inverse_normalization_stream_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ inverse_normalization_stream_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ inverse_normalization_stream_empty_n sc_in sc_logic 1 signal 10 } 
	{ inverse_normalization_stream_read sc_out sc_logic 1 signal 10 } 
	{ position_dout sc_in sc_lv 12 signal 11 } 
	{ position_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ position_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ position_empty_n sc_in sc_logic 1 signal 11 } 
	{ position_read sc_out sc_logic 1 signal 11 } 
	{ quantized_pe0_din sc_out sc_lv 480 signal 12 } 
	{ quantized_pe0_num_data_valid sc_in sc_lv 3 signal 12 } 
	{ quantized_pe0_fifo_cap sc_in sc_lv 3 signal 12 } 
	{ quantized_pe0_full_n sc_in sc_logic 1 signal 12 } 
	{ quantized_pe0_write sc_out sc_logic 1 signal 12 } 
	{ scale_pe0_din sc_out sc_lv 32 signal 13 } 
	{ scale_pe0_num_data_valid sc_in sc_lv 3 signal 13 } 
	{ scale_pe0_fifo_cap sc_in sc_lv 3 signal 13 } 
	{ scale_pe0_full_n sc_in sc_logic 1 signal 13 } 
	{ scale_pe0_write sc_out sc_logic 1 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "value_metadata_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "dout" }} , 
 	{ "name": "value_metadata_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "num_data_valid" }} , 
 	{ "name": "value_metadata_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "fifo_cap" }} , 
 	{ "name": "value_metadata_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "empty_n" }} , 
 	{ "name": "value_metadata_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "read" }} , 
 	{ "name": "value0_engine0_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "dout" }} , 
 	{ "name": "value0_engine0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine0_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine0_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "read" }} , 
 	{ "name": "value0_engine1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "dout" }} , 
 	{ "name": "value0_engine1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "read" }} , 
 	{ "name": "value0_engine2_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "dout" }} , 
 	{ "name": "value0_engine2_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine2_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine2_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine2_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "read" }} , 
 	{ "name": "value0_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "dout" }} , 
 	{ "name": "value0_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "read" }} , 
 	{ "name": "value1_engine0_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "dout" }} , 
 	{ "name": "value1_engine0_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine0_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine0_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine0_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "read" }} , 
 	{ "name": "value1_engine1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "dout" }} , 
 	{ "name": "value1_engine1_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine1_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "read" }} , 
 	{ "name": "value1_engine2_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "dout" }} , 
 	{ "name": "value1_engine2_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine2_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine2_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine2_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "read" }} , 
 	{ "name": "value1_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "dout" }} , 
 	{ "name": "value1_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "read" }} , 
 	{ "name": "control_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "control_stream", "role": "dout" }} , 
 	{ "name": "control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "num_data_valid" }} , 
 	{ "name": "control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "fifo_cap" }} , 
 	{ "name": "control_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "empty_n" }} , 
 	{ "name": "control_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "read" }} , 
 	{ "name": "inverse_normalization_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "dout" }} , 
 	{ "name": "inverse_normalization_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "num_data_valid" }} , 
 	{ "name": "inverse_normalization_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "fifo_cap" }} , 
 	{ "name": "inverse_normalization_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "empty_n" }} , 
 	{ "name": "inverse_normalization_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "read" }} , 
 	{ "name": "position_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position", "role": "dout" }} , 
 	{ "name": "position_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position", "role": "num_data_valid" }} , 
 	{ "name": "position_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position", "role": "fifo_cap" }} , 
 	{ "name": "position_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position", "role": "empty_n" }} , 
 	{ "name": "position_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position", "role": "read" }} , 
 	{ "name": "quantized_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "din" }} , 
 	{ "name": "quantized_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "full_n" }} , 
 	{ "name": "quantized_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "write" }} , 
 	{ "name": "scale_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe0", "role": "din" }} , 
 	{ "name": "scale_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe0", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe0", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "full_n" }} , 
 	{ "name": "scale_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "90", "97", "102", "103", "104"],
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
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value_metadata_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value0_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine0_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine1_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine2_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "value1_engine3_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "grp_swiftkv_accumulate_values_split_fu_262", "Port" : "control_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine0_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine0_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine0_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine1_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine1_1_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine1_2_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine1_3_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine2_1_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine2_2_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine2_3_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine3_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine3_1_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine3_2_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weighted_value_engine3_3_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.attention_group_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262", "Parent" : "0", "Child" : ["19", "22", "26", "30", "34", "38", "47", "56", "65", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89"],
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
			{"ID" : "19", "Name" : "swiftkv_broadcast_update_controls_U0"},
			{"ID" : "38", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "47", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "56", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "65", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"OutputProcess" : [
			{"ID" : "38", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "47", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "56", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "65", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "value_metadata_stream"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value0_engine0_stream"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value0_engine1_stream"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value0_engine2_stream"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value0_engine3_stream"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value1_engine0_stream"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "26", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value1_engine1_stream"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value1_engine2_stream"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value1_engine3_stream"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "control_stream"}]},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine0_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine0_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine0_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "56", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine3_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "65", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine3_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "65", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine3_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "65", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine3_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "65", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_3"}]}]},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0", "Parent" : "18", "Child" : ["20"],
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
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["22"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["26"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["30"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["34"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c33", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["34"], "DependentChan" : "78", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c33_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c34", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["30"], "DependentChan" : "79", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c34_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c35", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["26"], "DependentChan" : "80", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c35_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c36", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["22"], "DependentChan" : "81", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c36_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Parent" : "19", "Child" : ["21"],
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
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0", "Parent" : "18", "Child" : ["23"],
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
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "81", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "82", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c32", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "83", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c32_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Parent" : "22", "Child" : ["24", "25"],
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
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.sparsemux_9_2_5_1_1_U521", "Parent" : "23"},
	{"ID" : "25", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0", "Parent" : "18", "Child" : ["27"],
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
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "80", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["47"], "DependentChan" : "84", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c31", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["47"], "DependentChan" : "85", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c31_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Parent" : "26", "Child" : ["28", "29"],
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
	{"ID" : "28", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.sparsemux_9_2_5_1_1_U533", "Parent" : "27"},
	{"ID" : "29", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0", "Parent" : "18", "Child" : ["31"],
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
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "79", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["56"], "DependentChan" : "86", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c30", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["56"], "DependentChan" : "87", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c30_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Parent" : "30", "Child" : ["32", "33"],
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
	{"ID" : "32", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.sparsemux_9_2_5_1_1_U545", "Parent" : "31"},
	{"ID" : "33", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0", "Parent" : "18", "Child" : ["35"],
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
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "77", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["19"], "DependentChan" : "78", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["65"], "DependentChan" : "88", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["65"], "DependentChan" : "89", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Parent" : "34", "Child" : ["36", "37"],
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
	{"ID" : "36", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.sparsemux_9_2_5_1_1_U557", "Parent" : "35"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0", "Parent" : "18", "Child" : ["39", "41"],
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
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["22"], "DependentChan" : "82", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine0_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["22"], "DependentChan" : "83", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Parent" : "38", "Child" : ["40"],
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
	{"ID" : "40", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "38", "Child" : ["42", "43", "44", "45", "46"],
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
	{"ID" : "42", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U573", "Parent" : "41"},
	{"ID" : "43", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U574", "Parent" : "41"},
	{"ID" : "44", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U575", "Parent" : "41"},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U576", "Parent" : "41"},
	{"ID" : "46", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0", "Parent" : "18", "Child" : ["48", "50"],
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
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["26"], "DependentChan" : "84", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine1_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["26"], "DependentChan" : "85", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Parent" : "47", "Child" : ["49"],
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
	{"ID" : "49", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "47", "Child" : ["51", "52", "53", "54", "55"],
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
	{"ID" : "51", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U594", "Parent" : "50"},
	{"ID" : "52", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U595", "Parent" : "50"},
	{"ID" : "53", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U596", "Parent" : "50"},
	{"ID" : "54", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U597", "Parent" : "50"},
	{"ID" : "55", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "50"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0", "Parent" : "18", "Child" : ["57", "59"],
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
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["30"], "DependentChan" : "86", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "59", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine2_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["30"], "DependentChan" : "87", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "59", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "59", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "59", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "57", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "59", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Parent" : "56", "Child" : ["58"],
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
	{"ID" : "58", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "57"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "56", "Child" : ["60", "61", "62", "63", "64"],
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
	{"ID" : "60", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U614", "Parent" : "59"},
	{"ID" : "61", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U615", "Parent" : "59"},
	{"ID" : "62", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U616", "Parent" : "59"},
	{"ID" : "63", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U617", "Parent" : "59"},
	{"ID" : "64", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "59"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0", "Parent" : "18", "Child" : ["66", "68"],
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
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["34"], "DependentChan" : "88", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine3_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["34"], "DependentChan" : "89", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "68", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "68", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "68", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "68", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Parent" : "65", "Child" : ["67"],
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
	{"ID" : "67", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "66"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "65", "Child" : ["69", "70", "71", "72", "73"],
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
	{"ID" : "69", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U634", "Parent" : "68"},
	{"ID" : "70", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U635", "Parent" : "68"},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U636", "Parent" : "68"},
	{"ID" : "72", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U637", "Parent" : "68"},
	{"ID" : "73", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "68"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine0_control_stream_U", "Parent" : "18"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine1_control_stream_U", "Parent" : "18"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine2_control_stream_U", "Parent" : "18"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine3_control_stream_U", "Parent" : "18"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c33_U", "Parent" : "18"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c34_U", "Parent" : "18"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c35_U", "Parent" : "18"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c36_U", "Parent" : "18"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine0_phase_stream_U", "Parent" : "18"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c32_U", "Parent" : "18"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine1_phase_stream_U", "Parent" : "18"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c31_U", "Parent" : "18"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine2_phase_stream_U", "Parent" : "18"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c30_U", "Parent" : "18"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.engine3_phase_stream_U", "Parent" : "18"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_accumulate_values_split_fu_262.position_val_c_U", "Parent" : "18"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320", "Parent" : "0", "Child" : ["91", "92", "93", "94", "95", "96"],
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
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.mul_32s_32s_49_5_1_U693", "Parent" : "90"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U694", "Parent" : "90"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U695", "Parent" : "90"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U696", "Parent" : "90"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.sparsemux_9_2_32_1_1_U697", "Parent" : "90"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop_fu_320.flow_control_loop_pipe_sequential_init_U", "Parent" : "90"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344", "Parent" : "0", "Child" : ["98", "99", "100", "101"],
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
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fadd_32ns_32ns_32_7_full_dsp_1_U720", "Parent" : "97"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U723", "Parent" : "97"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.fcmp_32ns_32ns_1_2_no_dsp_1_U724", "Parent" : "97"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_update_values_and_quantize_Pipeline_attention_quantize_reverse_loop_fu_344.flow_control_loop_pipe_sequential_init_U", "Parent" : "97"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U730", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_12_no_dsp_1_U731", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U732", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "510", "Max" : "33270"}
	, {"Name" : "Interval", "Min" : "510", "Max" : "33270"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	value_metadata_stream { ap_fifo {  { value_metadata_stream_dout fifo_data_in 0 40 }  { value_metadata_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value_metadata_stream_fifo_cap fifo_update 0 6 }  { value_metadata_stream_empty_n fifo_status 0 1 }  { value_metadata_stream_read fifo_port_we 1 1 } } }
	value0_engine0_stream { ap_fifo {  { value0_engine0_stream_dout fifo_data_in 0 128 }  { value0_engine0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine0_stream_fifo_cap fifo_update 0 6 }  { value0_engine0_stream_empty_n fifo_status 0 1 }  { value0_engine0_stream_read fifo_port_we 1 1 } } }
	value0_engine1_stream { ap_fifo {  { value0_engine1_stream_dout fifo_data_in 0 128 }  { value0_engine1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine1_stream_fifo_cap fifo_update 0 6 }  { value0_engine1_stream_empty_n fifo_status 0 1 }  { value0_engine1_stream_read fifo_port_we 1 1 } } }
	value0_engine2_stream { ap_fifo {  { value0_engine2_stream_dout fifo_data_in 0 128 }  { value0_engine2_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine2_stream_fifo_cap fifo_update 0 6 }  { value0_engine2_stream_empty_n fifo_status 0 1 }  { value0_engine2_stream_read fifo_port_we 1 1 } } }
	value0_engine3_stream { ap_fifo {  { value0_engine3_stream_dout fifo_data_in 0 128 }  { value0_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine3_stream_fifo_cap fifo_update 0 6 }  { value0_engine3_stream_empty_n fifo_status 0 1 }  { value0_engine3_stream_read fifo_port_we 1 1 } } }
	value1_engine0_stream { ap_fifo {  { value1_engine0_stream_dout fifo_data_in 0 128 }  { value1_engine0_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine0_stream_fifo_cap fifo_update 0 6 }  { value1_engine0_stream_empty_n fifo_status 0 1 }  { value1_engine0_stream_read fifo_port_we 1 1 } } }
	value1_engine1_stream { ap_fifo {  { value1_engine1_stream_dout fifo_data_in 0 128 }  { value1_engine1_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine1_stream_fifo_cap fifo_update 0 6 }  { value1_engine1_stream_empty_n fifo_status 0 1 }  { value1_engine1_stream_read fifo_port_we 1 1 } } }
	value1_engine2_stream { ap_fifo {  { value1_engine2_stream_dout fifo_data_in 0 128 }  { value1_engine2_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine2_stream_fifo_cap fifo_update 0 6 }  { value1_engine2_stream_empty_n fifo_status 0 1 }  { value1_engine2_stream_read fifo_port_we 1 1 } } }
	value1_engine3_stream { ap_fifo {  { value1_engine3_stream_dout fifo_data_in 0 128 }  { value1_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine3_stream_fifo_cap fifo_update 0 6 }  { value1_engine3_stream_empty_n fifo_status 0 1 }  { value1_engine3_stream_read fifo_port_we 1 1 } } }
	control_stream { ap_fifo {  { control_stream_dout fifo_data_in 0 19 }  { control_stream_num_data_valid fifo_status_num_data_valid 0 5 }  { control_stream_fifo_cap fifo_update 0 5 }  { control_stream_empty_n fifo_status 0 1 }  { control_stream_read fifo_port_we 1 1 } } }
	inverse_normalization_stream { ap_fifo {  { inverse_normalization_stream_dout fifo_data_in 0 32 }  { inverse_normalization_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { inverse_normalization_stream_fifo_cap fifo_update 0 3 }  { inverse_normalization_stream_empty_n fifo_status 0 1 }  { inverse_normalization_stream_read fifo_port_we 1 1 } } }
	position { ap_fifo {  { position_dout fifo_data_in 0 12 }  { position_num_data_valid fifo_status_num_data_valid 0 3 }  { position_fifo_cap fifo_update 0 3 }  { position_empty_n fifo_status 0 1 }  { position_read fifo_port_we 1 1 } } }
	quantized_pe0 { ap_fifo {  { quantized_pe0_din fifo_data_in 1 480 }  { quantized_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe0_fifo_cap fifo_update 0 3 }  { quantized_pe0_full_n fifo_status 0 1 }  { quantized_pe0_write fifo_port_we 1 1 } } }
	scale_pe0 { ap_fifo {  { scale_pe0_din fifo_data_in 1 32 }  { scale_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe0_fifo_cap fifo_update 0 3 }  { scale_pe0_full_n fifo_status 0 1 }  { scale_pe0_write fifo_port_we 1 1 } } }
}
