module zacore_tb (
    input logic i_clk,
    input logic i_rst
);

logic o_fetch_req;
logic o_read_req;
logic o_write_req;
logic i_fetch_ack;
logic i_read_ack;
logic i_write_ack;
logic [31:0] o_fetch_addr;
logic [31:0] i_inst_read;
logic [31:0] o_data_addr;
logic [31:0] o_data_write;
logic [3:0] o_data_write_mask;
logic [31:0] i_data_read;

zacore_top top (.*);

initial begin
    $dumpfile("/tmp/zacore_tb.vcd");
    $dumpvars(0, zacore_tb);
end

//Clock cycle counter to end simulation
logic [63:0] counter = 0;

always_ff @(posedge i_clk) begin
    counter <= counter + 1;

    if (counter == 1000000)
        $finish();
end

//Simple memory for testing

assign i_fetch_ack = o_fetch_req;
assign i_read_ack = o_read_req;
assign i_write_ack = o_write_req;

logic [31:0] memory [16384];
initial $readmemh("/tmp/test.hex", memory);

assign i_inst_read = memory[o_fetch_addr];
assign i_data_read = memory[o_data_addr];

always_ff @(posedge i_clk) begin
    if (o_write_req) begin
        if (o_data_write_mask[0]) begin
            memory[o_data_addr][7:0] <= o_data_write[7:0];
        end
        if (o_data_write_mask[1]) begin
            memory[o_data_addr][15:8] <= o_data_write[15:8];
        end
        if (o_data_write_mask[2]) begin
            memory[o_data_addr][23:16] <= o_data_write[23:16];
        end
        if (o_data_write_mask[3]) begin
            memory[o_data_addr][31:24] <= o_data_write[31:24];
        end
    end
end

endmodule
