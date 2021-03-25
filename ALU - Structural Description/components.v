`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:46:08 01/27/2021 
// Design Name: 
// Module Name:    components 
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

// NOT component
module inverter4(
	input [3:0] in,
	output [3:0] out);

	assign out = ~in;

endmodule

// Full Adder component
module fulladd4(
	input [3:0] a, 
	input [3:0] b,
	output [3:0] sum);
	
	assign sum = a + b; 
	
endmodule


