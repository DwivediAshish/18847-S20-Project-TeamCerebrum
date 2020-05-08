module comp_pulse_another_design (
	// input clk,
	input x_pulse,    // Clock
	input y_pulse, // Clock Enable
	input rst_b,  // Asynchronous reset active low
	input logic [6:0] u_capture,u_minus,u_search,u_backoff,
	output logic [6:0] prob,
	output logic inc
);

logic x_edge,y_edge;
comp_pulse_edge comp_pulse_edge_inst(.rst_b,.x_pulse,.y_pulse,.x_edge,.y_edge);
comp_edge comp_edge_inst(.rst_b,.x_edge,.y_edge,.u_search,.u_minus,.u_capture,.u_backoff,.prob,.inc);

endmodule