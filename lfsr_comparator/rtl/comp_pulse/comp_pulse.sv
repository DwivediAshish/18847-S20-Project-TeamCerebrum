module comp_pulse (
	input clk,
	input x_pulse,    // Clock
	input y_pulse, // Clock Enable
	input rst_b,  // Asynchronous reset active low
	input logic [6:0] u_capture,u_minus,u_search,u_backoff,
	output logic [6:0] prob,
	output logic inc
	// output logic [2:0] sel_u
);

// reg setup_x_pulse,setup_y_pulse;
// reg latched_x,latched_y;
// reg [4:0] decision_maker;

// assign setup_x_pulse = ~(~(x_pulse)); // avoid setup violation
// assign setup_y_pulse = ~(~(y_pulse));

// always_ff @(posedge setup_x_pulse or negedge rst_b) begin : proc_latched_x
// 	if(~rst_b) begin
// 		latched_x <= 0;
// 	end else begin
// 		 latched_x <= x_pulse;
// 	end
// end

// always_ff @(posedge setup_y_pulse or negedge rst_b) begin : proc_latched_y
// 	if(~rst_b) begin
// 		latched_y <= 0;
// 	end else begin
// 		 latched_y <= y_pulse;
// 	end
// end

// assign decision_maker = {setup_x_pulse,(setup_x_pulse & latched_y),(setup_y_pulse & latched_x),setup_y_pulse};

// always_comb begin : proc_output_sel_logic
// 	case (decision_maker)
// 		4'b1000 : sel_u = 010; // x = finite,y = inf
// 		4'b0001 : sel_u = 011; // x = inf   ,y = finite
// 		4'b0000 : sel_u = 100; // x = inf   ,y = inf
// 		4'b1111 : sel_u = 000; // x == y = finite
// 		4'b1100 : sel_u = 001; // x < y both are finite
// 		4'b0011 : sel_u = 000; // y > x both are finite
// 		default : sel_u = 100;
// 	endcase
// end
// 

localparam no_x_no_y = 2'd0,no_y_x = 2'd1,no_x_y = 2'd2,x_y = 2'd3;
logic [1:0] next_state,state;

always_comb begin : proc_state_output
	next_state = state;
	// sel_u = 3'd5;
	prob = 0;
	inc = 0;
	case (state)
		no_x_no_y : begin
			if(~rst_b) begin
				next_state = no_x_no_y;
				// sel_u = 3'd5;
				prob = 0;
				inc = 0;
			end
			if(x_pulse)
				next_state = no_y_x;
			if(y_pulse)
				next_state = no_x_y;
			if(x_pulse & y_pulse) begin
				next_state = x_y;
				// sel_u = 3'd1;
				prob = u_capture;
				inc = 1;
			end	 
		end
		no_y_x : begin
			if(~rst_b) begin
				next_state = no_x_no_y;
				// sel_u = 3'd3;
				prob = u_search;
				inc = 1;
			end
			if(y_pulse) begin
				next_state = x_y;
				// sel_u = 3'd1;
				prob = u_capture;
				inc = 1;
			end
		end
		no_x_y : begin
			if(~rst_b) begin
				next_state = no_x_no_y;
				// sel_u = 3'd4;
				prob = u_backoff;
				inc = 0;
			end
			if(x_pulse) begin
				next_state = x_y;
				// sel_u = 3'd2;
				prob = u_minus;
				inc = 0;
			end
		end
		x_y : begin
			if(~rst_b) begin
				next_state = no_x_no_y;
			end
		end
	 	default : /* default */;
	 endcase 
 end 

 // always_ff @(posedge clk , negedge rst_b) begin : proc_transistion
 // 	if(~rst_b) begin
 // 		state <= no_x_no_y;
 //	end else begin
 // 		state <= next_state;
 // 	end
 // end
 // 
 register #(.WL(2)) reg_state(.clk(clk),.rst_b(rst_b),.d(next_state),.q(state),.wen(1));
 

endmodule
