analyze -library WORK -format sverilog {ffsr_binary.sv}

elaborate ffsr_binary -architecture verilog -library WORK

set_dont_touch ffsr_binary

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

report_area              > simresults/ffsr_binary.area
report_power             > simresults/ffsr_binary.pow
report_cell              > simresults/ffsr_binary.cell
report_timing -nworst 3  > simresults/ffsr_binary.tim

check_timing
check_design
#exit
