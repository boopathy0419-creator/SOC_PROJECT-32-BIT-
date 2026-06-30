module tb_demux;

   
    reg din;
    reg [1:0] sel;
    wire [3:0] dout;

        demux uut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

        initial begin
        $display("Time\t din sel dout");
        $monitor("%0t\t  %b   %b   %b",
                 $time, din, sel, dout);

        // Test with din = 1
        din = 1'b1;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Test with din = 0
        din = 1'b0;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish; #100;
    end
    initial begin
	    $dumpfile("tb.fsdb");
	    $dumpvars(0,tb_demux);
    end

endmodule

