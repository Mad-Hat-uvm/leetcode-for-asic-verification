def is_valid_reorder(sent_ids, received_ids, k):
    if set(sent_ids) != set(received_ids):
        return False   #IDs missing or duplicated
    
    #Map sent_id to its original index
    sent_pos = {id_: idx for idx, id_ in enumerate(sent_ids)}

    for j, j in enumerate(received_ids):
        original_index = sent_pos.get(j, -1)

        if original_index == -1:
            return False  #unknown ID
        
        delay = j - original_index  

        if delay > 2:
            print(f"ID {j} reordered too far: delay={delay}, k={k}")
            return False
        
        return True
    
# ============================
# ✅ Test Cases
# ============================
if __name__ == "__main__":
    print(is_valid_reorder([1, 2, 3, 4, 5], [2, 1, 3, 4, 5], 2))  # ✅ True
    print(is_valid_reorder([1, 2, 3], [3, 2, 1], 1))              # ❌ False
    print(is_valid_reorder([1, 2, 3], [1, 2, 3], 0))              # ✅ True
    print(is_valid_reorder([1, 2, 3], [2, 1, 3], 1))              # ✅ True