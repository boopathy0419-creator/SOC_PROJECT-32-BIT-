module inst_m (
    input  [15:0] addr,
    output [15:0] instr
);
  reg [15:0] mem [0:255];
    initial begin
        mem[0]  = 16'h0001;
        mem[1]  = 16'h0002;
        mem[2]  = 16'h0003;
        mem[3]  = 16'h0004;
        mem[4]  = 16'h0005;
	mem[5]  = 16'h0006;
	mem[6]  = 16'h0007;
	mem[7]  = 16'h0008;
end
    assign instr = mem[addr[7:0]];
endmodule
