// Test bench for Register file
`timescale 1ns/10ps

module mux4_1(out, i, sel);
	output logic out;
	input logic [3:0] i;
	input logic [1:0] sel;
	
	logic [1:0] v;
	
	mux2_1 m0(.out(v[0]), .i(i[1:0]), .sel(sel[0]));
	mux2_1 m1(.out(v[1]), .i(i[3:2]), .sel(sel[0]));
	mux2_1 m (.out(out), .i(v), .sel(sel[1]));
endmodule

module mux4_1_testbench();
	logic [3:0] i;
	logic [1:0] sel;
	logic out;
	
	mux4_1 dut (.out, .i, .sel);
	
	integer j;
	initial begin
		for(j=0; j<64; j++) begin
			{sel, i} = j; 
			#5000000;
		end
	end
endmodule