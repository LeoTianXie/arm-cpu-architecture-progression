// Test bench for ALU
`timescale 1ns/10ps

module mux64x8_1(out, in, sel);
	output logic [63:0] out;
	input logic [63:0] in [0:7];
	input logic [2:0] sel;
	
	genvar j, k;
	
	generate
		for (j = 0; j < 64; j++) begin : eachMux
			logic [7:0] v;
			for (k = 0; k < 8; k++) begin : eachIn
				assign v[k] = in[k][j];
			end
			mux8_1 m(.out(out[j]), .i(v), .sel(sel));
		end
	endgenerate
endmodule