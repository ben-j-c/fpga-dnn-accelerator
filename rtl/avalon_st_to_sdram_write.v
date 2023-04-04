`timescale 1 ps / 1 ps
module avalon_st_to_sdram_write (
		input  wire         clock,                //     clock_sink.clk
		input  wire         reset,                //     reset_sink.reset
		output reg  [26:0]  mm_addr,              //  avalon_master.address
		output reg  [31:0]  mm_byteenable,        //               .byteenable
		output reg  [7:0]   mm_burstcount,        //               .burstcount
		output reg          mm_write,             //               .write
		output reg  [255:0] mm_writedata,         //               .writedata
		input  wire         mm_waitrequest,       //               .waitrequest
		input  wire         st_instruction_valid, // st_instruction.valid
		output wire         st_instruction_ready, //               .ready
		input  wire [31:0]  st_instruction_data,  //               .data
		input  wire         st_valid,             //     st_data_in.valid
		input  wire [255:0] st_data,              //               .data
		output wire         st_ready,             //               .ready

		output reg  [31:0]  csr_readdata,
		input  wire [3:0]   csr_address,
		input  wire         csr_read
	);
	// State
	reg [31:0] state;
	reg [31:0] cycle_count;
	localparam STATE_WAITING = 0;
	localparam STATE_WAITING_ACK = 1;
	localparam STATE_WRITING = 2;

	wire [255:0] st_data_swap;
	reg [31:0] counter;

	wire ready_WAITING = (st_instruction_valid && (st_instruction_data != 0) && st_valid && state == STATE_WAITING);
	wire ready_WRITING = (!mm_waitrequest && st_valid && state == STATE_WRITING && cycle_count != 7);
	assign st_ready = ready_WAITING || (ready_WRITING && !mm_waitrequest && cycle_count != 7);
	assign st_instruction_ready = ready_WAITING || (st_instruction_valid && st_instruction_data == 0);
	always @(posedge clock, posedge reset) begin
		if (reset) begin
			state <= 0;
			cycle_count <= 0;
			mm_addr <= 0;
			mm_byteenable <= 0;
			mm_burstcount <= 0;
			mm_write <= 0;
			mm_writedata <= 256'h0;
		end else begin
			if (state == STATE_WAITING) begin
				if (ready_WAITING) begin
					state <= STATE_WRITING;
					
					mm_addr <= st_instruction_data[31:5];
					mm_byteenable <= 32'hFFFF_FFFF;
					mm_burstcount <= 8'd8;
					mm_write <= 1;
					mm_writedata <= st_data_swap;
					counter <= counter + st_data_swap[31:0] + st_data_swap[63:32] + st_data_swap[95:64] + st_data_swap[127:96] + st_data_swap[159:128] + st_data_swap[191:160] + st_data_swap[223:192] + st_data_swap[255:224];

					cycle_count <= 0;
				end
			end else if (state == STATE_WRITING) begin
				if (mm_waitrequest) begin
					
				end else if (cycle_count == 7) begin
					state <= STATE_WAITING;
					cycle_count <= 0;
					mm_write <= 0;
				end else if (st_valid) begin
					cycle_count <= cycle_count + 1;
					mm_write <= 1;
					mm_writedata <= st_data_swap;
					counter <= counter + st_data_swap[31:0] + st_data_swap[63:32] + st_data_swap[95:64] + st_data_swap[127:96] + st_data_swap[159:128] + st_data_swap[191:160] + st_data_swap[223:192] + st_data_swap[255:224];
				end else begin
					mm_write <= 0;
				end
			end
		end
	end

	always @(posedge clock, posedge reset) begin
		if (reset) begin
			csr_readdata <= 0;
		end else if (csr_address == 0) begin
			csr_readdata <= state;
		end else if (csr_address == 4) begin
			csr_readdata <= counter;
		end else if (csr_address == 8) begin
			csr_readdata <= mm_addr;
		end else if (csr_address == 12) begin
			csr_readdata <= {mm_write, mm_waitrequest, 2'b0, st_instruction_valid, st_instruction_ready, 2'b00, st_valid, st_ready};
		end else begin
			csr_readdata <= 32'hDEAD_BEEF;
		end
	end
	genvar ii;
	generate
	for (ii = 0;ii < 256;ii = ii + 8) begin: loop
		assign st_data_swap[ii+7:ii] = st_data[256 - ii - 1:256 - ii - 8];
	end
	endgenerate
endmodule