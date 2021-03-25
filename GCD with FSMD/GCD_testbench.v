`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:50 02/25/2021
// Design Name:   GCD_4bit
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/Lab5/GCD_testbench.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GCD_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GCD_testbench;

	// Inputs
	reg [3:0] x_i;
	reg [3:0] y_i;
	reg go_i;
	reg CLK;
	reg RESET;

	// Outputs
	wire [3:0] d_o;
	
	// Instantiate the Unit Under Test (UUT)
	GCD_4bit uut (
		.x_i(x_i), 
		.y_i(y_i), 
		.go_i(go_i), 
		.CLK(CLK), 
		.RESET(RESET), 
		.d_o(d_o));

	initial begin
		// Initialize Inputs
		x_i = 0;
		y_i = 0;
		go_i = 0;
		CLK = 0;
		RESET = 0;

		// Wait 100 ns for global reset to finish
		#20;
		
		// GCD testing
		x_i = 8;
		y_i = 12;
		#30;
		go_i = 1;
		#70;
		go_i = 0;
		#200;
		
		x_i = 3;
		y_i = 8;
		#30;
		go_i = 1;
		#70;
		go_i = 0;
		#200;
		
		x_i = 15;
		y_i = 10;
		#30;
		go_i = 1;
		#70;
		go_i = 0;
		#200;
		
		RESET = 1;
		#40;
		RESET = 0;
		#40;
		
		x_i = 9;
		y_i = 9;
		#30;
		go_i = 1;
		#70;
		go_i = 0;
		#200;
	end
	
	// Generate clock
	always begin
		CLK = #10 ~CLK;
	end
endmodule

