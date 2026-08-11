set moduleName int4_broadcast_linear_commands
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
set C_modelName {int4_broadcast_linear_commands}
set C_modelType { void 0 }
set C_modelArgList {
	{ linear_command_pe0 int 14 regular {fifo 1 volatile }  }
	{ linear_command_pe1 int 14 regular {fifo 1 volatile }  }
	{ linear_command_pe2 int 14 regular {fifo 1 volatile }  }
	{ linear_command_pe3 int 14 regular {fifo 1 volatile }  }
	{ local_tiles_0 int 6 regular  }
	{ local_tiles_1 int 6 regular  }
	{ local_tiles_2 int 6 regular  }
	{ local_tiles_3 int 6 regular  }
	{ input_tiles int 6 regular  }
	{ output_fxp uint 1 regular  }
	{ fuse_residual uint 1 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "linear_command_pe0", "interface" : "fifo", "bitwidth" : 14, "direction" : "WRITEONLY"} , 
 	{ "Name" : "linear_command_pe1", "interface" : "fifo", "bitwidth" : 14, "direction" : "WRITEONLY"} , 
 	{ "Name" : "linear_command_pe2", "interface" : "fifo", "bitwidth" : 14, "direction" : "WRITEONLY"} , 
 	{ "Name" : "linear_command_pe3", "interface" : "fifo", "bitwidth" : 14, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_tiles_0", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "local_tiles_3", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_tiles", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "output_fxp", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "fuse_residual", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ linear_command_pe0_din sc_out sc_lv 14 signal 0 } 
	{ linear_command_pe0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ linear_command_pe0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ linear_command_pe0_full_n sc_in sc_logic 1 signal 0 } 
	{ linear_command_pe0_write sc_out sc_logic 1 signal 0 } 
	{ linear_command_pe1_din sc_out sc_lv 14 signal 1 } 
	{ linear_command_pe1_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ linear_command_pe1_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ linear_command_pe1_full_n sc_in sc_logic 1 signal 1 } 
	{ linear_command_pe1_write sc_out sc_logic 1 signal 1 } 
	{ linear_command_pe2_din sc_out sc_lv 14 signal 2 } 
	{ linear_command_pe2_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ linear_command_pe2_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ linear_command_pe2_full_n sc_in sc_logic 1 signal 2 } 
	{ linear_command_pe2_write sc_out sc_logic 1 signal 2 } 
	{ linear_command_pe3_din sc_out sc_lv 14 signal 3 } 
	{ linear_command_pe3_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ linear_command_pe3_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ linear_command_pe3_full_n sc_in sc_logic 1 signal 3 } 
	{ linear_command_pe3_write sc_out sc_logic 1 signal 3 } 
	{ local_tiles_0 sc_in sc_lv 6 signal 4 } 
	{ local_tiles_1 sc_in sc_lv 6 signal 5 } 
	{ local_tiles_2 sc_in sc_lv 6 signal 6 } 
	{ local_tiles_3 sc_in sc_lv 6 signal 7 } 
	{ input_tiles sc_in sc_lv 6 signal 8 } 
	{ output_fxp sc_in sc_lv 1 signal 9 } 
	{ fuse_residual sc_in sc_lv 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "linear_command_pe0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "linear_command_pe0", "role": "din" }} , 
 	{ "name": "linear_command_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe0", "role": "num_data_valid" }} , 
 	{ "name": "linear_command_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe0", "role": "fifo_cap" }} , 
 	{ "name": "linear_command_pe0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe0", "role": "full_n" }} , 
 	{ "name": "linear_command_pe0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe0", "role": "write" }} , 
 	{ "name": "linear_command_pe1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "din" }} , 
 	{ "name": "linear_command_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "num_data_valid" }} , 
 	{ "name": "linear_command_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "fifo_cap" }} , 
 	{ "name": "linear_command_pe1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "full_n" }} , 
 	{ "name": "linear_command_pe1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe1", "role": "write" }} , 
 	{ "name": "linear_command_pe2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "linear_command_pe2", "role": "din" }} , 
 	{ "name": "linear_command_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe2", "role": "num_data_valid" }} , 
 	{ "name": "linear_command_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe2", "role": "fifo_cap" }} , 
 	{ "name": "linear_command_pe2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe2", "role": "full_n" }} , 
 	{ "name": "linear_command_pe2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe2", "role": "write" }} , 
 	{ "name": "linear_command_pe3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "linear_command_pe3", "role": "din" }} , 
 	{ "name": "linear_command_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe3", "role": "num_data_valid" }} , 
 	{ "name": "linear_command_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "linear_command_pe3", "role": "fifo_cap" }} , 
 	{ "name": "linear_command_pe3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe3", "role": "full_n" }} , 
 	{ "name": "linear_command_pe3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "linear_command_pe3", "role": "write" }} , 
 	{ "name": "local_tiles_0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_0", "role": "default" }} , 
 	{ "name": "local_tiles_1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_1", "role": "default" }} , 
 	{ "name": "local_tiles_2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_2", "role": "default" }} , 
 	{ "name": "local_tiles_3", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_tiles_3", "role": "default" }} , 
 	{ "name": "input_tiles", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_tiles", "role": "default" }} , 
 	{ "name": "output_fxp", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_fxp", "role": "default" }} , 
 	{ "name": "fuse_residual", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "fuse_residual", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "int4_broadcast_linear_commands",
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
			{"Name" : "linear_command_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "linear_command_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0","0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "linear_command_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "local_tiles_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "local_tiles_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_tiles", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_fxp", "Type" : "None", "Direction" : "I"},
			{"Name" : "fuse_residual", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	int4_broadcast_linear_commands {
		linear_command_pe0 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe1 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe2 {Type O LastRead -1 FirstWrite 0}
		linear_command_pe3 {Type O LastRead -1 FirstWrite 0}
		local_tiles_0 {Type I LastRead 0 FirstWrite -1}
		local_tiles_1 {Type I LastRead 0 FirstWrite -1}
		local_tiles_2 {Type I LastRead 0 FirstWrite -1}
		local_tiles_3 {Type I LastRead 0 FirstWrite -1}
		input_tiles {Type I LastRead 0 FirstWrite -1}
		output_fxp {Type I LastRead 0 FirstWrite -1}
		fuse_residual {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	linear_command_pe0 { ap_fifo {  { linear_command_pe0_din fifo_data_in 1 14 }  { linear_command_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { linear_command_pe0_fifo_cap fifo_update 0 3 }  { linear_command_pe0_full_n fifo_status 0 1 }  { linear_command_pe0_write fifo_port_we 1 1 } } }
	linear_command_pe1 { ap_fifo {  { linear_command_pe1_din fifo_data_in 1 14 }  { linear_command_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { linear_command_pe1_fifo_cap fifo_update 0 3 }  { linear_command_pe1_full_n fifo_status 0 1 }  { linear_command_pe1_write fifo_port_we 1 1 } } }
	linear_command_pe2 { ap_fifo {  { linear_command_pe2_din fifo_data_in 1 14 }  { linear_command_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { linear_command_pe2_fifo_cap fifo_update 0 3 }  { linear_command_pe2_full_n fifo_status 0 1 }  { linear_command_pe2_write fifo_port_we 1 1 } } }
	linear_command_pe3 { ap_fifo {  { linear_command_pe3_din fifo_data_in 1 14 }  { linear_command_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { linear_command_pe3_fifo_cap fifo_update 0 3 }  { linear_command_pe3_full_n fifo_status 0 1 }  { linear_command_pe3_write fifo_port_we 1 1 } } }
	local_tiles_0 { ap_none {  { local_tiles_0 in_data 0 6 } } }
	local_tiles_1 { ap_none {  { local_tiles_1 in_data 0 6 } } }
	local_tiles_2 { ap_none {  { local_tiles_2 in_data 0 6 } } }
	local_tiles_3 { ap_none {  { local_tiles_3 in_data 0 6 } } }
	input_tiles { ap_none {  { input_tiles in_data 0 6 } } }
	output_fxp { ap_none {  { output_fxp in_data 0 1 } } }
	fuse_residual { ap_none {  { fuse_residual in_data 0 1 } } }
}
