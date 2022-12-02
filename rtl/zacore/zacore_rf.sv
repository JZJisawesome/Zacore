import zacore_common::*;

module zacore_rf #(

) (
    input logic i_clk,
    input logic i_rst,//Synchrenous


    input reg_index_t rs1_index,
    input reg_index_t rs2_index,
    input reg_index_t rd_index,

    output w_t rs1,
    output w_t rs2,
    input w_t rd,

    input logic rd_write_enable
);

logic [31:0] rf [31:0];

/* Read/bypassing logic */

always_comb begin
    if (rd_write_enable && (rs1_index == rd_index)) begin
        rs1 = rd;
    end else begin
        rs1 = rf[rs1_index];
    end
end

always_comb begin
    if (rd_write_enable && (rs2_index == rd_index)) begin
        rs2 = rd;
    end else begin
        rs2 = rf[rs2_index];
    end
end

/* Write logic */

assign rf[0] = 32'b0;

always_ff @(posedge i_clk) begin
    if (i_rst) begin
    end else begin
        if (rd_write_enable && (rd_index != 5'b00000)) begin
            rf[rd_index] <= rd;
        end
    end
end

//Make this implicitly "bypass", so if a read and write occur on the same cycle to the same address, give the NEW DATA

endmodule
