
// Generated by Cadence Genus(TM) Synthesis Solution 18.14-s037_1
// Generated on: Apr 30 2020 14:27:13 EDT (Apr 30 2020 18:27:13 UTC)

// Verification Directory fv/comp_pulse 

module register_WL2(clk, rst_b, d, q, wen);
  input clk, rst_b, wen;
  input [1:0] d;
  output [1:0] q;
  wire clk, rst_b, wen;
  wire [1:0] d;
  wire [1:0] q;
  DFFRHQX1 \q_reg[0] (.RN (rst_b), .CK (clk), .D (d[0]), .Q (q[0]));
  DFFRHQX1 \q_reg[1] (.RN (rst_b), .CK (clk), .D (d[1]), .Q (q[1]));
endmodule

module comp_pulse(clk, x_pulse, y_pulse, rst_b, u_capture, u_minus,
     u_search, u_backoff, prob, inc);
  input clk, x_pulse, y_pulse, rst_b;
  input [6:0] u_capture, u_minus, u_search, u_backoff;
  output [6:0] prob;
  output inc;
  wire clk, x_pulse, y_pulse, rst_b;
  wire [6:0] u_capture, u_minus, u_search, u_backoff;
  wire [6:0] prob;
  wire inc;
  wire [1:0] state;
  wire UNCONNECTED_HIER_Z, n_0, n_1, n_2, n_3, n_4, n_5, n_6;
  wire n_7, n_8, n_9, n_10, n_11, n_12, n_13, n_14;
  wire n_15, n_16, n_17, n_18, n_19, n_20, n_21, n_22;
  wire n_23, n_24, n_25;
  register_WL2 reg_state(.clk (clk), .rst_b (rst_b), .d ({n_9, n_25}),
       .q (state), .wen (UNCONNECTED_HIER_Z));
  NAND2X1 g1420__8780(.A (n_24), .B (n_16), .Y (prob[6]));
  NAND2X1 g1421__4296(.A (n_20), .B (n_15), .Y (prob[4]));
  NAND2X1 g1422__3772(.A (n_19), .B (n_17), .Y (prob[1]));
  NAND2X1 g1423__1474(.A (n_18), .B (n_13), .Y (prob[3]));
  NAND2X1 g1424__4547(.A (n_22), .B (n_14), .Y (prob[5]));
  NAND2X1 g1425__9682(.A (n_21), .B (n_12), .Y (prob[0]));
  NAND2X1 g1426__2683(.A (n_23), .B (n_11), .Y (prob[2]));
  AOI22X1 g1427__1309(.A0 (u_backoff[6]), .A1 (n_10), .B0
       (u_search[6]), .B1 (n_0), .Y (n_24));
  AOI22X1 g1428__6877(.A0 (u_backoff[2]), .A1 (n_10), .B0
       (u_search[2]), .B1 (n_0), .Y (n_23));
  AOI22X1 g1429__2900(.A0 (u_backoff[5]), .A1 (n_10), .B0
       (u_search[5]), .B1 (n_0), .Y (n_22));
  AOI22X1 g1430__2391(.A0 (u_backoff[0]), .A1 (n_10), .B0
       (u_search[0]), .B1 (n_0), .Y (n_21));
  AOI22X1 g1431__7675(.A0 (u_backoff[4]), .A1 (n_10), .B0
       (u_search[4]), .B1 (n_0), .Y (n_20));
  AOI22X1 g1432__7118(.A0 (u_backoff[1]), .A1 (n_10), .B0
       (u_search[1]), .B1 (n_0), .Y (n_19));
  AOI22X1 g1433__8757(.A0 (u_backoff[3]), .A1 (n_10), .B0
       (u_search[3]), .B1 (n_0), .Y (n_18));
  AOI22X1 g1434__1786(.A0 (u_capture[1]), .A1 (n_5), .B0 (u_minus[1]),
       .B1 (n_8), .Y (n_17));
  AOI22X1 g1435__5953(.A0 (u_capture[6]), .A1 (n_5), .B0 (u_minus[6]),
       .B1 (n_8), .Y (n_16));
  MX2X1 g1436__5703(.A (x_pulse), .B (n_7), .S0 (state[0]), .Y (n_25));
  AOI22X1 g1437__7114(.A0 (u_capture[4]), .A1 (n_5), .B0 (u_minus[4]),
       .B1 (n_8), .Y (n_15));
  AOI22X1 g1438__5266(.A0 (u_capture[5]), .A1 (n_5), .B0 (u_minus[5]),
       .B1 (n_8), .Y (n_14));
  AOI22X1 g1439__2250(.A0 (u_capture[3]), .A1 (n_5), .B0 (u_minus[3]),
       .B1 (n_8), .Y (n_13));
  AOI22X1 g1440__6083(.A0 (u_capture[0]), .A1 (n_5), .B0 (u_minus[0]),
       .B1 (n_8), .Y (n_12));
  AOI22X1 g1441__2703(.A0 (u_capture[2]), .A1 (n_5), .B0 (u_minus[2]),
       .B1 (n_8), .Y (n_11));
  OR2X1 g1442__5795(.A (n_6), .B (n_5), .Y (inc));
  NAND3BX1 g1444__7344(.AN (n_8), .B (n_1), .C (n_3), .Y (n_9));
  NOR2X2 g1445__1840(.A (rst_b), .B (n_4), .Y (n_10));
  NAND2BX1 g1446__5019(.AN (rst_b), .B (n_3), .Y (n_7));
  AND2X1 g1447__1857(.A (x_pulse), .B (n_2), .Y (n_8));
  NAND2BX1 g1449__9906(.AN (x_pulse), .B (n_2), .Y (n_4));
  NOR3BX1 g1450__8780(.AN (state[0]), .B (state[1]), .C (rst_b), .Y
       (n_6));
  AOI2BB1X2 g1451__4296(.A0N (state[0]), .A1N (x_pulse), .B0 (n_3), .Y
       (n_5));
  NAND2BX1 g1452__3772(.AN (state[1]), .B (y_pulse), .Y (n_3));
  NAND2X1 g1453__1474(.A (state[1]), .B (rst_b), .Y (n_1));
  NOR2BX1 g1454__4547(.AN (state[1]), .B (state[0]), .Y (n_2));
  NOR2BX2 g2__9682(.AN (n_6), .B (y_pulse), .Y (n_0));
endmodule

