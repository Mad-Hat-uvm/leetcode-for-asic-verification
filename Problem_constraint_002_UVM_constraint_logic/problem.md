# Problem 001 – UVM Constraints: Memory Access Transaction

## 📝 Problem Statement

You're building a UVM sequence item (`mem_txn`) to model a memory access transaction for a cache-coherent interconnect. Each transaction includes:
- A 32-bit address
- A 64-bit data payload
- A 1-bit write enable signal

### Constraints to Enforce:
1. `addr` must be **64-byte aligned**
2. If `we == 0` (read), then `data` must be **0**

Implement the class so it can be randomized correctly for both read and write operations.

---

## 🔧 Class Skeleton

```systemverilog
class mem_txn extends uvm_sequence_item;
  rand bit [31:0] addr;
  rand bit [63:0] data;
  rand bit we;

  constraint c_align {
    // TODO: addr must be 64-byte aligned
  }

  constraint c_read_data {
    // TODO: if we == 0 then data == 0
  }

  `uvm_object_utils(mem_txn)

  function new(string name = "mem_txn");
    super.new(name);
  endfunction
endclass
