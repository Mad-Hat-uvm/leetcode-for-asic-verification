def find_first_unacked_id(issued_ids, acked_ids):
    acked_set = set(acked_ids)

    for txn_id in issued_ids:
        if txn_id not in acked_set:
            return txn_id
        
    return None  #All acknowledged