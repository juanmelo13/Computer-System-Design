`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:20 01/27/2021 
// Design Name: 
// Module Name:    ALU_beh 
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
module ALU_beh(
    input [3:0] A,
    input [3:0] B,
    input [1:0] S,
    output [3:0] Y
    );

reg [3:0] Y;

always @(A or B or S) begin

	case (S)
		2'b00: Y = ~A;
		2'b01: Y = A + B;
		2'b10: Y = A - B;
		2'b11: Y = A + A;
	endcase
	
end
endmodule
