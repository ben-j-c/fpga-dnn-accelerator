//Legal Notice: (C)2023 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_fifo_instr_single_clock_fifo (
                                                 // inputs:
                                                  aclr,
                                                  clock,
                                                  data,
                                                  rdreq,
                                                  wrreq,

                                                 // outputs:
                                                  empty,
                                                  full,
                                                  q
                                               )
;

  output           empty;
  output           full;
  output  [ 31: 0] q;
  input            aclr;
  input            clock;
  input   [ 31: 0] data;
  input            rdreq;
  input            wrreq;


wire             empty;
wire             full;
wire    [ 31: 0] q;
  scfifo single_clock_fifo
    (
      .aclr (aclr),
      .clock (clock),
      .data (data),
      .empty (empty),
      .full (full),
      .q (q),
      .rdreq (rdreq),
      .wrreq (wrreq)
    );

  defparam single_clock_fifo.add_ram_output_register = "OFF",
           single_clock_fifo.intended_device_family = "CYCLONEV",
           single_clock_fifo.lpm_numwords = 128,
           single_clock_fifo.lpm_showahead = "OFF",
           single_clock_fifo.lpm_type = "scfifo",
           single_clock_fifo.lpm_width = 32,
           single_clock_fifo.lpm_widthu = 7,
           single_clock_fifo.overflow_checking = "ON",
           single_clock_fifo.underflow_checking = "ON",
           single_clock_fifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_fifo_instr_scfifo_with_controls (
                                                    // inputs:
                                                     clock,
                                                     data,
                                                     rdreq,
                                                     reset_n,
                                                     wrreq,

                                                    // outputs:
                                                     empty,
                                                     full,
                                                     q
                                                  )
;

  output           empty;
  output           full;
  output  [ 31: 0] q;
  input            clock;
  input   [ 31: 0] data;
  input            rdreq;
  input            reset_n;
  input            wrreq;


wire             empty;
wire             full;
wire    [ 31: 0] q;
wire             wrreq_valid;
  //the_scfifo, which is an e_instance
  soc_system_fifo_instr_single_clock_fifo the_scfifo
    (
      .aclr  (~reset_n),
      .clock (clock),
      .data  (data),
      .empty (empty),
      .full  (full),
      .q     (q),
      .rdreq (rdreq),
      .wrreq (wrreq_valid)
    );

  assign wrreq_valid = wrreq & ~full;

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_fifo_instr_map_avalonmm_to_avalonst (
                                                        // inputs:
                                                         avalonmm_data,

                                                        // outputs:
                                                         avalonst_data
                                                      )
;

  output  [ 31: 0] avalonst_data;
  input   [ 31: 0] avalonmm_data;


wire    [ 31: 0] avalonst_data;
  assign avalonst_data[31 : 24] = avalonmm_data[7 : 0];
  assign avalonst_data[23 : 16] = avalonmm_data[15 : 8];
  assign avalonst_data[15 : 8] = avalonmm_data[23 : 16];
  assign avalonst_data[7 : 0] = avalonmm_data[31 : 24];

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_fifo_instr (
                               // inputs:
                                avalonmm_write_slave_address,
                                avalonmm_write_slave_write,
                                avalonmm_write_slave_writedata,
                                avalonst_source_ready,
                                reset_n,
                                wrclock,

                               // outputs:
                                avalonmm_write_slave_waitrequest,
                                avalonst_source_data,
                                avalonst_source_valid
                             )
;

  output           avalonmm_write_slave_waitrequest;
  output  [ 31: 0] avalonst_source_data;
  output           avalonst_source_valid;
  input            avalonmm_write_slave_address;
  input            avalonmm_write_slave_write;
  input   [ 31: 0] avalonmm_write_slave_writedata;
  input            avalonst_source_ready;
  input            reset_n;
  input            wrclock;


wire    [ 31: 0] avalonmm_map_data_in;
wire             avalonmm_write_slave_waitrequest;
wire    [ 31: 0] avalonst_map_data_out;
wire    [ 31: 0] avalonst_source_data;
reg              avalonst_source_valid;
wire             clock;
wire    [ 31: 0] data;
wire             empty;
wire             full;
wire    [ 31: 0] q;
wire             rdreq;
wire             wrreq;
wire             wrreq_driver;
  //the_scfifo_with_controls, which is an e_instance
  soc_system_fifo_instr_scfifo_with_controls the_scfifo_with_controls
    (
      .clock   (clock),
      .data    (data),
      .empty   (empty),
      .full    (full),
      .q       (q),
      .rdreq   (rdreq),
      .reset_n (reset_n),
      .wrreq   (wrreq)
    );

  //in, which is an e_avalon_slave
  assign avalonmm_write_slave_waitrequest = (reset_n == 0) ? 1'b1 : full;
  //the_map_avalonmm_to_avalonst, which is an e_instance
  soc_system_fifo_instr_map_avalonmm_to_avalonst the_map_avalonmm_to_avalonst
    (
      .avalonmm_data (avalonmm_map_data_in),
      .avalonst_data (avalonst_map_data_out)
    );

  assign wrreq_driver = (avalonmm_write_slave_address == 0) & avalonmm_write_slave_write;
  assign avalonmm_map_data_in = avalonmm_write_slave_writedata;
  assign wrreq = wrreq_driver;
  assign data = avalonst_map_data_out;
  assign clock = wrclock;
  assign avalonst_source_data = q;
  assign rdreq = !empty & avalonst_source_ready;
  always @(posedge clock or negedge reset_n)
    begin
      if (reset_n == 0)
          avalonst_source_valid <= 0;
      else 
        avalonst_source_valid <= !empty & avalonst_source_ready;
    end


  //out, which is an e_atlantic_master

endmodule

