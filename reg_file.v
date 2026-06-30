module reg_file (
    input  wire        clk,
    input  wire        rstn,
    input  wire        wr_en,

    input  wire [3:0]  rd_addr,
    input  wire [3:0]  rs1_addr,
    input  wire [3:0]  rs2_addr,

    input  wire [7:0]  wr_data,

    output wire [7:0]  rs1_data,
    output wire [7:0]  rs2_data
);

      reg [7:0] regs [0:15];

    integer i;

     always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
                      for (i = 0; i < 16; i = i + 1)
                regs[i] <= 8'h00;
        end
        else begin
            if (wr_en) begin
                regs[rd_addr] <= wr_data;
            end
        end
    end

    // -------------------------
    // Combinational reads
    // -------------------------
    assign rs1_data = regs[rs1_addr];
    assign rs2_data = regs[rs2_addr];

endmodule
