class wb_transaction extends uvm_sequence_item;
    rand bit cyc, stb, we;
    rand bit [1:0] adr;
    rand bit [7:0] dat_i;
    bit [7:0] dat_o;
    bit ack;

    `uvm_object_utils(wb_transaction)

    function new(string name = "wb_transaction");
        super.new(name);
    endfunction

    constraint valid_addr { adr inside {0, 1, 2, 3}; }
endclass