set moduleName int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl
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
set C_modelName {int4_dequantize_final_blocks.17_Pipeline_dequant_local_tile_loop_dequant_flat_bl}
set C_modelType { void 0 }
set C_modelArgList {
	{ bound int 20 regular  }
	{ final_block_stream int 128 regular {fifo 1 volatile }  }
	{ sub_i int 15 regular  }
	{ group_stream int 92 regular {fifo 0 volatile }  }
	{ block_count int 14 regular  }
	{ idx1_load int 11 regular  }
	{ replay_scale_stream int 32 regular {fifo 0 volatile }  }
	{ model_scale_cache1 int 512 regular {array 1600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "bound", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "final_block_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sub_i", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "group_stream", "interface" : "fifo", "bitwidth" : 92, "direction" : "READONLY"} , 
 	{ "Name" : "block_count", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "idx1_load", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "replay_scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "model_scale_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ replay_scale_stream_dout sc_in sc_lv 32 signal 6 } 
	{ replay_scale_stream_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ replay_scale_stream_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ replay_scale_stream_empty_n sc_in sc_logic 1 signal 6 } 
	{ replay_scale_stream_read sc_out sc_logic 1 signal 6 } 
	{ group_stream_dout sc_in sc_lv 92 signal 3 } 
	{ group_stream_num_data_valid sc_in sc_lv 7 signal 3 } 
	{ group_stream_fifo_cap sc_in sc_lv 7 signal 3 } 
	{ group_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ group_stream_read sc_out sc_logic 1 signal 3 } 
	{ final_block_stream_din sc_out sc_lv 128 signal 1 } 
	{ final_block_stream_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ final_block_stream_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ final_block_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ final_block_stream_write sc_out sc_logic 1 signal 1 } 
	{ bound sc_in sc_lv 20 signal 0 } 
	{ sub_i sc_in sc_lv 15 signal 2 } 
	{ block_count sc_in sc_lv 14 signal 4 } 
	{ idx1_load sc_in sc_lv 11 signal 5 } 
	{ model_scale_cache1_address0 sc_out sc_lv 11 signal 7 } 
	{ model_scale_cache1_ce0 sc_out sc_logic 1 signal 7 } 
	{ model_scale_cache1_q0 sc_in sc_lv 512 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "replay_scale_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "dout" }} , 
 	{ "name": "replay_scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_scale_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "empty_n" }} , 
 	{ "name": "replay_scale_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "read" }} , 
 	{ "name": "group_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "group_stream", "role": "dout" }} , 
 	{ "name": "group_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "num_data_valid" }} , 
 	{ "name": "group_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "group_stream", "role": "fifo_cap" }} , 
 	{ "name": "group_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "empty_n" }} , 
 	{ "name": "group_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "group_stream", "role": "read" }} , 
 	{ "name": "final_block_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "final_block_stream", "role": "din" }} , 
 	{ "name": "final_block_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "num_data_valid" }} , 
 	{ "name": "final_block_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "fifo_cap" }} , 
 	{ "name": "final_block_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "full_n" }} , 
 	{ "name": "final_block_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "write" }} , 
 	{ "name": "bound", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "bound", "role": "default" }} , 
 	{ "name": "sub_i", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "sub_i", "role": "default" }} , 
 	{ "name": "block_count", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "block_count", "role": "default" }} , 
 	{ "name": "idx1_load", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "idx1_load", "role": "default" }} , 
 	{ "name": "model_scale_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "address0" }} , 
 	{ "name": "model_scale_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "ce0" }} , 
 	{ "name": "model_scale_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_scale_cache1", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl",
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
			{"Name" : "model_scale_cache1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "dequant_local_tile_loop_dequant_flat_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter25", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter25", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partial_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partial_7_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partial_8_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.partial_9_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U2011", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U2012", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U2013", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U2014", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2015", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2016", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2017", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2018", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U2019", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_5_no_dsp_1_U2020", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_5_no_dsp_1_U2021", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_5_no_dsp_1_U2022", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sitofp_32s_32_5_no_dsp_1_U2023", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_dequantize_final_blocks_17_Pipeline_dequant_local_tile_loop_dequant_flat_bl {
		bound {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type O LastRead -1 FirstWrite 25}
		sub_i {Type I LastRead 0 FirstWrite -1}
		group_stream {Type I LastRead 8 FirstWrite -1}
		block_count {Type I LastRead 0 FirstWrite -1}
		idx1_load {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type I LastRead 8 FirstWrite -1}
		model_scale_cache1 {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32793", "Max" : "693529"}
	, {"Name" : "Interval", "Min" : "32793", "Max" : "693529"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	bound { ap_none {  { bound in_data 0 20 } } }
	final_block_stream { ap_fifo {  { final_block_stream_din fifo_data_in 1 128 }  { final_block_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { final_block_stream_fifo_cap fifo_update 0 6 }  { final_block_stream_full_n fifo_status 0 1 }  { final_block_stream_write fifo_port_we 1 1 } } }
	sub_i { ap_none {  { sub_i in_data 0 15 } } }
	group_stream { ap_fifo {  { group_stream_dout fifo_data_in 0 92 }  { group_stream_num_data_valid fifo_status_num_data_valid 0 7 }  { group_stream_fifo_cap fifo_update 0 7 }  { group_stream_empty_n fifo_status 0 1 }  { group_stream_read fifo_port_we 1 1 } } }
	block_count { ap_none {  { block_count in_data 0 14 } } }
	idx1_load { ap_none {  { idx1_load in_data 0 11 } } }
	replay_scale_stream { ap_fifo {  { replay_scale_stream_dout fifo_data_in 0 32 }  { replay_scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_scale_stream_fifo_cap fifo_update 0 3 }  { replay_scale_stream_empty_n fifo_status 0 1 }  { replay_scale_stream_read fifo_port_we 1 1 } } }
	model_scale_cache1 { ap_memory {  { model_scale_cache1_address0 mem_address 1 11 }  { model_scale_cache1_ce0 mem_ce 1 1 }  { model_scale_cache1_q0 mem_dout 0 512 } } }
}
