set moduleName int4_rmsnorm_quantize_stream_4pe
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
set C_modelName {int4_rmsnorm_quantize_stream_4pe}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_pe0 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe1 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe2 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ input_pe3 int 512 regular {array 64 { 1 3 } 1 1 }  }
	{ quantized_stream int 480 regular {fifo 1 volatile }  }
	{ scale_stream int 32 regular {fifo 1 volatile }  }
	{ idx int 13 regular  }
	{ idx1 int 13 regular  }
	{ idx2 int 13 regular  }
	{ idx3 int 13 regular  }
	{ model_norm_cache0 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache1 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache2 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
	{ model_norm_cache3 int 512 regular {array 4160 { 1 } 2 1 } {global 0}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_pe0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_pe3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_stream", "interface" : "fifo", "bitwidth" : 480, "direction" : "WRITEONLY"} , 
 	{ "Name" : "scale_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx1", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx2", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx3", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "model_norm_cache0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache1", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache2", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "model_norm_cache3", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_pe0_address0 sc_out sc_lv 6 signal 0 } 
	{ input_pe0_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_pe0_q0 sc_in sc_lv 512 signal 0 } 
	{ input_pe1_address0 sc_out sc_lv 6 signal 1 } 
	{ input_pe1_ce0 sc_out sc_logic 1 signal 1 } 
	{ input_pe1_q0 sc_in sc_lv 512 signal 1 } 
	{ input_pe2_address0 sc_out sc_lv 6 signal 2 } 
	{ input_pe2_ce0 sc_out sc_logic 1 signal 2 } 
	{ input_pe2_q0 sc_in sc_lv 512 signal 2 } 
	{ input_pe3_address0 sc_out sc_lv 6 signal 3 } 
	{ input_pe3_ce0 sc_out sc_logic 1 signal 3 } 
	{ input_pe3_q0 sc_in sc_lv 512 signal 3 } 
	{ quantized_stream_din sc_out sc_lv 480 signal 4 } 
	{ quantized_stream_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ quantized_stream_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ quantized_stream_full_n sc_in sc_logic 1 signal 4 } 
	{ quantized_stream_write sc_out sc_logic 1 signal 4 } 
	{ scale_stream_din sc_out sc_lv 32 signal 5 } 
	{ scale_stream_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ scale_stream_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ scale_stream_full_n sc_in sc_logic 1 signal 5 } 
	{ scale_stream_write sc_out sc_logic 1 signal 5 } 
	{ idx sc_in sc_lv 13 signal 6 } 
	{ idx1 sc_in sc_lv 13 signal 7 } 
	{ idx2 sc_in sc_lv 13 signal 8 } 
	{ idx3 sc_in sc_lv 13 signal 9 } 
	{ model_norm_cache0_address0 sc_out sc_lv 13 signal 10 } 
	{ model_norm_cache0_ce0 sc_out sc_logic 1 signal 10 } 
	{ model_norm_cache0_q0 sc_in sc_lv 512 signal 10 } 
	{ model_norm_cache1_address0 sc_out sc_lv 13 signal 11 } 
	{ model_norm_cache1_ce0 sc_out sc_logic 1 signal 11 } 
	{ model_norm_cache1_q0 sc_in sc_lv 512 signal 11 } 
	{ model_norm_cache2_address0 sc_out sc_lv 13 signal 12 } 
	{ model_norm_cache2_ce0 sc_out sc_logic 1 signal 12 } 
	{ model_norm_cache2_q0 sc_in sc_lv 512 signal 12 } 
	{ model_norm_cache3_address0 sc_out sc_lv 13 signal 13 } 
	{ model_norm_cache3_ce0 sc_out sc_logic 1 signal 13 } 
	{ model_norm_cache3_q0 sc_in sc_lv 512 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_pe0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe0", "role": "address0" }} , 
 	{ "name": "input_pe0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe0", "role": "ce0" }} , 
 	{ "name": "input_pe0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe0", "role": "q0" }} , 
 	{ "name": "input_pe1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe1", "role": "address0" }} , 
 	{ "name": "input_pe1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe1", "role": "ce0" }} , 
 	{ "name": "input_pe1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe1", "role": "q0" }} , 
 	{ "name": "input_pe2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe2", "role": "address0" }} , 
 	{ "name": "input_pe2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe2", "role": "ce0" }} , 
 	{ "name": "input_pe2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe2", "role": "q0" }} , 
 	{ "name": "input_pe3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_pe3", "role": "address0" }} , 
 	{ "name": "input_pe3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_pe3", "role": "ce0" }} , 
 	{ "name": "input_pe3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "input_pe3", "role": "q0" }} , 
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
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx1", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx1", "role": "default" }} , 
 	{ "name": "idx2", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx2", "role": "default" }} , 
 	{ "name": "idx3", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx3", "role": "default" }} , 
 	{ "name": "model_norm_cache0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "address0" }} , 
 	{ "name": "model_norm_cache0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "ce0" }} , 
 	{ "name": "model_norm_cache0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache0", "role": "q0" }} , 
 	{ "name": "model_norm_cache1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "address0" }} , 
 	{ "name": "model_norm_cache1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "ce0" }} , 
 	{ "name": "model_norm_cache1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache1", "role": "q0" }} , 
 	{ "name": "model_norm_cache2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "address0" }} , 
 	{ "name": "model_norm_cache2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "ce0" }} , 
 	{ "name": "model_norm_cache2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache2", "role": "q0" }} , 
 	{ "name": "model_norm_cache3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "address0" }} , 
 	{ "name": "model_norm_cache3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "ce0" }} , 
 	{ "name": "model_norm_cache3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "model_norm_cache3", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "50"],
		"CDFG" : "int4_rmsnorm_quantize_stream_4pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "7892", "EstimateLatencyMax" : "7892",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe0", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe1", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe2", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_int4_rms_sumsq_four_pes_fu_88", "Port" : "input_pe3", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "input_pe3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "quantized_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "scale_stream", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache0", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Port" : "model_norm_cache3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88", "Parent" : "0", "Child" : ["2", "12", "22", "32", "42", "46", "47", "48", "49"],
		"CDFG" : "int4_rms_sumsq_four_pes",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "int4_rms_sumsq_pe_U0"},
			{"ID" : "12", "Name" : "int4_rms_sumsq_pe_10_U0"},
			{"ID" : "22", "Name" : "int4_rms_sumsq_pe_11_U0"},
			{"ID" : "32", "Name" : "int4_rms_sumsq_pe_12_U0"}],
		"OutputProcess" : [
			{"ID" : "42", "Name" : "int4_rms_merge_and_rsqrt_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "int4_rms_sumsq_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "int4_rms_sumsq_pe_10_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "int4_rms_sumsq_pe_11_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "32", "SubInstance" : "int4_rms_sumsq_pe_12_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "42", "SubInstance" : "int4_rms_merge_and_rsqrt_U0", "Port" : "reciprocal_rms"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0", "Parent" : "1", "Child" : ["3", "8", "11"],
		"CDFG" : "int4_rms_sumsq_pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["42"], "DependentChan" : "46", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "2", "Child" : ["4", "5", "6", "7"],
		"CDFG" : "int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1112", "Parent" : "3"},
	{"ID" : "5", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1113", "Parent" : "3"},
	{"ID" : "6", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1114", "Parent" : "3"},
	{"ID" : "7", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "2", "Child" : ["9", "10"],
		"CDFG" : "int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1133", "Parent" : "8"},
	{"ID" : "10", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.grp_int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1151", "Parent" : "2"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0", "Parent" : "1", "Child" : ["13", "18", "21"],
		"CDFG" : "int4_rms_sumsq_pe_10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["42"], "DependentChan" : "47", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "12", "Child" : ["14", "15", "16", "17"],
		"CDFG" : "int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1156", "Parent" : "13"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1157", "Parent" : "13"},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1158", "Parent" : "13"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "12", "Child" : ["19", "20"],
		"CDFG" : "int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "19", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1177", "Parent" : "18"},
	{"ID" : "20", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.grp_int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "18"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_10_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1195", "Parent" : "12"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0", "Parent" : "1", "Child" : ["23", "28", "31"],
		"CDFG" : "int4_rms_sumsq_pe_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "23", "SubInstance" : "grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["42"], "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "22", "Child" : ["24", "25", "26", "27"],
		"CDFG" : "int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1199", "Parent" : "23"},
	{"ID" : "25", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1200", "Parent" : "23"},
	{"ID" : "26", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1201", "Parent" : "23"},
	{"ID" : "27", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "23"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "22", "Child" : ["29", "30"],
		"CDFG" : "int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_01_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "29", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1220", "Parent" : "28"},
	{"ID" : "30", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.grp_int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_11_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1238", "Parent" : "22"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0", "Parent" : "1", "Child" : ["33", "38", "41"],
		"CDFG" : "int4_rms_sumsq_pe_12",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4175", "EstimateLatencyMax" : "4175",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "33", "SubInstance" : "grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Port" : "input_r", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["42"], "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105", "Parent" : "32", "Child" : ["34", "35", "36", "37"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4104", "EstimateLatencyMax" : "4104",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "mux_case_1520_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1419_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1318_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1217_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_1015_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_914_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_813_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_712_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_611_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_510_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "mux_case_02_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "sumsq_word_loop_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.fmul_32ns_32ns_32_4_max_dsp_1_U1242", "Parent" : "33"},
	{"ID" : "35", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1243", "Parent" : "33"},
	{"ID" : "36", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.sparsemux_33_4_32_1_1_U1244", "Parent" : "33"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop_fu_105.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127", "Parent" : "32", "Child" : ["39", "40"],
		"CDFG" : "int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "67", "EstimateLatencyMax" : "67",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "mux_case_02_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_16_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_27_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_38_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_49_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_510_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_611_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_712_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_813_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_914_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1015_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1116_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1217_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1318_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1419_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "mux_case_1520_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "merged_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "merge_sumsq_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "39", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.sparsemux_33_4_32_1_1_U1263", "Parent" : "38"},
	{"ID" : "40", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.grp_int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop_fu_127.flow_control_loop_pipe_sequential_init_U", "Parent" : "38"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_sumsq_pe_12_U0.fadd_32ns_32ns_32_5_no_dsp_1_U1281", "Parent" : "32"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0", "Parent" : "1", "Child" : ["43", "44", "45"],
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
			{"Name" : "partial_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "46", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["12"], "DependentChan" : "47", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["22"], "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "partial_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["32"], "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "partial_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "reciprocal_rms", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fadd_32ns_32ns_32_7_full_dsp_1_U1284", "Parent" : "42"},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1285", "Parent" : "42"},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.int4_rms_merge_and_rsqrt_U0.frsqrt_32ns_32ns_32_17_full_dsp_1_U1286", "Parent" : "42"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.partial_0_U", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.partial_1_U", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.partial_2_U", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_sumsq_four_pes_fu_88.partial_3_U", "Parent" : "1"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101", "Parent" : "0", "Child" : ["51", "66", "81", "96", "111", "113", "114", "115", "116", "117", "118", "119", "120"],
		"CDFG" : "int4_rms_normalize_quantize_four_pes_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "51", "Name" : "int4_rms_normalize_quantize_pe_U0"},
			{"ID" : "66", "Name" : "int4_rms_normalize_quantize_pe_13_U0"},
			{"ID" : "81", "Name" : "int4_rms_normalize_quantize_pe_14_U0"},
			{"ID" : "96", "Name" : "int4_rms_normalize_quantize_pe_15_U0"}],
		"OutputProcess" : [
			{"ID" : "111", "Name" : "int4_rms_gather_streams_U0"}],
		"Port" : [
			{"Name" : "input_pe0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "51", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "81", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "input_r"}]},
			{"Name" : "input_pe3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "96", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "input_r"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "111", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "quantized_stream"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "111", "SubInstance" : "int4_rms_gather_streams_U0", "Port" : "scale_stream"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx1", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx2", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx3", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "51", "SubInstance" : "int4_rms_normalize_quantize_pe_U0", "Port" : "model_norm_cache0"}]},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "66", "SubInstance" : "int4_rms_normalize_quantize_pe_13_U0", "Port" : "model_norm_cache1"}]},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "81", "SubInstance" : "int4_rms_normalize_quantize_pe_14_U0", "Port" : "model_norm_cache2"}]},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "96", "SubInstance" : "int4_rms_normalize_quantize_pe_15_U0", "Port" : "model_norm_cache3"}]}]},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0", "Parent" : "50", "Child" : ["52", "53", "58", "63", "64", "65"],
		"CDFG" : "int4_rms_normalize_quantize_pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "53", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "113", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "114", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "53", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Port" : "model_norm_cache0", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.normalized_U", "Parent" : "51"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124", "Parent" : "51", "Child" : ["54", "55", "56", "57"],
		"CDFG" : "int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache0", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "54", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1303", "Parent" : "53"},
	{"ID" : "55", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1304", "Parent" : "53"},
	{"ID" : "56", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.sparsemux_33_4_32_1_1_U1305", "Parent" : "53"},
	{"ID" : "57", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "53"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "51", "Child" : ["59", "60", "61", "62"],
		"CDFG" : "int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop",
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
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_07_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "59", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1313", "Parent" : "58"},
	{"ID" : "60", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1316", "Parent" : "58"},
	{"ID" : "61", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1317", "Parent" : "58"},
	{"ID" : "62", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.grp_int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "58"},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1321", "Parent" : "51"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1322", "Parent" : "51"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1323", "Parent" : "51"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0", "Parent" : "50", "Child" : ["67", "68", "73", "78", "79", "80"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "115", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "116", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "68", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache1", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.normalized_U", "Parent" : "66"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "66", "Child" : ["69", "70", "71", "72"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache1", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "69", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1331", "Parent" : "68"},
	{"ID" : "70", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1332", "Parent" : "68"},
	{"ID" : "71", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1333", "Parent" : "68"},
	{"ID" : "72", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "68"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "66", "Child" : ["74", "75", "76", "77"],
		"CDFG" : "int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop",
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
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_07_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "74", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1341", "Parent" : "73"},
	{"ID" : "75", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1344", "Parent" : "73"},
	{"ID" : "76", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1345", "Parent" : "73"},
	{"ID" : "77", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.grp_int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "73"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1349", "Parent" : "66"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1350", "Parent" : "66"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_13_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1351", "Parent" : "66"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0", "Parent" : "50", "Child" : ["82", "83", "88", "93", "94", "95"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "117", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "118", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache2", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.normalized_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "81", "Child" : ["84", "85", "86", "87"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache2", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "84", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1359", "Parent" : "83"},
	{"ID" : "85", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1360", "Parent" : "83"},
	{"ID" : "86", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1361", "Parent" : "83"},
	{"ID" : "87", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "83"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "81", "Child" : ["89", "90", "91", "92"],
		"CDFG" : "int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop",
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
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "89", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1369", "Parent" : "88"},
	{"ID" : "90", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1372", "Parent" : "88"},
	{"ID" : "91", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1373", "Parent" : "88"},
	{"ID" : "92", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.grp_int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "88"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1377", "Parent" : "81"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1378", "Parent" : "81"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_14_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1379", "Parent" : "81"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0", "Parent" : "50", "Child" : ["97", "98", "103", "108", "109", "110"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3713", "EstimateLatencyMax" : "3713",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "input_r", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "119", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["111"], "DependentChan" : "120", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "98", "SubInstance" : "grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Port" : "model_norm_cache3", "Inst_start_state" : "2", "Inst_end_state" : "3"}]}],
		"Loop" : [
			{"Name" : "normalize_group_loop", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state20"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.normalized_U", "Parent" : "96"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124", "Parent" : "96", "Child" : ["99", "100", "101", "102"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "44", "EstimateLatencyMax" : "44",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_r", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "reciprocal_rms", "Type" : "None", "Direction" : "I"},
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_abs_bits_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "model_norm_cache3", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "normalize_word_loop_normalize_lane_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter11", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter11", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "99", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.fmul_32ns_32ns_32_4_max_dsp_1_U1387", "Parent" : "98"},
	{"ID" : "100", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1388", "Parent" : "98"},
	{"ID" : "101", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.sparsemux_33_4_32_1_1_U1389", "Parent" : "98"},
	{"ID" : "102", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo_fu_124.flow_control_loop_pipe_sequential_init_U", "Parent" : "98"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137", "Parent" : "96", "Child" : ["104", "105", "106", "107"],
		"CDFG" : "int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop",
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
			{"Name" : "normalized", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "inverse_scale", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_word_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_reverse_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter20", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter20", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "104", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fadd_32ns_32ns_32_7_full_dsp_1_U1397", "Parent" : "103"},
	{"ID" : "105", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1400", "Parent" : "103"},
	{"ID" : "106", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.fcmp_32ns_32ns_1_2_no_dsp_1_U1401", "Parent" : "103"},
	{"ID" : "107", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.grp_int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop_fu_137.flow_control_loop_pipe_sequential_init_U", "Parent" : "103"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fmul_32ns_32ns_32_4_max_dsp_1_U1405", "Parent" : "96"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fdiv_32ns_32ns_32_12_no_dsp_1_U1406", "Parent" : "96"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_normalize_quantize_pe_15_U0.fcmp_32ns_32ns_1_2_no_dsp_1_U1407", "Parent" : "96"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0", "Parent" : "50", "Child" : ["112"],
		"CDFG" : "int4_rms_gather_streams",
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
			{"Name" : "quantized_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["51"], "DependentChan" : "113", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "115", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["81"], "DependentChan" : "117", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["96"], "DependentChan" : "119", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "quantized_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["51"], "DependentChan" : "114", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["66"], "DependentChan" : "116", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["81"], "DependentChan" : "118", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_pe3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["96"], "DependentChan" : "120", "DependentChanDepth" : "4", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "scale_pe3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "quantized_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "quantized_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "scale_stream", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "scale_stream_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "rms_stream_local_tile_loop_rms_stream_pe_loop_rms_stream_group_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "1"}}]},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.int4_rms_gather_streams_U0.flow_control_loop_pipe_U", "Parent" : "111"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe0_U", "Parent" : "50"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe0_U", "Parent" : "50"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe1_U", "Parent" : "50"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe1_U", "Parent" : "50"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe2_U", "Parent" : "50"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe2_U", "Parent" : "50"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.quantized_pe3_U", "Parent" : "50"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_int4_rms_normalize_quantize_four_pes_stream_fu_101.scale_pe3_U", "Parent" : "50"}]}


set ArgLastReadFirstWriteLatency {
	int4_rmsnorm_quantize_stream_4pe {
		input_pe0 {Type I LastRead 1 FirstWrite -1}
		input_pe1 {Type I LastRead 1 FirstWrite -1}
		input_pe2 {Type I LastRead 1 FirstWrite -1}
		input_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		idx {Type I LastRead 3 FirstWrite -1}
		idx1 {Type I LastRead 3 FirstWrite -1}
		idx2 {Type I LastRead 3 FirstWrite -1}
		idx3 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_sumsq_four_pes {
		input_pe0 {Type I LastRead 0 FirstWrite -1}
		input_pe1 {Type I LastRead 0 FirstWrite -1}
		input_pe2 {Type I LastRead 0 FirstWrite -1}
		input_pe3 {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type O LastRead -1 FirstWrite 49}}
	int4_rms_sumsq_pe {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_0 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_10 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_1 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_10_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_10_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_11 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_2 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_11_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_11_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_01_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_sumsq_pe_12 {
		input_r {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type O LastRead -1 FirstWrite 4}}
	int4_rms_sumsq_pe_12_Pipeline_sumsq_word_loop_sumsq_lane_loop {
		input_r {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1419_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1318_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1217_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1116_out {Type O LastRead -1 FirstWrite 6}
		mux_case_1015_out {Type O LastRead -1 FirstWrite 6}
		mux_case_914_out {Type O LastRead -1 FirstWrite 6}
		mux_case_813_out {Type O LastRead -1 FirstWrite 6}
		mux_case_712_out {Type O LastRead -1 FirstWrite 6}
		mux_case_611_out {Type O LastRead -1 FirstWrite 6}
		mux_case_510_out {Type O LastRead -1 FirstWrite 6}
		mux_case_49_out {Type O LastRead -1 FirstWrite 6}
		mux_case_38_out {Type O LastRead -1 FirstWrite 6}
		mux_case_27_out {Type O LastRead -1 FirstWrite 6}
		mux_case_16_out {Type O LastRead -1 FirstWrite 6}
		mux_case_02_out {Type O LastRead -1 FirstWrite 6}}
	int4_rms_sumsq_pe_12_Pipeline_merge_sumsq_lane_loop {
		mux_case_02_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_16_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_27_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_38_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_49_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_510_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_611_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_712_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_813_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_914_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1015_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1116_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1217_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1318_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1419_reload {Type I LastRead 0 FirstWrite -1}
		mux_case_1520_reload {Type I LastRead 0 FirstWrite -1}
		merged_out {Type O LastRead -1 FirstWrite 1}}
	int4_rms_merge_and_rsqrt {
		partial_0 {Type I LastRead 0 FirstWrite -1}
		partial_1 {Type I LastRead 0 FirstWrite -1}
		partial_2 {Type I LastRead 0 FirstWrite -1}
		partial_3 {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type O LastRead -1 FirstWrite 49}}
	int4_rms_normalize_quantize_four_pes_stream {
		input_pe0 {Type I LastRead 1 FirstWrite -1}
		input_pe1 {Type I LastRead 1 FirstWrite -1}
		input_pe2 {Type I LastRead 1 FirstWrite -1}
		input_pe3 {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}
		idx {Type I LastRead 0 FirstWrite -1}
		idx1 {Type I LastRead 0 FirstWrite -1}
		idx2 {Type I LastRead 0 FirstWrite -1}
		idx3 {Type I LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe0 {Type O LastRead -1 FirstWrite 19}
		scale_pe0 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_Pipeline_normalize_word_loop_normalize_lane_loop {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_8_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache0 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_07_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_13 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe1 {Type O LastRead -1 FirstWrite 19}
		scale_pe1 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_13_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_7_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache1 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_13_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_07_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_14 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe2 {Type O LastRead -1 FirstWrite 19}
		scale_pe2 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_14_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_6_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache2 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_14_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_normalize_quantize_pe_15 {
		input_r {Type I LastRead 1 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		quantized_pe3 {Type O LastRead -1 FirstWrite 19}
		scale_pe3 {Type O LastRead -1 FirstWrite 19}
		idx {Type I LastRead 0 FirstWrite -1}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_15_Pipeline_normalize_word_loop_normalize_lane_lo {
		empty {Type I LastRead 0 FirstWrite -1}
		input_r {Type I LastRead 1 FirstWrite -1}
		idx {Type I LastRead 0 FirstWrite -1}
		reciprocal_rms {Type I LastRead 0 FirstWrite -1}
		normalized {Type O LastRead -1 FirstWrite 11}
		max_abs_bits_5_out {Type O LastRead -1 FirstWrite 10}
		model_norm_cache3 {Type I LastRead 3 FirstWrite -1}}
	int4_rms_normalize_quantize_pe_15_Pipeline_quantize_reverse_loop {
		normalized {Type I LastRead 0 FirstWrite -1}
		inverse_scale {Type I LastRead 0 FirstWrite -1}
		quantized_word_out {Type O LastRead -1 FirstWrite 19}}
	int4_rms_gather_streams {
		quantized_pe0 {Type I LastRead 1 FirstWrite -1}
		quantized_pe1 {Type I LastRead 1 FirstWrite -1}
		quantized_pe2 {Type I LastRead 1 FirstWrite -1}
		quantized_pe3 {Type I LastRead 1 FirstWrite -1}
		scale_pe0 {Type I LastRead 1 FirstWrite -1}
		scale_pe1 {Type I LastRead 1 FirstWrite -1}
		scale_pe2 {Type I LastRead 1 FirstWrite -1}
		scale_pe3 {Type I LastRead 1 FirstWrite -1}
		quantized_stream {Type O LastRead -1 FirstWrite 2}
		scale_stream {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7892", "Max" : "7892"}
	, {"Name" : "Interval", "Min" : "7892", "Max" : "7892"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_pe0 { ap_memory {  { input_pe0_address0 mem_address 1 6 }  { input_pe0_ce0 mem_ce 1 1 }  { input_pe0_q0 mem_dout 0 512 } } }
	input_pe1 { ap_memory {  { input_pe1_address0 mem_address 1 6 }  { input_pe1_ce0 mem_ce 1 1 }  { input_pe1_q0 mem_dout 0 512 } } }
	input_pe2 { ap_memory {  { input_pe2_address0 mem_address 1 6 }  { input_pe2_ce0 mem_ce 1 1 }  { input_pe2_q0 mem_dout 0 512 } } }
	input_pe3 { ap_memory {  { input_pe3_address0 mem_address 1 6 }  { input_pe3_ce0 mem_ce 1 1 }  { input_pe3_q0 mem_dout 0 512 } } }
	quantized_stream { ap_fifo {  { quantized_stream_din fifo_data_in 1 480 }  { quantized_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { quantized_stream_fifo_cap fifo_update 0 3 }  { quantized_stream_full_n fifo_status 0 1 }  { quantized_stream_write fifo_port_we 1 1 } } }
	scale_stream { ap_fifo {  { scale_stream_din fifo_data_in 1 32 }  { scale_stream_num_data_valid fifo_status_num_data_valid 0 3 }  { scale_stream_fifo_cap fifo_update 0 3 }  { scale_stream_full_n fifo_status 0 1 }  { scale_stream_write fifo_port_we 1 1 } } }
	idx { ap_none {  { idx in_data 0 13 } } }
	idx1 { ap_none {  { idx1 in_data 0 13 } } }
	idx2 { ap_none {  { idx2 in_data 0 13 } } }
	idx3 { ap_none {  { idx3 in_data 0 13 } } }
	model_norm_cache0 { ap_memory {  { model_norm_cache0_address0 mem_address 1 13 }  { model_norm_cache0_ce0 mem_ce 1 1 }  { model_norm_cache0_q0 mem_dout 0 512 } } }
	model_norm_cache1 { ap_memory {  { model_norm_cache1_address0 mem_address 1 13 }  { model_norm_cache1_ce0 mem_ce 1 1 }  { model_norm_cache1_q0 mem_dout 0 512 } } }
	model_norm_cache2 { ap_memory {  { model_norm_cache2_address0 mem_address 1 13 }  { model_norm_cache2_ce0 mem_ce 1 1 }  { model_norm_cache2_q0 mem_dout 0 512 } } }
	model_norm_cache3 { ap_memory {  { model_norm_cache3_address0 mem_address 1 13 }  { model_norm_cache3_ce0 mem_ce 1 1 }  { model_norm_cache3_q0 mem_dout 0 512 } } }
}
