#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/wata/Documents/Xilinx/Vitis/2024.2/bin:/home/wata/Documents/Xilinx/Vivado/2024.2/ids_lite/ISE/bin/lin64:/home/wata/Documents/Xilinx/Vivado/2024.2/bin
else
  PATH=/home/wata/Documents/Xilinx/Vitis/2024.2/bin:/home/wata/Documents/Xilinx/Vivado/2024.2/ids_lite/ISE/bin/lin64:/home/wata/Documents/Xilinx/Vivado/2024.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/wata/Desktop/school/term4/50.002_Computer_Structures/workspace/sutd_50.002/test_module/trigger_button/build/vivado/trigger_button.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log alchitry_top.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source alchitry_top.tcl -notrace


