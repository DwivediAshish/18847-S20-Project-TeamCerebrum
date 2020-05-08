// Code your design here
module fetch_trans_raster #(parameter IPAD_DW = 1)(
	input				            clk,
	input				            rst_b,
    input    	[IPAD_DW-1:0]      	in,
    input                          fetch_valid,    //from outside the chip to fecth_unit
	input							fpga_rdy,		//from outside the chip to raster
//    input	logic						stall,			//from outsdie to raster
	output                        	fetch_ready,    //fetch unit to outside 
  output		[1:0]				output_to_fpga,	//raster to outside
	output							valid_fpga,
	input  smooth,
//	output	logic						finish_raster,
output							start_of_frame
//	output	logic						end_of_frame
);
   localparam I_WIDTH = 16, D_WIDTH = 16, IC_SIZE = 512, DC_SIZE = 512;

      reg                      tx_ready;
      reg                       op_val_DT;
      reg [D_WIDTH*4 -1 : 0]    data_out0_DT, data_out1_DT, data_out2_DT, data_out3_DT;
      reg                       type_DT, is_vertex_DT, is_color_DT;  
      //logic [6:0]                 data_count_DT;                             //number of data values to be read from the data buffer
      reg                       matrix_sel_DT;                             // which stack to select
      reg                       matrix_mult_DT;                            //what matrix operation to be performed
      reg                       gl_change_mode_DT;
      reg                       load_matrix_DT;
      reg                       glSwap_DT;
      reg                       tx_valid_DT;
      reg                       gl_pop_DT, gl_push_DT;
      reg                       gl_begin_DT, gl_end_DT;

//logic						start_of_frame;
reg						end_of_frame;

reg finish_raster;
reg stall;

assign stall = 1'b0;

fetch_top#(.IPAD_DW (IPAD_DW),.I_WIDTH(I_WIDTH),.D_WIDTH(D_WIDTH),.IC_SIZE(IC_SIZE),.DC_SIZE(DC_SIZE)) fetch_inst(
  .clk(clk), 
  		.rst_n(rst_b),
  .in(in),
  .tx_ready(tx_ready),
  .fetch_valid(fetch_valid),       
  .fetch_ready(fetch_ready),  
  .op_val_DT(op_val_DT),
  .data_out0_DT(data_out0_DT), .data_out1_DT(data_out1_DT), .data_out2_DT(data_out2_DT), .data_out3_DT(data_out3_DT),
  .type_DT(type_DT), //not needed
  .is_vertex_DT(is_vertex_DT), .is_color_DT(is_color_DT),  
       //.data_count_DT,          					//not needed                 
  .matrix_sel_DT(matrix_sel_DT),                             	// which stack to select
  .matrix_mult_DT(matrix_mult_DT),                             //what matrix operation to be performed
  .gl_change_mode_DT(gl_change_mode_DT),
  .load_matrix_DT(load_matrix_DT),

  .glSwap_DT(glSwap_DT),
  .tx_valid_DT(tx_valid_DT), //not needed
  .gl_pop_DT(gl_pop_DT), .gl_push_DT(gl_push_DT),
  .gl_begin_DT(gl_begin_DT), .gl_end_DT(gl_end_DT)
);

	reg	[31:0]	vertex_1, vertex_2, vertex_3;
	reg	[15:0]	color_1, color_2, color_3;
	reg			raster_start, vp_swap, rdy_3_vertex;
	reg			raster_end,raster_rdy;
	
	transformation_unit	inst_trans_unit(.clk(clk),							
										.rst_b(rst_b),
										.op_val(op_val_DT),					// signals from op_val to param4 come from fetch_decode unit
										.matrix_mult(matrix_mult_DT),
										.gl_vertex(is_vertex_DT),
										.gl_color(is_color_DT),
										.gl_change_mode(gl_change_mode_DT),
										.gl_matrix_mode(matrix_sel_DT),
										.push_matrix(gl_push_DT),
										.pop_matrix(gl_pop_matrix_DT),
										.load_matrix(load_matrix_DT),
										.swap(glSwap_DT),
										.gl_begin(gl_begin_DT),
										.gl_end(gl_end_DT),
										.param1(data_out0_DT),.param2(data_out1_DT),.param3(data_out2_DT), .param4(data_out3_DT),
										.raster_rdy(raster_rdy),			// sinals from vertex_1 to rdy_3_vertex go to rasterizer
										.vertex_1(vertex_1),.vertex_2(vertex_2),.vertex_3(vertex_3),
										.color_1(color_1),.color_2(color_2),.color_3(color_3),
										.raster_start(raster_start),
										.rdy_3_vertex(rdy_3_vertex),
										.vp_swap(vp_swap),
										.raster_end(raster_end),
										.trans_rdy(tx_ready));				//trans_rdy goes to fetch_decode unit
										
	// add raster top module here									
	raster inst_raster_unit(.clk(clk),
							.rst_b(rst_b),
							.start_from_transformation(raster_start),
							.flush_frame(vp_swap),
							.c_v_0(color_1[14:0]),.c_v_1(color_2[14:0]),.c_v_2(color_3[14:0]),
							.v_0(vertex_1),.v_1(vertex_2),.v_2(vertex_3),
							.fpga_rdy(fpga_rdy),
							.stall(stall),
							.rdy_to_transfomation(raster_rdy),
							.output_to_fpga(output_to_fpga),
							.valid_fpga(valid_fpga),
							.finish_raster(finish_raster),
							.start_of_frame(start_of_frame),
							.end_of_frame(end_of_frame),
							.gl_end(raster_end),
							.smooth(smooth)
							);

endmodule
