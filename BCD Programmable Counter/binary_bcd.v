// This module is for a 7-bit binary to BCD converter
module binary_bcd_2(bin_in, digit_1, digit_2);
  
  input [6:0] bin_in;
  output reg [3:0] digit_1;
  output reg [3:0] digit_2;
  integer i; 
	
always @ (bin_in) 
begin 
	
	digit_1 = bin_in % 10; 
	digit_2 = bin_in / 10; 

end
  
endmodule 