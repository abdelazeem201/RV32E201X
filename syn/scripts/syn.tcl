set design CPU
set ports_clock_root clk_i

set_app_var search_path "/home/IC/Desktop/Projec/ASIC/UMC130nm/lib/StdCell"

set_app_var target_library "fsc0h_d_generic_core_ff1p32vm40c.db fsc0h_d_generic_core_ss1p08v125c.db fsc0h_d_generic_core_tt1p2v25c.db"
set_app_var link_library "* $target_library"

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work


analyze -library work -format verilog ../rtl/${design}.v
elaborate $design -lib work

current_design 
uniquify


check_design -summary
source ./cons/cons.tcl
link

set_fix_multiple_port_nets -all -buffer_constants

set_optimize_registers true -designs CPU



group_path -name CLK -from {all_registers] -to [all_registers]
group_path -name OUTPUTS -to [all_outputs] 
group_path -name INPUTS -from [remove_from_collection [all_inputs] ${ports_clock_root}] 
group_path -name COMB -from [remove_from_collection [all_inputs] ${ports_clock_root}] -to [all_outputs]

compile_ultra 

#compile_ultra -incremental

check_design
report_constraint -all_violators


report_area > ./report/synth_area.rpt
report_cell > ./report/synth_cells.rpt
report_qor  > ./report/synth_qor.rpt
report_power > ./report/power.rpt
report_resources > ./report/synth_resources.rpt
report_timing -path full -delay max -max_paths 3 -nworst 1 > ./report/synth_timing.rpt 
 
write_sdc  output/${design}_CHIP.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output/${design}_CHIP.v 
write -f ddc -hierarchy -output output/${design}_CHIP.ddc   
write_sdf -version 2.1 -context verilog output/${design}_CHIP.sdf
exit
