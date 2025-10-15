# Problem 009 — Assertion Practice (Basic Timing and Protocol Checks)

**Category:** Assertions  

## Goal
Write SystemVerilog Assertions (SVA) for a simple req/ack handshake and a ready/valid protocol.  
Be able to explain the timing and semantics of each property.

### Handshake Spec
* `req` is a 1-cycle pulse.  
* `ack` must arrive within 1–3 cycles after `req`.  
* `req` and `ack` must never be high together.  
* No new `req` until the previous `ack` is observed.  

### Ready/Valid Spec
* `valid` must remain asserted until `ready` is high.  
* A transfer happens only when `ready && valid` on the same cycle.  
* After transfer, `valid` can deassert on next cycle.  

### Deliverables
* A module with clock/reset and signals `req, ack, ready, valid`.  
* Five SVA properties covering the above rules.  
* Comments explaining `|->` vs `|=>`, and same-cycle vs next-cycle checks.  
* Stimulus that shows both passing and failing cases (commented out).

### Interview Focus
Be able to state for each property:
- What event triggers it.  
- How many cycles the delay window spans.  
- What a violation means in waveform terms.
