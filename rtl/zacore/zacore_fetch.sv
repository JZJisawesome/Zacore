import zacore_common::*;

module zacore_fetch #(
    parameter addr_t RESET_ADDR = 32'h00000000
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

    //From execute
    input execute_fetch_if_t i_execute_fetch_if,

    //Stall signals
    input logic i_stall,//Stalls PC, as well as stalls latching IMEM output

    //Invalidate/flush control
    input logic i_invalidate
);

/* Fetch request logic */
assign o_fetch_req = ~i_stall;

/* Stall logic */

logic stall;
assign stall = i_stall | ~i_fetch_ack;

/* PC and Address Logic */

pc_t pc;
pc_t next_pc;

//Get next PC
always_comb begin
//TODO if we have a branch taken from execute, change the pc to that
    next_pc = pc + 4;
end

//Sequential PC logic
always_ff @(posedge i_clk) begin
    if (i_rst)
        pc <= RESET_ADDR;
    else begin
        if (~stall)
            pc <= next_pc;
    end
end

assign o_fetch_addr = pc;

/* Fetching And Decode Output Logic */

always_ff @(posedge i_clk) begin
    if (i_rst)
        o_fetch_decode_if.datapath_info.valid <= 0;
    else begin
        if (i_invalidate)
            o_fetch_decode_if.datapath_info.valid <= 0;
        else if (~stall)
            o_fetch_decode_if.datapath_info.valid <= 1;

        o_fetch_decode_if.datapath_info.pc <= pc;
        o_fetch_decode_if.inst <= i_inst_read;
    end
end

endmodule
