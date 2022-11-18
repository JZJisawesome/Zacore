module zacore_top #(


) (
    input logic i_clk,
    input logic i_rst,//Synchrenous

    //Memory interface
    output logic o_fetch_req,
    output logic o_read_req,
    output logic o_write_req,
    output logic [31:0] o_fetch_addr,
    output logic [31:0] o_data_addr,
    output logic [31:0] o_data_write,
    output logic [3:0] o_data_write_mask,//Only write a byte if the corresponding bit is set (bit 0 is the LSB, bit 1 is byte 1, and so on)
    input logic [31:0] i_data_read
)






endmodule//zacore_top
