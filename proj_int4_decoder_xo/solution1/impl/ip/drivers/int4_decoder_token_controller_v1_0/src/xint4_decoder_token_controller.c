// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xint4_decoder_token_controller.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XInt4_decoder_token_controller_CfgInitialize(XInt4_decoder_token_controller *InstancePtr, XInt4_decoder_token_controller_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XInt4_decoder_token_controller_Start(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XInt4_decoder_token_controller_IsDone(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XInt4_decoder_token_controller_IsIdle(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XInt4_decoder_token_controller_IsReady(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XInt4_decoder_token_controller_Continue(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL) & 0x80;
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XInt4_decoder_token_controller_EnableAutoRestart(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XInt4_decoder_token_controller_DisableAutoRestart(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_AP_CTRL, 0);
}

void XInt4_decoder_token_controller_Set_position(XInt4_decoder_token_controller *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_POSITION_DATA, Data);
}

u32 XInt4_decoder_token_controller_Get_position(XInt4_decoder_token_controller *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_POSITION_DATA);
    return Data;
}

void XInt4_decoder_token_controller_Set_model_bank0(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK0_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK0_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_model_bank0(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK0_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK0_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_model_bank1(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK1_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK1_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_model_bank1(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK1_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK1_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_model_bank2(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK2_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK2_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_model_bank2(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK2_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK2_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_model_bank3(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK3_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK3_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_model_bank3(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK3_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_MODEL_BANK3_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_rope_lut_ddr(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ROPE_LUT_DDR_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ROPE_LUT_DDR_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_rope_lut_ddr(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ROPE_LUT_DDR_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ROPE_LUT_DDR_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_residual_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE0_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE0_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_residual_pe0(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE0_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE0_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_residual_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE1_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE1_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_residual_pe1(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE1_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE1_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_residual_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE2_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE2_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_residual_pe2(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE2_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE2_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_residual_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE3_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE3_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_residual_pe3(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE3_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_RESIDUAL_PE3_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_logits_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE0_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE0_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_logits_pe0(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE0_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE0_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_logits_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE1_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE1_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_logits_pe1(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE1_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE1_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_logits_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE2_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE2_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_logits_pe2(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE2_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE2_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_logits_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE3_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE3_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_logits_pe3(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE3_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_LOGITS_PE3_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_kv_cache_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE0_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE0_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_kv_cache_pe0(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE0_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE0_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_kv_cache_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE1_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE1_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_kv_cache_pe1(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE1_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE1_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_kv_cache_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE2_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE2_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_kv_cache_pe2(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE2_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE2_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_Set_kv_cache_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE3_DATA, (u32)(Data));
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE3_DATA + 4, (u32)(Data >> 32));
}

u64 XInt4_decoder_token_controller_Get_kv_cache_pe3(XInt4_decoder_token_controller *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE3_DATA);
    Data += (u64)XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_KV_CACHE_PE3_DATA + 4) << 32;
    return Data;
}

void XInt4_decoder_token_controller_InterruptGlobalEnable(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_GIE, 1);
}

void XInt4_decoder_token_controller_InterruptGlobalDisable(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_GIE, 0);
}

void XInt4_decoder_token_controller_InterruptEnable(XInt4_decoder_token_controller *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER);
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER, Register | Mask);
}

void XInt4_decoder_token_controller_InterruptDisable(XInt4_decoder_token_controller *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER);
    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER, Register & (~Mask));
}

void XInt4_decoder_token_controller_InterruptClear(XInt4_decoder_token_controller *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XInt4_decoder_token_controller_WriteReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ISR, Mask);
}

u32 XInt4_decoder_token_controller_InterruptGetEnabled(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_IER);
}

u32 XInt4_decoder_token_controller_InterruptGetStatus(XInt4_decoder_token_controller *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XInt4_decoder_token_controller_ReadReg(InstancePtr->Control_BaseAddress, XINT4_DECODER_TOKEN_CONTROLLER_CONTROL_ADDR_ISR);
}

