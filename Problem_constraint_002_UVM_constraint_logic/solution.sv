class mem_txn extends uvm_sequence_item;
    `uvm_object_utils(mem_txn)
    rand bit [31:0] addr;
    rand bit [63:0] data;
    rand bit we;

    constraint c_align {
           addr % 64 == 0;
        }
    constraint c_read_data {
        (we == 0) -> (data == 0)
    }

    function new(string mane = "mem_txn");
        super.new(name);
    endfunction

    function string convert2string();
    return $sformatf("addr=0x%08h, data=0x%016h, we=%0b", addr, data, we);
  endfunction
endclass