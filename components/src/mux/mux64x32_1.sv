// Test bench for Register file
`timescale 1ns/10ps

module mux64x32_1(out, in, sel);
	output logic [63:0] out;
	input logic [63:0] in [0:31];
	input logic [4:0] sel;
	
	genvar j, k;
	
	generate
		for (j = 0; j < 64; j++) begin : eachMux
			logic [31:0] v;
			for (k = 0; k < 32; k++) begin : eachIn
				assign v[k] = in[k][j];
			end
			mux32_1 m(.out(out[j]), .i(v), .sel(sel));
		end
	endgenerate
endmodule

module mux64x32_1_testbench();
   logic [31:0][63:0] in;
   logic [63:0] out;
   logic [4:0] sel;

   mux32_1_64 dut (.out(out), .in(in), .sel(sel));

   initial begin
      integer i, j;
      for (i = 0; i < 64; i = i + 1) begin
         for (j = 0; j < 32; j = j + 1) begin
            in[i][j] = i + j;
         end
      end

      // Apply a few selector values
      sel = 5'd0; #10000;

		sel = 5'd5; #10000;;

		sel = 5'd10; #10000;

		sel = 5'd31; #10000;
	end
endmodule