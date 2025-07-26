class cache_req extends uvm_sequence_item;
    `uvm_object_utils(cache_req)

    rand bit [31:0] addr;
    rand bit [3:0]  size;
    bit             is_unaligned;

    //Valid size values
    constraint c_valid_sizes {
        size inside {1 ,2, 4, 8, 16};
    }

    //Address must be aligned to size
    constraint c_alignment {
        addr % size == 0;
    }

     //Covergroup to track sizes and unaligned access
    covergroup cg_align;  
        size_cp: coverpoint size {
            bins sz_1  = {1};
            bins sz_2  = {2};
            bins sz_4  = {4};
            bins sz_8  = {8};
            bins sz_16 = {16};
        }

        unaligned_cp: coverpoint is_unaligned {
            bins aligned   = {0};
            bins unaligned = {1};
        }

        cross_cp: cross size_cp, unaligned_cp;
    endgroup

    //Sampling function: to be called manually from test/ monitor
    function void sample();
        is_unaligned = (addr % size != 0);
        cg_align.sample();
    endfunction

    function new(string name = "cache_req");
        super.new(name);
        cg_align = new();
    endfunction

    function string convert2string();
    return $sformatf("addr=0x%08h, size=%0d, unaligned=%0b", addr, size, is_unaligned);
    endfunction
   
endclass