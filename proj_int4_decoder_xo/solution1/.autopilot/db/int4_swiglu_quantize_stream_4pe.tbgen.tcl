set moduleName int4_swiglu_quantize_stream_4pe
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
set C_modelName {int4_swiglu_quantize_stream_4pe}
set C_modelType { void 0 }
set C_modelArgList {
	{ gate_pe0 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe1 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe2 int 512 regular {array 176 { 1 } 1 1 }  }
	{ gate_pe3 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe0 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe1 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe2 int 512 regular {array 176 { 1 } 1 1 }  }
	{ up_pe3 int 512 regular {array 176 { 1 } 1 1 }  }
	{ quantized_stream int 480 regular {fifo 1 volatile }  }
	{ scale_stream int 32 regular {fifo 1 volatile }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gate_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "gate_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "up_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ gate_pe0_address0 sc_out sc_lv 8 signal 0 } 
	{ gate_pe0_ce0 sc_out sc_logic 1 signal 0 } 
	{ gate_pe0_q0 sc_in sc_lv 512 signal 0 } 
	{ gate_pe1_address0 sc_out sc_lv 8 signal 1 } 
	{ gate_pe1_ce0 sc_out sc_logic 1 signal 1 } 
	{ gate_pe1_q0 sc_in sc_lv 512 signal 1 } 
	{ gate_pe2_address0 sc_out sc_lv 8 signal 2 } 
	{ gate_pe2_ce0 sc_out sc_logic 1 signal 2 } 
	{ gate_pe2_q0 sc_in sc_lv 512 signal 2 } 
	{ gate_pe3_address0 sc_out sc_lv 8 signal 3 } 
	{ gate_pe3_ce0 sc_out sc_logic 1 signal 3 } 
	{ gate_pe3_q0 sc_in sc_lv 512 signal 3 } 
	{ up_pe0_address0 sc_out sc_lv 8 signal 4 } 
	{ up_pe0_ce0 sc_out sc_logic 1 signal 4 } 
	{ up_pe0_q0 sc_in sc_lv 512 signal 4 } 
	{ up_pe1_address0 sc_out sc_lv 8 signal 5 } 
	{ up_pe1_ce0 sc_out sc_logic 1 signal 5 } 
	{ up_pe1_q0 sc_in sc_lv 512 signal 5 } 
	{ up_pe2_address0 sc_out sc_lv 8 signal 6 } 
	{ up_pe2_ce0 sc_out sc_logic 1 signal 6 } 
	{ up_pe2_q0 sc_in sc_lv 512 signal 6 } 
	{ up_pe3_address0 sc_out sc_lv 8 signal 7 } 
	{ up_pe3_ce0 sc_out sc_logic 1 signal 7 } 
	{ up_pe3_q0 sc_in sc_lv 512 signal 7 } 
	{ quantized_stream_din sc_out sc_lv 480 signal 8 } 
	{ quantized_stream_num_data_valid sc_in sc_lv 3 signal 8 } 
	{ quantized_stream_fifo_cap sc_in sc_lv 3 signal 8 } 
	{ quantized_stream_full_n sc_in sc_logic 1 signal 8 } 
	{ quantized_stream_write sc_out sc_logic 1 signal 8 } 
	{ scale_stream_din sc_out sc_lv 32 signal 9 } 
	{ scale_stream_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ scale_stream_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ scale_stream_full_n sc_in sc_logic 1 signal 9 } 
	{ scale_stream_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "gate_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe0", "role": "address0" }} , 
 	{ "name": "gate_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe0", "role": "ce0" }} , 
 	{ "name": "gate_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe0", "role": "q0" }} , 
 	{ "name": "gate_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe1", "role": "address0" }} , 
 	{ "name": "gate_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe1", "role": "ce0" }} , 
 	{ "name": "gate_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe1", "role": "q0" }} , 
 	{ "name": "gate_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe2", "role": "address0" }} , 
 	{ "name": "gate_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe2", "role": "ce0" }} , 
 	{ "name": "gate_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe2", "role": "q0" }} , 
 	{ "name": "gate_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gate_pe3", "role": "address0" }} , 
 	{ "name": "gate_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gate_pe3", "role": "ce0" }} , 
 	{ "name": "gate_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gate_pe3", "role": "q0" }} , 
 	{ "name": "up_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe0", "role": "address0" }} , 
 	{ "name": "up_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe0", "role": "ce0" }} , 
 	{ "name": "up_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe0", "role": "q0" }} , 
 	{ "name": "up_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe1", "role": "address0" }} , 
 	{ "name": "up_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe1", "role": "ce0" }} , 
 	{ "name": "up_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe1", "role": "q0" }} , 
 	{ "name": "up_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe2", "role": "address0" }} , 
 	{ "name": "up_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe2", "role": "ce0" }} , 
 	{ "name": "up_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe2", "role": "q0" }} , 
 	{ "name": "up_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "up_pe3", "role": "address0" }} , 
 	{ "name": "up_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "up_pe3", "role": "ce0" }} , 
 	{ "name": "up_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "up_pe3", "role": "q0" }} , 
 	{ "name": "quantized_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":480, "type": "signal", "bundle":{"name": "quantized_stream", "role": "din" }} , 
 	{ "name": "quantized_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "num_data_valid" }} , 
 	{ "name": "quantized_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "quantized_stream", "role": "fifo_cap" }} , 
 	{ "name": "quantized_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "full_n" }} , 
 	{ "name": "quantized_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "quantized_stream", "role": "write" }} , 
 	{ "name": "scale_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "scale_stream", "role": "din" }} , 
 	{ "name": "scale_stream_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "num_data_valid" }} , 
 	{ "name": "scale_stream_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "scale_stream", "role": "fifo_cap" }} , 
 	{ "name": "scale_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "full_n" }} , 
 	{ "name": "scale_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "scale_stream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "int4_swiglu_quantize_stream_4pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13202", "EstimateLatencyMax" : "13202",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "gate_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "up_pe3", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "quantized_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Port" : "scale_stream", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44", "Parent" : "0", "Child" : ["2", "18", "34", "50", "66", "69", "70", "71", "72", "73", "74", "75", "76"],
		"CDFG" : "int4_swiglu_quantize_four_pes_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "int4_swiglu_quantize_pe0_U0"},
			{"ID" : "18", "Name" : "int4_swiglu_quantize_pe1_U0"},
			{"ID" : "34", "Name" : "int4_swiglu_quantize_pe2_U0"},
			{"ID" : "50", "Name" : "int4_swiglu_quantize_pe3_U0"}],
		"OutputProcess" : [
			{"ID" : "66", "Name" : "int4_swiglu_gather_streams_U0"}],
		"Port" : [
			{"Name" : "gate_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "gate"}]},
			{"Name" : "gate_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "gate"}]},
			{"Name" : "up_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "int4_swiglu_quantize_pe0_U0", "Port" : "up"}]},
			{"Name" : "up_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "18", "SubInstance" : "int4_swiglu_quantize_pe1_U0", "Port" : "up"}]},
			{"Name" : "up_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "34", "SubInstance" : "int4_swiglu_quantize_pe2_U0", "Port" : "up"}]},
			{"Name" : "up_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "int4_swiglu_quantize_pe3_U0", "Port" : "up"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "int4_swiglu_gather_streams_U0", "Port" : "scale_stream"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0", "Parent" : "1", "Child" : ["3", "4", "10", "14", "15", "16", "17"],
		"CDFG" : "int4_swiglu_quantize_pe0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "69", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.swiglu_group_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "2", "Child" : ["5", "6", "7", "8", "9"],
		"CDFG" : "int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_55", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_4_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U949", "Parent" : "4"},
	{"ID" : "6", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U951", "Parent" : "4"},
	{"ID" : "7", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U952", "Parent" : "4"},
	{"ID" : "8", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U953", "Parent" : "4"},
	{"ID" : "9", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "4"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "2", "Child" : ["11", "12", "13"],
		"CDFG" : "int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U964", "Parent" : "10"},
	{"ID" : "12", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U965", "Parent" : "10"},
	{"ID" : "13", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.grp_int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fmul_32ns_32ns_32_4_max_dsp_1_U969", "Parent" : "2"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U970", "Parent" : "2"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U971", "Parent" : "2"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe0_U0.fadd_32ns_32ns_32_7_full_dsp_1_U972", "Parent" : "2"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0", "Parent" : "1", "Child" : ["19", "20", "26", "30", "31", "32", "33"],
		"CDFG" : "int4_swiglu_quantize_pe1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "13201", "EstimateLatencyMax" : "13201",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "20", "SubInstance" : "grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "71", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "72", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.swiglu_group_U", "Parent" : "18"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "18", "Child" : ["21", "22", "23", "24", "25"],
		"CDFG" : "int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_47", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U980", "Parent" : "20"},
	{"ID" : "22", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U982", "Parent" : "20"},
	{"ID" : "23", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U983", "Parent" : "20"},
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U984", "Parent" : "20"},
	{"ID" : "25", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "18", "Child" : ["27", "28", "29"],
		"CDFG" : "int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U993", "Parent" : "26"},
	{"ID" : "28", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U994", "Parent" : "26"},
	{"ID" : "29", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.grp_int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fmul_32ns_32ns_32_4_max_dsp_1_U998", "Parent" : "18"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U999", "Parent" : "18"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1000", "Parent" : "18"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe1_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1001", "Parent" : "18"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0", "Parent" : "1", "Child" : ["35", "36", "42", "46", "47", "48", "49"],
		"CDFG" : "int4_swiglu_quantize_pe2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12601", "EstimateLatencyMax" : "12601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "36", "SubInstance" : "grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "73", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.swiglu_group_U", "Parent" : "34"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "34", "Child" : ["37", "38", "39", "40", "41"],
		"CDFG" : "int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_2_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1008", "Parent" : "36"},
	{"ID" : "38", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1010", "Parent" : "36"},
	{"ID" : "39", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1011", "Parent" : "36"},
	{"ID" : "40", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1012", "Parent" : "36"},
	{"ID" : "41", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "36"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "34", "Child" : ["43", "44", "45"],
		"CDFG" : "int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "43", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1021", "Parent" : "42"},
	{"ID" : "44", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1022", "Parent" : "42"},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.grp_int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "42"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1026", "Parent" : "34"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1027", "Parent" : "34"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1028", "Parent" : "34"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe2_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1029", "Parent" : "34"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0", "Parent" : "1", "Child" : ["51", "52", "58", "62", "63", "64", "65"],
		"CDFG" : "int4_swiglu_quantize_pe3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12601", "EstimateLatencyMax" : "12601",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "52", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "gate", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "52", "SubInstance" : "grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Port" : "up", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["66"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "swiglu_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.swiglu_group_U", "Parent" : "50"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106", "Parent" : "50", "Child" : ["53", "54", "55", "56", "57"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "78", "EstimateLatencyMax" : "78",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "tmp_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "gate", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "up", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_abs_bits_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_word_loop_swiglu_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter45", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter45", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "53", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fmul_32ns_32ns_32_4_max_dsp_1_U1036", "Parent" : "52"},
	{"ID" : "54", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.fexp_32ns_32ns_32_14_full_dsp_1_U1038", "Parent" : "52"},
	{"ID" : "55", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1039", "Parent" : "52"},
	{"ID" : "56", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.sparsemux_33_4_32_1_1_U1040", "Parent" : "52"},
	{"ID" : "57", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop_fu_106.flow_control_loop_pipe_sequential_init_U", "Parent" : "52"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117", "Parent" : "50", "Child" : ["59", "60", "61"],
		"CDFG" : "int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "53", "EstimateLatencyMax" : "53",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "swiglu_group", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "swiglu_quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "59", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1049", "Parent" : "58"},
	{"ID" : "60", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.fcmp_32ns_32ns_1_2_no_dsp_1_U1050", "Parent" : "58"},
	{"ID" : "61", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.grp_int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop_fu_117.flow_control_loop_pipe_sequential_init_U", "Parent" : "58"},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1054", "Parent" : "50"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1055", "Parent" : "50"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1056", "Parent" : "50"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_quantize_pe3_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1057", "Parent" : "50"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0", "Parent" : "1", "Child" : ["67"],
		"CDFG" : "int4_swiglu_gather_streams",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "177", "EstimateLatencyMax" : "881",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "69", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["18"], "DependentChan" : "71", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["34"], "DependentChan" : "73", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["50"], "DependentChan" : "75", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "70", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe0", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["18"], "DependentChan" : "72", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe1", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["34"], "DependentChan" : "74", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe2", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["50"], "DependentChan" : "76", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_pe3", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "quantized_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "67", "SubInstance" : "grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Port" : "scale_stream", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}],
		"Loop" : [
			{"Name" : "swiglu_stream_local_tile_loop_swiglu_stream_pe_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88", "Parent" : "66", "Child" : ["68"],
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
	{"ID" : "68", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.int4_swiglu_gather_streams_U0.grp_int4_swiglu_gather_streams_Pipeline_swiglu_stream_group_loop_fu_88.flow_control_loop_pipe_sequential_init_U", "Parent" : "67"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe0_U", "Parent" : "1"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe0_U", "Parent" : "1"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe1_U", "Parent" : "1"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe1_U", "Parent" : "1"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe2_U", "Parent" : "1"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe2_U", "Parent" : "1"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.quantized_pe3_U", "Parent" : "1"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_swiglu_quantize_four_pes_stream_fu_44.scale_pe3_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	int4_swiglu_quantize_stream_4pe {
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_swiglu_quantize_four_pes_stream {
		gate_pe0 {Type I LastRead 1 FirstWrite -1}
		gate_pe1 {Type I LastRead 1 FirstWrite -1}
		gate_pe2 {Type I LastRead 1 FirstWrite -1}
		gate_pe3 {Type I LastRead 1 FirstWrite -1}
		up_pe0 {Type I LastRead 38 FirstWrite -1}
		up_pe1 {Type I LastRead 38 FirstWrite -1}
		up_pe2 {Type I LastRead 38 FirstWrite -1}
		up_pe3 {Type I LastRead 38 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
	int4_swiglu_quantize_pe0 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 19}
		scale_pe0 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe0_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_55 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_4_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe0_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe1 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe1 {Type O LastRead -1 FirstWrite 19}
		scale_pe1 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe1_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_47 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_3_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe1_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe2 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe2 {Type O LastRead -1 FirstWrite 19}
		scale_pe2 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe2_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_39 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_2_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe2_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe3 {
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 19}
		scale_pe3 {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_word_loop_swiglu_lane_loop {
		swiglu_group {Type O LastRead -1 FirstWrite 45}
		tmp_31 {Type I LastRead 0 FirstWrite -1}
		gate {Type I LastRead 1 FirstWrite -1}
		up {Type I LastRead 38 FirstWrite -1}
		max_abs_bits_1_out {Type O LastRead -1 FirstWrite 44}}
	int4_swiglu_quantize_pe3_Pipeline_swiglu_quantize_reverse_loop {
		swiglu_group {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_swiglu_gather_streams {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}
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
	{"Name" : "Latency", "Min" : "13202", "Max" : "13202"}
	, {"Name" : "Interval", "Min" : "13202", "Max" : "13202"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gate_pe0 { ap_memory {  { gate_pe0_address0 mem_address 1 8 }  { gate_pe0_ce0 mem_ce 1 1 }  { gate_pe0_q0 mem_dout 0 512 } } }
	gate_pe1 { ap_memory {  { gate_pe1_address0 mem_address 1 8 }  { gate_pe1_ce0 mem_ce 1 1 }  { gate_pe1_q0 mem_dout 0 512 } } }
	gate_pe2 { ap_memory {  { gate_pe2_address0 mem_address 1 8 }  { gate_pe2_ce0 mem_ce 1 1 }  { gate_pe2_q0 mem_dout 0 512 } } }
	gate_pe3 { ap_memory {  { gate_pe3_address0 mem_address 1 8 }  { gate_pe3_ce0 mem_ce 1 1 }  { gate_pe3_q0 mem_dout 0 512 } } }
	up_pe0 { ap_memory {  { up_pe0_address0 mem_address 1 8 }  { up_pe0_ce0 mem_ce 1 1 }  { up_pe0_q0 mem_dout 0 512 } } }
	up_pe1 { ap_memory {  { up_pe1_address0 mem_address 1 8 }  { up_pe1_ce0 mem_ce 1 1 }  { up_pe1_q0 mem_dout 0 512 } } }
	up_pe2 { ap_memory {  { up_pe2_address0 mem_address 1 8 }  { up_pe2_ce0 mem_ce 1 1 }  { up_pe2_q0 mem_dout 0 512 } } }
	up_pe3 { ap_memory {  { up_pe3_address0 mem_address 1 8 }  { up_pe3_ce0 mem_ce 1 1 }  { up_pe3_q0 mem_dout 0 512 } } }
	quantized_stream { ap_fifo {  { quantized_stream_din fifo_data_in 1 480 }  { quantized_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_fifo_cap fifo_update 0 3 }  { quantized_stream_full_n fifo_status 0 1 }  { quantized_stream_write fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_din fifo_data_in 1 32 }  { scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_fifo_cap fifo_update 0 3 }  { scale_stream_full_n fifo_status 0 1 }  { scale_stream_write fifo_port_we 1 1 } } }
}
