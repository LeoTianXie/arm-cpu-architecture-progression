// Test bench for ALU
`timescale 1ns/10ps

module zeroChecker(zero, result);
	input logic [63:0] result;
	output logic zero;
	
	logic notZero;

	logic [31:0] firstLayer;
	logic [15:0] secondLayer;
	logic [7:0] thirdLayer;
	logic [3:0] fourthLayer;
	logic [1:0] fifthLayer;
	genvar j, k, l, m, n;
	generate
		for (j = 0; j < 32; j++) begin : each32Or
			or #50 o32 (firstLayer[j], result[j*2], result[j*2+1]);
		end
		for (k = 0; k < 16; k++) begin : each16Or
			or #50 o16 (secondLayer[k], firstLayer[k*2], firstLayer[k*2+1]);
		end
		for (l = 0; l < 8; l++) begin : each8Or
			or #50 o8 (thirdLayer[l], secondLayer[l*2], secondLayer[l*2+1]);
		end
		for (m = 0; m < 4; m++) begin : each4Or
			or #50 o4 (fourthLayer[m], thirdLayer[m*2], thirdLayer[m*2+1]);
		end
		for (n = 0; n < 2; n++) begin : each2Or
			or #50 o2 (fifthLayer[n], fourthLayer[n*2], fourthLayer[n*2+1]);
		end
	endgenerate
	
	or #50 o1 (notZero, fifthLayer[0], fifthLayer[1]);
	
	not #50 n1 (zero, notZero);
endmodule

module zeroChecker_testbench();
	logic [63:0] result;
	logic zero;
	
	zeroChecker dut (.zero, .result);
	
	initial begin
		result = 64'b0; #100000;
		result[35] = 1'b1; #100000;
		result[35] = 1'b0; #100000;
	end
endmodule