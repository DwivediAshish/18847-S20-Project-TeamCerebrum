module lfsr_tb ();

	logic clk;    // Clock
	logic rst_b;  // Asynchronous reset active low
	logic [7:0] seed;
	logic [7:0] probability;
	logic prob_bit;


	lfsr_behavioral #(.n(7)) lfsr_inst(.clk(clk),.rst_b(rst_b),.seed(7'h4f),.probability(7'haa),.prob_bit(prob_bit)); 


	integer i = 0;
	integer prob = 0;
    initial begin
		clk = 0;
		forever begin
			#2.5;
			clk = ~clk;
			i = i+1;
			if(prob_bit == 1 && rst_b == 1)
				prob = prob+1;
		end
	end

	initial begin 
		rst_b = 0;
		#10
		rst_b = 1;
	end
	 	
	always_comb begin : proc_ff
		if(i == 150)
			$finish();
	end

      initial begin
        $dumpfile("lfsr.vcd");
        $dumpvars(0);
    end

endmodule