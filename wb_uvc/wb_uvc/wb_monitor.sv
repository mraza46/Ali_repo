class wb_monitor extends uvm_monitor;
    `uvm_component_utils(wb_monitor)
    virtual wishbone_if slave_vif;
    uvm_analysis_port#(wb_transaction) mon_ap;

    function new(string name = "wb_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        mon_ap = new("mon_ap", this);
        if (!uvm_config_db#(virtual wishbone_if)::get(this, "", "vif", slave_vif))
            `uvm_fatal("WB_MONITOR", "No interface found!")
    endfunction

    virtual task run_phase(uvm_phase phase);
        wb_transaction txn;
        forever begin
            txn = wb_transaction::type_id::create("txn");
            @(posedge slave_vif.clk);
            txn.cyc = slave_vif.cyc;
            txn.stb = slave_vif.stb;
            txn.we = slave_vif.we;
            txn.adr = slave_vif.adr;
            txn.dat_i = slave_vif.dat_i;
            txn.ack = slave_vif.ack;
            txn.dat_o = slave_vif.dat_o;
            mon_ap.write(txn);
        end
    endtask
endclass