// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant

module alustim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i;
	logic [63:0] test_val;
	initial begin
	
		$display("%t testing PASS_A operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end
		
		// Don't Care Control 001
		$display("%t testing don't care control", $time);
		cntrl = 3'b001;
		A = 64'HF0F0F0F0F0F0F0F0; B = 64'HF0F0F0F0F0F0F0F0;
		#(delay);
		
		// 1 + 1 = 2
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		
		// 1 + (-1) = 0
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000000001; B = 64'hFFFFFFFFFFFFFFFF;
		#(delay);

		// 5000 + 10000 = 15000
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000001388; B = 64'h0000000000002710;
		#(delay);
		
		// 1 - 1 = 0
		$display("%t testing subtraction", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		
		// 1 - 3 = -2
		$display("%t testing subtraction", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000000001; B = 64'h0000000000000003;
		#(delay);
		
		// 10000 - 5000 = 5000
		$display("%t testing subtraction", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000002710; B = 64'h0000000000001388;
		#(delay);
		
		// 5000 - 10000 = -5000
		$display("%t testing subtraction", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000001388; B = 64'h0000000000002710;
		#(delay);
		
		// 0000000000000000 and 0000000000000000 = 0000000000000000
		$display("%t testing bitwise AND", $time);
		cntrl = ALU_AND;
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
				
		// 0000000000000001 and FFFFFFFFFFFFFFFF = 0000000000000001
		$display("%t testing bitwise AND", $time);
		cntrl = ALU_AND;
		A = 64'h0000000000000001; B = 64'hFFFFFFFFFFFFFFFF;
		#(delay);
		
		// FFFFFFFFFFFFFFFF and 0000000000000000 = 0000000000000000
		$display("%t testing bitwise AND", $time);
		cntrl = ALU_AND;
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'h0000000000000000;
		#(delay);
		
		// 0000000000000000 and FFFFFFFFFFFFFFFF = FFFFFFFFFFFFFFFF
		$display("%t testing bitwise OR", $time);
		cntrl = ALU_OR;
		A = 64'h0000000000000000; B = 64'hFFFFFFFFFFFFFFFF;
		#(delay);
		
		// 0F0F0F0F0F0F0F0F and F0F0F0F0F0F0F0F0 = FFFFFFFFFFFFFFFF
		$display("%t testing bitwise OR", $time);
		cntrl = ALU_OR;
		A = 64'H0F0F0F0F0F0F0F0F; B = 64'HF0F0F0F0F0F0F0F0;
		#(delay);
		
		// 0F0F0F0F0F0F0F0F and F0F0F0F0F0F0F0F0 = FFFFFFFFFFFFFFFF
		$display("%t testing bitwise XOR", $time);
		cntrl = ALU_XOR;
		A = 64'H0F0F0F0F0F0F0F0F; B = 64'HF0F0F0F0F0F0F0F0;
		#(delay);
		
		// 0000000000000000 and 0000000000000000 = 0000000000000000
		$display("%t testing bitwise XOR", $time);
		cntrl = ALU_XOR;
		A = 64'h0000000000000000; B = 64'h0000000000000000;
		#(delay);
		
		// FFFFFFFFFFFFFFFF and FFFFFFFFFFFFFFFF = 0000000000000000
		$display("%t testing bitwise XOR", $time);
		cntrl = ALU_XOR;
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'hFFFFFFFFFFFFFFFF;
		#(delay);
		
		// Don't Care Control 111
		$display("%t testing don't care control", $time);
		cntrl = 3'b111;
		A = 64'H0F0F0F0F0F0F0F0F; B = 64'HF0F0F0F0F0F0F0F0;
		#(delay);
	end
endmodule
