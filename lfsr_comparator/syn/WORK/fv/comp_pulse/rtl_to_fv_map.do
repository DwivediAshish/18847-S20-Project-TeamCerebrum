tclmode

# Generated by Genus(TM) Synthesis Solution 18.14-s037_1, revision 1.311a
# Generated on: Thu Apr 30 14:27:10 EDT 2020 (Thu Apr 30 18:27:10 GMT 2020)

set lec_version [regsub {(-)[A-Za-z]} $env(LEC_VERSION) ""]

tcl_set_command_name_echo on

set_log_file fv/comp_pulse/rtl_to_fv_map.log -replace

usage -auto -elapse

set_verification_information rtl_fv_map_db

read_implementation_information fv/comp_pulse -revised fv_map

# Root attribute 'wlec_multithread_license_list' can be used to specify a license list
# for multithreaded processing. The default list is used otherwise.
set_parallel_option -threads 4 -norelease_license
set_compare_options -threads 4

set env(RC_VERSION)     "18.14-s037_1"
set env(CDN_SYNTH_ROOT) "/afs/ece.cmu.edu/support/cds/share/image/usr/cds/genus-18.14.000/tools.lnx86"
set CDN_SYNTH_ROOT      "/afs/ece.cmu.edu/support/cds/share/image/usr/cds/genus-18.14.000/tools.lnx86"
set env(CW_DIR) "/afs/ece.cmu.edu/support/cds/share/image/usr/cds/genus-18.14.000/tools.lnx86/lib/chipware"
set CW_DIR      "/afs/ece.cmu.edu/support/cds/share/image/usr/cds/genus-18.14.000/tools.lnx86/lib/chipware"

# default is to error out when module definitions are missing
set_undefined_cell black_box -noascend -both

add_search_path . -library -both
read_library -liberty -both   /afs/ece/class/ece725/gpdk045/libs/gsclib045_svt_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib /afs/ece/class/ece725/gpdk045/libs/giolib045_v3.2/giolib045/lib/giolib045.lib

set_undriven_signal 0 -golden
set_naming_style rc -golden
set_naming_rule "%s\[%d\]" -instance_array -golden
set_naming_rule "%s_reg" -register -golden
set_naming_rule "%L.%s" "%L_%d_.%s" "%s" -instance -golden
set_naming_rule "%L.%s" "%L_%d_.%s" "%s" -variable -golden

# Align LEC's treatment of mismatched port widths with constant
# connections with Genus's. Genus message CDFG-467 and LEC message
# HRC3.6 may indicate the presence of this issue. This option is
# only available with LEC 17.20-d301 or later.
set lec_version_required "17.20301"
if {$lec_version >= $lec_version_required} {
    set_hdl_options -const_port_extend
}
set_hdl_options -VERILOG_INCLUDE_DIR "incdir:sep:src:cwd"

delete_search_path -all -design -golden
add_search_path . ../../rtl ../../rtl/comp_pulse ../../rtl/lfsr ../../rtl/comp_edge -design -golden
read_design -enumconstraint  -define SYNTHESIS  -merge bbox -golden -lastmod -noelab -sv09 ../../rtl/comp_pulse/comp_pulse.sv ../../rtl/register.sv
elaborate_design -golden -root {comp_pulse} -rootonly 

read_design -verilog95   -revised -lastmod -noelab fv/comp_pulse/fv_map.v.gz
elaborate_design -revised -root {comp_pulse}

uniquify -all -nolib -golden

report_design_data
report_black_box

set_flatten_model -seq_constant
set_flatten_model -seq_constant_x_to 0
set_flatten_model -nodff_to_dlat_zero
set_flatten_model -nodff_to_dlat_feedback
set_flatten_model -hier_seq_merge

#add_name_alias fv/comp_pulse/fv_map.singlebit.original_name.alias.json.gz -revised
#set_mapping_method -alias -revised
#add_renaming_rule r1alias _reg((\\\[%w\\\])*(/U\\\$%d)*)$ @1 -type dff dlat -both

set_analyze_option -auto

set_system_mode lec
analyze_datapath -module -verbose 
analyze_datapath   -verbose
report_unmapped_points -summary
report_unmapped_points -notmapped
add_compared_points -all
compare

report_compare_data -class nonequivalent -class abort -class notcompared
report_verification -verbose
report_statistics

write_verification_information
report_verification_information

exit

