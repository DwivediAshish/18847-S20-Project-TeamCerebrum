(globals
    version = 3
    io_order = default
)
(iopad
    (topright
    (inst name="CORNER_TR"  orientation=MY90 cell="padIORINGCORNER" )
    )
    (top
    (inst  name="ipad_clk"   place_status=placed )
    (inst  name="ipad_rst_b"   place_status=placed )
    (inst  name="ppad_VDD"    cell="PADVDD" )
    (inst  name="ppad_VDDIOR"  cell="PADVDDIOR" )
    (inst  name="ppad_VSS"    cell="PADVSS" )
    (inst  name="ppad_VSSIOR"  cell="PADVSSIOR" )
    (inst  name="ipad_ops_val"   place_status=placed )
    (inst  name="ipad_res_rdy"   place_status=placed )
    (inst  name="opad_res_val"   place_status=placed )
    (inst  name="opad_ops_rdy"   place_status=placed )
    )
    (topleft
    (inst name="CORNER_TL"  orientation=R270 cell="padIORINGCORNER" )
    )
    (left
    (inst  name="ipad_op_a_0_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_1_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_2_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_3_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_4_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_5_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_6_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_a_7_.gen_inst"   place_status=placed )
    )
    (bottomleft
    (inst name="CORNER_BL"  cell="padIORINGCORNER" )
    )
    (bottom
    (inst  name="opad_res_0_.gen_inst"   place_status=placed )
    (inst  name="opad_res_1_.gen_inst"   place_status=placed )
    (inst  name="opad_res_2_.gen_inst"   place_status=placed )
    (inst  name="opad_res_3_.gen_inst"   place_status=placed )
    (inst  name="opad_res_4_.gen_inst"   place_status=placed )
    (inst  name="opad_res_5_.gen_inst"   place_status=placed )
    (inst  name="opad_res_6_.gen_inst"   place_status=placed )
    (inst  name="opad_res_7_.gen_inst"   place_status=placed )
    )
    (bottomright
    (inst name="CORNER_BR"  orientation=R90 cell="padIORINGCORNER" )
    )
    (right
    (inst  name="ipad_op_b_0_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_1_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_2_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_3_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_4_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_5_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_6_.gen_inst"   place_status=placed )
    (inst  name="ipad_op_b_7_.gen_inst"   place_status=placed )
    )
)
