`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:55 02/25/2021 
// Design Name: 
// Module Name:    sub4 
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
module sub4(
    input [3:0] a,
    input [3:0] b,
    output [3:0] diff
    );

assign diff = a - b;

endmodule
