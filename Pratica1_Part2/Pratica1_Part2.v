module Pratica1_Part2(input clock,
	input[7:0] data,
	input[4:0] rdaddress,
	input[4:0] wraddress,
	input wren,
	output[7:0] q);
  ramlpm ram1(clock,
	data,
	rdaddress,
	wraddress,
	wren,
	q);
  
endmodule