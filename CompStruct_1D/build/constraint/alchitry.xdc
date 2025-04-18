set_property PACKAGE_PIN N14 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
# clk => 10000000Hz
create_clock -period 100.0 -name clk_0 -waveform {0.000 50.0} [get_ports clk]
set_clock_groups -asynchronous -group {clk_0}

set_property PACKAGE_PIN P6 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]

set_property PACKAGE_PIN K13 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN K12 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN L14 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN L13 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]

set_property PACKAGE_PIN M16 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]

set_property PACKAGE_PIN M14 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]

set_property PACKAGE_PIN M12 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]

set_property PACKAGE_PIN N16 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]

set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]

set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]

set_property PACKAGE_PIN F4 [get_ports {motorIN1}]
set_property IOSTANDARD LVCMOS33 [get_ports {motorIN1}]

set_property PACKAGE_PIN F3 [get_ports {motorIN2}]
set_property IOSTANDARD LVCMOS33 [get_ports {motorIN2}]

set_property PACKAGE_PIN H2 [get_ports {p0l0}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0l0}]

set_property PACKAGE_PIN K1 [get_ports {p0l1}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0l1}]

set_property PACKAGE_PIN H1 [get_ports {p1l0}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1l0}]

set_property PACKAGE_PIN J1 [get_ports {p1l1}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1l1}]

set_property PACKAGE_PIN M6 [get_ports {p0_score[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_score[0]}]

set_property PACKAGE_PIN H5 [get_ports {p0_score[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_score[1]}]

set_property PACKAGE_PIN J3 [get_ports {p0_score[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_score[2]}]

set_property PACKAGE_PIN N6 [get_ports {p1_score[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_score[0]}]

set_property PACKAGE_PIN H4 [get_ports {p1_score[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_score[1]}]

set_property PACKAGE_PIN H3 [get_ports {p1_score[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_score[2]}]

set_property PACKAGE_PIN N9 [get_ports {p0_flag}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_flag}]

set_property PACKAGE_PIN P9 [get_ports {p1_flag}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_flag}]

set_property PACKAGE_PIN C7 [get_ports {p0_button[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_button[0]}]
set_property PULLDOWN true [get_ports {p0_button[0]}]

set_property PACKAGE_PIN C6 [get_ports {p0_button[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_button[1]}]
set_property PULLDOWN true [get_ports {p0_button[1]}]

set_property PACKAGE_PIN A7 [get_ports {p0_button[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p0_button[2]}]
set_property PULLDOWN true [get_ports {p0_button[2]}]

set_property PACKAGE_PIN F5 [get_ports {p1_button[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_button[0]}]
set_property PULLDOWN true [get_ports {p1_button[0]}]

set_property PACKAGE_PIN E5 [get_ports {p1_button[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_button[1]}]
set_property PULLDOWN true [get_ports {p1_button[1]}]

set_property PACKAGE_PIN A5 [get_ports {p1_button[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1_button[2]}]
set_property PULLDOWN true [get_ports {p1_button[2]}]

set_property PACKAGE_PIN B6 [get_ports {center_button}]
set_property IOSTANDARD LVCMOS33 [get_ports {center_button}]
set_property PULLDOWN true [get_ports {center_button}]

