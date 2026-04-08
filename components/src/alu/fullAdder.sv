// Test bench for ALU
`timescale 1ns/10ps

module fullAdder(co, s, a, b, ci);
	input logic a, b, ci;
	output logic co, s;
	
	logic a1out, a2out, a3out;
	
	// co combinational logic
	and #50 a1co (a1out, a, b);
	and #50 a2co (a2out, a, ci);
	and #50 a3co (a3out, b, ci);
	or #50 oco (co, a1out, a2out, a3out);
	
	// s combinational logic
	xor #50 xs(s, a, b, ci);
endmodule