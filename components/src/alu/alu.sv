// Test bench for ALU
`timescale 1ns/10ps

module alu(A, B, cntrl, result, negative, zero, overflow, carry_out);
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
					 
	logic [63:0] resultToMux [0:7];
	logic [1:0] overflowToMux, carry_outToMux;
	logic addSubSel;
	
	assign resultToMux[0] = B;
	
	adderSubtractor as1(.result(resultToMux[2]), .overflow(overflowToMux[0]), .carry_out(carry_outToMux[0]), .a(A), .b(B), .carry_in(1'b0));
	
	adderSubtractor as2(.result(resultToMux[3]), .overflow(overflowToMux[1]), .carry_out(carry_outToMux[1]), .a(A), .b(B), .carry_in(1'b1));
	
	bitwiseAandB anb(.result(resultToMux[4]), .a(A), .b(B));
	
	bitwiseAorB aob(.result(resultToMux[5]), .a(A), .b(B));
		
	bitwiseAxorB axorb(.result(resultToMux[6]), .a(A), .b(B));
	
	// Negative
	assign negative = result[63];
	
	// Zero
	zeroChecker zc(.zero(zero), .result(result));
	
	// Muxes
	mux64x8_1 midMux(.out(result), .in(resultToMux), .sel(cntrl));
	
	and #50 a(addSubSel, cntrl[0], cntrl[1]);
	
	mux2_1 m1(.out(overflow), .i(overflowToMux), .sel(addSubSel));
	mux2_1 m2(.out(carry_out), .i(carry_outToMux), .sel(addSubSel));
endmodule