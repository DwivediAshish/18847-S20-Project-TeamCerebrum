create_clock [get_ports clk]  -period 10  -waveform {0 5} -name clk

set_clock_uncertainty 0.1  [get_clocks clk]
set_clock_transition -fall 0.15 [get_clocks clk]
set_clock_transition -rise 0.15 [get_clocks clk]

set_input_delay 2 -clock clk [remove_from_collection [all_inputs] clk]
set_output_delay 2 -clock clk  [all_outputs]
