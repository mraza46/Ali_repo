// Wishbone Sequencer
class wishbone_sequencer extends uvm_sequencer #(wishbone_transaction);
    `uvm_component_utils(wishbone_sequencer)
    function new(string name = "wishbone_sequencer", uvm_component parent);
        super.new(name, parent);
    endfunction
endclass