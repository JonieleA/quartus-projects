module RAM 
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=8)
(
	input logic [(DATA_WIDTH-1):0] data,
	input  logic [(ADDR_WIDTH-1):0] addr,
	input logic we, clk,
	output logic [(DATA_WIDTH-1):0] q
);

	logic [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	logic [ADDR_WIDTH-1:0] addr_reg;

    initial
    begin
        $readmemb("rom128x8.txt", ram, 2**ADDR_WIDTH-1, 0);
    end

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;

		addr_reg <= addr;
	end
    
	assign q = ram[addr_reg];

endmodule
