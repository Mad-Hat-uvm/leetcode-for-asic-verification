class packet_c;

    rand bit [7:0] addr;
    rand int       len;
    rand bit       wr;
    rand int       priority;

  // --------------------------
  // Constraint block
  // -------------------------- 
    constraint c_basic {
        addr inside {[0 : 255]};    //legal address range
        addr % 4 == 0;              //4 - byte alignment
        len inside {[1 : 16]};      //length limit
    }

  //relational + conditional
    constraint c_conditional {
        if (wr) len > 4;           //WRITE packets larger than 4 bytes
        else    len <= 4;          //READ packets smaller/equal to 4 bytes
    }

  //weighted distribution
   constraint c_priority {
    priority dist { 0 := 1, 1 := 2, 2 := 1 };
   }

endclass : packet_c

// --------------------------
// Testbench
// --------------------------
module tb_constraints;
    initial begin
        packet_c p = new();

        $display("------------------------------------------------------");
        for (int i = 0; i < 10; i++) begin
            if(!p.randomize())
                $error("Randomization failed at iteration %0d", i);
            else 
                $display("addr: 0x%0h, len: %0d, wr: %0b, priority: %0d", p.addr, p.len, p.wr, p.priority);
        end
        $display("------------------------------------------------------");

        //Example of in-line constraint override
        if (!p.randomize() with {wr == 1; len < 8; })
            $error("Randomization with inline constraint failed");
        else 
            $display("Inline override -> addr: 0x%0h, len: %0d, wr: %0b, priority: %0d", p.addr, p.len, p.wr, p.priority);
    end
endmodule
