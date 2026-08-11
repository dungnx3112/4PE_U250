set moduleName int4_write_outputs_7_Pipeline_fused_residual_add_loop
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
set C_modelName {int4_write_outputs.7_Pipeline_fused_residual_add_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ residual_values float 32 regular  }
	{ residual_values_31 float 32 regular  }
	{ residual_values_32 float 32 regular  }
	{ residual_values_33 float 32 regular  }
	{ residual_values_34 float 32 regular  }
	{ residual_values_35 float 32 regular  }
	{ residual_values_36 float 32 regular  }
	{ residual_values_37 float 32 regular  }
	{ residual_values_38 float 32 regular  }
	{ residual_values_39 float 32 regular  }
	{ residual_values_40 float 32 regular  }
	{ residual_values_41 float 32 regular  }
	{ residual_values_42 float 32 regular  }
	{ residual_values_43 float 32 regular  }
	{ residual_values_44 float 32 regular  }
	{ residual_values_45 float 32 regular  }
	{ branch_values float 32 regular  }
	{ branch_values_31 float 32 regular  }
	{ branch_values_32 float 32 regular  }
	{ branch_values_33 float 32 regular  }
	{ branch_values_34 float 32 regular  }
	{ branch_values_35 float 32 regular  }
	{ branch_values_36 float 32 regular  }
	{ branch_values_37 float 32 regular  }
	{ branch_values_38 float 32 regular  }
	{ branch_values_39 float 32 regular  }
	{ branch_values_40 float 32 regular  }
	{ branch_values_41 float 32 regular  }
	{ branch_values_42 float 32 regular  }
	{ branch_values_43 float 32 regular  }
	{ branch_values_44 float 32 regular  }
	{ branch_values_45 float 32 regular  }
	{ p_out float 32 regular {pointer 1}  }
	{ p_out1 float 32 regular {pointer 1}  }
	{ p_out2 float 32 regular {pointer 1}  }
	{ p_out3 float 32 regular {pointer 1}  }
	{ p_out4 float 32 regular {pointer 1}  }
	{ p_out5 float 32 regular {pointer 1}  }
	{ p_out6 float 32 regular {pointer 1}  }
	{ p_out7 float 32 regular {pointer 1}  }
	{ p_out8 float 32 regular {pointer 1}  }
	{ p_out9 float 32 regular {pointer 1}  }
	{ p_out10 float 32 regular {pointer 1}  }
	{ p_out11 float 32 regular {pointer 1}  }
	{ p_out12 float 32 regular {pointer 1}  }
	{ p_out13 float 32 regular {pointer 1}  }
	{ p_out14 float 32 regular {pointer 1}  }
	{ p_out15 float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "residual_values", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_31", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_32", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_33", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_34", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_35", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_36", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_37", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_38", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_39", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_40", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_41", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_42", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_43", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_44", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "residual_values_45", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_31", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_32", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_33", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_34", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_35", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_36", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_37", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_38", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_39", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_40", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_41", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_42", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_43", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_44", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "branch_values_45", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out1", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out2", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out3", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out4", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out5", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out6", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out7", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out8", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out9", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out10", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out11", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out12", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out13", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out14", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out15", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ residual_values sc_in sc_lv 32 signal 0 } 
	{ residual_values_31 sc_in sc_lv 32 signal 1 } 
	{ residual_values_32 sc_in sc_lv 32 signal 2 } 
	{ residual_values_33 sc_in sc_lv 32 signal 3 } 
	{ residual_values_34 sc_in sc_lv 32 signal 4 } 
	{ residual_values_35 sc_in sc_lv 32 signal 5 } 
	{ residual_values_36 sc_in sc_lv 32 signal 6 } 
	{ residual_values_37 sc_in sc_lv 32 signal 7 } 
	{ residual_values_38 sc_in sc_lv 32 signal 8 } 
	{ residual_values_39 sc_in sc_lv 32 signal 9 } 
	{ residual_values_40 sc_in sc_lv 32 signal 10 } 
	{ residual_values_41 sc_in sc_lv 32 signal 11 } 
	{ residual_values_42 sc_in sc_lv 32 signal 12 } 
	{ residual_values_43 sc_in sc_lv 32 signal 13 } 
	{ residual_values_44 sc_in sc_lv 32 signal 14 } 
	{ residual_values_45 sc_in sc_lv 32 signal 15 } 
	{ branch_values sc_in sc_lv 32 signal 16 } 
	{ branch_values_31 sc_in sc_lv 32 signal 17 } 
	{ branch_values_32 sc_in sc_lv 32 signal 18 } 
	{ branch_values_33 sc_in sc_lv 32 signal 19 } 
	{ branch_values_34 sc_in sc_lv 32 signal 20 } 
	{ branch_values_35 sc_in sc_lv 32 signal 21 } 
	{ branch_values_36 sc_in sc_lv 32 signal 22 } 
	{ branch_values_37 sc_in sc_lv 32 signal 23 } 
	{ branch_values_38 sc_in sc_lv 32 signal 24 } 
	{ branch_values_39 sc_in sc_lv 32 signal 25 } 
	{ branch_values_40 sc_in sc_lv 32 signal 26 } 
	{ branch_values_41 sc_in sc_lv 32 signal 27 } 
	{ branch_values_42 sc_in sc_lv 32 signal 28 } 
	{ branch_values_43 sc_in sc_lv 32 signal 29 } 
	{ branch_values_44 sc_in sc_lv 32 signal 30 } 
	{ branch_values_45 sc_in sc_lv 32 signal 31 } 
	{ p_out sc_out sc_lv 32 signal 32 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 32 } 
	{ p_out1 sc_out sc_lv 32 signal 33 } 
	{ p_out1_ap_vld sc_out sc_logic 1 outvld 33 } 
	{ p_out2 sc_out sc_lv 32 signal 34 } 
	{ p_out2_ap_vld sc_out sc_logic 1 outvld 34 } 
	{ p_out3 sc_out sc_lv 32 signal 35 } 
	{ p_out3_ap_vld sc_out sc_logic 1 outvld 35 } 
	{ p_out4 sc_out sc_lv 32 signal 36 } 
	{ p_out4_ap_vld sc_out sc_logic 1 outvld 36 } 
	{ p_out5 sc_out sc_lv 32 signal 37 } 
	{ p_out5_ap_vld sc_out sc_logic 1 outvld 37 } 
	{ p_out6 sc_out sc_lv 32 signal 38 } 
	{ p_out6_ap_vld sc_out sc_logic 1 outvld 38 } 
	{ p_out7 sc_out sc_lv 32 signal 39 } 
	{ p_out7_ap_vld sc_out sc_logic 1 outvld 39 } 
	{ p_out8 sc_out sc_lv 32 signal 40 } 
	{ p_out8_ap_vld sc_out sc_logic 1 outvld 40 } 
	{ p_out9 sc_out sc_lv 32 signal 41 } 
	{ p_out9_ap_vld sc_out sc_logic 1 outvld 41 } 
	{ p_out10 sc_out sc_lv 32 signal 42 } 
	{ p_out10_ap_vld sc_out sc_logic 1 outvld 42 } 
	{ p_out11 sc_out sc_lv 32 signal 43 } 
	{ p_out11_ap_vld sc_out sc_logic 1 outvld 43 } 
	{ p_out12 sc_out sc_lv 32 signal 44 } 
	{ p_out12_ap_vld sc_out sc_logic 1 outvld 44 } 
	{ p_out13 sc_out sc_lv 32 signal 45 } 
	{ p_out13_ap_vld sc_out sc_logic 1 outvld 45 } 
	{ p_out14 sc_out sc_lv 32 signal 46 } 
	{ p_out14_ap_vld sc_out sc_logic 1 outvld 46 } 
	{ p_out15 sc_out sc_lv 32 signal 47 } 
	{ p_out15_ap_vld sc_out sc_logic 1 outvld 47 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "residual_values", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values", "role": "default" }} , 
 	{ "name": "residual_values_31", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_31", "role": "default" }} , 
 	{ "name": "residual_values_32", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_32", "role": "default" }} , 
 	{ "name": "residual_values_33", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_33", "role": "default" }} , 
 	{ "name": "residual_values_34", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_34", "role": "default" }} , 
 	{ "name": "residual_values_35", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_35", "role": "default" }} , 
 	{ "name": "residual_values_36", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_36", "role": "default" }} , 
 	{ "name": "residual_values_37", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_37", "role": "default" }} , 
 	{ "name": "residual_values_38", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_38", "role": "default" }} , 
 	{ "name": "residual_values_39", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_39", "role": "default" }} , 
 	{ "name": "residual_values_40", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_40", "role": "default" }} , 
 	{ "name": "residual_values_41", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_41", "role": "default" }} , 
 	{ "name": "residual_values_42", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_42", "role": "default" }} , 
 	{ "name": "residual_values_43", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_43", "role": "default" }} , 
 	{ "name": "residual_values_44", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_44", "role": "default" }} , 
 	{ "name": "residual_values_45", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "residual_values_45", "role": "default" }} , 
 	{ "name": "branch_values", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values", "role": "default" }} , 
 	{ "name": "branch_values_31", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_31", "role": "default" }} , 
 	{ "name": "branch_values_32", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_32", "role": "default" }} , 
 	{ "name": "branch_values_33", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_33", "role": "default" }} , 
 	{ "name": "branch_values_34", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_34", "role": "default" }} , 
 	{ "name": "branch_values_35", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_35", "role": "default" }} , 
 	{ "name": "branch_values_36", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_36", "role": "default" }} , 
 	{ "name": "branch_values_37", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_37", "role": "default" }} , 
 	{ "name": "branch_values_38", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_38", "role": "default" }} , 
 	{ "name": "branch_values_39", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_39", "role": "default" }} , 
 	{ "name": "branch_values_40", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_40", "role": "default" }} , 
 	{ "name": "branch_values_41", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_41", "role": "default" }} , 
 	{ "name": "branch_values_42", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_42", "role": "default" }} , 
 	{ "name": "branch_values_43", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_43", "role": "default" }} , 
 	{ "name": "branch_values_44", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_44", "role": "default" }} , 
 	{ "name": "branch_values_45", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "branch_values_45", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "p_out1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out1", "role": "default" }} , 
 	{ "name": "p_out1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out1", "role": "ap_vld" }} , 
 	{ "name": "p_out2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out2", "role": "default" }} , 
 	{ "name": "p_out2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out2", "role": "ap_vld" }} , 
 	{ "name": "p_out3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out3", "role": "default" }} , 
 	{ "name": "p_out3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out3", "role": "ap_vld" }} , 
 	{ "name": "p_out4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out4", "role": "default" }} , 
 	{ "name": "p_out4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out4", "role": "ap_vld" }} , 
 	{ "name": "p_out5", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out5", "role": "default" }} , 
 	{ "name": "p_out5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out5", "role": "ap_vld" }} , 
 	{ "name": "p_out6", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out6", "role": "default" }} , 
 	{ "name": "p_out6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out6", "role": "ap_vld" }} , 
 	{ "name": "p_out7", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out7", "role": "default" }} , 
 	{ "name": "p_out7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out7", "role": "ap_vld" }} , 
 	{ "name": "p_out8", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out8", "role": "default" }} , 
 	{ "name": "p_out8_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out8", "role": "ap_vld" }} , 
 	{ "name": "p_out9", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out9", "role": "default" }} , 
 	{ "name": "p_out9_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out9", "role": "ap_vld" }} , 
 	{ "name": "p_out10", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out10", "role": "default" }} , 
 	{ "name": "p_out10_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out10", "role": "ap_vld" }} , 
 	{ "name": "p_out11", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out11", "role": "default" }} , 
 	{ "name": "p_out11_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out11", "role": "ap_vld" }} , 
 	{ "name": "p_out12", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out12", "role": "default" }} , 
 	{ "name": "p_out12_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out12", "role": "ap_vld" }} , 
 	{ "name": "p_out13", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out13", "role": "default" }} , 
 	{ "name": "p_out13_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out13", "role": "ap_vld" }} , 
 	{ "name": "p_out14", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out14", "role": "default" }} , 
 	{ "name": "p_out14_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out14", "role": "ap_vld" }} , 
 	{ "name": "p_out15", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_out15", "role": "default" }} , 
 	{ "name": "p_out15_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out15", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "int4_write_outputs_7_Pipeline_fused_residual_add_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "24", "EstimateLatencyMax" : "24",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "residual_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "residual_values_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_32", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_33", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_34", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_35", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_36", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_37", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_38", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_39", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_40", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_41", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_42", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_43", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_44", "Type" : "None", "Direction" : "I"},
			{"Name" : "branch_values_45", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "fused_residual_add_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter7", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter7", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_7_full_dsp_1_U2347", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U2348", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_33_4_32_1_1_U2349", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	int4_write_outputs_7_Pipeline_fused_residual_add_loop {
		residual_values {Type I LastRead 0 FirstWrite -1}
		residual_values_31 {Type I LastRead 0 FirstWrite -1}
		residual_values_32 {Type I LastRead 0 FirstWrite -1}
		residual_values_33 {Type I LastRead 0 FirstWrite -1}
		residual_values_34 {Type I LastRead 0 FirstWrite -1}
		residual_values_35 {Type I LastRead 0 FirstWrite -1}
		residual_values_36 {Type I LastRead 0 FirstWrite -1}
		residual_values_37 {Type I LastRead 0 FirstWrite -1}
		residual_values_38 {Type I LastRead 0 FirstWrite -1}
		residual_values_39 {Type I LastRead 0 FirstWrite -1}
		residual_values_40 {Type I LastRead 0 FirstWrite -1}
		residual_values_41 {Type I LastRead 0 FirstWrite -1}
		residual_values_42 {Type I LastRead 0 FirstWrite -1}
		residual_values_43 {Type I LastRead 0 FirstWrite -1}
		residual_values_44 {Type I LastRead 0 FirstWrite -1}
		residual_values_45 {Type I LastRead 0 FirstWrite -1}
		branch_values {Type I LastRead 0 FirstWrite -1}
		branch_values_31 {Type I LastRead 0 FirstWrite -1}
		branch_values_32 {Type I LastRead 0 FirstWrite -1}
		branch_values_33 {Type I LastRead 0 FirstWrite -1}
		branch_values_34 {Type I LastRead 0 FirstWrite -1}
		branch_values_35 {Type I LastRead 0 FirstWrite -1}
		branch_values_36 {Type I LastRead 0 FirstWrite -1}
		branch_values_37 {Type I LastRead 0 FirstWrite -1}
		branch_values_38 {Type I LastRead 0 FirstWrite -1}
		branch_values_39 {Type I LastRead 0 FirstWrite -1}
		branch_values_40 {Type I LastRead 0 FirstWrite -1}
		branch_values_41 {Type I LastRead 0 FirstWrite -1}
		branch_values_42 {Type I LastRead 0 FirstWrite -1}
		branch_values_43 {Type I LastRead 0 FirstWrite -1}
		branch_values_44 {Type I LastRead 0 FirstWrite -1}
		branch_values_45 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 6}
		p_out1 {Type O LastRead -1 FirstWrite 6}
		p_out2 {Type O LastRead -1 FirstWrite 6}
		p_out3 {Type O LastRead -1 FirstWrite 6}
		p_out4 {Type O LastRead -1 FirstWrite 6}
		p_out5 {Type O LastRead -1 FirstWrite 6}
		p_out6 {Type O LastRead -1 FirstWrite 6}
		p_out7 {Type O LastRead -1 FirstWrite 6}
		p_out8 {Type O LastRead -1 FirstWrite 6}
		p_out9 {Type O LastRead -1 FirstWrite 6}
		p_out10 {Type O LastRead -1 FirstWrite 6}
		p_out11 {Type O LastRead -1 FirstWrite 6}
		p_out12 {Type O LastRead -1 FirstWrite 6}
		p_out13 {Type O LastRead -1 FirstWrite 6}
		p_out14 {Type O LastRead -1 FirstWrite 6}
		p_out15 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "24", "Max" : "24"}
	, {"Name" : "Interval", "Min" : "24", "Max" : "24"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	residual_values { ap_none {  { residual_values in_data 0 32 } } }
	residual_values_31 { ap_none {  { residual_values_31 in_data 0 32 } } }
	residual_values_32 { ap_none {  { residual_values_32 in_data 0 32 } } }
	residual_values_33 { ap_none {  { residual_values_33 in_data 0 32 } } }
	residual_values_34 { ap_none {  { residual_values_34 in_data 0 32 } } }
	residual_values_35 { ap_none {  { residual_values_35 in_data 0 32 } } }
	residual_values_36 { ap_none {  { residual_values_36 in_data 0 32 } } }
	residual_values_37 { ap_none {  { residual_values_37 in_data 0 32 } } }
	residual_values_38 { ap_none {  { residual_values_38 in_data 0 32 } } }
	residual_values_39 { ap_none {  { residual_values_39 in_data 0 32 } } }
	residual_values_40 { ap_none {  { residual_values_40 in_data 0 32 } } }
	residual_values_41 { ap_none {  { residual_values_41 in_data 0 32 } } }
	residual_values_42 { ap_none {  { residual_values_42 in_data 0 32 } } }
	residual_values_43 { ap_none {  { residual_values_43 in_data 0 32 } } }
	residual_values_44 { ap_none {  { residual_values_44 in_data 0 32 } } }
	residual_values_45 { ap_none {  { residual_values_45 in_data 0 32 } } }
	branch_values { ap_none {  { branch_values in_data 0 32 } } }
	branch_values_31 { ap_none {  { branch_values_31 in_data 0 32 } } }
	branch_values_32 { ap_none {  { branch_values_32 in_data 0 32 } } }
	branch_values_33 { ap_none {  { branch_values_33 in_data 0 32 } } }
	branch_values_34 { ap_none {  { branch_values_34 in_data 0 32 } } }
	branch_values_35 { ap_none {  { branch_values_35 in_data 0 32 } } }
	branch_values_36 { ap_none {  { branch_values_36 in_data 0 32 } } }
	branch_values_37 { ap_none {  { branch_values_37 in_data 0 32 } } }
	branch_values_38 { ap_none {  { branch_values_38 in_data 0 32 } } }
	branch_values_39 { ap_none {  { branch_values_39 in_data 0 32 } } }
	branch_values_40 { ap_none {  { branch_values_40 in_data 0 32 } } }
	branch_values_41 { ap_none {  { branch_values_41 in_data 0 32 } } }
	branch_values_42 { ap_none {  { branch_values_42 in_data 0 32 } } }
	branch_values_43 { ap_none {  { branch_values_43 in_data 0 32 } } }
	branch_values_44 { ap_none {  { branch_values_44 in_data 0 32 } } }
	branch_values_45 { ap_none {  { branch_values_45 in_data 0 32 } } }
	p_out { ap_vld {  { p_out out_data 1 32 }  { p_out_ap_vld out_vld 1 1 } } }
	p_out1 { ap_vld {  { p_out1 out_data 1 32 }  { p_out1_ap_vld out_vld 1 1 } } }
	p_out2 { ap_vld {  { p_out2 out_data 1 32 }  { p_out2_ap_vld out_vld 1 1 } } }
	p_out3 { ap_vld {  { p_out3 out_data 1 32 }  { p_out3_ap_vld out_vld 1 1 } } }
	p_out4 { ap_vld {  { p_out4 out_data 1 32 }  { p_out4_ap_vld out_vld 1 1 } } }
	p_out5 { ap_vld {  { p_out5 out_data 1 32 }  { p_out5_ap_vld out_vld 1 1 } } }
	p_out6 { ap_vld {  { p_out6 out_data 1 32 }  { p_out6_ap_vld out_vld 1 1 } } }
	p_out7 { ap_vld {  { p_out7 out_data 1 32 }  { p_out7_ap_vld out_vld 1 1 } } }
	p_out8 { ap_vld {  { p_out8 out_data 1 32 }  { p_out8_ap_vld out_vld 1 1 } } }
	p_out9 { ap_vld {  { p_out9 out_data 1 32 }  { p_out9_ap_vld out_vld 1 1 } } }
	p_out10 { ap_vld {  { p_out10 out_data 1 32 }  { p_out10_ap_vld out_vld 1 1 } } }
	p_out11 { ap_vld {  { p_out11 out_data 1 32 }  { p_out11_ap_vld out_vld 1 1 } } }
	p_out12 { ap_vld {  { p_out12 out_data 1 32 }  { p_out12_ap_vld out_vld 1 1 } } }
	p_out13 { ap_vld {  { p_out13 out_data 1 32 }  { p_out13_ap_vld out_vld 1 1 } } }
	p_out14 { ap_vld {  { p_out14 out_data 1 32 }  { p_out14_ap_vld out_vld 1 1 } } }
	p_out15 { ap_vld {  { p_out15 out_data 1 32 }  { p_out15_ap_vld out_vld 1 1 } } }
}
