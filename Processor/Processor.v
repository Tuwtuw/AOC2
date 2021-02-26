module Processor(MClock, PClock, Resetn, Run);
	input MClock;
	input PClock;
	input Resetn;
	input Run;


	Counter Count (MClock, Resetn, n);
	Memory Mem (MClock, Resetn, n, data);
	ControlUnit Control (data, Resetn, PClock, Run, Done, BusWires);

endmodule