set projDir "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/vivado"
set projName "CompStruct_1D_new"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/alchitry_top.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/reset_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/counter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/decoder.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/edge_detector.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/pn_gen.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/random_number_generator.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/pipeline.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/button_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/seven_segment_encoder.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/bin_to_dec.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/pwm.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/motor.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/game_cu.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/alu.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/constraint/alchitry.xdc" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/CompStruct_1D/build/constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
