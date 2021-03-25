`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:09:31 01/27/2021
// Design Name:   ALU_beh
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/Lab2/ALU_beh_testbench.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_beh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_beh_testbench;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [1:0] S;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	ALU_beh uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		S = 0;

		// Wait 200 ns for global reset to finish
		#200;
        
		// Add stimulus here
		// S = 00: Invert
		A = 4'b1010;
		#100;
		
		A = 4'b0011;
		#100;
		
		// S = 01: Add
		S = 2'b01;
		A = 4;
		B = 5;
		#100;
		
		A = 9;
		B = 12; // Testing overflow
		#100;
		
		// S = 10: Subtract
		S = 2'b10;
		A = 7;
		B = 5;
		#100;
		
		A = 5;
		B = 7;	// Testing overflow
		#100;
		
		// S = 11: Double
		S = 2'b11;
		A = 3;
		B = 0;
		#100;
		
		A = 5;
		#100;
		
	end   
endmodule

