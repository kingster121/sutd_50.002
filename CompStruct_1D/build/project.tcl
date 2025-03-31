set projDir "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/vivado"
set projName "CompStruct_1D_new"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/alchitry_top.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/reset_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/counter.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/decoder.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/edge_detector.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/pn_gen.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/random_number_generator.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/pipeline.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/button_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/seven_segment_encoder.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/bin_to_dec.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/servo.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/pwm.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/test_motor.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/constraint/alchitry.xdc" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/CompStruct_1D_new/build/constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
