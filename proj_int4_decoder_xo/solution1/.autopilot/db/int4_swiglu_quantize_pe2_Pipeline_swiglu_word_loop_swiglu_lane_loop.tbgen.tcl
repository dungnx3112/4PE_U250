set moduleName int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop
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
set C_modelName {int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ swiglu_group float 32 regular {array 32 { 0 } 0 1 }  }
	{ tmp_39 int 8 regular  }
	{ gate int 512 regular {array 176 { 1 } 1 1 }  }
	{ up int 512 regular {array 176 { 1 } 1 1 }  }
	{ max_abs_bits_2_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "swiglu_group", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "tmp_39", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "gate", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "max_abs_bits_2_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ swiglu_group_address0 sc_out sc_lv 5 signal 0 } 
	{ swiglu_group_ce0 sc_out sc_logic 1 signal 0 } 
	{ swiglu_group_we0 sc_out sc_logic 1 signal 0 } 
	{ swiglu_group_d0 sc_out sc_lv 32 signal 0 } 
	{ tmp_39 sc_in sc_lv 8 signal 1 } 
	{ gate_address0 sc_out sc_lv 8 signal 2 } 
	{ gate_ce0 sc_out sc_logic 1 signal 2 } 
	{ gate_q0 sc_in sc_lv 512 signal 2 } 
	{ up_address0 sc_out sc_lv 8 signal 3 } 
	{ up_ce0 sc_out sc_logic 1 signal 3 } 
	{ up_q0 sc_in sc_lv 512 signal 3 } 
	{ max_abs_bits_2_out sc_out sc_lv 32 signal 4 } 
	{ max_abs_bits_2_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ grp_fu_308_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_308_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_308_p_opcode sc_out sc_lv 2 signal -1 } 
	{ grp_fu_308_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_308_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_124_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_124_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_124_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_124_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_129_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_129_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_129_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_129_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "swiglu_group_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "swiglu_group", "role": "address0" }} , 
 	{ "name": "swiglu_group_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiglu_group", "role": "ce0" }} , 
 	{ "name": "swiglu_group_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiglu_group", "role": "we0" }} , 
 	{ "name": "swiglu_group_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "swiglu_group", "role": "d0" }} , 
 	{ "name": "tmp_39", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "tmp_39", "role": "default" }} , 
 	{ "name": "gate_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate", "role": "address0" }} , 
 	{ "name": "gate_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate", "role": "ce0" }} , 
 	{ "name": "gate_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate", "role": "q0" }} , 
 	{ "name": "up_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up", "role": "address0" }} , 
 	{ "name": "up_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up", "role": "ce0" }} , 
 	{ "name": "up_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up", "role": "q0" }} , 
 	{ "name": "max_abs_bits_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "max_abs_bits_2_out", "role": "default" }} , 
 	{ "name": "max_abs_bits_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "max_abs_bits_2_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_308_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_308_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_308_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_308_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_308_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "grp_fu_308_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_308_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_308_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_308_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_308_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_124_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_124_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_124_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_124_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_124_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_124_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_124_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_124_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_129_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_129_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_129_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_129_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_129_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_129_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_129_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_129_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U1008", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fexp_32ns_32ns_32_14_full_dsp_1_U1010", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U1011", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U1012", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_39 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_2_out {Type O LastRead -1 FirstWrite 44}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "78", "Max" : "78"}
	, {"Name" : "Interval", "Min" : "78", "Max" : "78"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	swiglu_group { ap_memory {  { swiglu_group_address0 mem_address 1 5 }  { swiglu_group_ce0 mem_ce 1 1 }  { swiglu_group_we0 mem_we 1 1 }  { swiglu_group_d0 mem_din 1 32 } } }
	tmp_39 { ap_none {  { tmp_39 in_data 0 8 } } }
	gate { ap_memory {  { gate_address0 mem_address 1 8 }  { gate_ce0 mem_ce 1 1 }  { gate_q0 in_data 0 512 } } }
	up { ap_memory {  { up_address0 mem_address 1 8 }  { up_ce0 mem_ce 1 1 }  { up_q0 in_data 0 512 } } }
	max_abs_bits_2_out { ap_vld {  { max_abs_bits_2_out out_data 1 32 }  { max_abs_bits_2_out_ap_vld out_vld 1 1 } } }
}
