module tb_pc;

reg clk;
reg rstn;
reg pc_en;
reg branch_en;
reg [15:0] branch_target;
wire [15:0] pc_out;
pc dut (
    .clk(clk),
    .rstn(rstn),
    .pc_en(pc_en),
    .branch_en(branch_en),
    .branch_target(branch_target),
    .pc_out(pc_out)
);
always #5 clk = ~clk;
initial begin
     clk = 0;
    rstn = 0;
    pc_en = 0;
    branch_en = 0;
    branch_target = 16'h0010;
    #8 rstn = 1;      
    pc_en = 1;
    #20; 
    branch_en = 1;   
    #10;
    branch_en = 0; 
    #20;
    pc_en = 0;      
    #20;
    $finish; #100;
end
initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_pc);
end
endmodule

