set moduleName swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop
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
set C_modelName {swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop}
set C_modelType { void 0 }
set C_modelArgList {
	{ v_raw_3433 int 32 regular  }
	{ v_raw_3841 int 32 regular  }
	{ v_raw_4249 int 32 regular  }
	{ v_raw_4657 int 32 regular  }
	{ v_raw_5063 int 32 regular  }
	{ v_raw_5471 int 32 regular  }
	{ v_raw_5879 int 32 regular  }
	{ v_raw_6287 int 32 regular  }
	{ conv3_i12_i_i int 32 regular  }
	{ sh_prom_i_i int 5 regular  }
	{ k_raw_3432 int 32 regular  }
	{ k_raw_3840 int 32 regular  }
	{ k_raw_4248 int 32 regular  }
	{ k_raw_4656 int 32 regular  }
	{ k_raw_5062 int 32 regular  }
	{ k_raw_5470 int 32 regular  }
	{ k_raw_5878 int 32 regular  }
	{ k_raw_6286 int 32 regular  }
	{ conv3_i12_i_i313 int 32 regular  }
	{ sh_prom_i_i328 int 5 regular  }
	{ v_raw_3331 int 32 regular  }
	{ v_raw_3739 int 32 regular  }
	{ v_raw_4147 int 32 regular  }
	{ v_raw_4555 int 32 regular  }
	{ v_raw_4961 int 32 regular  }
	{ v_raw_5369 int 32 regular  }
	{ v_raw_5777 int 32 regular  }
	{ v_raw_6185 int 32 regular  }
	{ k_raw_3330 int 32 regular  }
	{ k_raw_3738 int 32 regular  }
	{ k_raw_4146 int 32 regular  }
	{ k_raw_4554 int 32 regular  }
	{ k_raw_4960 int 32 regular  }
	{ k_raw_5368 int 32 regular  }
	{ k_raw_5776 int 32 regular  }
	{ k_raw_6184 int 32 regular  }
	{ v_raw_3229 int 32 regular  }
	{ v_raw_3637 int 32 regular  }
	{ v_raw_4045 int 32 regular  }
	{ v_raw_4453 int 32 regular  }
	{ v_raw_4859 int 32 regular  }
	{ v_raw_5267 int 32 regular  }
	{ v_raw_5675 int 32 regular  }
	{ v_raw_6083 int 32 regular  }
	{ k_raw_3228 int 32 regular  }
	{ k_raw_3636 int 32 regular  }
	{ k_raw_4044 int 32 regular  }
	{ k_raw_4452 int 32 regular  }
	{ k_raw_4858 int 32 regular  }
	{ k_raw_5266 int 32 regular  }
	{ k_raw_5674 int 32 regular  }
	{ k_raw_6082 int 32 regular  }
	{ empty_609 int 32 regular  }
	{ v_raw_3535 int 32 regular  }
	{ v_raw_3943 int 32 regular  }
	{ v_raw_4351 int 32 regular  }
	{ empty_610 int 32 regular  }
	{ v_raw_5165 int 32 regular  }
	{ v_raw_5573 int 32 regular  }
	{ v_raw_5981 int 32 regular  }
	{ empty_611 int 32 regular  }
	{ k_raw_3534 int 32 regular  }
	{ k_raw_3942 int 32 regular  }
	{ k_raw_4350 int 32 regular  }
	{ empty int 32 regular  }
	{ k_raw_5164 int 32 regular  }
	{ k_raw_5572 int 32 regular  }
	{ k_raw_5980 int 32 regular  }
	{ quantized_k_group_31_out int 8 regular {pointer 1}  }
	{ quantized_k_group_30_out int 8 regular {pointer 1}  }
	{ quantized_k_group_29_out int 8 regular {pointer 1}  }
	{ quantized_k_group_28_out int 8 regular {pointer 1}  }
	{ quantized_k_group_27_out int 8 regular {pointer 1}  }
	{ quantized_k_group_26_out int 8 regular {pointer 1}  }
	{ quantized_k_group_25_out int 8 regular {pointer 1}  }
	{ quantized_k_group_24_out int 8 regular {pointer 1}  }
	{ quantized_k_group_23_out int 8 regular {pointer 1}  }
	{ quantized_k_group_22_out int 8 regular {pointer 1}  }
	{ quantized_k_group_21_out int 8 regular {pointer 1}  }
	{ quantized_k_group_20_out int 8 regular {pointer 1}  }
	{ quantized_k_group_19_out int 8 regular {pointer 1}  }
	{ quantized_k_group_18_out int 8 regular {pointer 1}  }
	{ quantized_k_group_17_out int 8 regular {pointer 1}  }
	{ quantized_k_group_16_out int 8 regular {pointer 1}  }
	{ quantized_k_group_15_out int 8 regular {pointer 1}  }
	{ quantized_k_group_14_out int 8 regular {pointer 1}  }
	{ quantized_k_group_13_out int 8 regular {pointer 1}  }
	{ quantized_k_group_12_out int 8 regular {pointer 1}  }
	{ quantized_k_group_11_out int 8 regular {pointer 1}  }
	{ quantized_k_group_10_out int 8 regular {pointer 1}  }
	{ quantized_k_group_9_out int 8 regular {pointer 1}  }
	{ quantized_k_group_8_out int 8 regular {pointer 1}  }
	{ quantized_k_group_7_out int 8 regular {pointer 1}  }
	{ quantized_k_group_6_out int 8 regular {pointer 1}  }
	{ quantized_k_group_5_out int 8 regular {pointer 1}  }
	{ quantized_k_group_4_out int 8 regular {pointer 1}  }
	{ quantized_k_group_3_out int 8 regular {pointer 1}  }
	{ quantized_k_group_2_out int 8 regular {pointer 1}  }
	{ quantized_k_group_1_out int 8 regular {pointer 1}  }
	{ quantized_k_group_out int 8 regular {pointer 1}  }
	{ quantized_v_group_31_out int 8 regular {pointer 1}  }
	{ quantized_v_group_30_out int 8 regular {pointer 1}  }
	{ quantized_v_group_29_out int 8 regular {pointer 1}  }
	{ quantized_v_group_28_out int 8 regular {pointer 1}  }
	{ quantized_v_group_27_out int 8 regular {pointer 1}  }
	{ quantized_v_group_26_out int 8 regular {pointer 1}  }
	{ quantized_v_group_25_out int 8 regular {pointer 1}  }
	{ quantized_v_group_24_out int 8 regular {pointer 1}  }
	{ quantized_v_group_23_out int 8 regular {pointer 1}  }
	{ quantized_v_group_22_out int 8 regular {pointer 1}  }
	{ quantized_v_group_21_out int 8 regular {pointer 1}  }
	{ quantized_v_group_20_out int 8 regular {pointer 1}  }
	{ quantized_v_group_19_out int 8 regular {pointer 1}  }
	{ quantized_v_group_18_out int 8 regular {pointer 1}  }
	{ quantized_v_group_17_out int 8 regular {pointer 1}  }
	{ quantized_v_group_16_out int 8 regular {pointer 1}  }
	{ quantized_v_group_15_out int 8 regular {pointer 1}  }
	{ quantized_v_group_14_out int 8 regular {pointer 1}  }
	{ quantized_v_group_13_out int 8 regular {pointer 1}  }
	{ quantized_v_group_12_out int 8 regular {pointer 1}  }
	{ quantized_v_group_11_out int 8 regular {pointer 1}  }
	{ quantized_v_group_10_out int 8 regular {pointer 1}  }
	{ quantized_v_group_9_out int 8 regular {pointer 1}  }
	{ quantized_v_group_8_out int 8 regular {pointer 1}  }
	{ quantized_v_group_7_out int 8 regular {pointer 1}  }
	{ quantized_v_group_6_out int 8 regular {pointer 1}  }
	{ quantized_v_group_5_out int 8 regular {pointer 1}  }
	{ quantized_v_group_4_out int 8 regular {pointer 1}  }
	{ quantized_v_group_3_out int 8 regular {pointer 1}  }
	{ quantized_v_group_2_out int 8 regular {pointer 1}  }
	{ quantized_v_group_1_out int 8 regular {pointer 1}  }
	{ quantized_v_group_out int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "v_raw_3433", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3841", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4249", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4657", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5063", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5471", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5879", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6287", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i12_i_i", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sh_prom_i_i", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3432", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3840", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4248", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4656", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5062", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5470", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5878", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6286", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "conv3_i12_i_i313", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sh_prom_i_i328", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3331", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3739", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4147", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4555", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4961", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5369", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5777", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6185", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3330", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3738", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4146", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4554", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4960", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5368", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5776", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6184", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3229", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3637", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4045", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4453", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4859", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5267", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5675", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_6083", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3228", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3636", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4044", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4452", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4858", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5266", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5674", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_6082", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_609", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3535", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_3943", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_4351", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_610", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5165", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5573", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "v_raw_5981", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty_611", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3534", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_3942", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_4350", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5164", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5572", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k_raw_5980", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "quantized_k_group_31_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_30_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_29_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_28_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_27_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_26_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_25_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_24_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_23_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_22_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_21_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_20_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_19_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_18_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_17_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_16_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_15_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_14_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_13_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_12_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_11_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_10_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_9_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_8_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_7_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_6_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_5_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_4_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_3_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_k_group_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_31_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_30_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_29_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_28_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_27_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_26_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_25_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_24_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_23_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_22_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_21_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_20_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_19_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_18_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_17_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_16_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_15_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_14_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_13_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_12_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_11_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_10_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_9_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_8_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_7_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_6_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_5_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_4_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_3_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_2_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_1_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "quantized_v_group_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 202
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ v_raw_3433 sc_in sc_lv 32 signal 0 } 
	{ v_raw_3841 sc_in sc_lv 32 signal 1 } 
	{ v_raw_4249 sc_in sc_lv 32 signal 2 } 
	{ v_raw_4657 sc_in sc_lv 32 signal 3 } 
	{ v_raw_5063 sc_in sc_lv 32 signal 4 } 
	{ v_raw_5471 sc_in sc_lv 32 signal 5 } 
	{ v_raw_5879 sc_in sc_lv 32 signal 6 } 
	{ v_raw_6287 sc_in sc_lv 32 signal 7 } 
	{ conv3_i12_i_i sc_in sc_lv 32 signal 8 } 
	{ sh_prom_i_i sc_in sc_lv 5 signal 9 } 
	{ k_raw_3432 sc_in sc_lv 32 signal 10 } 
	{ k_raw_3840 sc_in sc_lv 32 signal 11 } 
	{ k_raw_4248 sc_in sc_lv 32 signal 12 } 
	{ k_raw_4656 sc_in sc_lv 32 signal 13 } 
	{ k_raw_5062 sc_in sc_lv 32 signal 14 } 
	{ k_raw_5470 sc_in sc_lv 32 signal 15 } 
	{ k_raw_5878 sc_in sc_lv 32 signal 16 } 
	{ k_raw_6286 sc_in sc_lv 32 signal 17 } 
	{ conv3_i12_i_i313 sc_in sc_lv 32 signal 18 } 
	{ sh_prom_i_i328 sc_in sc_lv 5 signal 19 } 
	{ v_raw_3331 sc_in sc_lv 32 signal 20 } 
	{ v_raw_3739 sc_in sc_lv 32 signal 21 } 
	{ v_raw_4147 sc_in sc_lv 32 signal 22 } 
	{ v_raw_4555 sc_in sc_lv 32 signal 23 } 
	{ v_raw_4961 sc_in sc_lv 32 signal 24 } 
	{ v_raw_5369 sc_in sc_lv 32 signal 25 } 
	{ v_raw_5777 sc_in sc_lv 32 signal 26 } 
	{ v_raw_6185 sc_in sc_lv 32 signal 27 } 
	{ k_raw_3330 sc_in sc_lv 32 signal 28 } 
	{ k_raw_3738 sc_in sc_lv 32 signal 29 } 
	{ k_raw_4146 sc_in sc_lv 32 signal 30 } 
	{ k_raw_4554 sc_in sc_lv 32 signal 31 } 
	{ k_raw_4960 sc_in sc_lv 32 signal 32 } 
	{ k_raw_5368 sc_in sc_lv 32 signal 33 } 
	{ k_raw_5776 sc_in sc_lv 32 signal 34 } 
	{ k_raw_6184 sc_in sc_lv 32 signal 35 } 
	{ v_raw_3229 sc_in sc_lv 32 signal 36 } 
	{ v_raw_3637 sc_in sc_lv 32 signal 37 } 
	{ v_raw_4045 sc_in sc_lv 32 signal 38 } 
	{ v_raw_4453 sc_in sc_lv 32 signal 39 } 
	{ v_raw_4859 sc_in sc_lv 32 signal 40 } 
	{ v_raw_5267 sc_in sc_lv 32 signal 41 } 
	{ v_raw_5675 sc_in sc_lv 32 signal 42 } 
	{ v_raw_6083 sc_in sc_lv 32 signal 43 } 
	{ k_raw_3228 sc_in sc_lv 32 signal 44 } 
	{ k_raw_3636 sc_in sc_lv 32 signal 45 } 
	{ k_raw_4044 sc_in sc_lv 32 signal 46 } 
	{ k_raw_4452 sc_in sc_lv 32 signal 47 } 
	{ k_raw_4858 sc_in sc_lv 32 signal 48 } 
	{ k_raw_5266 sc_in sc_lv 32 signal 49 } 
	{ k_raw_5674 sc_in sc_lv 32 signal 50 } 
	{ k_raw_6082 sc_in sc_lv 32 signal 51 } 
	{ empty_609 sc_in sc_lv 32 signal 52 } 
	{ v_raw_3535 sc_in sc_lv 32 signal 53 } 
	{ v_raw_3943 sc_in sc_lv 32 signal 54 } 
	{ v_raw_4351 sc_in sc_lv 32 signal 55 } 
	{ empty_610 sc_in sc_lv 32 signal 56 } 
	{ v_raw_5165 sc_in sc_lv 32 signal 57 } 
	{ v_raw_5573 sc_in sc_lv 32 signal 58 } 
	{ v_raw_5981 sc_in sc_lv 32 signal 59 } 
	{ empty_611 sc_in sc_lv 32 signal 60 } 
	{ k_raw_3534 sc_in sc_lv 32 signal 61 } 
	{ k_raw_3942 sc_in sc_lv 32 signal 62 } 
	{ k_raw_4350 sc_in sc_lv 32 signal 63 } 
	{ empty sc_in sc_lv 32 signal 64 } 
	{ k_raw_5164 sc_in sc_lv 32 signal 65 } 
	{ k_raw_5572 sc_in sc_lv 32 signal 66 } 
	{ k_raw_5980 sc_in sc_lv 32 signal 67 } 
	{ quantized_k_group_31_out sc_out sc_lv 8 signal 68 } 
	{ quantized_k_group_31_out_ap_vld sc_out sc_logic 1 outvld 68 } 
	{ quantized_k_group_30_out sc_out sc_lv 8 signal 69 } 
	{ quantized_k_group_30_out_ap_vld sc_out sc_logic 1 outvld 69 } 
	{ quantized_k_group_29_out sc_out sc_lv 8 signal 70 } 
	{ quantized_k_group_29_out_ap_vld sc_out sc_logic 1 outvld 70 } 
	{ quantized_k_group_28_out sc_out sc_lv 8 signal 71 } 
	{ quantized_k_group_28_out_ap_vld sc_out sc_logic 1 outvld 71 } 
	{ quantized_k_group_27_out sc_out sc_lv 8 signal 72 } 
	{ quantized_k_group_27_out_ap_vld sc_out sc_logic 1 outvld 72 } 
	{ quantized_k_group_26_out sc_out sc_lv 8 signal 73 } 
	{ quantized_k_group_26_out_ap_vld sc_out sc_logic 1 outvld 73 } 
	{ quantized_k_group_25_out sc_out sc_lv 8 signal 74 } 
	{ quantized_k_group_25_out_ap_vld sc_out sc_logic 1 outvld 74 } 
	{ quantized_k_group_24_out sc_out sc_lv 8 signal 75 } 
	{ quantized_k_group_24_out_ap_vld sc_out sc_logic 1 outvld 75 } 
	{ quantized_k_group_23_out sc_out sc_lv 8 signal 76 } 
	{ quantized_k_group_23_out_ap_vld sc_out sc_logic 1 outvld 76 } 
	{ quantized_k_group_22_out sc_out sc_lv 8 signal 77 } 
	{ quantized_k_group_22_out_ap_vld sc_out sc_logic 1 outvld 77 } 
	{ quantized_k_group_21_out sc_out sc_lv 8 signal 78 } 
	{ quantized_k_group_21_out_ap_vld sc_out sc_logic 1 outvld 78 } 
	{ quantized_k_group_20_out sc_out sc_lv 8 signal 79 } 
	{ quantized_k_group_20_out_ap_vld sc_out sc_logic 1 outvld 79 } 
	{ quantized_k_group_19_out sc_out sc_lv 8 signal 80 } 
	{ quantized_k_group_19_out_ap_vld sc_out sc_logic 1 outvld 80 } 
	{ quantized_k_group_18_out sc_out sc_lv 8 signal 81 } 
	{ quantized_k_group_18_out_ap_vld sc_out sc_logic 1 outvld 81 } 
	{ quantized_k_group_17_out sc_out sc_lv 8 signal 82 } 
	{ quantized_k_group_17_out_ap_vld sc_out sc_logic 1 outvld 82 } 
	{ quantized_k_group_16_out sc_out sc_lv 8 signal 83 } 
	{ quantized_k_group_16_out_ap_vld sc_out sc_logic 1 outvld 83 } 
	{ quantized_k_group_15_out sc_out sc_lv 8 signal 84 } 
	{ quantized_k_group_15_out_ap_vld sc_out sc_logic 1 outvld 84 } 
	{ quantized_k_group_14_out sc_out sc_lv 8 signal 85 } 
	{ quantized_k_group_14_out_ap_vld sc_out sc_logic 1 outvld 85 } 
	{ quantized_k_group_13_out sc_out sc_lv 8 signal 86 } 
	{ quantized_k_group_13_out_ap_vld sc_out sc_logic 1 outvld 86 } 
	{ quantized_k_group_12_out sc_out sc_lv 8 signal 87 } 
	{ quantized_k_group_12_out_ap_vld sc_out sc_logic 1 outvld 87 } 
	{ quantized_k_group_11_out sc_out sc_lv 8 signal 88 } 
	{ quantized_k_group_11_out_ap_vld sc_out sc_logic 1 outvld 88 } 
	{ quantized_k_group_10_out sc_out sc_lv 8 signal 89 } 
	{ quantized_k_group_10_out_ap_vld sc_out sc_logic 1 outvld 89 } 
	{ quantized_k_group_9_out sc_out sc_lv 8 signal 90 } 
	{ quantized_k_group_9_out_ap_vld sc_out sc_logic 1 outvld 90 } 
	{ quantized_k_group_8_out sc_out sc_lv 8 signal 91 } 
	{ quantized_k_group_8_out_ap_vld sc_out sc_logic 1 outvld 91 } 
	{ quantized_k_group_7_out sc_out sc_lv 8 signal 92 } 
	{ quantized_k_group_7_out_ap_vld sc_out sc_logic 1 outvld 92 } 
	{ quantized_k_group_6_out sc_out sc_lv 8 signal 93 } 
	{ quantized_k_group_6_out_ap_vld sc_out sc_logic 1 outvld 93 } 
	{ quantized_k_group_5_out sc_out sc_lv 8 signal 94 } 
	{ quantized_k_group_5_out_ap_vld sc_out sc_logic 1 outvld 94 } 
	{ quantized_k_group_4_out sc_out sc_lv 8 signal 95 } 
	{ quantized_k_group_4_out_ap_vld sc_out sc_logic 1 outvld 95 } 
	{ quantized_k_group_3_out sc_out sc_lv 8 signal 96 } 
	{ quantized_k_group_3_out_ap_vld sc_out sc_logic 1 outvld 96 } 
	{ quantized_k_group_2_out sc_out sc_lv 8 signal 97 } 
	{ quantized_k_group_2_out_ap_vld sc_out sc_logic 1 outvld 97 } 
	{ quantized_k_group_1_out sc_out sc_lv 8 signal 98 } 
	{ quantized_k_group_1_out_ap_vld sc_out sc_logic 1 outvld 98 } 
	{ quantized_k_group_out sc_out sc_lv 8 signal 99 } 
	{ quantized_k_group_out_ap_vld sc_out sc_logic 1 outvld 99 } 
	{ quantized_v_group_31_out sc_out sc_lv 8 signal 100 } 
	{ quantized_v_group_31_out_ap_vld sc_out sc_logic 1 outvld 100 } 
	{ quantized_v_group_30_out sc_out sc_lv 8 signal 101 } 
	{ quantized_v_group_30_out_ap_vld sc_out sc_logic 1 outvld 101 } 
	{ quantized_v_group_29_out sc_out sc_lv 8 signal 102 } 
	{ quantized_v_group_29_out_ap_vld sc_out sc_logic 1 outvld 102 } 
	{ quantized_v_group_28_out sc_out sc_lv 8 signal 103 } 
	{ quantized_v_group_28_out_ap_vld sc_out sc_logic 1 outvld 103 } 
	{ quantized_v_group_27_out sc_out sc_lv 8 signal 104 } 
	{ quantized_v_group_27_out_ap_vld sc_out sc_logic 1 outvld 104 } 
	{ quantized_v_group_26_out sc_out sc_lv 8 signal 105 } 
	{ quantized_v_group_26_out_ap_vld sc_out sc_logic 1 outvld 105 } 
	{ quantized_v_group_25_out sc_out sc_lv 8 signal 106 } 
	{ quantized_v_group_25_out_ap_vld sc_out sc_logic 1 outvld 106 } 
	{ quantized_v_group_24_out sc_out sc_lv 8 signal 107 } 
	{ quantized_v_group_24_out_ap_vld sc_out sc_logic 1 outvld 107 } 
	{ quantized_v_group_23_out sc_out sc_lv 8 signal 108 } 
	{ quantized_v_group_23_out_ap_vld sc_out sc_logic 1 outvld 108 } 
	{ quantized_v_group_22_out sc_out sc_lv 8 signal 109 } 
	{ quantized_v_group_22_out_ap_vld sc_out sc_logic 1 outvld 109 } 
	{ quantized_v_group_21_out sc_out sc_lv 8 signal 110 } 
	{ quantized_v_group_21_out_ap_vld sc_out sc_logic 1 outvld 110 } 
	{ quantized_v_group_20_out sc_out sc_lv 8 signal 111 } 
	{ quantized_v_group_20_out_ap_vld sc_out sc_logic 1 outvld 111 } 
	{ quantized_v_group_19_out sc_out sc_lv 8 signal 112 } 
	{ quantized_v_group_19_out_ap_vld sc_out sc_logic 1 outvld 112 } 
	{ quantized_v_group_18_out sc_out sc_lv 8 signal 113 } 
	{ quantized_v_group_18_out_ap_vld sc_out sc_logic 1 outvld 113 } 
	{ quantized_v_group_17_out sc_out sc_lv 8 signal 114 } 
	{ quantized_v_group_17_out_ap_vld sc_out sc_logic 1 outvld 114 } 
	{ quantized_v_group_16_out sc_out sc_lv 8 signal 115 } 
	{ quantized_v_group_16_out_ap_vld sc_out sc_logic 1 outvld 115 } 
	{ quantized_v_group_15_out sc_out sc_lv 8 signal 116 } 
	{ quantized_v_group_15_out_ap_vld sc_out sc_logic 1 outvld 116 } 
	{ quantized_v_group_14_out sc_out sc_lv 8 signal 117 } 
	{ quantized_v_group_14_out_ap_vld sc_out sc_logic 1 outvld 117 } 
	{ quantized_v_group_13_out sc_out sc_lv 8 signal 118 } 
	{ quantized_v_group_13_out_ap_vld sc_out sc_logic 1 outvld 118 } 
	{ quantized_v_group_12_out sc_out sc_lv 8 signal 119 } 
	{ quantized_v_group_12_out_ap_vld sc_out sc_logic 1 outvld 119 } 
	{ quantized_v_group_11_out sc_out sc_lv 8 signal 120 } 
	{ quantized_v_group_11_out_ap_vld sc_out sc_logic 1 outvld 120 } 
	{ quantized_v_group_10_out sc_out sc_lv 8 signal 121 } 
	{ quantized_v_group_10_out_ap_vld sc_out sc_logic 1 outvld 121 } 
	{ quantized_v_group_9_out sc_out sc_lv 8 signal 122 } 
	{ quantized_v_group_9_out_ap_vld sc_out sc_logic 1 outvld 122 } 
	{ quantized_v_group_8_out sc_out sc_lv 8 signal 123 } 
	{ quantized_v_group_8_out_ap_vld sc_out sc_logic 1 outvld 123 } 
	{ quantized_v_group_7_out sc_out sc_lv 8 signal 124 } 
	{ quantized_v_group_7_out_ap_vld sc_out sc_logic 1 outvld 124 } 
	{ quantized_v_group_6_out sc_out sc_lv 8 signal 125 } 
	{ quantized_v_group_6_out_ap_vld sc_out sc_logic 1 outvld 125 } 
	{ quantized_v_group_5_out sc_out sc_lv 8 signal 126 } 
	{ quantized_v_group_5_out_ap_vld sc_out sc_logic 1 outvld 126 } 
	{ quantized_v_group_4_out sc_out sc_lv 8 signal 127 } 
	{ quantized_v_group_4_out_ap_vld sc_out sc_logic 1 outvld 127 } 
	{ quantized_v_group_3_out sc_out sc_lv 8 signal 128 } 
	{ quantized_v_group_3_out_ap_vld sc_out sc_logic 1 outvld 128 } 
	{ quantized_v_group_2_out sc_out sc_lv 8 signal 129 } 
	{ quantized_v_group_2_out_ap_vld sc_out sc_logic 1 outvld 129 } 
	{ quantized_v_group_1_out sc_out sc_lv 8 signal 130 } 
	{ quantized_v_group_1_out_ap_vld sc_out sc_logic 1 outvld 130 } 
	{ quantized_v_group_out sc_out sc_lv 8 signal 131 } 
	{ quantized_v_group_out_ap_vld sc_out sc_logic 1 outvld 131 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "v_raw_3433", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3433", "role": "default" }} , 
 	{ "name": "v_raw_3841", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3841", "role": "default" }} , 
 	{ "name": "v_raw_4249", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4249", "role": "default" }} , 
 	{ "name": "v_raw_4657", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4657", "role": "default" }} , 
 	{ "name": "v_raw_5063", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5063", "role": "default" }} , 
 	{ "name": "v_raw_5471", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5471", "role": "default" }} , 
 	{ "name": "v_raw_5879", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5879", "role": "default" }} , 
 	{ "name": "v_raw_6287", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6287", "role": "default" }} , 
 	{ "name": "conv3_i12_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv3_i12_i_i", "role": "default" }} , 
 	{ "name": "sh_prom_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sh_prom_i_i", "role": "default" }} , 
 	{ "name": "k_raw_3432", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3432", "role": "default" }} , 
 	{ "name": "k_raw_3840", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3840", "role": "default" }} , 
 	{ "name": "k_raw_4248", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4248", "role": "default" }} , 
 	{ "name": "k_raw_4656", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4656", "role": "default" }} , 
 	{ "name": "k_raw_5062", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5062", "role": "default" }} , 
 	{ "name": "k_raw_5470", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5470", "role": "default" }} , 
 	{ "name": "k_raw_5878", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5878", "role": "default" }} , 
 	{ "name": "k_raw_6286", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6286", "role": "default" }} , 
 	{ "name": "conv3_i12_i_i313", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "conv3_i12_i_i313", "role": "default" }} , 
 	{ "name": "sh_prom_i_i328", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "sh_prom_i_i328", "role": "default" }} , 
 	{ "name": "v_raw_3331", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3331", "role": "default" }} , 
 	{ "name": "v_raw_3739", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3739", "role": "default" }} , 
 	{ "name": "v_raw_4147", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4147", "role": "default" }} , 
 	{ "name": "v_raw_4555", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4555", "role": "default" }} , 
 	{ "name": "v_raw_4961", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4961", "role": "default" }} , 
 	{ "name": "v_raw_5369", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5369", "role": "default" }} , 
 	{ "name": "v_raw_5777", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5777", "role": "default" }} , 
 	{ "name": "v_raw_6185", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6185", "role": "default" }} , 
 	{ "name": "k_raw_3330", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3330", "role": "default" }} , 
 	{ "name": "k_raw_3738", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3738", "role": "default" }} , 
 	{ "name": "k_raw_4146", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4146", "role": "default" }} , 
 	{ "name": "k_raw_4554", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4554", "role": "default" }} , 
 	{ "name": "k_raw_4960", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4960", "role": "default" }} , 
 	{ "name": "k_raw_5368", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5368", "role": "default" }} , 
 	{ "name": "k_raw_5776", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5776", "role": "default" }} , 
 	{ "name": "k_raw_6184", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6184", "role": "default" }} , 
 	{ "name": "v_raw_3229", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3229", "role": "default" }} , 
 	{ "name": "v_raw_3637", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3637", "role": "default" }} , 
 	{ "name": "v_raw_4045", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4045", "role": "default" }} , 
 	{ "name": "v_raw_4453", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4453", "role": "default" }} , 
 	{ "name": "v_raw_4859", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4859", "role": "default" }} , 
 	{ "name": "v_raw_5267", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5267", "role": "default" }} , 
 	{ "name": "v_raw_5675", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5675", "role": "default" }} , 
 	{ "name": "v_raw_6083", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_6083", "role": "default" }} , 
 	{ "name": "k_raw_3228", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3228", "role": "default" }} , 
 	{ "name": "k_raw_3636", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3636", "role": "default" }} , 
 	{ "name": "k_raw_4044", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4044", "role": "default" }} , 
 	{ "name": "k_raw_4452", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4452", "role": "default" }} , 
 	{ "name": "k_raw_4858", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4858", "role": "default" }} , 
 	{ "name": "k_raw_5266", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5266", "role": "default" }} , 
 	{ "name": "k_raw_5674", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5674", "role": "default" }} , 
 	{ "name": "k_raw_6082", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_6082", "role": "default" }} , 
 	{ "name": "empty_609", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_609", "role": "default" }} , 
 	{ "name": "v_raw_3535", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3535", "role": "default" }} , 
 	{ "name": "v_raw_3943", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_3943", "role": "default" }} , 
 	{ "name": "v_raw_4351", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_4351", "role": "default" }} , 
 	{ "name": "empty_610", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_610", "role": "default" }} , 
 	{ "name": "v_raw_5165", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5165", "role": "default" }} , 
 	{ "name": "v_raw_5573", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5573", "role": "default" }} , 
 	{ "name": "v_raw_5981", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "v_raw_5981", "role": "default" }} , 
 	{ "name": "empty_611", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty_611", "role": "default" }} , 
 	{ "name": "k_raw_3534", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3534", "role": "default" }} , 
 	{ "name": "k_raw_3942", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_3942", "role": "default" }} , 
 	{ "name": "k_raw_4350", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_4350", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "k_raw_5164", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5164", "role": "default" }} , 
 	{ "name": "k_raw_5572", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5572", "role": "default" }} , 
 	{ "name": "k_raw_5980", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k_raw_5980", "role": "default" }} , 
 	{ "name": "quantized_k_group_31_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_31_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_31_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_31_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_30_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_30_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_30_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_30_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_29_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_29_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_29_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_29_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_28_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_28_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_28_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_28_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_27_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_27_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_27_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_27_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_26_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_26_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_26_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_26_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_25_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_25_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_25_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_25_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_24_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_24_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_24_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_24_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_23_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_23_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_23_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_23_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_22_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_22_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_22_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_22_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_21_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_21_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_21_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_21_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_20_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_20_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_20_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_20_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_19_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_19_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_19_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_19_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_18_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_18_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_18_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_18_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_17_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_17_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_17_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_17_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_16_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_16_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_16_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_16_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_15_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_15_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_15_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_15_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_14_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_14_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_13_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_13_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_13_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_13_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_12_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_12_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_12_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_12_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_11_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_11_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_11_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_11_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_10_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_10_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_10_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_10_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_9_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_9_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_8_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_8_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_7_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_7_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_7_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_7_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_6_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_6_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_6_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_6_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_5_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_5_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_5_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_5_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_4_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_4_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_3_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_3_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_2_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_2_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_1_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_1_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_k_group_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_k_group_out", "role": "default" }} , 
 	{ "name": "quantized_k_group_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_k_group_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_31_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_31_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_31_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_31_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_30_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_30_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_30_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_30_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_29_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_29_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_29_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_29_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_28_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_28_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_28_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_28_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_27_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_27_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_27_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_27_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_26_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_26_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_26_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_26_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_25_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_25_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_25_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_25_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_24_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_24_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_24_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_24_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_23_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_23_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_23_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_23_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_22_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_22_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_22_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_22_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_21_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_21_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_21_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_21_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_20_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_20_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_20_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_20_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_19_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_19_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_19_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_19_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_18_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_18_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_18_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_18_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_17_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_17_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_17_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_17_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_16_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_16_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_16_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_16_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_15_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_15_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_15_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_15_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_14_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_14_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_14_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_14_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_13_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_13_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_13_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_13_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_12_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_12_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_12_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_12_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_11_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_11_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_11_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_11_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_10_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_10_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_10_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_10_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_9_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_9_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_8_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_8_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_8_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_8_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_7_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_7_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_7_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_7_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_6_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_6_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_6_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_6_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_5_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_5_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_5_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_5_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_4_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_4_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_4_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_4_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_3_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_3_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_3_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_3_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_2_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_2_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_1_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_1_out", "role": "ap_vld" }} , 
 	{ "name": "quantized_v_group_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "quantized_v_group_out", "role": "default" }} , 
 	{ "name": "quantized_v_group_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "quantized_v_group_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
		"CDFG" : "swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop",
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
			{"Name" : "v_raw_3433", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3841", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4249", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4657", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5063", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5471", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5879", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6287", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3432", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3840", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4248", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4656", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5062", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5470", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5878", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6286", "Type" : "None", "Direction" : "I"},
			{"Name" : "conv3_i12_i_i313", "Type" : "None", "Direction" : "I"},
			{"Name" : "sh_prom_i_i328", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3331", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3739", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4147", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4555", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4961", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5369", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5777", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6185", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3330", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3738", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4146", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4554", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4960", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5368", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5776", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6184", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3229", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3637", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4045", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4453", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4859", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5267", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5675", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_6083", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3228", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3636", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4044", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4452", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4858", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5266", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5674", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_6082", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_609", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3535", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_3943", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_4351", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_610", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5165", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5573", "Type" : "None", "Direction" : "I"},
			{"Name" : "v_raw_5981", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty_611", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3534", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_3942", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_4350", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5164", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5572", "Type" : "None", "Direction" : "I"},
			{"Name" : "k_raw_5980", "Type" : "None", "Direction" : "I"},
			{"Name" : "quantized_k_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_k_group_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_21_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_10_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "quantized_v_group_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "quantize_kv_group_block_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U197", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U198", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U199", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U200", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U201", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U202", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U203", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_17_3_32_1_1_U204", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	swiftkv_quantize_kv_record_Pipeline_quantize_kv_group_block_loop {
		v_raw_3433 {Type I LastRead 0 FirstWrite -1}
		v_raw_3841 {Type I LastRead 0 FirstWrite -1}
		v_raw_4249 {Type I LastRead 0 FirstWrite -1}
		v_raw_4657 {Type I LastRead 0 FirstWrite -1}
		v_raw_5063 {Type I LastRead 0 FirstWrite -1}
		v_raw_5471 {Type I LastRead 0 FirstWrite -1}
		v_raw_5879 {Type I LastRead 0 FirstWrite -1}
		v_raw_6287 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i {Type I LastRead 0 FirstWrite -1}
		k_raw_3432 {Type I LastRead 0 FirstWrite -1}
		k_raw_3840 {Type I LastRead 0 FirstWrite -1}
		k_raw_4248 {Type I LastRead 0 FirstWrite -1}
		k_raw_4656 {Type I LastRead 0 FirstWrite -1}
		k_raw_5062 {Type I LastRead 0 FirstWrite -1}
		k_raw_5470 {Type I LastRead 0 FirstWrite -1}
		k_raw_5878 {Type I LastRead 0 FirstWrite -1}
		k_raw_6286 {Type I LastRead 0 FirstWrite -1}
		conv3_i12_i_i313 {Type I LastRead 0 FirstWrite -1}
		sh_prom_i_i328 {Type I LastRead 0 FirstWrite -1}
		v_raw_3331 {Type I LastRead 0 FirstWrite -1}
		v_raw_3739 {Type I LastRead 0 FirstWrite -1}
		v_raw_4147 {Type I LastRead 0 FirstWrite -1}
		v_raw_4555 {Type I LastRead 0 FirstWrite -1}
		v_raw_4961 {Type I LastRead 0 FirstWrite -1}
		v_raw_5369 {Type I LastRead 0 FirstWrite -1}
		v_raw_5777 {Type I LastRead 0 FirstWrite -1}
		v_raw_6185 {Type I LastRead 0 FirstWrite -1}
		k_raw_3330 {Type I LastRead 0 FirstWrite -1}
		k_raw_3738 {Type I LastRead 0 FirstWrite -1}
		k_raw_4146 {Type I LastRead 0 FirstWrite -1}
		k_raw_4554 {Type I LastRead 0 FirstWrite -1}
		k_raw_4960 {Type I LastRead 0 FirstWrite -1}
		k_raw_5368 {Type I LastRead 0 FirstWrite -1}
		k_raw_5776 {Type I LastRead 0 FirstWrite -1}
		k_raw_6184 {Type I LastRead 0 FirstWrite -1}
		v_raw_3229 {Type I LastRead 0 FirstWrite -1}
		v_raw_3637 {Type I LastRead 0 FirstWrite -1}
		v_raw_4045 {Type I LastRead 0 FirstWrite -1}
		v_raw_4453 {Type I LastRead 0 FirstWrite -1}
		v_raw_4859 {Type I LastRead 0 FirstWrite -1}
		v_raw_5267 {Type I LastRead 0 FirstWrite -1}
		v_raw_5675 {Type I LastRead 0 FirstWrite -1}
		v_raw_6083 {Type I LastRead 0 FirstWrite -1}
		k_raw_3228 {Type I LastRead 0 FirstWrite -1}
		k_raw_3636 {Type I LastRead 0 FirstWrite -1}
		k_raw_4044 {Type I LastRead 0 FirstWrite -1}
		k_raw_4452 {Type I LastRead 0 FirstWrite -1}
		k_raw_4858 {Type I LastRead 0 FirstWrite -1}
		k_raw_5266 {Type I LastRead 0 FirstWrite -1}
		k_raw_5674 {Type I LastRead 0 FirstWrite -1}
		k_raw_6082 {Type I LastRead 0 FirstWrite -1}
		empty_609 {Type I LastRead 0 FirstWrite -1}
		v_raw_3535 {Type I LastRead 0 FirstWrite -1}
		v_raw_3943 {Type I LastRead 0 FirstWrite -1}
		v_raw_4351 {Type I LastRead 0 FirstWrite -1}
		empty_610 {Type I LastRead 0 FirstWrite -1}
		v_raw_5165 {Type I LastRead 0 FirstWrite -1}
		v_raw_5573 {Type I LastRead 0 FirstWrite -1}
		v_raw_5981 {Type I LastRead 0 FirstWrite -1}
		empty_611 {Type I LastRead 0 FirstWrite -1}
		k_raw_3534 {Type I LastRead 0 FirstWrite -1}
		k_raw_3942 {Type I LastRead 0 FirstWrite -1}
		k_raw_4350 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		k_raw_5164 {Type I LastRead 0 FirstWrite -1}
		k_raw_5572 {Type I LastRead 0 FirstWrite -1}
		k_raw_5980 {Type I LastRead 0 FirstWrite -1}
		quantized_k_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_k_group_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_31_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_30_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_29_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_28_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_27_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_26_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_25_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_24_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_23_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_22_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_21_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_20_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_19_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_18_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_17_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_16_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_15_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_14_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_13_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_12_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_11_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_10_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_9_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_8_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_7_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_6_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_5_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_4_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_3_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_2_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_1_out {Type O LastRead -1 FirstWrite 1}
		quantized_v_group_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	v_raw_3433 { ap_none {  { v_raw_3433 in_data 0 32 } } }
	v_raw_3841 { ap_none {  { v_raw_3841 in_data 0 32 } } }
	v_raw_4249 { ap_none {  { v_raw_4249 in_data 0 32 } } }
	v_raw_4657 { ap_none {  { v_raw_4657 in_data 0 32 } } }
	v_raw_5063 { ap_none {  { v_raw_5063 in_data 0 32 } } }
	v_raw_5471 { ap_none {  { v_raw_5471 in_data 0 32 } } }
	v_raw_5879 { ap_none {  { v_raw_5879 in_data 0 32 } } }
	v_raw_6287 { ap_none {  { v_raw_6287 in_data 0 32 } } }
	conv3_i12_i_i { ap_none {  { conv3_i12_i_i in_data 0 32 } } }
	sh_prom_i_i { ap_none {  { sh_prom_i_i in_data 0 5 } } }
	k_raw_3432 { ap_none {  { k_raw_3432 in_data 0 32 } } }
	k_raw_3840 { ap_none {  { k_raw_3840 in_data 0 32 } } }
	k_raw_4248 { ap_none {  { k_raw_4248 in_data 0 32 } } }
	k_raw_4656 { ap_none {  { k_raw_4656 in_data 0 32 } } }
	k_raw_5062 { ap_none {  { k_raw_5062 in_data 0 32 } } }
	k_raw_5470 { ap_none {  { k_raw_5470 in_data 0 32 } } }
	k_raw_5878 { ap_none {  { k_raw_5878 in_data 0 32 } } }
	k_raw_6286 { ap_none {  { k_raw_6286 in_data 0 32 } } }
	conv3_i12_i_i313 { ap_none {  { conv3_i12_i_i313 in_data 0 32 } } }
	sh_prom_i_i328 { ap_none {  { sh_prom_i_i328 in_data 0 5 } } }
	v_raw_3331 { ap_none {  { v_raw_3331 in_data 0 32 } } }
	v_raw_3739 { ap_none {  { v_raw_3739 in_data 0 32 } } }
	v_raw_4147 { ap_none {  { v_raw_4147 in_data 0 32 } } }
	v_raw_4555 { ap_none {  { v_raw_4555 in_data 0 32 } } }
	v_raw_4961 { ap_none {  { v_raw_4961 in_data 0 32 } } }
	v_raw_5369 { ap_none {  { v_raw_5369 in_data 0 32 } } }
	v_raw_5777 { ap_none {  { v_raw_5777 in_data 0 32 } } }
	v_raw_6185 { ap_none {  { v_raw_6185 in_data 0 32 } } }
	k_raw_3330 { ap_none {  { k_raw_3330 in_data 0 32 } } }
	k_raw_3738 { ap_none {  { k_raw_3738 in_data 0 32 } } }
	k_raw_4146 { ap_none {  { k_raw_4146 in_data 0 32 } } }
	k_raw_4554 { ap_none {  { k_raw_4554 in_data 0 32 } } }
	k_raw_4960 { ap_none {  { k_raw_4960 in_data 0 32 } } }
	k_raw_5368 { ap_none {  { k_raw_5368 in_data 0 32 } } }
	k_raw_5776 { ap_none {  { k_raw_5776 in_data 0 32 } } }
	k_raw_6184 { ap_none {  { k_raw_6184 in_data 0 32 } } }
	v_raw_3229 { ap_none {  { v_raw_3229 in_data 0 32 } } }
	v_raw_3637 { ap_none {  { v_raw_3637 in_data 0 32 } } }
	v_raw_4045 { ap_none {  { v_raw_4045 in_data 0 32 } } }
	v_raw_4453 { ap_none {  { v_raw_4453 in_data 0 32 } } }
	v_raw_4859 { ap_none {  { v_raw_4859 in_data 0 32 } } }
	v_raw_5267 { ap_none {  { v_raw_5267 in_data 0 32 } } }
	v_raw_5675 { ap_none {  { v_raw_5675 in_data 0 32 } } }
	v_raw_6083 { ap_none {  { v_raw_6083 in_data 0 32 } } }
	k_raw_3228 { ap_none {  { k_raw_3228 in_data 0 32 } } }
	k_raw_3636 { ap_none {  { k_raw_3636 in_data 0 32 } } }
	k_raw_4044 { ap_none {  { k_raw_4044 in_data 0 32 } } }
	k_raw_4452 { ap_none {  { k_raw_4452 in_data 0 32 } } }
	k_raw_4858 { ap_none {  { k_raw_4858 in_data 0 32 } } }
	k_raw_5266 { ap_none {  { k_raw_5266 in_data 0 32 } } }
	k_raw_5674 { ap_none {  { k_raw_5674 in_data 0 32 } } }
	k_raw_6082 { ap_none {  { k_raw_6082 in_data 0 32 } } }
	empty_609 { ap_none {  { empty_609 in_data 0 32 } } }
	v_raw_3535 { ap_none {  { v_raw_3535 in_data 0 32 } } }
	v_raw_3943 { ap_none {  { v_raw_3943 in_data 0 32 } } }
	v_raw_4351 { ap_none {  { v_raw_4351 in_data 0 32 } } }
	empty_610 { ap_none {  { empty_610 in_data 0 32 } } }
	v_raw_5165 { ap_none {  { v_raw_5165 in_data 0 32 } } }
	v_raw_5573 { ap_none {  { v_raw_5573 in_data 0 32 } } }
	v_raw_5981 { ap_none {  { v_raw_5981 in_data 0 32 } } }
	empty_611 { ap_none {  { empty_611 in_data 0 32 } } }
	k_raw_3534 { ap_none {  { k_raw_3534 in_data 0 32 } } }
	k_raw_3942 { ap_none {  { k_raw_3942 in_data 0 32 } } }
	k_raw_4350 { ap_none {  { k_raw_4350 in_data 0 32 } } }
	empty { ap_none {  { empty in_data 0 32 } } }
	k_raw_5164 { ap_none {  { k_raw_5164 in_data 0 32 } } }
	k_raw_5572 { ap_none {  { k_raw_5572 in_data 0 32 } } }
	k_raw_5980 { ap_none {  { k_raw_5980 in_data 0 32 } } }
	quantized_k_group_31_out { ap_vld {  { quantized_k_group_31_out out_data 1 8 }  { quantized_k_group_31_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_30_out { ap_vld {  { quantized_k_group_30_out out_data 1 8 }  { quantized_k_group_30_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_29_out { ap_vld {  { quantized_k_group_29_out out_data 1 8 }  { quantized_k_group_29_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_28_out { ap_vld {  { quantized_k_group_28_out out_data 1 8 }  { quantized_k_group_28_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_27_out { ap_vld {  { quantized_k_group_27_out out_data 1 8 }  { quantized_k_group_27_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_26_out { ap_vld {  { quantized_k_group_26_out out_data 1 8 }  { quantized_k_group_26_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_25_out { ap_vld {  { quantized_k_group_25_out out_data 1 8 }  { quantized_k_group_25_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_24_out { ap_vld {  { quantized_k_group_24_out out_data 1 8 }  { quantized_k_group_24_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_23_out { ap_vld {  { quantized_k_group_23_out out_data 1 8 }  { quantized_k_group_23_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_22_out { ap_vld {  { quantized_k_group_22_out out_data 1 8 }  { quantized_k_group_22_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_21_out { ap_vld {  { quantized_k_group_21_out out_data 1 8 }  { quantized_k_group_21_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_20_out { ap_vld {  { quantized_k_group_20_out out_data 1 8 }  { quantized_k_group_20_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_19_out { ap_vld {  { quantized_k_group_19_out out_data 1 8 }  { quantized_k_group_19_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_18_out { ap_vld {  { quantized_k_group_18_out out_data 1 8 }  { quantized_k_group_18_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_17_out { ap_vld {  { quantized_k_group_17_out out_data 1 8 }  { quantized_k_group_17_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_16_out { ap_vld {  { quantized_k_group_16_out out_data 1 8 }  { quantized_k_group_16_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_15_out { ap_vld {  { quantized_k_group_15_out out_data 1 8 }  { quantized_k_group_15_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_14_out { ap_vld {  { quantized_k_group_14_out out_data 1 8 }  { quantized_k_group_14_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_13_out { ap_vld {  { quantized_k_group_13_out out_data 1 8 }  { quantized_k_group_13_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_12_out { ap_vld {  { quantized_k_group_12_out out_data 1 8 }  { quantized_k_group_12_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_11_out { ap_vld {  { quantized_k_group_11_out out_data 1 8 }  { quantized_k_group_11_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_10_out { ap_vld {  { quantized_k_group_10_out out_data 1 8 }  { quantized_k_group_10_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_9_out { ap_vld {  { quantized_k_group_9_out out_data 1 8 }  { quantized_k_group_9_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_8_out { ap_vld {  { quantized_k_group_8_out out_data 1 8 }  { quantized_k_group_8_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_7_out { ap_vld {  { quantized_k_group_7_out out_data 1 8 }  { quantized_k_group_7_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_6_out { ap_vld {  { quantized_k_group_6_out out_data 1 8 }  { quantized_k_group_6_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_5_out { ap_vld {  { quantized_k_group_5_out out_data 1 8 }  { quantized_k_group_5_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_4_out { ap_vld {  { quantized_k_group_4_out out_data 1 8 }  { quantized_k_group_4_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_3_out { ap_vld {  { quantized_k_group_3_out out_data 1 8 }  { quantized_k_group_3_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_2_out { ap_vld {  { quantized_k_group_2_out out_data 1 8 }  { quantized_k_group_2_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_1_out { ap_vld {  { quantized_k_group_1_out out_data 1 8 }  { quantized_k_group_1_out_ap_vld out_vld 1 1 } } }
	quantized_k_group_out { ap_vld {  { quantized_k_group_out out_data 1 8 }  { quantized_k_group_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_31_out { ap_vld {  { quantized_v_group_31_out out_data 1 8 }  { quantized_v_group_31_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_30_out { ap_vld {  { quantized_v_group_30_out out_data 1 8 }  { quantized_v_group_30_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_29_out { ap_vld {  { quantized_v_group_29_out out_data 1 8 }  { quantized_v_group_29_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_28_out { ap_vld {  { quantized_v_group_28_out out_data 1 8 }  { quantized_v_group_28_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_27_out { ap_vld {  { quantized_v_group_27_out out_data 1 8 }  { quantized_v_group_27_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_26_out { ap_vld {  { quantized_v_group_26_out out_data 1 8 }  { quantized_v_group_26_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_25_out { ap_vld {  { quantized_v_group_25_out out_data 1 8 }  { quantized_v_group_25_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_24_out { ap_vld {  { quantized_v_group_24_out out_data 1 8 }  { quantized_v_group_24_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_23_out { ap_vld {  { quantized_v_group_23_out out_data 1 8 }  { quantized_v_group_23_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_22_out { ap_vld {  { quantized_v_group_22_out out_data 1 8 }  { quantized_v_group_22_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_21_out { ap_vld {  { quantized_v_group_21_out out_data 1 8 }  { quantized_v_group_21_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_20_out { ap_vld {  { quantized_v_group_20_out out_data 1 8 }  { quantized_v_group_20_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_19_out { ap_vld {  { quantized_v_group_19_out out_data 1 8 }  { quantized_v_group_19_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_18_out { ap_vld {  { quantized_v_group_18_out out_data 1 8 }  { quantized_v_group_18_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_17_out { ap_vld {  { quantized_v_group_17_out out_data 1 8 }  { quantized_v_group_17_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_16_out { ap_vld {  { quantized_v_group_16_out out_data 1 8 }  { quantized_v_group_16_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_15_out { ap_vld {  { quantized_v_group_15_out out_data 1 8 }  { quantized_v_group_15_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_14_out { ap_vld {  { quantized_v_group_14_out out_data 1 8 }  { quantized_v_group_14_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_13_out { ap_vld {  { quantized_v_group_13_out out_data 1 8 }  { quantized_v_group_13_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_12_out { ap_vld {  { quantized_v_group_12_out out_data 1 8 }  { quantized_v_group_12_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_11_out { ap_vld {  { quantized_v_group_11_out out_data 1 8 }  { quantized_v_group_11_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_10_out { ap_vld {  { quantized_v_group_10_out out_data 1 8 }  { quantized_v_group_10_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_9_out { ap_vld {  { quantized_v_group_9_out out_data 1 8 }  { quantized_v_group_9_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_8_out { ap_vld {  { quantized_v_group_8_out out_data 1 8 }  { quantized_v_group_8_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_7_out { ap_vld {  { quantized_v_group_7_out out_data 1 8 }  { quantized_v_group_7_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_6_out { ap_vld {  { quantized_v_group_6_out out_data 1 8 }  { quantized_v_group_6_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_5_out { ap_vld {  { quantized_v_group_5_out out_data 1 8 }  { quantized_v_group_5_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_4_out { ap_vld {  { quantized_v_group_4_out out_data 1 8 }  { quantized_v_group_4_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_3_out { ap_vld {  { quantized_v_group_3_out out_data 1 8 }  { quantized_v_group_3_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_2_out { ap_vld {  { quantized_v_group_2_out out_data 1 8 }  { quantized_v_group_2_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_1_out { ap_vld {  { quantized_v_group_1_out out_data 1 8 }  { quantized_v_group_1_out_ap_vld out_vld 1 1 } } }
	quantized_v_group_out { ap_vld {  { quantized_v_group_out out_data 1 8 }  { quantized_v_group_out_ap_vld out_vld 1 1 } } }
}
