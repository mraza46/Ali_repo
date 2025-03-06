class wishbone_scoreboard extends uvm_scoreboard;
    uvm_analysis_imp#(wishbone_transaction, wishbone_scoreboard) mon_imp;
    
    `uvm_component_utils(wishbone_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_imp = new("mon_imp", this);
    endfunction

    function void write(wishbone_transaction tr);
        if (tr.we)
            `uvm_info("SCOREBOARD", $sformatf("Write Addr: %0h, Data: %0h", tr.adr, tr.data), UVM_MEDIUM)
        else
            `uvm_info("SCOREBOARD", $sformatf("Read Addr: %0h, Data: %0h", tr.adr, tr.data), UVM_MEDIUM)
    endfunction
endclass