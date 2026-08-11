// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of position
//        bit 11~0 - position[11:0] (Read/Write)
//        others   - reserved
// 0x14 : reserved
// 0x18 : Data signal of model_bank0
//        bit 31~0 - model_bank0[31:0] (Read/Write)
// 0x1c : Data signal of model_bank0
//        bit 31~0 - model_bank0[63:32] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of model_bank1
//        bit 31~0 - model_bank1[31:0] (Read/Write)
// 0x28 : Data signal of model_bank1
//        bit 31~0 - model_bank1[63:32] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of model_bank2
//        bit 31~0 - model_bank2[31:0] (Read/Write)
// 0x34 : Data signal of model_bank2
//        bit 31~0 - model_bank2[63:32] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of model_bank3
//        bit 31~0 - model_bank3[31:0] (Read/Write)
// 0x40 : Data signal of model_bank3
//        bit 31~0 - model_bank3[63:32] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of rope_lut_ddr
//        bit 31~0 - rope_lut_ddr[31:0] (Read/Write)
// 0x4c : Data signal of rope_lut_ddr
//        bit 31~0 - rope_lut_ddr[63:32] (Read/Write)
// 0x50 : reserved
// 0x54 : Data signal of residual_pe0
//        bit 31~0 - residual_pe0[31:0] (Read/Write)
// 0x58 : Data signal of residual_pe0
//        bit 31~0 - residual_pe0[63:32] (Read/Write)
// 0x5c : reserved
// 0x60 : Data signal of residual_pe1
//        bit 31~0 - residual_pe1[31:0] (Read/Write)
// 0x64 : Data signal of residual_pe1
//        bit 31~0 - residual_pe1[63:32] (Read/Write)
// 0x68 : reserved
// 0x6c : Data signal of residual_pe2
//        bit 31~0 - residual_pe2[31:0] (Read/Write)
// 0x70 : Data signal of residual_pe2
//        bit 31~0 - residual_pe2[63:32] (Read/Write)
// 0x74 : reserved
// 0x78 : Data signal of residual_pe3
//        bit 31~0 - residual_pe3[31:0] (Read/Write)
// 0x7c : Data signal of residual_pe3
//        bit 31~0 - residual_pe3[63:32] (Read/Write)
// 0x80 : reserved
// 0x84 : Data signal of logits_pe0
//        bit 31~0 - logits_pe0[31:0] (Read/Write)
// 0x88 : Data signal of logits_pe0
//        bit 31~0 - logits_pe0[63:32] (Read/Write)
// 0x8c : reserved
// 0x90 : Data signal of logits_pe1
//        bit 31~0 - logits_pe1[31:0] (Read/Write)
// 0x94 : Data signal of logits_pe1
//        bit 31~0 - logits_pe1[63:32] (Read/Write)
// 0x98 : reserved
// 0x9c : Data signal of logits_pe2
//        bit 31~0 - logits_pe2[31:0] (Read/Write)
// 0xa0 : Data signal of logits_pe2
//        bit 31~0 - logits_pe2[63:32] (Read/Write)
// 0xa4 : reserved
// 0xa8 : Data signal of logits_pe3
//        bit 31~0 - logits_pe3[31:0] (Read/Write)
// 0xac : Data signal of logits_pe3
//        bit 31~0 - logits_pe3[63:32] (Read/Write)
// 0xb0 : reserved
// 0xb4 : Data signal of kv_cache_pe0
//        bit 31~0 - kv_cache_pe0[31:0] (Read/Write)
// 0xb8 : Data signal of kv_cache_pe0
//        bit 31~0 - kv_cache_pe0[63:32] (Read/Write)
// 0xbc : reserved
// 0xc0 : Data signal of kv_cache_pe1
//        bit 31~0 - kv_cache_pe1[31:0] (Read/Write)
// 0xc4 : Data signal of kv_cache_pe1
//        bit 31~0 - kv_cache_pe1[63:32] (Read/Write)
// 0xc8 : reserved
// 0xcc : Data signal of kv_cache_pe2
//        bit 31~0 - kv_cache_pe2[31:0] (Read/Write)
// 0xd0 : Data signal of kv_cache_pe2
//        bit 31~0 - kv_cache_pe2[63:32] (Read/Write)
// 0xd4 : reserved
// 0xd8 : Data signal of kv_cache_pe3
//        bit 31~0 - kv_cache_pe3[31:0] (Read/Write)
// 0xdc : Data signal of kv_cache_pe3
//        bit 31~0 - kv_cache_pe3[63:32] (Read/Write)
// 0xe0 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL           0x00
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_GIE               0x04
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER               0x08
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ISR               0x0c
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_POSITION_DATA     0x10
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_POSITION_DATA     12
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK0_DATA  0x18
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_MODEL_BANK0_DATA  64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK1_DATA  0x24
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_MODEL_BANK1_DATA  64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK2_DATA  0x30
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_MODEL_BANK2_DATA  64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK3_DATA  0x3c
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_MODEL_BANK3_DATA  64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ROPE_LUT_DDR_DATA 0x48
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_ROPE_LUT_DDR_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE0_DATA 0x54
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_RESIDUAL_PE0_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE1_DATA 0x60
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_RESIDUAL_PE1_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE2_DATA 0x6c
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_RESIDUAL_PE2_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE3_DATA 0x78
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_RESIDUAL_PE3_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE0_DATA   0x84
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_LOGITS_PE0_DATA   64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE1_DATA   0x90
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_LOGITS_PE1_DATA   64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE2_DATA   0x9c
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_LOGITS_PE2_DATA   64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE3_DATA   0xa8
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_LOGITS_PE3_DATA   64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE0_DATA 0xb4
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_KV_CACHE_PE0_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE1_DATA 0xc0
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_KV_CACHE_PE1_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE2_DATA 0xcc
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_KV_CACHE_PE2_DATA 64
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE3_DATA 0xd8
#define XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_BITS_KV_CACHE_PE3_DATA 64

