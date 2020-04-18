analyze -library WORK -define BEHAVIORAL -format sverilog {ffsr_pulse_bb_behavioral.sv ffsr_pulse.sv ffsr_spike.sv}

elaborate ffsr_pulse -architecture verilog -library WORK
elaborate ffsr_spike -architecture verilog -library WORK

# Create user defined variables 
set CLK_PERIOD 10000.00 
set CLK_SKEW   [expr {$CLK_PERIOD} * 0.04]

# set INPUT_DELAY [expr {$CLK_PERIOD} * 0.1]

# set OUTPUT_DELAY [expr {$CLK_PERIOD} * 0.05]

create_clock -period $CLK_PERIOD -name my_clock
set_clock_uncertainty $CLK_SKEW my_clock

# set_input_delay $INPUT_DELAY -max -clock my_clock [remove_from_collection [all_inputs] my_clock]
# set_output_delay $OUTPUT_DELAY -max -clock my_clock [all_outputs]

compile -map_effort low -area_effort none -power_effort none -ungroup_all 

report_area              > simresults/ffsr_spike_behavioral.area
report_power             > simresults/ffsr_spike_behavioral.pow
report_cell              > simresults/ffsr_spike_behavioral.cell
report_timing -nworst 3  > simresults/ffsr_spike_behavioral.tim

check_timing
check_design
#exit
