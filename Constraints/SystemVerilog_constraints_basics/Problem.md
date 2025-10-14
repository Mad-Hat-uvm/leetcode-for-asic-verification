# Problem 007 — SystemVerilog Constraints Basics

**Category:** Constraints  

## Goal  
Write a class that randomizes a *packet* structure with several basic constraint types:
1. Range constraints  
2. Relational constraints  
3. Conditional constraints  
4. Distribution (weighted randomization)

### Packet Description
| Field | Type | Meaning |
|-------|------|---------|
| `addr` | `rand bit [7:0]` | Address (0–255) |
| `len` | `rand int` | Packet length (1–16) |
| `wr` | `rand bit` | 1 = WRITE, 0 = READ |
| `priority` | `rand int` | Traffic class (0 = low, 1 = med, 2 = high) |

### Constraints
1. `addr` must be 4-byte aligned (`addr % 4 == 0`).
2. If `wr == 1`, then `len > 4`; otherwise `len <= 4`.
3. `priority` distribution: low : med : high = 1 : 2 : 1.
4. `len` must always be less than or equal to 16.

### Deliverables
- SystemVerilog class `packet_c` implementing all constraints.
- A small test program that randomizes 10 packets and prints them.
- Optional: try constraint randomization failure and use `randomize() with { ... }` to override one constraint.

### Interview Focus
Be ready to explain:
- How the constraint solver decides variable order.
- How implication (`if` / `->`) changes dependency.
- Difference between `inside` and relational constraints.
- What happens if constraints conflict.
