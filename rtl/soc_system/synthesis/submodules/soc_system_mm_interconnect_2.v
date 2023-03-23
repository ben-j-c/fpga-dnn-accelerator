// soc_system_mm_interconnect_2.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 22.1 915

`timescale 1 ps / 1 ps
module soc_system_mm_interconnect_2 (
		input  wire         clock_bridge_0_out_clk_clk,                                         //                                       clock_bridge_0_out_clk.clk
		input  wire         hps_0_f2h_sdram1_data_translator_reset_reset_bridge_in_reset_reset, // hps_0_f2h_sdram1_data_translator_reset_reset_bridge_in_reset.reset
		input  wire         msgdma_write_reset_n_reset_bridge_in_reset_reset,                   //                   msgdma_write_reset_n_reset_bridge_in_reset.reset
		input  wire [31:0]  msgdma_write_mm_write_address,                                      //                                        msgdma_write_mm_write.address
		output wire         msgdma_write_mm_write_waitrequest,                                  //                                                             .waitrequest
		input  wire [7:0]   msgdma_write_mm_write_burstcount,                                   //                                                             .burstcount
		input  wire [31:0]  msgdma_write_mm_write_byteenable,                                   //                                                             .byteenable
		input  wire         msgdma_write_mm_write_write,                                        //                                                             .write
		input  wire [255:0] msgdma_write_mm_write_writedata,                                    //                                                             .writedata
		output wire [26:0]  hps_0_f2h_sdram1_data_address,                                      //                                        hps_0_f2h_sdram1_data.address
		output wire         hps_0_f2h_sdram1_data_write,                                        //                                                             .write
		output wire [255:0] hps_0_f2h_sdram1_data_writedata,                                    //                                                             .writedata
		output wire [7:0]   hps_0_f2h_sdram1_data_burstcount,                                   //                                                             .burstcount
		output wire [31:0]  hps_0_f2h_sdram1_data_byteenable,                                   //                                                             .byteenable
		input  wire         hps_0_f2h_sdram1_data_waitrequest                                   //                                                             .waitrequest
	);

	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_waitrequest;   // hps_0_f2h_sdram1_data_translator:uav_waitrequest -> msgdma_write_mm_write_translator:uav_waitrequest
	wire  [255:0] msgdma_write_mm_write_translator_avalon_universal_master_0_readdata;      // hps_0_f2h_sdram1_data_translator:uav_readdata -> msgdma_write_mm_write_translator:uav_readdata
	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_debugaccess;   // msgdma_write_mm_write_translator:uav_debugaccess -> hps_0_f2h_sdram1_data_translator:uav_debugaccess
	wire   [31:0] msgdma_write_mm_write_translator_avalon_universal_master_0_address;       // msgdma_write_mm_write_translator:uav_address -> hps_0_f2h_sdram1_data_translator:uav_address
	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_read;          // msgdma_write_mm_write_translator:uav_read -> hps_0_f2h_sdram1_data_translator:uav_read
	wire   [31:0] msgdma_write_mm_write_translator_avalon_universal_master_0_byteenable;    // msgdma_write_mm_write_translator:uav_byteenable -> hps_0_f2h_sdram1_data_translator:uav_byteenable
	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_readdatavalid; // hps_0_f2h_sdram1_data_translator:uav_readdatavalid -> msgdma_write_mm_write_translator:uav_readdatavalid
	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_lock;          // msgdma_write_mm_write_translator:uav_lock -> hps_0_f2h_sdram1_data_translator:uav_lock
	wire          msgdma_write_mm_write_translator_avalon_universal_master_0_write;         // msgdma_write_mm_write_translator:uav_write -> hps_0_f2h_sdram1_data_translator:uav_write
	wire  [255:0] msgdma_write_mm_write_translator_avalon_universal_master_0_writedata;     // msgdma_write_mm_write_translator:uav_writedata -> hps_0_f2h_sdram1_data_translator:uav_writedata
	wire   [12:0] msgdma_write_mm_write_translator_avalon_universal_master_0_burstcount;    // msgdma_write_mm_write_translator:uav_burstcount -> hps_0_f2h_sdram1_data_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (32),
		.AV_DATA_W                   (256),
		.AV_BURSTCOUNT_W             (8),
		.AV_BYTEENABLE_W             (32),
		.UAV_ADDRESS_W               (32),
		.UAV_BURSTCOUNT_W            (13),
		.USE_READ                    (0),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (0),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (32),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (1),
		.UAV_CONSTANT_BURST_BEHAVIOR (1),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) msgdma_write_mm_write_translator (
		.clk                    (clock_bridge_0_out_clk_clk),                                               //                       clk.clk
		.reset                  (msgdma_write_reset_n_reset_bridge_in_reset_reset),                         //                     reset.reset
		.uav_address            (msgdma_write_mm_write_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (msgdma_write_mm_write_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (msgdma_write_mm_write_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (msgdma_write_mm_write_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (msgdma_write_mm_write_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (msgdma_write_mm_write_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (msgdma_write_mm_write_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (msgdma_write_mm_write_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (msgdma_write_mm_write_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (msgdma_write_mm_write_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (msgdma_write_mm_write_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (msgdma_write_mm_write_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (msgdma_write_mm_write_waitrequest),                                        //                          .waitrequest
		.av_burstcount          (msgdma_write_mm_write_burstcount),                                         //                          .burstcount
		.av_byteenable          (msgdma_write_mm_write_byteenable),                                         //                          .byteenable
		.av_write               (msgdma_write_mm_write_write),                                              //                          .write
		.av_writedata           (msgdma_write_mm_write_writedata),                                          //                          .writedata
		.av_beginbursttransfer  (1'b0),                                                                     //               (terminated)
		.av_begintransfer       (1'b0),                                                                     //               (terminated)
		.av_chipselect          (1'b0),                                                                     //               (terminated)
		.av_read                (1'b0),                                                                     //               (terminated)
		.av_readdata            (),                                                                         //               (terminated)
		.av_readdatavalid       (),                                                                         //               (terminated)
		.av_lock                (1'b0),                                                                     //               (terminated)
		.av_debugaccess         (1'b0),                                                                     //               (terminated)
		.uav_clken              (),                                                                         //               (terminated)
		.av_clken               (1'b1),                                                                     //               (terminated)
		.uav_response           (2'b00),                                                                    //               (terminated)
		.av_response            (),                                                                         //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                     //               (terminated)
		.av_writeresponsevalid  ()                                                                          //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (27),
		.AV_DATA_W                      (256),
		.UAV_DATA_W                     (256),
		.AV_BURSTCOUNT_W                (8),
		.AV_BYTEENABLE_W                (32),
		.UAV_BYTEENABLE_W               (32),
		.UAV_ADDRESS_W                  (32),
		.UAV_BURSTCOUNT_W               (13),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (32),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) hps_0_f2h_sdram1_data_translator (
		.clk                    (clock_bridge_0_out_clk_clk),                                                                                                                                                                                                                                            //                      clk.clk
		.reset                  (hps_0_f2h_sdram1_data_translator_reset_reset_bridge_in_reset_reset),                                                                                                                                                                                                    //                    reset.reset
		.uav_address            (msgdma_write_mm_write_translator_avalon_universal_master_0_address),                                                                                                                                                                                                    // avalon_universal_slave_0.address
		.uav_burstcount         (msgdma_write_mm_write_translator_avalon_universal_master_0_burstcount),                                                                                                                                                                                                 //                         .burstcount
		.uav_read               (msgdma_write_mm_write_translator_avalon_universal_master_0_read),                                                                                                                                                                                                       //                         .read
		.uav_write              (msgdma_write_mm_write_translator_avalon_universal_master_0_write),                                                                                                                                                                                                      //                         .write
		.uav_waitrequest        (msgdma_write_mm_write_translator_avalon_universal_master_0_waitrequest),                                                                                                                                                                                                //                         .waitrequest
		.uav_readdatavalid      (msgdma_write_mm_write_translator_avalon_universal_master_0_readdatavalid),                                                                                                                                                                                              //                         .readdatavalid
		.uav_byteenable         (msgdma_write_mm_write_translator_avalon_universal_master_0_byteenable),                                                                                                                                                                                                 //                         .byteenable
		.uav_readdata           (msgdma_write_mm_write_translator_avalon_universal_master_0_readdata),                                                                                                                                                                                                   //                         .readdata
		.uav_writedata          (msgdma_write_mm_write_translator_avalon_universal_master_0_writedata),                                                                                                                                                                                                  //                         .writedata
		.uav_lock               (msgdma_write_mm_write_translator_avalon_universal_master_0_lock),                                                                                                                                                                                                       //                         .lock
		.uav_debugaccess        (msgdma_write_mm_write_translator_avalon_universal_master_0_debugaccess),                                                                                                                                                                                                //                         .debugaccess
		.av_address             (hps_0_f2h_sdram1_data_address),                                                                                                                                                                                                                                         //      avalon_anti_slave_0.address
		.av_write               (hps_0_f2h_sdram1_data_write),                                                                                                                                                                                                                                           //                         .write
		.av_writedata           (hps_0_f2h_sdram1_data_writedata),                                                                                                                                                                                                                                       //                         .writedata
		.av_burstcount          (hps_0_f2h_sdram1_data_burstcount),                                                                                                                                                                                                                                      //                         .burstcount
		.av_byteenable          (hps_0_f2h_sdram1_data_byteenable),                                                                                                                                                                                                                                      //                         .byteenable
		.av_waitrequest         (hps_0_f2h_sdram1_data_waitrequest),                                                                                                                                                                                                                                     //                         .waitrequest
		.av_read                (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_readdata            (256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011011110101011011101111010101101), //              (terminated)
		.av_begintransfer       (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_beginbursttransfer  (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_readdatavalid       (1'b0),                                                                                                                                                                                                                                                                  //              (terminated)
		.av_writebyteenable     (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_lock                (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_chipselect          (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_clken               (),                                                                                                                                                                                                                                                                      //              (terminated)
		.uav_clken              (1'b0),                                                                                                                                                                                                                                                                  //              (terminated)
		.av_debugaccess         (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_outputenable        (),                                                                                                                                                                                                                                                                      //              (terminated)
		.uav_response           (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_response            (2'b00),                                                                                                                                                                                                                                                                 //              (terminated)
		.uav_writeresponsevalid (),                                                                                                                                                                                                                                                                      //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                                                                                                                                                                                                                   //              (terminated)
	);

endmodule
