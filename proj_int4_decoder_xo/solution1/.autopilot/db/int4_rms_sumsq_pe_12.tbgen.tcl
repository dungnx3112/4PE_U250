set moduleName int4_rms_sumsq_pe_12
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
set C_modelName {int4_rms_sumsq_pe.12}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_r int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ partial_3 int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "partial_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r_address0 sc_out sc_lv 6 signal 0 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_r_q0 sc_in sc_lv 512 signal 0 } 
	{ partial_3_din sc_out sc_lv 32 signal 1 } 
	{ partial_3_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ partial_3_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ partial_3_full_n sc_in sc_logic 1 signal 1 } 
	{ partial_3_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "partial_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "partial_3", "role": "din" }} , 
 	{ "name": "partial_3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_3", "role": "num_data_valid" }} , 
 	{ "name": "partial_3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_3", "role": "fifo_cap" }} , 
 	{ "name": "partial_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_3", "role": "full_n" }} , 
 	{ "name": "partial_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_3", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "6", "9"],
		"CDFG" : "int4_rms_sumsq_pe_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "0", "Child" : ["2", "3", "4", "5"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1242", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1243", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1244", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "0", "Child" : ["7", "8"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1263", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_no_dsp_1_U1281", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_rms_sumsq_pe_12 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4175", "Max" : "4175"}
	, {"Name" : "Interval", "Min" : "4175", "Max" : "4175"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_memory {  { input_r_address0 mem_address 1 6 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 mem_dout 0 512 } } }
	partial_3 { ap_fifo {  { partial_3_din fifo_data_in 1 32 }  { partial_3_num_data_valid fifo_status_num_data_valid 0 3 }  { partial_3_fifo_cap fifo_update 0 3 }  { partial_3_full_n fifo_status 0 1 }  { partial_3_write fifo_port_we 1 1 } } }
}
