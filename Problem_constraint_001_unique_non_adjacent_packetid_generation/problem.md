# Problem 015 – Unique, Non-Adjacent Packet ID Generation

## Difficulty
Intermediate

## Tags
Constrained Randomization, SystemVerilog, UVM Sequence, Random Retry Loop

## Problem Statement

You are writing a UVM sequence to generate `N` packets, each containing an 8-bit ID. The requirements for the generated IDs are:

1. Each ID must be **unique** – no duplicate IDs across the entire sequence.
2. Each ID must **not be adjacent** to the previous one – meaning `abs(curr_id - prev_id) != 1`.

### Input
- A parameter `N` (1 ≤ N ≤ 256) specifying how many packets to generate.

### Output
- `N` unique packets with randomly generated 8-bit IDs (`0–255`), printed/logged in order of generation.

### Constraints
- The packet `id` must be in the range `[0, 255]`.
- Adjacent IDs (like 42 and 43) are **not allowed**.
- IDs must be **globally unique** across all packets.
- Re-randomization is allowed until a valid value is found.
- The logic must be implemented as a UVM sequence using `randomize()` and optionally `post_randomize()`.

### Requirements
- Create a `packet` class that extends `uvm_sequence_item` with a random `id`.
- Create a `gen_unique_packet_seq` sequence that:
  - Accepts `N` as input
  - Generates `N` valid packets as per the constraints
  - Logs each valid packet using `uvm_info`
- Use a retry loop if `randomize()` fails or if a duplicate/adjacent ID is generated.

---

## Example Output (N = 5)

```log
UVM_INFO @ 0: uvm_test_top.packet [POST] Generated ID = 13
UVM_INFO @ 0: uvm_test_top.packet [SEQ]  Packet[0] = 13

UVM_INFO @ 0: uvm_test_top.packet [POST] Generated ID = 20
UVM_INFO @ 0: uvm_test_top.packet [SEQ]  Packet[1] = 20

UVM_INFO @ 0: uvm_test_top.packet [POST] Generated ID = 25
UVM_INFO @ 0: uvm_test_top.packet [SEQ]  Packet[2] = 25

UVM_INFO @ 0: uvm_test_top.packet [POST] Generated ID = 10
UVM_INFO @ 0: uvm_test_top.packet [SEQ]  Packet[3] = 10

UVM_INFO @ 0: uvm_test_top.packet [POST] Generated ID = 44
UVM_INFO @ 0: uvm_test_top.packet [SEQ]  Packet[4] = 44