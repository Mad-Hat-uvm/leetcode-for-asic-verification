module fifo_push_pop_validator;

    //Test input sequences
    int push_seq[]  =  '{1, 2, 3, 4, 5};
    int pop_seq[]   =  '{1, 2, 3, 4, 5};

    //Function to check if pop_seq is a valid FIFO behavior of push_seq
    function bit is_valid_fifo(int push[], int pop[]);
        int q[$];    // FIFO queue
        int i = 0;   //Index for pop[]

        foreach(push[j]) begin
            q.push_back(push[j]);

            //Match as many pops as possible
            while (!q.empty() && i < pop.size() && q[0] == pop[i]) begin
                q.pop_front();
                i++;
            end
        end

        return i == pop.size();
    endfunction

    initial begin
        bit result = is_valid_fifo(push_seq, pop_seq);

        if(result)
        $display("Valid FIFO behavior");
        else
        $display("Invalid FIFO behavior");
    end
endmodule