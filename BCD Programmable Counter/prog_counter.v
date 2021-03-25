// Wrapper to add programmability to a 7-bit counter.
// This module contains the logic to stop a counter when it
// reaches a designated value. The maximum value is 99 (decimal)

module prog_count_7(max_count, run, CLK, count_out, stop);

	input [6:0] max_count;
	input run, CLK;
	output [6:0] count_out;
	output stop;

	// Wires/Registers required go here.
	reg [6:0] max;
	reg stop;

	// 7-bit counter instance
	count_7 counter_1(.run(run),
			  .stop(stop),
			  .CLK(CLK),
			  .count_out(count_out));


	// TODO: Write logic for Counter control
	//In your always block, first check if run == 0, then read //max_count. Compare max_count with count_out to stop.
	always @(negedge CLK or max_count) begin
		stop = 1'b0;
		if (run == 1'b0) begin
			max = max_count;
		end
		else if (run == 1'b1 && !(count_out < max)) begin
			stop = 1'b1;
		end
	end
endmodule 