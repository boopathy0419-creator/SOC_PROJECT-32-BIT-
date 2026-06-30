module tb_program_counter;
reg clk;
reg rstn;
reg pc_en;
reg branch_en;
reg [3:0] branch_target;
wire [3:0] pc_out;

program_counter dut(
	.clk(clk),
	.rstn(rstn),
	.pc_en(pc_en),
	.branch_en(branch_en),
	.branch_target(branch_target),
	.pc_out(pc_out)
);
initial begin
	clk = 0;#10;
	rstn = 0;pc_en = 0; branch_en = 0;
     
branch_target =16'b0010; #10;
	rstn = 1;pc_en = 1;branch_en = 0;#20;
     branch_en = 1;#10;
        branch_en = 0; #10;
        pc_en = 0;
       $finish;#20;
end

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb_program_counter);
end
endmodule

