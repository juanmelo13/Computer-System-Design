`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:00:52 02/25/2021
// Design Name:   datapath
// Module Name:   C:/Users/Juan Jose/Documents/Academic/Spring 2021/CDA 4203L/Projects/Lab5/datapath_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module datapath_tb;

	// Inputs
	reg [3:0] x_i;
	reg [3:0] y_i;
	reg CLK;
	reg RESET;
	reg x_sel;
	reg x_ld;
	reg y_sel;
	reg y_ld;
	reg d_ld;

	// Outputs
	wire x_neq_y;
	wire x_lt_y;
	wire [3:0] d_o;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.x_i(x_i), 
		.y_i(y_i), 
		.CLK(CLK), 
		.RESET(RESET), 
		.x_sel(x_sel), 
		.x_ld(x_ld), 
		.y_sel(y_sel), 
		.y_ld(y_ld), 
		.d_ld(d_ld), 
		.x_neq_y(x_neq_y), 
		.x_lt_y(x_lt_y), 
		.d_o(d_o)
	);

	initial begin
		// Initialize Inputs
		x_i = 0;
		y_i = 0;
		CLK = 0;
		RESET = 0;
		x_sel = 0;
		x_ld = 0;
		y_sel = 0;
		y_ld = 0;
		d_ld = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here
		x_i = 8;
		y_i = 12;
		#50;
		
		x_ld = 1;
		y_ld = 1;
		#20;
		
		x_ld = 0;
		y_ld = 0;
		#20;
		
		y_sel = 1;
		y_ld = 1;
		#20
		
		y_sel = 0;
		x_ld = 0;
		y_ld = 0;
		#20;
		
		x_sel = 1;
		x_ld = 1;
		#20;
		
		x_sel = 0;
		x_ld = 0;
		y_ld = 0;
		#20;
		
		d_ld = 1;
		#20;
		d_ld = 0;
	end
      
	// Generate clock
	always begin
		CLK = #10 ~CLK;
	end
endmodule

