interface wishbone_if(input logic clk, rst);
    logic cyc, stb, we;
    logic [1:0] adr;
    logic [7:0] dat_i, dat_o;
    logic ack;

    modport master (output cyc, stb, we, adr, dat_i, input dat_o, ack);
    modport slave (input cyc, stb, we, adr, dat_i, output dat_o, ack);
endinterface
