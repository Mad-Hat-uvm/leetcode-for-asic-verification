# Problem 008 — Advanced Constraints (Array & Relational Scenarios)

**Category:** Constraints  

## Goal  
Build a class that randomizes an array of transaction IDs and timing values using advanced constraint features:
- Array size and element value control  
- `foreach` iteration constraints  
- `unique` elements  
- Cross-field relationships  
- Conditional constraint modes  

### Transaction Description
| Field | Type | Meaning |
|--------|-------|----------|
| `num_trans` | `rand int` | Number of transactions (1 – 10) |
| `id[]` | `rand int array` | Unique transaction IDs (0 – 255) |
| `delay[]` | `rand int array` | Delay between transactions (1 – 20 cycles) |
| `is_write[]` | `rand bit array` | Write (1) or Read (0) flag |

### Constraints
1. `id.size() == num_trans; delay.size() == num_trans; is_write.size() == num_trans;`  
2. All IDs must be `unique`.  
3. Total sum of delays ≤ 100.  
4. If `is_write[i] == 1`, then `delay[i] >= 5`.  
5. At least one transaction must be a read.  

### Deliverables
- SystemVerilog class `txn_seq_c` implementing all constraints.  
- A testbench that randomizes 5 sequences and prints their arrays.  
- Demonstrate turning off a constraint using `constraint_mode(0)` and re-randomizing.  

### Interview Focus
Explain:  
- How `foreach` loops expand elementwise constraints.  
- What `unique` does internally for solver consistency.  
- How conditional dependency chains affect solve order.  
- How constraint mode affects constraint pool visibility.  
