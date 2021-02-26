module Setlessthan(input[15:0]A,B, output reg [15:0] S);

  always@(A, B)
	begin
		if(A < B)
			S <= 16'b0000000000000001;
		else
			S <= 16'b0;
	end
	
	
endmodule