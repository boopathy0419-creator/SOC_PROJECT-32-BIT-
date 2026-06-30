module program_counter(
	
	input clk,
	input rst_n,
	input pc_en,
	input branch_en,
	input [15:0] branch_target,
	output [15:0] pc_out
);

always (posedge clk or negedge rstn) begin
	if(rstn)
		pc_out<=16'b0000;

	else if (pc_en)

		 (pc_out<=pc_out);

	 else if (branch_en)

		 pc_en<=branch_en;
	 else

		 pc_out<=pc_out + 1
 end

 endmodule
