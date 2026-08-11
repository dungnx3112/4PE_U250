set moduleName swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop
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
set C_modelName {swiftkv_update_values_and_quantize_Pipeline_attention_normalize_lane_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln1488 int 32 regular  }
	{ attention_group int 32 regular {array 32 { 0 } 0 1 }  }
	{ weighted_value_engine0 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine0_1 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine0_2 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine0_3 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ empty int 2 regular  }
	{ weighted_value_engine1 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine1_1 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine1_2 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine1_3 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine2 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine2_1 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine2_2 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine2_3 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine3 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine3_1 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine3_2 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ weighted_value_engine3_3 int 32 regular {array 8 { 1 3 } 1 1 }  }
	{ max_abs_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln1488", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "attention_group", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weighted_value_engine0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine0_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine0_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine0_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine1_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine1_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine1_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine2_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine3_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine3_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_engine3_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "max_abs_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 62
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln1488 sc_in sc_lv 32 signal 0 } 
	{ attention_group_address0 sc_out sc_lv 5 signal 1 } 
	{ attention_group_ce0 sc_out sc_logic 1 signal 1 } 
	{ attention_group_we0 sc_out sc_logic 1 signal 1 } 
	{ attention_group_d0 sc_out sc_lv 32 signal 1 } 
	{ weighted_value_engine0_address0 sc_out sc_lv 3 signal 2 } 
	{ weighted_value_engine0_ce0 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_engine0_q0 sc_in sc_lv 32 signal 2 } 
	{ weighted_value_engine0_1_address0 sc_out sc_lv 3 signal 3 } 
	{ weighted_value_engine0_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_engine0_1_q0 sc_in sc_lv 32 signal 3 } 
	{ weighted_value_engine0_2_address0 sc_out sc_lv 3 signal 4 } 
	{ weighted_value_engine0_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ weighted_value_engine0_2_q0 sc_in sc_lv 32 signal 4 } 
	{ weighted_value_engine0_3_address0 sc_out sc_lv 3 signal 5 } 
	{ weighted_value_engine0_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ weighted_value_engine0_3_q0 sc_in sc_lv 32 signal 5 } 
	{ empty sc_in sc_lv 2 signal 6 } 
	{ weighted_value_engine1_address0 sc_out sc_lv 3 signal 7 } 
	{ weighted_value_engine1_ce0 sc_out sc_logic 1 signal 7 } 
	{ weighted_value_engine1_q0 sc_in sc_lv 32 signal 7 } 
	{ weighted_value_engine1_1_address0 sc_out sc_lv 3 signal 8 } 
	{ weighted_value_engine1_1_ce0 sc_out sc_logic 1 signal 8 } 
	{ weighted_value_engine1_1_q0 sc_in sc_lv 32 signal 8 } 
	{ weighted_value_engine1_2_address0 sc_out sc_lv 3 signal 9 } 
	{ weighted_value_engine1_2_ce0 sc_out sc_logic 1 signal 9 } 
	{ weighted_value_engine1_2_q0 sc_in sc_lv 32 signal 9 } 
	{ weighted_value_engine1_3_address0 sc_out sc_lv 3 signal 10 } 
	{ weighted_value_engine1_3_ce0 sc_out sc_logic 1 signal 10 } 
	{ weighted_value_engine1_3_q0 sc_in sc_lv 32 signal 10 } 
	{ weighted_value_engine2_address0 sc_out sc_lv 3 signal 11 } 
	{ weighted_value_engine2_ce0 sc_out sc_logic 1 signal 11 } 
	{ weighted_value_engine2_q0 sc_in sc_lv 32 signal 11 } 
	{ weighted_value_engine2_1_address0 sc_out sc_lv 3 signal 12 } 
	{ weighted_value_engine2_1_ce0 sc_out sc_logic 1 signal 12 } 
	{ weighted_value_engine2_1_q0 sc_in sc_lv 32 signal 12 } 
	{ weighted_value_engine2_2_address0 sc_out sc_lv 3 signal 13 } 
	{ weighted_value_engine2_2_ce0 sc_out sc_logic 1 signal 13 } 
	{ weighted_value_engine2_2_q0 sc_in sc_lv 32 signal 13 } 
	{ weighted_value_engine2_3_address0 sc_out sc_lv 3 signal 14 } 
	{ weighted_value_engine2_3_ce0 sc_out sc_logic 1 signal 14 } 
	{ weighted_value_engine2_3_q0 sc_in sc_lv 32 signal 14 } 
	{ weighted_value_engine3_address0 sc_out sc_lv 3 signal 15 } 
	{ weighted_value_engine3_ce0 sc_out sc_logic 1 signal 15 } 
	{ weighted_value_engine3_q0 sc_in sc_lv 32 signal 15 } 
	{ weighted_value_engine3_1_address0 sc_out sc_lv 3 signal 16 } 
	{ weighted_value_engine3_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ weighted_value_engine3_1_q0 sc_in sc_lv 32 signal 16 } 
	{ weighted_value_engine3_2_address0 sc_out sc_lv 3 signal 17 } 
	{ weighted_value_engine3_2_ce0 sc_out sc_logic 1 signal 17 } 
	{ weighted_value_engine3_2_q0 sc_in sc_lv 32 signal 17 } 
	{ weighted_value_engine3_3_address0 sc_out sc_lv 3 signal 18 } 
	{ weighted_value_engine3_3_ce0 sc_out sc_logic 1 signal 18 } 
	{ weighted_value_engine3_3_q0 sc_in sc_lv 32 signal 18 } 
	{ max_abs_out sc_out sc_lv 32 signal 19 } 
	{ max_abs_out_ap_vld sc_out sc_logic 1 outvld 19 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln1488", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sext_ln1488", "role": "default" }} , 
 	{ "name": "attention_group_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "attention_group", "role": "address0" }} , 
 	{ "name": "attention_group_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_group", "role": "ce0" }} , 
 	{ "name": "attention_group_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "attention_group", "role": "we0" }} , 
 	{ "name": "attention_group_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "attention_group", "role": "d0" }} , 
 	{ "name": "weighted_value_engine0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine0_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine0_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine0_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine0_3", "role": "q0" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "weighted_value_engine1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine1_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine1_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine2_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine2_3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_1", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_2", "role": "q0" }} , 
 	{ "name": "weighted_value_engine3_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "address0" }} , 
 	{ "name": "weighted_value_engine3_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_engine3_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_engine3_3", "role": "q0" }} , 
 	{ "name": "max_abs_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_out", "role": "default" }} , 
 	{ "name": "max_abs_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_49_5_1_U693", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U694", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U695", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U696", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_32_1_1_U697", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		max_abs_out {Type O LastRead -1 FirstWrite 7}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "41", "Max" : "41"}
	, {"Name" : "Interval", "Min" : "41", "Max" : "41"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln1488 { ap_none {  { sext_ln1488 in_data 0 32 } } }
	attention_group { ap_memory {  { attention_group_address0 mem_address 1 5 }  { attention_group_ce0 mem_ce 1 1 }  { attention_group_we0 mem_we 1 1 }  { attention_group_d0 mem_din 1 32 } } }
	weighted_value_engine0 { ap_memory {  { weighted_value_engine0_address0 mem_address 1 3 }  { weighted_value_engine0_ce0 mem_ce 1 1 }  { weighted_value_engine0_q0 in_data 0 32 } } }
	weighted_value_engine0_1 { ap_memory {  { weighted_value_engine0_1_address0 mem_address 1 3 }  { weighted_value_engine0_1_ce0 mem_ce 1 1 }  { weighted_value_engine0_1_q0 in_data 0 32 } } }
	weighted_value_engine0_2 { ap_memory {  { weighted_value_engine0_2_address0 mem_address 1 3 }  { weighted_value_engine0_2_ce0 mem_ce 1 1 }  { weighted_value_engine0_2_q0 in_data 0 32 } } }
	weighted_value_engine0_3 { ap_memory {  { weighted_value_engine0_3_address0 mem_address 1 3 }  { weighted_value_engine0_3_ce0 mem_ce 1 1 }  { weighted_value_engine0_3_q0 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 2 } } }
	weighted_value_engine1 { ap_memory {  { weighted_value_engine1_address0 mem_address 1 3 }  { weighted_value_engine1_ce0 mem_ce 1 1 }  { weighted_value_engine1_q0 in_data 0 32 } } }
	weighted_value_engine1_1 { ap_memory {  { weighted_value_engine1_1_address0 mem_address 1 3 }  { weighted_value_engine1_1_ce0 mem_ce 1 1 }  { weighted_value_engine1_1_q0 in_data 0 32 } } }
	weighted_value_engine1_2 { ap_memory {  { weighted_value_engine1_2_address0 mem_address 1 3 }  { weighted_value_engine1_2_ce0 mem_ce 1 1 }  { weighted_value_engine1_2_q0 in_data 0 32 } } }
	weighted_value_engine1_3 { ap_memory {  { weighted_value_engine1_3_address0 mem_address 1 3 }  { weighted_value_engine1_3_ce0 mem_ce 1 1 }  { weighted_value_engine1_3_q0 in_data 0 32 } } }
	weighted_value_engine2 { ap_memory {  { weighted_value_engine2_address0 mem_address 1 3 }  { weighted_value_engine2_ce0 mem_ce 1 1 }  { weighted_value_engine2_q0 in_data 0 32 } } }
	weighted_value_engine2_1 { ap_memory {  { weighted_value_engine2_1_address0 mem_address 1 3 }  { weighted_value_engine2_1_ce0 mem_ce 1 1 }  { weighted_value_engine2_1_q0 in_data 0 32 } } }
	weighted_value_engine2_2 { ap_memory {  { weighted_value_engine2_2_address0 mem_address 1 3 }  { weighted_value_engine2_2_ce0 mem_ce 1 1 }  { weighted_value_engine2_2_q0 in_data 0 32 } } }
	weighted_value_engine2_3 { ap_memory {  { weighted_value_engine2_3_address0 mem_address 1 3 }  { weighted_value_engine2_3_ce0 mem_ce 1 1 }  { weighted_value_engine2_3_q0 in_data 0 32 } } }
	weighted_value_engine3 { ap_memory {  { weighted_value_engine3_address0 mem_address 1 3 }  { weighted_value_engine3_ce0 mem_ce 1 1 }  { weighted_value_engine3_q0 in_data 0 32 } } }
	weighted_value_engine3_1 { ap_memory {  { weighted_value_engine3_1_address0 mem_address 1 3 }  { weighted_value_engine3_1_ce0 mem_ce 1 1 }  { weighted_value_engine3_1_q0 in_data 0 32 } } }
	weighted_value_engine3_2 { ap_memory {  { weighted_value_engine3_2_address0 mem_address 1 3 }  { weighted_value_engine3_2_ce0 mem_ce 1 1 }  { weighted_value_engine3_2_q0 in_data 0 32 } } }
	weighted_value_engine3_3 { ap_memory {  { weighted_value_engine3_3_address0 mem_address 1 3 }  { weighted_value_engine3_3_ce0 mem_ce 1 1 }  { weighted_value_engine3_3_q0 in_data 0 32 } } }
	max_abs_out { ap_vld {  { max_abs_out out_data 1 32 }  { max_abs_out_ap_vld out_vld 1 1 } } }
}
