# 🧩 Problem 002: Bitfield Extractor (Register Decoder)

## 📝 Problem Statement

You are given a **32-bit unsigned integer** representing a memory-mapped register value.  
The register is divided into the following bitfields:

| Bits    | Field     |
|---------|-----------|
| 31:28   | opcode    |
| 27:16   | address   |
| 15:8    | data_len  |
| 7:0     | flags     |

Write a function to extract these fields using **bitwise operators only**. Return the results as a dictionary (Python) or struct/printable fields (SystemVerilog).

---

## 📘 Example

```text
Input:
  reg_value = 0xA2FF0B3C

Output:
  {
    opcode:   0xA,     // bits 31–28
    address:  0x2FF,   // bits 27–16
    data_len: 0x0B,    // bits 15–8
    flags:    0x3C     // bits 7–0
  }
