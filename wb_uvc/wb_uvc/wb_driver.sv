class wb_driver extends uvm_driver #(wb_transaction);
    `uvm_component_utils(wb_driver)
    virtual wishbone_if master_vif;

    function new(string name = "wb_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        if (!uvm_config_db#(virtual wishbone_if)::get(this, "", "vif", master_vif))
            `uvm_fatal("WB_DRIVER", "No interface found!")
    endfunction

    virtual task run_phase(uvm_phase phase);
        wb_transaction txn;
        forever begin
            seq_item_port.get_next_item(txn);
            master_vif.cyc = txn.cyc;
            master_vif.stb = txn.stb;
            master_vif.we = txn.we;
            master_vif.adr = txn.adr;
            master_vif.dat_i = txn.dat_i;
            @(posedge master_vif.clk);
            while (!master_vif.ack) @(posedge master_vif.clk);
            txn.dat_o = master_vif.dat_o;
            seq_item_port.item_done();
        end
    endtask
endclass