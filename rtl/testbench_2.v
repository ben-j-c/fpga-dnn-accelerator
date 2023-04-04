`timescale 1ps/1ps

module tb2;
	reg clock;
	reg reset;

	wire [26:0] mm_addr;
	wire mm_byteenable;
	wire [7:0] mm_burstcount;
	wire mm_write;
	wire [255:0] mm_writedata;
	reg mm_waitrequest;

	reg st_instruction_valid;
	wire st_instruction_ready;
	reg [31:0] st_instruction_data;
	wire st_valid;
	wire st_ready;
	wire [255:0] st_data;

	reg [255:0] data[7:0];

	avalon_st_to_sdram_write m0(
		.clock(clock),
		.reset(reset),
		.mm_addr(mm_addr),
		.mm_byteenable(mm_byteenable),
		.mm_burstcount(mm_burstcount),
		.mm_write(mm_write),
		.mm_writedata(mm_writedata),
		.mm_waitrequest(mm_waitrequest),
		.st_instruction_valid(st_instruction_valid),
		.st_instruction_ready(st_instruction_ready),
		.st_instruction_data(st_instruction_data),
		.st_valid(st_valid),
		.st_ready(st_ready),
		.st_data(st_data)
	);

	integer idx;
	reg[31:0] cc;
	initial begin
		idx <= 0;
		st_instruction_valid <= 0;
		st_instruction_data <= 0;
		mm_waitrequest <= 0;
		cc <= 0;
		data[0] <= 256'h012345678abcdef_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[1] <= 256'h111111111111111_1111111111111111_11111111_11111111_11111111_11111111;
		data[2] <= 256'h222222222222222_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[3] <= 256'h333333333333333_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[4] <= 256'h444444444444444_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[5] <= 256'h555555555555555_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[6] <= 256'h666666666666666_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		data[7] <= 256'h777777777777777_0123456789abcdef_deadbeef_deadbeef_deadbeef_deadbeef;
		clock <= 0;
		reset <= 1;
		#100 reset <= 0;
		#100 
		st_instruction_valid <= 1;
		st_instruction_data <= 32'b111_0110_1011_1010_1001_1000_0111_00000;
		#100 
		mm_waitrequest <= 1;
		#100
		mm_waitrequest <= 0;
	end

	assign st_data = data[idx];
	assign st_valid = (cc < 5 || |(cc & 32'b100)) && idx < 8;
	always @(posedge clock, posedge reset) begin
		if (!reset) begin
			cc <= cc + 1;
			if (st_instruction_ready) begin
				st_instruction_valid <= 0;
			end
			if (st_ready && st_valid) begin
				idx <= idx + 1;
			end
		end
	end

	always begin
		#50 clock <= ~clock;
	end
endmodule