set moduleName int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l
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
set C_modelName {int4_stream_integer_blocks.3_Pipeline_integer_local_tile_loop_integer_col_tile_l}
set C_modelType { void 0 }
set C_modelArgList {
	{ bound19 int 20 regular  }
	{ weight_stream int 512 regular {fifo 0 volatile }  }
	{ group_stream int 92 regular {fifo 1 volatile }  }
	{ replay_activation_stream int 480 regular {fifo 0 volatile }  }
	{ bound6 int 14 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "bound19", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "weight_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "group_stream", "interface" : "fifo", "bitwidth" : 92, "direction" : "WRITEONLY"} , 
 	{ "Name" : "replay_activation_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "bound6", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ replay_activation_stream_dout sc_in sc_lv 480 signal 3 } 
	{ replay_activation_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ replay_activation_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ replay_activation_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ replay_activation_stream_read sc_out sc_logic 1 signal 3 } 
	{ weight_stream_dout sc_in sc_lv 512 signal 1 } 
	{ weight_stream_num_data_valid sc_in sc_lv 15 signal 1 } 
	{ weight_stream_fifo_cap sc_in sc_lv 15 signal 1 } 
	{ weight_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ weight_stream_read sc_out sc_logic 1 signal 1 } 
	{ group_stream_din sc_out sc_lv 92 signal 2 } 
	{ group_stream_num_data_valid sc_in sc_lv 7 signal 2 } 
	{ group_stream_fifo_cap sc_in sc_lv 7 signal 2 } 
	{ group_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ group_stream_write sc_out sc_logic 1 signal 2 } 
	{ bound19 sc_in sc_lv 20 signal 0 } 
	{ bound6 sc_in sc_lv 14 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "replay_activation_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "dout" }} , 
 	{ "name": "replay_activation_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_activation_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_activation_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "empty_n" }} , 
 	{ "name": "replay_activation_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "read" }} , 
 	{ "name": "weight_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "weight_stream", "role": "dout" }} , 
 	{ "name": "weight_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "weight_stream", "role": "num_data_valid" }} , 
 	{ "name": "weight_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "weight_stream", "role": "fifo_cap" }} , 
 	{ "name": "weight_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_stream", "role": "empty_n" }} , 
 	{ "name": "weight_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_stream", "role": "read" }} , 
 	{ "name": "group_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "group_stream", "role": "din" }} , 
 	{ "name": "group_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "num_data_valid" }} , 
 	{ "name": "group_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "fifo_cap" }} , 
 	{ "name": "group_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "full_n" }} , 
 	{ "name": "group_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "write" }} , 
 	{ "name": "bound19", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "bound19", "role": "default" }} , 
 	{ "name": "bound6", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "bound6", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129"],
		"CDFG" : "int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l",
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2164", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2165", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2166", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2167", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2168", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2169", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2170", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2171", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2172", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2173", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2174", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2175", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2176", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2177", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2178", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2179", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2180", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2181", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2182", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2183", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2184", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2185", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2186", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2187", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2188", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2189", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2190", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2191", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2192", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2193", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2194", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2195", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2196", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2197", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2198", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2199", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2200", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2201", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2202", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2203", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2204", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2205", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2206", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2207", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2208", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2209", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2210", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2211", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2212", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2213", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2214", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2215", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2216", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2217", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2218", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2219", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2220", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2221", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2222", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2223", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2224", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2225", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2226", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2227", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2228", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2229", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2230", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2231", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2232", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2233", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2234", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2235", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2236", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2237", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2238", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2239", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2240", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2241", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2242", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2243", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2244", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2245", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2246", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_27s_15s_42_5_1_U2247", "Parent" : "0"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2248", "Parent" : "0"},
	{"ID" : "86", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2249", "Parent" : "0"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2250", "Parent" : "0"},
	{"ID" : "88", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.add_27ns_27s_27_2_1_U2251", "Parent" : "0"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2252", "Parent" : "0"},
	{"ID" : "90", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2253", "Parent" : "0"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2254", "Parent" : "0"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2255", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2256", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2257", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2258", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2259", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2260", "Parent" : "0"},
	{"ID" : "98", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2261", "Parent" : "0"},
	{"ID" : "99", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2262", "Parent" : "0"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2263", "Parent" : "0"},
	{"ID" : "101", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2264", "Parent" : "0"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2265", "Parent" : "0"},
	{"ID" : "103", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2266", "Parent" : "0"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2267", "Parent" : "0"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2268", "Parent" : "0"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2269", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2270", "Parent" : "0"},
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2271", "Parent" : "0"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2272", "Parent" : "0"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2273", "Parent" : "0"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2274", "Parent" : "0"},
	{"ID" : "112", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2275", "Parent" : "0"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2276", "Parent" : "0"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2277", "Parent" : "0"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2278", "Parent" : "0"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_43_5_1_U2279", "Parent" : "0"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2280", "Parent" : "0"},
	{"ID" : "118", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2281", "Parent" : "0"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_44_5_1_U2282", "Parent" : "0"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_43s_44_5_1_U2283", "Parent" : "0"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_44s_45_5_1_U2284", "Parent" : "0"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_44s_45_5_1_U2285", "Parent" : "0"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2286", "Parent" : "0"},
	{"ID" : "124", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2287", "Parent" : "0"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2288", "Parent" : "0"},
	{"ID" : "126", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_42s_43_5_1_U2289", "Parent" : "0"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_45s_46_5_1_U2290", "Parent" : "0"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_27s_15s_45s_46_5_1_U2291", "Parent" : "0"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32786", "Max" : "693522"}
	, {"Name" : "Interval", "Min" : "32786", "Max" : "693522"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	bound19 { ap_none {  { bound19 in_data 0 20 } } }
	weight_stream { ap_fifo {  { weight_stream_dout fifo_data_in 0 512 }  { weight_stream_num_data_valid fifo_status_num_data_valid 0 15 }  { weight_stream_fifo_cap fifo_update 0 15 }  { weight_stream_empty_n fifo_status 0 1 }  { weight_stream_read fifo_port_we 1 1 } } }
	group_stream { ap_fifo {  { group_stream_din fifo_data_in 1 92 }  { group_stream_num_data_valid fifo_status_num_data_valid 0 7 }  { group_stream_fifo_cap fifo_update 0 7 }  { group_stream_full_n fifo_status 0 1 }  { group_stream_write fifo_port_we 1 1 } } }
	replay_activation_stream { ap_fifo {  { replay_activation_stream_dout fifo_data_in 0 480 }  { replay_activation_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_activation_stream_fifo_cap fifo_update 0 3 }  { replay_activation_stream_empty_n fifo_status 0 1 }  { replay_activation_stream_read fifo_port_we 1 1 } } }
	bound6 { ap_none {  { bound6 in_data 0 14 } } }
}
