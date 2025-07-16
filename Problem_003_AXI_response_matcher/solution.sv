module axi_response_matcher;

    //Example inputs
    int sent_ids[]       = '{11, 22, 33, 44};
    int received_ids[]   = '{33, 11, 44, 22};

    //Function to check if received_ids is a valid response set for sent_ids
    function bit is_response_valid(int sent[], int received[]);
        int expected[int];    //Acts like a set: sent IDS
        int response[int];    //Used to check for duplicates
        int i;

    // Store sent IDs into expected map
        foreach (sent[i])
          expected[sent[i]] = 1;

    //Iterate over received IDS
          foreach (received[i]) begin
            int id = received[i];

            //If it is not in the sent list, it is invalid
            if(!expected.exists(id)) begin
                return 0;
            end

            //If it's already been seen, it's a duplicate
            if(response.exists(id)) begin
                return 0;
            end

            response[id] = 1; //Mark as seen

          end

    //Final check: Did we receive everything that was sent
          foreach (expected[id])
            if(!response.exists(id))
            return 0;

          return 1;
    endfunction

    initial begin
        bit result = is_response_valid(sent_ids, received_ids);
        if (result)
           $display("Response is valid.");
        else
           $display("Response is invalid.");
    end
    
endmodule