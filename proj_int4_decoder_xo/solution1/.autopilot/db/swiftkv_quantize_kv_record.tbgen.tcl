set moduleName swiftkv_quantize_kv_record
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
set C_modelName {swiftkv_quantize_kv_record}
set C_modelType { int 2560 }
set C_modelArgList {
	{ k_words int 512 regular {array 8 { 1 } 1 1 }  }
	{ v_words int 512 regular {array 8 { 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "k_words", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "v_words", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 2560} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ k_words_address0 sc_out sc_lv 3 signal 0 } 
	{ k_words_ce0 sc_out sc_logic 1 signal 0 } 
	{ k_words_q0 sc_in sc_lv 512 signal 0 } 
	{ v_words_address0 sc_out sc_lv 3 signal 1 } 
	{ v_words_ce0 sc_out sc_logic 1 signal 1 } 
	{ v_words_q0 sc_in sc_lv 512 signal 1 } 
	{ ap_return_0 sc_out sc_lv 512 signal -1 } 
	{ ap_return_1 sc_out sc_lv 512 signal -1 } 
	{ ap_return_2 sc_out sc_lv 512 signal -1 } 
	{ ap_return_3 sc_out sc_lv 512 signal -1 } 
	{ ap_return_4 sc_out sc_lv 512 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "k_words_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_words", "role": "address0" }} , 
 	{ "name": "k_words_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_words", "role": "ce0" }} , 
 	{ "name": "k_words_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_words", "role": "q0" }} , 
 	{ "name": "v_words_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "v_words", "role": "address0" }} , 
 	{ "name": "v_words_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "v_words", "role": "ce0" }} , 
 	{ "name": "v_words_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "v_words", "role": "q0" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "11"],
		"CDFG" : "swiftkv_quantize_kv_record",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "137", "EstimateLatencyMax" : "137",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "k_words", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "v_words", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "quantize_kv_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty_612", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_613", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_614", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "maximum_v_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "maximum_k_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "find_kv_group_max_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U122", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U123", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U124", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U125", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U126", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U127", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U128", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.sparsemux_17_3_32_1_1_U129", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop_fu_538.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608", "Parent" : "0", "Child" : ["12", "13", "14", "15", "16", "17", "18", "19", "20"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i313", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i328", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_609", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_610", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_611", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_k_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_kv_group_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U197", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U198", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U199", "Parent" : "11"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U200", "Parent" : "11"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U201", "Parent" : "11"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U202", "Parent" : "11"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U203", "Parent" : "11"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.sparsemux_17_3_32_1_1_U204", "Parent" : "11"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop_fu_608.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_quantize_kv_record {
		k_words {Type I LastRead 2 FirstWrite -1}
		v_words {Type I LastRead 2 FirstWrite -1}}
	swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop {
		empty_612 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty_613 {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		empty_614 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		maximum_v_out {Type O LastRead -1 FirstWrite 1}
		maximum_k_out {Type O LastRead -1 FirstWrite 1}}
	swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop {
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i313 {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i328 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		empty_609 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty_610 {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		empty_611 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		quantized_k_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "137", "Max" : "137"}
	, {"Name" : "Interval", "Min" : "137", "Max" : "137"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	k_words { ap_memory {  { k_words_address0 mem_address 1 3 }  { k_words_ce0 mem_ce 1 1 }  { k_words_q0 in_data 0 512 } } }
	v_words { ap_memory {  { v_words_address0 mem_address 1 3 }  { v_words_ce0 mem_ce 1 1 }  { v_words_q0 in_data 0 512 } } }
}
