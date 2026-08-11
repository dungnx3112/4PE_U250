set moduleName entry_proc58
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {entry_proc58}
set C_modelType { void 0 }
set C_modelArgList {
	{ weight_bank0 int 64 regular  }
	{ weight_bank0_c int 64 regular {fifo 1}  }
	{ weight_bank1 int 64 regular  }
	{ weight_bank1_c int 64 regular {fifo 1}  }
	{ weight_bank2 int 64 regular  }
	{ weight_bank2_c int 64 regular {fifo 1}  }
	{ weight_bank3 int 64 regular  }
	{ weight_bank3_c int 64 regular {fifo 1}  }
	{ logits_pe0 int 64 regular  }
	{ logits_pe0_c int 64 regular {fifo 1}  }
	{ logits_pe1 int 64 regular  }
	{ logits_pe1_c int 64 regular {fifo 1}  }
	{ logits_pe2 int 64 regular  }
	{ logits_pe2_c int 64 regular {fifo 1}  }
	{ logits_pe3 int 64 regular  }
	{ logits_pe3_c int 64 regular {fifo 1}  }
	{ p_read int 1 regular  }
	{ controller_run_linear_in_c int 1 regular {fifo 1}  }
	{ p_read1 int 3 regular  }
	{ controller_linear_mode_in_c int 3 regular {fifo 1}  }
	{ p_read2 int 6 regular  }
	{ controller_layer_index_in_c int 6 regular {fifo 1}  }
	{ idx int 13 regular  }
	{ idx_c int 13 regular {fifo 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "weight_bank0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "weight_bank0_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weight_bank1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "weight_bank1_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weight_bank2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "weight_bank2_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "weight_bank3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "weight_bank3_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_pe0", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe0_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_pe1", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe1_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_pe2", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe2_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_pe3", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "logits_pe3_c", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "controller_run_linear_in_c", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "controller_linear_mode_in_c", "interface" : "fifo", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "controller_layer_index_in_c", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "idx_c", "interface" : "fifo", "bitwidth" : 13, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 79
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ weight_bank0 sc_in sc_lv 64 signal 0 } 
	{ weight_bank0_c_din sc_out sc_lv 64 signal 1 } 
	{ weight_bank0_c_num_data_valid sc_in sc_lv 3 signal 1 } 
	{ weight_bank0_c_fifo_cap sc_in sc_lv 3 signal 1 } 
	{ weight_bank0_c_full_n sc_in sc_logic 1 signal 1 } 
	{ weight_bank0_c_write sc_out sc_logic 1 signal 1 } 
	{ weight_bank1 sc_in sc_lv 64 signal 2 } 
	{ weight_bank1_c_din sc_out sc_lv 64 signal 3 } 
	{ weight_bank1_c_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ weight_bank1_c_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ weight_bank1_c_full_n sc_in sc_logic 1 signal 3 } 
	{ weight_bank1_c_write sc_out sc_logic 1 signal 3 } 
	{ weight_bank2 sc_in sc_lv 64 signal 4 } 
	{ weight_bank2_c_din sc_out sc_lv 64 signal 5 } 
	{ weight_bank2_c_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ weight_bank2_c_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ weight_bank2_c_full_n sc_in sc_logic 1 signal 5 } 
	{ weight_bank2_c_write sc_out sc_logic 1 signal 5 } 
	{ weight_bank3 sc_in sc_lv 64 signal 6 } 
	{ weight_bank3_c_din sc_out sc_lv 64 signal 7 } 
	{ weight_bank3_c_num_data_valid sc_in sc_lv 3 signal 7 } 
	{ weight_bank3_c_fifo_cap sc_in sc_lv 3 signal 7 } 
	{ weight_bank3_c_full_n sc_in sc_logic 1 signal 7 } 
	{ weight_bank3_c_write sc_out sc_logic 1 signal 7 } 
	{ logits_pe0 sc_in sc_lv 64 signal 8 } 
	{ logits_pe0_c_din sc_out sc_lv 64 signal 9 } 
	{ logits_pe0_c_num_data_valid sc_in sc_lv 3 signal 9 } 
	{ logits_pe0_c_fifo_cap sc_in sc_lv 3 signal 9 } 
	{ logits_pe0_c_full_n sc_in sc_logic 1 signal 9 } 
	{ logits_pe0_c_write sc_out sc_logic 1 signal 9 } 
	{ logits_pe1 sc_in sc_lv 64 signal 10 } 
	{ logits_pe1_c_din sc_out sc_lv 64 signal 11 } 
	{ logits_pe1_c_num_data_valid sc_in sc_lv 3 signal 11 } 
	{ logits_pe1_c_fifo_cap sc_in sc_lv 3 signal 11 } 
	{ logits_pe1_c_full_n sc_in sc_logic 1 signal 11 } 
	{ logits_pe1_c_write sc_out sc_logic 1 signal 11 } 
	{ logits_pe2 sc_in sc_lv 64 signal 12 } 
	{ logits_pe2_c_din sc_out sc_lv 64 signal 13 } 
	{ logits_pe2_c_num_data_valid sc_in sc_lv 3 signal 13 } 
	{ logits_pe2_c_fifo_cap sc_in sc_lv 3 signal 13 } 
	{ logits_pe2_c_full_n sc_in sc_logic 1 signal 13 } 
	{ logits_pe2_c_write sc_out sc_logic 1 signal 13 } 
	{ logits_pe3 sc_in sc_lv 64 signal 14 } 
	{ logits_pe3_c_din sc_out sc_lv 64 signal 15 } 
	{ logits_pe3_c_num_data_valid sc_in sc_lv 3 signal 15 } 
	{ logits_pe3_c_fifo_cap sc_in sc_lv 3 signal 15 } 
	{ logits_pe3_c_full_n sc_in sc_logic 1 signal 15 } 
	{ logits_pe3_c_write sc_out sc_logic 1 signal 15 } 
	{ p_read sc_in sc_lv 1 signal 16 } 
	{ controller_run_linear_in_c_din sc_out sc_lv 1 signal 17 } 
	{ controller_run_linear_in_c_num_data_valid sc_in sc_lv 3 signal 17 } 
	{ controller_run_linear_in_c_fifo_cap sc_in sc_lv 3 signal 17 } 
	{ controller_run_linear_in_c_full_n sc_in sc_logic 1 signal 17 } 
	{ controller_run_linear_in_c_write sc_out sc_logic 1 signal 17 } 
	{ p_read1 sc_in sc_lv 3 signal 18 } 
	{ controller_linear_mode_in_c_din sc_out sc_lv 3 signal 19 } 
	{ controller_linear_mode_in_c_num_data_valid sc_in sc_lv 3 signal 19 } 
	{ controller_linear_mode_in_c_fifo_cap sc_in sc_lv 3 signal 19 } 
	{ controller_linear_mode_in_c_full_n sc_in sc_logic 1 signal 19 } 
	{ controller_linear_mode_in_c_write sc_out sc_logic 1 signal 19 } 
	{ p_read2 sc_in sc_lv 6 signal 20 } 
	{ controller_layer_index_in_c_din sc_out sc_lv 6 signal 21 } 
	{ controller_layer_index_in_c_num_data_valid sc_in sc_lv 3 signal 21 } 
	{ controller_layer_index_in_c_fifo_cap sc_in sc_lv 3 signal 21 } 
	{ controller_layer_index_in_c_full_n sc_in sc_logic 1 signal 21 } 
	{ controller_layer_index_in_c_write sc_out sc_logic 1 signal 21 } 
	{ idx sc_in sc_lv 13 signal 22 } 
	{ idx_c_din sc_out sc_lv 13 signal 23 } 
	{ idx_c_num_data_valid sc_in sc_lv 3 signal 23 } 
	{ idx_c_fifo_cap sc_in sc_lv 3 signal 23 } 
	{ idx_c_full_n sc_in sc_logic 1 signal 23 } 
	{ idx_c_write sc_out sc_logic 1 signal 23 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "weight_bank0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank0", "role": "default" }} , 
 	{ "name": "weight_bank0_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank0_c", "role": "din" }} , 
 	{ "name": "weight_bank0_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank0_c", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank0_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank0_c", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank0_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank0_c", "role": "full_n" }} , 
 	{ "name": "weight_bank0_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank0_c", "role": "write" }} , 
 	{ "name": "weight_bank1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank1", "role": "default" }} , 
 	{ "name": "weight_bank1_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank1_c", "role": "din" }} , 
 	{ "name": "weight_bank1_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank1_c", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank1_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank1_c", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank1_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank1_c", "role": "full_n" }} , 
 	{ "name": "weight_bank1_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank1_c", "role": "write" }} , 
 	{ "name": "weight_bank2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank2", "role": "default" }} , 
 	{ "name": "weight_bank2_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank2_c", "role": "din" }} , 
 	{ "name": "weight_bank2_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank2_c", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank2_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank2_c", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank2_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank2_c", "role": "full_n" }} , 
 	{ "name": "weight_bank2_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank2_c", "role": "write" }} , 
 	{ "name": "weight_bank3", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank3", "role": "default" }} , 
 	{ "name": "weight_bank3_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "weight_bank3_c", "role": "din" }} , 
 	{ "name": "weight_bank3_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank3_c", "role": "num_data_valid" }} , 
 	{ "name": "weight_bank3_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "weight_bank3_c", "role": "fifo_cap" }} , 
 	{ "name": "weight_bank3_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank3_c", "role": "full_n" }} , 
 	{ "name": "weight_bank3_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_bank3_c", "role": "write" }} , 
 	{ "name": "logits_pe0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe0", "role": "default" }} , 
 	{ "name": "logits_pe0_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe0_c", "role": "din" }} , 
 	{ "name": "logits_pe0_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe0_c", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe0_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe0_c", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe0_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe0_c", "role": "full_n" }} , 
 	{ "name": "logits_pe0_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe0_c", "role": "write" }} , 
 	{ "name": "logits_pe1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe1", "role": "default" }} , 
 	{ "name": "logits_pe1_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe1_c", "role": "din" }} , 
 	{ "name": "logits_pe1_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe1_c", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe1_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe1_c", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe1_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe1_c", "role": "full_n" }} , 
 	{ "name": "logits_pe1_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe1_c", "role": "write" }} , 
 	{ "name": "logits_pe2", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe2", "role": "default" }} , 
 	{ "name": "logits_pe2_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe2_c", "role": "din" }} , 
 	{ "name": "logits_pe2_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe2_c", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe2_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe2_c", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe2_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe2_c", "role": "full_n" }} , 
 	{ "name": "logits_pe2_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe2_c", "role": "write" }} , 
 	{ "name": "logits_pe3", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe3", "role": "default" }} , 
 	{ "name": "logits_pe3_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "logits_pe3_c", "role": "din" }} , 
 	{ "name": "logits_pe3_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe3_c", "role": "num_data_valid" }} , 
 	{ "name": "logits_pe3_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "logits_pe3_c", "role": "fifo_cap" }} , 
 	{ "name": "logits_pe3_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe3_c", "role": "full_n" }} , 
 	{ "name": "logits_pe3_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_pe3_c", "role": "write" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "controller_run_linear_in_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in_c", "role": "din" }} , 
 	{ "name": "controller_run_linear_in_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_run_linear_in_c", "role": "num_data_valid" }} , 
 	{ "name": "controller_run_linear_in_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_run_linear_in_c", "role": "fifo_cap" }} , 
 	{ "name": "controller_run_linear_in_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in_c", "role": "full_n" }} , 
 	{ "name": "controller_run_linear_in_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_run_linear_in_c", "role": "write" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "controller_linear_mode_in_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in_c", "role": "din" }} , 
 	{ "name": "controller_linear_mode_in_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in_c", "role": "num_data_valid" }} , 
 	{ "name": "controller_linear_mode_in_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_linear_mode_in_c", "role": "fifo_cap" }} , 
 	{ "name": "controller_linear_mode_in_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_linear_mode_in_c", "role": "full_n" }} , 
 	{ "name": "controller_linear_mode_in_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_linear_mode_in_c", "role": "write" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "controller_layer_index_in_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "controller_layer_index_in_c", "role": "din" }} , 
 	{ "name": "controller_layer_index_in_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_layer_index_in_c", "role": "num_data_valid" }} , 
 	{ "name": "controller_layer_index_in_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "controller_layer_index_in_c", "role": "fifo_cap" }} , 
 	{ "name": "controller_layer_index_in_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_layer_index_in_c", "role": "full_n" }} , 
 	{ "name": "controller_layer_index_in_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "controller_layer_index_in_c", "role": "write" }} , 
 	{ "name": "idx", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx", "role": "default" }} , 
 	{ "name": "idx_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "idx_c", "role": "din" }} , 
 	{ "name": "idx_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "idx_c", "role": "num_data_valid" }} , 
 	{ "name": "idx_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "idx_c", "role": "fifo_cap" }} , 
 	{ "name": "idx_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx_c", "role": "full_n" }} , 
 	{ "name": "idx_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "idx_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "entry_proc58",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "weight_bank0", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank0_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank0_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank1", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank2", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weight_bank3", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_bank3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "weight_bank3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe0", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe0_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe0_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe1", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe1_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe1_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe2", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe2_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe2_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "logits_pe3", "Type" : "None", "Direction" : "I"},
			{"Name" : "logits_pe3_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "logits_pe3_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_run_linear_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_run_linear_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_linear_mode_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_linear_mode_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I"},
			{"Name" : "controller_layer_index_in_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "controller_layer_index_in_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "idx", "Type" : "None", "Direction" : "I"},
			{"Name" : "idx_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "idx_c_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	entry_proc58 {
		weight_bank0 {Type I LastRead 0 FirstWrite -1}
		weight_bank0_c {Type O LastRead -1 FirstWrite 0}
		weight_bank1 {Type I LastRead 0 FirstWrite -1}
		weight_bank1_c {Type O LastRead -1 FirstWrite 0}
		weight_bank2 {Type I LastRead 0 FirstWrite -1}
		weight_bank2_c {Type O LastRead -1 FirstWrite 0}
		weight_bank3 {Type I LastRead 0 FirstWrite -1}
		weight_bank3_c {Type O LastRead -1 FirstWrite 0}
		logits_pe0 {Type I LastRead 0 FirstWrite -1}
		logits_pe0_c {Type O LastRead -1 FirstWrite 0}
		logits_pe1 {Type I LastRead 0 FirstWrite -1}
		logits_pe1_c {Type O LastRead -1 FirstWrite 0}
		logits_pe2 {Type I LastRead 0 FirstWrite -1}
		logits_pe2_c {Type O LastRead -1 FirstWrite 0}
		logits_pe3 {Type I LastRead 0 FirstWrite -1}
		logits_pe3_c {Type O LastRead -1 FirstWrite 0}
		p_read {Type I LastRead 0 FirstWrite -1}
		controller_run_linear_in_c {Type O LastRead -1 FirstWrite 0}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		controller_linear_mode_in_c {Type O LastRead -1 FirstWrite 0}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		controller_layer_index_in_c {Type O LastRead -1 FirstWrite 0}
		idx {Type I LastRead 0 FirstWrite -1}
		idx_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	weight_bank0 { ap_none {  { weight_bank0 in_data 0 64 } } }
	weight_bank0_c { ap_fifo {  { weight_bank0_c_din fifo_data_in 1 64 }  { weight_bank0_c_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank0_c_fifo_cap fifo_update 0 3 }  { weight_bank0_c_full_n fifo_status 0 1 }  { weight_bank0_c_write fifo_port_we 1 1 } } }
	weight_bank1 { ap_none {  { weight_bank1 in_data 0 64 } } }
	weight_bank1_c { ap_fifo {  { weight_bank1_c_din fifo_data_in 1 64 }  { weight_bank1_c_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank1_c_fifo_cap fifo_update 0 3 }  { weight_bank1_c_full_n fifo_status 0 1 }  { weight_bank1_c_write fifo_port_we 1 1 } } }
	weight_bank2 { ap_none {  { weight_bank2 in_data 0 64 } } }
	weight_bank2_c { ap_fifo {  { weight_bank2_c_din fifo_data_in 1 64 }  { weight_bank2_c_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank2_c_fifo_cap fifo_update 0 3 }  { weight_bank2_c_full_n fifo_status 0 1 }  { weight_bank2_c_write fifo_port_we 1 1 } } }
	weight_bank3 { ap_none {  { weight_bank3 in_data 0 64 } } }
	weight_bank3_c { ap_fifo {  { weight_bank3_c_din fifo_data_in 1 64 }  { weight_bank3_c_num_data_valid fifo_status_num_data_valid 0 3 }  { weight_bank3_c_fifo_cap fifo_update 0 3 }  { weight_bank3_c_full_n fifo_status 0 1 }  { weight_bank3_c_write fifo_port_we 1 1 } } }
	logits_pe0 { ap_none {  { logits_pe0 in_data 0 64 } } }
	logits_pe0_c { ap_fifo {  { logits_pe0_c_din fifo_data_in 1 64 }  { logits_pe0_c_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe0_c_fifo_cap fifo_update 0 3 }  { logits_pe0_c_full_n fifo_status 0 1 }  { logits_pe0_c_write fifo_port_we 1 1 } } }
	logits_pe1 { ap_none {  { logits_pe1 in_data 0 64 } } }
	logits_pe1_c { ap_fifo {  { logits_pe1_c_din fifo_data_in 1 64 }  { logits_pe1_c_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe1_c_fifo_cap fifo_update 0 3 }  { logits_pe1_c_full_n fifo_status 0 1 }  { logits_pe1_c_write fifo_port_we 1 1 } } }
	logits_pe2 { ap_none {  { logits_pe2 in_data 0 64 } } }
	logits_pe2_c { ap_fifo {  { logits_pe2_c_din fifo_data_in 1 64 }  { logits_pe2_c_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe2_c_fifo_cap fifo_update 0 3 }  { logits_pe2_c_full_n fifo_status 0 1 }  { logits_pe2_c_write fifo_port_we 1 1 } } }
	logits_pe3 { ap_none {  { logits_pe3 in_data 0 64 } } }
	logits_pe3_c { ap_fifo {  { logits_pe3_c_din fifo_data_in 1 64 }  { logits_pe3_c_num_data_valid fifo_status_num_data_valid 0 3 }  { logits_pe3_c_fifo_cap fifo_update 0 3 }  { logits_pe3_c_full_n fifo_status 0 1 }  { logits_pe3_c_write fifo_port_we 1 1 } } }
	p_read { ap_none {  { p_read in_data 0 1 } } }
	controller_run_linear_in_c { ap_fifo {  { controller_run_linear_in_c_din fifo_data_in 1 1 }  { controller_run_linear_in_c_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_run_linear_in_c_fifo_cap fifo_update 0 3 }  { controller_run_linear_in_c_full_n fifo_status 0 1 }  { controller_run_linear_in_c_write fifo_port_we 1 1 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 3 } } }
	controller_linear_mode_in_c { ap_fifo {  { controller_linear_mode_in_c_din fifo_data_in 1 3 }  { controller_linear_mode_in_c_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_linear_mode_in_c_fifo_cap fifo_update 0 3 }  { controller_linear_mode_in_c_full_n fifo_status 0 1 }  { controller_linear_mode_in_c_write fifo_port_we 1 1 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 6 } } }
	controller_layer_index_in_c { ap_fifo {  { controller_layer_index_in_c_din fifo_data_in 1 6 }  { controller_layer_index_in_c_num_data_valid fifo_status_num_data_valid 0 3 }  { controller_layer_index_in_c_fifo_cap fifo_update 0 3 }  { controller_layer_index_in_c_full_n fifo_status 0 1 }  { controller_layer_index_in_c_write fifo_port_we 1 1 } } }
	idx { ap_none {  { idx in_data 0 13 } } }
	idx_c { ap_fifo {  { idx_c_din fifo_data_in 1 13 }  { idx_c_num_data_valid fifo_status_num_data_valid 0 3 }  { idx_c_fifo_cap fifo_update 0 3 }  { idx_c_full_n fifo_status 0 1 }  { idx_c_write fifo_port_we 1 1 } } }
}
