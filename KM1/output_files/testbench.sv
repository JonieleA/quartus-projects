`timescale 1 ps/ 1 ps

module testbench    #(parameter W = 16 );
	logic               CLK_i;
	logic               rst_n_i;
	
	logic [ W-1 : 0 ]   A_i;
	logic [ W-1 : 0 ]   B_i;
	logic [ W-1 : 0 ]   S_o;
	logic [ W   : 0 ]   full_add;
	logic               P_i; 
	logic               C_o;
	
par_posl_adder_param #(.W(W)) DUT (.A(A_i), .B(B_i), .C_in(P_i), .C_out(C_o), .S(S_o));
	
	
initial begin
	$display("Running testbench");
	CLK_i = 0;
	A_i   = 0;
	B_i   = 0;
	P_i   = 0;
	
end

always #5  CLK_i =  !CLK_i;

initial begin
	rst_n_i = 1;
	repeat (2) #1 rst_n_i = !rst_n_i;
end
      
initial begin
	for (int i = 0; i <= 2**W; i++) begin
		A_i = $urandom_range(0, 2**W);
		B_i = $urandom_range(0, 2**W);;   
		P_i = $urandom_range(0, 1);
		#10;                     
	end
end

initial begin
    #50000 $display("Testbench is OK!");
end

endmodule