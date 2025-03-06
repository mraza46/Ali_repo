class wb_test extends uvm_test;
    `uvm_component_utils(wb_test)
    wb_env env;
    wb_sequence seq;

    function new(string name = "wb_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        env = wb_env::type_id::create("env", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        seq = wb_sequence::type_id::create("seq");
        phase.raise_objection(this);
        seq.start(env.agent.seqr);
        #100;
        phase.drop_objection(this);
    endtask
endclass