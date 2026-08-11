set moduleName swiftkv_load_rope_position
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
set C_modelName {swiftkv_load_rope_position}
set C_modelType { void 0 }
set C_modelArgList {
	{ position_val int 12 regular  }
	{ current_cos int 19 regular {array 64 { 0 } 0 1 }  }
	{ current_sin int 19 regular {array 64 { 0 } 0 1 }  }
	{ rope_lut int 608 regular {array 16384 { 1 } 2 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "position_val", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "current_cos", "interface" : "memory", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "current_sin", "interface" : "memory", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rope_lut", "interface" : "memory", "bitwidth" : 608, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ position_val sc_in sc_lv 12 signal 0 } 
	{ current_cos_address0 sc_out sc_lv 6 signal 1 } 
	{ current_cos_ce0 sc_out sc_logic 1 signal 1 } 
	{ current_cos_we0 sc_out sc_logic 1 signal 1 } 
	{ current_cos_d0 sc_out sc_lv 19 signal 1 } 
	{ current_sin_address0 sc_out sc_lv 6 signal 2 } 
	{ current_sin_ce0 sc_out sc_logic 1 signal 2 } 
	{ current_sin_we0 sc_out sc_logic 1 signal 2 } 
	{ current_sin_d0 sc_out sc_lv 19 signal 2 } 
	{ rope_lut_address0 sc_out sc_lv 14 signal 3 } 
	{ rope_lut_ce0 sc_out sc_logic 1 signal 3 } 
	{ rope_lut_q0 sc_in sc_lv 608 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "position_val", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position_val", "role": "default" }} , 
 	{ "name": "current_cos_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "current_cos", "role": "address0" }} , 
 	{ "name": "current_cos_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_cos", "role": "ce0" }} , 
 	{ "name": "current_cos_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_cos", "role": "we0" }} , 
 	{ "name": "current_cos_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "current_cos", "role": "d0" }} , 
 	{ "name": "current_sin_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "current_sin", "role": "address0" }} , 
 	{ "name": "current_sin_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_sin", "role": "ce0" }} , 
 	{ "name": "current_sin_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_sin", "role": "we0" }} , 
 	{ "name": "current_sin_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "current_sin", "role": "d0" }} , 
 	{ "name": "rope_lut_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "rope_lut", "role": "address0" }} , 
 	{ "name": "rope_lut_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rope_lut", "role": "ce0" }} , 
 	{ "name": "rope_lut_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":608, "type": "signal", "bundle":{"name": "rope_lut", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "swiftkv_load_rope_position",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "70", "EstimateLatencyMax" : "70",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "position_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "current_cos", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "current_sin", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "rope_lut", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "rope_lut_group_loop_rope_lut_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_load_rope_position {
		position_val {Type I LastRead 0 FirstWrite -1}
		current_cos {Type O LastRead -1 FirstWrite 4}
		current_sin {Type O LastRead -1 FirstWrite 4}
		rope_lut {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "70", "Max" : "70"}
	, {"Name" : "Interval", "Min" : "70", "Max" : "70"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	position_val { ap_none {  { position_val in_data 0 12 } } }
	current_cos { ap_memory {  { current_cos_address0 mem_address 1 6 }  { current_cos_ce0 mem_ce 1 1 }  { current_cos_we0 mem_we 1 1 }  { current_cos_d0 mem_din 1 19 } } }
	current_sin { ap_memory {  { current_sin_address0 mem_address 1 6 }  { current_sin_ce0 mem_ce 1 1 }  { current_sin_we0 mem_we 1 1 }  { current_sin_d0 mem_din 1 19 } } }
	rope_lut { ap_memory {  { rope_lut_address0 mem_address 1 14 }  { rope_lut_ce0 mem_ce 1 1 }  { rope_lut_q0 mem_dout 0 608 } } }
}
