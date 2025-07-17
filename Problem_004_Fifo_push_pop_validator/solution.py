def is_valid_fifo_behavior(push_seq, pop_seq):
    fifo_queue = []
    i = 0  #Index into pop_seq

    for val in push_seq:
        fifo_queue.append(val)

        #Try to match as many pops as possible
        while fifo_queue and i < len(pop_seq) and fifo_queue[0] == pop_seq[i]:
            fifo_queue.pop(0)
            i += 1

    return i == len(pop_seq)

# ============================
# ✅ Test Cases
# ============================
if __name__ == "__main__":
    print(is_valid_fifo_behavior([1, 2, 3, 4, 5], [1, 2, 3, 4, 5]))  # True
    print(is_valid_fifo_behavior([1, 2, 3, 4, 5], [2, 1, 3, 4, 5]))  # False
    print(is_valid_fifo_behavior([10, 20, 30], []))                 # True
    print(is_valid_fifo_behavior([1, 2, 3], [1, 2]))                # True
    print(is_valid_fifo_behavior([1, 2, 3], [3]))                   # False
