module register #(parameter W = 8)
(input logic clock, reset, enable,
input logic [W-1:0] data_in,
output logic [W-1:0] data_out);
always_ff @(posedge clock or negedge reset)
if(!reset)
data_out <= {W{1'b0}};
else if(enable)
data_out <= data_in;
endmodule