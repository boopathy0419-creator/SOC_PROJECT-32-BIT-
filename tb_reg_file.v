module tb_reg_file;

    reg clk;
    reg rstn;
    reg wr_en;

    reg [3:0] rd_addr, rs1_addr, rs2_addr;
    reg [7:0] wr_data;

    wire [7:0] rs1_data, rs2_data;

    reg_file dut (
        .clk(clk),
        .rstn(rstn),
        .wr_en(wr_en),
        .rd_addr(rd_addr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .wr_data(wr_data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

     always #5 clk = ~clk;

    initial begin
        clk = 0;
        rstn = 0;
        wr_en = 0;
        rd_addr = 0;
        rs1_addr = 0;
        rs2_addr = 0;
        wr_data = 0;

        #12 rstn = 1;

               #10;
        wr_en = 1;
        rd_addr = 4'd3;
        wr_data = 8'hAA;

        #10 wr_en = 0;
        rs1_addr = 4'd3;
        rs2_addr = 4'd0;

        #20;

        $finish; #100;
    end
    initial begin
	 $dumpfile("tb.vcd");
        $dumpvars(0, tb_reg_file);

end

endmodule
