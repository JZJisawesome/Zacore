module zacore_decode #(

) (
    input logic i_clk,
    input logic i_rst,

    //From fetch
    input fetch_decode_if_t i_fetch_decode_if,

    //To execute
    output decode_execute_if_t o_decode_execute_if,

    //From writeback
    input writeback_decode_if_t i_writeback_decode_if,

    //From execute
    input logic i_stall,//Stalls output flop stage

    //Invalidate/flush control
    input logic i_invalidate
);

endmodule
