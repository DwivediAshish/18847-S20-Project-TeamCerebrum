####################################################################################
#                             POST-INIT PLUG-IN
####################################################################################
#
# This plug-in script is called after design import from the run_init.tcl script.
#
# --------------------------------------------------------------------------------
# Can be used for various floorplan related tasks, like:
#              - Die/core boundary
#              - placement of hard macros/blocks
#              - power domain size and clearence surrounding to it
#              - Placement and routing blockages in the floorplan
#              - IO ring creation
#              - PSO planning
# --------------------------------------------------------------------------------
# Specifically, this example includes tasks related to the LP/CPF foundation flow 
# including power domain modification and power shut-off planning. The examples 
# included here operate based on variables (vars array) defined in the 
# OVERLAY/lp_config.tcl file
#
if {[info exists vars(cpf_file)]} {

# --------------------------------------------------------------------------------
# Modify power domains
# --------------------------------------------------------------------------------
# The 'modify_power_domains' procedure is included with the foundation flows
# to help automate power domain modification.  To enable this, please set the
# appropriate variables in the lp_config.tcl and uncomment the following command
#

#	ff_modify_power_domains
    
# --------------------------------------------------------------------------------
# Power switch insertion
# --------------------------------------------------------------------------------
# The 'add_power_switches' procedure is included with the foundation flows
# to cover common power switch insertion scenarios.  To use, set the appropriate
# variables in the lp_config.tcl file and uncomment the following command.
# --------------------------------------------------------------------------------
# NOTE: This procedure  will NOT COVER THE ALL THE OPTIONS in addPowerSwitch
# For more complicated scenarios, please manually add the addPowerSwitch command
# here with the necessary options.
# --------------------------------------------------------------------------------

#	ff_add_power_switches

}

# Floorplan
floorPlan -site CoreSite -d 1000 1000 40 40 40 40

loadIoFile ../INPUT/chip.io
addIoFiller -cell {padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1}
addIoFiller -cell padIORINGFEED1 -fillAnyGap

set x [get_db [lindex [get_db insts -if .base_cell.base_name==PADVDD] 0] .bbox.ll.x]
set y [get_db [lindex [get_db insts -if .base_cell.base_name==PADVDD] 0] .bbox.ll.y]
createPGPin VDD -geom M3 [expr 3.5+$x] [expr 0.5+$y] [expr 4.5+$x] [expr 1.5+$y]

set x [get_db [lindex [get_db insts -if .base_cell.base_name==PADVSS] 0] .bbox.ll.x]
set y [get_db [lindex [get_db insts -if .base_cell.base_name==PADVSS] 0] .bbox.ll.y]
createPGPin VSS -geom M3 [expr 3.5+$x] [expr 0.5+$y] [expr 4.5+$x] [expr 1.5+$y]

set x [get_db [lindex [get_db insts -if .base_cell.base_name==PADVDDIOR] 0] .bbox.ll.x]
set y [get_db [lindex [get_db insts -if .base_cell.base_name==PADVDDIOR] 0] .bbox.ll.y]
createPGPin VDDIOR -geom M3 [expr 3.5+$x] [expr 0.5+$y] [expr 4.5+$x] [expr 1.5+$y]

foreach port [get_db ports] {
	set x [get_db $port .location.x]
	set y [get_db $port .location.y]
	createPhysicalPin $port -net [get_db $port .net.name] -layer M9 -rect [list [expr $x-1] [expr $y-1] [expr $x+1] [expr $y+1]]
}

setViaGenMode -cutclass_preference square

# Core rings
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer M10 -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top M9 bottom M9 left M8 right M8} -width {top 3 bottom 3 left 3 right 3} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

# Power pad pins
setSrouteMode -viaConnectToShape { padring ring }
sroute -connect { padPin } -layerChangeRange { M1(1) M10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -allowJogging 0 -crossoverViaLayerRange { M1(1) M10(10) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { M1(1) M10(10) }

# Stripes
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer M10 -stacked_via_bottom_layer M1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer M8 -direction vertical -width 3 -spacing 1 -set_to_set_distance 70 -start_from left -start_offset 70 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M10 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M10 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer M10 -stacked_via_bottom_layer M1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }
addStripe -nets {VDD VSS} -layer M9 -direction horizontal -width 3 -spacing 1 -set_to_set_distance 70 -start_from bottom -start_offset 25 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M10 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M10 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None

# Rails
setSrouteMode -viaConnectToShape { ring stripe }
sroute -connect { blockPin padPin corePin } -layerChangeRange { M1(1) M10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { none } -allowJogging 1 -crossoverViaLayerRange { M1(1) M10(10) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) M10(10) }

setViaGenMode -reset

saveNetlist -includePowerGround -excludeLeafCell -includePhysicalCell {PADVDD PADVDD25 PADVDDIOR PADVSS PADVSS25 PADVSSIOR DECAP10 DECAP9 DECAP8 DECAP7 DECAP6 DECAP5 DECAP4 DECAP3 DECAP2} ./DBS/LEC/init_physical.v.gz

streamOut chip_init.gds.gz -mapFile $vars(gds_layer_map) -merge $vars(gds_files)
