# Problem 008: UVM Sequence with Incrementing Addresses

## 🧩 Problem Statement

Write a UVM sequence that generates **10 write transactions**, where:
- Each transaction has an `addr` field starting at `0x1000`
- The address **increments by 4** for each transaction
- A random `data` field is also generated for each transaction

You will be provided with a `write_item` sequence item class. Your task is to write a sequence (`write_seq_inc_addr`) that:
- Generates 10 items
- Sets the address values manually in an incrementing pattern
- Starts each item on the sequencer

---

## 📐 Provided Class

```systemverilog
class write_item extends uvm_sequence_item;
  rand bit [31:0] addr;
  rand bit [31:0] data;

  `uvm_object_utils(write_item)

  function new(string name = "write_item");
    super.new(name);
  endfunction

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    `uvm_info("WRITE_ITEM", $sformatf("addr = %0h, data = %0h", addr, data), UVM_LOW)
  endfunction
endclass
