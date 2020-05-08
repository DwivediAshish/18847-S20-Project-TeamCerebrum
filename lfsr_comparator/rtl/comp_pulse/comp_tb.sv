module comp_tb ();

	logic clk;    // Clock
	logic rst_b;  // Asynchronous reset active low
	logic x_pulse;
	logic y_pulse;
	logic [2:0] sel_u;
	logic [6:0] u_capture,u_minus,u_backoff,u_search;
	logic [6:0] prob_out;
	logic inc;


	comp_pulse  comp_inst(.x_pulse,.y_pulse,.rst_b,.u_capture,.u_minus,.u_backoff,.u_search,.clk,.prob(prob_out),.inc); 

	assign u_capture = 7'd78;
	assign u_minus = 7'd60;
	assign u_backoff = 7'd101;
	assign u_search = 7'd38;

	integer i = 0;
	integer prob = 0;
    initial begin
		clk = 0;
		forever begin
			#2.5;
			clk = ~clk;
			i = i+1;
			x_pulse = 0;
			if(i%16 == 3 | i%16 == 4)
				x_pulse = 1;
			y_pulse = 0;
			if(i%16 == 9 | i%16 == 10)
				y_pulse = 1;
			rst_b = 1;
			if(i%16 == 1 || i%16 == 2)
				rst_b = 0;
		end
	end
	 	
	always_comb begin : proc_ff
		if(i == 37)
			$finish();
	end

      initial begin
        $dumpfile("comp.vcd");
        $dumpvars(0);
    end

endmodule
