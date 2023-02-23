module mult_bp(
		input wire clk,
		input wire areset,
		input wire ab_valid,
		input wire[15:0] a,
		input wire[15:0] b,
		input wire backpressure_in,
		output wire q_valid,
		output wire backpressure_out,
		output wire[15:0] q
	);
	
	localparam cycles = 15;
	wire en;
	
	reg [cycles-1:0] valid;
	
	mult16 mult16_inst(
			.clk(clk),
			.areset(areset),
			.en(en),
			.a(a),
			.b(b),
			.q(q)
		);
	
	//Enable multiplier if no backpressure, and any of the in progress values are valid, or a valid input is available
	assign en = (!backpressure_in) && |{valid, ab_valid};
	assign q_valid = valid[0];
	assign backpressure_out = backpressure_in || !en;
	
	always @(posedge clk, posedge areset) begin
		if (areset) begin
			valid <= 0;
		end else begin
			if (en) begin 
				valid <= {ab_valid, valid[cycles-1:1]};
			end
		end
	end
endmodule