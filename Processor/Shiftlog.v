module Shiftlog(input Shiftdirection, input[15:0]A,B, output reg[15:0] S);

  always@(Shiftdirection, A, B)
	case(Shiftdirection)
		0:S <= A << B;
		1:S <= A >> B;
	endcase
	
endmodule