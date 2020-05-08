module comp_output_sel (
	input logic [4:0] decision_maker,
	output logic [2:0] sel_u	
);

always_comb begin : proc_output_sel_logic
	case (decision_maker)
		5'b10000 : sel_u = 010;
		5'b00001 : sel_u = 011;
		5'b00000 : sel_u = 100;
		5'b11111 : sel_u = 000;
		5'b11100 : sel_u = 000;
		5'b00111 : sel_u = 001;
		default : sel_u = 100;
	endcase
end

endmodule