set moduleName int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1
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
set C_modelName {int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl.1}
set C_modelType { void 0 }
set C_modelArgList {
	{ mul_ln380 int 15 regular  }
	{ shl_ln int 9 regular  }
	{ activation_cache int 480 regular {array 344 { 1 } 1 1 }  }
	{ replay_activation_stream int 480 regular {fifo 1 volatile }  }
	{ scale_cache float 32 regular {array 344 { 1 } 1 1 }  }
	{ replay_scale_stream int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "mul_ln380", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "activation_cache", "interface" : "memory", "bitwidth" : 480, "direction" : "READONLY"} , 
 	{ "Name" : "replay_activation_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_cache", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "replay_scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ replay_activation_stream_din sc_out sc_lv 480 signal 3 } 
	{ replay_activation_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ replay_activation_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ replay_activation_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ replay_activation_stream_write sc_out sc_logic 1 signal 3 } 
	{ replay_scale_stream_din sc_out sc_lv 32 signal 5 } 
	{ replay_scale_stream_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ replay_scale_stream_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ replay_scale_stream_full_n sc_in sc_logic 1 signal 5 } 
	{ replay_scale_stream_write sc_out sc_logic 1 signal 5 } 
	{ mul_ln380 sc_in sc_lv 15 signal 0 } 
	{ shl_ln sc_in sc_lv 9 signal 1 } 
	{ activation_cache_address0 sc_out sc_lv 9 signal 2 } 
	{ activation_cache_ce0 sc_out sc_logic 1 signal 2 } 
	{ activation_cache_q0 sc_in sc_lv 480 signal 2 } 
	{ scale_cache_address0 sc_out sc_lv 9 signal 4 } 
	{ scale_cache_ce0 sc_out sc_logic 1 signal 4 } 
	{ scale_cache_q0 sc_in sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "replay_activation_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "din" }} , 
 	{ "name": "replay_activation_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_activation_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_activation_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "full_n" }} , 
 	{ "name": "replay_activation_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_activation_stream", "role": "write" }} , 
 	{ "name": "replay_scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "din" }} , 
 	{ "name": "replay_scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "replay_scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "replay_scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "full_n" }} , 
 	{ "name": "replay_scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "replay_scale_stream", "role": "write" }} , 
 	{ "name": "mul_ln380", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln380", "role": "default" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "activation_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "activation_cache", "role": "address0" }} , 
 	{ "name": "activation_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "activation_cache", "role": "ce0" }} , 
 	{ "name": "activation_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "activation_cache", "role": "q0" }} , 
 	{ "name": "scale_cache_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "scale_cache", "role": "address0" }} , 
 	{ "name": "scale_cache_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_cache", "role": "ce0" }} , 
 	{ "name": "scale_cache_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_cache", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1026", "EstimateLatencyMax" : "21674",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mul_ln380", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "activation_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_activation_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_activation_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_cache", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "replay_scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "replay_scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "replay_local_activation_tile_loop_replay_local_activation_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_cache_and_replay_activation_Pipeline_replay_local_activation_tile_loop_repl_1 {
		mul_ln380 {Type I LastRead 0 FirstWrite -1}
		shl_ln {Type I LastRead 0 FirstWrite -1}
		activation_cache {Type I LastRead 0 FirstWrite -1}
		replay_activation_stream {Type O LastRead -1 FirstWrite 1}
		scale_cache {Type I LastRead 0 FirstWrite -1}
		replay_scale_stream {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1026", "Max" : "21674"}
	, {"Name" : "Interval", "Min" : "1026", "Max" : "21674"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mul_ln380 { ap_none {  { mul_ln380 in_data 0 15 } } }
	shl_ln { ap_none {  { shl_ln in_data 0 9 } } }
	activation_cache { ap_memory {  { activation_cache_address0 mem_address 1 9 }  { activation_cache_ce0 mem_ce 1 1 }  { activation_cache_q0 in_data 0 480 } } }
	replay_activation_stream { ap_fifo {  { replay_activation_stream_din fifo_data_in 1 480 }  { replay_activation_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_activation_stream_fifo_cap fifo_update 0 3 }  { replay_activation_stream_full_n fifo_status 0 1 }  { replay_activation_stream_write fifo_port_we 1 1 } } }
	scale_cache { ap_memory {  { scale_cache_address0 mem_address 1 9 }  { scale_cache_ce0 mem_ce 1 1 }  { scale_cache_q0 in_data 0 32 } } }
	replay_scale_stream { ap_fifo {  { replay_scale_stream_din fifo_data_in 1 32 }  { replay_scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { replay_scale_stream_fifo_cap fifo_update 0 3 }  { replay_scale_stream_full_n fifo_status 0 1 }  { replay_scale_stream_write fifo_port_we 1 1 } } }
}
