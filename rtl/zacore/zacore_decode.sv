import zacore_common::*;

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

    //Stall signals
    output logic o_stall,//To fetch
    input logic i_stall,//Stalls output flop stage

    //Invalidate/flush control
    input logic i_invalidate
);

/* Logic to determine instruction type */

inst_type_t inst_type;

always_comb begin
    case (i_fetch_decode_if.inst.field.opcode)
        7'b0110111: inst_type = INST_TYPE_U;//LUI
        7'b0010111: inst_type = INST_TYPE_U;//AUIPC
        7'b1100111: inst_type = INST_TYPE_J;//JALR
        7'b1100011: inst_type = INST_TYPE_B;//Branch
        7'b0000011: inst_type = INST_TYPE_I;//Load
        7'b0100011: inst_type = INST_TYPE_S;//Store
        7'b0010011: inst_type = INST_TYPE_I;//Immediate computation
        7'b0110011: inst_type = INST_TYPE_R;//Register computation
        7'b0001111: inst_type = INST_TYPE_I;//FENCE
        7'b1110011: inst_type = INST_TYPE_I;//ECALL/EBREAK
        //TODO others
        default: inst_type = inst_type_t'('x);
    endcase
end

/* Instruction decoding/control logic for future stages */

/* Immediate formation */

w_t imm_i;
w_t imm_s;
w_t imm_b;
w_t imm_u;
w_t imm_j;

zacore_decode_immediate decode_immediate (
    .inst(i_fetch_decode_if.inst),
    .imm_i(imm_i),
    .imm_s(imm_s),
    .imm_b(imm_b),
    .imm_u(imm_u),
    .imm_j(imm_j)
);

/* Register file access */


/* Output logic */

endmodule
