#!/bin/bash

FILES_TO_INCLUDE="-I ../rtl/zacore/zacore_common.sv ../rtl/zacore/zacore_top.sv ../rtl/zacore/zacore_fetch.sv ../rtl/zacore/zacore_decode.sv ../rtl/zacore/zacore_execute.sv ../rtl/zacore/zacore_memory.sv ../rtl/zacore/zacore_writeback.sv"

#Verilate the testbench and vgacpu SystemVerilog files//todo split into multiple commands
verilator $FILES_TO_INCLUDE --timescale 10ns/10ns -Wall -Wno-fatal -sv -cc zacore_tb.sv --exe --trace-fst --trace-structs -O3 --top-module zacore_tb +1800-2017ext+sv --build zacore_tb.cpp
#Run the simulation (creates /tmp/vgacpu_verilator.vcd)
(cd ../ && ./tb/obj_dir/Vzacore_tb)
#Open in waveform viewer
#gtkwave /tmp/zacore_tb.vcd
#Delete files
#rm -rf ./obj_dir
#rm /tmp/zacore_tb.vcd
