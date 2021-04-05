create_clock -name clk -period 50MHz [get_ports {i_clk}]

derive_clock_uncertainty

set_false_path -from [get_ports i_rst]
set_false_path -from [get_ports i_df]
set_false_path -to [get_ports o_wave*]