// Test bench for Register file
`timescale 1ns/10ps

module mux2_1(out, i, sel);
	output logic out;
	input logic [1:0] i;
	input logic sel;
	logic a1out, a2out, nSel;

//	assign out = (i1 & sel) | (i0 & ~sel);
	and #50 a1 (a1out, i[1], sel);
	not #50 n (nSel, sel);
	and #50 a2 (a2out, i[0], nSel);
	or #50 o (out, a1out, a2out);	
endmodule

module mux2_1_testbench();
	logic [1:0] i;
	logic sel;
	logic out;

	mux2_1 dut (.out, .i, .sel);

	initial begin
		sel=0; i[0]=0; i[1]=0; #500;
		sel=0; i[0]=0; i[1]=1; #500;
		sel=0; i[0]=1; i[1]=0; #500;
		sel=0; i[0]=1; i[1]=1; #500;
		sel=1; i[0]=0; i[1]=0; #500;
		sel=1; i[0]=0; i[1]=1; #500;
		sel=1; i[0]=1; i[1]=0; #500;
		sel=1; i[0]=1; i[1]=1; #500;
	end
endmodule	