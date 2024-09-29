module ROM
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=8)
(
    input logic [(ADDR_WIDTH-1):0] addr,
    input logic clk, 
    output logic [(DATA_WIDTH-1):0] q
);

// Declare the ROM variable
logic [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

initial
    begin
        $readmemb("rom128x8.txt", rom);
    end

    always_ff @ (posedge clk)
    begin
        q <= rom[addr];
    end

endmodule
