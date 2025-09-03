class write_seq_inc_addr extends uvm_sequence #(write_item);

  `uvm_object_utils(write_seq_inc_addr)

  // Constructor
  function new(string name = "write_seq_inc_addr", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  //Generate a sequence of write transactions
  task body();
    write_item tx;
    bit [31:0] base_addr = 32'h0000_1000; // Starting address

    for(int i = 0; i < 10; i++) begin
        `uvm_info(get_type_name(), $sformatf("Generating transaction %0d", i), UVM_LOW)

        tx = write_item::type_id::create("tx");

        start_item(tx);
        tx.addr = base_addr + (i * 4); // Increment address by 4 for each transaction
        if (!tx.randomize() with { data inside {[32'h0000_0001 : 32'hFFFF_FFFF]}; }) begin
            `uvm_error(get_type_name(), $sformatf("Randomization failed for transaction %0d", i))
            continue;
        end
        finish_item(tx);

        `uvm_info(get_type_name(), $sformatf("Sent transaction %0d: addr=0x%08h, data=0x%08h", i, tx.addr, tx.data), UVM_LOW);
    end

  endtask
endclass