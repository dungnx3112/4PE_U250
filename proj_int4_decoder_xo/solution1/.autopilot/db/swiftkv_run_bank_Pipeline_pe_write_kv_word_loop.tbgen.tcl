set moduleName swiftkv_run_bank_Pipeline_pe_write_kv_word_loop
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
set C_modelName {swiftkv_run_bank_Pipeline_pe_write_kv_word_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem3 int 512 regular {axi_master 1}  }
	{ sext_ln1952 int 58 regular  }
	{ compressed_kv_record int 512 regular  }
	{ compressed_kv_record_1 int 512 regular  }
	{ compressed_kv_record_2 int 512 regular  }
	{ compressed_kv_record_3 int 512 regular  }
	{ compressed_kv_record_4 int 512 regular  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "gmem3", "interface" : "axi_master", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[ {"cElement": [{"cName": "model_bank3","offset": { "type": "dynamic","port_name": "model_bank3","bundle": "control"},"direction": "READONLY"},{"cName": "residual_pe3","offset": { "type": "dynamic","port_name": "residual_pe3","bundle": "control"},"direction": "READWRITE"},{"cName": "logits_pe3","offset": { "type": "dynamic","port_name": "logits_pe3","bundle": "control"},"direction": "WRITEONLY"},{"cName": "kv_cache_pe3","offset": { "type": "dynamic","port_name": "kv_cache_pe3","bundle": "control"},"direction": "READWRITE"}]}]} , 
 	{ "Name" : "sext_ln1952", "interface" : "wire", "bitwidth" : 58, "direction" : "READONLY"} , 
 	{ "Name" : "compressed_kv_record", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "compressed_kv_record_1", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "compressed_kv_record_2", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "compressed_kv_record_3", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "compressed_kv_record_4", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_gmem3_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem3_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem3_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem3_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem3_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem3_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem3_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_gmem3_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem3_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem3_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem3_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem3_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem3_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem3_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem3_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem3_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem3_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_gmem3_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem3_RFIFONUM sc_in sc_lv 12 signal 0 } 
	{ m_axi_gmem3_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem3_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem3_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem3_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem3_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem3_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem3_BUSER sc_in sc_lv 1 signal 0 } 
	{ sext_ln1952 sc_in sc_lv 58 signal 1 } 
	{ compressed_kv_record sc_in sc_lv 512 signal 2 } 
	{ compressed_kv_record_1 sc_in sc_lv 512 signal 3 } 
	{ compressed_kv_record_2 sc_in sc_lv 512 signal 4 } 
	{ compressed_kv_record_3 sc_in sc_lv 512 signal 5 } 
	{ compressed_kv_record_4 sc_in sc_lv 512 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_gmem3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem3_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem3_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem3_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem3_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem3_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem3_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem3_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem3_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem3_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem3_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem3_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem3", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem3_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem3_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem3_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WID" }} , 
 	{ "name": "m_axi_gmem3_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem3_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem3_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem3_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem3", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem3_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem3_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem3_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem3_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem3_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem3_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem3", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem3_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem3_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem3", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem3_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem3_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem3_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem3_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "gmem3", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem3_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem3_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RID" }} , 
 	{ "name": "m_axi_gmem3_RFIFONUM", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "gmem3", "role": "RFIFONUM" }} , 
 	{ "name": "m_axi_gmem3_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem3_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem3_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem3_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem3_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem3", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem3_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BID" }} , 
 	{ "name": "m_axi_gmem3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem3", "role": "BUSER" }} , 
 	{ "name": "sext_ln1952", "direction": "in", "datatype": "sc_lv", "bitwidth":58, "type": "signal", "bundle":{"name": "sext_ln1952", "role": "default" }} , 
 	{ "name": "compressed_kv_record", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "compressed_kv_record", "role": "default" }} , 
 	{ "name": "compressed_kv_record_1", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "compressed_kv_record_1", "role": "default" }} , 
 	{ "name": "compressed_kv_record_2", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "compressed_kv_record_2", "role": "default" }} , 
 	{ "name": "compressed_kv_record_3", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "compressed_kv_record_3", "role": "default" }} , 
 	{ "name": "compressed_kv_record_4", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "compressed_kv_record_4", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_write_kv_word_loop",
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
			{"Name" : "gmem3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem3_blk_n_W", "Type" : "RtlSignal"}]},
			{"Name" : "sext_ln1952", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "compressed_kv_record_4", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "pe_write_kv_word_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_11_3_512_1_1_U339", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_run_bank_Pipeline_pe_write_kv_word_loop {
		gmem3 {Type O LastRead -1 FirstWrite 1}
		sext_ln1952 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_1 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_2 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_3 {Type I LastRead 0 FirstWrite -1}
		compressed_kv_record_4 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "7", "Max" : "7"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	 { m_axi {  { m_axi_gmem3_AWVALID VALID 1 1 }  { m_axi_gmem3_AWREADY READY 0 1 }  { m_axi_gmem3_AWADDR ADDR 1 64 }  { m_axi_gmem3_AWID ID 1 1 }  { m_axi_gmem3_AWLEN SIZE 1 32 }  { m_axi_gmem3_AWSIZE BURST 1 3 }  { m_axi_gmem3_AWBURST LOCK 1 2 }  { m_axi_gmem3_AWLOCK CACHE 1 2 }  { m_axi_gmem3_AWCACHE PROT 1 4 }  { m_axi_gmem3_AWPROT QOS 1 3 }  { m_axi_gmem3_AWQOS REGION 1 4 }  { m_axi_gmem3_AWREGION USER 1 4 }  { m_axi_gmem3_AWUSER DATA 1 1 }  { m_axi_gmem3_WVALID VALID 1 1 }  { m_axi_gmem3_WREADY READY 0 1 }  { m_axi_gmem3_WDATA FIFONUM 1 512 }  { m_axi_gmem3_WSTRB STRB 1 64 }  { m_axi_gmem3_WLAST LAST 1 1 }  { m_axi_gmem3_WID ID 1 1 }  { m_axi_gmem3_WUSER DATA 1 1 }  { m_axi_gmem3_ARVALID VALID 1 1 }  { m_axi_gmem3_ARREADY READY 0 1 }  { m_axi_gmem3_ARADDR ADDR 1 64 }  { m_axi_gmem3_ARID ID 1 1 }  { m_axi_gmem3_ARLEN SIZE 1 32 }  { m_axi_gmem3_ARSIZE BURST 1 3 }  { m_axi_gmem3_ARBURST LOCK 1 2 }  { m_axi_gmem3_ARLOCK CACHE 1 2 }  { m_axi_gmem3_ARCACHE PROT 1 4 }  { m_axi_gmem3_ARPROT QOS 1 3 }  { m_axi_gmem3_ARQOS REGION 1 4 }  { m_axi_gmem3_ARREGION USER 1 4 }  { m_axi_gmem3_ARUSER DATA 1 1 }  { m_axi_gmem3_RVALID VALID 0 1 }  { m_axi_gmem3_RREADY READY 1 1 }  { m_axi_gmem3_RDATA FIFONUM 0 512 }  { m_axi_gmem3_RLAST LAST 0 1 }  { m_axi_gmem3_RID ID 0 1 }  { m_axi_gmem3_RFIFONUM LEN 0 12 }  { m_axi_gmem3_RUSER DATA 0 1 }  { m_axi_gmem3_RRESP RESP 0 2 }  { m_axi_gmem3_BVALID VALID 0 1 }  { m_axi_gmem3_BREADY READY 1 1 }  { m_axi_gmem3_BRESP RESP 0 2 }  { m_axi_gmem3_BID ID 0 1 }  { m_axi_gmem3_BUSER DATA 0 1 } } }
	sext_ln1952 { ap_none {  { sext_ln1952 in_data 0 58 } } }
	compressed_kv_record { ap_none {  { compressed_kv_record in_data 0 512 } } }
	compressed_kv_record_1 { ap_none {  { compressed_kv_record_1 in_data 0 512 } } }
	compressed_kv_record_2 { ap_none {  { compressed_kv_record_2 in_data 0 512 } } }
	compressed_kv_record_3 { ap_none {  { compressed_kv_record_3 in_data 0 512 } } }
	compressed_kv_record_4 { ap_none {  { compressed_kv_record_4 in_data 0 512 } } }
}
