# Problem 005 — Req/Ack Handshake Assertions (SVA)

**Category:** Assertions

## Goal
Write SystemVerilog Assertions (SVA) to verify a simple `req/ack` handshake with the following rules:

1) `req` is a **1-cycle pulse**.  
2) `ack` is a **1-cycle pulse**.  
3) After a `req`, an `ack` **must arrive within 1–5 cycles**.  
4) **No overlapping requests**: once a `req` is issued, **no new `req`** can occur until the `ack` arrives.  
5) **No spurious `ack`**: `ack` must **not** occur without a prior `req` in the last 1–5 cycles.  
6) During reset, assertions are disabled.

### Signals
- `clk` : sampling clock  
- `rst_n` : active-low synchronous reset (asserted low)  
- `req` : 1-cycle request pulse  
- `ack` : 1-cycle acknowledge pulse

## Expected Deliverables
- A single testbench file that:
  - Generates a clock and reset.
  - Provides **passing stimulus** for a few legal handshakes.
  - Contains **SVAs** implementing the 5 rules above.
  - Includes **optional failing cases** as commented code (uncomment to see assertion failures).

## Hints
- Use `disable iff (!rst_n)` to mask reset.
- Use `$rose(sig)` for edge detection.
- Pulse check: `$rose(req) |-> ##1 !req`
- Latency window: `##[1:5]`
- “No overlap” pattern: `(!req until_with $rose(ack))`
- A strict “no spurious ack” check can be written with `$past($rose(req), k)` over k=1..5.

## What Interviewers Look For
- Mapping spec bullets → one property each.
- Correct temporal windows and pulse semantics.
- Clean reset masking and readable properties.
- Optional negative tests demonstrating that your checks actually catch bugs.
