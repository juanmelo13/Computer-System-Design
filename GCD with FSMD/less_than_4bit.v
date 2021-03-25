`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:19 02/25/2021 
// Design Name: 
// Module Name:    a_lt_b
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

module a_lt_b(
    input [3:0] a,
    input [3:0] b,
    output a_lt_b
    );

assign a_lt_b = a < b;

endmodule
