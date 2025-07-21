# 🌩️ Problem 006: Write-After-Write (WAW) Hazard Detector

## 📝 Problem Statement

You are given a list of **write transactions**, each represented as:
```python
writes = [
    (address, timestamp),
    ...
]
```

You need to identify and return all pairs of transactions that form a **Write-After-Write (WAW) hazard**, i.e.:

> Two writes to the **same address**, where the **second write occurs before the first one completes.**

Assume:
- Writes take `latency` cycles to complete.
- So a write issued at `timestamp t` completes at `t + latency`.

---

## 🔍 Input Example

```python
writes = [
    ("0xA0", 1),
    ("0xB0", 2),
    ("0xA0", 3),
    ("0xA0", 6)
]
latency = 3
```

### 📊 Expected Output:

```python
[(0, 2)]
```

- write 0 to `0xA0` starts at t=1 → completes at t=4
- write 2 to `0xA0` starts at t=3 → overlaps with previous → ❌ hazard
- write 3 to `0xA0` starts at t=6 → safe

---

## ✅ Constraints

- Each transaction is `(address: str, timestamp: int)`
- List is ordered by issue time
- Return a list of pairs `(i, j)` where j > i and j’s write violates WAW

---

## 🎯 Relevance to Verification

This models:
- Scoreboard and checker logic in memory subsystems
- AXI4 interleaved writes, transaction overlap detection
- Write queue flush vs overlapping hazard in functional simulation
