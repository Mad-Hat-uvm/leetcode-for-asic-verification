class txn_seq_c;

    rand int num_trans;
    rand int id[];
    rand int delay[];
    rand bit is_write[];

  // ------------------------
  // Constraint blocks
  // ------------------------
    constraint c_size {
        num_trans inside {[1 : 10]};
        id.size()       == num_trans;
        delay.size()    == num_trans;
        is_write.size() == num_trans;
    }

    constraint c_unique {
        unique {id};         //all IDs must differ
        foreach (id[i]) id[i] inside {[0 : 255]};
    }

  //relational per - elelment dependency
    constraint c_conditional {
        foreach (delay[i]) delay[i] inside {[1:20]};
        sum(delay) <= 100;
    }

    //relational per - element dependency
    constraint c_conditional {
        foreach (is_write[i])
          if (is_write[i]) delay[i] >= 5;
    }

    //ensure atleast one read exists
    constraint c_read_present {
        (is_write.sum() < num_trans); //not all writes
    }

    //helper function to compute array sum
    function int sum(ref int arr[]);
        int s = 0; foreach (arr[i])  s = s + arr[i];
        return s;
    endfunction

endclass