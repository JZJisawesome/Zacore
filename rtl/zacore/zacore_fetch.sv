import zacore_common::*;

module zacore_fetch #(

) (
    input logic i_clk,
    input logic i_rst,

    //Memory Interface
    output logic o_fetch_req,
    input logic i_fetch_ack,
    output logic [31:0] o_fetch_addr,
    input logic [31:0] i_inst_read,

    //To decode
    output fetch_decode_if_t o_fetch_decode_if,

    //Stall signals
    input logic i_stall,//Stalls PC, as well as stalls latching IMEM output

    //Invalidate/flush control
    input logic i_invalidate
);

endmodule
