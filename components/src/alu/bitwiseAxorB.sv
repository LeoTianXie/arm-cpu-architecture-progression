// Test bench for ALU
`timescale 1ns/10ps

module bitwiseAxorB(result, a, b);
	input logic [63:0] a, b;
	output logic [63:0] result;
	
	// Result
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin : eachAnd
			xor #50 a(result[i], a[i], b[i]);
		end
	endgenerate
endmodule
