set moduleName int4_cache_and_replay_activation_3_s
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
set C_modelName {int4_cache_and_replay_activation<3>}
set C_modelType { void 0 }
set C_modelArgList {
	{ quantized_pe3 int 480 regular {fifo 0 volatile }  }
	{ activation_scale_pe3 int 32 regular {fifo 0 volatile }  }
	{ replay_activation_stream int 480 regular {fifo 1 volatile }  }
	{ replay_scale_stream int 32 regular {fifo 1 volatile }  }
	{ p_read int 6 regular  }
	{ p_read1 int 6 regular  }
	{ input_tiles_loc_c16 int 6 regular {fifo 1}  }
	{ local_tiles_loc_c20 int 6 regular {fifo 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "activation_scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "replay_activation_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "replay_scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles_loc_c16", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_loc_c20", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 39
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ quantized_pe3_dout sc_in sc_lv 480 signal 0 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ quantized_pe3_empty_n sc_in sc_logic 1 signal 0 } 
	{ quantized_pe3_read sc_out sc_logic 1 signal 0 } 
	{ activation_scale_pe3_dout sc_in sc_lv 32 signal 1 } 
	{ activation_scale_pe3_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ activation_scale_pe3_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ activation_scale_pe3_empty_n sc_in sc_logic 1 signal 1 } 
	{ activation_scale_pe3_read sc_out sc_logic 1 signal 1 } 
	{ replay_activation_stream_din sc_out sc_lv 480 signal 2 } 
	{ replay_activation_stream_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ replay_activation_stream_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ replay_activation_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ replay_activation_stream_write sc_out sc_logic 1 signal 2 } 
	{ replay_scale_stream_din sc_out sc_lv 32 signal 3 } 
	{ replay_scale_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ replay_scale_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ replay_scale_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ replay_scale_stream_write sc_out sc_logic 1 signal 3 } 
	{ p_read sc_in sc_lv 6 signal 4 } 
	{ p_read1 sc_in sc_lv 6 signal 5 } 
	{ input_tiles_loc_c16_din sc_out sc_lv 6 signal 6 } 
	{ input_tiles_loc_c16_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ input_tiles_loc_c16_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ input_tiles_loc_c16_full_n sc_in sc_logic 1 signal 6 } 
	{ input_tiles_loc_c16_write sc_out sc_logic 1 signal 6 } 
	{ local_tiles_loc_c20_din sc_out sc_lv 6 signal 7 } 
	{ local_tiles_loc_c20_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ local_tiles_loc_c20_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ local_tiles_loc_c20_full_n sc_in sc_logic 1 signal 7 } 
	{ local_tiles_loc_c20_write sc_out sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "quantized_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "dout" }} , 
 	{ "name": "quantized_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "empty_n" }} , 
 	{ "name": "quantized_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "read" }} , 
 	{ "name": "activation_scale_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "dout" }} , 
 	{ "name": "activation_scale_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "empty_n" }} , 
 	{ "name": "activation_scale_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe3", "role": "read" }} , 
 	{ "name": "replay_activation_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "din" }} , 
 	{ "name": "replay_activation_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_activation_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_activation_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "full_n" }} , 
 	{ "name": "replay_activation_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "write" }} , 
 	{ "name": "replay_scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "din" }} , 
 	{ "name": "replay_scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "full_n" }} , 
 	{ "name": "replay_scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "write" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "input_tiles_loc_c16_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_tiles_loc_c16", "role": "din" }} , 
 	{ "name": "input_tiles_loc_c16_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc_c16", "role": "num_data_valid" }} , 
 	{ "name": "input_tiles_loc_c16_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_tiles_loc_c16", "role": "fifo_cap" }} , 
 	{ "name": "input_tiles_loc_c16_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc_c16", "role": "full_n" }} , 
 	{ "name": "input_tiles_loc_c16_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_tiles_loc_c16", "role": "write" }} , 
 	{ "name": "local_tiles_loc_c20_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_loc_c20", "role": "din" }} , 
 	{ "name": "local_tiles_loc_c20_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c20", "role": "num_data_valid" }} , 
 	{ "name": "local_tiles_loc_c20_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c20", "role": "fifo_cap" }} , 
 	{ "name": "local_tiles_loc_c20_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c20", "role": "full_n" }} , 
 	{ "name": "local_tiles_loc_c20_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c20", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "5", "7"],
		"CDFG" : "int4_cache_and_replay_activation_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1161", "EstimateLatencyMax" : "22025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "quantized_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Port" : "activation_scale_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_activation_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Port" : "replay_scale_stream", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "input_tiles_loc_c16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_c16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c20_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.activation_cache_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.scale_cache_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop_fu_100.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_fu_111.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_6ns_9ns_15_1_1_U2449", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_cache_and_replay_activation_3_s {
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_scale_pe3 {Type I LastRead 1 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc_c16 {Type O LastRead -1 FirstWrite 0}
		local_tiles_loc_c20 {Type O LastRead -1 FirstWrite 0}}
	int4_cache_and_replay_activation_3_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1161", "Max" : "22025"}
	, {"Name" : "Interval", "Min" : "1161", "Max" : "22025"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	quantized_pe3 { ap_fifo {  { quantized_pe3_dout fifo_data_in 0 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_empty_n fifo_status 0 1 }  { quantized_pe3_read fifo_port_we 1 1 } } }
	activation_scale_pe3 { ap_fifo {  { activation_scale_pe3_dout fifo_data_in 0 32 }  { activation_scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe3_fifo_cap fifo_update 0 3 }  { activation_scale_pe3_empty_n fifo_status 0 1 }  { activation_scale_pe3_read fifo_port_we 1 1 } } }
	replay_activation_stream { ap_fifo {  { replay_activation_stream_din fifo_data_in 1 480 }  { replay_activation_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_activation_stream_fifo_cap fifo_update 0 3 }  { replay_activation_stream_full_n fifo_status 0 1 }  { replay_activation_stream_write fifo_port_we 1 1 } } }
	replay_scale_stream { ap_fifo {  { replay_scale_stream_din fifo_data_in 1 32 }  { replay_scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_scale_stream_fifo_cap fifo_update 0 3 }  { replay_scale_stream_full_n fifo_status 0 1 }  { replay_scale_stream_write fifo_port_we 1 1 } } }
	p_read { ap_none {  { p_read in_data 0 6 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 6 } } }
	input_tiles_loc_c16 { ap_fifo {  { input_tiles_loc_c16_din fifo_data_in 1 6 }  { input_tiles_loc_c16_num_data_valid fifo_status_num_data_valid 0 3 }  { input_tiles_loc_c16_fifo_cap fifo_update 0 3 }  { input_tiles_loc_c16_full_n fifo_status 0 1 }  { input_tiles_loc_c16_write fifo_port_we 1 1 } } }
	local_tiles_loc_c20 { ap_fifo {  { local_tiles_loc_c20_din fifo_data_in 1 6 }  { local_tiles_loc_c20_num_data_valid fifo_status_num_data_valid 0 3 }  { local_tiles_loc_c20_fifo_cap fifo_update 0 3 }  { local_tiles_loc_c20_full_n fifo_status 0 1 }  { local_tiles_loc_c20_write fifo_port_we 1 1 } } }
}
