# Problem 003 — FSM State & Transition Coverage (with illegal bins)

**Category:** Coverage

## Problem
Create functional coverage for a simple 3-state FSM: `IDLE -> BUSY -> DONE -> IDLE`.
Track:
- State hits (IDLE, BUSY, DONE)
- Legal transitions: IDLE⇒BUSY, BUSY⇒DONE, DONE⇒IDLE
- Illegal transition: IDLE⇒DONE (should never occur)

## Expected
- `typedef enum logic [1:0] {IDLE, BUSY, DONE} state_e;`
- A covergroup sampling on `@(posedge clk)` with:
  - State coverpoint (bins for each state)
  - Transition bins for legal transitions
  - `illegal_bins` for `IDLE => DONE`
- A tiny stimulus that exercises the legal loop a few times
- Print instance coverage at the end
