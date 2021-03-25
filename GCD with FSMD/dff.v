`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:29 02/25/2021 
// Design Name: 
// Module Name:    dff 
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
module dff(
    input CLK,
    input [3:0] d,
    input ENABLE,
    input RESET,
    output reg [3:0] q
    );

initial begin
	q = 0;
end

always @(negedge CLK) begin
	if (RESET && !ENABLE)
		q = 0;
	else if (!RESET && ENABLE)
		q = d;
	else
		q = q;
end

endmodule
