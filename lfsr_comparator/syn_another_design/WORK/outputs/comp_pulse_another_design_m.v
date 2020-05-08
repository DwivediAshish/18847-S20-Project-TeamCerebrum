
// Generated by Cadence Genus(TM) Synthesis Solution 18.14-s037_1
// Generated on: Apr 30 2020 14:24:40 EDT (Apr 30 2020 18:24:40 UTC)

// Verification Directory fv/comp_pulse_another_design 

module comp_edge_resolve(rst_b, x_edge, y_edge, to_sel_mux);
  input rst_b, x_edge, y_edge;
  output [2:0] to_sel_mux;
  wire rst_b, x_edge, y_edge;
  wire [2:0] to_sel_mux;
  DFFRHQX1 \to_sel_mux_reg[0] (.RN (rst_b), .CK (y_edge), .D (x_edge),
       .Q (to_sel_mux[0]));
endmodule

module edge_sel(cases, u_capture, u_minus, u_search, u_backoff, prob,
     inc);
  input [2:0] cases;
  input [6:0] u_capture, u_minus, u_search, u_backoff;
  output [6:0] prob;
  output inc;
  wire [2:0] cases;
  wire [6:0] u_capture, u_minus, u_search, u_backoff;
  wire [6:0] prob;
  wire inc;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_21;
  NAND2XL g609__8780(.A (n_21), .B (n_12), .Y (prob[6]));
  NAND2XL g610__4296(.A (n_8), .B (n_10), .Y (prob[5]));
  NAND2XL g611__3772(.A (n_15), .B (n_18), .Y (prob[4]));
  NAND2XL g612__1474(.A (n_11), .B (n_13), .Y (prob[3]));
  NAND2XL g613__4547(.A (n_17), .B (n_16), .Y (prob[0]));
  NAND2XL g614__9682(.A (n_20), .B (n_19), .Y (prob[1]));
  NAND2XL g615__2683(.A (n_14), .B (n_9), .Y (prob[2]));
  AOI22XL g616__1309(.A0 (u_minus[6]), .A1 (n_6), .B0 (u_capture[6]),
       .B1 (n_0), .Y (n_21));
  AOI22XL g617__6877(.A0 (u_backoff[1]), .A1 (n_5), .B0 (u_capture[1]),
       .B1 (n_0), .Y (n_20));
  AOI22XL g618__2900(.A0 (u_search[1]), .A1 (n_4), .B0 (u_minus[1]),
       .B1 (n_6), .Y (n_19));
  AOI22XL g619__2391(.A0 (u_search[4]), .A1 (n_4), .B0 (u_backoff[4]),
       .B1 (n_5), .Y (n_18));
  AOI22XL g620__7675(.A0 (u_minus[0]), .A1 (n_6), .B0 (u_capture[0]),
       .B1 (n_0), .Y (n_17));
  AOI22XL g621__7118(.A0 (u_search[0]), .A1 (n_4), .B0 (u_backoff[0]),
       .B1 (n_5), .Y (n_16));
  AOI22XL g622__8757(.A0 (u_minus[4]), .A1 (n_6), .B0 (u_capture[4]),
       .B1 (n_0), .Y (n_15));
  AOI22XL g623__1786(.A0 (u_backoff[2]), .A1 (n_5), .B0 (u_minus[2]),
       .B1 (n_6), .Y (n_14));
  AOI22XL g624__5953(.A0 (u_search[3]), .A1 (n_4), .B0 (u_capture[3]),
       .B1 (n_0), .Y (n_13));
  AOI22XL g625__5703(.A0 (u_search[6]), .A1 (n_4), .B0 (u_backoff[6]),
       .B1 (n_5), .Y (n_12));
  AOI22XL g626__7114(.A0 (u_backoff[3]), .A1 (n_5), .B0 (u_minus[3]),
       .B1 (n_6), .Y (n_11));
  AOI22XL g627__5266(.A0 (u_search[5]), .A1 (n_4), .B0 (u_backoff[5]),
       .B1 (n_5), .Y (n_10));
  AOI22XL g628__2250(.A0 (u_search[2]), .A1 (n_4), .B0 (u_capture[2]),
       .B1 (n_0), .Y (n_9));
  AOI22XL g629__6083(.A0 (u_minus[5]), .A1 (n_6), .B0 (u_capture[5]),
       .B1 (n_0), .Y (n_8));
  OR2X1 g630__2703(.A (n_4), .B (n_0), .Y (inc));
  NOR2X2 g631__5795(.A (cases[0]), .B (n_2), .Y (n_6));
  NOR2X2 g633__7344(.A (cases[0]), .B (n_3), .Y (n_5));
  NOR2X2 g634__1840(.A (cases[0]), .B (n_1), .Y (n_4));
  NAND2BXL g635__5019(.AN (cases[2]), .B (cases[1]), .Y (n_3));
  NAND2BXL g637__1857(.AN (cases[1]), .B (cases[2]), .Y (n_1));
  NAND2X1 g638__9906(.A (cases[1]), .B (cases[2]), .Y (n_2));
  NOR2BX2 g2__8780(.AN (cases[0]), .B (n_2), .Y (n_0));
endmodule

module comp_edge(rst_b, x_edge, y_edge, u_capture, u_minus, u_search,
     u_backoff, prob, inc);
  input rst_b, x_edge, y_edge;
  input [6:0] u_capture, u_minus, u_search, u_backoff;
  output [6:0] prob;
  output inc;
  wire rst_b, x_edge, y_edge;
  wire [6:0] u_capture, u_minus, u_search, u_backoff;
  wire [6:0] prob;
  wire inc;
  wire [2:0] to_sel_mux;
  wire UNCONNECTED, UNCONNECTED0;
  comp_edge_resolve comp_edge_resolve_inst(.rst_b (rst_b), .x_edge
       (x_edge), .y_edge (y_edge), .to_sel_mux ({UNCONNECTED0,
       UNCONNECTED, to_sel_mux[0]}));
  edge_sel edge_sel_inst(.cases ({x_edge, y_edge, to_sel_mux[0]}),
       .u_capture (u_capture), .u_minus (u_minus), .u_search
       (u_search), .u_backoff (u_backoff), .prob (prob), .inc (inc));
endmodule

module comp_pulse_edge(rst_b, x_pulse, y_pulse, x_edge, y_edge);
  input rst_b, x_pulse, y_pulse;
  output x_edge, y_edge;
  wire rst_b, x_pulse, y_pulse;
  wire x_edge, y_edge;
  DFFRHQX1 x_edge_reg(.RN (rst_b), .CK (x_pulse), .D (x_pulse), .Q
       (x_edge));
  DFFRHQX1 y_edge_reg(.RN (rst_b), .CK (y_pulse), .D (y_pulse), .Q
       (y_edge));
endmodule

module comp_pulse_another_design(x_pulse, y_pulse, rst_b, u_capture,
     u_minus, u_search, u_backoff, prob, inc);
  input x_pulse, y_pulse, rst_b;
  input [6:0] u_capture, u_minus, u_search, u_backoff;
  output [6:0] prob;
  output inc;
  wire x_pulse, y_pulse, rst_b;
  wire [6:0] u_capture, u_minus, u_search, u_backoff;
  wire [6:0] prob;
  wire inc;
  wire x_edge, y_edge;
  comp_edge comp_edge_inst(.rst_b (rst_b), .x_edge (x_edge), .y_edge
       (y_edge), .u_capture (u_capture), .u_minus (u_minus), .u_search
       (u_search), .u_backoff (u_backoff), .prob (prob), .inc (inc));
  comp_pulse_edge comp_pulse_edge_inst(.rst_b (rst_b), .x_pulse
       (x_pulse), .y_pulse (y_pulse), .x_edge (x_edge), .y_edge
       (y_edge));
endmodule

