`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:53 01/30/2021 
// Design Name: 
// Module Name:    mux21_4bit 
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
// 2-1 Multiplexer component (4-bit)
module mux21( 
	input [3:0] d0,
	input [3:0] d1,
	input s,
	output [3:0] out);
	
	assign out = s ? d1 : d0;
	
endmodule
