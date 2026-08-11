set moduleName int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop
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
set C_modelName {int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ empty int 6 regular  }
	{ input_r int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ idx int 13 regular  }
	{ reciprocal_rms float 32 regular  }
	{ normalized float 32 regular {array 32 { 0 } 0 1 }  }
	{ max_abs_bits_8_out int 32 regular {pointer 1}  }
	{ model_norm_cache0 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_r", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "reciprocal_rms", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "normalized", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "max_abs_bits_8_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "model_norm_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ empty sc_in sc_lv 6 signal 0 } 
	{ input_r_address0 sc_out sc_lv 6 signal 1 } 
	{ input_r_ce0 sc_out sc_logic 1 signal 1 } 
	{ input_r_q0 sc_in sc_lv 512 signal 1 } 
	{ idx sc_in sc_lv 13 signal 2 } 
	{ reciprocal_rms sc_in sc_lv 32 signal 3 } 
	{ normalized_address0 sc_out sc_lv 5 signal 4 } 
	{ normalized_ce0 sc_out sc_logic 1 signal 4 } 
	{ normalized_we0 sc_out sc_logic 1 signal 4 } 
	{ normalized_d0 sc_out sc_lv 32 signal 4 } 
	{ max_abs_bits_8_out sc_out sc_lv 32 signal 5 } 
	{ max_abs_bits_8_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 6 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 6 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 6 } 
	{ grp_fu_144_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_144_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_144_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_144_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "input_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_r", "role": "address0" }} , 
 	{ "name": "input_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_r", "role": "ce0" }} , 
 	{ "name": "input_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_r", "role": "q0" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "reciprocal_rms", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "reciprocal_rms", "role": "default" }} , 
 	{ "name": "normalized_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "normalized", "role": "address0" }} , 
 	{ "name": "normalized_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "normalized", "role": "ce0" }} , 
 	{ "name": "normalized_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "normalized", "role": "we0" }} , 
 	{ "name": "normalized_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized", "role": "d0" }} , 
 	{ "name": "max_abs_bits_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_bits_8_out", "role": "default" }} , 
 	{ "name": "max_abs_bits_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_bits_8_out", "role": "ap_vld" }} , 
 	{ "name": "model_norm_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "address0" }} , 
 	{ "name": "model_norm_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "ce0" }} , 
 	{ "name": "model_norm_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "q0" }} , 
 	{ "name": "grp_fu_144_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_144_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U1304", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U1305", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_8_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "44", "Max" : "44"}
	, {"Name" : "Interval", "Min" : "44", "Max" : "44"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	empty { ap_none {  { empty in_data 0 6 } } }
	input_r { ap_memory {  { input_r_address0 mem_address 1 6 }  { input_r_ce0 mem_ce 1 1 }  { input_r_q0 in_data 0 512 } } }
	idx { ap_none {  { idx in_data 0 13 } } }
	reciprocal_rms { ap_none {  { reciprocal_rms in_data 0 32 } } }
	normalized { ap_memory {  { normalized_address0 mem_address 1 5 }  { normalized_ce0 mem_ce 1 1 }  { normalized_we0 mem_we 1 1 }  { normalized_d0 mem_din 1 32 } } }
	max_abs_bits_8_out { ap_vld {  { max_abs_bits_8_out out_data 1 32 }  { max_abs_bits_8_out_ap_vld out_vld 1 1 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_q0 in_data 0 512 } } }
}
