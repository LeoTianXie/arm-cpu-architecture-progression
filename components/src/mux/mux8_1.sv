// Test bench for Register file
`timescale 1ns/10ps

module mux8_1(out, i, sel);
	output logic out;
	input logic [7:0] i;
	input logic [2:0] sel;
	
	logic [1:0] v;
	
	mux4_1 m0(.out(v[0]), .i(i[3:0]), .sel(sel[1:0]));
	mux4_1 m1(.out(v[1]), .i(i[7:4]), .sel(sel[1:0]));
	mux2_1 m (.out(out), .i(v), .sel(sel[2]));
endmodule

module mux8_1_testbench();
	logic [7:0] i;
	logic [2:0] sel;
	logic out;
	
	mux8_1 dut (.out, .i, .sel);
	
	integer j;
	initial begin
		for (j = 0; j < 8; j++) begin
			sel = j;
			i = 8'b0;
			i[j] = 1'b1;
			#100000;
		end
		#100000;
		i = 8'b00000000;
		sel = 3'b100;
		#100000;
		sel = 3'b010;
		#100000;
	end	
endmodule