`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:57 02/07/2021
// Design Name:   bcd_count_7
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/Lab3/bcd_count_testbench.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_count_7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bcd_count_testbench;

	// Inputs
	reg [6:0] max_count;
	reg CLK;
	reg run;

	// Outputs
	wire [3:0] digit_1;
	wire [3:0] digit_2;

	// Instantiate the Unit Under Test (UUT)
	bcd_count_7 uut (
		.max_count(max_count), 
		.CLK(CLK), 
		.run(run), 
		.digit_1(digit_1), 
		.digit_2(digit_2)
	);
	
	initial begin
		// Initialize Inputs
		max_count = 0;
		run = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Test 1: count to 10
		max_count = 10;
		#50;
		run = 1;
		#400;
		
		// Test 2: Count to 26, changing max_count while counting.
		max_count = 26;
		#10;
		run = 0;
		#20;
		run = 1;
		#100;
		max_count = 10;
		#100;
		max_count = 6;
		#100;
		max_count = 15;
		#250;
		
		// Test 3: Set run to 0 before reaching max_count;
		run = 0;
		#20;
		run = 1;
		#200;
		run = 0;		

	end
	
	// Generate clock
	always begin
		CLK = #10 ~CLK;
	end
      
endmodule

