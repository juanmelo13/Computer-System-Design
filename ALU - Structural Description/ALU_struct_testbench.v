`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:55 01/30/2021
// Design Name:   ALU_struct
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/LAb2.2/ALU_struct_testbench.v
// Project Name:  LAb2.2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_struct
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_struct_testbench;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [1:0] S;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	ALU_struct uut (
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

		// Wait 100 ns for global reset to finish
		#100;
        
		// S = 00: Invert
		A = 3;
		#100;
		
		A = 12;
		#100;
		
		// S = 01: Add
		S = 1;
		A = 5;
		B = 8;
		#100;
		
		A = 9;
		B = 3;
		#100;
		
		// S = 10: Subtract
		S = 2;
		A = 6;
		B = 2;
		#100;
		
		A = 10;
		B = 11;
		#100;
		
		// S = 11: Double
		S = 3;
		A = 4;
		#100;
		
		A = 7;
		#100;

	end
      
endmodule

