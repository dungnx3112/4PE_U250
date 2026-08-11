// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1__HH__
#define __int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1__HH__
#include "int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3 int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U;

    SC_CTOR(int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1):  int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U ("int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U") {
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.clk(clk);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.rst(reset);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.ce(ce);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.in0(din0);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.in1(din1);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.in2(din2);
        int4_decoder_token_controller_mac_muladd_27s_15s_44s_45_5_1_DSP48_3_U.dout(dout);

    }

};

#endif //
