module zacore_execute #(

) (
    input logic i_clk,
    input logic i_rst,

    //From decode
    input decode_execute_if_t i_decode_execute_if,

    //To memory
    output execute_memory_if_t o_execute_memory_if,

    //From writeback
    input writeback_execute_if_t i_writeback_execute_if,

    //From memory
    input logic i_stall,//Stalls output flop stage

    //Invalidate/flush control
    input logic i_invalidate
);

endmodule
