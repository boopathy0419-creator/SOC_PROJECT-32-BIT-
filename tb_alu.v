module tb_alu;

    reg  [3:0] alu_op;
    reg  [7:0] operand_a;
    reg  [7:0] operand_b;

    wire [7:0] alu_result;
    wire zero_flag;
    wire carry_flag;

       alu uut (
        .alu_op(alu_op),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_result(alu_result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag)
    );

    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);
        operand_a = 8'd10;
        operand_b = 8'd5;
        alu_op = 4'b0000;
        #10;
        operand_a = 8'd20;
        operand_b = 8'd5;
        alu_op = 4'b0001;
        #10;
        operand_a = 8'b10101010;
        operand_b = 8'b11001100;
        alu_op = 4'b0010;
        #10;
        alu_op = 4'b0011;
        #10;
        alu_op = 4'b0100;
        #10;
        operand_a = 8'h0F;
        alu_op = 4'b0101;
        #10;
        operand_a = 8'h01;
        alu_op = 4'b0110;
        #10;
        operand_a = 8'h80;
        alu_op = 4'b0111;
        #10;
        operand_a = 8'h00;
        operand_b = 8'h00;
        alu_op = 4'b0000;
        #10;

        $finish; #100;
    end
    initial begin
       $dumpfile("tb.vcd");
        $dumpvars(0, tb_alu);
end
endmodule
