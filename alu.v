module alu (
    input  wire [3:0] alu_op,
    input  wire [7:0] operand_a,
    input  wire [7:0] operand_b,

    output reg  [7:0] alu_result,
    output reg        zero_flag,
    output reg        carry_flag
);

    reg [8:0] temp;

    always @(*) begin
        alu_result = 8'h00;
        carry_flag = 1'b0;

        case (alu_op)

                       4'b0000: begin
                temp = operand_a + operand_b;
                alu_result = temp[7:0];
                carry_flag = temp[8];
            end

                       4'b0001: begin
                temp = operand_a - operand_b;
                alu_result = temp[7:0];
                carry_flag = temp[8];
            end
                         4'b0010: alu_result = operand_a & operand_b;

                         4'b0011: alu_result = operand_a | operand_b;

                         4'b0100: alu_result = operand_a ^ operand_b;

                         4'b0101: alu_result = ~operand_a;

                         4'b0110: alu_result = operand_a << 1;

                         4'b0111: alu_result = operand_a >> 1;

            default: begin
                alu_result = 8'h00;
                carry_flag = 1'b0;
            end
        endcase
    end

    always @(*) begin
        zero_flag = (alu_result == 8'h00);
    end

endmodule
