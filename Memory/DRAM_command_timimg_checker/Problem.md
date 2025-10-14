# Problem 006 — DRAM Command Timing Checker (tRCD, tRP, tRAS)

**Category:** Memory  

## Goal
Write SystemVerilog assertions that ensure a single-bank DRAM controller never violates basic
JEDEC-style timing relationships.

### Commands
* **ACT** – Open a row.  
* **READ/WRITE** – Access columns from the open row.  
* **PRE** – Close the row.  

### Timing Parameters (Example)
| Name | Meaning | Min Cycles |
|------|----------|------------|
| tRCD | ACT→READ/WRITE delay | 3 |
| tRAS | ACT→PRE delay | 7 |
| tRP  | PRE→next ACT delay | 3 |

### Rules to Check
1. **tRCD:** No READ/WRITE for tRCD cycles after ACT.  
2. **tRAS:** No PRE for tRAS cycles after ACT.  
3. **tRP:** No ACT for tRP cycles after PRE.  
4. **Protocol:** READ/WRITE only while a row is open.  
5. **No double ACT:** Back-to-back ACT without PRE is illegal.

### Deliverables
* SystemVerilog testbench with clock + reset.  
* Randomized command generator.  
* Assertions implementing the above five rules.  
* Commented illegal stimuli to trigger violations.

### Interview Focus
Explain why each assertion exists and what physical timing it represents inside the DRAM.
