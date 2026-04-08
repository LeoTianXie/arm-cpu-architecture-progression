// Test bench for Register file
`timescale 1ns/10ps

module enDecoder3_8(out, in, enable);
	output logic [7:0] out;
	input logic [2:0] in;
	input logic enable;

	logic [7:0] v;
	logic notIn2;

	// Preping inverses
	not #50 (notIn2, in[2]);
	
	// s2 MSB logic
	enDecoder2_4 d0(.out(v[3:0]), .in(in[1:0]), .enable(notIn2));
	enDecoder2_4 d1(.out(v[7:4]), .in(in[1:0]), .enable(in[2]));
	
	// Only map to out when enable
	and #50 (out[0], v[0], enable);
	and #50 (out[1], v[1], enable);
	and #50 (out[2], v[2], enable);
	and #50 (out[3], v[3], enable);
	and #50 (out[4], v[4], enable);
	and #50 (out[5], v[5], enable);
	and #50 (out[6], v[6], enable);
	and #50 (out[7], v[7], enable);
	
endmodule

module enDecoder3_8_testbench();
	logic [7:0] out;
	logic [2:0] in;
	logic enable;
	
	enDecoder3_8 dut (.out, .in, .enable);
	
	initial begin
		in = 3'b000; enable = 1'b1; #1000;
		in = 3'b001; enable = 1'b1; #1000;
		in = 3'b010; enable = 1'b1; #1000;
		in = 3'b011; enable = 1'b1; #1000;
		in = 3'b100; enable = 1'b1; #1000;
		in = 3'b101; enable = 1'b1; #1000;
		in = 3'b110; enable = 1'b1; #1000;
		in = 3'b111; enable = 1'b1; #1000;
		in = 3'b000; enable = 1'b0; #1000;
		in = 3'b001; enable = 1'b0; #1000;
		in = 3'b010; enable = 1'b0; #1000;
		in = 3'b011; enable = 1'b0; #1000;
		in = 3'b100; enable = 1'b0; #1000;
		in = 3'b101; enable = 1'b0; #1000;
		in = 3'b110; enable = 1'b0; #1000;
		in = 3'b111; enable = 1'b0; #1000;
	end
endmodule