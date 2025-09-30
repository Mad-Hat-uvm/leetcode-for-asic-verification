# Problem 002 — Generate Non-Overlapping Random Segments

**Category:** Constraints  

## Problem Statement
Given a start point `sp` and an end point `ep`, generate **10 random non-overlapping segments** within this range.  
Each segment is represented as `(start, end)`.  

## Example
Input: (sp, ep) = (10, 90)  
Possible Output:  
(10, 15), (20, 25), (30, 33), (40, 42), (50, 55), (60, 62), (65, 67), (70, 74), (75, 80), (82, 86)

## Constraints
- `sp < ep`
- Segments must not overlap.
- All segments must be strictly within `[sp, ep]`.
- Exactly 10 segments must be generated.

## Expected
- Use a SystemVerilog class with:
  - `rand int start[10];`
  - `rand int end[10];`
- Apply constraints to ensure:
  - `start[i] < end[i]`
  - Segments do not overlap
  - Segments fall within `(sp, ep)`
