// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1 ns / 1 ps

module int4_decoder_token_controller_mac_muladd_27s_15s_43s_44_5_1_DSP48_2(
    input clk,
    input rst,
    input ce,
    input  [27 - 1:0] in0,
    input  [15 - 1:0] in1,
    input  [43 - 1:0] in2,
    output [44 - 1:0]  dout);

wire signed [27 - 1:0]     a;
wire signed [18 - 1:0]     b;
wire signed [48 - 1:0]     c;
wire signed [45 - 1:0]     m;
wire signed [48 - 1:0]     p;
reg  signed [45 - 1:0]     m_reg;
reg  signed [27 - 1:0]     a_reg;
reg  signed [18 - 1:0]     b_reg;
reg  signed [48 - 1:0]     p_reg;
reg  signed [27 - 1:0]     a1_reg;
reg  signed [18 - 1:0]     b1_reg;
reg  signed [48 - 1:0]     c_reg;

assign a  = $signed(in0);
assign b  = $signed(in1);
assign c  = $signed(in2);

assign m  = a1_reg * b1_reg;
assign p  = m_reg + c_reg;

always @(posedge clk) begin
    if (ce) begin
        m_reg  <= m;
        a_reg  <= a;
        b_reg  <= b;
        p_reg  <= p;
        a1_reg <= a_reg;
        b1_reg <= b_reg;
        c_reg  <= c;
    end
end

assign dout = p_reg;

endmodule
`timescale 1 ns / 1 ps
module int4_decoder_token_controller_mac_muladd_27s_15s_43s_44_5_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    din2,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter din2_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
input[din2_WIDTH - 1:0] din2;
output[dout_WIDTH - 1:0] dout;



int4_decoder_token_controller_mac_muladd_27s_15s_43s_44_5_1_DSP48_2 int4_decoder_token_controller_mac_muladd_27s_15s_43s_44_5_1_DSP48_2_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .in0( din0 ),
    .in1( din1 ),
    .in2( din2 ),
    .dout( dout ));

endmodule

