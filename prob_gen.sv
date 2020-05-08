module prob_gen 
		#(parameter n = 7, // n in 2^n should be less than 16
	parameter n2 = 2**n)
	(

		input  logic [n-1:0] random_value,
		input  logic [n-1:0] probability,
		output logic prob_bit
);

reg [n2-1:0] decoder_out;
reg [n2-1:0] prob_out;
reg [n2-1:0] check;

// give output as 1 with probability = (probability)/128
assign decoder_out = (1 << random_value);
assign prob_out = {n2{1'b1}} << probability;
assign check = decoder_out | prob_out;
always_comb begin : proc_check
	if(check == prob_out)
		prob_bit = 0;
	else
		prob_bit = 1;
end

endmodule