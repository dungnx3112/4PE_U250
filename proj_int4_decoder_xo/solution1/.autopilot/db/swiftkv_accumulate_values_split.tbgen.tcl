set moduleName swiftkv_accumulate_values_split
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
set C_modelName {swiftkv_accumulate_values_split}
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
	{ position_val int 12 regular  }
	{ weighted_value_engine0_0 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine0_1 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine0_2 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine0_3 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine1_0 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine1_1 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine1_2 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine1_3 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine2_0 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine2_1 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine2_2 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine2_3 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine3_0 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine3_1 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine3_2 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_engine3_3 int 32 regular {array 8 { 1 0 } 1 1 }  }
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
 	{ "Name" : "position_val", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine0_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine1_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine1_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine2_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine3_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine3_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine3_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_engine3_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 199
set portList { 
	{ value_metadata_stream_dout sc_in sc_lv 40 signal 0 } 
	{ value_metadata_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ value_metadata_stream_read sc_out sc_logic 1 signal 0 } 
	{ value0_engine0_stream_dout sc_in sc_lv 128 signal 1 } 
	{ value0_engine0_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ value0_engine0_stream_read sc_out sc_logic 1 signal 1 } 
	{ value0_engine1_stream_dout sc_in sc_lv 128 signal 2 } 
	{ value0_engine1_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ value0_engine1_stream_read sc_out sc_logic 1 signal 2 } 
	{ value0_engine2_stream_dout sc_in sc_lv 128 signal 3 } 
	{ value0_engine2_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ value0_engine2_stream_read sc_out sc_logic 1 signal 3 } 
	{ value0_engine3_stream_dout sc_in sc_lv 128 signal 4 } 
	{ value0_engine3_stream_empty_n sc_in sc_logic 1 signal 4 } 
	{ value0_engine3_stream_read sc_out sc_logic 1 signal 4 } 
	{ value1_engine0_stream_dout sc_in sc_lv 128 signal 5 } 
	{ value1_engine0_stream_empty_n sc_in sc_logic 1 signal 5 } 
	{ value1_engine0_stream_read sc_out sc_logic 1 signal 5 } 
	{ value1_engine1_stream_dout sc_in sc_lv 128 signal 6 } 
	{ value1_engine1_stream_empty_n sc_in sc_logic 1 signal 6 } 
	{ value1_engine1_stream_read sc_out sc_logic 1 signal 6 } 
	{ value1_engine2_stream_dout sc_in sc_lv 128 signal 7 } 
	{ value1_engine2_stream_empty_n sc_in sc_logic 1 signal 7 } 
	{ value1_engine2_stream_read sc_out sc_logic 1 signal 7 } 
	{ value1_engine3_stream_dout sc_in sc_lv 128 signal 8 } 
	{ value1_engine3_stream_empty_n sc_in sc_logic 1 signal 8 } 
	{ value1_engine3_stream_read sc_out sc_logic 1 signal 8 } 
	{ control_stream_dout sc_in sc_lv 19 signal 9 } 
	{ control_stream_empty_n sc_in sc_logic 1 signal 9 } 
	{ control_stream_read sc_out sc_logic 1 signal 9 } 
	{ position_val sc_in sc_lv 12 signal 10 } 
	{ weighted_value_engine0_0_address0 sc_out sc_lv 3 signal 11 } 
	{ weighted_value_engine0_0_ce0 sc_out sc_logic 1 signal 11 } 
	{ weighted_value_engine0_0_d0 sc_out sc_lv 32 signal 11 } 
	{ weighted_value_engine0_0_q0 sc_in sc_lv 32 signal 11 } 
	{ weighted_value_engine0_0_we0 sc_out sc_logic 1 signal 11 } 
	{ weighted_value_engine0_0_address1 sc_out sc_lv 3 signal 11 } 
	{ weighted_value_engine0_0_ce1 sc_out sc_logic 1 signal 11 } 
	{ weighted_value_engine0_0_d1 sc_out sc_lv 32 signal 11 } 
	{ weighted_value_engine0_0_q1 sc_in sc_lv 32 signal 11 } 
	{ weighted_value_engine0_0_we1 sc_out sc_logic 1 signal 11 } 
	{ weighted_value_engine0_1_address0 sc_out sc_lv 3 signal 12 } 
	{ weighted_value_engine0_1_ce0 sc_out sc_logic 1 signal 12 } 
	{ weighted_value_engine0_1_d0 sc_out sc_lv 32 signal 12 } 
	{ weighted_value_engine0_1_q0 sc_in sc_lv 32 signal 12 } 
	{ weighted_value_engine0_1_we0 sc_out sc_logic 1 signal 12 } 
	{ weighted_value_engine0_1_address1 sc_out sc_lv 3 signal 12 } 
	{ weighted_value_engine0_1_ce1 sc_out sc_logic 1 signal 12 } 
	{ weighted_value_engine0_1_d1 sc_out sc_lv 32 signal 12 } 
	{ weighted_value_engine0_1_q1 sc_in sc_lv 32 signal 12 } 
	{ weighted_value_engine0_1_we1 sc_out sc_logic 1 signal 12 } 
	{ weighted_value_engine0_2_address0 sc_out sc_lv 3 signal 13 } 
	{ weighted_value_engine0_2_ce0 sc_out sc_logic 1 signal 13 } 
	{ weighted_value_engine0_2_d0 sc_out sc_lv 32 signal 13 } 
	{ weighted_value_engine0_2_q0 sc_in sc_lv 32 signal 13 } 
	{ weighted_value_engine0_2_we0 sc_out sc_logic 1 signal 13 } 
	{ weighted_value_engine0_2_address1 sc_out sc_lv 3 signal 13 } 
	{ weighted_value_engine0_2_ce1 sc_out sc_logic 1 signal 13 } 
	{ weighted_value_engine0_2_d1 sc_out sc_lv 32 signal 13 } 
	{ weighted_value_engine0_2_q1 sc_in sc_lv 32 signal 13 } 
	{ weighted_value_engine0_2_we1 sc_out sc_logic 1 signal 13 } 
	{ weighted_value_engine0_3_address0 sc_out sc_lv 3 signal 14 } 
	{ weighted_value_engine0_3_ce0 sc_out sc_logic 1 signal 14 } 
	{ weighted_value_engine0_3_d0 sc_out sc_lv 32 signal 14 } 
	{ weighted_value_engine0_3_q0 sc_in sc_lv 32 signal 14 } 
	{ weighted_value_engine0_3_we0 sc_out sc_logic 1 signal 14 } 
	{ weighted_value_engine0_3_address1 sc_out sc_lv 3 signal 14 } 
	{ weighted_value_engine0_3_ce1 sc_out sc_logic 1 signal 14 } 
	{ weighted_value_engine0_3_d1 sc_out sc_lv 32 signal 14 } 
	{ weighted_value_engine0_3_q1 sc_in sc_lv 32 signal 14 } 
	{ weighted_value_engine0_3_we1 sc_out sc_logic 1 signal 14 } 
	{ weighted_value_engine1_0_address0 sc_out sc_lv 3 signal 15 } 
	{ weighted_value_engine1_0_ce0 sc_out sc_logic 1 signal 15 } 
	{ weighted_value_engine1_0_d0 sc_out sc_lv 32 signal 15 } 
	{ weighted_value_engine1_0_q0 sc_in sc_lv 32 signal 15 } 
	{ weighted_value_engine1_0_we0 sc_out sc_logic 1 signal 15 } 
	{ weighted_value_engine1_0_address1 sc_out sc_lv 3 signal 15 } 
	{ weighted_value_engine1_0_ce1 sc_out sc_logic 1 signal 15 } 
	{ weighted_value_engine1_0_d1 sc_out sc_lv 32 signal 15 } 
	{ weighted_value_engine1_0_q1 sc_in sc_lv 32 signal 15 } 
	{ weighted_value_engine1_0_we1 sc_out sc_logic 1 signal 15 } 
	{ weighted_value_engine1_1_address0 sc_out sc_lv 3 signal 16 } 
	{ weighted_value_engine1_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ weighted_value_engine1_1_d0 sc_out sc_lv 32 signal 16 } 
	{ weighted_value_engine1_1_q0 sc_in sc_lv 32 signal 16 } 
	{ weighted_value_engine1_1_we0 sc_out sc_logic 1 signal 16 } 
	{ weighted_value_engine1_1_address1 sc_out sc_lv 3 signal 16 } 
	{ weighted_value_engine1_1_ce1 sc_out sc_logic 1 signal 16 } 
	{ weighted_value_engine1_1_d1 sc_out sc_lv 32 signal 16 } 
	{ weighted_value_engine1_1_q1 sc_in sc_lv 32 signal 16 } 
	{ weighted_value_engine1_1_we1 sc_out sc_logic 1 signal 16 } 
	{ weighted_value_engine1_2_address0 sc_out sc_lv 3 signal 17 } 
	{ weighted_value_engine1_2_ce0 sc_out sc_logic 1 signal 17 } 
	{ weighted_value_engine1_2_d0 sc_out sc_lv 32 signal 17 } 
	{ weighted_value_engine1_2_q0 sc_in sc_lv 32 signal 17 } 
	{ weighted_value_engine1_2_we0 sc_out sc_logic 1 signal 17 } 
	{ weighted_value_engine1_2_address1 sc_out sc_lv 3 signal 17 } 
	{ weighted_value_engine1_2_ce1 sc_out sc_logic 1 signal 17 } 
	{ weighted_value_engine1_2_d1 sc_out sc_lv 32 signal 17 } 
	{ weighted_value_engine1_2_q1 sc_in sc_lv 32 signal 17 } 
	{ weighted_value_engine1_2_we1 sc_out sc_logic 1 signal 17 } 
	{ weighted_value_engine1_3_address0 sc_out sc_lv 3 signal 18 } 
	{ weighted_value_engine1_3_ce0 sc_out sc_logic 1 signal 18 } 
	{ weighted_value_engine1_3_d0 sc_out sc_lv 32 signal 18 } 
	{ weighted_value_engine1_3_q0 sc_in sc_lv 32 signal 18 } 
	{ weighted_value_engine1_3_we0 sc_out sc_logic 1 signal 18 } 
	{ weighted_value_engine1_3_address1 sc_out sc_lv 3 signal 18 } 
	{ weighted_value_engine1_3_ce1 sc_out sc_logic 1 signal 18 } 
	{ weighted_value_engine1_3_d1 sc_out sc_lv 32 signal 18 } 
	{ weighted_value_engine1_3_q1 sc_in sc_lv 32 signal 18 } 
	{ weighted_value_engine1_3_we1 sc_out sc_logic 1 signal 18 } 
	{ weighted_value_engine2_0_address0 sc_out sc_lv 3 signal 19 } 
	{ weighted_value_engine2_0_ce0 sc_out sc_logic 1 signal 19 } 
	{ weighted_value_engine2_0_d0 sc_out sc_lv 32 signal 19 } 
	{ weighted_value_engine2_0_q0 sc_in sc_lv 32 signal 19 } 
	{ weighted_value_engine2_0_we0 sc_out sc_logic 1 signal 19 } 
	{ weighted_value_engine2_0_address1 sc_out sc_lv 3 signal 19 } 
	{ weighted_value_engine2_0_ce1 sc_out sc_logic 1 signal 19 } 
	{ weighted_value_engine2_0_d1 sc_out sc_lv 32 signal 19 } 
	{ weighted_value_engine2_0_q1 sc_in sc_lv 32 signal 19 } 
	{ weighted_value_engine2_0_we1 sc_out sc_logic 1 signal 19 } 
	{ weighted_value_engine2_1_address0 sc_out sc_lv 3 signal 20 } 
	{ weighted_value_engine2_1_ce0 sc_out sc_logic 1 signal 20 } 
	{ weighted_value_engine2_1_d0 sc_out sc_lv 32 signal 20 } 
	{ weighted_value_engine2_1_q0 sc_in sc_lv 32 signal 20 } 
	{ weighted_value_engine2_1_we0 sc_out sc_logic 1 signal 20 } 
	{ weighted_value_engine2_1_address1 sc_out sc_lv 3 signal 20 } 
	{ weighted_value_engine2_1_ce1 sc_out sc_logic 1 signal 20 } 
	{ weighted_value_engine2_1_d1 sc_out sc_lv 32 signal 20 } 
	{ weighted_value_engine2_1_q1 sc_in sc_lv 32 signal 20 } 
	{ weighted_value_engine2_1_we1 sc_out sc_logic 1 signal 20 } 
	{ weighted_value_engine2_2_address0 sc_out sc_lv 3 signal 21 } 
	{ weighted_value_engine2_2_ce0 sc_out sc_logic 1 signal 21 } 
	{ weighted_value_engine2_2_d0 sc_out sc_lv 32 signal 21 } 
	{ weighted_value_engine2_2_q0 sc_in sc_lv 32 signal 21 } 
	{ weighted_value_engine2_2_we0 sc_out sc_logic 1 signal 21 } 
	{ weighted_value_engine2_2_address1 sc_out sc_lv 3 signal 21 } 
	{ weighted_value_engine2_2_ce1 sc_out sc_logic 1 signal 21 } 
	{ weighted_value_engine2_2_d1 sc_out sc_lv 32 signal 21 } 
	{ weighted_value_engine2_2_q1 sc_in sc_lv 32 signal 21 } 
	{ weighted_value_engine2_2_we1 sc_out sc_logic 1 signal 21 } 
	{ weighted_value_engine2_3_address0 sc_out sc_lv 3 signal 22 } 
	{ weighted_value_engine2_3_ce0 sc_out sc_logic 1 signal 22 } 
	{ weighted_value_engine2_3_d0 sc_out sc_lv 32 signal 22 } 
	{ weighted_value_engine2_3_q0 sc_in sc_lv 32 signal 22 } 
	{ weighted_value_engine2_3_we0 sc_out sc_logic 1 signal 22 } 
	{ weighted_value_engine2_3_address1 sc_out sc_lv 3 signal 22 } 
	{ weighted_value_engine2_3_ce1 sc_out sc_logic 1 signal 22 } 
	{ weighted_value_engine2_3_d1 sc_out sc_lv 32 signal 22 } 
	{ weighted_value_engine2_3_q1 sc_in sc_lv 32 signal 22 } 
	{ weighted_value_engine2_3_we1 sc_out sc_logic 1 signal 22 } 
	{ weighted_value_engine3_0_address0 sc_out sc_lv 3 signal 23 } 
	{ weighted_value_engine3_0_ce0 sc_out sc_logic 1 signal 23 } 
	{ weighted_value_engine3_0_d0 sc_out sc_lv 32 signal 23 } 
	{ weighted_value_engine3_0_q0 sc_in sc_lv 32 signal 23 } 
	{ weighted_value_engine3_0_we0 sc_out sc_logic 1 signal 23 } 
	{ weighted_value_engine3_0_address1 sc_out sc_lv 3 signal 23 } 
	{ weighted_value_engine3_0_ce1 sc_out sc_logic 1 signal 23 } 
	{ weighted_value_engine3_0_d1 sc_out sc_lv 32 signal 23 } 
	{ weighted_value_engine3_0_q1 sc_in sc_lv 32 signal 23 } 
	{ weighted_value_engine3_0_we1 sc_out sc_logic 1 signal 23 } 
	{ weighted_value_engine3_1_address0 sc_out sc_lv 3 signal 24 } 
	{ weighted_value_engine3_1_ce0 sc_out sc_logic 1 signal 24 } 
	{ weighted_value_engine3_1_d0 sc_out sc_lv 32 signal 24 } 
	{ weighted_value_engine3_1_q0 sc_in sc_lv 32 signal 24 } 
	{ weighted_value_engine3_1_we0 sc_out sc_logic 1 signal 24 } 
	{ weighted_value_engine3_1_address1 sc_out sc_lv 3 signal 24 } 
	{ weighted_value_engine3_1_ce1 sc_out sc_logic 1 signal 24 } 
	{ weighted_value_engine3_1_d1 sc_out sc_lv 32 signal 24 } 
	{ weighted_value_engine3_1_q1 sc_in sc_lv 32 signal 24 } 
	{ weighted_value_engine3_1_we1 sc_out sc_logic 1 signal 24 } 
	{ weighted_value_engine3_2_address0 sc_out sc_lv 3 signal 25 } 
	{ weighted_value_engine3_2_ce0 sc_out sc_logic 1 signal 25 } 
	{ weighted_value_engine3_2_d0 sc_out sc_lv 32 signal 25 } 
	{ weighted_value_engine3_2_q0 sc_in sc_lv 32 signal 25 } 
	{ weighted_value_engine3_2_we0 sc_out sc_logic 1 signal 25 } 
	{ weighted_value_engine3_2_address1 sc_out sc_lv 3 signal 25 } 
	{ weighted_value_engine3_2_ce1 sc_out sc_logic 1 signal 25 } 
	{ weighted_value_engine3_2_d1 sc_out sc_lv 32 signal 25 } 
	{ weighted_value_engine3_2_q1 sc_in sc_lv 32 signal 25 } 
	{ weighted_value_engine3_2_we1 sc_out sc_logic 1 signal 25 } 
	{ weighted_value_engine3_3_address0 sc_out sc_lv 3 signal 26 } 
	{ weighted_value_engine3_3_ce0 sc_out sc_logic 1 signal 26 } 
	{ weighted_value_engine3_3_d0 sc_out sc_lv 32 signal 26 } 
	{ weighted_value_engine3_3_q0 sc_in sc_lv 32 signal 26 } 
	{ weighted_value_engine3_3_we0 sc_out sc_logic 1 signal 26 } 
	{ weighted_value_engine3_3_address1 sc_out sc_lv 3 signal 26 } 
	{ weighted_value_engine3_3_ce1 sc_out sc_logic 1 signal 26 } 
	{ weighted_value_engine3_3_d1 sc_out sc_lv 32 signal 26 } 
	{ weighted_value_engine3_3_q1 sc_in sc_lv 32 signal 26 } 
	{ weighted_value_engine3_3_we1 sc_out sc_logic 1 signal 26 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ position_val_ap_vld sc_in sc_logic 1 invld 10 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "value_metadata_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "dout" }} , 
 	{ "name": "value_metadata_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "empty_n" }} , 
 	{ "name": "value_metadata_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "read" }} , 
 	{ "name": "value0_engine0_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "dout" }} , 
 	{ "name": "value0_engine0_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine0_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine0_stream", "role": "read" }} , 
 	{ "name": "value0_engine1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "dout" }} , 
 	{ "name": "value0_engine1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine1_stream", "role": "read" }} , 
 	{ "name": "value0_engine2_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "dout" }} , 
 	{ "name": "value0_engine2_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine2_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine2_stream", "role": "read" }} , 
 	{ "name": "value0_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "dout" }} , 
 	{ "name": "value0_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "read" }} , 
 	{ "name": "value1_engine0_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "dout" }} , 
 	{ "name": "value1_engine0_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine0_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine0_stream", "role": "read" }} , 
 	{ "name": "value1_engine1_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "dout" }} , 
 	{ "name": "value1_engine1_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine1_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine1_stream", "role": "read" }} , 
 	{ "name": "value1_engine2_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "dout" }} , 
 	{ "name": "value1_engine2_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine2_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine2_stream", "role": "read" }} , 
 	{ "name": "value1_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "dout" }} , 
 	{ "name": "value1_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "read" }} , 
 	{ "name": "control_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "control_stream", "role": "dout" }} , 
 	{ "name": "control_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "empty_n" }} , 
 	{ "name": "control_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "read" }} , 
 	{ "name": "position_val", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val", "role": "default" }} , 
 	{ "name": "weighted_value_engine0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "d0" }} , 
 	{ "name": "weighted_value_engine0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "we0" }} , 
 	{ "name": "weighted_value_engine0_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "address1" }} , 
 	{ "name": "weighted_value_engine0_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine0_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "d1" }} , 
 	{ "name": "weighted_value_engine0_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "q1" }} , 
 	{ "name": "weighted_value_engine0_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_0", "role": "we1" }} , 
 	{ "name": "weighted_value_engine0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "d0" }} , 
 	{ "name": "weighted_value_engine0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "we0" }} , 
 	{ "name": "weighted_value_engine0_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "address1" }} , 
 	{ "name": "weighted_value_engine0_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine0_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "d1" }} , 
 	{ "name": "weighted_value_engine0_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "q1" }} , 
 	{ "name": "weighted_value_engine0_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "we1" }} , 
 	{ "name": "weighted_value_engine0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "d0" }} , 
 	{ "name": "weighted_value_engine0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "we0" }} , 
 	{ "name": "weighted_value_engine0_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "address1" }} , 
 	{ "name": "weighted_value_engine0_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine0_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "d1" }} , 
 	{ "name": "weighted_value_engine0_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "q1" }} , 
 	{ "name": "weighted_value_engine0_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "we1" }} , 
 	{ "name": "weighted_value_engine0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "d0" }} , 
 	{ "name": "weighted_value_engine0_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "we0" }} , 
 	{ "name": "weighted_value_engine0_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "address1" }} , 
 	{ "name": "weighted_value_engine0_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine0_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "d1" }} , 
 	{ "name": "weighted_value_engine0_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "q1" }} , 
 	{ "name": "weighted_value_engine0_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "we1" }} , 
 	{ "name": "weighted_value_engine1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "d0" }} , 
 	{ "name": "weighted_value_engine1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "we0" }} , 
 	{ "name": "weighted_value_engine1_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "address1" }} , 
 	{ "name": "weighted_value_engine1_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine1_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "d1" }} , 
 	{ "name": "weighted_value_engine1_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "q1" }} , 
 	{ "name": "weighted_value_engine1_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_0", "role": "we1" }} , 
 	{ "name": "weighted_value_engine1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "d0" }} , 
 	{ "name": "weighted_value_engine1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "we0" }} , 
 	{ "name": "weighted_value_engine1_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "address1" }} , 
 	{ "name": "weighted_value_engine1_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine1_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "d1" }} , 
 	{ "name": "weighted_value_engine1_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "q1" }} , 
 	{ "name": "weighted_value_engine1_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "we1" }} , 
 	{ "name": "weighted_value_engine1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "d0" }} , 
 	{ "name": "weighted_value_engine1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "we0" }} , 
 	{ "name": "weighted_value_engine1_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "address1" }} , 
 	{ "name": "weighted_value_engine1_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine1_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "d1" }} , 
 	{ "name": "weighted_value_engine1_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "q1" }} , 
 	{ "name": "weighted_value_engine1_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "we1" }} , 
 	{ "name": "weighted_value_engine1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "d0" }} , 
 	{ "name": "weighted_value_engine1_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "we0" }} , 
 	{ "name": "weighted_value_engine1_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "address1" }} , 
 	{ "name": "weighted_value_engine1_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine1_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "d1" }} , 
 	{ "name": "weighted_value_engine1_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "q1" }} , 
 	{ "name": "weighted_value_engine1_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "we1" }} , 
 	{ "name": "weighted_value_engine2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "d0" }} , 
 	{ "name": "weighted_value_engine2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "we0" }} , 
 	{ "name": "weighted_value_engine2_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "address1" }} , 
 	{ "name": "weighted_value_engine2_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine2_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "d1" }} , 
 	{ "name": "weighted_value_engine2_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "q1" }} , 
 	{ "name": "weighted_value_engine2_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_0", "role": "we1" }} , 
 	{ "name": "weighted_value_engine2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "d0" }} , 
 	{ "name": "weighted_value_engine2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "we0" }} , 
 	{ "name": "weighted_value_engine2_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "address1" }} , 
 	{ "name": "weighted_value_engine2_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine2_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "d1" }} , 
 	{ "name": "weighted_value_engine2_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "q1" }} , 
 	{ "name": "weighted_value_engine2_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "we1" }} , 
 	{ "name": "weighted_value_engine2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "d0" }} , 
 	{ "name": "weighted_value_engine2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "we0" }} , 
 	{ "name": "weighted_value_engine2_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "address1" }} , 
 	{ "name": "weighted_value_engine2_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine2_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "d1" }} , 
 	{ "name": "weighted_value_engine2_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "q1" }} , 
 	{ "name": "weighted_value_engine2_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "we1" }} , 
 	{ "name": "weighted_value_engine2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "d0" }} , 
 	{ "name": "weighted_value_engine2_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "we0" }} , 
 	{ "name": "weighted_value_engine2_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "address1" }} , 
 	{ "name": "weighted_value_engine2_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine2_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "d1" }} , 
 	{ "name": "weighted_value_engine2_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "q1" }} , 
 	{ "name": "weighted_value_engine2_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "we1" }} , 
 	{ "name": "weighted_value_engine3_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "d0" }} , 
 	{ "name": "weighted_value_engine3_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "we0" }} , 
 	{ "name": "weighted_value_engine3_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "address1" }} , 
 	{ "name": "weighted_value_engine3_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine3_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "d1" }} , 
 	{ "name": "weighted_value_engine3_0_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "q1" }} , 
 	{ "name": "weighted_value_engine3_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_0", "role": "we1" }} , 
 	{ "name": "weighted_value_engine3_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "d0" }} , 
 	{ "name": "weighted_value_engine3_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "we0" }} , 
 	{ "name": "weighted_value_engine3_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "address1" }} , 
 	{ "name": "weighted_value_engine3_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine3_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "d1" }} , 
 	{ "name": "weighted_value_engine3_1_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "q1" }} , 
 	{ "name": "weighted_value_engine3_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "we1" }} , 
 	{ "name": "weighted_value_engine3_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "d0" }} , 
 	{ "name": "weighted_value_engine3_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "we0" }} , 
 	{ "name": "weighted_value_engine3_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "address1" }} , 
 	{ "name": "weighted_value_engine3_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine3_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "d1" }} , 
 	{ "name": "weighted_value_engine3_2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "q1" }} , 
 	{ "name": "weighted_value_engine3_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "we1" }} , 
 	{ "name": "weighted_value_engine3_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "d0" }} , 
 	{ "name": "weighted_value_engine3_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "we0" }} , 
 	{ "name": "weighted_value_engine3_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "address1" }} , 
 	{ "name": "weighted_value_engine3_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_engine3_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "d1" }} , 
 	{ "name": "weighted_value_engine3_3_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "q1" }} , 
 	{ "name": "weighted_value_engine3_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "we1" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "position_val_ap_vld", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "position_val", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "4", "8", "12", "16", "20", "29", "38", "47", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71"],
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
			{"ID" : "1", "Name" : "swiftkv_broadcast_update_controls_U0"},
			{"ID" : "20", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "29", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "38", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "47", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"OutputProcess" : [
			{"ID" : "20", "Name" : "swiftkv_update_value_engine_0_U0"},
			{"ID" : "29", "Name" : "swiftkv_update_value_engine_1_U0"},
			{"ID" : "38", "Name" : "swiftkv_update_value_engine_2_U0"},
			{"ID" : "47", "Name" : "swiftkv_update_value_engine_3_U0"}],
		"Port" : [
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "value_metadata_stream"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value0_engine0_stream"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value0_engine1_stream"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value0_engine2_stream"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value0_engine3_stream"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "swiftkv_prepare_update_engine_phases_0_U0", "Port" : "value1_engine0_stream"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "swiftkv_prepare_update_engine_phases_1_U0", "Port" : "value1_engine1_stream"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "swiftkv_prepare_update_engine_phases_2_U0", "Port" : "value1_engine2_stream"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "swiftkv_prepare_update_engine_phases_3_U0", "Port" : "value1_engine3_stream"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "swiftkv_broadcast_update_controls_U0", "Port" : "control_stream"}]},
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_engine0_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine0_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine0_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine0_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "swiftkv_update_value_engine_0_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine1_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine1_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine1_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine1_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "swiftkv_update_value_engine_1_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine2_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine2_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine2_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine2_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "38", "SubInstance" : "swiftkv_update_value_engine_2_U0", "Port" : "weighted_value_3"}]},
			{"Name" : "weighted_value_engine3_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_0"}]},
			{"Name" : "weighted_value_engine3_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_1"}]},
			{"Name" : "weighted_value_engine3_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_2"}]},
			{"Name" : "weighted_value_engine3_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "47", "SubInstance" : "swiftkv_update_value_engine_3_U0", "Port" : "weighted_value_3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_broadcast_update_controls_U0", "Parent" : "0", "Child" : ["2"],
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
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "value_metadata_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "56", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "57", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["12"], "DependentChan" : "58", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["16"], "DependentChan" : "59", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c33", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["16"], "DependentChan" : "60", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c33_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c34", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["12"], "DependentChan" : "61", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c34_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c35", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["8"], "DependentChan" : "62", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c35_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c36", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["4"], "DependentChan" : "63", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c36_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98", "Parent" : "1", "Child" : ["3"],
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
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_broadcast_update_controls_U0.grp_swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop_fu_98.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_0_U0", "Parent" : "0", "Child" : ["5"],
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
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "56", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value0_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine0_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "value1_engine0_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "63", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "64", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Port" : "engine0_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c32", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["20"], "DependentChan" : "65", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c32_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70", "Parent" : "4", "Child" : ["6", "7"],
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
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.sparsemux_9_2_5_1_1_U521", "Parent" : "5"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_0_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_3_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_1_U0", "Parent" : "0", "Child" : ["9"],
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
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "57", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value0_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine1_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "value1_engine1_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "62", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["29"], "DependentChan" : "66", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Port" : "engine1_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c31", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["29"], "DependentChan" : "67", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c31_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70", "Parent" : "8", "Child" : ["10", "11"],
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
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.sparsemux_9_2_5_1_1_U533", "Parent" : "9"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_1_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_2_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_2_U0", "Parent" : "0", "Child" : ["13"],
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
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "58", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value0_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine2_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "value1_engine2_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "61", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "68", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Port" : "engine2_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c30", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["38"], "DependentChan" : "69", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c30_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70", "Parent" : "12", "Child" : ["14", "15"],
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
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.sparsemux_9_2_5_1_1_U545", "Parent" : "13"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_2_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_1_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_3_U0", "Parent" : "0", "Child" : ["17"],
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
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "59", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value0_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "value1_engine3_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "60", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["47"], "DependentChan" : "70", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Port" : "engine3_phase_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["47"], "DependentChan" : "71", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70", "Parent" : "16", "Child" : ["18", "19"],
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
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.sparsemux_9_2_5_1_1_U557", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_prepare_update_engine_phases_3_U0.grp_swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop_fu_70.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0", "Parent" : "0", "Child" : ["21", "23"],
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
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "64", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine0_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["4"], "DependentChan" : "65", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "21", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "21", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "21", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "21", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64", "Parent" : "20", "Child" : ["22"],
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
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_3_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "21"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "20", "Child" : ["24", "25", "26", "27", "28"],
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
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U573", "Parent" : "23"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U574", "Parent" : "23"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U575", "Parent" : "23"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U576", "Parent" : "23"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_0_U0.grp_swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0", "Parent" : "0", "Child" : ["30", "32"],
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
			{"Name" : "engine1_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "66", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "32", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine1_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["8"], "DependentChan" : "67", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "32", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "32", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "32", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "30", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "32", "SubInstance" : "grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64", "Parent" : "29", "Child" : ["31"],
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
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_2_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "29", "Child" : ["33", "34", "35", "36", "37"],
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
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U594", "Parent" : "32"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U595", "Parent" : "32"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U596", "Parent" : "32"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U597", "Parent" : "32"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_1_U0.grp_swiftkv_update_value_engine_1_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "32"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0", "Parent" : "0", "Child" : ["39", "41"],
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
			{"Name" : "engine2_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "68", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine2_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "69", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "39", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "41", "SubInstance" : "grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64", "Parent" : "38", "Child" : ["40"],
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
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "39"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "38", "Child" : ["42", "43", "44", "45", "46"],
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
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U614", "Parent" : "41"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U615", "Parent" : "41"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U616", "Parent" : "41"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U617", "Parent" : "41"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_2_U0.grp_swiftkv_update_value_engine_2_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "41"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0", "Parent" : "0", "Child" : ["48", "50"],
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
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "70", "DependentChanDepth" : "8", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "engine3_phase_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["16"], "DependentChan" : "71", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_0", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_1", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_2", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Port" : "weighted_value_3", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "50", "SubInstance" : "grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Port" : "weighted_value_3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64", "Parent" : "47", "Child" : ["49"],
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
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_fu_64.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76", "Parent" : "47", "Child" : ["51", "52", "53", "54", "55"],
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
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U634", "Parent" : "50"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U635", "Parent" : "50"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U636", "Parent" : "50"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.mul_32s_18ns_50_5_1_U637", "Parent" : "50"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.swiftkv_update_value_engine_3_U0.grp_swiftkv_update_value_engine_3_Pipeline_update_value_engine_phase_loop_fu_76.flow_control_loop_pipe_sequential_init_U", "Parent" : "50"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine0_control_stream_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine1_control_stream_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine2_control_stream_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine3_control_stream_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c33_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c34_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c35_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c36_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine0_phase_stream_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c32_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine1_phase_stream_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c31_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine2_phase_stream_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c30_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.engine3_phase_stream_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.position_val_c_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		engine3_phase_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32", "Max" : "32792"}
	, {"Name" : "Interval", "Min" : "31", "Max" : "32791"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	value_metadata_stream { ap_fifo {  { value_metadata_stream_dout fifo_data_in 0 40 }  { value_metadata_stream_empty_n fifo_status 0 1 }  { value_metadata_stream_read fifo_port_we 1 1 } } }
	value0_engine0_stream { ap_fifo {  { value0_engine0_stream_dout fifo_data_in 0 128 }  { value0_engine0_stream_empty_n fifo_status 0 1 }  { value0_engine0_stream_read fifo_port_we 1 1 } } }
	value0_engine1_stream { ap_fifo {  { value0_engine1_stream_dout fifo_data_in 0 128 }  { value0_engine1_stream_empty_n fifo_status 0 1 }  { value0_engine1_stream_read fifo_port_we 1 1 } } }
	value0_engine2_stream { ap_fifo {  { value0_engine2_stream_dout fifo_data_in 0 128 }  { value0_engine2_stream_empty_n fifo_status 0 1 }  { value0_engine2_stream_read fifo_port_we 1 1 } } }
	value0_engine3_stream { ap_fifo {  { value0_engine3_stream_dout fifo_data_in 0 128 }  { value0_engine3_stream_empty_n fifo_status 0 1 }  { value0_engine3_stream_read fifo_port_we 1 1 } } }
	value1_engine0_stream { ap_fifo {  { value1_engine0_stream_dout fifo_data_in 0 128 }  { value1_engine0_stream_empty_n fifo_status 0 1 }  { value1_engine0_stream_read fifo_port_we 1 1 } } }
	value1_engine1_stream { ap_fifo {  { value1_engine1_stream_dout fifo_data_in 0 128 }  { value1_engine1_stream_empty_n fifo_status 0 1 }  { value1_engine1_stream_read fifo_port_we 1 1 } } }
	value1_engine2_stream { ap_fifo {  { value1_engine2_stream_dout fifo_data_in 0 128 }  { value1_engine2_stream_empty_n fifo_status 0 1 }  { value1_engine2_stream_read fifo_port_we 1 1 } } }
	value1_engine3_stream { ap_fifo {  { value1_engine3_stream_dout fifo_data_in 0 128 }  { value1_engine3_stream_empty_n fifo_status 0 1 }  { value1_engine3_stream_read fifo_port_we 1 1 } } }
	control_stream { ap_fifo {  { control_stream_dout fifo_data_in 0 19 }  { control_stream_empty_n fifo_status 0 1 }  { control_stream_read fifo_port_we 1 1 } } }
	position_val { ap_none {  { position_val in_data 0 12 }  { position_val_ap_vld in_vld 0 1 } } }
	weighted_value_engine0_0 { ap_memory {  { weighted_value_engine0_0_address0 mem_address 1 3 }  { weighted_value_engine0_0_ce0 mem_ce 1 1 }  { weighted_value_engine0_0_d0 mem_din 1 32 }  { weighted_value_engine0_0_q0 mem_dout 0 32 }  { weighted_value_engine0_0_we0 mem_we 1 1 }  { weighted_value_engine0_0_address1 MemPortADDR2 1 3 }  { weighted_value_engine0_0_ce1 MemPortCE2 1 1 }  { weighted_value_engine0_0_d1 MemPortDIN2 1 32 }  { weighted_value_engine0_0_q1 mem_dout 0 32 }  { weighted_value_engine0_0_we1 MemPortWE2 1 1 } } }
	weighted_value_engine0_1 { ap_memory {  { weighted_value_engine0_1_address0 mem_address 1 3 }  { weighted_value_engine0_1_ce0 mem_ce 1 1 }  { weighted_value_engine0_1_d0 mem_din 1 32 }  { weighted_value_engine0_1_q0 mem_dout 0 32 }  { weighted_value_engine0_1_we0 mem_we 1 1 }  { weighted_value_engine0_1_address1 MemPortADDR2 1 3 }  { weighted_value_engine0_1_ce1 MemPortCE2 1 1 }  { weighted_value_engine0_1_d1 MemPortDIN2 1 32 }  { weighted_value_engine0_1_q1 mem_dout 0 32 }  { weighted_value_engine0_1_we1 MemPortWE2 1 1 } } }
	weighted_value_engine0_2 { ap_memory {  { weighted_value_engine0_2_address0 mem_address 1 3 }  { weighted_value_engine0_2_ce0 mem_ce 1 1 }  { weighted_value_engine0_2_d0 mem_din 1 32 }  { weighted_value_engine0_2_q0 mem_dout 0 32 }  { weighted_value_engine0_2_we0 mem_we 1 1 }  { weighted_value_engine0_2_address1 MemPortADDR2 1 3 }  { weighted_value_engine0_2_ce1 MemPortCE2 1 1 }  { weighted_value_engine0_2_d1 MemPortDIN2 1 32 }  { weighted_value_engine0_2_q1 mem_dout 0 32 }  { weighted_value_engine0_2_we1 MemPortWE2 1 1 } } }
	weighted_value_engine0_3 { ap_memory {  { weighted_value_engine0_3_address0 mem_address 1 3 }  { weighted_value_engine0_3_ce0 mem_ce 1 1 }  { weighted_value_engine0_3_d0 mem_din 1 32 }  { weighted_value_engine0_3_q0 mem_dout 0 32 }  { weighted_value_engine0_3_we0 mem_we 1 1 }  { weighted_value_engine0_3_address1 MemPortADDR2 1 3 }  { weighted_value_engine0_3_ce1 MemPortCE2 1 1 }  { weighted_value_engine0_3_d1 MemPortDIN2 1 32 }  { weighted_value_engine0_3_q1 mem_dout 0 32 }  { weighted_value_engine0_3_we1 MemPortWE2 1 1 } } }
	weighted_value_engine1_0 { ap_memory {  { weighted_value_engine1_0_address0 mem_address 1 3 }  { weighted_value_engine1_0_ce0 mem_ce 1 1 }  { weighted_value_engine1_0_d0 mem_din 1 32 }  { weighted_value_engine1_0_q0 mem_dout 0 32 }  { weighted_value_engine1_0_we0 mem_we 1 1 }  { weighted_value_engine1_0_address1 MemPortADDR2 1 3 }  { weighted_value_engine1_0_ce1 MemPortCE2 1 1 }  { weighted_value_engine1_0_d1 MemPortDIN2 1 32 }  { weighted_value_engine1_0_q1 mem_dout 0 32 }  { weighted_value_engine1_0_we1 MemPortWE2 1 1 } } }
	weighted_value_engine1_1 { ap_memory {  { weighted_value_engine1_1_address0 mem_address 1 3 }  { weighted_value_engine1_1_ce0 mem_ce 1 1 }  { weighted_value_engine1_1_d0 mem_din 1 32 }  { weighted_value_engine1_1_q0 mem_dout 0 32 }  { weighted_value_engine1_1_we0 mem_we 1 1 }  { weighted_value_engine1_1_address1 MemPortADDR2 1 3 }  { weighted_value_engine1_1_ce1 MemPortCE2 1 1 }  { weighted_value_engine1_1_d1 MemPortDIN2 1 32 }  { weighted_value_engine1_1_q1 mem_dout 0 32 }  { weighted_value_engine1_1_we1 MemPortWE2 1 1 } } }
	weighted_value_engine1_2 { ap_memory {  { weighted_value_engine1_2_address0 mem_address 1 3 }  { weighted_value_engine1_2_ce0 mem_ce 1 1 }  { weighted_value_engine1_2_d0 mem_din 1 32 }  { weighted_value_engine1_2_q0 mem_dout 0 32 }  { weighted_value_engine1_2_we0 mem_we 1 1 }  { weighted_value_engine1_2_address1 MemPortADDR2 1 3 }  { weighted_value_engine1_2_ce1 MemPortCE2 1 1 }  { weighted_value_engine1_2_d1 MemPortDIN2 1 32 }  { weighted_value_engine1_2_q1 mem_dout 0 32 }  { weighted_value_engine1_2_we1 MemPortWE2 1 1 } } }
	weighted_value_engine1_3 { ap_memory {  { weighted_value_engine1_3_address0 mem_address 1 3 }  { weighted_value_engine1_3_ce0 mem_ce 1 1 }  { weighted_value_engine1_3_d0 mem_din 1 32 }  { weighted_value_engine1_3_q0 mem_dout 0 32 }  { weighted_value_engine1_3_we0 mem_we 1 1 }  { weighted_value_engine1_3_address1 MemPortADDR2 1 3 }  { weighted_value_engine1_3_ce1 MemPortCE2 1 1 }  { weighted_value_engine1_3_d1 MemPortDIN2 1 32 }  { weighted_value_engine1_3_q1 mem_dout 0 32 }  { weighted_value_engine1_3_we1 MemPortWE2 1 1 } } }
	weighted_value_engine2_0 { ap_memory {  { weighted_value_engine2_0_address0 mem_address 1 3 }  { weighted_value_engine2_0_ce0 mem_ce 1 1 }  { weighted_value_engine2_0_d0 mem_din 1 32 }  { weighted_value_engine2_0_q0 mem_dout 0 32 }  { weighted_value_engine2_0_we0 mem_we 1 1 }  { weighted_value_engine2_0_address1 MemPortADDR2 1 3 }  { weighted_value_engine2_0_ce1 MemPortCE2 1 1 }  { weighted_value_engine2_0_d1 MemPortDIN2 1 32 }  { weighted_value_engine2_0_q1 mem_dout 0 32 }  { weighted_value_engine2_0_we1 MemPortWE2 1 1 } } }
	weighted_value_engine2_1 { ap_memory {  { weighted_value_engine2_1_address0 mem_address 1 3 }  { weighted_value_engine2_1_ce0 mem_ce 1 1 }  { weighted_value_engine2_1_d0 mem_din 1 32 }  { weighted_value_engine2_1_q0 mem_dout 0 32 }  { weighted_value_engine2_1_we0 mem_we 1 1 }  { weighted_value_engine2_1_address1 MemPortADDR2 1 3 }  { weighted_value_engine2_1_ce1 MemPortCE2 1 1 }  { weighted_value_engine2_1_d1 MemPortDIN2 1 32 }  { weighted_value_engine2_1_q1 mem_dout 0 32 }  { weighted_value_engine2_1_we1 MemPortWE2 1 1 } } }
	weighted_value_engine2_2 { ap_memory {  { weighted_value_engine2_2_address0 mem_address 1 3 }  { weighted_value_engine2_2_ce0 mem_ce 1 1 }  { weighted_value_engine2_2_d0 mem_din 1 32 }  { weighted_value_engine2_2_q0 mem_dout 0 32 }  { weighted_value_engine2_2_we0 mem_we 1 1 }  { weighted_value_engine2_2_address1 MemPortADDR2 1 3 }  { weighted_value_engine2_2_ce1 MemPortCE2 1 1 }  { weighted_value_engine2_2_d1 MemPortDIN2 1 32 }  { weighted_value_engine2_2_q1 mem_dout 0 32 }  { weighted_value_engine2_2_we1 MemPortWE2 1 1 } } }
	weighted_value_engine2_3 { ap_memory {  { weighted_value_engine2_3_address0 mem_address 1 3 }  { weighted_value_engine2_3_ce0 mem_ce 1 1 }  { weighted_value_engine2_3_d0 mem_din 1 32 }  { weighted_value_engine2_3_q0 mem_dout 0 32 }  { weighted_value_engine2_3_we0 mem_we 1 1 }  { weighted_value_engine2_3_address1 MemPortADDR2 1 3 }  { weighted_value_engine2_3_ce1 MemPortCE2 1 1 }  { weighted_value_engine2_3_d1 MemPortDIN2 1 32 }  { weighted_value_engine2_3_q1 mem_dout 0 32 }  { weighted_value_engine2_3_we1 MemPortWE2 1 1 } } }
	weighted_value_engine3_0 { ap_memory {  { weighted_value_engine3_0_address0 mem_address 1 3 }  { weighted_value_engine3_0_ce0 mem_ce 1 1 }  { weighted_value_engine3_0_d0 mem_din 1 32 }  { weighted_value_engine3_0_q0 mem_dout 0 32 }  { weighted_value_engine3_0_we0 mem_we 1 1 }  { weighted_value_engine3_0_address1 MemPortADDR2 1 3 }  { weighted_value_engine3_0_ce1 MemPortCE2 1 1 }  { weighted_value_engine3_0_d1 MemPortDIN2 1 32 }  { weighted_value_engine3_0_q1 mem_dout 0 32 }  { weighted_value_engine3_0_we1 MemPortWE2 1 1 } } }
	weighted_value_engine3_1 { ap_memory {  { weighted_value_engine3_1_address0 mem_address 1 3 }  { weighted_value_engine3_1_ce0 mem_ce 1 1 }  { weighted_value_engine3_1_d0 mem_din 1 32 }  { weighted_value_engine3_1_q0 mem_dout 0 32 }  { weighted_value_engine3_1_we0 mem_we 1 1 }  { weighted_value_engine3_1_address1 MemPortADDR2 1 3 }  { weighted_value_engine3_1_ce1 MemPortCE2 1 1 }  { weighted_value_engine3_1_d1 MemPortDIN2 1 32 }  { weighted_value_engine3_1_q1 mem_dout 0 32 }  { weighted_value_engine3_1_we1 MemPortWE2 1 1 } } }
	weighted_value_engine3_2 { ap_memory {  { weighted_value_engine3_2_address0 mem_address 1 3 }  { weighted_value_engine3_2_ce0 mem_ce 1 1 }  { weighted_value_engine3_2_d0 mem_din 1 32 }  { weighted_value_engine3_2_q0 mem_dout 0 32 }  { weighted_value_engine3_2_we0 mem_we 1 1 }  { weighted_value_engine3_2_address1 MemPortADDR2 1 3 }  { weighted_value_engine3_2_ce1 MemPortCE2 1 1 }  { weighted_value_engine3_2_d1 MemPortDIN2 1 32 }  { weighted_value_engine3_2_q1 mem_dout 0 32 }  { weighted_value_engine3_2_we1 MemPortWE2 1 1 } } }
	weighted_value_engine3_3 { ap_memory {  { weighted_value_engine3_3_address0 mem_address 1 3 }  { weighted_value_engine3_3_ce0 mem_ce 1 1 }  { weighted_value_engine3_3_d0 mem_din 1 32 }  { weighted_value_engine3_3_q0 mem_dout 0 32 }  { weighted_value_engine3_3_we0 mem_we 1 1 }  { weighted_value_engine3_3_address1 MemPortADDR2 1 3 }  { weighted_value_engine3_3_ce1 MemPortCE2 1 1 }  { weighted_value_engine3_3_d1 MemPortDIN2 1 32 }  { weighted_value_engine3_3_q1 mem_dout 0 32 }  { weighted_value_engine3_3_we1 MemPortWE2 1 1 } } }
}
