class sum_item extends uvm_sequence_item;
    rand bit [3:0] arr[3]; // Array of 3 elements, each 4 bits wide

    `uvm_object_utils(sum_item)

    function new(string name = "sum_item");
        super.new(name);
    endfunction

    // Constraint to ensure the values are in the range 1 to 14
    constraint c_value_range {
        foreach (arr[i]) arr[i] inside {[1:14]};
    }

    // Constraint to ensure the sum of the array elements is 15
    constraint c_sum {
        arr.sum() == 15;
    }

    // Constraint to ensure the array elements are in strictly increasing order
    constraint c_order {
        arr[0] < arr[1];
        arr[1] < arr[2];
    }

    // Function to display the array values
    function void do_print(printer);
        foreach (arr[i])
        `uvm_info("sum_item", $sformatf("arr[%0d] = %0d", i, arr[i]), UVM_LOW);
    endfunction
endclass