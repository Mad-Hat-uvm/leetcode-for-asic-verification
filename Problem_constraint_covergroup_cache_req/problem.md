# Problem 002 – Alignment-Constrained Cache Request with Coverage

## 📝 Problem Statement

You are verifying a cache controller that accepts requests with the following fields:
- `addr`: a 32-bit address
- `size`: the access size in bytes (must be 1, 2, 4, 8, or 16)

### Constraints:
1. `addr` must be aligned to `size`  
   → e.g., if size = 8, then `addr % 8 == 0`

2. `size` must be one of the allowed values: {1, 2, 4, 8, 16}

---

## 🔧 Class Requirements

Implement a `uvm_sequence_item` named `cache_req` with:
- `rand bit [31:0] addr;`
- `rand bit [3:0] size;`
- Constraint ensuring alignment: `addr % size == 0`
- Constraint ensuring size is legal
- A `bit is_unaligned;` for coverage tracking only

---

## 🎯 Coverage Model

Define a `covergroup` that includes:
- A coverpoint for all legal sizes
- A coverpoint for `is_unaligned` (0 for good, 1 for bad)
- A cross between size and `is_unaligned` to analyze biasing
- Use a `sample()` method to explicitly evaluate coverage logic

---

## ✅ Example Usage

```systemverilog
cache_req req = cache_req::type_id::create("req");
repeat (10) begin
  assert(req.randomize());
  req.sample();  // Call this to trigger coverage
end
