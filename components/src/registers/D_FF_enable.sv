// Test bench for Register file
`timescale 1ns/10ps

module D_FF_enable(q, d, reset, clk, enable);
	output logic q;
	input logic d, reset, clk, enable;
	
	logic [1:0] i;
	logic v;

	assign i[0] = q;
	assign i[1] = d;
	
	mux2_1 m(.out(v), .i(i), .sel(enable));
	
	D_FF dff(.q(q), .d(v), .reset(reset), .clk(clk));
endmodule

module D_FF_enable_testbench();
	logic q, d, reset, clk, enable;
	
	D_FF_enable dut(.q, .d, .reset, .clk, .enable);
	
	initial begin
		clk = 1'b0;
		forever #100 clk = ~clk;
	end
	
	initial begin
		
		d = 1'b1; enable = 1'b1; #1000;
		d = 1'b0; enable = 1'b1; #1000;
		d = 1'b1; enable = 1'b0; #1000;
		d = 1'b0; enable = 1'b0; #1000;
		d = 1'b1; enable = 1'b1; #1000;
		d = 1'b0; enable = 1'b1; #1000;
		$stop;
	end
endmodule