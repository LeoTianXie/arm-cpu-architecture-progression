// Test bench for ALU
`timescale 1ns/10ps

//module adderSubtractor(result, negative, zero, overflow, carry_out, a, b, carry_in);
module adderSubtractor(result, overflow, carry_out, a, b, carry_in);
	input logic [63:0] a, b;
	input logic carry_in;
	output logic [63:0] result;
//	output logic negative, zero, overflow, carry_out;
	output logic overflow, carry_out;

	logic [64:0] v, w;
	assign v[0] = carry_in;
	
	// Result
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin : eachFullAdder
			xor #50 x (w[i], b[i], carry_in);
			fullAdder fa(.co(v[i + 1]), .s(result[i]), .a(a[i]), .b(w[i]), .ci(v[i]));
		end
		
	endgenerate

//	// Negative
//	assign negative = result[63];
//	
//	// Zero
//	zeroChecker zc(.zero(zero), .result(result));
//	
	// Overflow
	xor #50 (overflow, v[64], v[63]);
	
	// Carry Out
	assign carry_out = v[64];
endmodule

module adderSubtractor_testbench();
	logic [63:0] a, b;
	logic carry_in;
	logic [63:0] result;
	logic negative, zero, overflow, carry_out;

	adderSubtractor dut(.result, .overflow, .carry_out, .a, .b, .carry_in);

	initial begin
		// Addition
		a = 64'b1001; b = 64'b0011; carry_in = 0; #100000000; // 9 + 3 = 12
		a = 64'b0000; b = 64'b0000; carry_in = 0; #100000000; // 0 + 0 = 0
		a = 64'b0000; b = 64'b0011; carry_in = 0; #100000000; // 0 + 3 = 3
		
		// Subtraction
		a = 64'b1001; b = 64'b0011; carry_in = 1; #100000000; // 9 - 3 = 6
		a = 64'b0011; b = 64'b0011; carry_in = 1; #100000000; // 3 - 3 = 6
		a = 64'b0011; b = 64'b1001; carry_in = 1; #100000000; // 3 - 9 = -6
		
		// Overflow
		a = 64'b0111111111111111111111111111111111111111111111111111111111111111; 
		b = 64'b0111111111111111111111111111111111111111111111111111111111111111; 
		carry_in = 0; #100000000;
		
		// Addition
		a = 64'h0000000000001388; b = 64'h0000000000002710; carry_in = 0; #100000000; // 5000 + 10000 = 15000
		a = 64'h0000000000000001; b = 64'hFFFFFFFFFFFFFFFF; carry_in = 0; #100000000; // 1 + (-1) = 0
		
		// Subtraction
		a = 64'h0000000000000001; b = 64'h0000000000000003; carry_in = 1; #100000000; // 1 - 3 = -2
		a = 64'h0000000000002710; b = 64'h0000000000001388; carry_in = 1; #100000000; // 10000 - 5000 = 5000
		a = 64'h0000000000001388; b = 64'h0000000000002710; carry_in = 1; #100000000; // 5000 - 10000 = -5000
	end
endmodule