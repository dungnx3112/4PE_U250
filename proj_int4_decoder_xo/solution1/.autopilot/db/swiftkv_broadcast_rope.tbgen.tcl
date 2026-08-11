set moduleName swiftkv_broadcast_rope
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
set C_modelName {swiftkv_broadcast_rope}
set C_modelType { void 0 }
set C_modelArgList {
	{ current_cos int 19 regular {array 64 { 1 } 1 1 }  }
	{ current_sin int 19 regular {array 64 { 1 } 1 1 }  }
	{ cos_pe0 int 19 regular {fifo 1 volatile }  }
	{ cos_pe1 int 19 regular {fifo 1 volatile }  }
	{ cos_pe2 int 19 regular {fifo 1 volatile }  }
	{ cos_pe3 int 19 regular {fifo 1 volatile }  }
	{ sin_pe0 int 19 regular {fifo 1 volatile }  }
	{ sin_pe1 int 19 regular {fifo 1 volatile }  }
	{ sin_pe2 int 19 regular {fifo 1 volatile }  }
	{ sin_pe3 int 19 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "current_cos", "interface" : "memory", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "current_sin", "interface" : "memory", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "cos_pe0", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cos_pe1", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cos_pe2", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cos_pe3", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sin_pe0", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sin_pe1", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sin_pe2", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sin_pe3", "interface" : "fifo", "bitwidth" : 19, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 53
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cos_pe0_din sc_out sc_lv 19 signal 2 } 
	{ cos_pe0_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ cos_pe0_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ cos_pe0_full_n sc_in sc_logic 1 signal 2 } 
	{ cos_pe0_write sc_out sc_logic 1 signal 2 } 
	{ cos_pe1_din sc_out sc_lv 19 signal 3 } 
	{ cos_pe1_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ cos_pe1_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ cos_pe1_full_n sc_in sc_logic 1 signal 3 } 
	{ cos_pe1_write sc_out sc_logic 1 signal 3 } 
	{ cos_pe2_din sc_out sc_lv 19 signal 4 } 
	{ cos_pe2_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ cos_pe2_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ cos_pe2_full_n sc_in sc_logic 1 signal 4 } 
	{ cos_pe2_write sc_out sc_logic 1 signal 4 } 
	{ cos_pe3_din sc_out sc_lv 19 signal 5 } 
	{ cos_pe3_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ cos_pe3_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ cos_pe3_full_n sc_in sc_logic 1 signal 5 } 
	{ cos_pe3_write sc_out sc_logic 1 signal 5 } 
	{ sin_pe0_din sc_out sc_lv 19 signal 6 } 
	{ sin_pe0_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ sin_pe0_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ sin_pe0_full_n sc_in sc_logic 1 signal 6 } 
	{ sin_pe0_write sc_out sc_logic 1 signal 6 } 
	{ sin_pe1_din sc_out sc_lv 19 signal 7 } 
	{ sin_pe1_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ sin_pe1_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ sin_pe1_full_n sc_in sc_logic 1 signal 7 } 
	{ sin_pe1_write sc_out sc_logic 1 signal 7 } 
	{ sin_pe2_din sc_out sc_lv 19 signal 8 } 
	{ sin_pe2_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ sin_pe2_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ sin_pe2_full_n sc_in sc_logic 1 signal 8 } 
	{ sin_pe2_write sc_out sc_logic 1 signal 8 } 
	{ sin_pe3_din sc_out sc_lv 19 signal 9 } 
	{ sin_pe3_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ sin_pe3_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ sin_pe3_full_n sc_in sc_logic 1 signal 9 } 
	{ sin_pe3_write sc_out sc_logic 1 signal 9 } 
	{ current_cos_address0 sc_out sc_lv 6 signal 0 } 
	{ current_cos_ce0 sc_out sc_logic 1 signal 0 } 
	{ current_cos_q0 sc_in sc_lv 19 signal 0 } 
	{ current_sin_address0 sc_out sc_lv 6 signal 1 } 
	{ current_sin_ce0 sc_out sc_logic 1 signal 1 } 
	{ current_sin_q0 sc_in sc_lv 19 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cos_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "cos_pe0", "role": "din" }} , 
 	{ "name": "cos_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe0", "role": "num_data_valid" }} , 
 	{ "name": "cos_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe0", "role": "fifo_cap" }} , 
 	{ "name": "cos_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe0", "role": "full_n" }} , 
 	{ "name": "cos_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe0", "role": "write" }} , 
 	{ "name": "cos_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "cos_pe1", "role": "din" }} , 
 	{ "name": "cos_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe1", "role": "num_data_valid" }} , 
 	{ "name": "cos_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe1", "role": "fifo_cap" }} , 
 	{ "name": "cos_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe1", "role": "full_n" }} , 
 	{ "name": "cos_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe1", "role": "write" }} , 
 	{ "name": "cos_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "cos_pe2", "role": "din" }} , 
 	{ "name": "cos_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe2", "role": "num_data_valid" }} , 
 	{ "name": "cos_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe2", "role": "fifo_cap" }} , 
 	{ "name": "cos_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe2", "role": "full_n" }} , 
 	{ "name": "cos_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe2", "role": "write" }} , 
 	{ "name": "cos_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "cos_pe3", "role": "din" }} , 
 	{ "name": "cos_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe3", "role": "num_data_valid" }} , 
 	{ "name": "cos_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cos_pe3", "role": "fifo_cap" }} , 
 	{ "name": "cos_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe3", "role": "full_n" }} , 
 	{ "name": "cos_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cos_pe3", "role": "write" }} , 
 	{ "name": "sin_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sin_pe0", "role": "din" }} , 
 	{ "name": "sin_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe0", "role": "num_data_valid" }} , 
 	{ "name": "sin_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe0", "role": "fifo_cap" }} , 
 	{ "name": "sin_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe0", "role": "full_n" }} , 
 	{ "name": "sin_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe0", "role": "write" }} , 
 	{ "name": "sin_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sin_pe1", "role": "din" }} , 
 	{ "name": "sin_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe1", "role": "num_data_valid" }} , 
 	{ "name": "sin_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe1", "role": "fifo_cap" }} , 
 	{ "name": "sin_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe1", "role": "full_n" }} , 
 	{ "name": "sin_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe1", "role": "write" }} , 
 	{ "name": "sin_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sin_pe2", "role": "din" }} , 
 	{ "name": "sin_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe2", "role": "num_data_valid" }} , 
 	{ "name": "sin_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe2", "role": "fifo_cap" }} , 
 	{ "name": "sin_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe2", "role": "full_n" }} , 
 	{ "name": "sin_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe2", "role": "write" }} , 
 	{ "name": "sin_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "sin_pe3", "role": "din" }} , 
 	{ "name": "sin_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe3", "role": "num_data_valid" }} , 
 	{ "name": "sin_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "sin_pe3", "role": "fifo_cap" }} , 
 	{ "name": "sin_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe3", "role": "full_n" }} , 
 	{ "name": "sin_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sin_pe3", "role": "write" }} , 
 	{ "name": "current_cos_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "current_cos", "role": "address0" }} , 
 	{ "name": "current_cos_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_cos", "role": "ce0" }} , 
 	{ "name": "current_cos_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "current_cos", "role": "q0" }} , 
 	{ "name": "current_sin_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "current_sin", "role": "address0" }} , 
 	{ "name": "current_sin_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "current_sin", "role": "ce0" }} , 
 	{ "name": "current_sin_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "current_sin", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "swiftkv_broadcast_rope",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "66", "EstimateLatencyMax" : "66",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "current_cos", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "current_sin", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "cos_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cos_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cos_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cos_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cos_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cos_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "cos_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "cos_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sin_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "sin_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sin_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "sin_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sin_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "sin_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sin_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "sin_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "rope_broadcast_pair_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_broadcast_rope {
		current_cos {Type I LastRead 0 FirstWrite -1}
		current_sin {Type I LastRead 0 FirstWrite -1}
		cos_pe0 {Type O LastRead -1 FirstWrite 1}
		cos_pe1 {Type O LastRead -1 FirstWrite 1}
		cos_pe2 {Type O LastRead -1 FirstWrite 1}
		cos_pe3 {Type O LastRead -1 FirstWrite 1}
		sin_pe0 {Type O LastRead -1 FirstWrite 1}
		sin_pe1 {Type O LastRead -1 FirstWrite 1}
		sin_pe2 {Type O LastRead -1 FirstWrite 1}
		sin_pe3 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "66", "Max" : "66"}
	, {"Name" : "Interval", "Min" : "66", "Max" : "66"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	current_cos { ap_memory {  { current_cos_address0 mem_address 1 6 }  { current_cos_ce0 mem_ce 1 1 }  { current_cos_q0 in_data 0 19 } } }
	current_sin { ap_memory {  { current_sin_address0 mem_address 1 6 }  { current_sin_ce0 mem_ce 1 1 }  { current_sin_q0 in_data 0 19 } } }
	cos_pe0 { ap_fifo {  { cos_pe0_din fifo_data_in 1 19 }  { cos_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { cos_pe0_fifo_cap fifo_update 0 3 }  { cos_pe0_full_n fifo_status 0 1 }  { cos_pe0_write fifo_port_we 1 1 } } }
	cos_pe1 { ap_fifo {  { cos_pe1_din fifo_data_in 1 19 }  { cos_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { cos_pe1_fifo_cap fifo_update 0 3 }  { cos_pe1_full_n fifo_status 0 1 }  { cos_pe1_write fifo_port_we 1 1 } } }
	cos_pe2 { ap_fifo {  { cos_pe2_din fifo_data_in 1 19 }  { cos_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { cos_pe2_fifo_cap fifo_update 0 3 }  { cos_pe2_full_n fifo_status 0 1 }  { cos_pe2_write fifo_port_we 1 1 } } }
	cos_pe3 { ap_fifo {  { cos_pe3_din fifo_data_in 1 19 }  { cos_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { cos_pe3_fifo_cap fifo_update 0 3 }  { cos_pe3_full_n fifo_status 0 1 }  { cos_pe3_write fifo_port_we 1 1 } } }
	sin_pe0 { ap_fifo {  { sin_pe0_din fifo_data_in 1 19 }  { sin_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { sin_pe0_fifo_cap fifo_update 0 3 }  { sin_pe0_full_n fifo_status 0 1 }  { sin_pe0_write fifo_port_we 1 1 } } }
	sin_pe1 { ap_fifo {  { sin_pe1_din fifo_data_in 1 19 }  { sin_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { sin_pe1_fifo_cap fifo_update 0 3 }  { sin_pe1_full_n fifo_status 0 1 }  { sin_pe1_write fifo_port_we 1 1 } } }
	sin_pe2 { ap_fifo {  { sin_pe2_din fifo_data_in 1 19 }  { sin_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { sin_pe2_fifo_cap fifo_update 0 3 }  { sin_pe2_full_n fifo_status 0 1 }  { sin_pe2_write fifo_port_we 1 1 } } }
	sin_pe3 { ap_fifo {  { sin_pe3_din fifo_data_in 1 19 }  { sin_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { sin_pe3_fifo_cap fifo_update 0 3 }  { sin_pe3_full_n fifo_status 0 1 }  { sin_pe3_write fifo_port_we 1 1 } } }
}
