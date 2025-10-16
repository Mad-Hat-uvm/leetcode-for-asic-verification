# Problem 009 — MinStack (O(1) get_min)

**Category:** Data_Manipulation

## Goal
Design a stack that supports:
- `push(x)`
- `pop()`
- `top()` → returns top element
- `get_min()` → returns minimum element in **O(1)** time

## Constraints / Expectations
- All operations should be amortized O(1).
- Handle empty-stack cases gracefully (return an error code or a flag).
- Include a small test that exercises mixed operations:
  - push sequence with negatives & positives
  - interleaved get_min()
  - pops that change the minimum

## Hint
Use an auxiliary stack that tracks the running minimum:
- On `push(x)`: also push `min(x, current_min)` to the min-stack.
- On `pop()`: pop both stacks.
