set moduleName int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop
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
set C_modelName {int4_rms_normalize_quantize_pe.15_Pipeline_quantize_reverse_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ normalized float 32 regular {array 32 { 1 } 1 1 }  }
	{ inverse_scale float 32 regular  }
	{ quantized_word_out int 480 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "normalized", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inverse_scale", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_word_out", "interface" : "wire", "bitwidth" : 480, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ normalized_address0 sc_out sc_lv 5 signal 0 } 
	{ normalized_ce0 sc_out sc_logic 1 signal 0 } 
	{ normalized_q0 sc_in sc_lv 32 signal 0 } 
	{ inverse_scale sc_in sc_lv 32 signal 1 } 
	{ quantized_word_out sc_out sc_lv 480 signal 2 } 
	{ quantized_word_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ grp_fu_144_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_144_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_144_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_144_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_154_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_154_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_154_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_154_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_154_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "normalized_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "normalized", "role": "address0" }} , 
 	{ "name": "normalized_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "normalized", "role": "ce0" }} , 
 	{ "name": "normalized_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "normalized", "role": "q0" }} , 
 	{ "name": "inverse_scale", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inverse_scale", "role": "default" }} , 
 	{ "name": "quantized_word_out", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_word_out", "role": "default" }} , 
 	{ "name": "quantized_word_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_word_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_144_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_144_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_144_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_144_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_154_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_154_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_154_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_154_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_154_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_154_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_154_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_154_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_154_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_154_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "53", "Max" : "53"}
	, {"Name" : "Interval", "Min" : "53", "Max" : "53"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	normalized { ap_memory {  { normalized_address0 mem_address 1 5 }  { normalized_ce0 mem_ce 1 1 }  { normalized_q0 mem_dout 0 32 } } }
	inverse_scale { ap_none {  { inverse_scale in_data 0 32 } } }
	quantized_word_out { ap_vld {  { quantized_word_out out_data 1 480 }  { quantized_word_out_ap_vld out_vld 1 1 } } }
}
