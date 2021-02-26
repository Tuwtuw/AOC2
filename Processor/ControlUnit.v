module ControlUnit (DIN, Resetn, Clock, Run, Done, BusWires);
	input [15:0] DIN;
	input Resetn, Clock, Run;
	output reg Done;
	output [15:0] BusWires;
	
	integer i;	
	
	wire [1:0] Tstep_Q;
	wire Clear = Done | &Tstep_Q ; // Clear do contador de passo de tempo
	upcount Tstrp (Clear, Clock, Tstep_Q);
	
	
	wire [8:0] IR; // Saida do Registrador IR
	reg IRin; //Sinal de Escrita do registrador IR	
	regn #(.n(9)) reg_IR (DIN[8:0], IRin, Clock, IR);
	
	reg Ain; //Sinal de Escrita do registrador A
	wire [15:0] A; // Saida do Regustrador A
	regn reg_A (BusWires, Ain, Clock, A);
	
	reg AddSubControl;
	wire [15:0] addSubOut;
	Addsub addSub (AddSubControl, A, BusWires, addSubOut);
	
	reg Gin; //Sinal de Escrita do registrador G	
	wire [15:0] G; // Saida do Registrador G
	regn reg_G (addSubOut, Gin, Clock, G);
	
	
	reg Bin; //Sinal de Escrita do registrador A
	wire [15:0] B; // Saida do Regustrador A
	regn reg_B (BusWires, Bin, Clock, B);
	
	wire [15:0] Orout;
	Orunit Orunit (B, BusWires, Orout);
	
	reg Hin; //Sinal de Escrita do registrador G	
	wire [15:0] H; // Saida do Registrador G
	regn reg_H (Orout, Hin, Clock, H);
	
	
	reg Cin; //Sinal de Escrita do registrador A
	wire [15:0] C; // Saida do Regustrador A
	regn reg_C (BusWires, Cin, Clock, C);
	
	wire [15:0] Sltout;
	Setlessthan Sltunit (C, BusWires, Sltout);
	
	reg Iin; //Sinal de Escrita do registrador G	
	wire [15:0] Iout; // Saida do Registrador G
	regn  reg_I (Sltout, Iin, Clock, Iout);
	
	
	reg Fin; //Sinal de Escrita do registrador A
	wire [15:0] F; // Saida do Regustrador A
	regn reg_F (BusWires, Fin, Clock, F);
	
	reg ShiftDirection;
	wire [15:0] Shiftout;
	Shiftlog Shiftunit (ShiftDirection, F, BusWires, Shiftout);
	
	reg Jin; //Sinal de Escrita do registrador G	
	wire [15:0] J; // Saida do Registrador G
	regn reg_J (Shiftout, Jin, Clock, J);
	
	
	reg [7:0] Rin; // Sinal de Escrita dos registradores R0-R7
	wire [15:0] R[7:0]; // Saida dos Registradores R0-R7
	regn reg_0 (BusWires, Rin[0], Clock, R[0]);
	regn reg_1 (BusWires, Rin[1], Clock, R[1]);
	regn reg_2 (BusWires, Rin[2], Clock, R[2]);
	regn reg_3 (BusWires, Rin[3], Clock, R[3]);
	regn reg_4 (BusWires, Rin[4], Clock, R[4]);
	regn reg_5 (BusWires, Rin[5], Clock, R[5]);
	regn reg_6 (BusWires, Rin[6], Clock, R[6]);
	regn reg_7 (BusWires, Rin[7], Clock, R[7]);
		
	reg [12:0] Control; // Sinal de controle do multiplexador
	Multiplexer mux (R[0],R[1],R[2],R[3],R[4],R[5],R[6],R[7], G, H, Iout, J, DIN, Control, BusWires);	
	
	
	wire [2:0]I = IR[8:6]; //Instruçao a ser executada
	wire [7:0] Xreg, Yreg;	
	dec3to8 decX (IR[5:3], 1'b1, Xreg); //O valor retornado por Xreg
	dec3to8 decY (IR[2:0], 1'b1, Yreg); //Registrador 2	
	
	initial
	begin
		IRin = 1'b0;
		Rin = 8'b0;
		Control = 13'b0;
		Done = 1'b0;
		AddSubControl = 1'b0;
		ShiftDirection = 1'b0;
	end
	
	always @(Tstep_Q or I or Xreg or Yreg)
	begin
		IRin = 1'b0; //Desabilita a escrita no registrador IR
		Done = 1'b0;
		Rin = 8'b0;
		Ain = 1'b0;
		Gin = 1'b0;
		Hin = 1'b0;
		Iin = 1'b0;
		Jin = 1'b0;
		Control = 13'b0;
		AddSubControl = 1'b0;
		ShiftDirection = 1'b0;
		case (Tstep_Q)
			2'b00: // store DIN in IR in time step 0
				begin
					IRin = 1'b1; //Habilita a escrita no registrador IR
				end
			2'b01: //define signals in time step 1
				case (I)
					3'b000: // (mv)
						begin
							Control = {5'b00000, Yreg};//RYout
							Rin = Xreg; //RXin								
							Done = 1'b1;
						end
					3'b001: // (mvi)
						begin
							Control = 13'b1000000000000;//DINout
							Rin = Xreg;	//RXin						
							Done = 1'b1;
						end
					3'b010: // (add)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Ain = 1'b1; //Ain
						end
					3'b011: // (sub)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Ain = 1'b1; //Ain
						end
					3'b100: // (or)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Bin = 1'b1; //Bin
						end
					3'b101: // (slt)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Cin = 1'b1; //Cin
						end
					3'b110: // (sll)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Fin = 1'b1; //Fin (DIN ja e utilizado para entrada de dados)
						end
					3'b111: // (srl)
						begin
							Control = {5'b00000, Xreg}; //RXout
							Fin = 1'b1; //Fin
						end
				endcase			
			2'b10: //define signals in time step 2
				case (I)
					3'b000: // (mv)
						begin
						end
					3'b001: // (mvi)
						begin
						end
					3'b010: // (add)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Gin = 1'b1; //Gin
						end
					3'b011: // (sub)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Gin = 1'b1; //Gin
							AddSubControl = 1'b1; //Addsub
						end
					3'b100: // (or)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Hin = 1'b1; //Hin
						end
					3'b101: // (slt)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Iin = 1'b1; //Iin
						end
					3'b110: // (sll)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Jin = 1'b1; //Jin
						end
					3'b111: // (srl)
						begin
							Control = {5'b00000, Yreg}; //RYout
							Jin = 1'b1; //Jin
							ShiftDirection = 1'b1;
						end
				endcase
			2'b11: //define signals in time step 3
				case (I)
					3'b000: // (mv)
						begin
						end
					3'b001: // (mvi)
						begin
						end
					3'b010: // (add)
						begin
							Control = 13'b0000100000000; //Gout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
					3'b011: // (sub)
						begin
							Control = 13'b0000100000000; //Gout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
					3'b100: // (or)
						begin
							Control = 13'b0001000000000; //Hout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
					3'b101: // (slt)
						begin
							Control = 13'b0010000000000; //Iout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
					3'b110: // (sll)
						begin
							Control = 13'b0100000000000; //Jout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
					3'b111: // (srl)
						begin
							Control = 13'b0100000000000; //Jout
							Rin = Xreg; //RXin
							Done = 1'b1;
						end
				endcase
		endcase
	end

endmodule