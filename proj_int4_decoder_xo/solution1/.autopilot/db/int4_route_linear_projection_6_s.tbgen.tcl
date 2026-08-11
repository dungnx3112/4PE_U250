set moduleName int4_route_linear_projection_6_s
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
set C_modelName {int4_route_linear_projection<6>}
set C_modelType { void 0 }
set C_modelArgList {
	{ linear_stage0 int 512 regular {array 504 { 1 3 } 1 1 }  }
	{ linear_stage1 int 512 regular {array 504 { 1 3 } 1 1 }  }
	{ linear_stage2 int 512 regular {array 504 { 1 3 } 1 1 }  }
	{ linear_stage3 int 512 regular {array 504 { 1 3 } 1 1 }  }
	{ output0 int 512 regular {array 64 { 3 0 } 0 1 }  }
	{ output1 int 512 regular {array 64 { 3 0 } 0 1 }  }
	{ output2 int 512 regular {array 64 { 3 0 } 0 1 }  }
	{ output3 int 512 regular {array 64 { 3 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "linear_stage0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "linear_stage1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "linear_stage2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "linear_stage3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "output0", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output1", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output2", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output3", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ linear_stage0_address0 sc_out sc_lv 9 signal 0 } 
	{ linear_stage0_ce0 sc_out sc_logic 1 signal 0 } 
	{ linear_stage0_q0 sc_in sc_lv 512 signal 0 } 
	{ linear_stage1_address0 sc_out sc_lv 9 signal 1 } 
	{ linear_stage1_ce0 sc_out sc_logic 1 signal 1 } 
	{ linear_stage1_q0 sc_in sc_lv 512 signal 1 } 
	{ linear_stage2_address0 sc_out sc_lv 9 signal 2 } 
	{ linear_stage2_ce0 sc_out sc_logic 1 signal 2 } 
	{ linear_stage2_q0 sc_in sc_lv 512 signal 2 } 
	{ linear_stage3_address0 sc_out sc_lv 9 signal 3 } 
	{ linear_stage3_ce0 sc_out sc_logic 1 signal 3 } 
	{ linear_stage3_q0 sc_in sc_lv 512 signal 3 } 
	{ output0_address1 sc_out sc_lv 6 signal 4 } 
	{ output0_ce1 sc_out sc_logic 1 signal 4 } 
	{ output0_we1 sc_out sc_logic 1 signal 4 } 
	{ output0_d1 sc_out sc_lv 512 signal 4 } 
	{ output1_address1 sc_out sc_lv 6 signal 5 } 
	{ output1_ce1 sc_out sc_logic 1 signal 5 } 
	{ output1_we1 sc_out sc_logic 1 signal 5 } 
	{ output1_d1 sc_out sc_lv 512 signal 5 } 
	{ output2_address1 sc_out sc_lv 6 signal 6 } 
	{ output2_ce1 sc_out sc_logic 1 signal 6 } 
	{ output2_we1 sc_out sc_logic 1 signal 6 } 
	{ output2_d1 sc_out sc_lv 512 signal 6 } 
	{ output3_address1 sc_out sc_lv 6 signal 7 } 
	{ output3_ce1 sc_out sc_logic 1 signal 7 } 
	{ output3_we1 sc_out sc_logic 1 signal 7 } 
	{ output3_d1 sc_out sc_lv 512 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "linear_stage0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage0", "role": "address0" }} , 
 	{ "name": "linear_stage0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage0", "role": "ce0" }} , 
 	{ "name": "linear_stage0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage0", "role": "q0" }} , 
 	{ "name": "linear_stage1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage1", "role": "address0" }} , 
 	{ "name": "linear_stage1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage1", "role": "ce0" }} , 
 	{ "name": "linear_stage1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage1", "role": "q0" }} , 
 	{ "name": "linear_stage2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage2", "role": "address0" }} , 
 	{ "name": "linear_stage2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage2", "role": "ce0" }} , 
 	{ "name": "linear_stage2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage2", "role": "q0" }} , 
 	{ "name": "linear_stage3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "linear_stage3", "role": "address0" }} , 
 	{ "name": "linear_stage3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_stage3", "role": "ce0" }} , 
 	{ "name": "linear_stage3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "linear_stage3", "role": "q0" }} , 
 	{ "name": "output0_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output0", "role": "address1" }} , 
 	{ "name": "output0_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output0", "role": "ce1" }} , 
 	{ "name": "output0_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output0", "role": "we1" }} , 
 	{ "name": "output0_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output0", "role": "d1" }} , 
 	{ "name": "output1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output1", "role": "address1" }} , 
 	{ "name": "output1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output1", "role": "ce1" }} , 
 	{ "name": "output1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output1", "role": "we1" }} , 
 	{ "name": "output1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output1", "role": "d1" }} , 
 	{ "name": "output2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output2", "role": "address1" }} , 
 	{ "name": "output2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output2", "role": "ce1" }} , 
 	{ "name": "output2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output2", "role": "we1" }} , 
 	{ "name": "output2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output2", "role": "d1" }} , 
 	{ "name": "output3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "output3", "role": "address1" }} , 
 	{ "name": "output3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output3", "role": "ce1" }} , 
 	{ "name": "output3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output3", "role": "we1" }} , 
 	{ "name": "output3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output3", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_route_linear_projection_6_s",
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
			{"Name" : "linear_stage0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "linear_stage3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "output0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "output3", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "route_linear_projection_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_route_linear_projection_6_s {
		linear_stage0 {Type I LastRead 0 FirstWrite -1}
		linear_stage1 {Type I LastRead 0 FirstWrite -1}
		linear_stage2 {Type I LastRead 0 FirstWrite -1}
		linear_stage3 {Type I LastRead 0 FirstWrite -1}
		output0 {Type O LastRead -1 FirstWrite 2}
		output1 {Type O LastRead -1 FirstWrite 2}
		output2 {Type O LastRead -1 FirstWrite 2}
		output3 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "67", "Max" : "67"}
	, {"Name" : "Interval", "Min" : "67", "Max" : "67"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	linear_stage0 { ap_memory {  { linear_stage0_address0 mem_address 1 9 }  { linear_stage0_ce0 mem_ce 1 1 }  { linear_stage0_q0 mem_dout 0 512 } } }
	linear_stage1 { ap_memory {  { linear_stage1_address0 mem_address 1 9 }  { linear_stage1_ce0 mem_ce 1 1 }  { linear_stage1_q0 mem_dout 0 512 } } }
	linear_stage2 { ap_memory {  { linear_stage2_address0 mem_address 1 9 }  { linear_stage2_ce0 mem_ce 1 1 }  { linear_stage2_q0 mem_dout 0 512 } } }
	linear_stage3 { ap_memory {  { linear_stage3_address0 mem_address 1 9 }  { linear_stage3_ce0 mem_ce 1 1 }  { linear_stage3_q0 mem_dout 0 512 } } }
	output0 { ap_memory {  { output0_address1 MemPortADDR2 1 6 }  { output0_ce1 MemPortCE2 1 1 }  { output0_we1 MemPortWE2 1 1 }  { output0_d1 MemPortDIN2 1 512 } } }
	output1 { ap_memory {  { output1_address1 MemPortADDR2 1 6 }  { output1_ce1 MemPortCE2 1 1 }  { output1_we1 MemPortWE2 1 1 }  { output1_d1 MemPortDIN2 1 512 } } }
	output2 { ap_memory {  { output2_address1 MemPortADDR2 1 6 }  { output2_ce1 MemPortCE2 1 1 }  { output2_we1 MemPortWE2 1 1 }  { output2_d1 MemPortDIN2 1 512 } } }
	output3 { ap_memory {  { output3_address1 MemPortADDR2 1 6 }  { output3_ce1 MemPortCE2 1 1 }  { output3_we1 MemPortWE2 1 1 }  { output3_d1 MemPortDIN2 1 512 } } }
}
