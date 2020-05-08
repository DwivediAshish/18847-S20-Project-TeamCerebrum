module comp_tb ();

	logic clk;    // Clock
	logic rst_b;  // Asynchronous reset active low
	logic x_pulse;
	logic y_pulse;
	logic [2:0] sel_u;


	comp_edge_resolve  comp_inst(.x_edge(x_pulse),.y_edge(y_pulse),.rst_b(rst_b),.to_sel_mux(sel_u)); 


	integer i = 0;
	integer prob = 0;
    initial begin
		clk = 0;
		forever begin
			#2.5;
			clk = ~clk;
			i = i+1;
			x_pulse = 0;
			if(i%16 > 3)
				x_pulse = 1;
			y_pulse = 0;
			if(i%16 > 9)
				y_pulse = 0;
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
