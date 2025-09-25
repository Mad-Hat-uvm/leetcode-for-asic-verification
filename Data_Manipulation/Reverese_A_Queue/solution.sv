class reverse_q;
    rand int q[$]; //dynamic queue of integers

    //Constructor
    function new(input int arr[$]);
        q = arr;
    endfunction

   //Reverse Logic
    function void do_reverse();
        int temp[$];
        while (q.size() > 0)
         temp.push_back(q.pop_back()); //pop from original queue end and push to temp queue
        q = temp; //assign temp queue to original queue
    endfunction 

    function void display();
        $display(" Queue Contents: %p", q);
    endfunction
endclass

//-------------------Testbench-------------------
module tb;
    initial begin
        int arr[$] = {1,2,3,4,5};
        reverse_q r = new(arr);

        $display("Before Reversing:");
        r.display();

        r.do_reverse();

        $display("After Reversing:");
        r.display();
    end
endmodule