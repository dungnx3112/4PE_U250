set moduleName int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop
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
set C_modelName {int4_rms_sumsq_pe.11_Pipeline_merge_sumsq_lane_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ mux_case_02_reload float 32 regular  }
	{ mux_case_16_reload float 32 regular  }
	{ mux_case_27_reload float 32 regular  }
	{ mux_case_38_reload float 32 regular  }
	{ mux_case_49_reload float 32 regular  }
	{ mux_case_510_reload float 32 regular  }
	{ mux_case_611_reload float 32 regular  }
	{ mux_case_712_reload float 32 regular  }
	{ mux_case_813_reload float 32 regular  }
	{ mux_case_914_reload float 32 regular  }
	{ mux_case_1015_reload float 32 regular  }
	{ mux_case_1116_reload float 32 regular  }
	{ mux_case_1217_reload float 32 regular  }
	{ mux_case_1318_reload float 32 regular  }
	{ mux_case_1419_reload float 32 regular  }
	{ mux_case_1520_reload float 32 regular  }
	{ merged_01_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "mux_case_02_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_16_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_27_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_38_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_49_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_510_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_611_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_712_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_813_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_914_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1015_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1116_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1217_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1318_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1419_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mux_case_1520_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "merged_01_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mux_case_02_reload sc_in sc_lv 32 signal 0 } 
	{ mux_case_16_reload sc_in sc_lv 32 signal 1 } 
	{ mux_case_27_reload sc_in sc_lv 32 signal 2 } 
	{ mux_case_38_reload sc_in sc_lv 32 signal 3 } 
	{ mux_case_49_reload sc_in sc_lv 32 signal 4 } 
	{ mux_case_510_reload sc_in sc_lv 32 signal 5 } 
	{ mux_case_611_reload sc_in sc_lv 32 signal 6 } 
	{ mux_case_712_reload sc_in sc_lv 32 signal 7 } 
	{ mux_case_813_reload sc_in sc_lv 32 signal 8 } 
	{ mux_case_914_reload sc_in sc_lv 32 signal 9 } 
	{ mux_case_1015_reload sc_in sc_lv 32 signal 10 } 
	{ mux_case_1116_reload sc_in sc_lv 32 signal 11 } 
	{ mux_case_1217_reload sc_in sc_lv 32 signal 12 } 
	{ mux_case_1318_reload sc_in sc_lv 32 signal 13 } 
	{ mux_case_1419_reload sc_in sc_lv 32 signal 14 } 
	{ mux_case_1520_reload sc_in sc_lv 32 signal 15 } 
	{ merged_01_out sc_out sc_lv 32 signal 16 } 
	{ merged_01_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ grp_fu_370_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_370_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_370_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_370_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_370_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mux_case_02_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_02_reload", "role": "default" }} , 
 	{ "name": "mux_case_16_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_16_reload", "role": "default" }} , 
 	{ "name": "mux_case_27_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_27_reload", "role": "default" }} , 
 	{ "name": "mux_case_38_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_38_reload", "role": "default" }} , 
 	{ "name": "mux_case_49_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_49_reload", "role": "default" }} , 
 	{ "name": "mux_case_510_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_510_reload", "role": "default" }} , 
 	{ "name": "mux_case_611_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_611_reload", "role": "default" }} , 
 	{ "name": "mux_case_712_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_712_reload", "role": "default" }} , 
 	{ "name": "mux_case_813_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_813_reload", "role": "default" }} , 
 	{ "name": "mux_case_914_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_914_reload", "role": "default" }} , 
 	{ "name": "mux_case_1015_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1015_reload", "role": "default" }} , 
 	{ "name": "mux_case_1116_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1116_reload", "role": "default" }} , 
 	{ "name": "mux_case_1217_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1217_reload", "role": "default" }} , 
 	{ "name": "mux_case_1318_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1318_reload", "role": "default" }} , 
 	{ "name": "mux_case_1419_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1419_reload", "role": "default" }} , 
 	{ "name": "mux_case_1520_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mux_case_1520_reload", "role": "default" }} , 
 	{ "name": "merged_01_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "merged_01_out", "role": "default" }} , 
 	{ "name": "merged_01_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "merged_01_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_370_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_370_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_370_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_370_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_370_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop",
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
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U1220", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop {
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
		merged_01_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "67", "Max" : "67"}
	, {"Name" : "Interval", "Min" : "67", "Max" : "67"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mux_case_02_reload { ap_none {  { mux_case_02_reload in_data 0 32 } } }
	mux_case_16_reload { ap_none {  { mux_case_16_reload in_data 0 32 } } }
	mux_case_27_reload { ap_none {  { mux_case_27_reload in_data 0 32 } } }
	mux_case_38_reload { ap_none {  { mux_case_38_reload in_data 0 32 } } }
	mux_case_49_reload { ap_none {  { mux_case_49_reload in_data 0 32 } } }
	mux_case_510_reload { ap_none {  { mux_case_510_reload in_data 0 32 } } }
	mux_case_611_reload { ap_none {  { mux_case_611_reload in_data 0 32 } } }
	mux_case_712_reload { ap_none {  { mux_case_712_reload in_data 0 32 } } }
	mux_case_813_reload { ap_none {  { mux_case_813_reload in_data 0 32 } } }
	mux_case_914_reload { ap_none {  { mux_case_914_reload in_data 0 32 } } }
	mux_case_1015_reload { ap_none {  { mux_case_1015_reload in_data 0 32 } } }
	mux_case_1116_reload { ap_none {  { mux_case_1116_reload in_data 0 32 } } }
	mux_case_1217_reload { ap_none {  { mux_case_1217_reload in_data 0 32 } } }
	mux_case_1318_reload { ap_none {  { mux_case_1318_reload in_data 0 32 } } }
	mux_case_1419_reload { ap_none {  { mux_case_1419_reload in_data 0 32 } } }
	mux_case_1520_reload { ap_none {  { mux_case_1520_reload in_data 0 32 } } }
	merged_01_out { ap_vld {  { merged_01_out out_data 1 32 }  { merged_01_out_ap_vld out_vld 1 1 } } }
}
