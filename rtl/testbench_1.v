`timescale 1ps/1ps

module tb;
	reg reset_sink_reset;
	reg clock_sink;
	reg [7:0] csr_address;
	reg csr_write;
	reg [31:0] csr_writedata;
	wire [31:0] csr_readdata;
	reg csr_read;
	wire [255:0] data_out_data;
	reg data_out_ready;
	wire data_out_valid;

	wire [255:0] st_rows_data;
	wire st_rows_ready;
	wire st_rows_valid;

	wire [255:0] st_cols_data;
	wire st_cols_ready;
	wire st_cols_valid;

	reg [31:0] st_instr_data;
	wire st_instr_ready;
	reg st_instr_valid;

	reg [255:0] col_data [31:0];
	reg [255:0] row_data [31:0];
	
	systolic_array_top top(
		.reset_sink_reset(reset_sink_reset),
		.clock_sink(clock_sink),
		.csr_address(csr_address),
		.csr_write(csr_write),
		.csr_writedata(csr_writedata),
		.csr_readdata(csr_readdata),
		.csr_read(csr_read),
		.data_out_data(data_out_data),
		.data_out_ready(data_out_ready),
		.data_out_valid(data_out_valid),
		.st_rows_data(st_rows_data),
		.st_rows_ready(st_rows_ready),
		.st_rows_valid(st_rows_valid),
		.st_cols_data(st_cols_data),
		.st_cols_ready(st_cols_ready),
		.st_cols_valid(st_cols_valid),
		.st_instr_data(st_instr_data),
		.st_instr_ready(st_instr_ready),
		.st_instr_valid(st_instr_valid)
	);

	integer col_file;
	integer row_file;

	integer i;
	integer j;
	integer idx;
	generate
	initial begin
		for (idx = 0;idx < 32;idx = idx + 1) begin: outer_loop
			row_data[idx] <= {8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01};
		end
		col_data[0] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1 };
		col_data[1] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0 };
		col_data[2] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0 };
		col_data[3] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd3, 8'd1, 8'd0, 8'd0 };
		col_data[4] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd3, 8'd1, 8'd0, 8'd0, 8'd0 };
		col_data[5] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd3, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[6] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd3, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[7] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[8] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd4, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[9] <=  { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd4, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[10] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd5, 8'd4, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[11] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd5, 8'd5, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[12] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd5, 8'd5, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[13] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd5, 8'd5, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[14] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd5, 8'd5, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[15] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd5, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[16] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd6, 8'd5, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[17] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd6, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[18] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd6, 8'd1, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[19] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd6, 8'd6, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[20] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd6, 8'd6, 8'd6, 8'd0, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[21] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd7, 8'd6, 8'd6, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[22] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd7, 8'd7, 8'd6, 8'd1, 8'd0, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[23] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd7, 8'd7, 8'd7, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[24] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd7, 8'd7, 8'd7, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[25] <= { 8'd1, 8'd5, 8'd0, 8'd0, 8'd0, 8'd0, 8'd7, 8'd7, 8'd7, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[26] <= { 8'd1, 8'd5, 8'd0, 8'd0, 8'd0, 8'd7, 8'd7, 8'd7, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[27] <= { 8'd1, 8'd5, 8'd0, 8'd0, 8'd7, 8'd7, 8'd7, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[28] <= { 8'd1, 8'd5, 8'd8, 8'd8, 8'd7, 8'd7, 8'd2, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[29] <= { 8'd1, 8'd5, 8'd8, 8'd8, 8'd7, 8'd6, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[30] <= { 8'd1, 8'd8, 8'd8, 8'd8, 8'd7, 8'd0, 8'd1, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[31] <= { 8'd1, 8'd0, 8'd6, 8'd5, 8'd0, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		i = 0;
		j = 0;
	end
	endgenerate

	assign st_cols_valid = i < 32;
	assign st_rows_valid = j < 32;
	assign st_cols_data = i < 32 ? col_data[i] : 256'b0;
	assign st_rows_data = j < 32 ? row_data[j] : 256'b0;
	always @(posedge clock_sink) begin
		if (!reset_sink_reset) begin
			if (st_cols_ready) begin
				i = i + 1;
			end
			if (st_rows_ready) begin
				j = j + 1;
			end
			if (st_instr_ready) begin
				st_instr_valid <= 0;
			end
		end
	end

	initial begin
		reset_sink_reset <= 1;
		clock_sink <= 0;

		csr_address <= 0;
		csr_write <= 0;
		csr_writedata <= 0;
		csr_read <= 0;

		data_out_ready <= 1;

		st_instr_data <= 32'h00_02_00_20;
		st_instr_valid <= 1;

		#200 reset_sink_reset <= 0;
	end
	always begin
		#50 clock_sink <= ~clock_sink;
	end
endmodule