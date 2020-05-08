module comp_edge_resolve (
	input logic rst_b,  // Asynchronous reset active low
	input logic x_edge,
	input logic y_edge,
	output logic [2:0] to_sel_mux	
);

logic neg_y_edge;

always_comb begin
	neg_y_edge = ~y_edge;
	to_sel_mux[2] = x_edge;
	to_sel_mux[1] = y_edge;
end

always_ff @(negedge neg_y_edge, negedge rst_b) begin
    if (~rst_b)
        to_sel_mux[0] <= 'b0;
    else
        to_sel_mux[0] <= x_edge;
end

endmodule
