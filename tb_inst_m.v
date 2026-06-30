module tb_inst_m;
    reg [15:0] addr;
    wire [15:0] instr;
inst_m dut(
	    .addr(addr),
	    .instr(instr)
    );
 initial begin
        addr = 0; #5;
	addr = 1; #5;
	addr = 2; #5;
	addr = 3; #5;
	addr = 4; #5;
	addr = 5; #5;
	addr = 6; #5;
     	addr = 7; #5;
        $finish;#100;
	end
initial begin
	    $dumpfile("tb.vcd");
	    $dumpvars(0,tb_inst_m);
    end
endmodule
