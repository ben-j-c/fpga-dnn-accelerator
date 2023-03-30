`timescale 1ps/1ps

module tb;
	reg reset_sink_reset;
	reg clock_sink;
	reg [7:0] csr_address;
	reg csr_write;
	reg [31:0] csr_writedata;
	wire [31:0] csr_readdata;
	reg csr_read;
	wire [127:0] data_out_data;
	reg data_out_ready;
	wire data_out_valid;

	wire [127:0] st_rows_data;
	wire st_rows_ready;
	wire st_rows_valid;

	wire [127:0] st_cols_data;
	wire st_cols_ready;
	wire st_cols_valid;

	reg [31:0] st_instr_data;
	wire st_instr_ready;
	reg st_instr_valid;

	reg [127:0] col_data [15:0];
	reg [127:0] row_data [15:0];
	
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
		for (idx = 0;idx < 16;idx = idx + 1) begin: outer_loop
			row_data[idx] <= { 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01, 8'b01};
		end
		col_data[00] <= { 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[01] <= { 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[02] <= { 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[03] <= { 8'd0, 8'd0, 8'd1, 8'd3, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[04] <= { 8'd0, 8'd0, 8'd0, 8'd1, 8'd3, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[05] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd3, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[06] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd3, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[07] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[08] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd4, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[09] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd4, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[10] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd4, 8'd5, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[11] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd5, 8'd5, 8'd0, 8'd0, 8'd0, 8'd0 };
		col_data[12] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd1, 8'd5, 8'd5, 8'd0, 8'd0, 8'd0 };
		col_data[13] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd5, 8'd5, 8'd0, 8'd0 };
		col_data[14] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd1, 8'd5, 8'd5, 8'd0 };
		col_data[15] <= { 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd1, 8'd5, 8'd6 };
		i = 0;
		j = 0;
	end
	endgenerate

	assign st_cols_valid = i < 16;
	assign st_rows_valid = j < 16;
	assign st_cols_data = i < 16 ? col_data[i] : 128'b0;
	assign st_rows_data = j < 16 ? row_data[j] : 128'b0;
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

		st_instr_data <= 32'h00_01_00_10;
		st_instr_valid <= 1;

		#200 reset_sink_reset <= 0;
	end
	always begin
		#50 clock_sink <= ~clock_sink;
	end
endmodule