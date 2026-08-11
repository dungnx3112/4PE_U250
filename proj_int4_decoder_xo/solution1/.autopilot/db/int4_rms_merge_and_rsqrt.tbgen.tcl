set moduleName int4_rms_merge_and_rsqrt
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
set C_modelName {int4_rms_merge_and_rsqrt}
set C_modelType { void 0 }
set C_modelArgList {
	{ partial_0 int 32 regular {fifo 0 volatile }  }
	{ partial_1 int 32 regular {fifo 0 volatile }  }
	{ partial_2 int 32 regular {fifo 0 volatile }  }
	{ partial_3 int 32 regular {fifo 0 volatile }  }
	{ reciprocal_rms float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "partial_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "partial_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "partial_2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "partial_3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "reciprocal_rms", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
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
	{ partial_0_dout sc_in sc_lv 32 signal 0 } 
	{ partial_0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ partial_0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ partial_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ partial_0_read sc_out sc_logic 1 signal 0 } 
	{ partial_1_dout sc_in sc_lv 32 signal 1 } 
	{ partial_1_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ partial_1_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ partial_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ partial_1_read sc_out sc_logic 1 signal 1 } 
	{ partial_2_dout sc_in sc_lv 32 signal 2 } 
	{ partial_2_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ partial_2_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ partial_2_empty_n sc_in sc_logic 1 signal 2 } 
	{ partial_2_read sc_out sc_logic 1 signal 2 } 
	{ partial_3_dout sc_in sc_lv 32 signal 3 } 
	{ partial_3_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ partial_3_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ partial_3_empty_n sc_in sc_logic 1 signal 3 } 
	{ partial_3_read sc_out sc_logic 1 signal 3 } 
	{ reciprocal_rms sc_out sc_lv 32 signal 4 } 
	{ reciprocal_rms_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "partial_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "partial_0", "role": "dout" }} , 
 	{ "name": "partial_0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_0", "role": "num_data_valid" }} , 
 	{ "name": "partial_0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_0", "role": "fifo_cap" }} , 
 	{ "name": "partial_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_0", "role": "empty_n" }} , 
 	{ "name": "partial_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_0", "role": "read" }} , 
 	{ "name": "partial_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "partial_1", "role": "dout" }} , 
 	{ "name": "partial_1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_1", "role": "num_data_valid" }} , 
 	{ "name": "partial_1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_1", "role": "fifo_cap" }} , 
 	{ "name": "partial_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_1", "role": "empty_n" }} , 
 	{ "name": "partial_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_1", "role": "read" }} , 
 	{ "name": "partial_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "partial_2", "role": "dout" }} , 
 	{ "name": "partial_2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_2", "role": "num_data_valid" }} , 
 	{ "name": "partial_2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_2", "role": "fifo_cap" }} , 
 	{ "name": "partial_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_2", "role": "empty_n" }} , 
 	{ "name": "partial_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_2", "role": "read" }} , 
 	{ "name": "partial_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "partial_3", "role": "dout" }} , 
 	{ "name": "partial_3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_3", "role": "num_data_valid" }} , 
 	{ "name": "partial_3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "partial_3", "role": "fifo_cap" }} , 
 	{ "name": "partial_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_3", "role": "empty_n" }} , 
 	{ "name": "partial_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "partial_3", "role": "read" }} , 
 	{ "name": "reciprocal_rms", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "reciprocal_rms", "role": "default" }} , 
 	{ "name": "reciprocal_rms_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "reciprocal_rms", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "int4_rms_merge_and_rsqrt",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "49", "EstimateLatencyMax" : "49",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U1284", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U1285", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.frsqrt_32ns_32ns_32_17_full_dsp_1_U1286", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_rms_merge_and_rsqrt {
		partial_0 {Type I LastRead 0 FirstWrite -1}
		partial_1 {Type I LastRead 0 FirstWrite -1}
		partial_2 {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type O LastRead -1 FirstWrite 49}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "49", "Max" : "49"}
	, {"Name" : "Interval", "Min" : "49", "Max" : "49"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	partial_0 { ap_fifo {  { partial_0_dout fifo_data_in 0 32 }  { partial_0_num_data_valid fifo_status_num_data_valid 0 3 }  { partial_0_fifo_cap fifo_update 0 3 }  { partial_0_empty_n fifo_status 0 1 }  { partial_0_read fifo_port_we 1 1 } } }
	partial_1 { ap_fifo {  { partial_1_dout fifo_data_in 0 32 }  { partial_1_num_data_valid fifo_status_num_data_valid 0 3 }  { partial_1_fifo_cap fifo_update 0 3 }  { partial_1_empty_n fifo_status 0 1 }  { partial_1_read fifo_port_we 1 1 } } }
	partial_2 { ap_fifo {  { partial_2_dout fifo_data_in 0 32 }  { partial_2_num_data_valid fifo_status_num_data_valid 0 3 }  { partial_2_fifo_cap fifo_update 0 3 }  { partial_2_empty_n fifo_status 0 1 }  { partial_2_read fifo_port_we 1 1 } } }
	partial_3 { ap_fifo {  { partial_3_dout fifo_data_in 0 32 }  { partial_3_num_data_valid fifo_status_num_data_valid 0 3 }  { partial_3_fifo_cap fifo_update 0 3 }  { partial_3_empty_n fifo_status 0 1 }  { partial_3_read fifo_port_we 1 1 } } }
	reciprocal_rms { ap_vld {  { reciprocal_rms out_data 1 32 }  { reciprocal_rms_ap_vld out_vld 1 1 } } }
}
