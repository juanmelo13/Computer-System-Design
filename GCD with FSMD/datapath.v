`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Melo & Luke Morreale
// 
// Create Date:    14:31:24 02/25/2021 
// Design Name: 
// Module Name:    datapath 
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

// Datapath top module
module datapath(
    input [3:0] x_i,
    input [3:0] y_i,
    input CLK,
    input RESET,
    input x_sel,
    input x_ld,
    input y_sel,
    input y_ld,
    input d_ld,
    output x_neq_y,
    output x_lt_y,
    output [3:0] d_o
    );

// wire declaration
wire [3:0] x_bus, y_bus; 			// x and y buses.
wire [3:0] mux_x, mux_y; 			// Wires that connect the registers with the muxes
wire [3:0] x_sub_y_w, y_sub_x_w; // Wires that connect the subtractors to the muxes. 

// x and y registers
dff x_reg(
	.CLK(CLK),
	.d(mux_x),
	.ENABLE(x_ld),
	.RESET(RESET),
	.q(x_bus));
	
dff y_reg(
	.CLK(CLK),
	.d(mux_y),
	.ENABLE(y_ld),
	.RESET(RESET),
	.q(y_bus));

// x and y multiplexers
mux21_4bit x_mux(
	.d0(x_i),
	.d1(x_sub_y_w),
	.s(x_sel),
	.out(mux_x));
	
mux21_4bit y_mux(
	.d0(y_i),
	.d1(y_sub_x_w),
	.s(y_sel),
	.out(mux_y));	
	
// Less than functional unit
a_lt_b x_lt_y_fu(
	.a(x_bus),
	.b(y_bus),
	.a_lt_b(x_lt_y));
	
// Not equal to functional unit
a_neq_b x_neq_y_fu(
	.a(x_bus),
	.b(y_bus),
	.a_neq_b(x_neq_y));
	
// Subtractors functional unit
sub4 x_sub_y_fu(
	.a(x_bus),
	.b(y_bus),
	.diff(x_sub_y_w));

sub4 y_sub_x_fu(
	.a(y_bus),
	.b(x_bus),
	.diff(y_sub_x_w));
	
// d_o register
dff d_reg(
	.CLK(CLK),
	.d(x_bus),
	.ENABLE(d_ld),
	.RESET(RESET),
	.q(d_o));
endmodule
