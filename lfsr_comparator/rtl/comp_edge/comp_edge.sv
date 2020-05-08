module comp_edge (
	input logic rst_b,  // Asynchronous reset active low
	input logic x_edge,
	input logic y_edge,
	input logic [6:0] u_capture,u_minus,u_search,u_backoff,
	output logic [6:0] prob,
	output logic inc	
);
logic [2:0] to_sel_mux;
comp_edge_resolve comp_edge_resolve_inst(.rst_b,.x_edge,.y_edge,.to_sel_mux);
edge_sel edge_sel_inst(.cases(to_sel_mux),.u_capture,.u_backoff,.u_minus,.u_search,.prob,.inc);
endmodule