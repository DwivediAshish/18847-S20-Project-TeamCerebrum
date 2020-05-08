##################################################################################
#                           POST-SIGNOFF PLUG-IN 
##################################################################################
#
# This plug-in script is called after timeDesign -signoff from the run_signoff.tcl 
# flow script.
#
##################################################################################

write_sdf signoff.sdf -precision 3
write_sdc signoff.sdc

saveNetlist -includePowerGround -excludeLeafCell -includePhysicalCell {PADVDD PADVDD25 PADVDDIOR PADVSS PADVSS25 PADVSSIOR DECAP10 DECAP9 DECAP8 DECAP7 DECAP6 DECAP5 DECAP4 DECAP3 DECAP2} ./DBS/LEC/signoff_physical.v.gz
