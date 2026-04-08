// Test bench for Register file
`timescale 1ns/10ps

module reg64(out, in, reset, clk, writeEnable);
	output logic [63:0] out;
	input logic [63:0] in;
	input logic reset, clk, writeEnable;

	genvar i;
	
	generate
		for (i = 0; i < 64; i++) begin : eachDff
			D_FF_enable dff_en (.q(out[i]), .d(in[i]), 
									  .reset(reset), .clk(clk), 
									  .enable(writeEnable));
		end
	endgenerate
endmodule