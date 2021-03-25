`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Juan Melo & Luke Morreale
// 
// Create Date:    12:13:01 02/25/2021 
// Design Name: 
// Module Name:    controller 
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
module controller(
	 input CLK,
	 input RESET,
    input go_i,
    output reg x_sel,
    output reg x_ld,
    output reg y_sel,
    output reg y_ld,
    input x_neq_y,
    input x_lt_y,
    output reg d_ld
    );

// The FSM design is based on the optimized version of the GCD FSM.
parameter s2 = 3'b000;
parameter s3 = 3'b001;
parameter s5 = 3'b010;
parameter s7 = 3'b011;
parameter s8 = 3'b100;
parameter s9 = 3'b101;

// Wires and regs
reg[3:0] state = s2; 

always @(posedge CLK)
	if (RESET) begin
		state <= s2;
		x_sel <= 0;
		x_ld <= 0;
		y_sel <= 0;
		y_ld <= 0;
		d_ld <= 0;
	end
	
	else
		case (state)
			s2 : begin
				x_sel <= 0;
				x_ld <= 0;
				y_sel <= 0;
				y_ld <= 0;
				d_ld <= 0;
				if (!go_i)
					state <= s2;
				else 
					state <= s3;
			end
			s3 : begin
				x_sel <= 0;
				y_sel <= 0;
				x_ld <= 1;
				y_ld <= 1;
				d_ld <= 0;
				state <= s5;
			end
			s5 : begin
				x_sel <= 0;
				x_ld <= 0;
				y_sel <= 0;
				y_ld <= 0;
				d_ld <= 0;
				if (x_neq_y) begin
					if (x_lt_y)
						state <= s7;
					else 
						state <= s8;
				end
				else
					state <= s9;
			end
			s7 : begin
				x_sel <= 0;
				x_ld <= 0;
				y_sel <= 1;
				y_ld <= 1;
				d_ld <= 0;
				state <= s5;
			end
			s8 : begin
				x_sel <= 1;
				x_ld <= 1;
				y_sel <= 0;
				y_ld <= 0;
				d_ld <= 0;
				state <= s5;
			end
			s9: begin
				x_sel <= 0;
				x_ld <= 0;
				y_sel <= 0;
				y_ld <= 0;
				d_ld <= 1;
				state <= s2;				
			end
		endcase 
endmodule
