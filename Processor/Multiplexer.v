module Multiplexer(R0, R1, R2, R3, R4, R5, R6, R7, G, H, I, J, DIN, control, S);
  input [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
  input [15:0] G, H, I, J;
  input [15:0] DIN;
  input [12:0] control; //control com DINout, Gout, R0-R7out concatenados
  output reg[15:0] S;

  always@(control or R0 or R1 or R2 or R3 or R4 or R5 or R6 or R7 or G or H or I or J or DIN)
    begin
      case(control)			
			13'b0000000000001: S <= R0;
         13'b0000000000010: S <= R1;
			13'b0000000000100: S <= R2;
         13'b0000000001000: S <= R3;
         13'b0000000010000: S <= R4;
         13'b0000000100000: S <= R5;
         13'b0000001000000: S <= R6;
         13'b0000010000000: S <= R7;
         13'b0000100000000: S <= G;
         13'b0001000000000: S <= H;
         13'b0010000000000: S <= I;
			13'b0100000000000: S <= J;
         13'b1000000000000: S <= DIN;
			default: S <= 16'b0;
      endcase
    end

endmodule