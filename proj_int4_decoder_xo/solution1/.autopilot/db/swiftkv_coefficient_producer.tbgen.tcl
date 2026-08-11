set moduleName swiftkv_coefficient_producer
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
set C_modelName {swiftkv_coefficient_producer}
set C_modelType { void 0 }
set C_modelArgList {
	{ score_stream int 32 regular {fifo 0 volatile }  }
	{ position int 12 regular {fifo 0}  }
	{ control_stream int 19 regular {fifo 1 volatile }  }
	{ inverse_normalization_stream int 32 regular {fifo 1 volatile }  }
	{ position_val_c int 12 regular {fifo 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "score_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "position", "interface" : "fifo", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "control_stream", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "inverse_normalization_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "position_val_c", "interface" : "fifo", "bitwidth" : 12, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ score_stream_dout sc_in sc_lv 32 signal 0 } 
	{ score_stream_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ score_stream_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ score_stream_empty_n sc_in sc_logic 1 signal 0 } 
	{ score_stream_read sc_out sc_logic 1 signal 0 } 
	{ position_dout sc_in sc_lv 12 signal 1 } 
	{ position_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ position_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ position_empty_n sc_in sc_logic 1 signal 1 } 
	{ position_read sc_out sc_logic 1 signal 1 } 
	{ control_stream_din sc_out sc_lv 19 signal 2 } 
	{ control_stream_num_data_valid sc_in sc_lv 5 signal 2 } 
	{ control_stream_fifo_cap sc_in sc_lv 5 signal 2 } 
	{ control_stream_full_n sc_in sc_logic 1 signal 2 } 
	{ control_stream_write sc_out sc_logic 1 signal 2 } 
	{ inverse_normalization_stream_din sc_out sc_lv 32 signal 3 } 
	{ inverse_normalization_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ inverse_normalization_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ inverse_normalization_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ inverse_normalization_stream_write sc_out sc_logic 1 signal 3 } 
	{ position_val_c_din sc_out sc_lv 12 signal 4 } 
	{ position_val_c_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ position_val_c_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ position_val_c_full_n sc_in sc_logic 1 signal 4 } 
	{ position_val_c_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "score_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "score_stream", "role": "dout" }} , 
 	{ "name": "score_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "score_stream", "role": "num_data_valid" }} , 
 	{ "name": "score_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "score_stream", "role": "fifo_cap" }} , 
 	{ "name": "score_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "score_stream", "role": "empty_n" }} , 
 	{ "name": "score_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "score_stream", "role": "read" }} , 
 	{ "name": "position_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position", "role": "dout" }} , 
 	{ "name": "position_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position", "role": "num_data_valid" }} , 
 	{ "name": "position_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position", "role": "fifo_cap" }} , 
 	{ "name": "position_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position", "role": "empty_n" }} , 
 	{ "name": "position_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position", "role": "read" }} , 
 	{ "name": "control_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "control_stream", "role": "din" }} , 
 	{ "name": "control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "num_data_valid" }} , 
 	{ "name": "control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "fifo_cap" }} , 
 	{ "name": "control_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "full_n" }} , 
 	{ "name": "control_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "write" }} , 
 	{ "name": "inverse_normalization_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "din" }} , 
 	{ "name": "inverse_normalization_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "num_data_valid" }} , 
 	{ "name": "inverse_normalization_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "fifo_cap" }} , 
 	{ "name": "inverse_normalization_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "full_n" }} , 
 	{ "name": "inverse_normalization_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inverse_normalization_stream", "role": "write" }} , 
 	{ "name": "position_val_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val_c", "role": "din" }} , 
 	{ "name": "position_val_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position_val_c", "role": "num_data_valid" }} , 
 	{ "name": "position_val_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "position_val_c", "role": "fifo_cap" }} , 
 	{ "name": "position_val_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_val_c", "role": "full_n" }} , 
 	{ "name": "position_val_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "position_val_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "7"],
		"CDFG" : "swiftkv_coefficient_producer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "59", "EstimateLatencyMax" : "24629",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "score_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "position", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "16", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "control_stream", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "inverse_normalization_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inverse_normalization_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "position_val_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "position_val_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Port" : "SWIFTKV_EXP2_LUT_Q30", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6"],
		"CDFG" : "swiftkv_coefficient_producer_Pipeline_coefficient_token_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "18", "EstimateLatencyMax" : "24588",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln1094", "Type" : "None", "Direction" : "I"},
			{"Name" : "score_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "score_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "normalization_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "SWIFTKV_EXP2_LUT_Q30", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "coefficient_token_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "6", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage4", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage4_subdone", "QuitState" : "ap_ST_fsm_pp0_stage4", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage4_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.SWIFTKV_EXP2_LUT_Q30_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32ns_12ns_44_2_1_U486", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_32s_23ns_46_2_1_U487", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.mul_30ns_18ns_48_5_1_U488", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_coefficient_producer_Pipeline_coefficient_token_loop_fu_81.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_reciprocal_normalization_fu_93", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "swiftkv_reciprocal_normalization",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "37", "EstimateLatencyMax" : "37",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalization_val", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "reciprocal_divide_bit_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_reciprocal_normalization_fu_93.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_coefficient_producer {
		score_stream {Type I LastRead 1 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}
		control_stream {Type O LastRead -1 FirstWrite 14}
		inverse_normalization_stream {Type O LastRead -1 FirstWrite 4}
		position_val_c {Type O LastRead -1 FirstWrite 0}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	swiftkv_coefficient_producer_Pipeline_coefficient_token_loop {
		add_ln1094 {Type I LastRead 0 FirstWrite -1}
		score_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type O LastRead -1 FirstWrite 14}
		normalization_out {Type O LastRead -1 FirstWrite 10}
		SWIFTKV_EXP2_LUT_Q30 {Type I LastRead -1 FirstWrite -1}}
	swiftkv_reciprocal_normalization {
		normalization_val {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "59", "Max" : "24629"}
	, {"Name" : "Interval", "Min" : "59", "Max" : "24629"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	score_stream { ap_fifo {  { score_stream_dout fifo_data_in 0 32 }  { score_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { score_stream_fifo_cap fifo_update 0 3 }  { score_stream_empty_n fifo_status 0 1 }  { score_stream_read fifo_port_we 1 1 } } }
	position { ap_fifo {  { position_dout fifo_data_in 0 12 }  { position_num_data_valid fifo_status_num_data_valid 0 3 }  { position_fifo_cap fifo_update 0 3 }  { position_empty_n fifo_status 0 1 }  { position_read fifo_port_we 1 1 } } }
	control_stream { ap_fifo {  { control_stream_din fifo_data_in 1 19 }  { control_stream_num_data_valid fifo_status_num_data_valid 0 5 }  { control_stream_fifo_cap fifo_update 0 5 }  { control_stream_full_n fifo_status 0 1 }  { control_stream_write fifo_port_we 1 1 } } }
	inverse_normalization_stream { ap_fifo {  { inverse_normalization_stream_din fifo_data_in 1 32 }  { inverse_normalization_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { inverse_normalization_stream_fifo_cap fifo_update 0 3 }  { inverse_normalization_stream_full_n fifo_status 0 1 }  { inverse_normalization_stream_write fifo_port_we 1 1 } } }
	position_val_c { ap_fifo {  { position_val_c_din fifo_data_in 1 12 }  { position_val_c_num_data_valid fifo_status_num_data_valid 0 3 }  { position_val_c_fifo_cap fifo_update 0 3 }  { position_val_c_full_n fifo_status 0 1 }  { position_val_c_write fifo_port_we 1 1 } } }
}
