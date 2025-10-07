# Problem 004 — Gray to Binary Conversion

**Category:** Data_Manipulation

## Problem
Write a SystemVerilog function that converts a given `n`-bit Gray code into its Binary equivalent.

## Example
Input:  gray = 4'b1011  
Output: binary = 4'b1110  

Explanation:  
- gray[3] = binary[3] = 1  
- binary[2] = binary[3] ^ gray[2] = 1 ^ 0 = 1  
- binary[1] = binary[2] ^ gray[1] = 1 ^ 1 = 0  
- binary[0] = binary[1] ^ gray[0] = 0 ^ 1 = 1  
Result = 1110

## Constraints
- Input can be of size 2–32 bits
- Must use bitwise operators only
- Provide both function and testbench to demonstrate conversion
