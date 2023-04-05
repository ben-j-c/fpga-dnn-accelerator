`timescale 1 ps / 1 ps

module avalon_st_adapter_128_to_256 (
		input  wire         reset,        // reset_sink.reset
		input  wire         clock,        // clock_sink.clk
		input  wire [127:0] st_in_data,   //      st_in.data
		input  wire         st_in_valid,  //           .valid
		output wire         st_in_ready,  //           .ready

		output reg  [255:0] st_out_data,  //     st_out.data
		input  wire         st_out_ready, //           .ready
		output wire         st_out_valid  //           .valid
	);

	reg state;
	reg full;

	wire can_recv_first;
	wire can_recv_second;
	wire can_send;

	assign can_recv_first = (state == 0) && (!full || st_out_ready);
	assign can_recv_second = (state == 1);
	assign can_send = full;
	assign st_out_valid = full;
	assign st_in_ready = can_recv_first || can_recv_second;
	always @(posedge clock, posedge reset) begin
		if (reset) begin
			st_out_data <= 0;
			state <= 0;
			full <= 0;
		end else begin
			if (st_out_ready && full) begin
				full <= 0;
			end
			if (st_in_valid) begin
				if (can_recv_first) begin
					state <= 1;
					st_out_data[255:128] <= st_in_data;
				end else if (can_recv_second) begin
					state <= 0;
					st_out_data[127:0] <= st_in_data;
					full <= 1;
				end
			end
		end
	end

endmodule