`timescale 1 ps / 1 ps
module systolic_array_top (
		input  wire reset_sink_reset,
		input  wire clock_sink,

		input  wire [7:0] csr_address,
		input  wire csr_write,
		input  wire [31:0] csr_writedata,
		output wire [31:0] csr_readdata,
		input  wire csr_read,

		output wire [255:0] data_out_data,
		input  wire data_out_ready,
		output reg data_out_valid,

		input  wire [255:0] st_rows_data,
		output wire st_rows_ready,
		input  wire st_rows_valid,

		input  wire [255:0] st_cols_data,
		output wire st_cols_ready,
		input  wire st_cols_valid,

		input  wire [31:0] st_instr_data,
		output wire st_instr_ready,
		input wire st_instr_valid
	);

/*module systolic_array_top (
		input wire reset_sink_reset,
		input wire clock_sink,

		input wire [7:0] csr_address,
		input wire  csr_write,
		input wire [31:0] csr_writedata,
		output wire [31:0] csr_readdata,
		input wire csr_read,

		input wire [255:0] data_in_data,
		output reg data_in_ready,
		input wire data_in_valid,

		output wire [255:0] data_out_data,
		input wire data_out_ready,
		output reg data_out_valid
	);*/
	// CLOCK and RESET settings
	wire CLOCK;
	wire reset;
	assign CLOCK = clock_sink;
	assign reset = reset_sink_reset;

	//Valid states
	localparam STATE_WAITING = 0;
	localparam STATE_READING = 1;
	localparam STATE_COMPUTE = 2;
	localparam STATE_WRITING = 3;
	reg [3:0] state;

	localparam N_CYCLES_FOR_COMPUTE = 32;

	// Instruction register
	reg [31:0] instr_n_cols;
	reg [31:0] instr_n_rows;

	// Additional control signals
	reg [31:0] cycle_count;
	reg mult_over;
	reg data_in_ready;
	wire data_in_valid;

	// Fusing streaming interfaces
	assign data_in_valid = st_cols_valid && st_rows_valid;
	assign st_cols_ready = data_in_ready && (cycle_count < instr_n_cols);
	assign st_rows_ready = data_in_ready && (cycle_count < instr_n_rows);

	wire [255:0] in_col;
	wire [255:0] in_row;
	systolic_32x32_buffered compute(
		.CLOCK(CLOCK),
		.reset(reset || (state == STATE_WAITING)),
		.input_valid(data_in_valid && data_in_ready),
		.backpressure(!data_out_ready),

		.in_col(in_col),
		.in_row(in_row),
		.out_data(data_out_data)
	);

	assign st_instr_ready = (state == STATE_WAITING);
	assign in_col = (state == STATE_READING && cycle_count < instr_n_cols)? st_cols_data : 0;
	assign in_row = (state == STATE_READING && cycle_count < instr_n_rows)? st_rows_data : 0;
	always @ (posedge CLOCK, posedge reset) begin
		if (reset) begin
			instr_n_cols <= 0;
			instr_n_rows <= 0;
			mult_over <= 0;
			data_out_valid <= 0;
			data_in_ready <= 0;
			cycle_count <= 0;
		end
		else begin
			if (state == STATE_WAITING) begin
				if (st_instr_valid) begin
					state <= STATE_READING;

					instr_n_cols <= {27'b0 , st_instr_data[4:0]};
					instr_n_rows <= {27'b0 , st_instr_data[9:5]};

					mult_over <= 0;
					data_out_valid <= 0;
					data_in_ready <= 1;
					cycle_count <= 0;
				end
			end else if (state == STATE_READING) begin
				if (data_in_valid) begin
					cycle_count <= cycle_count + 1;
					if (cycle_count == (instr_n_cols < instr_n_rows? instr_n_cols : instr_n_rows) - 1) begin
						state <= STATE_COMPUTE;
						mult_over <= 0;
						data_in_ready <= 0;
						data_in_ready <= 0;
						cycle_count <= 0;
					end
				end
			end else if (state == STATE_COMPUTE) begin
				cycle_count <= cycle_count + 1;
				if (cycle_count == N_CYCLES_FOR_COMPUTE - 1) begin
					state <= STATE_WRITING;
					mult_over <= 1;
					data_out_valid <= 1;
					data_in_ready <= 0;
					cycle_count <= 0;
				end
			end else if (state == STATE_WRITING) begin
				if (data_out_ready) begin
					cycle_count <= cycle_count + 1;
					if (cycle_count == instr_n_cols - 1) begin
						state <= STATE_WAITING;
						mult_over <= 1;
						data_out_valid <= 0;
						data_in_ready <= 0;
						cycle_count <= 0;
					end
				end
			end
		end
	end	
	assign csr_readdata = 0;

endmodule

module systolic_16x16_buffered(
	input CLOCK,
	input reset,
	input input_valid,
	input backpressure,
	
	input mult_over,
	input [127:0] in_col,
	input [127:0] in_row,
	output [127:0] out_data
);
	wire [127:0] delay_row;
	wire [127:0] delay_col;
	
	assign delay_col[7:0] = in_col[7:0];
	assign delay_row[7:0] = in_row[7:0];
	genvar i;
	generate
		for (i = 1; i < 16; i = i + 1) begin: delay_data
			wide_delay #(i) d_col(
				.CLOCK(CLOCK),
				.en(input_valid && !backpressure),
				.reset(reset),
				.in(in_col[(i+1)*8-1:i*8]),
				.out(delay_col[(i+1)*8-1:i*8])
			);
			wide_delay #(i) d_row(
				.CLOCK(CLOCK),
				.en(input_valid && !backpressure),
				.reset(reset),
				.in(in_row[(i+1)*8-1:i*8]),
				.out(delay_row[(i+1)*8-1:i*8])
			);
		end
	endgenerate
	
	systolic_16x16 sys_mod0(
		.CLOCK(CLOCK),
		.input_valid(input_valid && !backpressure),
		.reset(reset),
		.mult_over(mult_over),
	
		.in_col(delay_col),
		.in_row(delay_row),
		.in_data(0),
		
		.out_data(out_data)
	);
endmodule

module systolic_32x32_buffered(
	input CLOCK,
	input reset,
	input input_valid,
	input backpressure,
	
	input mult_over,
	input [255:0] in_col,
	input [255:0] in_row,
	output [255:0] out_data
);
	wire [255:0] delay_row;
	wire [255:0] delay_col;
	
	assign delay_col[7:0] = in_col[7:0];
	assign delay_row[7:0] = in_row[7:0];
	genvar i;
	generate
		for (i = 1; i < 32; i = i + 1) begin: delay_data
			wide_delay #(i) d_col(
				.CLOCK(CLOCK),
				.en(input_valid && !backpressure),
				.reset(reset),
				.in(in_col[(i+1)*8-1:i*8]),
				.out(delay_col[(i+1)*8-1:i*8])
			);
			wide_delay #(i) d_row(
				.CLOCK(CLOCK),
				.en(input_valid && !backpressure),
				.reset(reset),
				.in(in_row[(i+1)*8-1:i*8]),
				.out(delay_row[(i+1)*8-1:i*8])
			);
		end
	endgenerate
	
	systolic_32x32 sys_mod0(
		.CLOCK(CLOCK),
		.input_valid(input_valid && !backpressure),
		.reset(reset),
		.mult_over(mult_over),
	
		.in_col(delay_col),
		.in_row(delay_row),
		.in_data(0),
		
		.out_data(out_data)
	);
endmodule

module wide_delay
#(
	parameter DEPTH = 1,
	parameter DATA_WIDTH = 8
)
(
	input CLOCK,
	input en,
	input reset,

	input [DATA_WIDTH-1:0] in,
	output [DATA_WIDTH-1:0] out
);
	
	reg [DATA_WIDTH-1:0] delay [DEPTH-1:0];
	assign out = delay[DEPTH-1];
	
	integer idx;
	generate
	always @ (posedge CLOCK, posedge reset) begin
		if (reset) begin
			for (idx = 0; idx < DEPTH; idx = idx + 1) begin
				delay[idx] <= 0;
			end
		end
		else if (en) begin
			delay[0] <= in;
			for (idx = 1; idx < DEPTH; idx = idx + 1) begin : delay_line
				delay[idx] <= delay[idx-1];
			end
		end
	end
	endgenerate

endmodule
