set moduleName swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop
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
set C_modelName {swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ add_ln1149 int 13 regular  }
	{ value_metadata_stream int 40 regular {fifo 0 volatile }  }
	{ control_stream int 19 regular {fifo 0 volatile }  }
	{ engine0_control_stream int 59 regular {fifo 1 volatile }  }
	{ engine1_control_stream int 59 regular {fifo 1 volatile }  }
	{ engine2_control_stream int 59 regular {fifo 1 volatile }  }
	{ engine3_control_stream int 59 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "add_ln1149", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "value_metadata_stream", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY"} , 
 	{ "Name" : "control_stream", "interface" : "fifo", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "engine0_control_stream", "interface" : "fifo", "bitwidth" : 59, "direction" : "WRITEONLY"} , 
 	{ "Name" : "engine1_control_stream", "interface" : "fifo", "bitwidth" : 59, "direction" : "WRITEONLY"} , 
 	{ "Name" : "engine2_control_stream", "interface" : "fifo", "bitwidth" : 59, "direction" : "WRITEONLY"} , 
 	{ "Name" : "engine3_control_stream", "interface" : "fifo", "bitwidth" : 59, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ value_metadata_stream_dout sc_in sc_lv 40 signal 1 } 
	{ value_metadata_stream_num_data_valid sc_in sc_lv 6 signal 1 } 
	{ value_metadata_stream_fifo_cap sc_in sc_lv 6 signal 1 } 
	{ value_metadata_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ value_metadata_stream_read sc_out sc_logic 1 signal 1 } 
	{ control_stream_dout sc_in sc_lv 19 signal 2 } 
	{ control_stream_num_data_valid sc_in sc_lv 5 signal 2 } 
	{ control_stream_fifo_cap sc_in sc_lv 5 signal 2 } 
	{ control_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ control_stream_read sc_out sc_logic 1 signal 2 } 
	{ engine0_control_stream_din sc_out sc_lv 59 signal 3 } 
	{ engine0_control_stream_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ engine0_control_stream_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ engine0_control_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ engine0_control_stream_write sc_out sc_logic 1 signal 3 } 
	{ engine1_control_stream_din sc_out sc_lv 59 signal 4 } 
	{ engine1_control_stream_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ engine1_control_stream_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ engine1_control_stream_full_n sc_in sc_logic 1 signal 4 } 
	{ engine1_control_stream_write sc_out sc_logic 1 signal 4 } 
	{ engine2_control_stream_din sc_out sc_lv 59 signal 5 } 
	{ engine2_control_stream_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ engine2_control_stream_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ engine2_control_stream_full_n sc_in sc_logic 1 signal 5 } 
	{ engine2_control_stream_write sc_out sc_logic 1 signal 5 } 
	{ engine3_control_stream_din sc_out sc_lv 59 signal 6 } 
	{ engine3_control_stream_num_data_valid sc_in sc_lv 3 signal 6 } 
	{ engine3_control_stream_fifo_cap sc_in sc_lv 3 signal 6 } 
	{ engine3_control_stream_full_n sc_in sc_logic 1 signal 6 } 
	{ engine3_control_stream_write sc_out sc_logic 1 signal 6 } 
	{ add_ln1149 sc_in sc_lv 13 signal 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "value_metadata_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "dout" }} , 
 	{ "name": "value_metadata_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "num_data_valid" }} , 
 	{ "name": "value_metadata_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "fifo_cap" }} , 
 	{ "name": "value_metadata_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "empty_n" }} , 
 	{ "name": "value_metadata_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "value_metadata_stream", "role": "read" }} , 
 	{ "name": "control_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "control_stream", "role": "dout" }} , 
 	{ "name": "control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "num_data_valid" }} , 
 	{ "name": "control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_stream", "role": "fifo_cap" }} , 
 	{ "name": "control_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "empty_n" }} , 
 	{ "name": "control_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_stream", "role": "read" }} , 
 	{ "name": "engine0_control_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":59, "type": "signal", "bundle":{"name": "engine0_control_stream", "role": "din" }} , 
 	{ "name": "engine0_control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine0_control_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine0_control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine0_control_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine0_control_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine0_control_stream", "role": "full_n" }} , 
 	{ "name": "engine0_control_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine0_control_stream", "role": "write" }} , 
 	{ "name": "engine1_control_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":59, "type": "signal", "bundle":{"name": "engine1_control_stream", "role": "din" }} , 
 	{ "name": "engine1_control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine1_control_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine1_control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine1_control_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine1_control_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine1_control_stream", "role": "full_n" }} , 
 	{ "name": "engine1_control_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine1_control_stream", "role": "write" }} , 
 	{ "name": "engine2_control_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":59, "type": "signal", "bundle":{"name": "engine2_control_stream", "role": "din" }} , 
 	{ "name": "engine2_control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine2_control_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine2_control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine2_control_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine2_control_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine2_control_stream", "role": "full_n" }} , 
 	{ "name": "engine2_control_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine2_control_stream", "role": "write" }} , 
 	{ "name": "engine3_control_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":59, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "din" }} , 
 	{ "name": "engine3_control_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "num_data_valid" }} , 
 	{ "name": "engine3_control_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "fifo_cap" }} , 
 	{ "name": "engine3_control_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "full_n" }} , 
 	{ "name": "engine3_control_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "engine3_control_stream", "role": "write" }} , 
 	{ "name": "add_ln1149", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "add_ln1149", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "4098",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "add_ln1149", "Type" : "None", "Direction" : "I"},
			{"Name" : "value_metadata_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "value_metadata_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "control_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine0_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine0_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine1_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine1_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine2_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine2_control_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "engine3_control_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "engine3_control_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "broadcast_update_control_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_broadcast_update_controls_Pipeline_broadcast_update_control_loop {
		add_ln1149 {Type I LastRead 0 FirstWrite -1}
		value_metadata_stream {Type I LastRead 1 FirstWrite -1}
		control_stream {Type I LastRead 1 FirstWrite -1}
		engine0_control_stream {Type O LastRead -1 FirstWrite 1}
		engine1_control_stream {Type O LastRead -1 FirstWrite 1}
		engine2_control_stream {Type O LastRead -1 FirstWrite 1}
		engine3_control_stream {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "4098"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "4098"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	add_ln1149 { ap_none {  { add_ln1149 in_data 0 13 } } }
	value_metadata_stream { ap_fifo {  { value_metadata_stream_dout fifo_data_in 0 40 }  { value_metadata_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { value_metadata_stream_fifo_cap fifo_update 0 6 }  { value_metadata_stream_empty_n fifo_status 0 1 }  { value_metadata_stream_read fifo_port_we 1 1 } } }
	control_stream { ap_fifo {  { control_stream_dout fifo_data_in 0 19 }  { control_stream_num_data_valid fifo_status_num_data_valid 0 5 }  { control_stream_fifo_cap fifo_update 0 5 }  { control_stream_empty_n fifo_status 0 1 }  { control_stream_read fifo_port_we 1 1 } } }
	engine0_control_stream { ap_fifo {  { engine0_control_stream_din fifo_data_in 1 59 }  { engine0_control_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { engine0_control_stream_fifo_cap fifo_update 0 3 }  { engine0_control_stream_full_n fifo_status 0 1 }  { engine0_control_stream_write fifo_port_we 1 1 } } }
	engine1_control_stream { ap_fifo {  { engine1_control_stream_din fifo_data_in 1 59 }  { engine1_control_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { engine1_control_stream_fifo_cap fifo_update 0 3 }  { engine1_control_stream_full_n fifo_status 0 1 }  { engine1_control_stream_write fifo_port_we 1 1 } } }
	engine2_control_stream { ap_fifo {  { engine2_control_stream_din fifo_data_in 1 59 }  { engine2_control_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { engine2_control_stream_fifo_cap fifo_update 0 3 }  { engine2_control_stream_full_n fifo_status 0 1 }  { engine2_control_stream_write fifo_port_we 1 1 } } }
	engine3_control_stream { ap_fifo {  { engine3_control_stream_din fifo_data_in 1 59 }  { engine3_control_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { engine3_control_stream_fifo_cap fifo_update 0 3 }  { engine3_control_stream_full_n fifo_status 0 1 }  { engine3_control_stream_write fifo_port_we 1 1 } } }
}
