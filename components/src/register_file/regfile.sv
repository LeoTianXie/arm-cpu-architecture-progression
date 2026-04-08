// Test bench for Register file
`timescale 1ns/10ps

module regfile(ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	output logic [63:0] ReadData1, ReadData2;
	input logic [63:0] WriteData;
	input logic [4:0] ReadRegister1, ReadRegister2;
	input logic [4:0] WriteRegister;
	input logic RegWrite, clk;
	
	logic [31:0] writeEnable; // Connecting decoder and registers
	logic [63:0] regToMux [0:31]; //Connecting registers to muxes
	
	// 5:32 Decoder
	enDecoder5_32 enDecoder(.out(writeEnable), .in(WriteRegister), .enable(RegWrite));
	
	// 32 Registers
	genvar x;
	generate
		for (x = 0; x < 31; x++) begin : eachReg // Generating 31 registedrs, leaving X31 to be hard wired
			reg64 register(.out(regToMux[x]), .in(WriteData), .reset(1'b0), .clk(clk), .writeEnable(writeEnable[x]));
		end
	endgenerate
	
	// 64 32:1 Muxes
	assign regToMux[31] = 64'b0;
	mux64x32_1 hugeMux0(.out(ReadData1), .in(regToMux), .sel(ReadRegister1));
	mux64x32_1 hugeMux1(.out(ReadData2), .in(regToMux), .sel(ReadRegister2));
endmodule
