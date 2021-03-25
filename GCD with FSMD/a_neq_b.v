`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:01 02/25/2021 
// Design Name: 
// Module Name:    a_neq_b 
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

module a_neq_b(
    input [3:0] a,
    input [3:0] b,
    output a_neq_b
    );

assign a_neq_b = a != b;

endmodule
