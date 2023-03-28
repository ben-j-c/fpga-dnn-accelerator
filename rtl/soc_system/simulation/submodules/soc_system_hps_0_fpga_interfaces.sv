// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1 ns / 1 ns

import verbosity_pkg::*;
import avalon_mm_pkg::*;
import mgc_axi_pkg::*;

module soc_system_hps_0_fpga_interfaces
(
   output wire [  0:  0] h2f_rst_n,
   input  wire [  0:  0] f2h_cold_rst_req_n,
   input  wire [  0:  0] f2h_dbg_rst_req_n,
   input  wire [  0:  0] f2h_warm_rst_req_n,
   input  wire [ 27:  0] f2h_stm_hwevents,
   input  wire [  0:  0] h2f_axi_clk,
   output wire [ 11:  0] h2f_AWID,
   output wire [ 29:  0] h2f_AWADDR,
   output wire [  3:  0] h2f_AWLEN,
   output wire [  2:  0] h2f_AWSIZE,
   output wire [  1:  0] h2f_AWBURST,
   output wire [  1:  0] h2f_AWLOCK,
   output wire [  3:  0] h2f_AWCACHE,
   output wire [  2:  0] h2f_AWPROT,
   output wire [  0:  0] h2f_AWVALID,
   input  wire [  0:  0] h2f_AWREADY,
   output wire [ 11:  0] h2f_WID,
   output wire [ 63:  0] h2f_WDATA,
   output wire [  7:  0] h2f_WSTRB,
   output wire [  0:  0] h2f_WLAST,
   output wire [  0:  0] h2f_WVALID,
   input  wire [  0:  0] h2f_WREADY,
   input  wire [ 11:  0] h2f_BID,
   input  wire [  1:  0] h2f_BRESP,
   input  wire [  0:  0] h2f_BVALID,
   output wire [  0:  0] h2f_BREADY,
   output wire [ 11:  0] h2f_ARID,
   output wire [ 29:  0] h2f_ARADDR,
   output wire [  3:  0] h2f_ARLEN,
   output wire [  2:  0] h2f_ARSIZE,
   output wire [  1:  0] h2f_ARBURST,
   output wire [  1:  0] h2f_ARLOCK,
   output wire [  3:  0] h2f_ARCACHE,
   output wire [  2:  0] h2f_ARPROT,
   output wire [  0:  0] h2f_ARVALID,
   input  wire [  0:  0] h2f_ARREADY,
   input  wire [ 11:  0] h2f_RID,
   input  wire [ 63:  0] h2f_RDATA,
   input  wire [  1:  0] h2f_RRESP,
   input  wire [  0:  0] h2f_RLAST,
   input  wire [  0:  0] h2f_RVALID,
   output wire [  0:  0] h2f_RREADY,
   input  wire [ 26:  0] f2h_sdram0_ADDRESS,
   input  wire [  7:  0] f2h_sdram0_BURSTCOUNT,
   output wire [  0:  0] f2h_sdram0_WAITREQUEST,
   output wire [255:  0] f2h_sdram0_READDATA,
   output wire [  0:  0] f2h_sdram0_READDATAVALID,
   input  wire [  0:  0] f2h_sdram0_READ,
   input  wire [  0:  0] f2h_sdram0_clk,
   input  wire [ 26:  0] f2h_sdram1_ADDRESS,
   input  wire [  7:  0] f2h_sdram1_BURSTCOUNT,
   output wire [  0:  0] f2h_sdram1_WAITREQUEST,
   input  wire [255:  0] f2h_sdram1_WRITEDATA,
   input  wire [ 31:  0] f2h_sdram1_BYTEENABLE,
   input  wire [  0:  0] f2h_sdram1_WRITE,
   input  wire [  0:  0] f2h_sdram1_clk
);




   altera_avalon_reset_source #(
      .ASSERT_HIGH_RESET(0),
      .INITIAL_RESET_CYCLES(1)
   ) h2f_reset_inst (
      .reset(h2f_rst_n),
      .clk('0)
   );

   mgc_axi_master #(
      .AXI_ID_WIDTH(12),
      .AXI_ADDRESS_WIDTH(30),
      .AXI_WDATA_WIDTH(64),
      .AXI_RDATA_WIDTH(64),
      .index(1)
   ) h2f_axi_master_inst (
      .ARSIZE(h2f_ARSIZE),
      .AWUSER(),
      .WVALID(h2f_WVALID),
      .RLAST(h2f_RLAST),
      .ACLK(h2f_axi_clk),
      .RRESP(h2f_RRESP),
      .ARREADY(h2f_ARREADY),
      .ARPROT(h2f_ARPROT),
      .ARADDR(h2f_ARADDR),
      .BVALID(h2f_BVALID),
      .ARID(h2f_ARID),
      .BID(h2f_BID),
      .ARBURST(h2f_ARBURST),
      .ARCACHE(h2f_ARCACHE),
      .AWVALID(h2f_AWVALID),
      .WDATA(h2f_WDATA),
      .ARUSER(),
      .RID(h2f_RID),
      .RVALID(h2f_RVALID),
      .WREADY(h2f_WREADY),
      .AWLOCK(h2f_AWLOCK),
      .BRESP(h2f_BRESP),
      .ARLEN(h2f_ARLEN),
      .AWSIZE(h2f_AWSIZE),
      .AWLEN(h2f_AWLEN),
      .BREADY(h2f_BREADY),
      .AWID(h2f_AWID),
      .RDATA(h2f_RDATA),
      .AWREADY(h2f_AWREADY),
      .ARVALID(h2f_ARVALID),
      .WLAST(h2f_WLAST),
      .ARESETn(h2f_rst_n),
      .AWPROT(h2f_AWPROT),
      .WID(h2f_WID),
      .AWADDR(h2f_AWADDR),
      .AWCACHE(h2f_AWCACHE),
      .ARLOCK(h2f_ARLOCK),
      .AWBURST(h2f_AWBURST),
      .RREADY(h2f_RREADY),
      .WSTRB(h2f_WSTRB)
   );

   soc_system_hps_0_fpga_interfaces_f2h_stm_hw_events f2h_stm_hw_events_inst (
      .sig_f2h_stm_hwevents(f2h_stm_hwevents)
   );

   soc_system_hps_0_fpga_interfaces_f2h_cold_reset_req f2h_cold_reset_req_inst (
      .sig_f2h_cold_rst_req_n(f2h_cold_rst_req_n)
   );

   soc_system_hps_0_fpga_interfaces_f2h_warm_reset_req f2h_warm_reset_req_inst (
      .sig_f2h_warm_rst_req_n(f2h_warm_rst_req_n)
   );

   soc_system_hps_0_fpga_interfaces_f2h_debug_reset_req f2h_debug_reset_req_inst (
      .sig_f2h_dbg_rst_req_n(f2h_dbg_rst_req_n)
   );

// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.




wire [20 - 1 : 0] intermediate;
assign intermediate[15:15] = intermediate[18:18];
assign intermediate[4:4] = intermediate[8:8];
assign intermediate[7:7] = intermediate[6:6];
assign intermediate[3:3] = intermediate[8:8];
assign intermediate[13:13] = intermediate[18:18];
assign intermediate[19:19] = intermediate[18:18];
assign intermediate[0:0] = ~intermediate[1:1];
assign intermediate[2:2] = intermediate[8:8];
assign intermediate[14:14] = intermediate[18:18];
assign intermediate[17:17] = intermediate[16:16];
assign intermediate[10:10] = ~intermediate[11:11];
assign intermediate[12:12] = intermediate[18:18];
assign intermediate[9:9] = intermediate[8:8];
assign intermediate[5:5] = intermediate[8:8];
assign f2h_sdram1_WAITREQUEST[0:0] = intermediate[10:10];
assign f2h_sdram0_WAITREQUEST[0:0] = intermediate[0:0];
assign intermediate[18:18] = f2h_sdram1_clk[0:0];
assign intermediate[16:16] = f2h_sdram1_WRITE[0:0];
assign intermediate[6:6] = f2h_sdram0_READ[0:0];
assign intermediate[8:8] = f2h_sdram0_clk[0:0];

cyclonev_hps_interface_fpga2sdram f2sdram(
 .cfg_rfifo_cport_map({
    16'b0000000000000000 // 15:0
  })
,.cfg_wfifo_cport_map({
    16'b0001000100010001 // 15:0
  })
,.rd_ready_3({
    1'b1 // 0:0
  })
,.rd_ready_2({
    1'b1 // 0:0
  })
,.cmd_port_clk_1({
    intermediate[19:19] // 0:0
  })
,.rd_ready_1({
    1'b1 // 0:0
  })
,.cmd_port_clk_0({
    intermediate[9:9] // 0:0
  })
,.rd_ready_0({
    1'b1 // 0:0
  })
,.wrack_ready_1({
    1'b1 // 0:0
  })
,.cmd_ready_1({
    intermediate[11:11] // 0:0
  })
,.cmd_ready_0({
    intermediate[1:1] // 0:0
  })
,.cfg_port_width({
    12'b000000001111 // 11:0
  })
,.rd_valid_3({
    f2h_sdram0_READDATAVALID[0:0] // 0:0
  })
,.rd_clk_3({
    intermediate[5:5] // 0:0
  })
,.rd_data_3({
    f2h_sdram0_READDATA[255:192] // 63:0
  })
,.rd_clk_2({
    intermediate[4:4] // 0:0
  })
,.rd_data_2({
    f2h_sdram0_READDATA[191:128] // 63:0
  })
,.rd_clk_1({
    intermediate[3:3] // 0:0
  })
,.rd_data_1({
    f2h_sdram0_READDATA[127:64] // 63:0
  })
,.rd_clk_0({
    intermediate[2:2] // 0:0
  })
,.rd_data_0({
    f2h_sdram0_READDATA[63:0] // 63:0
  })
,.cfg_axi_mm_select({
    6'b000000 // 5:0
  })
,.cmd_valid_1({
    intermediate[17:17] // 0:0
  })
,.cmd_valid_0({
    intermediate[7:7] // 0:0
  })
,.cfg_cport_rfifo_map({
    18'b000000000000000000 // 17:0
  })
,.wr_data_3({
    2'b00 // 89:88
   ,f2h_sdram1_BYTEENABLE[31:24] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram1_WRITEDATA[255:192] // 63:0
  })
,.wr_data_2({
    2'b00 // 89:88
   ,f2h_sdram1_BYTEENABLE[23:16] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram1_WRITEDATA[191:128] // 63:0
  })
,.wr_data_1({
    2'b00 // 89:88
   ,f2h_sdram1_BYTEENABLE[15:8] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram1_WRITEDATA[127:64] // 63:0
  })
,.wr_data_0({
    2'b00 // 89:88
   ,f2h_sdram1_BYTEENABLE[7:0] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram1_WRITEDATA[63:0] // 63:0
  })
,.cfg_cport_type({
    12'b000000000110 // 11:0
  })
,.cfg_cport_wfifo_map({
    18'b000000000000000000 // 17:0
  })
,.wr_clk_3({
    intermediate[15:15] // 0:0
  })
,.wr_clk_2({
    intermediate[14:14] // 0:0
  })
,.wr_clk_1({
    intermediate[13:13] // 0:0
  })
,.wr_clk_0({
    intermediate[12:12] // 0:0
  })
,.cmd_data_1({
    18'b000000000000000000 // 59:42
   ,f2h_sdram1_BURSTCOUNT[7:0] // 41:34
   ,5'b00000 // 33:29
   ,f2h_sdram1_ADDRESS[26:0] // 28:2
   ,intermediate[16:16] // 1:1
   ,1'b0 // 0:0
  })
,.cmd_data_0({
    18'b000000000000000000 // 59:42
   ,f2h_sdram0_BURSTCOUNT[7:0] // 41:34
   ,5'b00000 // 33:29
   ,f2h_sdram0_ADDRESS[26:0] // 28:2
   ,1'b0 // 1:1
   ,intermediate[6:6] // 0:0
  })
);




endmodule 

