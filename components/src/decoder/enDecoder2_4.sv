// Test bench for Register file
`timescale 1ns/10ps

module enDecoder2_4 (out, in, enable);
	output logic [3:0] out;
	input logic [1:0] in;
	input logic enable;
	
	logic [1:0] notIn;
	logic [3:0] v;
	
	// Preping inverses
	not #50 (notIn[1], in[1]);
	not #50 (notIn[0], in[0]);
	
//	case(in)
//		2'b00: out = 4'b0000;
//		2'b01: out = 4'b0010;
//		2'b10: out = 4'b0100;
//		2'b11: out = 4'b1000;
//	endcase
	and #50 (v[3], in[1], in[0]);
	and #50 (v[2], in[1], notIn[0]);
	and #50 (v[1], notIn[1], in[0]);
	and #50 (v[0], notIn[1], notIn[0]);
	
	// Only map to out when enable
	and #50 (out[3], v[3], enable);
	and #50 (out[2], v[2], enable);
	and #50 (out[1], v[1], enable);
	and #50 (out[0], v[0], enable);

endmodule

module enDecoder2_4_testbench();
	logic [3:0] out;
	logic [1:0] in;
	logic enable;
	enDecoder2_4 dut (.out, .in, .enable);
	
	initial begin
		in = 2'b00; enable = 1'b1; #1000;
		in = 2'b01; enable = 1'b1; #1000;
		in = 2'b10; enable = 1'b1; #1000;
		in = 2'b11; enable = 1'b1; #1000;
		in = 2'b00; enable = 1'b0; #1000;
		in = 2'b01; enable = 1'b0; #1000;
		in = 2'b10; enable = 1'b0; #1000;
		in = 2'b11; enable = 1'b0; #1000;
	end
endmodule