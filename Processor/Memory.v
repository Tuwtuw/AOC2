module Memory(MClock, Resetn, address, data);
	input MClock;
	input Resetn;
	input [4:0]address;
	output [15:0] data;

	reg [15:0] Mem [31:0];
	
	initial
	begin
		Mem[0] = 16'b0000000001000000;//MVI R0, #2
		Mem[1] = 16'b0000000;
		Mem[2] = 16'b0000000;
		Mem[3] = 16'b0000000;
		Mem[4] = 16'b0000000;
		Mem[5] = 16'b0000000;
		Mem[6] = 16'b0000000;
		Mem[7] = 16'b0000000;
		Mem[8] = 16'b0000000;
		Mem[9] = 16'b0000000;
		Mem[10] = 16'b0000000;
		Mem[11] = 16'b0000000;
		Mem[12] = 16'b0000000;
		Mem[13] = 16'b0000000;
		Mem[14] = 16'b0000000;
		Mem[15] = 16'b0000000;
		Mem[16] = 16'b0000000;
	end
	
	
	always@(posedge MClock)
	begin
		data = Mem[address];
	end
	
endmodule