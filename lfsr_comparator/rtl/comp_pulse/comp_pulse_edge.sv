module comp_pulse_edge (
	input rst_b,
	input logic x_pulse,
	input logic y_pulse,
	output logic x_edge,
	output logic y_edge	
);

logic setup_x_pulse,setup_y_pulse;

assign setup_x_pulse = ~(~x_pulse);
assign setup_y_pulse = ~(~y_pulse);

always_ff @(posedge setup_x_pulse, negedge rst_b) begin
    if (~rst_b)
        x_edge <= 'b0;
    else
        x_edge <= x_pulse;
end

always_ff @(posedge setup_y_pulse, negedge rst_b) begin
    if (~rst_b)
        y_edge <= 'b0;
    else
        y_edge <= y_pulse;
end


endmodule