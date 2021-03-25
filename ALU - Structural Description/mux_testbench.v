`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:34 01/30/2021
// Design Name:   mux21_4bit
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/LAb2.2/mux_testbench.v
// Project Name:  LAb2.2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux21_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_testbench;

	// Inputs
	reg [3:0] d0;
	reg [3:0] d1;
	reg s;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux21_4bit uut (
		.d0(d0), 
		.d1(d1), 
		.s(s), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		d0 = 0;
		d1 = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		d0 = 4'b1100;
		d1 = 4'b0011;
		
		#100;
		s = 1;

	end
      
endmodule

