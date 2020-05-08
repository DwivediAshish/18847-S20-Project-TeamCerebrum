#-----------------------------------------------------------------------
# Created for EPS by Bill Wareham
# updated for Voltus 13.2 by Rose Li  Nov 2013
# updated for Voltus 14.1 by Rose Li  April 2014
# updated for Voltus 15.1 by Rose Li  July 2015
#-----------------------------------------------------------------------
# set multi CPU
#-----------------------------------------------------------------------
set_multi_cpu_usage \
        -localCpu                       2

#-----------------------------------------------------------------------
## load design
#-----------------------------------------------------------------------

read_design -physical_data ../../par/FLOW/WORK/DBS/signoff.enc.dat chip

#-----------------------------------------------------------------------
# Read spef file
#-----------------------------------------------------------------------
read_spef -rc_corner rc_tc -decoupled ../../par/FLOW/WORK/rc_tc.spef.gz

#-----------------------------------------------------------------------
# Prepare for vector based dynamic power analysis
#-----------------------------------------------------------------------
set_power_output_dir            dynPowerResults
set_power_analysis_mode \
    -reset

set_power_analysis_mode \
    -analysis_view              av_sl \
    -disable_static             false \
    -write_static_currents      true \
    -binary_db_name             dynPower.db \
    -create_binary_db           true \
    -method                     dynamic_vectorbased

set_dc_sources VDDIOR -power -voltage 1.8

#-----------------------------------------------------------------------
# Read the activity file.
#-----------------------------------------------------------------------
set_power_analysis_mode \
    -report_missing_nets        true

read_activity_file \
    -reset

read_activity_file \
    -format                     VCD \
    -scope                      tb.inst_chip \
    -start                      {0} \
    -end                        {1000} \
    -block                      {} \
                                ../../verif/par/chip.vcd

set_dynamic_power_simulation \
    -reset

set_dynamic_power_simulation \
    -period                    1000ns \
    -resolution                10ps

report_power \
    -outfile                    chip.power.rpt

view_dynamic_waveform \
   -type                        current \
   -composite_waveform_type     total_current \
   -waveform_files              {./dynPowerResults/dynamic_VDD.ptiavg}
