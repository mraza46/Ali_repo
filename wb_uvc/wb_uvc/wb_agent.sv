class wb_agent extends uvm_agent;
    `uvm_component_utils(wb_agent)
    wb_driver drv;
    wb_monitor mon;
    uvm_sequencer#(wb_transaction) seqr;

    function new(string name = "wb_agent", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        drv = wb_driver::type_id::create("drv", this);
        mon = wb_monitor::type_id::create("mon", this);
        seqr = uvm_sequencer#(wb_transaction)::type_id::create("seqr", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass    