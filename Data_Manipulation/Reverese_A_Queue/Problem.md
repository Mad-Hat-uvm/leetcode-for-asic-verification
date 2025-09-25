# Problem 001 — Reverse a Queue

**Category:** Data_Manipulation  

## Problem Statement
Given a queue of integers, reverse its contents using SystemVerilog constructs.  
Do not use built-in reverse functions. You may use queues, dynamic arrays, or stacks.  

## Example
Input:  q = {1, 2, 3, 4, 5}  
Output: q = {5, 4, 3, 2, 1}  

## Constraints
- The queue may have up to 100 elements.
- Elements are integers (32-bit).
- Solution should work for empty queues as well.

## Expected
- Write a class `reverse_q` with:
  - `rand int q[$];` (input queue)
  - `function void do_reverse();` (performs reversal)
- Add test code in an initial block to demonstrate functionality.
