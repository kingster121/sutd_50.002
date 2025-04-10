set projDir "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/vivado"
set projName "project_debugger"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir"]} { file delete -force "$projDir" }
create_project $projName "$projDir" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/alchitry_top.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/reset_conditioner.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/debugger.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/uart_tx.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/uart_rx.sv" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/source/lucid_globals.sv" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/constraint/alchitry.xdc" "/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/project_debugger/build/constraint/au_props.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
