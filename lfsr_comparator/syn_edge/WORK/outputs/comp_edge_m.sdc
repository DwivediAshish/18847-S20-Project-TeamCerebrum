# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Thu Apr 30 14:22:29 EDT 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design comp_edge

group_path -weight 1.000000 -name C2C -from [get_cells {comp_edge_resolve_inst/to_sel_mux_reg[0]}] -to [get_cells {comp_edge_resolve_inst/to_sel_mux_reg[0]}]
group_path -weight 1.000000 -name C2O -from [get_cells {comp_edge_resolve_inst/to_sel_mux_reg[0]}] -to [list \
  [get_ports {prob[6]}]  \
  [get_ports {prob[5]}]  \
  [get_ports {prob[4]}]  \
  [get_ports {prob[3]}]  \
  [get_ports {prob[2]}]  \
  [get_ports {prob[1]}]  \
  [get_ports {prob[0]}]  \
  [get_ports inc] ]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports rst_b]  \
  [get_ports x_edge]  \
  [get_ports y_edge]  \
  [get_ports {u_capture[6]}]  \
  [get_ports {u_capture[5]}]  \
  [get_ports {u_capture[4]}]  \
  [get_ports {u_capture[3]}]  \
  [get_ports {u_capture[2]}]  \
  [get_ports {u_capture[1]}]  \
  [get_ports {u_capture[0]}]  \
  [get_ports {u_minus[6]}]  \
  [get_ports {u_minus[5]}]  \
  [get_ports {u_minus[4]}]  \
  [get_ports {u_minus[3]}]  \
  [get_ports {u_minus[2]}]  \
  [get_ports {u_minus[1]}]  \
  [get_ports {u_minus[0]}]  \
  [get_ports {u_search[6]}]  \
  [get_ports {u_search[5]}]  \
  [get_ports {u_search[4]}]  \
  [get_ports {u_search[3]}]  \
  [get_ports {u_search[2]}]  \
  [get_ports {u_search[1]}]  \
  [get_ports {u_search[0]}]  \
  [get_ports {u_backoff[6]}]  \
  [get_ports {u_backoff[5]}]  \
  [get_ports {u_backoff[4]}]  \
  [get_ports {u_backoff[3]}]  \
  [get_ports {u_backoff[2]}]  \
  [get_ports {u_backoff[1]}]  \
  [get_ports {u_backoff[0]}] ] -to [get_cells {comp_edge_resolve_inst/to_sel_mux_reg[0]}]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports rst_b]  \
  [get_ports x_edge]  \
  [get_ports y_edge]  \
  [get_ports {u_capture[6]}]  \
  [get_ports {u_capture[5]}]  \
  [get_ports {u_capture[4]}]  \
  [get_ports {u_capture[3]}]  \
  [get_ports {u_capture[2]}]  \
  [get_ports {u_capture[1]}]  \
  [get_ports {u_capture[0]}]  \
  [get_ports {u_minus[6]}]  \
  [get_ports {u_minus[5]}]  \
  [get_ports {u_minus[4]}]  \
  [get_ports {u_minus[3]}]  \
  [get_ports {u_minus[2]}]  \
  [get_ports {u_minus[1]}]  \
  [get_ports {u_minus[0]}]  \
  [get_ports {u_search[6]}]  \
  [get_ports {u_search[5]}]  \
  [get_ports {u_search[4]}]  \
  [get_ports {u_search[3]}]  \
  [get_ports {u_search[2]}]  \
  [get_ports {u_search[1]}]  \
  [get_ports {u_search[0]}]  \
  [get_ports {u_backoff[6]}]  \
  [get_ports {u_backoff[5]}]  \
  [get_ports {u_backoff[4]}]  \
  [get_ports {u_backoff[3]}]  \
  [get_ports {u_backoff[2]}]  \
  [get_ports {u_backoff[1]}]  \
  [get_ports {u_backoff[0]}] ] -to [list \
  [get_ports {prob[6]}]  \
  [get_ports {prob[5]}]  \
  [get_ports {prob[4]}]  \
  [get_ports {prob[3]}]  \
  [get_ports {prob[2]}]  \
  [get_ports {prob[1]}]  \
  [get_ports {prob[0]}]  \
  [get_ports inc] ]
set_clock_gating_check -setup 0.0 
set_dont_use [get_lib_cells slow_vdd1v0/HOLDX1]
