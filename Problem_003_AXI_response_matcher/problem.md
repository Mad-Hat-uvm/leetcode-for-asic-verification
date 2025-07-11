
# 🧩 Problem 003: AXI Response Matcher (Scoreboard Style)

## 📝 Problem Statement

You are given two lists of transaction IDs:

- `sent_ids[]`: transaction IDs sent to the DUT (Design Under Test), in order.
- `received_ids[]`: transaction IDs received from the DUT as responses, in any order.

Your task is to implement a checker that returns `True` if and only if:
1. All sent transaction IDs are acknowledged once in `received_ids`.
2. There are no extra or duplicate responses.

Return `True` if the response is valid, otherwise `False`.

---

## 🔍 Example 1

```
Input:
sent_ids     = [11, 22, 33, 44]
received_ids = [33, 11, 44, 22]

Output: True
```

✅ All responses match the sent IDs (order does not matter).

---

## 🔍 Example 2

```
Input:
sent_ids     = [10, 20, 30]
received_ids = [30, 10]

Output: False
```

❌ Response for ID 20 is missing.

---

## 🔍 Example 3

```
Input:
sent_ids     = [7, 8, 9]
received_ids = [9, 8, 8, 7]

Output: False
```

❌ Duplicate response for ID 8.

---

## ✅ Constraints

- `sent_ids` contains unique values.
- `received_ids` may contain duplicates or be incomplete.
- Return a boolean result.

---

## 🎯 Relevance to Verification

This problem is similar to:

- AXI read/write response checking
- UVM scoreboard reference model matching
- Ensuring protocol correctness in response paths
