module tb_decoder;

reg en;
reg [1:0] a;
wire [3:0]y;

decoder det(
	.en(en),
	.a(a),
	.y(y)
);
initial begin

	en=0 ; a=2'bxx; #10;
	en=1 ; a=2'b00; #10;
	en=1 ; a=2'b01; #10;
	en=1 ; a=2'b10; #10;
	en=1 ; a=2'b00; #10;
	$finish; #200;
end

initial begin
	$dumpfile("tb.fsdb");
	$dumpvars(0,tb_decoder);
end 
endmodule


