
module systolic_1x1(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,

	input [7:0] in_col,
	input [7:0] in_row,
	input [7:0] in_data,
	
	output reg [7:0] out_col,
	output reg [7:0] out_row,
	output reg [7:0] out_data
);
	reg [7:0] mac;
	wire [7:0] mac_next;
	assign mac_next = mac + out_col * out_row;
	always @ (posedge CLOCK, posedge reset) begin
		if (reset) begin
			out_col <= 0;
			out_row <= 0;
			out_data <= 0;
			mac <= 0;
		end
		else if (input_valid) begin
			mac <= mac_next;
			out_col <= in_col;
			out_row <= in_row;
			out_data <= mult_over? in_data : mac_next;
		end
	end
endmodule

module systolic_2x2(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,
	
	input [15:0] in_col,
	input [15:0] in_row,
	input [15:0] in_data,
	
	output [15:0] out_col,
	output [15:0] out_row,
	output [15:0] out_data
);
	wire [15:0] internal_col;
	wire [15:0] internal_row;
	wire [15:0] internal_data;
	systolic_1x1 m00(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[7:0]),
		.in_row(in_row[7:0]),
		.in_data(internal_data[7:0]),
		
		.out_col(internal_col[7:0]),
		.out_row(internal_row[7:0]),
		.out_data(out_data[7:0])
	);
	systolic_1x1 m10(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[7:0]),
		.in_row(in_row[15:8]),
		.in_data(internal_data[15:8]),
		
		.out_col(out_col[7:0]),
		.out_row(internal_row[15:8]),
		.out_data(out_data[15:8])
	);
	systolic_1x1 m01(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[15:8]),
		.in_row(internal_row[7:0]),
		.in_data(in_data[7:0]),
		
		.out_col(internal_col[15:8]),
		.out_row(out_row[7:0]),
		.out_data(internal_data[7:0])
	);
	systolic_1x1 m11(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[15:8]),
		.in_row(internal_row[15:8]),
		.in_data(in_data[15:8]),
		
		.out_col(out_col[15:8]),
		.out_row(out_row[15:8]),
		.out_data(internal_data[15:8])
	);
	
endmodule

module systolic_4x4(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,
	
	input [31:0] in_col,
	input [31:0] in_row,
	input [31:0] in_data,
	
	output [31:0] out_col,
	output [31:0] out_row,
	output [31:0] out_data
);
	wire [31:0] internal_col;
	wire [31:0] internal_row;
	wire [31:0] internal_data;
	systolic_2x2 m00(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[15:0]),
		.in_row(in_row[15:0]),
		.in_data(internal_data[15:0]),
		
		.out_col(internal_col[15:0]),
		.out_row(internal_row[15:0]),
		.out_data(out_data[15:0])
	);
	systolic_2x2 m10(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[15:0]),
		.in_row(in_row[15:8]),
		.in_data(internal_data[31:16]),
		
		.out_col(out_col[15:0]),
		.out_row(internal_row[31:16]),
		.out_data(out_data[31:16])
	);
	systolic_2x2 m01(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[31:16]),
		.in_row(internal_row[15:0]),
		.in_data(in_data[15:0]),
		
		.out_col(internal_col[31:16]),
		.out_row(out_row[15:0]),
		.out_data(internal_data[15:0])
	);
	systolic_2x2 m11(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[31:16]),
		.in_row(internal_row[31:16]),
		.in_data(in_data[31:16]),
		
		.out_col(out_col[31:16]),
		.out_row(out_row[31:16]),
		.out_data(internal_data[31:16])
	);
endmodule

module systolic_8x8(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,
	
	input [63:0] in_col,
	input [63:0] in_row,
	input [63:0] in_data,
	
	output [63:0] out_col,
	output [63:0] out_row,
	output [63:0] out_data
);
	wire [63:0] internal_col;
	wire [63:0] internal_row;
	wire [63:0] internal_data;
	systolic_4x4 m00(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[31:0]),
		.in_row(in_row[31:0]),
		.in_data(internal_data[31:0]),
		
		.out_col(internal_col[31:0]),
		.out_row(internal_row[31:0]),
		.out_data(out_data[31:0])
	);
	systolic_2x2 m10(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[31:0]),
		.in_row(in_row[63:32]),
		.in_data(internal_data[63:32]),
		
		.out_col(out_col[31:0]),
		.out_row(internal_row[63:32]),
		.out_data(out_data[63:32])
	);
	systolic_4x4 m01(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[63:32]),
		.in_row(internal_row[31:0]),
		.in_data(in_data[31:0]),
		
		.out_col(internal_col[63:32]),
		.out_row(out_row[31:0]),
		.out_data(internal_data[31:0])
	);
	systolic_4x4 m11(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[63:32]),
		.in_row(internal_row[63:32]),
		.in_data(in_data[63:32]),
		
		.out_col(out_col[63:32]),
		.out_row(out_row[63:32]),
		.out_data(internal_data[63:32])
	);
endmodule

module systolic_16x16(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,
	
	input [127:0] in_col,
	input [127:0] in_row,
	input [127:0] in_data,
	
	output [127:0] out_col,
	output [127:0] out_row,
	output [127:0] out_data
);
	wire [127:0] internal_col;
	wire [127:0] internal_row;
	wire [127:0] internal_data;
	systolic_8x8 m00(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[63:0]),
		.in_row(in_row[63:0]),
		.in_data(internal_data[63:0]),
		
		.out_col(internal_col[63:0]),
		.out_row(internal_row[63:0]),
		.out_data(out_data[63:0])
	);
	systolic_8x8 m10(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[63:0]),
		.in_row(in_row[127:64]),
		.in_data(internal_data[127:64]),
		
		.out_col(out_col[63:0]),
		.out_row(internal_row[127:64]),
		.out_data(out_data[127:64])
	);
	systolic_8x8 m01(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[127:64]),
		.in_row(internal_row[63:0]),
		.in_data(in_data[63:0]),
		
		.out_col(internal_col[127:64]),
		.out_row(out_row[63:0]),
		.out_data(internal_data[63:0])
	);
	systolic_8x8 m11(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[127:64]),
		.in_row(internal_row[127:64]),
		.in_data(in_data[127:64]),
		
		.out_col(out_col[127:64]),
		.out_row(out_row[127:64]),
		.out_data(internal_data[127:64])
	);
endmodule

module systolic_32x32(
	input CLOCK,
	input input_valid,
	input reset,
	input mult_over,
	
	input [255:0] in_col,
	input [255:0] in_row,
	input [255:0] in_data,
	
	output [255:0] out_col,
	output [255:0] out_row,
	output [255:0] out_data
);
	wire [255:0] internal_col;
	wire [255:0] internal_row;
	wire [255:0] internal_data;
	systolic_16x16 m00(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[127:0]),
		.in_row(in_row[127:0]),
		.in_data(internal_data[127:0]),
		
		.out_col(internal_col[127:0]),
		.out_row(internal_row[127:0]),
		.out_data(out_data[127:0])
	);
	systolic_16x16 m10(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[127:0]),
		.in_row(in_row[255:128]),
		.in_data(internal_data[255:128]),
		
		.out_col(out_col[127:0]),
		.out_row(internal_row[255:128]),
		.out_data(out_data[255:128])
	);
	systolic_16x16 m01(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(in_col[255:128]),
		.in_row(internal_row[127:0]),
		.in_data(in_data[127:0]),
		
		.out_col(internal_col[255:128]),
		.out_row(out_row[127:0]),
		.out_data(internal_data[127:0])
	);
	systolic_16x16 m11(
		.CLOCK(CLOCK),
		.input_valid(input_valid),
		.reset(reset),
		.mult_over(mult_over),
		
		.in_col(internal_col[255:128]),
		.in_row(internal_row[255:128]),
		.in_data(in_data[255:128]),
		
		.out_col(out_col[255:128]),
		.out_row(out_row[255:128]),
		.out_data(internal_data[255:128])
	);
endmodule