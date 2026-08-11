set moduleName int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop
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
set C_modelName {int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ shl_ln int 13 regular  }
	{ p_read int 1 regular  }
	{ final_block_stream int 128 regular {fifo 0 volatile }  }
	{ output_stream int 512 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "shl_ln", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "final_block_stream", "interface" : "fifo", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "output_stream", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ final_block_stream_dout sc_in sc_lv 128 signal 2 } 
	{ final_block_stream_num_data_valid sc_in sc_lv 6 signal 2 } 
	{ final_block_stream_fifo_cap sc_in sc_lv 6 signal 2 } 
	{ final_block_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ final_block_stream_read sc_out sc_logic 1 signal 2 } 
	{ output_stream_din sc_out sc_lv 512 signal 3 } 
	{ output_stream_num_data_valid sc_in sc_lv 5 signal 3 } 
	{ output_stream_fifo_cap sc_in sc_lv 5 signal 3 } 
	{ output_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ output_stream_write sc_out sc_logic 1 signal 3 } 
	{ shl_ln sc_in sc_lv 13 signal 0 } 
	{ p_read sc_in sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "final_block_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "final_block_stream", "role": "dout" }} , 
 	{ "name": "final_block_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "num_data_valid" }} , 
 	{ "name": "final_block_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "final_block_stream", "role": "fifo_cap" }} , 
 	{ "name": "final_block_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "empty_n" }} , 
 	{ "name": "final_block_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "final_block_stream", "role": "read" }} , 
 	{ "name": "output_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "output_stream", "role": "din" }} , 
 	{ "name": "output_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "output_stream", "role": "num_data_valid" }} , 
 	{ "name": "output_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "output_stream", "role": "fifo_cap" }} , 
 	{ "name": "output_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream", "role": "full_n" }} , 
 	{ "name": "output_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream", "role": "write" }} , 
 	{ "name": "shl_ln", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "shl_ln", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1029", "EstimateLatencyMax" : "8069",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "shl_ln", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "final_block_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "final_block_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "pack_dequantized_value_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_pack_dequantized_outputs_Pipeline_pack_dequantized_value_loop {
		shl_ln {Type I LastRead 0 FirstWrite -1}
		p_read {Type I LastRead 0 FirstWrite -1}
		final_block_stream {Type I LastRead 1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1029", "Max" : "8069"}
	, {"Name" : "Interval", "Min" : "1029", "Max" : "8069"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	shl_ln { ap_none {  { shl_ln in_data 0 13 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	final_block_stream { ap_fifo {  { final_block_stream_dout fifo_data_in 0 128 }  { final_block_stream_num_data_valid fifo_status_num_data_valid 0 6 }  { final_block_stream_fifo_cap fifo_update 0 6 }  { final_block_stream_empty_n fifo_status 0 1 }  { final_block_stream_read fifo_port_we 1 1 } } }
	output_stream { ap_fifo {  { output_stream_din fifo_data_in 1 512 }  { output_stream_num_data_valid fifo_status_num_data_valid 0 5 }  { output_stream_fifo_cap fifo_update 0 5 }  { output_stream_full_n fifo_status 0 1 }  { output_stream_write fifo_port_we 1 1 } } }
}
