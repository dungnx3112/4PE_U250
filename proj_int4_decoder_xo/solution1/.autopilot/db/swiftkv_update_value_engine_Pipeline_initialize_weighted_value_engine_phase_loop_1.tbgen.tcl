set moduleName swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1
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
set C_modelName {swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ weighted_value_3 int 32 regular {array 8 { 3 0 } 0 1 }  }
	{ weighted_value_2 int 32 regular {array 8 { 3 0 } 0 1 }  }
	{ weighted_value_1 int 32 regular {array 8 { 3 0 } 0 1 }  }
	{ weighted_value_0 int 32 regular {array 8 { 3 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weighted_value_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weighted_value_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weighted_value_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weighted_value_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weighted_value_3_address1 sc_out sc_lv 3 signal 0 } 
	{ weighted_value_3_ce1 sc_out sc_logic 1 signal 0 } 
	{ weighted_value_3_we1 sc_out sc_logic 1 signal 0 } 
	{ weighted_value_3_d1 sc_out sc_lv 32 signal 0 } 
	{ weighted_value_2_address1 sc_out sc_lv 3 signal 1 } 
	{ weighted_value_2_ce1 sc_out sc_logic 1 signal 1 } 
	{ weighted_value_2_we1 sc_out sc_logic 1 signal 1 } 
	{ weighted_value_2_d1 sc_out sc_lv 32 signal 1 } 
	{ weighted_value_1_address1 sc_out sc_lv 3 signal 2 } 
	{ weighted_value_1_ce1 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_1_we1 sc_out sc_logic 1 signal 2 } 
	{ weighted_value_1_d1 sc_out sc_lv 32 signal 2 } 
	{ weighted_value_0_address1 sc_out sc_lv 3 signal 3 } 
	{ weighted_value_0_ce1 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_0_we1 sc_out sc_logic 1 signal 3 } 
	{ weighted_value_0_d1 sc_out sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weighted_value_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "address1" }} , 
 	{ "name": "weighted_value_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "ce1" }} , 
 	{ "name": "weighted_value_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "we1" }} , 
 	{ "name": "weighted_value_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_3", "role": "d1" }} , 
 	{ "name": "weighted_value_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "address1" }} , 
 	{ "name": "weighted_value_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "ce1" }} , 
 	{ "name": "weighted_value_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "we1" }} , 
 	{ "name": "weighted_value_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_2", "role": "d1" }} , 
 	{ "name": "weighted_value_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "address1" }} , 
 	{ "name": "weighted_value_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "ce1" }} , 
 	{ "name": "weighted_value_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "we1" }} , 
 	{ "name": "weighted_value_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_1", "role": "d1" }} , 
 	{ "name": "weighted_value_0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "address1" }} , 
 	{ "name": "weighted_value_0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "ce1" }} , 
 	{ "name": "weighted_value_0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "we1" }} , 
 	{ "name": "weighted_value_0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "weighted_value_0", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weighted_value_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "weighted_value_0", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "initialize_weighted_value_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_update_value_engine_Pipeline_initialize_weighted_value_engine_phase_loop_1 {
		weighted_value_3 {Type O LastRead -1 FirstWrite 0}
		weighted_value_2 {Type O LastRead -1 FirstWrite 0}
		weighted_value_1 {Type O LastRead -1 FirstWrite 0}
		weighted_value_0 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "10", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "10", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weighted_value_3 { ap_memory {  { weighted_value_3_address1 MemPortADDR2 1 3 }  { weighted_value_3_ce1 MemPortCE2 1 1 }  { weighted_value_3_we1 MemPortWE2 1 1 }  { weighted_value_3_d1 MemPortDIN2 1 32 } } }
	weighted_value_2 { ap_memory {  { weighted_value_2_address1 MemPortADDR2 1 3 }  { weighted_value_2_ce1 MemPortCE2 1 1 }  { weighted_value_2_we1 MemPortWE2 1 1 }  { weighted_value_2_d1 MemPortDIN2 1 32 } } }
	weighted_value_1 { ap_memory {  { weighted_value_1_address1 MemPortADDR2 1 3 }  { weighted_value_1_ce1 MemPortCE2 1 1 }  { weighted_value_1_we1 MemPortWE2 1 1 }  { weighted_value_1_d1 MemPortDIN2 1 32 } } }
	weighted_value_0 { ap_memory {  { weighted_value_0_address1 MemPortADDR2 1 3 }  { weighted_value_0_ce1 MemPortCE2 1 1 }  { weighted_value_0_we1 MemPortWE2 1 1 }  { weighted_value_0_d1 MemPortDIN2 1 32 } } }
}
