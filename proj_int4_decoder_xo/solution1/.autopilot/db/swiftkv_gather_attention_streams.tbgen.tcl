set moduleName swiftkv_gather_attention_streams
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
set C_modelName {swiftkv_gather_attention_streams}
set C_modelType { void 0 }
set C_modelArgList {
	{ quantized_pe0 int 480 regular {fifo 0 volatile }  }
	{ quantized_pe1 int 480 regular {fifo 0 volatile }  }
	{ quantized_pe2 int 480 regular {fifo 0 volatile }  }
	{ quantized_pe3 int 480 regular {fifo 0 volatile }  }
	{ scale_pe0 int 32 regular {fifo 0 volatile }  }
	{ scale_pe1 int 32 regular {fifo 0 volatile }  }
	{ scale_pe2 int 32 regular {fifo 0 volatile }  }
	{ scale_pe3 int 32 regular {fifo 0 volatile }  }
	{ activation_q int 480 regular {array 344 { 0 } 0 1 }  }
	{ activation_scale int 512 regular {array 22 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "quantized_pe0", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe1", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe2", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe3", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "scale_pe3", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "activation_q", "interface" : "memory", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 55
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ quantized_pe2_dout sc_in sc_lv 480 signal 2 } 
	{ quantized_pe2_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ quantized_pe2_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ quantized_pe2_empty_n sc_in sc_logic 1 signal 2 } 
	{ quantized_pe2_read sc_out sc_logic 1 signal 2 } 
	{ scale_pe2_dout sc_in sc_lv 32 signal 6 } 
	{ scale_pe2_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ scale_pe2_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ scale_pe2_empty_n sc_in sc_logic 1 signal 6 } 
	{ scale_pe2_read sc_out sc_logic 1 signal 6 } 
	{ quantized_pe1_dout sc_in sc_lv 480 signal 1 } 
	{ quantized_pe1_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ quantized_pe1_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ quantized_pe1_empty_n sc_in sc_logic 1 signal 1 } 
	{ quantized_pe1_read sc_out sc_logic 1 signal 1 } 
	{ scale_pe1_dout sc_in sc_lv 32 signal 5 } 
	{ scale_pe1_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ scale_pe1_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ scale_pe1_empty_n sc_in sc_logic 1 signal 5 } 
	{ scale_pe1_read sc_out sc_logic 1 signal 5 } 
	{ quantized_pe0_dout sc_in sc_lv 480 signal 0 } 
	{ quantized_pe0_num_data_valid sc_in sc_lv 3 signal 0 } 
	{ quantized_pe0_fifo_cap sc_in sc_lv 3 signal 0 } 
	{ quantized_pe0_empty_n sc_in sc_logic 1 signal 0 } 
	{ quantized_pe0_read sc_out sc_logic 1 signal 0 } 
	{ scale_pe0_dout sc_in sc_lv 32 signal 4 } 
	{ scale_pe0_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ scale_pe0_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ scale_pe0_empty_n sc_in sc_logic 1 signal 4 } 
	{ scale_pe0_read sc_out sc_logic 1 signal 4 } 
	{ quantized_pe3_dout sc_in sc_lv 480 signal 3 } 
	{ quantized_pe3_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ quantized_pe3_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ quantized_pe3_empty_n sc_in sc_logic 1 signal 3 } 
	{ quantized_pe3_read sc_out sc_logic 1 signal 3 } 
	{ scale_pe3_dout sc_in sc_lv 32 signal 7 } 
	{ scale_pe3_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ scale_pe3_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ scale_pe3_empty_n sc_in sc_logic 1 signal 7 } 
	{ scale_pe3_read sc_out sc_logic 1 signal 7 } 
	{ activation_q_address0 sc_out sc_lv 9 signal 8 } 
	{ activation_q_ce0 sc_out sc_logic 1 signal 8 } 
	{ activation_q_we0 sc_out sc_logic 1 signal 8 } 
	{ activation_q_d0 sc_out sc_lv 480 signal 8 } 
	{ activation_scale_address0 sc_out sc_lv 5 signal 9 } 
	{ activation_scale_ce0 sc_out sc_logic 1 signal 9 } 
	{ activation_scale_we0 sc_out sc_logic 1 signal 9 } 
	{ activation_scale_d0 sc_out sc_lv 512 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
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
 	{ "name": "activation_q_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "activation_q", "role": "address0" }} , 
 	{ "name": "activation_q_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_q", "role": "ce0" }} , 
 	{ "name": "activation_q_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_q", "role": "we0" }} , 
 	{ "name": "activation_q_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_q", "role": "d0" }} , 
 	{ "name": "activation_scale_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "activation_scale", "role": "address0" }} , 
 	{ "name": "activation_scale_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "ce0" }} , 
 	{ "name": "activation_scale_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale", "role": "we0" }} , 
 	{ "name": "activation_scale_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "activation_scale", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "swiftkv_gather_attention_streams",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_q", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "integrated_gather_local_head_loop_integrated_gather_pe_loop_integrated_gather_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_gather_attention_streams {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}
		activation_q {Type O LastRead -1 FirstWrite 2}
		activation_scale {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "131", "Max" : "131"}
	, {"Name" : "Interval", "Min" : "131", "Max" : "131"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	quantized_pe0 { ap_fifo {  { quantized_pe0_dout fifo_data_in 0 480 }  { quantized_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe0_fifo_cap fifo_update 0 3 }  { quantized_pe0_empty_n fifo_status 0 1 }  { quantized_pe0_read fifo_port_we 1 1 } } }
	quantized_pe1 { ap_fifo {  { quantized_pe1_dout fifo_data_in 0 480 }  { quantized_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe1_fifo_cap fifo_update 0 3 }  { quantized_pe1_empty_n fifo_status 0 1 }  { quantized_pe1_read fifo_port_we 1 1 } } }
	quantized_pe2 { ap_fifo {  { quantized_pe2_dout fifo_data_in 0 480 }  { quantized_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe2_fifo_cap fifo_update 0 3 }  { quantized_pe2_empty_n fifo_status 0 1 }  { quantized_pe2_read fifo_port_we 1 1 } } }
	quantized_pe3 { ap_fifo {  { quantized_pe3_dout fifo_data_in 0 480 }  { quantized_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe3_fifo_cap fifo_update 0 3 }  { quantized_pe3_empty_n fifo_status 0 1 }  { quantized_pe3_read fifo_port_we 1 1 } } }
	scale_pe0 { ap_fifo {  { scale_pe0_dout fifo_data_in 0 32 }  { scale_pe0_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe0_fifo_cap fifo_update 0 3 }  { scale_pe0_empty_n fifo_status 0 1 }  { scale_pe0_read fifo_port_we 1 1 } } }
	scale_pe1 { ap_fifo {  { scale_pe1_dout fifo_data_in 0 32 }  { scale_pe1_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe1_fifo_cap fifo_update 0 3 }  { scale_pe1_empty_n fifo_status 0 1 }  { scale_pe1_read fifo_port_we 1 1 } } }
	scale_pe2 { ap_fifo {  { scale_pe2_dout fifo_data_in 0 32 }  { scale_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe2_fifo_cap fifo_update 0 3 }  { scale_pe2_empty_n fifo_status 0 1 }  { scale_pe2_read fifo_port_we 1 1 } } }
	scale_pe3 { ap_fifo {  { scale_pe3_dout fifo_data_in 0 32 }  { scale_pe3_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_pe3_fifo_cap fifo_update 0 3 }  { scale_pe3_empty_n fifo_status 0 1 }  { scale_pe3_read fifo_port_we 1 1 } } }
	activation_q { ap_memory {  { activation_q_address0 mem_address 1 9 }  { activation_q_ce0 mem_ce 1 1 }  { activation_q_we0 mem_we 1 1 }  { activation_q_d0 mem_din 1 480 } } }
	activation_scale { ap_memory {  { activation_scale_address0 mem_address 1 5 }  { activation_scale_ce0 mem_ce 1 1 }  { activation_scale_we0 mem_we 1 1 }  { activation_scale_d0 mem_din 1 512 } } }
}
