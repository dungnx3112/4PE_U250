set moduleName swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop
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
set C_modelName {swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ rotated_k_words int 512 regular {array 8 { 0 } 0 1 }  }
	{ query int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_2 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_4 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_6 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_8 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_10 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_12 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_14 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_1 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_3 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_5 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_7 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_9 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_11 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_13 int 32 regular {array 8 { 0 } 0 1 }  }
	{ query_15 int 32 regular {array 8 { 0 } 0 1 }  }
	{ local_cosine int 19 regular {array 64 { 1 } 1 1 }  }
	{ local_sine int 19 regular {array 64 { 1 } 1 1 }  }
	{ q_words int 512 regular {array 8 { 1 } 1 1 }  }
	{ k_words int 512 regular {array 8 { 1 } 1 1 }  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "rotated_k_words", "interface" : "memory", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "query_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "local_cosine", "interface" : "memory", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "local_sine", "interface" : "memory", "bitwidth" : 19, "direction" : "READONLY"} , 
 	{ "Name" : "q_words", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "k_words", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 86
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rotated_k_words_address0 sc_out sc_lv 3 signal 0 } 
	{ rotated_k_words_ce0 sc_out sc_logic 1 signal 0 } 
	{ rotated_k_words_we0 sc_out sc_logic 1 signal 0 } 
	{ rotated_k_words_d0 sc_out sc_lv 512 signal 0 } 
	{ query_address0 sc_out sc_lv 3 signal 1 } 
	{ query_ce0 sc_out sc_logic 1 signal 1 } 
	{ query_we0 sc_out sc_logic 1 signal 1 } 
	{ query_d0 sc_out sc_lv 32 signal 1 } 
	{ query_2_address0 sc_out sc_lv 3 signal 2 } 
	{ query_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ query_2_we0 sc_out sc_logic 1 signal 2 } 
	{ query_2_d0 sc_out sc_lv 32 signal 2 } 
	{ query_4_address0 sc_out sc_lv 3 signal 3 } 
	{ query_4_ce0 sc_out sc_logic 1 signal 3 } 
	{ query_4_we0 sc_out sc_logic 1 signal 3 } 
	{ query_4_d0 sc_out sc_lv 32 signal 3 } 
	{ query_6_address0 sc_out sc_lv 3 signal 4 } 
	{ query_6_ce0 sc_out sc_logic 1 signal 4 } 
	{ query_6_we0 sc_out sc_logic 1 signal 4 } 
	{ query_6_d0 sc_out sc_lv 32 signal 4 } 
	{ query_8_address0 sc_out sc_lv 3 signal 5 } 
	{ query_8_ce0 sc_out sc_logic 1 signal 5 } 
	{ query_8_we0 sc_out sc_logic 1 signal 5 } 
	{ query_8_d0 sc_out sc_lv 32 signal 5 } 
	{ query_10_address0 sc_out sc_lv 3 signal 6 } 
	{ query_10_ce0 sc_out sc_logic 1 signal 6 } 
	{ query_10_we0 sc_out sc_logic 1 signal 6 } 
	{ query_10_d0 sc_out sc_lv 32 signal 6 } 
	{ query_12_address0 sc_out sc_lv 3 signal 7 } 
	{ query_12_ce0 sc_out sc_logic 1 signal 7 } 
	{ query_12_we0 sc_out sc_logic 1 signal 7 } 
	{ query_12_d0 sc_out sc_lv 32 signal 7 } 
	{ query_14_address0 sc_out sc_lv 3 signal 8 } 
	{ query_14_ce0 sc_out sc_logic 1 signal 8 } 
	{ query_14_we0 sc_out sc_logic 1 signal 8 } 
	{ query_14_d0 sc_out sc_lv 32 signal 8 } 
	{ query_1_address0 sc_out sc_lv 3 signal 9 } 
	{ query_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ query_1_we0 sc_out sc_logic 1 signal 9 } 
	{ query_1_d0 sc_out sc_lv 32 signal 9 } 
	{ query_3_address0 sc_out sc_lv 3 signal 10 } 
	{ query_3_ce0 sc_out sc_logic 1 signal 10 } 
	{ query_3_we0 sc_out sc_logic 1 signal 10 } 
	{ query_3_d0 sc_out sc_lv 32 signal 10 } 
	{ query_5_address0 sc_out sc_lv 3 signal 11 } 
	{ query_5_ce0 sc_out sc_logic 1 signal 11 } 
	{ query_5_we0 sc_out sc_logic 1 signal 11 } 
	{ query_5_d0 sc_out sc_lv 32 signal 11 } 
	{ query_7_address0 sc_out sc_lv 3 signal 12 } 
	{ query_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ query_7_we0 sc_out sc_logic 1 signal 12 } 
	{ query_7_d0 sc_out sc_lv 32 signal 12 } 
	{ query_9_address0 sc_out sc_lv 3 signal 13 } 
	{ query_9_ce0 sc_out sc_logic 1 signal 13 } 
	{ query_9_we0 sc_out sc_logic 1 signal 13 } 
	{ query_9_d0 sc_out sc_lv 32 signal 13 } 
	{ query_11_address0 sc_out sc_lv 3 signal 14 } 
	{ query_11_ce0 sc_out sc_logic 1 signal 14 } 
	{ query_11_we0 sc_out sc_logic 1 signal 14 } 
	{ query_11_d0 sc_out sc_lv 32 signal 14 } 
	{ query_13_address0 sc_out sc_lv 3 signal 15 } 
	{ query_13_ce0 sc_out sc_logic 1 signal 15 } 
	{ query_13_we0 sc_out sc_logic 1 signal 15 } 
	{ query_13_d0 sc_out sc_lv 32 signal 15 } 
	{ query_15_address0 sc_out sc_lv 3 signal 16 } 
	{ query_15_ce0 sc_out sc_logic 1 signal 16 } 
	{ query_15_we0 sc_out sc_logic 1 signal 16 } 
	{ query_15_d0 sc_out sc_lv 32 signal 16 } 
	{ local_cosine_address0 sc_out sc_lv 6 signal 17 } 
	{ local_cosine_ce0 sc_out sc_logic 1 signal 17 } 
	{ local_cosine_q0 sc_in sc_lv 19 signal 17 } 
	{ local_sine_address0 sc_out sc_lv 6 signal 18 } 
	{ local_sine_ce0 sc_out sc_logic 1 signal 18 } 
	{ local_sine_q0 sc_in sc_lv 19 signal 18 } 
	{ q_words_address0 sc_out sc_lv 3 signal 19 } 
	{ q_words_ce0 sc_out sc_logic 1 signal 19 } 
	{ q_words_q0 sc_in sc_lv 512 signal 19 } 
	{ k_words_address0 sc_out sc_lv 3 signal 20 } 
	{ k_words_ce0 sc_out sc_logic 1 signal 20 } 
	{ k_words_q0 sc_in sc_lv 512 signal 20 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rotated_k_words_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rotated_k_words", "role": "address0" }} , 
 	{ "name": "rotated_k_words_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rotated_k_words", "role": "ce0" }} , 
 	{ "name": "rotated_k_words_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rotated_k_words", "role": "we0" }} , 
 	{ "name": "rotated_k_words_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rotated_k_words", "role": "d0" }} , 
 	{ "name": "query_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query", "role": "address0" }} , 
 	{ "name": "query_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query", "role": "ce0" }} , 
 	{ "name": "query_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query", "role": "we0" }} , 
 	{ "name": "query_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query", "role": "d0" }} , 
 	{ "name": "query_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_2", "role": "address0" }} , 
 	{ "name": "query_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_2", "role": "ce0" }} , 
 	{ "name": "query_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_2", "role": "we0" }} , 
 	{ "name": "query_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_2", "role": "d0" }} , 
 	{ "name": "query_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_4", "role": "address0" }} , 
 	{ "name": "query_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_4", "role": "ce0" }} , 
 	{ "name": "query_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_4", "role": "we0" }} , 
 	{ "name": "query_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_4", "role": "d0" }} , 
 	{ "name": "query_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_6", "role": "address0" }} , 
 	{ "name": "query_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_6", "role": "ce0" }} , 
 	{ "name": "query_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_6", "role": "we0" }} , 
 	{ "name": "query_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_6", "role": "d0" }} , 
 	{ "name": "query_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_8", "role": "address0" }} , 
 	{ "name": "query_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_8", "role": "ce0" }} , 
 	{ "name": "query_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_8", "role": "we0" }} , 
 	{ "name": "query_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_8", "role": "d0" }} , 
 	{ "name": "query_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_10", "role": "address0" }} , 
 	{ "name": "query_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_10", "role": "ce0" }} , 
 	{ "name": "query_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_10", "role": "we0" }} , 
 	{ "name": "query_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_10", "role": "d0" }} , 
 	{ "name": "query_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_12", "role": "address0" }} , 
 	{ "name": "query_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_12", "role": "ce0" }} , 
 	{ "name": "query_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_12", "role": "we0" }} , 
 	{ "name": "query_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_12", "role": "d0" }} , 
 	{ "name": "query_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_14", "role": "address0" }} , 
 	{ "name": "query_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_14", "role": "ce0" }} , 
 	{ "name": "query_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_14", "role": "we0" }} , 
 	{ "name": "query_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_14", "role": "d0" }} , 
 	{ "name": "query_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_1", "role": "address0" }} , 
 	{ "name": "query_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_1", "role": "ce0" }} , 
 	{ "name": "query_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_1", "role": "we0" }} , 
 	{ "name": "query_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_1", "role": "d0" }} , 
 	{ "name": "query_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_3", "role": "address0" }} , 
 	{ "name": "query_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_3", "role": "ce0" }} , 
 	{ "name": "query_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_3", "role": "we0" }} , 
 	{ "name": "query_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_3", "role": "d0" }} , 
 	{ "name": "query_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_5", "role": "address0" }} , 
 	{ "name": "query_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_5", "role": "ce0" }} , 
 	{ "name": "query_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_5", "role": "we0" }} , 
 	{ "name": "query_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_5", "role": "d0" }} , 
 	{ "name": "query_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_7", "role": "address0" }} , 
 	{ "name": "query_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_7", "role": "ce0" }} , 
 	{ "name": "query_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_7", "role": "we0" }} , 
 	{ "name": "query_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_7", "role": "d0" }} , 
 	{ "name": "query_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_9", "role": "address0" }} , 
 	{ "name": "query_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_9", "role": "ce0" }} , 
 	{ "name": "query_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_9", "role": "we0" }} , 
 	{ "name": "query_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_9", "role": "d0" }} , 
 	{ "name": "query_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_11", "role": "address0" }} , 
 	{ "name": "query_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_11", "role": "ce0" }} , 
 	{ "name": "query_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_11", "role": "we0" }} , 
 	{ "name": "query_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_11", "role": "d0" }} , 
 	{ "name": "query_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_13", "role": "address0" }} , 
 	{ "name": "query_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_13", "role": "ce0" }} , 
 	{ "name": "query_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_13", "role": "we0" }} , 
 	{ "name": "query_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_13", "role": "d0" }} , 
 	{ "name": "query_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "query_15", "role": "address0" }} , 
 	{ "name": "query_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_15", "role": "ce0" }} , 
 	{ "name": "query_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "query_15", "role": "we0" }} , 
 	{ "name": "query_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "query_15", "role": "d0" }} , 
 	{ "name": "local_cosine_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_cosine", "role": "address0" }} , 
 	{ "name": "local_cosine_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_cosine", "role": "ce0" }} , 
 	{ "name": "local_cosine_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "local_cosine", "role": "q0" }} , 
 	{ "name": "local_sine_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "local_sine", "role": "address0" }} , 
 	{ "name": "local_sine_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "local_sine", "role": "ce0" }} , 
 	{ "name": "local_sine_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "local_sine", "role": "q0" }} , 
 	{ "name": "q_words_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "q_words", "role": "address0" }} , 
 	{ "name": "q_words_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "q_words", "role": "ce0" }} , 
 	{ "name": "q_words_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "q_words", "role": "q0" }} , 
 	{ "name": "k_words_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "k_words", "role": "address0" }} , 
 	{ "name": "k_words_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "k_words", "role": "ce0" }} , 
 	{ "name": "k_words_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "k_words", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "137", "EstimateLatencyMax" : "137",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "rotated_k_words", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "query_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "local_cosine", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "local_sine", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "q_words", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "k_words", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "pe_rope_word_loop_pe_rope_pair_phase_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter8", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter8", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_19s_51_4_1_U96", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_19s_51_4_1_U97", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_19s_51_4_1_U98", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_19s_51_4_1_U99", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_run_bank_Pipeline_pe_rope_word_loop_pe_rope_pair_phase_loop {
		rotated_k_words {Type O LastRead -1 FirstWrite 8}
		query {Type O LastRead -1 FirstWrite 7}
		query_2 {Type O LastRead -1 FirstWrite 7}
		query_4 {Type O LastRead -1 FirstWrite 7}
		query_6 {Type O LastRead -1 FirstWrite 7}
		query_8 {Type O LastRead -1 FirstWrite 7}
		query_10 {Type O LastRead -1 FirstWrite 7}
		query_12 {Type O LastRead -1 FirstWrite 7}
		query_14 {Type O LastRead -1 FirstWrite 7}
		query_1 {Type O LastRead -1 FirstWrite 7}
		query_3 {Type O LastRead -1 FirstWrite 7}
		query_5 {Type O LastRead -1 FirstWrite 7}
		query_7 {Type O LastRead -1 FirstWrite 7}
		query_9 {Type O LastRead -1 FirstWrite 7}
		query_11 {Type O LastRead -1 FirstWrite 7}
		query_13 {Type O LastRead -1 FirstWrite 7}
		query_15 {Type O LastRead -1 FirstWrite 7}
		local_cosine {Type I LastRead 0 FirstWrite -1}
		local_sine {Type I LastRead 0 FirstWrite -1}
		q_words {Type I LastRead 0 FirstWrite -1}
		k_words {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "137", "Max" : "137"}
	, {"Name" : "Interval", "Min" : "137", "Max" : "137"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rotated_k_words { ap_memory {  { rotated_k_words_address0 mem_address 1 3 }  { rotated_k_words_ce0 mem_ce 1 1 }  { rotated_k_words_we0 mem_we 1 1 }  { rotated_k_words_d0 mem_din 1 512 } } }
	query { ap_memory {  { query_address0 mem_address 1 3 }  { query_ce0 mem_ce 1 1 }  { query_we0 mem_we 1 1 }  { query_d0 mem_din 1 32 } } }
	query_2 { ap_memory {  { query_2_address0 mem_address 1 3 }  { query_2_ce0 mem_ce 1 1 }  { query_2_we0 mem_we 1 1 }  { query_2_d0 mem_din 1 32 } } }
	query_4 { ap_memory {  { query_4_address0 mem_address 1 3 }  { query_4_ce0 mem_ce 1 1 }  { query_4_we0 mem_we 1 1 }  { query_4_d0 mem_din 1 32 } } }
	query_6 { ap_memory {  { query_6_address0 mem_address 1 3 }  { query_6_ce0 mem_ce 1 1 }  { query_6_we0 mem_we 1 1 }  { query_6_d0 mem_din 1 32 } } }
	query_8 { ap_memory {  { query_8_address0 mem_address 1 3 }  { query_8_ce0 mem_ce 1 1 }  { query_8_we0 mem_we 1 1 }  { query_8_d0 mem_din 1 32 } } }
	query_10 { ap_memory {  { query_10_address0 mem_address 1 3 }  { query_10_ce0 mem_ce 1 1 }  { query_10_we0 mem_we 1 1 }  { query_10_d0 mem_din 1 32 } } }
	query_12 { ap_memory {  { query_12_address0 mem_address 1 3 }  { query_12_ce0 mem_ce 1 1 }  { query_12_we0 mem_we 1 1 }  { query_12_d0 mem_din 1 32 } } }
	query_14 { ap_memory {  { query_14_address0 mem_address 1 3 }  { query_14_ce0 mem_ce 1 1 }  { query_14_we0 mem_we 1 1 }  { query_14_d0 mem_din 1 32 } } }
	query_1 { ap_memory {  { query_1_address0 mem_address 1 3 }  { query_1_ce0 mem_ce 1 1 }  { query_1_we0 mem_we 1 1 }  { query_1_d0 mem_din 1 32 } } }
	query_3 { ap_memory {  { query_3_address0 mem_address 1 3 }  { query_3_ce0 mem_ce 1 1 }  { query_3_we0 mem_we 1 1 }  { query_3_d0 mem_din 1 32 } } }
	query_5 { ap_memory {  { query_5_address0 mem_address 1 3 }  { query_5_ce0 mem_ce 1 1 }  { query_5_we0 mem_we 1 1 }  { query_5_d0 mem_din 1 32 } } }
	query_7 { ap_memory {  { query_7_address0 mem_address 1 3 }  { query_7_ce0 mem_ce 1 1 }  { query_7_we0 mem_we 1 1 }  { query_7_d0 mem_din 1 32 } } }
	query_9 { ap_memory {  { query_9_address0 mem_address 1 3 }  { query_9_ce0 mem_ce 1 1 }  { query_9_we0 mem_we 1 1 }  { query_9_d0 mem_din 1 32 } } }
	query_11 { ap_memory {  { query_11_address0 mem_address 1 3 }  { query_11_ce0 mem_ce 1 1 }  { query_11_we0 mem_we 1 1 }  { query_11_d0 mem_din 1 32 } } }
	query_13 { ap_memory {  { query_13_address0 mem_address 1 3 }  { query_13_ce0 mem_ce 1 1 }  { query_13_we0 mem_we 1 1 }  { query_13_d0 mem_din 1 32 } } }
	query_15 { ap_memory {  { query_15_address0 mem_address 1 3 }  { query_15_ce0 mem_ce 1 1 }  { query_15_we0 mem_we 1 1 }  { query_15_d0 mem_din 1 32 } } }
	local_cosine { ap_memory {  { local_cosine_address0 mem_address 1 6 }  { local_cosine_ce0 mem_ce 1 1 }  { local_cosine_q0 in_data 0 19 } } }
	local_sine { ap_memory {  { local_sine_address0 mem_address 1 6 }  { local_sine_ce0 mem_ce 1 1 }  { local_sine_q0 in_data 0 19 } } }
	q_words { ap_memory {  { q_words_address0 mem_address 1 3 }  { q_words_ce0 mem_ce 1 1 }  { q_words_q0 in_data 0 512 } } }
	k_words { ap_memory {  { k_words_address0 mem_address 1 3 }  { k_words_ce0 mem_ce 1 1 }  { k_words_q0 in_data 0 512 } } }
}
