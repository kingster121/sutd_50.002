set projDir "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/vivado"
set projName "motor"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/alchitry_top.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/reset_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/counter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/pwm.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/pipeline.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/button_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/edge_detector.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/motor.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/constraint/alchitry.xdc" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/motor/build/constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
