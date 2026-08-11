set moduleName swiftkv_broadcast_pe_commands
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {swiftkv_broadcast_pe_commands}
set C_modelType { void 0 }
set C_modelArgList {
	{ swiftkv_command_pe0 int 18 regular {fifo 1 volatile }  }
	{ swiftkv_command_pe1 int 18 regular {fifo 1 volatile }  }
	{ swiftkv_command_pe2 int 18 regular {fifo 1 volatile }  }
	{ swiftkv_command_pe3 int 18 regular {fifo 1 volatile }  }
	{ layer_index int 6 regular  }
	{ position int 12 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "swiftkv_command_pe0", "interface" : "fifo", "bitwidth" : 18, "direction" : "WRITEONLY"} , 
 	{ "Name" : "swiftkv_command_pe1", "interface" : "fifo", "bitwidth" : 18, "direction" : "WRITEONLY"} , 
 	{ "Name" : "swiftkv_command_pe2", "interface" : "fifo", "bitwidth" : 18, "direction" : "WRITEONLY"} , 
 	{ "Name" : "swiftkv_command_pe3", "interface" : "fifo", "bitwidth" : 18, "direction" : "WRITEONLY"} , 
 	{ "Name" : "layer_index", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "position", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ swiftkv_command_pe0_din sc_out sc_lv 18 signal 0 } 
	{ swiftkv_command_pe0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ swiftkv_command_pe0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ swiftkv_command_pe0_full_n sc_in sc_logic 1 signal 0 } 
	{ swiftkv_command_pe0_write sc_out sc_logic 1 signal 0 } 
	{ swiftkv_command_pe1_din sc_out sc_lv 18 signal 1 } 
	{ swiftkv_command_pe1_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ swiftkv_command_pe1_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ swiftkv_command_pe1_full_n sc_in sc_logic 1 signal 1 } 
	{ swiftkv_command_pe1_write sc_out sc_logic 1 signal 1 } 
	{ swiftkv_command_pe2_din sc_out sc_lv 18 signal 2 } 
	{ swiftkv_command_pe2_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ swiftkv_command_pe2_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ swiftkv_command_pe2_full_n sc_in sc_logic 1 signal 2 } 
	{ swiftkv_command_pe2_write sc_out sc_logic 1 signal 2 } 
	{ swiftkv_command_pe3_din sc_out sc_lv 18 signal 3 } 
	{ swiftkv_command_pe3_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ swiftkv_command_pe3_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ swiftkv_command_pe3_full_n sc_in sc_logic 1 signal 3 } 
	{ swiftkv_command_pe3_write sc_out sc_logic 1 signal 3 } 
	{ layer_index sc_in sc_lv 6 signal 4 } 
	{ position sc_in sc_lv 12 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "swiftkv_command_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "swiftkv_command_pe0", "role": "din" }} , 
 	{ "name": "swiftkv_command_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe0", "role": "num_data_valid" }} , 
 	{ "name": "swiftkv_command_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe0", "role": "fifo_cap" }} , 
 	{ "name": "swiftkv_command_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe0", "role": "full_n" }} , 
 	{ "name": "swiftkv_command_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe0", "role": "write" }} , 
 	{ "name": "swiftkv_command_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "swiftkv_command_pe1", "role": "din" }} , 
 	{ "name": "swiftkv_command_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe1", "role": "num_data_valid" }} , 
 	{ "name": "swiftkv_command_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe1", "role": "fifo_cap" }} , 
 	{ "name": "swiftkv_command_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe1", "role": "full_n" }} , 
 	{ "name": "swiftkv_command_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe1", "role": "write" }} , 
 	{ "name": "swiftkv_command_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "swiftkv_command_pe2", "role": "din" }} , 
 	{ "name": "swiftkv_command_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe2", "role": "num_data_valid" }} , 
 	{ "name": "swiftkv_command_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe2", "role": "fifo_cap" }} , 
 	{ "name": "swiftkv_command_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe2", "role": "full_n" }} , 
 	{ "name": "swiftkv_command_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe2", "role": "write" }} , 
 	{ "name": "swiftkv_command_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "swiftkv_command_pe3", "role": "din" }} , 
 	{ "name": "swiftkv_command_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe3", "role": "num_data_valid" }} , 
 	{ "name": "swiftkv_command_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "swiftkv_command_pe3", "role": "fifo_cap" }} , 
 	{ "name": "swiftkv_command_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe3", "role": "full_n" }} , 
 	{ "name": "swiftkv_command_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "swiftkv_command_pe3", "role": "write" }} , 
 	{ "name": "layer_index", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "layer_index", "role": "default" }} , 
 	{ "name": "position", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "position", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "swiftkv_broadcast_pe_commands",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiftkv_command_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "swiftkv_command_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "swiftkv_command_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "swiftkv_command_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "swiftkv_command_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "swiftkv_command_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "swiftkv_command_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "swiftkv_command_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer_index", "Type" : "None", "Direction" : "I"},
			{"Name" : "position", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_broadcast_pe_commands {
		swiftkv_command_pe0 {Type O LastRead -1 FirstWrite 0}
		swiftkv_command_pe1 {Type O LastRead -1 FirstWrite 0}
		swiftkv_command_pe2 {Type O LastRead -1 FirstWrite 0}
		swiftkv_command_pe3 {Type O LastRead -1 FirstWrite 0}
		layer_index {Type I LastRead 0 FirstWrite -1}
		position {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	swiftkv_command_pe0 { ap_fifo {  { swiftkv_command_pe0_din fifo_data_in 1 18 }  { swiftkv_command_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { swiftkv_command_pe0_fifo_cap fifo_update 0 3 }  { swiftkv_command_pe0_full_n fifo_status 0 1 }  { swiftkv_command_pe0_write fifo_port_we 1 1 } } }
	swiftkv_command_pe1 { ap_fifo {  { swiftkv_command_pe1_din fifo_data_in 1 18 }  { swiftkv_command_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { swiftkv_command_pe1_fifo_cap fifo_update 0 3 }  { swiftkv_command_pe1_full_n fifo_status 0 1 }  { swiftkv_command_pe1_write fifo_port_we 1 1 } } }
	swiftkv_command_pe2 { ap_fifo {  { swiftkv_command_pe2_din fifo_data_in 1 18 }  { swiftkv_command_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { swiftkv_command_pe2_fifo_cap fifo_update 0 3 }  { swiftkv_command_pe2_full_n fifo_status 0 1 }  { swiftkv_command_pe2_write fifo_port_we 1 1 } } }
	swiftkv_command_pe3 { ap_fifo {  { swiftkv_command_pe3_din fifo_data_in 1 18 }  { swiftkv_command_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { swiftkv_command_pe3_fifo_cap fifo_update 0 3 }  { swiftkv_command_pe3_full_n fifo_status 0 1 }  { swiftkv_command_pe3_write fifo_port_we 1 1 } } }
	layer_index { ap_none {  { layer_index in_data 0 6 } } }
	position { ap_none {  { position in_data 0 12 } } }
}
