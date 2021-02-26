module upcount(Clear, Clock, Q);

	input Clear, Clock;
	output [1:0] Q;
	reg [1:0] Q;
	
	initial
	begin
		Q = 2'b00;
	end

	always @(posedge Clock)
		if (Clear)
			Q <= 2'b0;
		else
			Q <= Q + 1'b1;
endmodule