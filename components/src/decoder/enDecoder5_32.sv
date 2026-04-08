// Test bench for Register file
`timescale 1ns/10ps

module enDecoder5_32(out, in, enable);
	output logic [31:0] out;
	input logic [4:0] in;
	input logic enable;
	
	logic [3:0] v;

	enDecoder2_4 d24(.out(v), .in(in[4:3]), .enable(enable));
	enDecoder3_8 d380(.out(out[7:0]), .in(in[2:0]), .enable(v[0])); 
	enDecoder3_8 d381(.out(out[15:8]), .in(in[2:0]), .enable(v[1])); 
	enDecoder3_8 d382(.out(out[23:16]), .in(in[2:0]), .enable(v[2])); 
	enDecoder3_8 d383(.out(out[31:24]), .in(in[2:0]), .enable(v[3])); 
	
endmodule

module enDecoder5_32_testbench();
	logic [31:0] out;
	logic [4:0] in;
	logic enable;
	
	enDecoder5_32 dut (.out, .in, .enable);
	
	integer j;
	initial begin
		for (j = 0; j < 32; j++) begin
			in = j;
			enable = 1'b1;
			#10000;
		end
		for (j = 0; j < 32; j++) begin
			in = j;
			enable = 1'b0;
			#10000;
		end
	end
endmodule