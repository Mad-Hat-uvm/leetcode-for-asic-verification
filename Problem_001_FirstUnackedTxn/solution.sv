module first_unacked;

    //Declare input arrays
    int issued_ids[] = '{101, 102, 103, 104};
    int acked_ids[]  = '{104, 101};

    //Function to find the first unacknowledged transaction
    function int find_first_unacked_id(int issued[], int acked[]);
        int i, j;
        bit is_acknowledged;

        //iterate over each issued_id
        foreach issued_ids[i] begin
            is_acknowledged = 0;

            //Scan acked_ids for issued_ids
            foreach acked_ids[j] begin
                if (issued_ids[i] == acked_ids[j]) begin
                    is_acknowledged = 1;
                    break; //Found it, no need to check further
                end
            end

            //If we didn't find a match, return this ID
            if(!is_acknowledged) 
             return issued_ids[i];
        end

        return -1;  //All were acknowledged
    endfunction

     // Test the function in an initial block
   initial begin
     int result = find_first_unacked_id(issued_ids, acked_ids);
     $display("First unacknowledged ID: %0d", result); // Should print 102
   end
endmodule