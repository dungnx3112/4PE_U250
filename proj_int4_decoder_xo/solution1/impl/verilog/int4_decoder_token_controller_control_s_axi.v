// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module int4_decoder_token_controller_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [11:0]                   position,
    output wire [63:0]                   model_bank0,
    output wire [63:0]                   model_bank1,
    output wire [63:0]                   model_bank2,
    output wire [63:0]                   model_bank3,
    output wire [63:0]                   rope_lut_ddr,
    output wire [63:0]                   residual_pe0,
    output wire [63:0]                   residual_pe1,
    output wire [63:0]                   residual_pe2,
    output wire [63:0]                   residual_pe3,
    output wire [63:0]                   logits_pe0,
    output wire [63:0]                   logits_pe1,
    output wire [63:0]                   logits_pe2,
    output wire [63:0]                   logits_pe3,
    output wire [63:0]                   kv_cache_pe0,
    output wire [63:0]                   kv_cache_pe1,
    output wire [63:0]                   kv_cache_pe2,
    output wire [63:0]                   kv_cache_pe3,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    output wire                          ap_continue,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_chain
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL             = 8'h00,
    ADDR_GIE                 = 8'h04,
    ADDR_IER                 = 8'h08,
    ADDR_ISR                 = 8'h0c,
    ADDR_POSITION_DATA_0     = 8'h10,
    ADDR_POSITION_CTRL       = 8'h14,
    ADDR_MODEL_BANK0_DATA_0  = 8'h18,
    ADDR_MODEL_BANK0_DATA_1  = 8'h1c,
    ADDR_MODEL_BANK0_CTRL    = 8'h20,
    ADDR_MODEL_BANK1_DATA_0  = 8'h24,
    ADDR_MODEL_BANK1_DATA_1  = 8'h28,
    ADDR_MODEL_BANK1_CTRL    = 8'h2c,
    ADDR_MODEL_BANK2_DATA_0  = 8'h30,
    ADDR_MODEL_BANK2_DATA_1  = 8'h34,
    ADDR_MODEL_BANK2_CTRL    = 8'h38,
    ADDR_MODEL_BANK3_DATA_0  = 8'h3c,
    ADDR_MODEL_BANK3_DATA_1  = 8'h40,
    ADDR_MODEL_BANK3_CTRL    = 8'h44,
    ADDR_ROPE_LUT_DDR_DATA_0 = 8'h48,
    ADDR_ROPE_LUT_DDR_DATA_1 = 8'h4c,
    ADDR_ROPE_LUT_DDR_CTRL   = 8'h50,
    ADDR_RESIDUAL_PE0_DATA_0 = 8'h54,
    ADDR_RESIDUAL_PE0_DATA_1 = 8'h58,
    ADDR_RESIDUAL_PE0_CTRL   = 8'h5c,
    ADDR_RESIDUAL_PE1_DATA_0 = 8'h60,
    ADDR_RESIDUAL_PE1_DATA_1 = 8'h64,
    ADDR_RESIDUAL_PE1_CTRL   = 8'h68,
    ADDR_RESIDUAL_PE2_DATA_0 = 8'h6c,
    ADDR_RESIDUAL_PE2_DATA_1 = 8'h70,
    ADDR_RESIDUAL_PE2_CTRL   = 8'h74,
    ADDR_RESIDUAL_PE3_DATA_0 = 8'h78,
    ADDR_RESIDUAL_PE3_DATA_1 = 8'h7c,
    ADDR_RESIDUAL_PE3_CTRL   = 8'h80,
    ADDR_LOGITS_PE0_DATA_0   = 8'h84,
    ADDR_LOGITS_PE0_DATA_1   = 8'h88,
    ADDR_LOGITS_PE0_CTRL     = 8'h8c,
    ADDR_LOGITS_PE1_DATA_0   = 8'h90,
    ADDR_LOGITS_PE1_DATA_1   = 8'h94,
    ADDR_LOGITS_PE1_CTRL     = 8'h98,
    ADDR_LOGITS_PE2_DATA_0   = 8'h9c,
    ADDR_LOGITS_PE2_DATA_1   = 8'ha0,
    ADDR_LOGITS_PE2_CTRL     = 8'ha4,
    ADDR_LOGITS_PE3_DATA_0   = 8'ha8,
    ADDR_LOGITS_PE3_DATA_1   = 8'hac,
    ADDR_LOGITS_PE3_CTRL     = 8'hb0,
    ADDR_KV_CACHE_PE0_DATA_0 = 8'hb4,
    ADDR_KV_CACHE_PE0_DATA_1 = 8'hb8,
    ADDR_KV_CACHE_PE0_CTRL   = 8'hbc,
    ADDR_KV_CACHE_PE1_DATA_0 = 8'hc0,
    ADDR_KV_CACHE_PE1_DATA_1 = 8'hc4,
    ADDR_KV_CACHE_PE1_CTRL   = 8'hc8,
    ADDR_KV_CACHE_PE2_DATA_0 = 8'hcc,
    ADDR_KV_CACHE_PE2_DATA_1 = 8'hd0,
    ADDR_KV_CACHE_PE2_CTRL   = 8'hd4,
    ADDR_KV_CACHE_PE3_DATA_0 = 8'hd8,
    ADDR_KV_CACHE_PE3_DATA_1 = 8'hdc,
    ADDR_KV_CACHE_PE3_CTRL   = 8'he0,
    WRIDLE                   = 2'd0,
    WRDATA                   = 2'd1,
    WRRESP                   = 2'd2,
    WRRESET                  = 2'd3,
    RDIDLE                   = 2'd0,
    RDDATA                   = 2'd1,
    RDRESET                  = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_continue;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    reg                           auto_restart_done = 1'b0;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [11:0]                   int_position = 'b0;
    reg  [63:0]                   int_model_bank0 = 'b0;
    reg  [63:0]                   int_model_bank1 = 'b0;
    reg  [63:0]                   int_model_bank2 = 'b0;
    reg  [63:0]                   int_model_bank3 = 'b0;
    reg  [63:0]                   int_rope_lut_ddr = 'b0;
    reg  [63:0]                   int_residual_pe0 = 'b0;
    reg  [63:0]                   int_residual_pe1 = 'b0;
    reg  [63:0]                   int_residual_pe2 = 'b0;
    reg  [63:0]                   int_residual_pe3 = 'b0;
    reg  [63:0]                   int_logits_pe0 = 'b0;
    reg  [63:0]                   int_logits_pe1 = 'b0;
    reg  [63:0]                   int_logits_pe2 = 'b0;
    reg  [63:0]                   int_logits_pe3 = 'b0;
    reg  [63:0]                   int_kv_cache_pe0 = 'b0;
    reg  [63:0]                   int_kv_cache_pe1 = 'b0;
    reg  [63:0]                   int_kv_cache_pe2 = 'b0;
    reg  [63:0]                   int_kv_cache_pe3 = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[4] <= int_ap_continue;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_POSITION_DATA_0: begin
                    rdata <= int_position[11:0];
                end
                ADDR_MODEL_BANK0_DATA_0: begin
                    rdata <= int_model_bank0[31:0];
                end
                ADDR_MODEL_BANK0_DATA_1: begin
                    rdata <= int_model_bank0[63:32];
                end
                ADDR_MODEL_BANK1_DATA_0: begin
                    rdata <= int_model_bank1[31:0];
                end
                ADDR_MODEL_BANK1_DATA_1: begin
                    rdata <= int_model_bank1[63:32];
                end
                ADDR_MODEL_BANK2_DATA_0: begin
                    rdata <= int_model_bank2[31:0];
                end
                ADDR_MODEL_BANK2_DATA_1: begin
                    rdata <= int_model_bank2[63:32];
                end
                ADDR_MODEL_BANK3_DATA_0: begin
                    rdata <= int_model_bank3[31:0];
                end
                ADDR_MODEL_BANK3_DATA_1: begin
                    rdata <= int_model_bank3[63:32];
                end
                ADDR_ROPE_LUT_DDR_DATA_0: begin
                    rdata <= int_rope_lut_ddr[31:0];
                end
                ADDR_ROPE_LUT_DDR_DATA_1: begin
                    rdata <= int_rope_lut_ddr[63:32];
                end
                ADDR_RESIDUAL_PE0_DATA_0: begin
                    rdata <= int_residual_pe0[31:0];
                end
                ADDR_RESIDUAL_PE0_DATA_1: begin
                    rdata <= int_residual_pe0[63:32];
                end
                ADDR_RESIDUAL_PE1_DATA_0: begin
                    rdata <= int_residual_pe1[31:0];
                end
                ADDR_RESIDUAL_PE1_DATA_1: begin
                    rdata <= int_residual_pe1[63:32];
                end
                ADDR_RESIDUAL_PE2_DATA_0: begin
                    rdata <= int_residual_pe2[31:0];
                end
                ADDR_RESIDUAL_PE2_DATA_1: begin
                    rdata <= int_residual_pe2[63:32];
                end
                ADDR_RESIDUAL_PE3_DATA_0: begin
                    rdata <= int_residual_pe3[31:0];
                end
                ADDR_RESIDUAL_PE3_DATA_1: begin
                    rdata <= int_residual_pe3[63:32];
                end
                ADDR_LOGITS_PE0_DATA_0: begin
                    rdata <= int_logits_pe0[31:0];
                end
                ADDR_LOGITS_PE0_DATA_1: begin
                    rdata <= int_logits_pe0[63:32];
                end
                ADDR_LOGITS_PE1_DATA_0: begin
                    rdata <= int_logits_pe1[31:0];
                end
                ADDR_LOGITS_PE1_DATA_1: begin
                    rdata <= int_logits_pe1[63:32];
                end
                ADDR_LOGITS_PE2_DATA_0: begin
                    rdata <= int_logits_pe2[31:0];
                end
                ADDR_LOGITS_PE2_DATA_1: begin
                    rdata <= int_logits_pe2[63:32];
                end
                ADDR_LOGITS_PE3_DATA_0: begin
                    rdata <= int_logits_pe3[31:0];
                end
                ADDR_LOGITS_PE3_DATA_1: begin
                    rdata <= int_logits_pe3[63:32];
                end
                ADDR_KV_CACHE_PE0_DATA_0: begin
                    rdata <= int_kv_cache_pe0[31:0];
                end
                ADDR_KV_CACHE_PE0_DATA_1: begin
                    rdata <= int_kv_cache_pe0[63:32];
                end
                ADDR_KV_CACHE_PE1_DATA_0: begin
                    rdata <= int_kv_cache_pe1[31:0];
                end
                ADDR_KV_CACHE_PE1_DATA_1: begin
                    rdata <= int_kv_cache_pe1[63:32];
                end
                ADDR_KV_CACHE_PE2_DATA_0: begin
                    rdata <= int_kv_cache_pe2[31:0];
                end
                ADDR_KV_CACHE_PE2_DATA_1: begin
                    rdata <= int_kv_cache_pe2[63:32];
                end
                ADDR_KV_CACHE_PE3_DATA_0: begin
                    rdata <= int_kv_cache_pe3[31:0];
                end
                ADDR_KV_CACHE_PE3_DATA_1: begin
                    rdata <= int_kv_cache_pe3[63:32];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt     = int_interrupt;
assign ap_start      = int_ap_start;
assign task_ap_done  = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready = ap_ready && !int_auto_restart;
assign ap_continue   = int_ap_continue || auto_restart_status;
assign position      = int_position;
assign model_bank0   = int_model_bank0;
assign model_bank1   = int_model_bank1;
assign model_bank2   = int_model_bank2;
assign model_bank3   = int_model_bank3;
assign rope_lut_ddr  = int_rope_lut_ddr;
assign residual_pe0  = int_residual_pe0;
assign residual_pe1  = int_residual_pe1;
assign residual_pe2  = int_residual_pe2;
assign residual_pe3  = int_residual_pe3;
assign logits_pe0    = int_logits_pe0;
assign logits_pe1    = int_logits_pe1;
assign logits_pe2    = int_logits_pe2;
assign logits_pe3    = int_logits_pe3;
assign kv_cache_pe0  = int_kv_cache_pe0;
assign kv_cache_pe1  = int_kv_cache_pe1;
assign kv_cache_pe2  = int_kv_cache_pe2;
assign kv_cache_pe3  = int_kv_cache_pe3;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_task_ap_done <= task_ap_done && !int_ap_continue;
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_ap_continue
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_continue <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[4])
            int_ap_continue <= 1'b1;
        else
            int_ap_continue <= 1'b0; // self clear
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// auto_restart_done
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_done <= 1'b0;
    else if (ACLK_EN) begin
        if (auto_restart_status && (ap_idle && !int_ap_idle))
            auto_restart_done <= 1'b1;
        else if (int_ap_continue)
            auto_restart_done <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_position[11:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_position[11:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_POSITION_DATA_0)
            int_position[11:0] <= (WDATA[31:0] & wmask) | (int_position[11:0] & ~wmask);
    end
end

// int_model_bank0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK0_DATA_0)
            int_model_bank0[31:0] <= (WDATA[31:0] & wmask) | (int_model_bank0[31:0] & ~wmask);
    end
end

// int_model_bank0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK0_DATA_1)
            int_model_bank0[63:32] <= (WDATA[31:0] & wmask) | (int_model_bank0[63:32] & ~wmask);
    end
end

// int_model_bank1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK1_DATA_0)
            int_model_bank1[31:0] <= (WDATA[31:0] & wmask) | (int_model_bank1[31:0] & ~wmask);
    end
end

// int_model_bank1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK1_DATA_1)
            int_model_bank1[63:32] <= (WDATA[31:0] & wmask) | (int_model_bank1[63:32] & ~wmask);
    end
end

// int_model_bank2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK2_DATA_0)
            int_model_bank2[31:0] <= (WDATA[31:0] & wmask) | (int_model_bank2[31:0] & ~wmask);
    end
end

// int_model_bank2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK2_DATA_1)
            int_model_bank2[63:32] <= (WDATA[31:0] & wmask) | (int_model_bank2[63:32] & ~wmask);
    end
end

// int_model_bank3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK3_DATA_0)
            int_model_bank3[31:0] <= (WDATA[31:0] & wmask) | (int_model_bank3[31:0] & ~wmask);
    end
end

// int_model_bank3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_model_bank3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODEL_BANK3_DATA_1)
            int_model_bank3[63:32] <= (WDATA[31:0] & wmask) | (int_model_bank3[63:32] & ~wmask);
    end
end

// int_rope_lut_ddr[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rope_lut_ddr[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROPE_LUT_DDR_DATA_0)
            int_rope_lut_ddr[31:0] <= (WDATA[31:0] & wmask) | (int_rope_lut_ddr[31:0] & ~wmask);
    end
end

// int_rope_lut_ddr[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_rope_lut_ddr[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_ROPE_LUT_DDR_DATA_1)
            int_rope_lut_ddr[63:32] <= (WDATA[31:0] & wmask) | (int_rope_lut_ddr[63:32] & ~wmask);
    end
end

// int_residual_pe0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE0_DATA_0)
            int_residual_pe0[31:0] <= (WDATA[31:0] & wmask) | (int_residual_pe0[31:0] & ~wmask);
    end
end

// int_residual_pe0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE0_DATA_1)
            int_residual_pe0[63:32] <= (WDATA[31:0] & wmask) | (int_residual_pe0[63:32] & ~wmask);
    end
end

// int_residual_pe1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE1_DATA_0)
            int_residual_pe1[31:0] <= (WDATA[31:0] & wmask) | (int_residual_pe1[31:0] & ~wmask);
    end
end

// int_residual_pe1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE1_DATA_1)
            int_residual_pe1[63:32] <= (WDATA[31:0] & wmask) | (int_residual_pe1[63:32] & ~wmask);
    end
end

// int_residual_pe2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE2_DATA_0)
            int_residual_pe2[31:0] <= (WDATA[31:0] & wmask) | (int_residual_pe2[31:0] & ~wmask);
    end
end

// int_residual_pe2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE2_DATA_1)
            int_residual_pe2[63:32] <= (WDATA[31:0] & wmask) | (int_residual_pe2[63:32] & ~wmask);
    end
end

// int_residual_pe3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE3_DATA_0)
            int_residual_pe3[31:0] <= (WDATA[31:0] & wmask) | (int_residual_pe3[31:0] & ~wmask);
    end
end

// int_residual_pe3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_residual_pe3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RESIDUAL_PE3_DATA_1)
            int_residual_pe3[63:32] <= (WDATA[31:0] & wmask) | (int_residual_pe3[63:32] & ~wmask);
    end
end

// int_logits_pe0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE0_DATA_0)
            int_logits_pe0[31:0] <= (WDATA[31:0] & wmask) | (int_logits_pe0[31:0] & ~wmask);
    end
end

// int_logits_pe0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE0_DATA_1)
            int_logits_pe0[63:32] <= (WDATA[31:0] & wmask) | (int_logits_pe0[63:32] & ~wmask);
    end
end

// int_logits_pe1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE1_DATA_0)
            int_logits_pe1[31:0] <= (WDATA[31:0] & wmask) | (int_logits_pe1[31:0] & ~wmask);
    end
end

// int_logits_pe1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE1_DATA_1)
            int_logits_pe1[63:32] <= (WDATA[31:0] & wmask) | (int_logits_pe1[63:32] & ~wmask);
    end
end

// int_logits_pe2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE2_DATA_0)
            int_logits_pe2[31:0] <= (WDATA[31:0] & wmask) | (int_logits_pe2[31:0] & ~wmask);
    end
end

// int_logits_pe2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE2_DATA_1)
            int_logits_pe2[63:32] <= (WDATA[31:0] & wmask) | (int_logits_pe2[63:32] & ~wmask);
    end
end

// int_logits_pe3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE3_DATA_0)
            int_logits_pe3[31:0] <= (WDATA[31:0] & wmask) | (int_logits_pe3[31:0] & ~wmask);
    end
end

// int_logits_pe3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_logits_pe3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LOGITS_PE3_DATA_1)
            int_logits_pe3[63:32] <= (WDATA[31:0] & wmask) | (int_logits_pe3[63:32] & ~wmask);
    end
end

// int_kv_cache_pe0[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe0[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE0_DATA_0)
            int_kv_cache_pe0[31:0] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe0[31:0] & ~wmask);
    end
end

// int_kv_cache_pe0[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe0[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE0_DATA_1)
            int_kv_cache_pe0[63:32] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe0[63:32] & ~wmask);
    end
end

// int_kv_cache_pe1[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe1[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE1_DATA_0)
            int_kv_cache_pe1[31:0] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe1[31:0] & ~wmask);
    end
end

// int_kv_cache_pe1[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe1[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE1_DATA_1)
            int_kv_cache_pe1[63:32] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe1[63:32] & ~wmask);
    end
end

// int_kv_cache_pe2[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe2[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE2_DATA_0)
            int_kv_cache_pe2[31:0] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe2[31:0] & ~wmask);
    end
end

// int_kv_cache_pe2[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe2[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE2_DATA_1)
            int_kv_cache_pe2[63:32] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe2[63:32] & ~wmask);
    end
end

// int_kv_cache_pe3[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe3[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE3_DATA_0)
            int_kv_cache_pe3[31:0] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe3[31:0] & ~wmask);
    end
end

// int_kv_cache_pe3[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_kv_cache_pe3[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KV_CACHE_PE3_DATA_1)
            int_kv_cache_pe3[63:32] <= (WDATA[31:0] & wmask) | (int_kv_cache_pe3[63:32] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
