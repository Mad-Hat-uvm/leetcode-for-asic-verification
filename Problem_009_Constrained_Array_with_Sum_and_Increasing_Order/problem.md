# Problem 009: Constrained Array with Sum and Increasing Order

## 🧩 Problem Statement

Create a `uvm_sequence_item` class that includes an array of 3 random integers.  
Write constraints such that:

- The total sum of the 3 elements is **exactly 15**
- The elements are in **strictly increasing order** (i.e., `a[0] < a[1] < a[2]`)
- Each element is in the range `[1:14]` (to avoid zero or overflow)

---

## 📐 Required Fields

```systemverilog
class sum_item extends uvm_sequence_item;
  rand bit [3:0] a[3]; // 4-bit wide, 3-element array

  // Constraints:
  // - sum == 15
  // - strictly increasing
  // - each element between 1 and 14

  `uvm_object_utils(sum_item)
endclass
