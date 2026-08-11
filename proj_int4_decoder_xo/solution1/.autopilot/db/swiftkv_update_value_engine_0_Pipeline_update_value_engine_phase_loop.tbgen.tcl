set moduleName swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop
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
set C_modelName {swiftkv_update_value_engine<0>_Pipeline_update_value_engine_phase_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ update_phase_count int 16 regular  }
	{ weighted_value_3 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_2 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_1 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ weighted_value_0 int 32 regular {array 8 { 1 0 } 1 1 }  }
	{ engine0_phase_stream int 57 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "update_phase_count", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "weighted_value_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "weighted_value_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "engine0_phase_stream", "interface" : "fifo", "bitwidth" : 57, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ engine0_phase_stream_dout sc_in sc_lv 57 signal 5 } 
	{ engine0_phase_stream_num_data_valid sc_in sc_lv 4 signal 5 } 
	{ engine0_phase_stream_fifo_cap sc_in sc_lv 4 signal 5 } 
	{ engine0_phase_stream_empty_n sc_in sc_logic 1 signal 5 } 
	{ engine0_phase_stream_read sc_out sc_logic 1 signal 5 } 
	{ update_phase_count sc_in sc_lv 16 signal 0 } 
	{ weighted_value_3_address0 sc_out sc_lv 3 signal 1 } 
	{ weighted_value_3_ce0 sc_out sc_logic 1 signal 1 } 
	{ weighted_value_3_q0 sc_in sc_lv 32 signal 1 } 
	{ weighted_value_3_address1 sc_out sc_lv 3 signal 1 } 
	{ weighted_value_3_ce1 sc_out sc_logic 1 signal 1 } 
	{ weighted_value_3_we1 sc_out sc_logic 1 signal 1 } 
	{ weighted_value_3_d1 sc_out sc_lv 32 signal 1 } 
	{ weighted_value_2_address0 sc_out sc_lv 3 signal 2 } 
	{ weighted_value_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_2_q0 sc_in sc_lv 32 signal 2 } 
	{ weighted_value_2_address1 sc_out sc_lv 3 signal 2 } 
	{ weighted_value_2_ce1 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_2_we1 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_2_d1 sc_out sc_lv 32 signal 2 } 
	{ weighted_value_1_address0 sc_out sc_lv 3 signal 3 } 
	{ weighted_value_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_1_q0 sc_in sc_lv 32 signal 3 } 
	{ weighted_value_1_address1 sc_out sc_lv 3 signal 3 } 
	{ weighted_value_1_ce1 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_1_we1 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_1_d1 sc_out sc_lv 32 signal 3 } 
	{ weighted_value_0_address0 sc_out sc_lv 3 signal 4 } 
	{ weighted_value_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ weighted_value_0_q0 sc_in sc_lv 32 signal 4 } 
	{ weighted_value_0_address1 sc_out sc_lv 3 signal 4 } 
	{ weighted_value_0_ce1 sc_out sc_logic 1 signal 4 } 
	{ weighted_value_0_we1 sc_out sc_logic 1 signal 4 } 
	{ weighted_value_0_d1 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "engine0_phase_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":57, "type": "signal", "bundle":{"name": "engine0_phase_stream", "role": "dout" }} , 
 	{ "name": "engine0_phase_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "engine0_phase_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine0_phase_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "engine0_phase_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine0_phase_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine0_phase_stream", "role": "empty_n" }} , 
 	{ "name": "engine0_phase_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine0_phase_stream", "role": "read" }} , 
 	{ "name": "update_phase_count", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "update_phase_count", "role": "default" }} , 
 	{ "name": "weighted_value_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "address0" }} , 
 	{ "name": "weighted_value_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "ce0" }} , 
 	{ "name": "weighted_value_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "q0" }} , 
 	{ "name": "weighted_value_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "address1" }} , 
 	{ "name": "weighted_value_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "we1" }} , 
 	{ "name": "weighted_value_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "d1" }} , 
 	{ "name": "weighted_value_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "address0" }} , 
 	{ "name": "weighted_value_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "ce0" }} , 
 	{ "name": "weighted_value_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "q0" }} , 
 	{ "name": "weighted_value_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "address1" }} , 
 	{ "name": "weighted_value_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "we1" }} , 
 	{ "name": "weighted_value_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "d1" }} , 
 	{ "name": "weighted_value_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "address0" }} , 
 	{ "name": "weighted_value_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "ce0" }} , 
 	{ "name": "weighted_value_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "q0" }} , 
 	{ "name": "weighted_value_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "address1" }} , 
 	{ "name": "weighted_value_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "we1" }} , 
 	{ "name": "weighted_value_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "d1" }} , 
 	{ "name": "weighted_value_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "address0" }} , 
 	{ "name": "weighted_value_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "ce0" }} , 
 	{ "name": "weighted_value_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "q0" }} , 
 	{ "name": "weighted_value_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "address1" }} , 
 	{ "name": "weighted_value_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "we1" }} , 
 	{ "name": "weighted_value_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "17", "EstimateLatencyMax" : "32777",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "engine0_phase_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine0_phase_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "update_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_18ns_50_5_1_U573", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_18ns_50_5_1_U574", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_18ns_50_5_1_U575", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_18ns_50_5_1_U576", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_update_value_engine_0_Pipeline_update_value_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		weighted_value_3 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_2 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_1 {Type IO LastRead 0 FirstWrite 8}
		weighted_value_0 {Type IO LastRead 0 FirstWrite 8}
		engine0_phase_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "17", "Max" : "32777"}
	, {"Name" : "Interval", "Min" : "17", "Max" : "32777"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	update_phase_count { ap_none {  { update_phase_count in_data 0 16 } } }
	weighted_value_3 { ap_memory {  { weighted_value_3_address0 mem_address 1 3 }  { weighted_value_3_ce0 mem_ce 1 1 }  { weighted_value_3_q0 mem_dout 0 32 }  { weighted_value_3_address1 MemPortADDR2 1 3 }  { weighted_value_3_ce1 MemPortCE2 1 1 }  { weighted_value_3_we1 MemPortWE2 1 1 }  { weighted_value_3_d1 MemPortDIN2 1 32 } } }
	weighted_value_2 { ap_memory {  { weighted_value_2_address0 mem_address 1 3 }  { weighted_value_2_ce0 mem_ce 1 1 }  { weighted_value_2_q0 mem_dout 0 32 }  { weighted_value_2_address1 MemPortADDR2 1 3 }  { weighted_value_2_ce1 MemPortCE2 1 1 }  { weighted_value_2_we1 MemPortWE2 1 1 }  { weighted_value_2_d1 MemPortDIN2 1 32 } } }
	weighted_value_1 { ap_memory {  { weighted_value_1_address0 mem_address 1 3 }  { weighted_value_1_ce0 mem_ce 1 1 }  { weighted_value_1_q0 mem_dout 0 32 }  { weighted_value_1_address1 MemPortADDR2 1 3 }  { weighted_value_1_ce1 MemPortCE2 1 1 }  { weighted_value_1_we1 MemPortWE2 1 1 }  { weighted_value_1_d1 MemPortDIN2 1 32 } } }
	weighted_value_0 { ap_memory {  { weighted_value_0_address0 mem_address 1 3 }  { weighted_value_0_ce0 mem_ce 1 1 }  { weighted_value_0_q0 mem_dout 0 32 }  { weighted_value_0_address1 MemPortADDR2 1 3 }  { weighted_value_0_ce1 MemPortCE2 1 1 }  { weighted_value_0_we1 MemPortWE2 1 1 }  { weighted_value_0_d1 MemPortDIN2 1 32 } } }
	engine0_phase_stream { ap_fifo {  { engine0_phase_stream_dout fifo_data_in 0 57 }  { engine0_phase_stream_num_data_valid fifo_status_num_data_valid 0 4 }  { engine0_phase_stream_fifo_cap fifo_update 0 4 }  { engine0_phase_stream_empty_n fifo_status 0 1 }  { engine0_phase_stream_read fifo_port_we 1 1 } } }
}
