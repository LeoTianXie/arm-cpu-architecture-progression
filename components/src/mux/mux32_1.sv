// Test bench for Register file
`timescale 1ns/10ps

module mux32_1(out, i, sel);
	output logic out;
	input logic [31:0] i;
	input logic [4:0] sel;
	
	logic [1:0] v;
	
	mux16_1 m0(.out(v[0]), .i(i[15:0]), .sel(sel[3:0]));
	mux16_1 m1(.out(v[1]), .i(i[31:16]), .sel(sel[3:0]));
	mux2_1 m (.out(out), .i(v), .sel(sel[4]));
endmodule

module mux32_1_testbench();
	logic [31:0] i;
	logic [4:0] sel;
	logic out;
	
	mux32_1 dut (.out, .i, .sel);
	
	integer j;
	initial begin
		for (j = 0; j < 32; j++) begin
			sel = j;
			i = 32'b0;
			i[j] = 1'b1;
			#100000;
		end
		#100000;
		i = 16'b00000000000000000000000000000000;
		sel = 5'b11000;
		#100000;
		sel = 5'b01010;
		#100000;
		$stop;
	end
endmodule
