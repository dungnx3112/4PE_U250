set moduleName int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop
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
set C_modelName {int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ quantized_stream int 480 regular {fifo 1 volatile }  }
	{ scale_stream int 32 regular {fifo 1 volatile }  }
	{ quantized_pe0 int 480 regular {fifo 0 volatile }  }
	{ scale_pe0 int 32 regular {fifo 0 volatile }  }
	{ select_ln946 int 3 regular  }
	{ quantized_pe1 int 480 regular {fifo 0 volatile }  }
	{ scale_pe1 int 32 regular {fifo 0 volatile }  }
	{ quantized_pe2 int 480 regular {fifo 0 volatile }  }
	{ scale_pe2 int 32 regular {fifo 0 volatile }  }
	{ quantized_pe3 int 480 regular {fifo 0 volatile }  }
	{ scale_pe3 int 32 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "quantized_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_pe0", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "select_ln946", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe1", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe2", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 57
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ quantized_pe2_dout sc_in sc_lv 480 signal 7 } 
	{ quantized_pe2_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ quantized_pe2_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ quantized_pe2_empty_n sc_in sc_logic 1 signal 7 } 
	{ quantized_pe2_read sc_out sc_logic 1 signal 7 } 
	{ scale_pe2_dout sc_in sc_lv 32 signal 8 } 
	{ scale_pe2_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ scale_pe2_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ scale_pe2_empty_n sc_in sc_logic 1 signal 8 } 
	{ scale_pe2_read sc_out sc_logic 1 signal 8 } 
	{ quantized_pe1_dout sc_in sc_lv 480 signal 5 } 
	{ quantized_pe1_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ quantized_pe1_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ quantized_pe1_empty_n sc_in sc_logic 1 signal 5 } 
	{ quantized_pe1_read sc_out sc_logic 1 signal 5 } 
	{ scale_pe1_dout sc_in sc_lv 32 signal 6 } 
	{ scale_pe1_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ scale_pe1_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ scale_pe1_empty_n sc_in sc_logic 1 signal 6 } 
	{ scale_pe1_read sc_out sc_logic 1 signal 6 } 
	{ quantized_pe0_dout sc_in sc_lv 480 signal 2 } 
	{ quantized_pe0_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ quantized_pe0_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ quantized_pe0_empty_n sc_in sc_logic 1 signal 2 } 
	{ quantized_pe0_read sc_out sc_logic 1 signal 2 } 
	{ scale_pe0_dout sc_in sc_lv 32 signal 3 } 
	{ scale_pe0_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ scale_pe0_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ scale_pe0_empty_n sc_in sc_logic 1 signal 3 } 
	{ scale_pe0_read sc_out sc_logic 1 signal 3 } 
	{ quantized_pe3_dout sc_in sc_lv 480 signal 9 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ quantized_pe3_empty_n sc_in sc_logic 1 signal 9 } 
	{ quantized_pe3_read sc_out sc_logic 1 signal 9 } 
	{ scale_pe3_dout sc_in sc_lv 32 signal 10 } 
	{ scale_pe3_num_data_valid sc_in sc_lv 3 signal 10 } 
	{ scale_pe3_fifo_cap sc_in sc_lv 3 signal 10 } 
	{ scale_pe3_empty_n sc_in sc_logic 1 signal 10 } 
	{ scale_pe3_read sc_out sc_logic 1 signal 10 } 
	{ quantized_stream_din sc_out sc_lv 480 signal 0 } 
	{ quantized_stream_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ quantized_stream_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ quantized_stream_full_n sc_in sc_logic 1 signal 0 } 
	{ quantized_stream_write sc_out sc_logic 1 signal 0 } 
	{ scale_stream_din sc_out sc_lv 32 signal 1 } 
	{ scale_stream_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ scale_stream_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ scale_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ scale_stream_write sc_out sc_logic 1 signal 1 } 
	{ select_ln946 sc_in sc_lv 3 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "quantized_pe2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "dout" }} , 
 	{ "name": "quantized_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "empty_n" }} , 
 	{ "name": "quantized_pe2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe2", "role": "read" }} , 
 	{ "name": "scale_pe2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe2", "role": "dout" }} , 
 	{ "name": "scale_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe2", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe2", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe2", "role": "empty_n" }} , 
 	{ "name": "scale_pe2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe2", "role": "read" }} , 
 	{ "name": "quantized_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "dout" }} , 
 	{ "name": "quantized_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "empty_n" }} , 
 	{ "name": "quantized_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe1", "role": "read" }} , 
 	{ "name": "scale_pe1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe1", "role": "dout" }} , 
 	{ "name": "scale_pe1_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe1", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe1_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe1", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe1", "role": "empty_n" }} , 
 	{ "name": "scale_pe1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe1", "role": "read" }} , 
 	{ "name": "quantized_pe0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "dout" }} , 
 	{ "name": "quantized_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "empty_n" }} , 
 	{ "name": "quantized_pe0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe0", "role": "read" }} , 
 	{ "name": "scale_pe0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe0", "role": "dout" }} , 
 	{ "name": "scale_pe0_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe0", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe0_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe0", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "empty_n" }} , 
 	{ "name": "scale_pe0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe0", "role": "read" }} , 
 	{ "name": "quantized_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "dout" }} , 
 	{ "name": "quantized_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "num_data_valid" }} , 
 	{ "name": "quantized_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "fifo_cap" }} , 
 	{ "name": "quantized_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "empty_n" }} , 
 	{ "name": "quantized_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_pe3", "role": "read" }} , 
 	{ "name": "scale_pe3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_pe3", "role": "dout" }} , 
 	{ "name": "scale_pe3_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "num_data_valid" }} , 
 	{ "name": "scale_pe3_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_pe3", "role": "fifo_cap" }} , 
 	{ "name": "scale_pe3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "empty_n" }} , 
 	{ "name": "scale_pe3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_pe3", "role": "read" }} , 
 	{ "name": "quantized_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream", "role": "din" }} , 
 	{ "name": "quantized_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "num_data_valid" }} , 
 	{ "name": "quantized_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "fifo_cap" }} , 
 	{ "name": "quantized_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "full_n" }} , 
 	{ "name": "quantized_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "write" }} , 
 	{ "name": "scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream", "role": "din" }} , 
 	{ "name": "scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "full_n" }} , 
 	{ "name": "scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "write" }} , 
 	{ "name": "select_ln946", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "select_ln946", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7", "EstimateLatencyMax" : "7",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "scale_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "select_ln946", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop {
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		select_ln946 {Type I LastRead 0 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	quantized_stream { ap_fifo {  { quantized_stream_din fifo_data_in 1 480 }  { quantized_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_fifo_cap fifo_update 0 3 }  { quantized_stream_full_n fifo_status 0 1 }  { quantized_stream_write fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_din fifo_data_in 1 32 }  { scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_fifo_cap fifo_update 0 3 }  { scale_stream_full_n fifo_status 0 1 }  { scale_stream_write fifo_port_we 1 1 } } }
	quantized_pe0 { ap_fifo {  { quantized_pe0_dout fifo_data_in 0 480 }  { quantized_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe0_fifo_cap fifo_update 0 3 }  { quantized_pe0_empty_n fifo_status 0 1 }  { quantized_pe0_read fifo_port_we 1 1 } } }
	scale_pe0 { ap_fifo {  { scale_pe0_dout fifo_data_in 0 32 }  { scale_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe0_fifo_cap fifo_update 0 3 }  { scale_pe0_empty_n fifo_status 0 1 }  { scale_pe0_read fifo_port_we 1 1 } } }
	select_ln946 { ap_none {  { select_ln946 in_data 0 3 } } }
	quantized_pe1 { ap_fifo {  { quantized_pe1_dout fifo_data_in 0 480 }  { quantized_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe1_fifo_cap fifo_update 0 3 }  { quantized_pe1_empty_n fifo_status 0 1 }  { quantized_pe1_read fifo_port_we 1 1 } } }
	scale_pe1 { ap_fifo {  { scale_pe1_dout fifo_data_in 0 32 }  { scale_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe1_fifo_cap fifo_update 0 3 }  { scale_pe1_empty_n fifo_status 0 1 }  { scale_pe1_read fifo_port_we 1 1 } } }
	quantized_pe2 { ap_fifo {  { quantized_pe2_dout fifo_data_in 0 480 }  { quantized_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe2_fifo_cap fifo_update 0 3 }  { quantized_pe2_empty_n fifo_status 0 1 }  { quantized_pe2_read fifo_port_we 1 1 } } }
	scale_pe2 { ap_fifo {  { scale_pe2_dout fifo_data_in 0 32 }  { scale_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe2_fifo_cap fifo_update 0 3 }  { scale_pe2_empty_n fifo_status 0 1 }  { scale_pe2_read fifo_port_we 1 1 } } }
	quantized_pe3 { ap_fifo {  { quantized_pe3_dout fifo_data_in 0 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_empty_n fifo_status 0 1 }  { quantized_pe3_read fifo_port_we 1 1 } } }
	scale_pe3 { ap_fifo {  { scale_pe3_dout fifo_data_in 0 32 }  { scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe3_fifo_cap fifo_update 0 3 }  { scale_pe3_empty_n fifo_status 0 1 }  { scale_pe3_read fifo_port_we 1 1 } } }
}
