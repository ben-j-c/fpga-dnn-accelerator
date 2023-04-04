// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module new_component (
		input  wire         clock,    // clock_sink.clk
		input  wire         reset,    // reset_sink.reset
		output wire [255:0] st_data,  //         st.data
		input  wire         st_ready, //           .ready
		output wire         st_valid  //           .valid
	);

	// TODO: Auto-generated HDL template

	assign st_valid = 1'b1;

	assign st_data = 255'hDEAD_BEEF_DEAD_BEEF_FACC_FACC_FACC_1234_FFFF_AAAA_CCCC_0000_1111_2222_3333_4444;

endmodule
