module tb_seg_display;
     reg  [15:0] data;
     wire [7:0] seg0;
     wire [7:0] seg1;
     wire [7:0] seg2;
     wire [7:0] seg3;
seg_display dut (
    .data(data),
    .seg0(seg0),
    .seg1(seg1),
    .seg2(seg2),
    .seg3(seg3)
);
initial begin
    $monitor("Time=%0t Data=%h", $time, data);
    data = 16'h1234; #10;
    data = 16'hABCD; #10;
    data = 16'h5678; #10;
    data = 16'hFFFF; #10;
    $finish; #100;
end
initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_seg_display);
end
endmodule
