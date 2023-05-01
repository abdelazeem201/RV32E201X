create_clock -period 10 -name "clk_i" -waveform {0 5} "clk_i"
set_dont_touch_network [get_ports clk_i]
set_fix_hold [get_clocks clk_i]

set_clock_uncertainty  0.1  [get_clocks clk_i]
set_clock_latency      0.5  [get_clocks clk_i]
set_input_delay -max 1 -clock clk_i [all_inputs]
set_output_delay -min 0.5 -clock clk_i [all_outputs]
set_drive 1 [all_inputs]
set_load  1 [all_outputs]

set_operating_conditions -min_library fsc0h_d_generic_core_ff1p32vm40c -min BCCOM -max_library fsc0h_d_generic_core_ss1p08v125c -max WCCOM
set_wire_load_model -name G200K -library fsc0h_d_generic_core_tt1p2v25c

set_max_area 0
set_max_fanout 6 CPU
set_boundary_optimization {"*"}