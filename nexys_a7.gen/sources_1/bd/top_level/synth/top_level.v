//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Tue Jun 18 03:05:35 2024
//Host        : simtool-5 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module source_100mhz_imp_MSWE0P
   (CLK100MHZ,
    CPU_RESETN,
    clk_100mhz,
    interconnect_aresetn,
    peripheral_aresetn);
  input CLK100MHZ;
  input CPU_RESETN;
  output clk_100mhz;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;

  wire CLK100MHZ_1;
  wire CPU_RESETN_1;
  wire system_clock_clk_100mhz;
  wire [0:0]system_reset_interconnect_aresetn;
  wire [0:0]system_reset_peripheral_aresetn;

  assign CLK100MHZ_1 = CLK100MHZ;
  assign CPU_RESETN_1 = CPU_RESETN;
  assign clk_100mhz = system_clock_clk_100mhz;
  assign interconnect_aresetn[0] = system_reset_interconnect_aresetn;
  assign peripheral_aresetn[0] = system_reset_peripheral_aresetn;
  top_level_clk_wiz_0_0 system_clock
       (.clk_100mhz(system_clock_clk_100mhz),
        .clk_in1(CLK100MHZ_1));
  top_level_proc_sys_reset_0_0 system_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(CPU_RESETN_1),
        .interconnect_aresetn(system_reset_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(system_reset_peripheral_aresetn),
        .slowest_sync_clk(system_clock_clk_100mhz));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (BTNU,
    CLK100MHZ,
    CPU_RESETN);
  input BTNU;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK100MHZ, ASSOCIATED_RESET CPU_RESETN, CLK_DOMAIN top_level_CLK100MHZ, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CLK100MHZ;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CPU_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CPU_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input CPU_RESETN;

  wire CLK100MHZ_1;
  wire CPU_RESETN_1;
  wire PIN_0_1;
  wire button_Q;
  (* CONN_BUS_INFO = "packet_generator_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [127:0]packet_generator_axis_out_TDATA;
  (* CONN_BUS_INFO = "packet_generator_axis_out xilinx.com:interface:axis:1.0 None TKEEP" *) (* DONT_TOUCH *) wire [15:0]packet_generator_axis_out_TKEEP;
  (* CONN_BUS_INFO = "packet_generator_axis_out xilinx.com:interface:axis:1.0 None TLAST" *) (* DONT_TOUCH *) wire packet_generator_axis_out_TLAST;
  (* CONN_BUS_INFO = "packet_generator_axis_out xilinx.com:interface:axis:1.0 None TREADY" *) (* DONT_TOUCH *) wire packet_generator_axis_out_TREADY;
  (* CONN_BUS_INFO = "packet_generator_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire packet_generator_axis_out_TVALID;
  wire source_100mhz_clk_100mhz;
  wire [0:0]source_100mhz_peripheral_aresetn;

  assign CLK100MHZ_1 = CLK100MHZ;
  assign CPU_RESETN_1 = CPU_RESETN;
  assign PIN_0_1 = BTNU;
  top_level_button_0_0 button
       (.CLK(source_100mhz_clk_100mhz),
        .PIN(PIN_0_1),
        .Q(button_Q));
  top_level_data_consumer_0_0 data_consumer
       (.AXIS_RX_TDATA(packet_generator_axis_out_TDATA),
        .AXIS_RX_TKEEP(packet_generator_axis_out_TKEEP),
        .AXIS_RX_TLAST(packet_generator_axis_out_TLAST),
        .AXIS_RX_TREADY(packet_generator_axis_out_TREADY),
        .AXIS_RX_TVALID(packet_generator_axis_out_TVALID),
        .clk(source_100mhz_clk_100mhz));
  top_level_packet_gen_0_0 packet_generator
       (.axis_out_tdata(packet_generator_axis_out_TDATA),
        .axis_out_tkeep(packet_generator_axis_out_TKEEP),
        .axis_out_tlast(packet_generator_axis_out_TLAST),
        .axis_out_tready(packet_generator_axis_out_TREADY),
        .axis_out_tvalid(packet_generator_axis_out_TVALID),
        .clk(source_100mhz_clk_100mhz),
        .resetn(source_100mhz_peripheral_aresetn),
        .start(button_Q));
  source_100mhz_imp_MSWE0P source_100mhz
       (.CLK100MHZ(CLK100MHZ_1),
        .CPU_RESETN(CPU_RESETN_1),
        .clk_100mhz(source_100mhz_clk_100mhz),
        .peripheral_aresetn(source_100mhz_peripheral_aresetn));
  top_level_system_ila_0_0 system_ila
       (.SLOT_0_AXIS_tdata(packet_generator_axis_out_TDATA),
        .SLOT_0_AXIS_tkeep(packet_generator_axis_out_TKEEP),
        .SLOT_0_AXIS_tlast(packet_generator_axis_out_TLAST),
        .SLOT_0_AXIS_tready(packet_generator_axis_out_TREADY),
        .SLOT_0_AXIS_tvalid(packet_generator_axis_out_TVALID),
        .clk(source_100mhz_clk_100mhz),
        .probe0(button_Q),
        .resetn(1'b1));
endmodule
