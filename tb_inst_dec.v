module tb_inst_dec;
    reg  [15:0] instr;
    reg         zero_flag;

    wire [3:0] opcode, rd, rs1, rs2;
    wire [7:0] imm;
    wire [3:0] alu_op;
    wire reg_wr_en, imm_sel, branch_en;

    inst_dec dut (
        .instr(instr),
        .zero_flag(zero_flag),
        .opcode(opcode),
        .rd_addr(rd),
        .rs1_addr(rs1),
        .rs2_addr(rs2),
        .imm(imm),
        .alu_op(alu_op),
        .reg_wr_en(reg_wr_en),
        .imm_sel(imm_sel),
        .branch_en(branch_en)
    );

    initial begin
        zero_flag = 1;

        instr = 16'h1234; #5;
        $display("opcode=%h rd=%h rs1=%h rs2=%h imm=%h", opcode, rd, rs1, rs2, imm);

        instr = 16'h3001; #5;
        $display("branch_en=%b (BEQ)", branch_en);

        zero_flag = 0;
        instr = 16'h4001; #5;
        $display("branch_en=%b (BNE)", branch_en);

        $finish; #100;
    end
    initial begin
	    $dumpfile("tb.vcd");
	    $dumpvars(0,tb_inst_dec);
    end

endmodule

