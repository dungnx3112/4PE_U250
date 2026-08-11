set moduleName swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop
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
set C_modelName {swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ update_phase_count int 16 regular  }
	{ engine3_phase_stream int 57 regular {fifo 1 volatile }  }
	{ engine3_control_stream int 59 regular {fifo 0 volatile }  }
	{ value0_engine3_stream int 128 regular {fifo 0 volatile }  }
	{ value1_engine3_stream int 128 regular {fifo 0 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "update_phase_count", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "engine3_phase_stream", "interface" : "fifo", "bitwidth" : 57, "direction" : "WRITEONLY"} , 
 	{ "Name" : "engine3_control_stream", "interface" : "fifo", "bitwidth" : 59, "direction" : "READONLY"} , 
 	{ "Name" : "value0_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "value1_engine3_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ engine3_control_stream_dout sc_in sc_lv 59 signal 2 } 
	{ engine3_control_stream_num_data_valid sc_in sc_lv 3 signal 2 } 
	{ engine3_control_stream_fifo_cap sc_in sc_lv 3 signal 2 } 
	{ engine3_control_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ engine3_control_stream_read sc_out sc_logic 1 signal 2 } 
	{ value0_engine3_stream_dout sc_in sc_lv 128 signal 3 } 
	{ value0_engine3_stream_num_data_valid sc_in sc_lv 6 signal 3 } 
	{ value0_engine3_stream_fifo_cap sc_in sc_lv 6 signal 3 } 
	{ value0_engine3_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ value0_engine3_stream_read sc_out sc_logic 1 signal 3 } 
	{ value1_engine3_stream_dout sc_in sc_lv 128 signal 4 } 
	{ value1_engine3_stream_num_data_valid sc_in sc_lv 6 signal 4 } 
	{ value1_engine3_stream_fifo_cap sc_in sc_lv 6 signal 4 } 
	{ value1_engine3_stream_empty_n sc_in sc_logic 1 signal 4 } 
	{ value1_engine3_stream_read sc_out sc_logic 1 signal 4 } 
	{ engine3_phase_stream_din sc_out sc_lv 57 signal 1 } 
	{ engine3_phase_stream_num_data_valid sc_in sc_lv 4 signal 1 } 
	{ engine3_phase_stream_fifo_cap sc_in sc_lv 4 signal 1 } 
	{ engine3_phase_stream_full_n sc_in sc_logic 1 signal 1 } 
	{ engine3_phase_stream_write sc_out sc_logic 1 signal 1 } 
	{ update_phase_count sc_in sc_lv 16 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "engine3_control_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":59, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "dout" }} , 
 	{ "name": "engine3_control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine3_control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine3_control_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "empty_n" }} , 
 	{ "name": "engine3_control_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "read" }} , 
 	{ "name": "value0_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "dout" }} , 
 	{ "name": "value0_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value0_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value0_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value0_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value0_engine3_stream", "role": "read" }} , 
 	{ "name": "value1_engine3_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "dout" }} , 
 	{ "name": "value1_engine3_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "num_data_valid" }} , 
 	{ "name": "value1_engine3_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "fifo_cap" }} , 
 	{ "name": "value1_engine3_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "empty_n" }} , 
 	{ "name": "value1_engine3_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value1_engine3_stream", "role": "read" }} , 
 	{ "name": "engine3_phase_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":57, "type": "signal", "bundle":{"name": "engine3_phase_stream", "role": "din" }} , 
 	{ "name": "engine3_phase_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "engine3_phase_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine3_phase_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "engine3_phase_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine3_phase_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_phase_stream", "role": "full_n" }} , 
 	{ "name": "engine3_phase_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_phase_stream", "role": "write" }} , 
 	{ "name": "update_phase_count", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "update_phase_count", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "32771",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "update_phase_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "engine3_phase_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine3_phase_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "engine3_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value0_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value0_engine3_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "value1_engine3_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value1_engine3_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "prepare_update_engine_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_9_2_5_1_1_U557", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_prepare_update_engine_phases_Pipeline_prepare_update_engine_phase_loop {
		update_phase_count {Type I LastRead 0 FirstWrite -1}
		engine3_phase_stream {Type O LastRead -1 FirstWrite 2}
		engine3_control_stream {Type I LastRead 1 FirstWrite -1}
		value0_engine3_stream {Type I LastRead 1 FirstWrite -1}
		value1_engine3_stream {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "32771"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "32771"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	update_phase_count { ap_none {  { update_phase_count in_data 0 16 } } }
	engine3_phase_stream { ap_fifo {  { engine3_phase_stream_din fifo_data_in 1 57 }  { engine3_phase_stream_num_data_valid fifo_status_num_data_valid 0 4 }  { engine3_phase_stream_fifo_cap fifo_update 0 4 }  { engine3_phase_stream_full_n fifo_status 0 1 }  { engine3_phase_stream_write fifo_port_we 1 1 } } }
	engine3_control_stream { ap_fifo {  { engine3_control_stream_dout fifo_data_in 0 59 }  { engine3_control_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { engine3_control_stream_fifo_cap fifo_update 0 3 }  { engine3_control_stream_empty_n fifo_status 0 1 }  { engine3_control_stream_read fifo_port_we 1 1 } } }
	value0_engine3_stream { ap_fifo {  { value0_engine3_stream_dout fifo_data_in 0 128 }  { value0_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value0_engine3_stream_fifo_cap fifo_update 0 6 }  { value0_engine3_stream_empty_n fifo_status 0 1 }  { value0_engine3_stream_read fifo_port_we 1 1 } } }
	value1_engine3_stream { ap_fifo {  { value1_engine3_stream_dout fifo_data_in 0 128 }  { value1_engine3_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value1_engine3_stream_fifo_cap fifo_update 0 6 }  { value1_engine3_stream_empty_n fifo_status 0 1 }  { value1_engine3_stream_read fifo_port_we 1 1 } } }
}
