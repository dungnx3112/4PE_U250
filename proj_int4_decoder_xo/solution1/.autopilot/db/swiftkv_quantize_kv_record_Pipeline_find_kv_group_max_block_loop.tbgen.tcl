set moduleName swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop
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
set C_modelName {swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ empty_612 int 32 regular  }
	{ k_raw_3534 int 32 regular  }
	{ k_raw_3942 int 32 regular  }
	{ k_raw_4350 int 32 regular  }
	{ empty_613 int 32 regular  }
	{ k_raw_5164 int 32 regular  }
	{ k_raw_5572 int 32 regular  }
	{ k_raw_5980 int 32 regular  }
	{ k_raw_3228 int 32 regular  }
	{ k_raw_3636 int 32 regular  }
	{ k_raw_4044 int 32 regular  }
	{ k_raw_4452 int 32 regular  }
	{ k_raw_4858 int 32 regular  }
	{ k_raw_5266 int 32 regular  }
	{ k_raw_5674 int 32 regular  }
	{ k_raw_6082 int 32 regular  }
	{ k_raw_3330 int 32 regular  }
	{ k_raw_3738 int 32 regular  }
	{ k_raw_4146 int 32 regular  }
	{ k_raw_4554 int 32 regular  }
	{ k_raw_4960 int 32 regular  }
	{ k_raw_5368 int 32 regular  }
	{ k_raw_5776 int 32 regular  }
	{ k_raw_6184 int 32 regular  }
	{ k_raw_3432 int 32 regular  }
	{ k_raw_3840 int 32 regular  }
	{ k_raw_4248 int 32 regular  }
	{ k_raw_4656 int 32 regular  }
	{ k_raw_5062 int 32 regular  }
	{ k_raw_5470 int 32 regular  }
	{ k_raw_5878 int 32 regular  }
	{ k_raw_6286 int 32 regular  }
	{ empty_614 int 32 regular  }
	{ v_raw_3535 int 32 regular  }
	{ v_raw_3943 int 32 regular  }
	{ v_raw_4351 int 32 regular  }
	{ empty int 32 regular  }
	{ v_raw_5165 int 32 regular  }
	{ v_raw_5573 int 32 regular  }
	{ v_raw_5981 int 32 regular  }
	{ v_raw_3229 int 32 regular  }
	{ v_raw_3637 int 32 regular  }
	{ v_raw_4045 int 32 regular  }
	{ v_raw_4453 int 32 regular  }
	{ v_raw_4859 int 32 regular  }
	{ v_raw_5267 int 32 regular  }
	{ v_raw_5675 int 32 regular  }
	{ v_raw_6083 int 32 regular  }
	{ v_raw_3331 int 32 regular  }
	{ v_raw_3739 int 32 regular  }
	{ v_raw_4147 int 32 regular  }
	{ v_raw_4555 int 32 regular  }
	{ v_raw_4961 int 32 regular  }
	{ v_raw_5369 int 32 regular  }
	{ v_raw_5777 int 32 regular  }
	{ v_raw_6185 int 32 regular  }
	{ v_raw_3433 int 32 regular  }
	{ v_raw_3841 int 32 regular  }
	{ v_raw_4249 int 32 regular  }
	{ v_raw_4657 int 32 regular  }
	{ v_raw_5063 int 32 regular  }
	{ v_raw_5471 int 32 regular  }
	{ v_raw_5879 int 32 regular  }
	{ v_raw_6287 int 32 regular  }
	{ maximum_v_out int 32 regular {pointer 1}  }
	{ maximum_k_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "empty_612", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3534", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3942", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4350", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_613", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5164", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5572", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5980", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3228", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3636", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4044", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4452", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4858", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5266", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5674", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6082", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3330", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3738", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4146", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4554", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4960", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5368", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5776", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6184", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3432", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3840", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4248", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4656", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5062", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5470", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5878", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6286", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_614", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3535", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3943", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4351", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5165", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5573", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5981", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3229", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3637", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4045", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4453", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4859", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5267", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5675", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6083", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3331", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3739", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4147", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4555", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4961", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5369", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5777", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6185", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3433", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3841", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4249", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4657", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5063", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5471", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5879", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6287", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "maximum_v_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "maximum_k_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 74
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ empty_612 sc_in sc_lv 32 signal 0 } 
	{ k_raw_3534 sc_in sc_lv 32 signal 1 } 
	{ k_raw_3942 sc_in sc_lv 32 signal 2 } 
	{ k_raw_4350 sc_in sc_lv 32 signal 3 } 
	{ empty_613 sc_in sc_lv 32 signal 4 } 
	{ k_raw_5164 sc_in sc_lv 32 signal 5 } 
	{ k_raw_5572 sc_in sc_lv 32 signal 6 } 
	{ k_raw_5980 sc_in sc_lv 32 signal 7 } 
	{ k_raw_3228 sc_in sc_lv 32 signal 8 } 
	{ k_raw_3636 sc_in sc_lv 32 signal 9 } 
	{ k_raw_4044 sc_in sc_lv 32 signal 10 } 
	{ k_raw_4452 sc_in sc_lv 32 signal 11 } 
	{ k_raw_4858 sc_in sc_lv 32 signal 12 } 
	{ k_raw_5266 sc_in sc_lv 32 signal 13 } 
	{ k_raw_5674 sc_in sc_lv 32 signal 14 } 
	{ k_raw_6082 sc_in sc_lv 32 signal 15 } 
	{ k_raw_3330 sc_in sc_lv 32 signal 16 } 
	{ k_raw_3738 sc_in sc_lv 32 signal 17 } 
	{ k_raw_4146 sc_in sc_lv 32 signal 18 } 
	{ k_raw_4554 sc_in sc_lv 32 signal 19 } 
	{ k_raw_4960 sc_in sc_lv 32 signal 20 } 
	{ k_raw_5368 sc_in sc_lv 32 signal 21 } 
	{ k_raw_5776 sc_in sc_lv 32 signal 22 } 
	{ k_raw_6184 sc_in sc_lv 32 signal 23 } 
	{ k_raw_3432 sc_in sc_lv 32 signal 24 } 
	{ k_raw_3840 sc_in sc_lv 32 signal 25 } 
	{ k_raw_4248 sc_in sc_lv 32 signal 26 } 
	{ k_raw_4656 sc_in sc_lv 32 signal 27 } 
	{ k_raw_5062 sc_in sc_lv 32 signal 28 } 
	{ k_raw_5470 sc_in sc_lv 32 signal 29 } 
	{ k_raw_5878 sc_in sc_lv 32 signal 30 } 
	{ k_raw_6286 sc_in sc_lv 32 signal 31 } 
	{ empty_614 sc_in sc_lv 32 signal 32 } 
	{ v_raw_3535 sc_in sc_lv 32 signal 33 } 
	{ v_raw_3943 sc_in sc_lv 32 signal 34 } 
	{ v_raw_4351 sc_in sc_lv 32 signal 35 } 
	{ empty sc_in sc_lv 32 signal 36 } 
	{ v_raw_5165 sc_in sc_lv 32 signal 37 } 
	{ v_raw_5573 sc_in sc_lv 32 signal 38 } 
	{ v_raw_5981 sc_in sc_lv 32 signal 39 } 
	{ v_raw_3229 sc_in sc_lv 32 signal 40 } 
	{ v_raw_3637 sc_in sc_lv 32 signal 41 } 
	{ v_raw_4045 sc_in sc_lv 32 signal 42 } 
	{ v_raw_4453 sc_in sc_lv 32 signal 43 } 
	{ v_raw_4859 sc_in sc_lv 32 signal 44 } 
	{ v_raw_5267 sc_in sc_lv 32 signal 45 } 
	{ v_raw_5675 sc_in sc_lv 32 signal 46 } 
	{ v_raw_6083 sc_in sc_lv 32 signal 47 } 
	{ v_raw_3331 sc_in sc_lv 32 signal 48 } 
	{ v_raw_3739 sc_in sc_lv 32 signal 49 } 
	{ v_raw_4147 sc_in sc_lv 32 signal 50 } 
	{ v_raw_4555 sc_in sc_lv 32 signal 51 } 
	{ v_raw_4961 sc_in sc_lv 32 signal 52 } 
	{ v_raw_5369 sc_in sc_lv 32 signal 53 } 
	{ v_raw_5777 sc_in sc_lv 32 signal 54 } 
	{ v_raw_6185 sc_in sc_lv 32 signal 55 } 
	{ v_raw_3433 sc_in sc_lv 32 signal 56 } 
	{ v_raw_3841 sc_in sc_lv 32 signal 57 } 
	{ v_raw_4249 sc_in sc_lv 32 signal 58 } 
	{ v_raw_4657 sc_in sc_lv 32 signal 59 } 
	{ v_raw_5063 sc_in sc_lv 32 signal 60 } 
	{ v_raw_5471 sc_in sc_lv 32 signal 61 } 
	{ v_raw_5879 sc_in sc_lv 32 signal 62 } 
	{ v_raw_6287 sc_in sc_lv 32 signal 63 } 
	{ maximum_v_out sc_out sc_lv 32 signal 64 } 
	{ maximum_v_out_ap_vld sc_out sc_logic 1 outvld 64 } 
	{ maximum_k_out sc_out sc_lv 32 signal 65 } 
	{ maximum_k_out_ap_vld sc_out sc_logic 1 outvld 65 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "empty_612", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_612", "role": "default" }} , 
 	{ "name": "k_raw_3534", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3534", "role": "default" }} , 
 	{ "name": "k_raw_3942", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3942", "role": "default" }} , 
 	{ "name": "k_raw_4350", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4350", "role": "default" }} , 
 	{ "name": "empty_613", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_613", "role": "default" }} , 
 	{ "name": "k_raw_5164", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5164", "role": "default" }} , 
 	{ "name": "k_raw_5572", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5572", "role": "default" }} , 
 	{ "name": "k_raw_5980", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5980", "role": "default" }} , 
 	{ "name": "k_raw_3228", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3228", "role": "default" }} , 
 	{ "name": "k_raw_3636", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3636", "role": "default" }} , 
 	{ "name": "k_raw_4044", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4044", "role": "default" }} , 
 	{ "name": "k_raw_4452", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4452", "role": "default" }} , 
 	{ "name": "k_raw_4858", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4858", "role": "default" }} , 
 	{ "name": "k_raw_5266", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5266", "role": "default" }} , 
 	{ "name": "k_raw_5674", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5674", "role": "default" }} , 
 	{ "name": "k_raw_6082", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6082", "role": "default" }} , 
 	{ "name": "k_raw_3330", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3330", "role": "default" }} , 
 	{ "name": "k_raw_3738", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3738", "role": "default" }} , 
 	{ "name": "k_raw_4146", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4146", "role": "default" }} , 
 	{ "name": "k_raw_4554", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4554", "role": "default" }} , 
 	{ "name": "k_raw_4960", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4960", "role": "default" }} , 
 	{ "name": "k_raw_5368", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5368", "role": "default" }} , 
 	{ "name": "k_raw_5776", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5776", "role": "default" }} , 
 	{ "name": "k_raw_6184", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6184", "role": "default" }} , 
 	{ "name": "k_raw_3432", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3432", "role": "default" }} , 
 	{ "name": "k_raw_3840", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3840", "role": "default" }} , 
 	{ "name": "k_raw_4248", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4248", "role": "default" }} , 
 	{ "name": "k_raw_4656", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4656", "role": "default" }} , 
 	{ "name": "k_raw_5062", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5062", "role": "default" }} , 
 	{ "name": "k_raw_5470", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5470", "role": "default" }} , 
 	{ "name": "k_raw_5878", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5878", "role": "default" }} , 
 	{ "name": "k_raw_6286", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6286", "role": "default" }} , 
 	{ "name": "empty_614", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_614", "role": "default" }} , 
 	{ "name": "v_raw_3535", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3535", "role": "default" }} , 
 	{ "name": "v_raw_3943", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3943", "role": "default" }} , 
 	{ "name": "v_raw_4351", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4351", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "v_raw_5165", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5165", "role": "default" }} , 
 	{ "name": "v_raw_5573", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5573", "role": "default" }} , 
 	{ "name": "v_raw_5981", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5981", "role": "default" }} , 
 	{ "name": "v_raw_3229", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3229", "role": "default" }} , 
 	{ "name": "v_raw_3637", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3637", "role": "default" }} , 
 	{ "name": "v_raw_4045", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4045", "role": "default" }} , 
 	{ "name": "v_raw_4453", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4453", "role": "default" }} , 
 	{ "name": "v_raw_4859", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4859", "role": "default" }} , 
 	{ "name": "v_raw_5267", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5267", "role": "default" }} , 
 	{ "name": "v_raw_5675", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5675", "role": "default" }} , 
 	{ "name": "v_raw_6083", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6083", "role": "default" }} , 
 	{ "name": "v_raw_3331", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3331", "role": "default" }} , 
 	{ "name": "v_raw_3739", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3739", "role": "default" }} , 
 	{ "name": "v_raw_4147", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4147", "role": "default" }} , 
 	{ "name": "v_raw_4555", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4555", "role": "default" }} , 
 	{ "name": "v_raw_4961", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4961", "role": "default" }} , 
 	{ "name": "v_raw_5369", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5369", "role": "default" }} , 
 	{ "name": "v_raw_5777", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5777", "role": "default" }} , 
 	{ "name": "v_raw_6185", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6185", "role": "default" }} , 
 	{ "name": "v_raw_3433", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3433", "role": "default" }} , 
 	{ "name": "v_raw_3841", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3841", "role": "default" }} , 
 	{ "name": "v_raw_4249", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4249", "role": "default" }} , 
 	{ "name": "v_raw_4657", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4657", "role": "default" }} , 
 	{ "name": "v_raw_5063", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5063", "role": "default" }} , 
 	{ "name": "v_raw_5471", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5471", "role": "default" }} , 
 	{ "name": "v_raw_5879", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5879", "role": "default" }} , 
 	{ "name": "v_raw_6287", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6287", "role": "default" }} , 
 	{ "name": "maximum_v_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "maximum_v_out", "role": "default" }} , 
 	{ "name": "maximum_v_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "maximum_v_out", "role": "ap_vld" }} , 
 	{ "name": "maximum_k_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "maximum_k_out", "role": "default" }} , 
 	{ "name": "maximum_k_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "maximum_k_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "empty_612", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_613", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_614", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "maximum_v_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "maximum_k_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "find_kv_group_max_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U122", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U123", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U124", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U125", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U126", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U127", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U128", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U129", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_quantize_kv_record_Pipeline_find_kv_group_max_block_loop {
		empty_612 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty_613 {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		empty_614 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		maximum_v_out {Type O LastRead -1 FirstWrite 1}
		maximum_k_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	empty_612 { ap_none {  { empty_612 in_data 0 32 } } }
	k_raw_3534 { ap_none {  { k_raw_3534 in_data 0 32 } } }
	k_raw_3942 { ap_none {  { k_raw_3942 in_data 0 32 } } }
	k_raw_4350 { ap_none {  { k_raw_4350 in_data 0 32 } } }
	empty_613 { ap_none {  { empty_613 in_data 0 32 } } }
	k_raw_5164 { ap_none {  { k_raw_5164 in_data 0 32 } } }
	k_raw_5572 { ap_none {  { k_raw_5572 in_data 0 32 } } }
	k_raw_5980 { ap_none {  { k_raw_5980 in_data 0 32 } } }
	k_raw_3228 { ap_none {  { k_raw_3228 in_data 0 32 } } }
	k_raw_3636 { ap_none {  { k_raw_3636 in_data 0 32 } } }
	k_raw_4044 { ap_none {  { k_raw_4044 in_data 0 32 } } }
	k_raw_4452 { ap_none {  { k_raw_4452 in_data 0 32 } } }
	k_raw_4858 { ap_none {  { k_raw_4858 in_data 0 32 } } }
	k_raw_5266 { ap_none {  { k_raw_5266 in_data 0 32 } } }
	k_raw_5674 { ap_none {  { k_raw_5674 in_data 0 32 } } }
	k_raw_6082 { ap_none {  { k_raw_6082 in_data 0 32 } } }
	k_raw_3330 { ap_none {  { k_raw_3330 in_data 0 32 } } }
	k_raw_3738 { ap_none {  { k_raw_3738 in_data 0 32 } } }
	k_raw_4146 { ap_none {  { k_raw_4146 in_data 0 32 } } }
	k_raw_4554 { ap_none {  { k_raw_4554 in_data 0 32 } } }
	k_raw_4960 { ap_none {  { k_raw_4960 in_data 0 32 } } }
	k_raw_5368 { ap_none {  { k_raw_5368 in_data 0 32 } } }
	k_raw_5776 { ap_none {  { k_raw_5776 in_data 0 32 } } }
	k_raw_6184 { ap_none {  { k_raw_6184 in_data 0 32 } } }
	k_raw_3432 { ap_none {  { k_raw_3432 in_data 0 32 } } }
	k_raw_3840 { ap_none {  { k_raw_3840 in_data 0 32 } } }
	k_raw_4248 { ap_none {  { k_raw_4248 in_data 0 32 } } }
	k_raw_4656 { ap_none {  { k_raw_4656 in_data 0 32 } } }
	k_raw_5062 { ap_none {  { k_raw_5062 in_data 0 32 } } }
	k_raw_5470 { ap_none {  { k_raw_5470 in_data 0 32 } } }
	k_raw_5878 { ap_none {  { k_raw_5878 in_data 0 32 } } }
	k_raw_6286 { ap_none {  { k_raw_6286 in_data 0 32 } } }
	empty_614 { ap_none {  { empty_614 in_data 0 32 } } }
	v_raw_3535 { ap_none {  { v_raw_3535 in_data 0 32 } } }
	v_raw_3943 { ap_none {  { v_raw_3943 in_data 0 32 } } }
	v_raw_4351 { ap_none {  { v_raw_4351 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 32 } } }
	v_raw_5165 { ap_none {  { v_raw_5165 in_data 0 32 } } }
	v_raw_5573 { ap_none {  { v_raw_5573 in_data 0 32 } } }
	v_raw_5981 { ap_none {  { v_raw_5981 in_data 0 32 } } }
	v_raw_3229 { ap_none {  { v_raw_3229 in_data 0 32 } } }
	v_raw_3637 { ap_none {  { v_raw_3637 in_data 0 32 } } }
	v_raw_4045 { ap_none {  { v_raw_4045 in_data 0 32 } } }
	v_raw_4453 { ap_none {  { v_raw_4453 in_data 0 32 } } }
	v_raw_4859 { ap_none {  { v_raw_4859 in_data 0 32 } } }
	v_raw_5267 { ap_none {  { v_raw_5267 in_data 0 32 } } }
	v_raw_5675 { ap_none {  { v_raw_5675 in_data 0 32 } } }
	v_raw_6083 { ap_none {  { v_raw_6083 in_data 0 32 } } }
	v_raw_3331 { ap_none {  { v_raw_3331 in_data 0 32 } } }
	v_raw_3739 { ap_none {  { v_raw_3739 in_data 0 32 } } }
	v_raw_4147 { ap_none {  { v_raw_4147 in_data 0 32 } } }
	v_raw_4555 { ap_none {  { v_raw_4555 in_data 0 32 } } }
	v_raw_4961 { ap_none {  { v_raw_4961 in_data 0 32 } } }
	v_raw_5369 { ap_none {  { v_raw_5369 in_data 0 32 } } }
	v_raw_5777 { ap_none {  { v_raw_5777 in_data 0 32 } } }
	v_raw_6185 { ap_none {  { v_raw_6185 in_data 0 32 } } }
	v_raw_3433 { ap_none {  { v_raw_3433 in_data 0 32 } } }
	v_raw_3841 { ap_none {  { v_raw_3841 in_data 0 32 } } }
	v_raw_4249 { ap_none {  { v_raw_4249 in_data 0 32 } } }
	v_raw_4657 { ap_none {  { v_raw_4657 in_data 0 32 } } }
	v_raw_5063 { ap_none {  { v_raw_5063 in_data 0 32 } } }
	v_raw_5471 { ap_none {  { v_raw_5471 in_data 0 32 } } }
	v_raw_5879 { ap_none {  { v_raw_5879 in_data 0 32 } } }
	v_raw_6287 { ap_none {  { v_raw_6287 in_data 0 32 } } }
	maximum_v_out { ap_vld {  { maximum_v_out out_data 1 32 }  { maximum_v_out_ap_vld out_vld 1 1 } } }
	maximum_k_out { ap_vld {  { maximum_k_out out_data 1 32 }  { maximum_k_out_ap_vld out_vld 1 1 } } }
}
