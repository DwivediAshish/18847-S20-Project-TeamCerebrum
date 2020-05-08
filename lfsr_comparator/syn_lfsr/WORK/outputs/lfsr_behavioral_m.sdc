# ####################################################################

#  Created by Genus(TM) Synthesis Solution 18.14-s037_1 on Wed May 06 17:59:46 EDT 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design lfsr_behavioral

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk]
set_clock_transition 0.15 [get_clocks clk]
group_path -weight 1.000000 -name C2C -from [list \
  [get_cells {lfsr_inst/shift_value_reg[0]}]  \
  [get_cells {lfsr_inst/shift_value_reg[15]}]  \
  [get_cells {lfsr_inst/shift_value_reg[14]}]  \
  [get_cells {lfsr_inst/shift_value_reg[13]}]  \
  [get_cells {lfsr_inst/shift_value_reg[12]}]  \
  [get_cells {lfsr_inst/shift_value_reg[11]}]  \
  [get_cells {lfsr_inst/shift_value_reg[10]}]  \
  [get_cells {lfsr_inst/shift_value_reg[9]}]  \
  [get_cells {lfsr_inst/shift_value_reg[8]}]  \
  [get_cells {lfsr_inst/shift_value_reg[7]}]  \
  [get_cells {lfsr_inst/shift_value_reg[6]}]  \
  [get_cells {lfsr_inst/shift_value_reg[5]}]  \
  [get_cells {lfsr_inst/shift_value_reg[4]}]  \
  [get_cells {lfsr_inst/shift_value_reg[3]}]  \
  [get_cells {lfsr_inst/shift_value_reg[2]}]  \
  [get_cells {lfsr_inst/shift_value_reg[1]}] ] -to [list \
  [get_cells {lfsr_inst/shift_value_reg[0]}]  \
  [get_cells {lfsr_inst/shift_value_reg[15]}]  \
  [get_cells {lfsr_inst/shift_value_reg[14]}]  \
  [get_cells {lfsr_inst/shift_value_reg[13]}]  \
  [get_cells {lfsr_inst/shift_value_reg[12]}]  \
  [get_cells {lfsr_inst/shift_value_reg[11]}]  \
  [get_cells {lfsr_inst/shift_value_reg[10]}]  \
  [get_cells {lfsr_inst/shift_value_reg[9]}]  \
  [get_cells {lfsr_inst/shift_value_reg[8]}]  \
  [get_cells {lfsr_inst/shift_value_reg[7]}]  \
  [get_cells {lfsr_inst/shift_value_reg[6]}]  \
  [get_cells {lfsr_inst/shift_value_reg[5]}]  \
  [get_cells {lfsr_inst/shift_value_reg[4]}]  \
  [get_cells {lfsr_inst/shift_value_reg[3]}]  \
  [get_cells {lfsr_inst/shift_value_reg[2]}]  \
  [get_cells {lfsr_inst/shift_value_reg[1]}] ]
group_path -weight 1.000000 -name C2O -from [list \
  [get_cells {lfsr_inst/shift_value_reg[0]}]  \
  [get_cells {lfsr_inst/shift_value_reg[15]}]  \
  [get_cells {lfsr_inst/shift_value_reg[14]}]  \
  [get_cells {lfsr_inst/shift_value_reg[13]}]  \
  [get_cells {lfsr_inst/shift_value_reg[12]}]  \
  [get_cells {lfsr_inst/shift_value_reg[11]}]  \
  [get_cells {lfsr_inst/shift_value_reg[10]}]  \
  [get_cells {lfsr_inst/shift_value_reg[9]}]  \
  [get_cells {lfsr_inst/shift_value_reg[8]}]  \
  [get_cells {lfsr_inst/shift_value_reg[7]}]  \
  [get_cells {lfsr_inst/shift_value_reg[6]}]  \
  [get_cells {lfsr_inst/shift_value_reg[5]}]  \
  [get_cells {lfsr_inst/shift_value_reg[4]}]  \
  [get_cells {lfsr_inst/shift_value_reg[3]}]  \
  [get_cells {lfsr_inst/shift_value_reg[2]}]  \
  [get_cells {lfsr_inst/shift_value_reg[1]}] ] -to [get_ports prob_bit]
group_path -weight 1.000000 -name I2C -from [list \
  [get_ports clk]  \
  [get_ports rst_b]  \
  [get_ports {seed[15]}]  \
  [get_ports {seed[14]}]  \
  [get_ports {seed[13]}]  \
  [get_ports {seed[12]}]  \
  [get_ports {seed[11]}]  \
  [get_ports {seed[10]}]  \
  [get_ports {seed[9]}]  \
  [get_ports {seed[8]}]  \
  [get_ports {seed[7]}]  \
  [get_ports {seed[6]}]  \
  [get_ports {seed[5]}]  \
  [get_ports {seed[4]}]  \
  [get_ports {seed[3]}]  \
  [get_ports {seed[2]}]  \
  [get_ports {seed[1]}]  \
  [get_ports {seed[0]}]  \
  [get_ports {probability[7]}]  \
  [get_ports {probability[6]}]  \
  [get_ports {probability[5]}]  \
  [get_ports {probability[4]}]  \
  [get_ports {probability[3]}]  \
  [get_ports {probability[2]}]  \
  [get_ports {probability[1]}]  \
  [get_ports {probability[0]}] ] -to [list \
  [get_cells {lfsr_inst/shift_value_reg[0]}]  \
  [get_cells {lfsr_inst/shift_value_reg[15]}]  \
  [get_cells {lfsr_inst/shift_value_reg[14]}]  \
  [get_cells {lfsr_inst/shift_value_reg[13]}]  \
  [get_cells {lfsr_inst/shift_value_reg[12]}]  \
  [get_cells {lfsr_inst/shift_value_reg[11]}]  \
  [get_cells {lfsr_inst/shift_value_reg[10]}]  \
  [get_cells {lfsr_inst/shift_value_reg[9]}]  \
  [get_cells {lfsr_inst/shift_value_reg[8]}]  \
  [get_cells {lfsr_inst/shift_value_reg[7]}]  \
  [get_cells {lfsr_inst/shift_value_reg[6]}]  \
  [get_cells {lfsr_inst/shift_value_reg[5]}]  \
  [get_cells {lfsr_inst/shift_value_reg[4]}]  \
  [get_cells {lfsr_inst/shift_value_reg[3]}]  \
  [get_cells {lfsr_inst/shift_value_reg[2]}]  \
  [get_cells {lfsr_inst/shift_value_reg[1]}] ]
group_path -weight 1.000000 -name I2O -from [list \
  [get_ports clk]  \
  [get_ports rst_b]  \
  [get_ports {seed[15]}]  \
  [get_ports {seed[14]}]  \
  [get_ports {seed[13]}]  \
  [get_ports {seed[12]}]  \
  [get_ports {seed[11]}]  \
  [get_ports {seed[10]}]  \
  [get_ports {seed[9]}]  \
  [get_ports {seed[8]}]  \
  [get_ports {seed[7]}]  \
  [get_ports {seed[6]}]  \
  [get_ports {seed[5]}]  \
  [get_ports {seed[4]}]  \
  [get_ports {seed[3]}]  \
  [get_ports {seed[2]}]  \
  [get_ports {seed[1]}]  \
  [get_ports {seed[0]}]  \
  [get_ports {probability[7]}]  \
  [get_ports {probability[6]}]  \
  [get_ports {probability[5]}]  \
  [get_ports {probability[4]}]  \
  [get_ports {probability[3]}]  \
  [get_ports {probability[2]}]  \
  [get_ports {probability[1]}]  \
  [get_ports {probability[0]}] ] -to [get_ports prob_bit]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports rst_b]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {seed[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports {probability[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 2.0 [get_ports prob_bit]
set_dont_use [get_lib_cells slow_vdd1v0/HOLDX1]
set_clock_uncertainty -setup 0.1 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]
