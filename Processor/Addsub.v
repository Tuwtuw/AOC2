module Addsub(input Addsub, input[15:0]A,B, output reg[15:0] S);

  always@(Addsub, A, B)
	case(Addsub)
		0:S <= A + B;
		1:S <= A - B;
	endcase
	
endmodule