module zacore_tb (
    input logic i_clk,
    input logic i_rst,
);

logic o_fetch_req;
logic o_read_req;
logic o_write_req;
logic [31:0] o_fetch_addr;
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

always_ff @(posedge clk) begin
    counter <= counter + 1;

    if (counter == 1000000)
        $finish();
end

endmodule
