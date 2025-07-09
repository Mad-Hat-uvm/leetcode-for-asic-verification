module first_unacked;

    //Declare input arrays
    int issued_ids[] = '{101, 102, 103, 104};
    int acked_ids[]  = '{104, 101};

    //Function to find the first unacknowledged transaction
    function int find_first_unacked_id(int issued[], int acked[]);
        int acked_map[int];   //Mimic a python set using associative array
        int i;
    
        //Build the set from acked_ids
         foreach acked_ids[i] begin
            acked_map[acked_ids[i]] = 1;
         end
        //iterate over each issued_id
        foreach issued_ids[i] begin
            if (! acked_map.exists(issued_ids[i])) begin
                return issued_ids[i];
            end
        end

        return -1;  //All were acknowledged
    endfunction

     // Test the function in an initial block
   initial begin
     int result = find_first_unacked_id(issued_ids, acked_ids);
     $display("First unacknowledged ID: %0d", result); // Should print 102
   end
endmodule

✅ Advantages
Faster for large data (like Python sets)

More elegant and readable than nested loops

Especially useful in UVM environments when tracking seen IDs