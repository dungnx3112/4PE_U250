set moduleName int4_swiglu_quantize_pe3
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
set C_modelName {int4_swiglu_quantize_pe3}
set C_modelType { void 0 }
set C_modelArgList {
	{ gate int 512 regular {array 176 { 1 } 1 1 }  }
	{ up int 512 regular {array 176 { 1 } 1 1 }  }
	{ quantized_pe3 int 480 regular {fifo 1 volatile }  }
	{ scale_pe3 int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gate", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ gate_address0 sc_out sc_lv 8 signal 0 } 
	{ gate_ce0 sc_out sc_logic 1 signal 0 } 
	{ gate_q0 sc_in sc_lv 512 signal 0 } 
	{ up_address0 sc_out sc_lv 8 signal 1 } 
	{ up_ce0 sc_out sc_logic 1 signal 1 } 
	{ up_q0 sc_in sc_lv 512 signal 1 } 
	{ quantized_pe3_din sc_out sc_lv 480 signal 2 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ quantized_pe3_full_n sc_in sc_logic 1 signal 2 } 
	{ quantized_pe3_write sc_out sc_logic 1 signal 2 } 
	{ scale_pe3_din sc_out sc_lv 32 signal 3 } 
	{ scale_pe3_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ scale_pe3_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ scale_pe3_full_n sc_in sc_logic 1 signal 3 } 
	{ scale_pe3_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "gate_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate", "role": "address0" }} , 
 	{ "name": "gate_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate", "role": "ce0" }} , 
 	{ "name": "gate_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate", "role": "q0" }} , 
 	{ "name": "up_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up", "role": "address0" }} , 
 	{ "name": "up_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up", "role": "ce0" }} , 
 	{ "name": "up_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up", "role": "q0" }} , 
 	{ "name": "quantized_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "din" }} , 
 	{ "name": "quantized_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "full_n" }} , 
 	{ "name": "quantized_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "write" }} , 
 	{ "name": "scale_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe3", "role": "din" }} , 
 	{ "name": "scale_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "full_n" }} , 
 	{ "name": "scale_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "8", "12", "13", "14", "15"],
		"CDFG" : "int4_swiglu_quantize_pe3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12601", "EstimateLatencyMax" : "12601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.swiglu_group_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "0", "Child" : ["3", "4", "5", "6", "7"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop",
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
			{"Name" : "tmp_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1036", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1038", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1039", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1040", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "0", "Child" : ["9", "10", "11"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop",
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
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1049", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1050", "Parent" : "8"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U1054", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fdiv_32ns_32ns_32_12_no_dsp_1_U1055", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fcmp_32ns_32ns_1_2_no_dsp_1_U1056", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U1057", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_swiglu_quantize_pe3 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 19}
		scale_pe3 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_31 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_1_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "12601", "Max" : "12601"}
	, {"Name" : "Interval", "Min" : "12601", "Max" : "12601"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gate { ap_memory {  { gate_address0 mem_address 1 8 }  { gate_ce0 mem_ce 1 1 }  { gate_q0 mem_dout 0 512 } } }
	up { ap_memory {  { up_address0 mem_address 1 8 }  { up_ce0 mem_ce 1 1 }  { up_q0 mem_dout 0 512 } } }
	quantized_pe3 { ap_fifo {  { quantized_pe3_din fifo_data_in 1 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_full_n fifo_status 0 1 }  { quantized_pe3_write fifo_port_we 1 1 } } }
	scale_pe3 { ap_fifo {  { scale_pe3_din fifo_data_in 1 32 }  { scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe3_fifo_cap fifo_update 0 3 }  { scale_pe3_full_n fifo_status 0 1 }  { scale_pe3_write fifo_port_we 1 1 } } }
}
