`include "ROM.sv"
`timescale 1 ps/ 1 ps
module ROM_tb;

logic [7:0] j;
logic clk;
logic [7:0] q;

int t = 52;

ROM #(.DATA_WIDTH(8), .ADDR_WIDTH(8)) DUT (.addr(j), .clk(clk), .q(q));
initial clk = 0;
always #1 clk = !clk;
initial j = 0;
initial begin
    for (int i = 0; i < 5; i++) begin
        j=$urandom(t) % 256;
        #10 $display(q);
    end
end
initial #100 $finish;
initial begin
    $dumpfile("ROM_tb.vcd");
    $dumpvars(0, ROM_tb);
end

endmodule