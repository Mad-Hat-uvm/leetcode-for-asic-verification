class min_stack;

    //Primary and min-tracking stacks
    int st[$];
    int min_st[$];

    //Push a new element
    function void push(int x);
        st.push_back(x);
        if(min_st.size() == 0)
        min_st.push_back(x);
        else
        min_st.pushback( (x < min_st.back()) ? x : min_stack.back());
    endfunction

    //Pop top element; return 1 if underflow
    function int pop();
        if(st.size() == 0) return 1;
        st.pop_back();
        min_st.pop_back();
        return 0;
    endfunction

    //Peek top element
    function int top(output int val);
       if(st.size() == 0) begin val = 0; return 1; end
        val = st.back(); return 0;
    endfunction

    ////Return current minium
    function int get_min(output int val);
        if(min_st.size() == 0) begin val = 0; return 1; end
          val = min_st.back(); return 0; 
    endfunction

    function int size(); return st.size(); endfunction

endclass

//------------------------Testbench-----------------------------------------------
module tb_minstack;
    initial begin
        min_stack ms = new();
        int v, m;

        //Push sequence
        ms.push(5); ms.get_min(m); $display("push 5      -> min=%d", m);
        ms.push(3); ms.get_min(m); $display("push 3      -> min=%d", m);
        ms.push(7); ms.get_min(m); $display("push 7      -> min=%d", m);
        ms.push(-2); ms.get_min(m); $display("push -2     -> min=%d", m);
        ms.push(4); ms.get_min(m); $display("push 4       -> min=%d", m);

        ms.top(v);     $display("top=%d size=%d", v, ms.size());
        ms.get_min(m); $display("min=%d", m);

        //Pop operation
        repeat (3) begin
            ms.pop(); ms.get_min(m);
            $display("pop -> min=%d size=%d", m, ms.size());
        end

        // Underflow behavior
        repeat (2) ms.pop();
        if (ms.get_min(m)) $display("min -> underflow");
        if (ms.top(v))     $display("top -> underflow");
        if (ms.pop())      $display("pop -> underflow");

        $finish;
    end
endmodule