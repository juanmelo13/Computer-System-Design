`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Melo & Luke Morreale
// 
// Create Date:    15:01:41 02/25/2021 
// Design Name: 
// Module Name:    GCD_4bit 
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

// GCD top module.
module GCD_4bit(
    input [3:0] x_i,
    input [3:0] y_i,
    input go_i,
	 input CLK,
	 input RESET,
    output [3:0] d_o
    );

//Wires connecting the controller and datapath
wire x_sel_w, y_sel_w, x_ld_w, y_ld_w, d_ld_w; // Wires from the controller to the datapath
wire x_neq_y_w, x_lt_y_w;					// Wires from the datapath to the controller

// Controller instance
controller controller(
	.CLK(CLK),
	.RESET(RESET),
	.go_i(go_i),
	.x_sel(x_sel_w),
	.x_ld(x_ld_w),
	.y_sel(y_sel_w),
	.y_ld(y_ld_w),
	.x_neq_y(x_neq_y_w),
	.x_lt_y(x_lt_y_w),
	.d_ld(d_ld_w));

// Datapath instance
datapath datapath(
	.x_i(x_i),
	.y_i(y_i),
	.CLK(CLK),
	.RESET(RESET),
	.x_sel(x_sel_w),
	.x_ld(x_ld_w),
	.y_sel(y_sel_w),
	.y_ld(y_ld_w),
	.d_ld(d_ld_w),
	.x_neq_y(x_neq_y_w),
	.x_lt_y(x_lt_y_w),
	.d_o(d_o));

endmodule
