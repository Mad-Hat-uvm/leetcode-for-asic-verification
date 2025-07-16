def is_response_valid(sent_ids, received_ids):
  if len(sent_ids) != len(received_ids):
    return False
  
  sent_set = set(sent_ids)
  received_set = set(received_ids)

  return sent_set == received_set

# ============================
# ✅ Test Cases
# ============================

if __name__ == "__main__":
  sent     = [11, 22, 33, 44]
  received = [33, 11, 44, 22]
  print(is_response_valid(sent, received))


