set moduleName int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop
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
set C_modelName {int4_cache_and_replay_activation<2>_Pipeline_cache_local_activation_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ shl_ln int 9 regular  }
	{ quantized_pe2 int 480 regular {fifo 0 volatile }  }
	{ activation_cache int 480 regular {array 344 { 0 } 0 1 }  }
	{ activation_scale_pe2 int 32 regular {fifo 0 volatile }  }
	{ scale_cache float 32 regular {array 344 { 0 } 0 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_pe2", "interface" : "fifo", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "activation_cache", "interface" : "memory", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "activation_scale_pe2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "scale_cache", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ quantized_pe2_dout sc_in sc_lv 480 signal 1 } 
	{ quantized_pe2_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ quantized_pe2_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ quantized_pe2_empty_n sc_in sc_logic 1 signal 1 } 
	{ quantized_pe2_read sc_out sc_logic 1 signal 1 } 
	{ activation_scale_pe2_dout sc_in sc_lv 32 signal 3 } 
	{ activation_scale_pe2_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ activation_scale_pe2_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ activation_scale_pe2_empty_n sc_in sc_logic 1 signal 3 } 
	{ activation_scale_pe2_read sc_out sc_logic 1 signal 3 } 
	{ shl_ln sc_in sc_lv 9 signal 0 } 
	{ activation_cache_address0 sc_out sc_lv 9 signal 2 } 
	{ activation_cache_ce0 sc_out sc_logic 1 signal 2 } 
	{ activation_cache_we0 sc_out sc_logic 1 signal 2 } 
	{ activation_cache_d0 sc_out sc_lv 480 signal 2 } 
	{ scale_cache_address0 sc_out sc_lv 9 signal 4 } 
	{ scale_cache_ce0 sc_out sc_logic 1 signal 4 } 
	{ scale_cache_we0 sc_out sc_logic 1 signal 4 } 
	{ scale_cache_d0 sc_out sc_lv 32 signal 4 } 
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
 	{ "name": "activation_scale_pe2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "dout" }} , 
 	{ "name": "activation_scale_pe2_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "num_data_valid" }} , 
 	{ "name": "activation_scale_pe2_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "fifo_cap" }} , 
 	{ "name": "activation_scale_pe2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "empty_n" }} , 
 	{ "name": "activation_scale_pe2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_scale_pe2", "role": "read" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "activation_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "activation_cache", "role": "address0" }} , 
 	{ "name": "activation_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_cache", "role": "ce0" }} , 
 	{ "name": "activation_cache_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_cache", "role": "we0" }} , 
 	{ "name": "activation_cache_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_cache", "role": "d0" }} , 
 	{ "name": "scale_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "scale_cache", "role": "address0" }} , 
 	{ "name": "scale_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_cache", "role": "ce0" }} , 
 	{ "name": "scale_cache_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_cache", "role": "we0" }} , 
 	{ "name": "scale_cache_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_cache", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130", "EstimateLatencyMax" : "346",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "activation_scale_pe2", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "activation_scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "cache_local_activation_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_cache_and_replay_activation_2_Pipeline_cache_local_activation_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		activation_cache {Type O LastRead -1 FirstWrite 1}
		activation_scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_cache {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "130", "Max" : "346"}
	, {"Name" : "Interval", "Min" : "130", "Max" : "346"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	shl_ln { ap_none {  { shl_ln in_data 0 9 } } }
	quantized_pe2 { ap_fifo {  { quantized_pe2_dout fifo_data_in 0 480 }  { quantized_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_pe2_fifo_cap fifo_update 0 3 }  { quantized_pe2_empty_n fifo_status 0 1 }  { quantized_pe2_read fifo_port_we 1 1 } } }
	activation_cache { ap_memory {  { activation_cache_address0 mem_address 1 9 }  { activation_cache_ce0 mem_ce 1 1 }  { activation_cache_we0 mem_we 1 1 }  { activation_cache_d0 mem_din 1 480 } } }
	activation_scale_pe2 { ap_fifo {  { activation_scale_pe2_dout fifo_data_in 0 32 }  { activation_scale_pe2_num_data_valid fifo_status_num_data_valid 0 3 }  { activation_scale_pe2_fifo_cap fifo_update 0 3 }  { activation_scale_pe2_empty_n fifo_status 0 1 }  { activation_scale_pe2_read fifo_port_we 1 1 } } }
	scale_cache { ap_memory {  { scale_cache_address0 mem_address 1 9 }  { scale_cache_ce0 mem_ce 1 1 }  { scale_cache_we0 mem_we 1 1 }  { scale_cache_d0 mem_din 1 32 } } }
}
