`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:55:20 02/25/2021
// Design Name:   controller
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/Lab5/controller_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_tb;

	// Inputs
	reg CLK;
	reg RESET;
	reg go_i;
	reg x_neq_y;
	reg x_lt_y;

	// Outputs
	wire x_sel;
	wire x_ld;
	wire y_sel;
	wire y_ld;
	wire d_ld;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.go_i(go_i), 
		.x_sel(x_sel), 
		.x_ld(x_ld), 
		.y_sel(y_sel), 
		.y_ld(y_ld), 
		.x_neq_y(x_neq_y), 
		.x_lt_y(x_lt_y), 
		.d_ld(d_ld)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		go_i = 0;
		x_neq_y = 0;
		x_lt_y = 0;

		// Wait 100 ns for global reset to finish
		#50;
        
		// Add stimulus here
		go_i = 1;
		#30;
		
		x_neq_y = 1;
		x_lt_y = 1;
		#40;
		
		go_i = 0;
		x_lt_y = 0;
		#40;
		
		x_neq_y = 0;
	end
	
	// Generate clock
	always begin
		CLK = #10 ~CLK;
	end
      
endmodule

