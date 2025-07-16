# 🌩️ Problem 004: FIFO Push-Pop Validator

## 📝 Problem Statement

You are given two lists:

- `push_seq[]`: the sequence of elements pushed into a FIFO.
- `pop_seq[]`: the sequence of elements popped from the FIFO.

Your task is to determine whether `pop_seq` is a valid output for a **first-in-first-out (FIFO)** queue given `push_seq`.

---

## 🔍 Example 1

```
Input:
  push_seq = [1, 2, 3, 4, 5]
  pop_seq  = [1, 2, 3, 4, 5]

Output:
  True
```

👍 Valid FIFO behavior — elements are popped in the same order they were pushed.

---

## 🔍 Example 2

```
Input:
  push_seq = [1, 2, 3, 4, 5]
  pop_seq  = [2, 1, 3, 4, 5]

Output:
  False
```

\274\230 Invalid — `2` is popped before `1`, which violates FIFO order.

---

## ✅ Constraints

- All elements are unique
- `pop_seq` can be shorter than `push_seq`
- An empty `pop_seq` is always valid

---

## 🎯 Relevance to Verification

This models:

- Scoreboard validation of FIFO implementations  
- Queue behavior in UVM monitors  
- AXI/AHB response buffer and queue order validation  
- Transaction sink checks for order-sensitive protocols


