import zacore_common::*;

module zacore_memory #(

) (
    input logic i_clk,
    input logic i_rst,

    //Memory interface
    output logic o_read_req,
    output logic o_write_req,
    output logic [31:0] o_data_addr,
    output logic [31:0] o_data_write,
    output logic [3:0] o_data_write_mask,//Only write a byte if the corresponding bit is set (bit 0 is the LSB, bit 1 is byte 1, and so on)
    input logic [31:0] i_data_read,

    //From execute
    input execute_memory_if_t i_execute_memory_if,

    //To writeback
    input memory_writeback_if_t i_memory_writeback_if,

    //Stall signals
    output logic o_stall,//To execute
    input logic i_stall,//Stalls output flop stage

    //Invalidate/flush control
    input logic i_invalidate
);

endmodule
