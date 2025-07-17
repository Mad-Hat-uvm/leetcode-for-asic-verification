# 🌩️ Problem 005: Transaction Reorder Validator (Out-of-Order Handling)

## 📝 Problem Statement

You are given:

- `sent_ids[]`: transaction IDs sent to the DUT, in order  
- `received_ids[]`: transaction IDs received from the DUT, possibly out of order  
- `max_reorder_depth`: an integer `k` representing the max allowed reorder depth  

Your task is to write a function that returns `True` if `received_ids` is a valid out-of-order response for `sent_ids` under the following conditions:

1. All IDs are unique  
2. No transaction is dropped or duplicated  
3. Transactions may be received out of order, but at most `k` transactions can be delayed

---

## 🔍 Example 1

```
Input:
  sent_ids     = [100, 200, 300, 400]
  received_ids = [100, 200, 300, 400]
  k = 2

Output:
  True
```

👍 In-order match is always valid for any k ≥ 0.

---

## 🔍 Example 2

```
Input:
  sent_ids     = [1, 2, 3, 4, 5]
  received_ids = [3, 1, 2, 4, 5]
  k = 2

Output:
  False
```

\274\230 Transaction 3 is received too early, violating k=2 bound.

---

## 🔍 Example 3

```
Input:
  sent_ids     = [1, 2, 3, 4, 5]
  received_ids = [2, 1, 3, 4, 5]
  k = 2

Output:
  True
```

👍 Transaction 1 was delayed by 1 → valid within k=2.

---

## ✅ Constraints

- All IDs are unique  
- Length of both lists is equal  
- k ≥ 0

---

## 🎯 Relevance to Verification

This models:

- AXI4/ACE out-of-order response tracking  
- UVM scoreboard and memory model matching  
- Validation of protocol-compliant reorder buffers
