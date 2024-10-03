`include "RAM.sv"
`timescale 1 ps/ 1 ps
module ROM_tb;

logic [7:0] j;
logic clk, we;
logic [7:0] q;
logic [7:0] d;
int t = 52; // Здесь менять сид

RAM #(.DATA_WIDTH(8), .ADDR_WIDTH(8)) DUT (.addr(j), .clk(clk), .q(q), .we(we), .data(d));
initial begin
    clk = 0;
    we = 0;
end 
always #1 clk = !clk;
initial j = 0;
initial begin
    for (int i = 0; i < 5; i++) begin
        j=$urandom(t) % 256;
        #5;
        d=$urandom(t) % 256;
        we = 1;
        #2 we = 0;
        #3;
    end

end
initial #100 $finish;
initial begin
    $dumpfile("RAM_tb.vcd");
    $dumpvars(0, ROM_tb);
end

endmodule