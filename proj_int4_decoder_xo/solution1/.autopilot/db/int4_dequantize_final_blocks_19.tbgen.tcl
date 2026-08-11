set moduleName int4_dequantize_final_blocks_19
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
set C_modelName {int4_dequantize_final_blocks.19}
set C_modelType { void 0 }
set C_modelArgList {
	{ group_stream int 92 regular {fifo 0 volatile }  }
	{ replay_scale_stream int 32 regular {fifo 0 volatile }  }
	{ final_block_stream int 128 regular {fifo 1 volatile }  }
	{ local_tiles_loc int 6 regular {fifo 0}  }
	{ input_tiles_loc int 6 regular {fifo 0}  }
	{ idx1 int 11 regular {fifo 0}  }
	{ local_tiles_loc_c18 int 6 regular {fifo 1}  }
	{ model_scale_cache2 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "group_stream", "interface" : "fifo", "bitwidth" : 92, "direction" : "READONLY"} , 
 	{ "Name" : "replay_scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "final_block_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_loc", "interface" : "fifo", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles_loc", "interface" : "fifo", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "idx1", "interface" : "fifo", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_loc_c18", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "model_scale_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 45
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ group_stream_dout sc_in sc_lv 92 signal 0 } 
	{ group_stream_num_data_valid sc_in sc_lv 7 signal 0 } 
	{ group_stream_fifo_cap sc_in sc_lv 7 signal 0 } 
	{ group_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ group_stream_read sc_out sc_logic 1 signal 0 } 
	{ replay_scale_stream_dout sc_in sc_lv 32 signal 1 } 
	{ replay_scale_stream_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ replay_scale_stream_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ replay_scale_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ replay_scale_stream_read sc_out sc_logic 1 signal 1 } 
	{ final_block_stream_din sc_out sc_lv 128 signal 2 } 
	{ final_block_stream_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ final_block_stream_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ final_block_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ final_block_stream_write sc_out sc_logic 1 signal 2 } 
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
	{ idx1_dout sc_in sc_lv 11 signal 5 } 
	{ idx1_num_data_valid sc_in sc_lv 4 signal 5 } 
	{ idx1_fifo_cap sc_in sc_lv 4 signal 5 } 
	{ idx1_empty_n sc_in sc_logic 1 signal 5 } 
	{ idx1_read sc_out sc_logic 1 signal 5 } 
	{ local_tiles_loc_c18_din sc_out sc_lv 6 signal 6 } 
	{ local_tiles_loc_c18_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ local_tiles_loc_c18_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ local_tiles_loc_c18_full_n sc_in sc_logic 1 signal 6 } 
	{ local_tiles_loc_c18_write sc_out sc_logic 1 signal 6 } 
	{ model_scale_cache2_address0 sc_out sc_lv 11 signal 7 } 
	{ model_scale_cache2_ce0 sc_out sc_logic 1 signal 7 } 
	{ model_scale_cache2_q0 sc_in sc_lv 512 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "group_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "group_stream", "role": "dout" }} , 
 	{ "name": "group_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "num_data_valid" }} , 
 	{ "name": "group_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "fifo_cap" }} , 
 	{ "name": "group_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "empty_n" }} , 
 	{ "name": "group_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "read" }} , 
 	{ "name": "replay_scale_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "dout" }} , 
 	{ "name": "replay_scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_scale_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "empty_n" }} , 
 	{ "name": "replay_scale_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "read" }} , 
 	{ "name": "final_block_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "final_block_stream", "role": "din" }} , 
 	{ "name": "final_block_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "num_data_valid" }} , 
 	{ "name": "final_block_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "fifo_cap" }} , 
 	{ "name": "final_block_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "full_n" }} , 
 	{ "name": "final_block_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "write" }} , 
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
 	{ "name": "idx1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "idx1", "role": "dout" }} , 
 	{ "name": "idx1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx1", "role": "num_data_valid" }} , 
 	{ "name": "idx1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "idx1", "role": "fifo_cap" }} , 
 	{ "name": "idx1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx1", "role": "empty_n" }} , 
 	{ "name": "idx1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx1", "role": "read" }} , 
 	{ "name": "local_tiles_loc_c18_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_loc_c18", "role": "din" }} , 
 	{ "name": "local_tiles_loc_c18_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c18", "role": "num_data_valid" }} , 
 	{ "name": "local_tiles_loc_c18_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "local_tiles_loc_c18", "role": "fifo_cap" }} , 
 	{ "name": "local_tiles_loc_c18_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c18", "role": "full_n" }} , 
 	{ "name": "local_tiles_loc_c18_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_tiles_loc_c18", "role": "write" }} , 
 	{ "name": "model_scale_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "address0" }} , 
 	{ "name": "model_scale_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "ce0" }} , 
 	{ "name": "model_scale_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache2", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "20"],
		"CDFG" : "int4_dequantize_final_blocks_19",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32795", "EstimateLatencyMax" : "693531",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "64", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "group_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "replay_scale_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "final_block_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "local_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_tiles_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "input_tiles_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "5", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_loc_c18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "local_tiles_loc_c18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Port" : "model_scale_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"],
		"CDFG" : "int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32793", "EstimateLatencyMax" : "693529",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bound", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sub_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "group_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "group_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "block_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "model_scale_cache2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_4_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_5_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.partial_6_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2305", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2306", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2307", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fadd_32ns_32ns_32_7_full_dsp_1_U2308", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2309", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2310", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2311", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2312", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.fmul_32ns_32ns_32_4_max_dsp_1_U2313", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2314", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2315", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2316", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.sitofp_32s_32_5_no_dsp_1_U2317", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl_fu_90.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_6ns_14ns_20_1_1_U2326", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_dequantize_final_blocks_19 {
		group_stream {Type I LastRead 8 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		local_tiles_loc {Type I LastRead 0 FirstWrite -1}
		input_tiles_loc {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_loc_c18 {Type O LastRead -1 FirstWrite 0}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}}
	int4_dequantize_final_blocks_19_Pipeline_dequant_local_tile_loop_dequant_flat_bl {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache2 {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32795", "Max" : "693531"}
	, {"Name" : "Interval", "Min" : "32795", "Max" : "693531"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	group_stream { ap_fifo {  { group_stream_dout fifo_data_in 0 92 }  { group_stream_num_data_valid fifo_status_num_data_valid 0 7 }  { group_stream_fifo_cap fifo_update 0 7 }  { group_stream_empty_n fifo_status 0 1 }  { group_stream_read fifo_port_we 1 1 } } }
	replay_scale_stream { ap_fifo {  { replay_scale_stream_dout fifo_data_in 0 32 }  { replay_scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_scale_stream_fifo_cap fifo_update 0 3 }  { replay_scale_stream_empty_n fifo_status 0 1 }  { replay_scale_stream_read fifo_port_we 1 1 } } }
	final_block_stream { ap_fifo {  { final_block_stream_din fifo_data_in 1 128 }  { final_block_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { final_block_stream_fifo_cap fifo_update 0 6 }  { final_block_stream_full_n fifo_status 0 1 }  { final_block_stream_write fifo_port_we 1 1 } } }
	local_tiles_loc { ap_fifo {  { local_tiles_loc_dout fifo_data_in 0 6 }  { local_tiles_loc_num_data_valid fifo_status_num_data_valid 0 3 }  { local_tiles_loc_fifo_cap fifo_update 0 3 }  { local_tiles_loc_empty_n fifo_status 0 1 }  { local_tiles_loc_read fifo_port_we 1 1 } } }
	input_tiles_loc { ap_fifo {  { input_tiles_loc_dout fifo_data_in 0 6 }  { input_tiles_loc_num_data_valid fifo_status_num_data_valid 0 3 }  { input_tiles_loc_fifo_cap fifo_update 0 3 }  { input_tiles_loc_empty_n fifo_status 0 1 }  { input_tiles_loc_read fifo_port_we 1 1 } } }
	idx1 { ap_fifo {  { idx1_dout fifo_data_in 0 11 }  { idx1_num_data_valid fifo_status_num_data_valid 0 4 }  { idx1_fifo_cap fifo_update 0 4 }  { idx1_empty_n fifo_status 0 1 }  { idx1_read fifo_port_we 1 1 } } }
	local_tiles_loc_c18 { ap_fifo {  { local_tiles_loc_c18_din fifo_data_in 1 6 }  { local_tiles_loc_c18_num_data_valid fifo_status_num_data_valid 0 3 }  { local_tiles_loc_c18_fifo_cap fifo_update 0 3 }  { local_tiles_loc_c18_full_n fifo_status 0 1 }  { local_tiles_loc_c18_write fifo_port_we 1 1 } } }
	model_scale_cache2 { ap_memory {  { model_scale_cache2_address0 mem_address 1 11 }  { model_scale_cache2_ce0 mem_ce 1 1 }  { model_scale_cache2_q0 mem_dout 0 512 } } }
}
