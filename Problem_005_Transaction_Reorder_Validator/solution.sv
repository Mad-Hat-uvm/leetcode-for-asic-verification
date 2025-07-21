module reorder_validator_strict;

    //Example test input
    int sent_ids[]      =  '{1, 2, 3, 4, 5};
    int received_ids[]  =  '{2, 1, 3, 4, 5};
    int k               =  2;

    //Function to validate per-element reorder delay
    function bit is_valid_reorder_by_index(int sent[], int received[], int k);
        int sent_pos_map[int];      // Maps transaction `ID -> original index
        int j;
        int delay;

    //Build the index map
        foreach (sent[i])
          sent_pos_map[sent[i]] = i;

    //Check each received ID for how it was pulled ahead
    foreach (received[j]) begin
        int original_index = sent_pos_map.exists(received[j]) ? sent_pos_map[received[j]] : -1;

    //Sanity check
     if(original_index == -1) begin
        $display("ID %0d not found in sent_ids", received[j]);
        return 0;
     end

     delay = j - original_index;

     //if this transaction came more than 'k' positions early
     if(delay > k) begin
        $display("Reorder too deep: ID=%0d, sent_idx=%0d, recv_idx=%0d, delay=%0d",
                 received[j], original_index, j, delay);
                 return 0;
     end
    end

    return 1;    //All delays within bound
    endfunction

    //Testbench
    initial begin
        bit result = is_valid_reorder_by_index(sent_ids, received_ids);
        if(result)
         $display("Reordering is valid within bound k = %d", k);
        else
         $display("Reordering is invalid for bound k = %0d", k);
    end
endmodule