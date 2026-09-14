// ============================================================================
// Top-Level Integration Wrapper for 4-PE INT4 Decoder Multi-Kernel
// Target: AMD Alveo U250 (xcu250-figd2104-2L-e) @ 270 MHz
// 
// Physical Placement:
//   SLR0: pe0_inst (int4_decoder_pe0_kernel) + DDR0 (gmem0)
//   SLR1: pe1_inst (int4_decoder_pe1_kernel) + DDR1 (gmem1)
//   SLR2: pe2_inst (int4_decoder_pe2_kernel) + DDR2 (gmem2)
//   SLR3: pe3_inst (int4_decoder_pe3_kernel) + DDR3 (gmem3)
// 
// Inter-SLR AXI4-Stream Links:
//   - 4 links SLR0 <-> SLR1
//   - 4 links SLR1 <-> SLR2
//   - 4 links SLR2 <-> SLR3
//   All ports feature register_mode=both (internal register slices on TVALID,
//   TDATA, and TREADY) to ensure timing closure across SLR boundaries.
// ============================================================================

`timescale 1 ns / 1 ps

module int4_decoder_multikernel_top (
    // Global Clock & Reset
    input  wire        ap_clk,
    input  wire        ap_rst_n,

    // Interrupts from each PE
    output wire        interrupt_pe0,
    output wire        interrupt_pe1,
    output wire        interrupt_pe2,
    output wire        interrupt_pe3,

    // ------------------------------------------------------------------------
    // AXI-Lite Control Interfaces (SLR0..3)
    // ------------------------------------------------------------------------
    // PE0 Control
    input  wire        s_axi_control_pe0_AWVALID,
    output wire        s_axi_control_pe0_AWREADY,
    input  wire [6:0]  s_axi_control_pe0_AWADDR,
    input  wire        s_axi_control_pe0_WVALID,
    output wire        s_axi_control_pe0_WREADY,
    input  wire [31:0] s_axi_control_pe0_WDATA,
    input  wire [3:0]  s_axi_control_pe0_WSTRB,
    input  wire        s_axi_control_pe0_ARVALID,
    output wire        s_axi_control_pe0_ARREADY,
    input  wire [6:0]  s_axi_control_pe0_ARADDR,
    output wire        s_axi_control_pe0_RVALID,
    input  wire        s_axi_control_pe0_RREADY,
    output wire [31:0] s_axi_control_pe0_RDATA,
    output wire [1:0]  s_axi_control_pe0_RRESP,
    output wire        s_axi_control_pe0_BVALID,
    input  wire        s_axi_control_pe0_BREADY,
    output wire [1:0]  s_axi_control_pe0_BRESP,

    // PE1 Control
    input  wire        s_axi_control_pe1_AWVALID,
    output wire        s_axi_control_pe1_AWREADY,
    input  wire [6:0]  s_axi_control_pe1_AWADDR,
    input  wire        s_axi_control_pe1_WVALID,
    output wire        s_axi_control_pe1_WREADY,
    input  wire [31:0] s_axi_control_pe1_WDATA,
    input  wire [3:0]  s_axi_control_pe1_WSTRB,
    input  wire        s_axi_control_pe1_ARVALID,
    output wire        s_axi_control_pe1_ARREADY,
    input  wire [6:0]  s_axi_control_pe1_ARADDR,
    output wire        s_axi_control_pe1_RVALID,
    input  wire        s_axi_control_pe1_RREADY,
    output wire [31:0] s_axi_control_pe1_RDATA,
    output wire [1:0]  s_axi_control_pe1_RRESP,
    output wire        s_axi_control_pe1_BVALID,
    input  wire        s_axi_control_pe1_BREADY,
    output wire [1:0]  s_axi_control_pe1_BRESP,

    // PE2 Control
    input  wire        s_axi_control_pe2_AWVALID,
    output wire        s_axi_control_pe2_AWREADY,
    input  wire [6:0]  s_axi_control_pe2_AWADDR,
    input  wire        s_axi_control_pe2_WVALID,
    output wire        s_axi_control_pe2_WREADY,
    input  wire [31:0] s_axi_control_pe2_WDATA,
    input  wire [3:0]  s_axi_control_pe2_WSTRB,
    input  wire        s_axi_control_pe2_ARVALID,
    output wire        s_axi_control_pe2_ARREADY,
    input  wire [6:0]  s_axi_control_pe2_ARADDR,
    output wire        s_axi_control_pe2_RVALID,
    input  wire        s_axi_control_pe2_RREADY,
    output wire [31:0] s_axi_control_pe2_RDATA,
    output wire [1:0]  s_axi_control_pe2_RRESP,
    output wire        s_axi_control_pe2_BVALID,
    input  wire        s_axi_control_pe2_BREADY,
    output wire [1:0]  s_axi_control_pe2_BRESP,

    // PE3 Control
    input  wire        s_axi_control_pe3_AWVALID,
    output wire        s_axi_control_pe3_AWREADY,
    input  wire [6:0]  s_axi_control_pe3_AWADDR,
    input  wire        s_axi_control_pe3_WVALID,
    output wire        s_axi_control_pe3_WREADY,
    input  wire [31:0] s_axi_control_pe3_WDATA,
    input  wire [3:0]  s_axi_control_pe3_WSTRB,
    input  wire        s_axi_control_pe3_ARVALID,
    output wire        s_axi_control_pe3_ARREADY,
    input  wire [6:0]  s_axi_control_pe3_ARADDR,
    output wire        s_axi_control_pe3_RVALID,
    input  wire        s_axi_control_pe3_RREADY,
    output wire [31:0] s_axi_control_pe3_RDATA,
    output wire [1:0]  s_axi_control_pe3_RRESP,
    output wire        s_axi_control_pe3_BVALID,
    input  wire        s_axi_control_pe3_BREADY,
    output wire [1:0]  s_axi_control_pe3_BRESP,

    // ------------------------------------------------------------------------
    // AXI Memory Master Interfaces (DDR0..3)
    // ------------------------------------------------------------------------
    // DDR0 (SLR0)
    output wire        m_axi_gmem0_AWVALID,
    input  wire        m_axi_gmem0_AWREADY,
    output wire [63:0] m_axi_gmem0_AWADDR,
    output wire [0:0]  m_axi_gmem0_AWID,
    output wire [7:0]  m_axi_gmem0_AWLEN,
    output wire [2:0]  m_axi_gmem0_AWSIZE,
    output wire [1:0]  m_axi_gmem0_AWBURST,
    output wire [1:0]  m_axi_gmem0_AWLOCK,
    output wire [3:0]  m_axi_gmem0_AWCACHE,
    output wire [2:0]  m_axi_gmem0_AWPROT,
    output wire [3:0]  m_axi_gmem0_AWQOS,
    output wire [3:0]  m_axi_gmem0_AWREGION,
    output wire [0:0]  m_axi_gmem0_AWUSER,
    output wire        m_axi_gmem0_WVALID,
    input  wire        m_axi_gmem0_WREADY,
    output wire [511:0] m_axi_gmem0_WDATA,
    output wire [63:0] m_axi_gmem0_WSTRB,
    output wire        m_axi_gmem0_WLAST,
    output wire [0:0]  m_axi_gmem0_WID,
    output wire [0:0]  m_axi_gmem0_WUSER,
    output wire        m_axi_gmem0_ARVALID,
    input  wire        m_axi_gmem0_ARREADY,
    output wire [63:0] m_axi_gmem0_ARADDR,
    output wire [0:0]  m_axi_gmem0_ARID,
    output wire [7:0]  m_axi_gmem0_ARLEN,
    output wire [2:0]  m_axi_gmem0_ARSIZE,
    output wire [1:0]  m_axi_gmem0_ARBURST,
    output wire [1:0]  m_axi_gmem0_ARLOCK,
    output wire [3:0]  m_axi_gmem0_ARCACHE,
    output wire [2:0]  m_axi_gmem0_ARPROT,
    output wire [3:0]  m_axi_gmem0_ARQOS,
    output wire [3:0]  m_axi_gmem0_ARREGION,
    output wire [0:0]  m_axi_gmem0_ARUSER,
    input  wire        m_axi_gmem0_RVALID,
    output wire        m_axi_gmem0_RREADY,
    input  wire [511:0] m_axi_gmem0_RDATA,
    input  wire        m_axi_gmem0_RLAST,
    input  wire [0:0]  m_axi_gmem0_RID,
    input  wire [0:0]  m_axi_gmem0_RUSER,
    input  wire [1:0]  m_axi_gmem0_RRESP,
    input  wire        m_axi_gmem0_BVALID,
    output wire        m_axi_gmem0_BREADY,
    input  wire [1:0]  m_axi_gmem0_BRESP,
    input  wire [0:0]  m_axi_gmem0_BID,
    input  wire [0:0]  m_axi_gmem0_BUSER,

    // DDR1 (SLR1)
    output wire        m_axi_gmem1_AWVALID,
    input  wire        m_axi_gmem1_AWREADY,
    output wire [63:0] m_axi_gmem1_AWADDR,
    output wire [0:0]  m_axi_gmem1_AWID,
    output wire [7:0]  m_axi_gmem1_AWLEN,
    output wire [2:0]  m_axi_gmem1_AWSIZE,
    output wire [1:0]  m_axi_gmem1_AWBURST,
    output wire [1:0]  m_axi_gmem1_AWLOCK,
    output wire [3:0]  m_axi_gmem1_AWCACHE,
    output wire [2:0]  m_axi_gmem1_AWPROT,
    output wire [3:0]  m_axi_gmem1_AWQOS,
    output wire [3:0]  m_axi_gmem1_AWREGION,
    output wire [0:0]  m_axi_gmem1_AWUSER,
    output wire        m_axi_gmem1_WVALID,
    input  wire        m_axi_gmem1_WREADY,
    output wire [511:0] m_axi_gmem1_WDATA,
    output wire [63:0] m_axi_gmem1_WSTRB,
    output wire        m_axi_gmem1_WLAST,
    output wire [0:0]  m_axi_gmem1_WID,
    output wire [0:0]  m_axi_gmem1_WUSER,
    output wire        m_axi_gmem1_ARVALID,
    input  wire        m_axi_gmem1_ARREADY,
    output wire [63:0] m_axi_gmem1_ARADDR,
    output wire [0:0]  m_axi_gmem1_ARID,
    output wire [7:0]  m_axi_gmem1_ARLEN,
    output wire [2:0]  m_axi_gmem1_ARSIZE,
    output wire [1:0]  m_axi_gmem1_ARBURST,
    output wire [1:0]  m_axi_gmem1_ARLOCK,
    output wire [3:0]  m_axi_gmem1_ARCACHE,
    output wire [2:0]  m_axi_gmem1_ARPROT,
    output wire [3:0]  m_axi_gmem1_ARQOS,
    output wire [3:0]  m_axi_gmem1_ARREGION,
    output wire [0:0]  m_axi_gmem1_ARUSER,
    input  wire        m_axi_gmem1_RVALID,
    output wire        m_axi_gmem1_RREADY,
    input  wire [511:0] m_axi_gmem1_RDATA,
    input  wire        m_axi_gmem1_RLAST,
    input  wire [0:0]  m_axi_gmem1_RID,
    input  wire [0:0]  m_axi_gmem1_RUSER,
    input  wire [1:0]  m_axi_gmem1_RRESP,
    input  wire        m_axi_gmem1_BVALID,
    output wire        m_axi_gmem1_BREADY,
    input  wire [1:0]  m_axi_gmem1_BRESP,
    input  wire [0:0]  m_axi_gmem1_BID,
    input  wire [0:0]  m_axi_gmem1_BUSER,

    // DDR2 (SLR2)
    output wire        m_axi_gmem2_AWVALID,
    input  wire        m_axi_gmem2_AWREADY,
    output wire [63:0] m_axi_gmem2_AWADDR,
    output wire [0:0]  m_axi_gmem2_AWID,
    output wire [7:0]  m_axi_gmem2_AWLEN,
    output wire [2:0]  m_axi_gmem2_AWSIZE,
    output wire [1:0]  m_axi_gmem2_AWBURST,
    output wire [1:0]  m_axi_gmem2_AWLOCK,
    output wire [3:0]  m_axi_gmem2_AWCACHE,
    output wire [2:0]  m_axi_gmem2_AWPROT,
    output wire [3:0]  m_axi_gmem2_AWQOS,
    output wire [3:0]  m_axi_gmem2_AWREGION,
    output wire [0:0]  m_axi_gmem2_AWUSER,
    output wire        m_axi_gmem2_WVALID,
    input  wire        m_axi_gmem2_WREADY,
    output wire [511:0] m_axi_gmem2_WDATA,
    output wire [63:0] m_axi_gmem2_WSTRB,
    output wire        m_axi_gmem2_WLAST,
    output wire [0:0]  m_axi_gmem2_WID,
    output wire [0:0]  m_axi_gmem2_WUSER,
    output wire        m_axi_gmem2_ARVALID,
    input  wire        m_axi_gmem2_ARREADY,
    output wire [63:0] m_axi_gmem2_ARADDR,
    output wire [0:0]  m_axi_gmem2_ARID,
    output wire [7:0]  m_axi_gmem2_ARLEN,
    output wire [2:0]  m_axi_gmem2_ARSIZE,
    output wire [1:0]  m_axi_gmem2_ARBURST,
    output wire [1:0]  m_axi_gmem2_ARLOCK,
    output wire [3:0]  m_axi_gmem2_ARCACHE,
    output wire [2:0]  m_axi_gmem2_ARPROT,
    output wire [3:0]  m_axi_gmem2_ARQOS,
    output wire [3:0]  m_axi_gmem2_ARREGION,
    output wire [0:0]  m_axi_gmem2_ARUSER,
    input  wire        m_axi_gmem2_RVALID,
    output wire        m_axi_gmem2_RREADY,
    input  wire [511:0] m_axi_gmem2_RDATA,
    input  wire        m_axi_gmem2_RLAST,
    input  wire [0:0]  m_axi_gmem2_RID,
    input  wire [0:0]  m_axi_gmem2_RUSER,
    input  wire [1:0]  m_axi_gmem2_RRESP,
    input  wire        m_axi_gmem2_BVALID,
    output wire        m_axi_gmem2_BREADY,
    input  wire [1:0]  m_axi_gmem2_BRESP,
    input  wire [0:0]  m_axi_gmem2_BID,
    input  wire [0:0]  m_axi_gmem2_BUSER,

    // DDR3 (SLR3)
    output wire        m_axi_gmem3_AWVALID,
    input  wire        m_axi_gmem3_AWREADY,
    output wire [63:0] m_axi_gmem3_AWADDR,
    output wire [0:0]  m_axi_gmem3_AWID,
    output wire [7:0]  m_axi_gmem3_AWLEN,
    output wire [2:0]  m_axi_gmem3_AWSIZE,
    output wire [1:0]  m_axi_gmem3_AWBURST,
    output wire [1:0]  m_axi_gmem3_AWLOCK,
    output wire [3:0]  m_axi_gmem3_AWCACHE,
    output wire [2:0]  m_axi_gmem3_AWPROT,
    output wire [3:0]  m_axi_gmem3_AWQOS,
    output wire [3:0]  m_axi_gmem3_AWREGION,
    output wire [0:0]  m_axi_gmem3_AWUSER,
    output wire        m_axi_gmem3_WVALID,
    input  wire        m_axi_gmem3_WREADY,
    output wire [511:0] m_axi_gmem3_WDATA,
    output wire [63:0] m_axi_gmem3_WSTRB,
    output wire        m_axi_gmem3_WLAST,
    output wire [0:0]  m_axi_gmem3_WID,
    output wire [0:0]  m_axi_gmem3_WUSER,
    output wire        m_axi_gmem3_ARVALID,
    input  wire        m_axi_gmem3_ARREADY,
    output wire [63:0] m_axi_gmem3_ARADDR,
    output wire [0:0]  m_axi_gmem3_ARID,
    output wire [7:0]  m_axi_gmem3_ARLEN,
    output wire [2:0]  m_axi_gmem3_ARSIZE,
    output wire [1:0]  m_axi_gmem3_ARBURST,
    output wire [1:0]  m_axi_gmem3_ARLOCK,
    output wire [3:0]  m_axi_gmem3_ARCACHE,
    output wire [2:0]  m_axi_gmem3_ARPROT,
    output wire [3:0]  m_axi_gmem3_ARQOS,
    output wire [3:0]  m_axi_gmem3_ARREGION,
    output wire [0:0]  m_axi_gmem3_ARUSER,
    input  wire        m_axi_gmem3_RVALID,
    output wire        m_axi_gmem3_RREADY,
    input  wire [511:0] m_axi_gmem3_RDATA,
    input  wire        m_axi_gmem3_RLAST,
    input  wire [0:0]  m_axi_gmem3_RID,
    input  wire [0:0]  m_axi_gmem3_RUSER,
    input  wire [1:0]  m_axi_gmem3_RRESP,
    input  wire        m_axi_gmem3_BVALID,
    output wire        m_axi_gmem3_BREADY,
    input  wire [1:0]  m_axi_gmem3_BRESP,
    input  wire [0:0]  m_axi_gmem3_BID,
    input  wire [0:0]  m_axi_gmem3_BUSER
);

    // ========================================================================
    // Internal AXI4-Stream Interconnect Wires
    // ========================================================================
    
    // --- SLR0 <-> SLR1 ---
    // PE0 -> PE1: RMS partial (float 32-bit)
    wire [31:0]  axis_pe0_to_pe1_rms_partial_tdata;
    wire         axis_pe0_to_pe1_rms_partial_tvalid;
    wire         axis_pe0_to_pe1_rms_partial_tready;

    // PE1 -> PE0: RMS reciprocal (float 32-bit)
    wire [31:0]  axis_pe1_to_pe0_rms_recip_tdata;
    wire         axis_pe1_to_pe0_rms_recip_tvalid;
    wire         axis_pe1_to_pe0_rms_recip_tready;

    // PE0 -> PE1: Linear partial (128-bit reduction packet)
    wire [127:0] axis_pe0_to_pe1_linear_partial_tdata;
    wire         axis_pe0_to_pe1_linear_partial_tvalid;
    wire         axis_pe0_to_pe1_linear_partial_tready;

    // PE1 -> PE0: Linear completed output (128-bit packet)
    wire [127:0] axis_pe1_to_pe0_linear_output_tdata;
    wire         axis_pe1_to_pe0_linear_output_tvalid;
    wire         axis_pe1_to_pe0_linear_output_tready;

    // --- SLR1 <-> SLR2 ---
    // PE2 -> PE1: RMS sum pair23 (float 32-bit)
    wire [31:0]  axis_pe2_to_pe1_rms_sum_tdata;
    wire         axis_pe2_to_pe1_rms_sum_tvalid;
    wire         axis_pe2_to_pe1_rms_sum_tready;

    // PE1 -> PE2: RMS global reciprocal (float 32-bit)
    wire [31:0]  axis_pe1_to_pe2_rms_recip_tdata;
    wire         axis_pe1_to_pe2_rms_recip_tvalid;
    wire         axis_pe1_to_pe2_rms_recip_tready;

    // PE1 -> PE2: Linear pair sum PE1->PE2 (128-bit packet)
    wire [127:0] axis_pe1_to_pe2_linear_sum_tdata;
    wire         axis_pe1_to_pe2_linear_sum_tvalid;
    wire         axis_pe1_to_pe2_linear_sum_tready;

    // PE2 -> PE1: Linear pair sum PE2->PE1 (128-bit packet)
    wire [127:0] axis_pe2_to_pe1_linear_sum_tdata;
    wire         axis_pe2_to_pe1_linear_sum_tvalid;
    wire         axis_pe2_to_pe1_linear_sum_tready;

    // --- SLR2 <-> SLR3 ---
    // PE3 -> PE2: RMS partial (float 32-bit)
    wire [31:0]  axis_pe3_to_pe2_rms_partial_tdata;
    wire         axis_pe3_to_pe2_rms_partial_tvalid;
    wire         axis_pe3_to_pe2_rms_partial_tready;

    // PE2 -> PE3: RMS reciprocal (float 32-bit)
    wire [31:0]  axis_pe2_to_pe3_rms_recip_tdata;
    wire         axis_pe2_to_pe3_rms_recip_tvalid;
    wire         axis_pe2_to_pe3_rms_recip_tready;

    // PE3 -> PE2: Linear partial (128-bit reduction packet)
    wire [127:0] axis_pe3_to_pe2_linear_partial_tdata;
    wire         axis_pe3_to_pe2_linear_partial_tvalid;
    wire         axis_pe3_to_pe2_linear_partial_tready;

    // PE2 -> PE3: Linear completed output (128-bit packet)
    wire [127:0] axis_pe2_to_pe3_linear_output_tdata;
    wire         axis_pe2_to_pe3_linear_output_tvalid;
    wire         axis_pe2_to_pe3_linear_output_tready;

    // ========================================================================
    // PE0 Instance (SLR0)
    // ========================================================================
    int4_decoder_pe0_kernel pe0_inst (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt_pe0),

        // AXI-Lite Control
        .s_axi_control_AWVALID(s_axi_control_pe0_AWVALID),
        .s_axi_control_AWREADY(s_axi_control_pe0_AWREADY),
        .s_axi_control_AWADDR(s_axi_control_pe0_AWADDR),
        .s_axi_control_WVALID(s_axi_control_pe0_WVALID),
        .s_axi_control_WREADY(s_axi_control_pe0_WREADY),
        .s_axi_control_WDATA(s_axi_control_pe0_WDATA),
        .s_axi_control_WSTRB(s_axi_control_pe0_WSTRB),
        .s_axi_control_ARVALID(s_axi_control_pe0_ARVALID),
        .s_axi_control_ARREADY(s_axi_control_pe0_ARREADY),
        .s_axi_control_ARADDR(s_axi_control_pe0_ARADDR),
        .s_axi_control_RVALID(s_axi_control_pe0_RVALID),
        .s_axi_control_RREADY(s_axi_control_pe0_RREADY),
        .s_axi_control_RDATA(s_axi_control_pe0_RDATA),
        .s_axi_control_RRESP(s_axi_control_pe0_RRESP),
        .s_axi_control_BVALID(s_axi_control_pe0_BVALID),
        .s_axi_control_BREADY(s_axi_control_pe0_BREADY),
        .s_axi_control_BRESP(s_axi_control_pe0_BRESP),

        // AXI Memory Master gmem0
        .m_axi_gmem0_AWVALID(m_axi_gmem0_AWVALID),
        .m_axi_gmem0_AWREADY(m_axi_gmem0_AWREADY),
        .m_axi_gmem0_AWADDR(m_axi_gmem0_AWADDR),
        .m_axi_gmem0_AWID(m_axi_gmem0_AWID),
        .m_axi_gmem0_AWLEN(m_axi_gmem0_AWLEN),
        .m_axi_gmem0_AWSIZE(m_axi_gmem0_AWSIZE),
        .m_axi_gmem0_AWBURST(m_axi_gmem0_AWBURST),
        .m_axi_gmem0_AWLOCK(m_axi_gmem0_AWLOCK),
        .m_axi_gmem0_AWCACHE(m_axi_gmem0_AWCACHE),
        .m_axi_gmem0_AWPROT(m_axi_gmem0_AWPROT),
        .m_axi_gmem0_AWQOS(m_axi_gmem0_AWQOS),
        .m_axi_gmem0_AWREGION(m_axi_gmem0_AWREGION),
        .m_axi_gmem0_AWUSER(m_axi_gmem0_AWUSER),
        .m_axi_gmem0_WVALID(m_axi_gmem0_WVALID),
        .m_axi_gmem0_WREADY(m_axi_gmem0_WREADY),
        .m_axi_gmem0_WDATA(m_axi_gmem0_WDATA),
        .m_axi_gmem0_WSTRB(m_axi_gmem0_WSTRB),
        .m_axi_gmem0_WLAST(m_axi_gmem0_WLAST),
        .m_axi_gmem0_WID(m_axi_gmem0_WID),
        .m_axi_gmem0_WUSER(m_axi_gmem0_WUSER),
        .m_axi_gmem0_ARVALID(m_axi_gmem0_ARVALID),
        .m_axi_gmem0_ARREADY(m_axi_gmem0_ARREADY),
        .m_axi_gmem0_ARADDR(m_axi_gmem0_ARADDR),
        .m_axi_gmem0_ARID(m_axi_gmem0_ARID),
        .m_axi_gmem0_ARLEN(m_axi_gmem0_ARLEN),
        .m_axi_gmem0_ARSIZE(m_axi_gmem0_ARSIZE),
        .m_axi_gmem0_ARBURST(m_axi_gmem0_ARBURST),
        .m_axi_gmem0_ARLOCK(m_axi_gmem0_ARLOCK),
        .m_axi_gmem0_ARCACHE(m_axi_gmem0_ARCACHE),
        .m_axi_gmem0_ARPROT(m_axi_gmem0_ARPROT),
        .m_axi_gmem0_ARQOS(m_axi_gmem0_ARQOS),
        .m_axi_gmem0_ARREGION(m_axi_gmem0_ARREGION),
        .m_axi_gmem0_ARUSER(m_axi_gmem0_ARUSER),
        .m_axi_gmem0_RVALID(m_axi_gmem0_RVALID),
        .m_axi_gmem0_RREADY(m_axi_gmem0_RREADY),
        .m_axi_gmem0_RDATA(m_axi_gmem0_RDATA),
        .m_axi_gmem0_RLAST(m_axi_gmem0_RLAST),
        .m_axi_gmem0_RID(m_axi_gmem0_RID),
        .m_axi_gmem0_RUSER(m_axi_gmem0_RUSER),
        .m_axi_gmem0_RRESP(m_axi_gmem0_RRESP),
        .m_axi_gmem0_BVALID(m_axi_gmem0_BVALID),
        .m_axi_gmem0_BREADY(m_axi_gmem0_BREADY),
        .m_axi_gmem0_BRESP(m_axi_gmem0_BRESP),
        .m_axi_gmem0_BID(m_axi_gmem0_BID),
        .m_axi_gmem0_BUSER(m_axi_gmem0_BUSER),

        // AXI4-Stream Links to/from PE1
        .rms_partial_to_pe1_TDATA(axis_pe0_to_pe1_rms_partial_tdata),
        .rms_partial_to_pe1_TVALID(axis_pe0_to_pe1_rms_partial_tvalid),
        .rms_partial_to_pe1_TREADY(axis_pe0_to_pe1_rms_partial_tready),

        .rms_reciprocal_from_pe1_TDATA(axis_pe1_to_pe0_rms_recip_tdata),
        .rms_reciprocal_from_pe1_TVALID(axis_pe1_to_pe0_rms_recip_tvalid),
        .rms_reciprocal_from_pe1_TREADY(axis_pe1_to_pe0_rms_recip_tready),

        .linear_partial_to_pe1_TDATA(axis_pe0_to_pe1_linear_partial_tdata),
        .linear_partial_to_pe1_TVALID(axis_pe0_to_pe1_linear_partial_tvalid),
        .linear_partial_to_pe1_TREADY(axis_pe0_to_pe1_linear_partial_tready),

        .linear_output_from_pe1_TDATA(axis_pe1_to_pe0_linear_output_tdata),
        .linear_output_from_pe1_TVALID(axis_pe1_to_pe0_linear_output_tvalid),
        .linear_output_from_pe1_TREADY(axis_pe1_to_pe0_linear_output_tready)
    );

    // ========================================================================
    // PE1 Instance (SLR1)
    // ========================================================================
    int4_decoder_pe1_kernel pe1_inst (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt_pe1),

        // AXI-Lite Control
        .s_axi_control_AWVALID(s_axi_control_pe1_AWVALID),
        .s_axi_control_AWREADY(s_axi_control_pe1_AWREADY),
        .s_axi_control_AWADDR(s_axi_control_pe1_AWADDR),
        .s_axi_control_WVALID(s_axi_control_pe1_WVALID),
        .s_axi_control_WREADY(s_axi_control_pe1_WREADY),
        .s_axi_control_WDATA(s_axi_control_pe1_WDATA),
        .s_axi_control_WSTRB(s_axi_control_pe1_WSTRB),
        .s_axi_control_ARVALID(s_axi_control_pe1_ARVALID),
        .s_axi_control_ARREADY(s_axi_control_pe1_ARREADY),
        .s_axi_control_ARADDR(s_axi_control_pe1_ARADDR),
        .s_axi_control_RVALID(s_axi_control_pe1_RVALID),
        .s_axi_control_RREADY(s_axi_control_pe1_RREADY),
        .s_axi_control_RDATA(s_axi_control_pe1_RDATA),
        .s_axi_control_RRESP(s_axi_control_pe1_RRESP),
        .s_axi_control_BVALID(s_axi_control_pe1_BVALID),
        .s_axi_control_BREADY(s_axi_control_pe1_BREADY),
        .s_axi_control_BRESP(s_axi_control_pe1_BRESP),

        // AXI Memory Master gmem1
        .m_axi_gmem1_AWVALID(m_axi_gmem1_AWVALID),
        .m_axi_gmem1_AWREADY(m_axi_gmem1_AWREADY),
        .m_axi_gmem1_AWADDR(m_axi_gmem1_AWADDR),
        .m_axi_gmem1_AWID(m_axi_gmem1_AWID),
        .m_axi_gmem1_AWLEN(m_axi_gmem1_AWLEN),
        .m_axi_gmem1_AWSIZE(m_axi_gmem1_AWSIZE),
        .m_axi_gmem1_AWBURST(m_axi_gmem1_AWBURST),
        .m_axi_gmem1_AWLOCK(m_axi_gmem1_AWLOCK),
        .m_axi_gmem1_AWCACHE(m_axi_gmem1_AWCACHE),
        .m_axi_gmem1_AWPROT(m_axi_gmem1_AWPROT),
        .m_axi_gmem1_AWQOS(m_axi_gmem1_AWQOS),
        .m_axi_gmem1_AWREGION(m_axi_gmem1_AWREGION),
        .m_axi_gmem1_AWUSER(m_axi_gmem1_AWUSER),
        .m_axi_gmem1_WVALID(m_axi_gmem1_WVALID),
        .m_axi_gmem1_WREADY(m_axi_gmem1_WREADY),
        .m_axi_gmem1_WDATA(m_axi_gmem1_WDATA),
        .m_axi_gmem1_WSTRB(m_axi_gmem1_WSTRB),
        .m_axi_gmem1_WLAST(m_axi_gmem1_WLAST),
        .m_axi_gmem1_WID(m_axi_gmem1_WID),
        .m_axi_gmem1_WUSER(m_axi_gmem1_WUSER),
        .m_axi_gmem1_ARVALID(m_axi_gmem1_ARVALID),
        .m_axi_gmem1_ARREADY(m_axi_gmem1_ARREADY),
        .m_axi_gmem1_ARADDR(m_axi_gmem1_ARADDR),
        .m_axi_gmem1_ARID(m_axi_gmem1_ARID),
        .m_axi_gmem1_ARLEN(m_axi_gmem1_ARLEN),
        .m_axi_gmem1_ARSIZE(m_axi_gmem1_ARSIZE),
        .m_axi_gmem1_ARBURST(m_axi_gmem1_ARBURST),
        .m_axi_gmem1_ARLOCK(m_axi_gmem1_ARLOCK),
        .m_axi_gmem1_ARCACHE(m_axi_gmem1_ARCACHE),
        .m_axi_gmem1_ARPROT(m_axi_gmem1_ARPROT),
        .m_axi_gmem1_ARQOS(m_axi_gmem1_ARQOS),
        .m_axi_gmem1_ARREGION(m_axi_gmem1_ARREGION),
        .m_axi_gmem1_ARUSER(m_axi_gmem1_ARUSER),
        .m_axi_gmem1_RVALID(m_axi_gmem1_RVALID),
        .m_axi_gmem1_RREADY(m_axi_gmem1_RREADY),
        .m_axi_gmem1_RDATA(m_axi_gmem1_RDATA),
        .m_axi_gmem1_RLAST(m_axi_gmem1_RLAST),
        .m_axi_gmem1_RID(m_axi_gmem1_RID),
        .m_axi_gmem1_RUSER(m_axi_gmem1_RUSER),
        .m_axi_gmem1_RRESP(m_axi_gmem1_RRESP),
        .m_axi_gmem1_BVALID(m_axi_gmem1_BVALID),
        .m_axi_gmem1_BREADY(m_axi_gmem1_BREADY),
        .m_axi_gmem1_BRESP(m_axi_gmem1_BRESP),
        .m_axi_gmem1_BID(m_axi_gmem1_BID),
        .m_axi_gmem1_BUSER(m_axi_gmem1_BUSER),

        // AXI4-Stream Links to/from PE0
        .rms_partial_from_pe0_TDATA(axis_pe0_to_pe1_rms_partial_tdata),
        .rms_partial_from_pe0_TVALID(axis_pe0_to_pe1_rms_partial_tvalid),
        .rms_partial_from_pe0_TREADY(axis_pe0_to_pe1_rms_partial_tready),

        .rms_reciprocal_to_pe0_TDATA(axis_pe1_to_pe0_rms_recip_tdata),
        .rms_reciprocal_to_pe0_TVALID(axis_pe1_to_pe0_rms_recip_tvalid),
        .rms_reciprocal_to_pe0_TREADY(axis_pe1_to_pe0_rms_recip_tready),

        .linear_partial_from_pe0_TDATA(axis_pe0_to_pe1_linear_partial_tdata),
        .linear_partial_from_pe0_TVALID(axis_pe0_to_pe1_linear_partial_tvalid),
        .linear_partial_from_pe0_TREADY(axis_pe0_to_pe1_linear_partial_tready),

        .linear_output_to_pe0_TDATA(axis_pe1_to_pe0_linear_output_tdata),
        .linear_output_to_pe0_TVALID(axis_pe1_to_pe0_linear_output_tvalid),
        .linear_output_to_pe0_TREADY(axis_pe1_to_pe0_linear_output_tready),

        // AXI4-Stream Links to/from PE2
        .rms_sum_from_pe2_TDATA(axis_pe2_to_pe1_rms_sum_tdata),
        .rms_sum_from_pe2_TVALID(axis_pe2_to_pe1_rms_sum_tvalid),
        .rms_sum_from_pe2_TREADY(axis_pe2_to_pe1_rms_sum_tready),

        .rms_reciprocal_to_pe2_TDATA(axis_pe1_to_pe2_rms_recip_tdata),
        .rms_reciprocal_to_pe2_TVALID(axis_pe1_to_pe2_rms_recip_tvalid),
        .rms_reciprocal_to_pe2_TREADY(axis_pe1_to_pe2_rms_recip_tready),

        .linear_sum_from_pe2_TDATA(axis_pe2_to_pe1_linear_sum_tdata),
        .linear_sum_from_pe2_TVALID(axis_pe2_to_pe1_linear_sum_tvalid),
        .linear_sum_from_pe2_TREADY(axis_pe2_to_pe1_linear_sum_tready),

        .linear_sum_to_pe2_TDATA(axis_pe1_to_pe2_linear_sum_tdata),
        .linear_sum_to_pe2_TVALID(axis_pe1_to_pe2_linear_sum_tvalid),
        .linear_sum_to_pe2_TREADY(axis_pe1_to_pe2_linear_sum_tready)
    );

    // ========================================================================
    // PE2 Instance (SLR2)
    // ========================================================================
    int4_decoder_pe2_kernel pe2_inst (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt_pe2),

        // AXI-Lite Control
        .s_axi_control_AWVALID(s_axi_control_pe2_AWVALID),
        .s_axi_control_AWREADY(s_axi_control_pe2_AWREADY),
        .s_axi_control_AWADDR(s_axi_control_pe2_AWADDR),
        .s_axi_control_WVALID(s_axi_control_pe2_WVALID),
        .s_axi_control_WREADY(s_axi_control_pe2_WREADY),
        .s_axi_control_WDATA(s_axi_control_pe2_WDATA),
        .s_axi_control_WSTRB(s_axi_control_pe2_WSTRB),
        .s_axi_control_ARVALID(s_axi_control_pe2_ARVALID),
        .s_axi_control_ARREADY(s_axi_control_pe2_ARREADY),
        .s_axi_control_ARADDR(s_axi_control_pe2_ARADDR),
        .s_axi_control_RVALID(s_axi_control_pe2_RVALID),
        .s_axi_control_RREADY(s_axi_control_pe2_RREADY),
        .s_axi_control_RDATA(s_axi_control_pe2_RDATA),
        .s_axi_control_RRESP(s_axi_control_pe2_RRESP),
        .s_axi_control_BVALID(s_axi_control_pe2_BVALID),
        .s_axi_control_BREADY(s_axi_control_pe2_BREADY),
        .s_axi_control_BRESP(s_axi_control_pe2_BRESP),

        // AXI Memory Master gmem2
        .m_axi_gmem2_AWVALID(m_axi_gmem2_AWVALID),
        .m_axi_gmem2_AWREADY(m_axi_gmem2_AWREADY),
        .m_axi_gmem2_AWADDR(m_axi_gmem2_AWADDR),
        .m_axi_gmem2_AWID(m_axi_gmem2_AWID),
        .m_axi_gmem2_AWLEN(m_axi_gmem2_AWLEN),
        .m_axi_gmem2_AWSIZE(m_axi_gmem2_AWSIZE),
        .m_axi_gmem2_AWBURST(m_axi_gmem2_AWBURST),
        .m_axi_gmem2_AWLOCK(m_axi_gmem2_AWLOCK),
        .m_axi_gmem2_AWCACHE(m_axi_gmem2_AWCACHE),
        .m_axi_gmem2_AWPROT(m_axi_gmem2_AWPROT),
        .m_axi_gmem2_AWQOS(m_axi_gmem2_AWQOS),
        .m_axi_gmem2_AWREGION(m_axi_gmem2_AWREGION),
        .m_axi_gmem2_AWUSER(m_axi_gmem2_AWUSER),
        .m_axi_gmem2_WVALID(m_axi_gmem2_WVALID),
        .m_axi_gmem2_WREADY(m_axi_gmem2_WREADY),
        .m_axi_gmem2_WDATA(m_axi_gmem2_WDATA),
        .m_axi_gmem2_WSTRB(m_axi_gmem2_WSTRB),
        .m_axi_gmem2_WLAST(m_axi_gmem2_WLAST),
        .m_axi_gmem2_WID(m_axi_gmem2_WID),
        .m_axi_gmem2_WUSER(m_axi_gmem2_WUSER),
        .m_axi_gmem2_ARVALID(m_axi_gmem2_ARVALID),
        .m_axi_gmem2_ARREADY(m_axi_gmem2_ARREADY),
        .m_axi_gmem2_ARADDR(m_axi_gmem2_ARADDR),
        .m_axi_gmem2_ARID(m_axi_gmem2_ARID),
        .m_axi_gmem2_ARLEN(m_axi_gmem2_ARLEN),
        .m_axi_gmem2_ARSIZE(m_axi_gmem2_ARSIZE),
        .m_axi_gmem2_ARBURST(m_axi_gmem2_ARBURST),
        .m_axi_gmem2_ARLOCK(m_axi_gmem2_ARLOCK),
        .m_axi_gmem2_ARCACHE(m_axi_gmem2_ARCACHE),
        .m_axi_gmem2_ARPROT(m_axi_gmem2_ARPROT),
        .m_axi_gmem2_ARQOS(m_axi_gmem2_ARQOS),
        .m_axi_gmem2_ARREGION(m_axi_gmem2_ARREGION),
        .m_axi_gmem2_ARUSER(m_axi_gmem2_ARUSER),
        .m_axi_gmem2_RVALID(m_axi_gmem2_RVALID),
        .m_axi_gmem2_RREADY(m_axi_gmem2_RREADY),
        .m_axi_gmem2_RDATA(m_axi_gmem2_RDATA),
        .m_axi_gmem2_RLAST(m_axi_gmem2_RLAST),
        .m_axi_gmem2_RID(m_axi_gmem2_RID),
        .m_axi_gmem2_RUSER(m_axi_gmem2_RUSER),
        .m_axi_gmem2_RRESP(m_axi_gmem2_RRESP),
        .m_axi_gmem2_BVALID(m_axi_gmem2_BVALID),
        .m_axi_gmem2_BREADY(m_axi_gmem2_BREADY),
        .m_axi_gmem2_BRESP(m_axi_gmem2_BRESP),
        .m_axi_gmem2_BID(m_axi_gmem2_BID),
        .m_axi_gmem2_BUSER(m_axi_gmem2_BUSER),

        // AXI4-Stream Links to/from PE1
        .rms_reciprocal_from_pe1_TDATA(axis_pe1_to_pe2_rms_recip_tdata),
        .rms_reciprocal_from_pe1_TVALID(axis_pe1_to_pe2_rms_recip_tvalid),
        .rms_reciprocal_from_pe1_TREADY(axis_pe1_to_pe2_rms_recip_tready),

        .rms_sum_to_pe1_TDATA(axis_pe2_to_pe1_rms_sum_tdata),
        .rms_sum_to_pe1_TVALID(axis_pe2_to_pe1_rms_sum_tvalid),
        .rms_sum_to_pe1_TREADY(axis_pe2_to_pe1_rms_sum_tready),

        .linear_sum_from_pe1_TDATA(axis_pe1_to_pe2_linear_sum_tdata),
        .linear_sum_from_pe1_TVALID(axis_pe1_to_pe2_linear_sum_tvalid),
        .linear_sum_from_pe1_TREADY(axis_pe1_to_pe2_linear_sum_tready),

        .linear_sum_to_pe1_TDATA(axis_pe2_to_pe1_linear_sum_tdata),
        .linear_sum_to_pe1_TVALID(axis_pe2_to_pe1_linear_sum_tvalid),
        .linear_sum_to_pe1_TREADY(axis_pe2_to_pe1_linear_sum_tready),

        // AXI4-Stream Links to/from PE3
        .rms_partial_from_pe3_TDATA(axis_pe3_to_pe2_rms_partial_tdata),
        .rms_partial_from_pe3_TVALID(axis_pe3_to_pe2_rms_partial_tvalid),
        .rms_partial_from_pe3_TREADY(axis_pe3_to_pe2_rms_partial_tready),

        .rms_reciprocal_to_pe3_TDATA(axis_pe2_to_pe3_rms_recip_tdata),
        .rms_reciprocal_to_pe3_TVALID(axis_pe2_to_pe3_rms_recip_tvalid),
        .rms_reciprocal_to_pe3_TREADY(axis_pe2_to_pe3_rms_recip_tready),

        .linear_partial_from_pe3_TDATA(axis_pe3_to_pe2_linear_partial_tdata),
        .linear_partial_from_pe3_TVALID(axis_pe3_to_pe2_linear_partial_tvalid),
        .linear_partial_from_pe3_TREADY(axis_pe3_to_pe2_linear_partial_tready),

        .linear_output_to_pe3_TDATA(axis_pe2_to_pe3_linear_output_tdata),
        .linear_output_to_pe3_TVALID(axis_pe2_to_pe3_linear_output_tvalid),
        .linear_output_to_pe3_TREADY(axis_pe2_to_pe3_linear_output_tready)
    );

    // ========================================================================
    // PE3 Instance (SLR3)
    // ========================================================================
    int4_decoder_pe3_kernel pe3_inst (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .interrupt(interrupt_pe3),

        // AXI-Lite Control
        .s_axi_control_AWVALID(s_axi_control_pe3_AWVALID),
        .s_axi_control_AWREADY(s_axi_control_pe3_AWREADY),
        .s_axi_control_AWADDR(s_axi_control_pe3_AWADDR),
        .s_axi_control_WVALID(s_axi_control_pe3_WVALID),
        .s_axi_control_WREADY(s_axi_control_pe3_WREADY),
        .s_axi_control_WDATA(s_axi_control_pe3_WDATA),
        .s_axi_control_WSTRB(s_axi_control_pe3_WSTRB),
        .s_axi_control_ARVALID(s_axi_control_pe3_ARVALID),
        .s_axi_control_ARREADY(s_axi_control_pe3_ARREADY),
        .s_axi_control_ARADDR(s_axi_control_pe3_ARADDR),
        .s_axi_control_RVALID(s_axi_control_pe3_RVALID),
        .s_axi_control_RREADY(s_axi_control_pe3_RREADY),
        .s_axi_control_RDATA(s_axi_control_pe3_RDATA),
        .s_axi_control_RRESP(s_axi_control_pe3_RRESP),
        .s_axi_control_BVALID(s_axi_control_pe3_BVALID),
        .s_axi_control_BREADY(s_axi_control_pe3_BREADY),
        .s_axi_control_BRESP(s_axi_control_pe3_BRESP),

        // AXI Memory Master gmem3
        .m_axi_gmem3_AWVALID(m_axi_gmem3_AWVALID),
        .m_axi_gmem3_AWREADY(m_axi_gmem3_AWREADY),
        .m_axi_gmem3_AWADDR(m_axi_gmem3_AWADDR),
        .m_axi_gmem3_AWID(m_axi_gmem3_AWID),
        .m_axi_gmem3_AWLEN(m_axi_gmem3_AWLEN),
        .m_axi_gmem3_AWSIZE(m_axi_gmem3_AWSIZE),
        .m_axi_gmem3_AWBURST(m_axi_gmem3_AWBURST),
        .m_axi_gmem3_AWLOCK(m_axi_gmem3_AWLOCK),
        .m_axi_gmem3_AWCACHE(m_axi_gmem3_AWCACHE),
        .m_axi_gmem3_AWPROT(m_axi_gmem3_AWPROT),
        .m_axi_gmem3_AWQOS(m_axi_gmem3_AWQOS),
        .m_axi_gmem3_AWREGION(m_axi_gmem3_AWREGION),
        .m_axi_gmem3_AWUSER(m_axi_gmem3_AWUSER),
        .m_axi_gmem3_WVALID(m_axi_gmem3_WVALID),
        .m_axi_gmem3_WREADY(m_axi_gmem3_WREADY),
        .m_axi_gmem3_WDATA(m_axi_gmem3_WDATA),
        .m_axi_gmem3_WSTRB(m_axi_gmem3_WSTRB),
        .m_axi_gmem3_WLAST(m_axi_gmem3_WLAST),
        .m_axi_gmem3_WID(m_axi_gmem3_WID),
        .m_axi_gmem3_WUSER(m_axi_gmem3_WUSER),
        .m_axi_gmem3_ARVALID(m_axi_gmem3_ARVALID),
        .m_axi_gmem3_ARREADY(m_axi_gmem3_ARREADY),
        .m_axi_gmem3_ARADDR(m_axi_gmem3_ARADDR),
        .m_axi_gmem3_ARID(m_axi_gmem3_ARID),
        .m_axi_gmem3_ARLEN(m_axi_gmem3_ARLEN),
        .m_axi_gmem3_ARSIZE(m_axi_gmem3_ARSIZE),
        .m_axi_gmem3_ARBURST(m_axi_gmem3_ARBURST),
        .m_axi_gmem3_ARLOCK(m_axi_gmem3_ARLOCK),
        .m_axi_gmem3_ARCACHE(m_axi_gmem3_ARCACHE),
        .m_axi_gmem3_ARPROT(m_axi_gmem3_ARPROT),
        .m_axi_gmem3_ARQOS(m_axi_gmem3_ARQOS),
        .m_axi_gmem3_ARREGION(m_axi_gmem3_ARREGION),
        .m_axi_gmem3_ARUSER(m_axi_gmem3_ARUSER),
        .m_axi_gmem3_RVALID(m_axi_gmem3_RVALID),
        .m_axi_gmem3_RREADY(m_axi_gmem3_RREADY),
        .m_axi_gmem3_RDATA(m_axi_gmem3_RDATA),
        .m_axi_gmem3_RLAST(m_axi_gmem3_RLAST),
        .m_axi_gmem3_RID(m_axi_gmem3_RID),
        .m_axi_gmem3_RUSER(m_axi_gmem3_RUSER),
        .m_axi_gmem3_RRESP(m_axi_gmem3_RRESP),
        .m_axi_gmem3_BVALID(m_axi_gmem3_BVALID),
        .m_axi_gmem3_BREADY(m_axi_gmem3_BREADY),
        .m_axi_gmem3_BRESP(m_axi_gmem3_BRESP),
        .m_axi_gmem3_BID(m_axi_gmem3_BID),
        .m_axi_gmem3_BUSER(m_axi_gmem3_BUSER),

        // AXI4-Stream Links to/from PE2
        .rms_partial_to_pe2_TDATA(axis_pe3_to_pe2_rms_partial_tdata),
        .rms_partial_to_pe2_TVALID(axis_pe3_to_pe2_rms_partial_tvalid),
        .rms_partial_to_pe2_TREADY(axis_pe3_to_pe2_rms_partial_tready),

        .rms_reciprocal_from_pe2_TDATA(axis_pe2_to_pe3_rms_recip_tdata),
        .rms_reciprocal_from_pe2_TVALID(axis_pe2_to_pe3_rms_recip_tvalid),
        .rms_reciprocal_from_pe2_TREADY(axis_pe2_to_pe3_rms_recip_tready),

        .linear_partial_to_pe2_TDATA(axis_pe3_to_pe2_linear_partial_tdata),
        .linear_partial_to_pe2_TVALID(axis_pe3_to_pe2_linear_partial_tvalid),
        .linear_partial_to_pe2_TREADY(axis_pe3_to_pe2_linear_partial_tready),

        .linear_output_from_pe2_TDATA(axis_pe2_to_pe3_linear_output_tdata),
        .linear_output_from_pe2_TVALID(axis_pe2_to_pe3_linear_output_tvalid),
        .linear_output_from_pe2_TREADY(axis_pe2_to_pe3_linear_output_tready)
    );

endmodule
