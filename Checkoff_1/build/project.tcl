set projDir "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/vivado"
set projName "PLSPLSPLS"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/alchitry_top.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/reset_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/adder.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/alu.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/alu_manual_tester.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/alu_manual_tester_2.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/boolean.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/compare.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/fa.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/multiplier.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/mux_2.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/mux_4.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/rca.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/shifter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/x_bit_left_shifter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/x_bit_right_shifter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/pipeline.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/button_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/edge_detector.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/constraint/alchitry.xdc" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/PLSPLSPLS/build/constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
