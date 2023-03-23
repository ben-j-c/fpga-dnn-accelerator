module memory_burst_processor(
	input CLOCK,
	input reset_n,
	input [31:0] in_count,
	
	output reg fifo_in_read,
	input [63:0] fifo_in_readdata,
	input fifo_in_waitrequest,
	
	output reg fifo_out_write,
	output reg [63:0] fifo_out_writedata,
	input fifo_out_waitrequest,
	
	output reg [26:0] sdram0_data_address,
	output reg [7:0] sdram0_data_burstcount,
	input sdram0_data_waitrequest,
	input [255:0] sdram0_data_readdata,
	input wire sdram0_data_readdatavalid,
	output reg sdram0_data_read,
	
	output reg is_reading,
	
	input [26:0] sdram1_data_address,
	input [7:0]	sdram1_data_burstcount,
	output sdram1_data_waitrequest,
	input [255:0] sdram1_data_writedata,
	input [31:0] sdram1_data_byteenable,
	input sdram1_data_write,
	
	input [31:0] b_cols,
	input [31:0] b_rows,
	input [31:0] a_cols,
	input [31:0] a_rows
	);
	localparam BYTES_PER_ADDR = 32;
	localparam BURST_N = 128;
	reg [31:0] read_addr;
	reg [31:0] read_size;
	reg [31:0] read_count;
	reg [31:0] burst_count;
	reg [31:0] sum;
	wire [31:0] sum_next;
	
	wire [127:0] systolic_out_data;
	systolic_16x16 systolic_inst(
		.CLOCK(CLOCK),
		.input_valid(sdram0_data_readdatavalid),
		.reset(!reset_n),
		.mult_over(0),
		.in_col(sdram0_data_readdata[255:128]),
		.in_row(sdram0_data_readdata[127:0]),
		.in_data(0),
		.out_data(systolic_out_data),
	);
	always @(posedge CLOCK, negedge reset_n) begin
		if (!reset_n) begin
			read_addr <= 0;
			read_size <= 0;
			read_count <= 0;
			burst_count <= 0;
			is_reading <= 0;
			sum <= 0;
			
			sdram0_data_address <= 0;
			sdram0_data_burstcount <= 0;
			sdram0_data_read <= 0;
			
			fifo_in_read <= 0;
			fifo_out_write <= 0;
		end else begin
			if (fifo_out_write && !fifo_out_waitrequest) begin
				fifo_out_write <= 0;
			end
			if (sdram0_data_read && !sdram0_data_waitrequest) begin
				sdram0_data_read <= 0;
			end
			if (!is_reading) begin
				fifo_in_read <= 1;
			end
			if ((fifo_in_read && !fifo_in_waitrequest && fifo_in_readdata != 0)) begin
				read_addr <= fifo_in_readdata[31:0] / BYTES_PER_ADDR;
				read_size <= fifo_in_readdata[63:32] / BYTES_PER_ADDR;
				read_count <= 0;
				burst_count <= 0;
				is_reading <= 1;
				sum <= 0;
	
				sdram0_data_address <= fifo_in_readdata[31:0] / BYTES_PER_ADDR;
				sdram0_data_burstcount <= 128;
				sdram0_data_read <= 1;
			
				fifo_out_writedata <= {32'h0000_0000, in_count};
				fifo_out_write <= 1;
			
				fifo_in_read <= 0;
			end
			else begin
				if (sdram0_data_readdatavalid && is_reading) begin
					sum = sum_next;
					read_count <= read_count + 1;
					burst_count <= burst_count + 1;
					if (read_count == read_size - 1) begin
						read_count <= 0;
						burst_count <= 0;
					
						read_addr <= 0;
						read_size <= 0;
						is_reading <= 0;
						
						sdram0_data_address <= 0;
						sdram0_data_burstcount <= 0;
						sdram0_data_read <= 0;
					
						fifo_out_writedata <= {-sum_next, in_count};
						fifo_out_write <= 1;
					end else begin
						if (burst_count == BURST_N -1) begin
							burst_count <= 0;
							sdram0_data_address <= read_addr + read_count + 1;
							sdram0_data_read <= 1;
						end
					end
				end
			end
		end 
	end
endmodule