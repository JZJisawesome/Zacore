import zacore_common::*;

module zacore_decode_immediate #(

) (
    input inst_t inst,

    output w_t imm_i,
    output w_t imm_s,
    output w_t imm_b,
    output w_t imm_u,
    output w_t imm_j
);

assign imm_i = {{21{inst[31]}},                                                 inst.raw[30:25], inst.raw[24:21], inst.raw[0]};
assign imm_s = {{21{inst[31]}},                                                 inst.raw[30:25], inst.raw[11:8],  inst.raw[7]};
assign imm_b = {{20{inst[31]}},                                   inst.raw[7],  inst.raw[30:25], inst.raw[11:8],  1'b0};
assign imm_u = {inst[31],       inst.raw[30:20], inst.raw[19:12], 12'b0};
assign imm_j = {{12{inst[31]}},                  inst.raw[19:12], inst.raw[20], inst.raw[30:25], inst.raw[24:21], 1'b0};

endmodule
