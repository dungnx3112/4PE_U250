// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XINT4_DECODER_TOKEN_CONTROLLER_H
#define XINT4_DECODER_TOKEN_CONTROLLER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xint4_decoder_token_controller_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XInt4_decoder_token_controller_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XInt4_decoder_token_controller;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XInt4_decoder_token_controller_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XInt4_decoder_token_controller_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XInt4_decoder_token_controller_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XInt4_decoder_token_controller_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XInt4_decoder_token_controller_Initialize(XInt4_decoder_token_controller *InstancePtr, UINTPTR BaseAddress);
XInt4_decoder_token_controller_Config* XInt4_decoder_token_controller_LookupConfig(UINTPTR BaseAddress);
#else
int XInt4_decoder_token_controller_Initialize(XInt4_decoder_token_controller *InstancePtr, u16 DeviceId);
XInt4_decoder_token_controller_Config* XInt4_decoder_token_controller_LookupConfig(u16 DeviceId);
#endif
int XInt4_decoder_token_controller_CfgInitialize(XInt4_decoder_token_controller *InstancePtr, XInt4_decoder_token_controller_Config *ConfigPtr);
#else
int XInt4_decoder_token_controller_Initialize(XInt4_decoder_token_controller *InstancePtr, const char* InstanceName);
int XInt4_decoder_token_controller_Release(XInt4_decoder_token_controller *InstancePtr);
#endif

void XInt4_decoder_token_controller_Start(XInt4_decoder_token_controller *InstancePtr);
u32 XInt4_decoder_token_controller_IsDone(XInt4_decoder_token_controller *InstancePtr);
u32 XInt4_decoder_token_controller_IsIdle(XInt4_decoder_token_controller *InstancePtr);
u32 XInt4_decoder_token_controller_IsReady(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Continue(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_EnableAutoRestart(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_DisableAutoRestart(XInt4_decoder_token_controller *InstancePtr);

void XInt4_decoder_token_controller_Set_position(XInt4_decoder_token_controller *InstancePtr, u32 Data);
u32 XInt4_decoder_token_controller_Get_position(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_model_bank0(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_model_bank0(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_model_bank1(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_model_bank1(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_model_bank2(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_model_bank2(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_model_bank3(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_model_bank3(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_rope_lut_ddr(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_rope_lut_ddr(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_residual_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_residual_pe0(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_residual_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_residual_pe1(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_residual_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_residual_pe2(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_residual_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_residual_pe3(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_logits_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_logits_pe0(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_logits_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_logits_pe1(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_logits_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_logits_pe2(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_logits_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_logits_pe3(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_kv_cache_pe0(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_kv_cache_pe0(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_kv_cache_pe1(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_kv_cache_pe1(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_kv_cache_pe2(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_kv_cache_pe2(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_Set_kv_cache_pe3(XInt4_decoder_token_controller *InstancePtr, u64 Data);
u64 XInt4_decoder_token_controller_Get_kv_cache_pe3(XInt4_decoder_token_controller *InstancePtr);

void XInt4_decoder_token_controller_InterruptGlobalEnable(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_InterruptGlobalDisable(XInt4_decoder_token_controller *InstancePtr);
void XInt4_decoder_token_controller_InterruptEnable(XInt4_decoder_token_controller *InstancePtr, u32 Mask);
void XInt4_decoder_token_controller_InterruptDisable(XInt4_decoder_token_controller *InstancePtr, u32 Mask);
void XInt4_decoder_token_controller_InterruptClear(XInt4_decoder_token_controller *InstancePtr, u32 Mask);
u32 XInt4_decoder_token_controller_InterruptGetEnabled(XInt4_decoder_token_controller *InstancePtr);
u32 XInt4_decoder_token_controller_InterruptGetStatus(XInt4_decoder_token_controller *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
