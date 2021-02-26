module regn(R, Rin, Clock, Q);
	parameter n = 16;
	input [n-1:0] R;
	input Rin, Clock;
	output [n-1:0] Q;
	reg [n-1:0] Q;
	
	initial
	begin
		Q = 1'b0;
	end
	
	always @(posedge Clock)
		if (Rin)
			Q <= R;
endmodule