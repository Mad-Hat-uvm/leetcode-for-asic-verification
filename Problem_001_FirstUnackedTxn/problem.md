# 🧩 Problem 001: First Unacknowledged Transaction

## 📝 Problem Statement

You're given two arrays:

- `issued_ids[]`: a list of unique transaction IDs that were issued **in order**
- `acked_ids[]`: a list of transaction IDs that have been acknowledged **in any order**

Your task is to return the **first transaction ID** from `issued_ids` that **has not been acknowledged yet**.

---

## 📘 Example

```text
Input:
  issued_ids = [101, 102, 103, 104]
  acked_ids  = [104, 101]

Output:
  102
