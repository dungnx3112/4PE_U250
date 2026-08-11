// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xint4_decoder_token_controller.h"

extern XInt4_decoder_token_controller_Config XInt4_decoder_token_controller_ConfigTable[];

#ifdef SDT
XInt4_decoder_token_controller_Config *XInt4_decoder_token_controller_LookupConfig(UINTPTR BaseAddress) {
	XInt4_decoder_token_controller_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XInt4_decoder_token_controller_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XInt4_decoder_token_controller_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XInt4_decoder_token_controller_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XInt4_decoder_token_controller_Initialize(XInt4_decoder_token_controller *InstancePtr, UINTPTR BaseAddress) {
	XInt4_decoder_token_controller_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XInt4_decoder_token_controller_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XInt4_decoder_token_controller_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XInt4_decoder_token_controller_Config *XInt4_decoder_token_controller_LookupConfig(u16 DeviceId) {
	XInt4_decoder_token_controller_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XINT4_DECODER_TOKEN_CONTROLLER_NUM_INSTANCES; Index++) {
		if (XInt4_decoder_token_controller_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XInt4_decoder_token_controller_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XInt4_decoder_token_controller_Initialize(XInt4_decoder_token_controller *InstancePtr, u16 DeviceId) {
	XInt4_decoder_token_controller_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XInt4_decoder_token_controller_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XInt4_decoder_token_controller_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

