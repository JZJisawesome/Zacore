import zacore_common::*;

module zacore_top #(


) (
    input logic i_clk,
    input logic i_rst,//Synchrenous

    //Memory Interface
    output logic o_fetch_req,
    output logic o_read_req,
    output logic o_write_req,
    input logic i_fetch_ack,
    input logic i_read_ack,
    input logic i_write_ack,
    output logic [31:0] o_fetch_addr,
    input logic [31:0] i_inst_read,
    output logic [31:0] o_data_addr,
    output logic [31:0] o_data_write,
    output logic [3:0] o_data_write_mask,//Only write a byte if the corresponding bit is set (bit 0 is the LSB, bit 1 is byte 1, and so on)
    input logic [31:0] i_data_read
);

//Flush signals
logic [3:0] invalidate;

//Stall signal; travels combinationally backwards through the stages
logic [2:0] stall;

//Inter-stage interfaces
fetch_decode_if_t fetch_decode_if;
decode_execute_if_t decode_execute_if;
execute_memory_if_t execute_memory_if;
memory_writeback_if_t memory_writeback_if;

//Backwards interfaces
execute_fetch_if_t execute_fetch_if;
writeback_decode_if_t writeback_decode_if;
writeback_execute_if_t writeback_execute_if;

/* Module instanciations */

zacore_fetch #(


) fetch (
    .i_clk(i_clk),
    .i_rst(i_rst),

    .o_fetch_req(o_fetch_req),
    .i_fetch_ack(i_fetch_ack),
    .o_fetch_addr(o_fetch_addr),
    .i_inst_read(i_inst_read),

    .o_fetch_decode_if(fetch_decode_if),

    .i_execute_fetch_if(execute_fetch_if),

    .i_stall(stall[0]),

    .i_invalidate(invalidate[0])
);

/*zacore_memory #() memory

( .i_clk(i_clk) );
*/


endmodule//zacore_top
