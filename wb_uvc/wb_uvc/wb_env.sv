class wb_env extends uvm_env;
    `uvm_component_utils(wb_env)
    wb_agent agent;

    function new(string name = "wb_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        agent = wb_agent::type_id::create("agent", this);
    endfunction
endclass