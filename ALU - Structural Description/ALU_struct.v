`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:28 01/30/2021 
// Design Name: 
// Module Name:    ALU_struct 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_struct(
	input [3:0] A,
	input [3:0] B,
	input [1:0] S,
	output [3:0] Y);
	
	// Declaring the wiring
	wire [3:0] inverter1_mux1;
	wire [3:0] inverter2_adder2;
	wire [3:0] adder1_mux1;
	wire [3:0] adder2_mux2;
	wire [3:0] mux1_mux3;
	wire [3:0] mux2_adder3;
	wire [3:0] adder3_mux3;
	
	// Inverter 1 is connected to A to fullfil S = 00, Invert.
	inverter4 inverter1(.in(A), .out(inverter1_mux1));
		
	// Inverter 2 is connected to B to fullfil S = 10, Subtract.
	inverter4 inverter2(.in(B), .out(inverter2_adder2));
	
	// Adder 1 fullfils S = 01, Add.  
	fulladd4 adder1(
		.a(A),
		.b(B),
		.sum(adder1_mux1));
	
	// Adder 2 adds 1 bit to B' in order to complete A - B.
	fulladd4 adder2(
		.a(4'b0001),
		.b(inverter2_adder2),
		.sum(adder2_mux2));
	
	// Multiplexer 1 selects between A' and A + B, and outputs to MUX 3.
	mux21_4bit mux1(
		.d0(inverter1_mux1),
		.d1(adder1_mux1),
		.s(S[0]),
		.out(mux1_mux3));
		
   // Multiplexer 2 selects between B' and A, and outputs to Adder 3.
	mux21_4bit mux2(
		.d0(adder2_mux2),
		.d1(A),
		.s(S[0]),
		.out(mux2_adder3));
	
	// Adder 3 performs either A - B or 2A depending on MUX 2.
	fulladd4 adder3(
		.a(A),
		.b(mux2_adder3),
		.sum(adder3_mux3));
		
	// Multiplexer 3 selects the final output based on S1.
	mux21_4bit mux3(
		.d0(mux1_mux3),
		.d1(adder3_mux3),
		.s(S[1]),
		.out(Y));
	

endmodule
