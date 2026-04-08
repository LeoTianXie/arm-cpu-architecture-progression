// Test bench for Register file
`timescale 1ns/10ps

module mux16_1(out, i, sel);
	output logic out;
	input logic [15:0] i;
	input logic [3:0] sel;
	
	logic [1:0] v;
	
	mux8_1 m0(.out(v[0]), .i(i[7:0]), .sel(sel[2:0]));
	mux8_1 m1(.out(v[1]), .i(i[15:8]), .sel(sel[2:0]));
	mux2_1 m (.out(out), .i(v), .sel(sel[3]));
endmodule

module mux16_1_testbench();
	logic [15:0] i;
	logic [3:0] sel;
	logic out;
	
	mux16_1 dut (.out, .i, .sel);
	
	integer j;
	initial begin
		for (j = 0; j < 16; j++) begin
			sel = j;
			i = 16'b0;
			i[j] = 1'b1;
			#100000;
		end
		#100000;
		i = 16'b0000000000000000;
		sel = 4'b1000;
		#100000;
		sel = 4'b1010;
		#100000;
	end	
endmodule