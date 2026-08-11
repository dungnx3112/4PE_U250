set moduleName int4_stream_integer_blocks_3
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
set C_modelName {int4_stream_integer_blocks.3}
set C_modelType { void 0 }
set C_modelArgList {
	{ weight_stream int 512 regular {fifo 0 volatile }  }
	{ replay_activation_stream int 480 regular {fifo 0 volatile }  }
	{ group_stream int 92 regular {fifo 1 volatile }  }
	{ local_tiles_loc int 6 regular {fifo 0}  }
	{ input_tiles_loc int 6 regular {fifo 0}  }
	{ input_tiles_loc_c int 6 regular {fifo 1}  }
	{ local_tiles_loc_c19 int 6 regular {fifo 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weight_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "replay_activation_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "group_stream", "interface" : "fifo", "bitwidth" : 92, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_loc", "interface" : "fifo", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles_loc", "interface" : "fifo", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles_loc_c", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_loc_c19", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 42
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weight_stream_dout sc_in sc_lv 512 signal 0 } 
	{ weight_stream_num_data_valid sc_in sc_lv 15 signal 0 } 
	{ weight_stream_fifo_cap sc_in sc_lv 15 signal 0 } 
	{ weight_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ weight_stream_read sc_out sc_logic 1 signal 0 } 
	{ replay_activation_stream_dout sc_in sc_lv 480 signal 1 } 
	{ replay_activation_stream_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ replay_activation_stream_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ replay_activation_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ replay_activation_stream_read sc_out sc_logic 1 signal 1 } 
	{ group_stream_din sc_out sc_lv 92 signal 2 } 
	{ group_stream_num_data_valid sc_in sc_lv 7 signal 2 } 
	{ group_stream_fifo_cap sc_in sc_lv 7 signal 2 } 
	{ group_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ group_stream_write sc_out sc_logic 1 signal 2 } 
	{ local_tiles_loc_dout sc_in sc_lv 6 signal 3 } 
	{ local_tiles_loc_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ local_tiles_loc_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ local_tiles_loc_empty_n sc_in sc_logic 1 signal 3 } 
	{ local_tiles_loc_read sc_out sc_logic 1 signal 3 } 
	{ input_tiles_loc_dout sc_in sc_lv 6 signal 4 } 
	{ input_tiles_loc_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ input_tiles_loc_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ input_tiles_loc_empty_n sc_in sc_logic 1 signal 4 } 
	{ input_tiles_loc_read sc_out sc_logic 1 signal 4 } 
	{ input_tiles_loc_c_din sc_out sc_lv 6 signal 5 } 
	{ input_tiles_loc_c_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ input_tiles_loc_c_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ input_tiles_loc_c_full_n sc_in sc_logic 1 signal 5 } 
	{ input_tiles_loc_c_write sc_out sc_logic 1 signal 5 } 
	{ local_tiles_loc_c19_din sc_out sc_lv 6 signal 6 } 
	{ local_tiles_loc_c19_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ local_tiles_loc_c19_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ local_tiles_loc_c19_full_n sc_in sc_logic 1 signal 6 } 
	{ local_tiles_loc_c19_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weight_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "weight_stream", "role": "dout" }} , 
 	{ "name": "weight_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "weight_stream", "role": "num_data_valid" }} , 
 	{ "name": "weight_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "weight_stream", "role": "fifo_cap" }} , 
 	{ "name": "weight_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_stream", "role": "empty_n" }} , 
 	{ "name": "weight_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_stream", "role": "read" }} , 
 	{ "name": "replay_activation_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "dout" }} , 
 	{ "name": "replay_activation_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_activation_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_activation_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "empty_n" }} , 
 	{ "name": "replay_activation_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "read" }} , 
 	{ "name": "group_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "group_stream", "role": "din" }} , 
 	{ "name": "group_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "num_data_valid" }} , 
 	{ "name": "group_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "fifo_cap" }} , 
 	{ "name": "group_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "full_n" }} , 
 	{ "name": "group_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "write" }} , 
 	{ "name": "local_tiles_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_loc", "role": "dout" }} , 
 	{ "name": "local_tiles_loc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc", "role": "num_data_valid" }} , 
 	{ "name": "local_tiles_loc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc", "role": "fifo_cap" }} , 
 	{ "name": "local_tiles_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc", "role": "empty_n" }} , 
 	{ "name": "local_tiles_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc", "role": "read" }} , 
 	{ "name": "input_tiles_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_tiles_loc", "role": "dout" }} , 
 	{ "name": "input_tiles_loc_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc", "role": "num_data_valid" }} , 
 	{ "name": "input_tiles_loc_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc", "role": "fifo_cap" }} , 
 	{ "name": "input_tiles_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc", "role": "empty_n" }} , 
 	{ "name": "input_tiles_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc", "role": "read" }} , 
 	{ "name": "input_tiles_loc_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_tiles_loc_c", "role": "din" }} , 
 	{ "name": "input_tiles_loc_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc_c", "role": "num_data_valid" }} , 
 	{ "name": "input_tiles_loc_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc_c", "role": "fifo_cap" }} , 
 	{ "name": "input_tiles_loc_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc_c", "role": "full_n" }} , 
 	{ "name": "input_tiles_loc_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc_c", "role": "write" }} , 
 	{ "name": "local_tiles_loc_c19_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_loc_c19", "role": "din" }} , 
 	{ "name": "local_tiles_loc_c19_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c19", "role": "num_data_valid" }} , 
 	{ "name": "local_tiles_loc_c19_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c19", "role": "fifo_cap" }} , 
 	{ "name": "local_tiles_loc_c19_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c19", "role": "full_n" }} , 
 	{ "name": "local_tiles_loc_c19_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c19", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "131"],
		"CDFG" : "int4_stream_integer_blocks_3",
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
			{"Name" : "weight_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16384", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "weight_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "replay_activation_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Port" : "group_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c19_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2164", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2165", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2166", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2167", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2168", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2169", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2170", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2171", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2172", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2173", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2174", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2175", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2176", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2177", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2178", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2179", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2180", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2181", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2182", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2183", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2184", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2185", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2186", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2187", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2188", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2189", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2190", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2191", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2192", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2193", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2194", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2195", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2196", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2197", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2198", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2199", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2200", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2201", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2202", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2203", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2204", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2205", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2206", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2207", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2208", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2209", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2210", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2211", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2212", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2213", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2214", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2215", "Parent" : "1"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2216", "Parent" : "1"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2217", "Parent" : "1"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2218", "Parent" : "1"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2219", "Parent" : "1"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2220", "Parent" : "1"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2221", "Parent" : "1"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2222", "Parent" : "1"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2223", "Parent" : "1"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2224", "Parent" : "1"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2225", "Parent" : "1"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2226", "Parent" : "1"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2227", "Parent" : "1"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2228", "Parent" : "1"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2229", "Parent" : "1"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2230", "Parent" : "1"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2231", "Parent" : "1"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2232", "Parent" : "1"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2233", "Parent" : "1"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2234", "Parent" : "1"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2235", "Parent" : "1"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2236", "Parent" : "1"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2237", "Parent" : "1"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2238", "Parent" : "1"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2239", "Parent" : "1"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2240", "Parent" : "1"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2241", "Parent" : "1"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2242", "Parent" : "1"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2243", "Parent" : "1"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2244", "Parent" : "1"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2245", "Parent" : "1"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2246", "Parent" : "1"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mul_27s_15s_42_5_1_U2247", "Parent" : "1"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2248", "Parent" : "1"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2249", "Parent" : "1"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2250", "Parent" : "1"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.add_27ns_27s_27_2_1_U2251", "Parent" : "1"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2252", "Parent" : "1"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2253", "Parent" : "1"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2254", "Parent" : "1"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2255", "Parent" : "1"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2256", "Parent" : "1"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2257", "Parent" : "1"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2258", "Parent" : "1"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2259", "Parent" : "1"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2260", "Parent" : "1"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2261", "Parent" : "1"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2262", "Parent" : "1"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2263", "Parent" : "1"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2264", "Parent" : "1"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2265", "Parent" : "1"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2266", "Parent" : "1"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2267", "Parent" : "1"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2268", "Parent" : "1"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2269", "Parent" : "1"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2270", "Parent" : "1"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2271", "Parent" : "1"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2272", "Parent" : "1"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2273", "Parent" : "1"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2274", "Parent" : "1"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2275", "Parent" : "1"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2276", "Parent" : "1"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2277", "Parent" : "1"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2278", "Parent" : "1"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_43_5_1_U2279", "Parent" : "1"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2280", "Parent" : "1"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2281", "Parent" : "1"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2282", "Parent" : "1"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_43s_44_5_1_U2283", "Parent" : "1"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2284", "Parent" : "1"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_44s_45_5_1_U2285", "Parent" : "1"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2286", "Parent" : "1"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2287", "Parent" : "1"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2288", "Parent" : "1"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_42s_43_5_1_U2289", "Parent" : "1"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2290", "Parent" : "1"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.mac_muladd_27s_15s_45s_46_5_1_U2291", "Parent" : "1"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l_fu_86.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_6ns_14ns_20_1_1_U2297", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_stream_integer_blocks_3 {
		weight_stream {Type I LastRead 2 FirstWrite -1}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c19 {Type O LastRead -1 FirstWrite 0}}
	int4_stream_integer_blocks_3_Pipeline_integer_local_tile_loop_integer_col_tile_l {
		bound19 {Type I LastRead 0 FirstWrite -1}
		weight_stream {Type I LastRead 2 FirstWrite -1}
		group_stream {Type O LastRead -1 FirstWrite 18}
		replay_activation_stream {Type I LastRead 2 FirstWrite -1}
		bound6 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32789", "Max" : "693525"}
	, {"Name" : "Interval", "Min" : "32789", "Max" : "693525"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weight_stream { ap_fifo {  { weight_stream_dout fifo_data_in 0 512 }  { weight_stream_num_data_valid fifo_status_num_data_valid 0 15 }  { weight_stream_fifo_cap fifo_update 0 15 }  { weight_stream_empty_n fifo_status 0 1 }  { weight_stream_read fifo_port_we 1 1 } } }
	replay_activation_stream { ap_fifo {  { replay_activation_stream_dout fifo_data_in 0 480 }  { replay_activation_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_activation_stream_fifo_cap fifo_update 0 3 }  { replay_activation_stream_empty_n fifo_status 0 1 }  { replay_activation_stream_read fifo_port_we 1 1 } } }
	group_stream { ap_fifo {  { group_stream_din fifo_data_in 1 92 }  { group_stream_num_data_valid fifo_status_num_data_valid 0 7 }  { group_stream_fifo_cap fifo_update 0 7 }  { group_stream_full_n fifo_status 0 1 }  { group_stream_write fifo_port_we 1 1 } } }
	local_tiles_loc { ap_fifo {  { local_tiles_loc_dout fifo_data_in 0 6 }  { local_tiles_loc_num_data_valid fifo_status_num_data_valid 0 3 }  { local_tiles_loc_fifo_cap fifo_update 0 3 }  { local_tiles_loc_empty_n fifo_status 0 1 }  { local_tiles_loc_read fifo_port_we 1 1 } } }
	input_tiles_loc { ap_fifo {  { input_tiles_loc_dout fifo_data_in 0 6 }  { input_tiles_loc_num_data_valid fifo_status_num_data_valid 0 3 }  { input_tiles_loc_fifo_cap fifo_update 0 3 }  { input_tiles_loc_empty_n fifo_status 0 1 }  { input_tiles_loc_read fifo_port_we 1 1 } } }
	input_tiles_loc_c { ap_fifo {  { input_tiles_loc_c_din fifo_data_in 1 6 }  { input_tiles_loc_c_num_data_valid fifo_status_num_data_valid 0 3 }  { input_tiles_loc_c_fifo_cap fifo_update 0 3 }  { input_tiles_loc_c_full_n fifo_status 0 1 }  { input_tiles_loc_c_write fifo_port_we 1 1 } } }
	local_tiles_loc_c19 { ap_fifo {  { local_tiles_loc_c19_din fifo_data_in 1 6 }  { local_tiles_loc_c19_num_data_valid fifo_status_num_data_valid 0 3 }  { local_tiles_loc_c19_fifo_cap fifo_update 0 3 }  { local_tiles_loc_c19_full_n fifo_status 0 1 }  { local_tiles_loc_c19_write fifo_port_we 1 1 } } }
}
