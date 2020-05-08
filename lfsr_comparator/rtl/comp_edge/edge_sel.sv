module edge_sel (
	input logic [2:0] cases,
	input logic [6:0] u_capture,u_minus,u_search,u_backoff,
	output logic [6:0] prob,
	output logic inc	
);

always_comb begin 
	prob = 0;
	inc = 0;
	case (cases)
		3'b000 : begin
			prob = 0;
			inc = 0;
		end
		3'b010 : begin
			prob = u_backoff;
			inc = 0;
		end
		3'b100 : begin
			prob = u_search;
			inc = 1;
		end
		3'b110 : begin
			prob = u_minus;
			inc = 0;
		end
		3'b111 : begin
			prob = u_capture;
			inc = 1;
		end
		default : /* default */;
	endcase
end

endmodule