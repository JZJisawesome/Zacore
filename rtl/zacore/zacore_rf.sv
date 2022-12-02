import zacore_common::*;

module zacore_rf #(

) (
    input reg_index_t rs1_index,
    input reg_index_t rs2_index,
    input reg_index_t rd_index,

    output w_t rs1,
    output w_t rs2,
    input w_t rd,

    input logic rd_write_enable
);

/* TODO */

//Make this implicitly "bypass", so if a read and write occur on the same cycle to the same address, give the NEW DATA

endmodule
