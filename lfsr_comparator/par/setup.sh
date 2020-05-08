#!/bin/bash
# Run this script from inside par/FLOW

# Generate foundation flow template
innovus -execute "writeFlowTemplate -directory .; exit"

# Foundation flow configuration
cp -r ../src/WORK .
# Foundation flow plug-ins
cp ../src/PLUG/* ./PLUG/INNOVUS/
# Design data
cp -r ../src/INPUT .
cp ../../syn/WORK/outputs/chip_m.v ./INPUT
cp ../../syn/WORK/outputs/chip_m.sdc ./INPUT

cd WORK
tclsh ../SCRIPTS/gen_flow.tcl -m flat all
