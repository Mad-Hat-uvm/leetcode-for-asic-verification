// Problem 006 — DRAM Command Timing Checker (tRCD, tRP, tRAS)
module tb_dram_timing;

    //Clcoking and reset
    logic clk = 0, rst_n = 0;
    always #5 clk = ~clk;
    initial begin
        repeat (3) @(posedge clk);
        rst_n = 1;
    end

    //Command encoding
    typedef enum logic [1:0] {
        ACT   = 2'b00,
        READ  = 2'b01,
        WRITE = 2'b10,
        PRE   = 2'b11
    } cmd_e;
    cmd_e cmd;

    //Random stimulus
    initial begin
        cmd = PRE;
        @(posedge rst_n);
         repeat (40) @(posedge clk) cmd <= cmd_e'($urandom_range(0, 3));
         repeat (5)  @(posedge clk);
         $finish();
    end

    //Timing parameters (in cycles)
    localparam int tRCD = 3;
    localparam int tRAS = 7;
    localparam int tRP  = 3;

    default clocking cb @(posedge clk); endclcocking

    //1)tRCD - READ/WRITE after ACT >= 3 cycles
        property p_tRCD;
            @(posedge clk) disable iff (!rst_n)
            (cmd == ACT) |-> ##[1:tRCD - 1] !(cmd inside {READ, WRITE});
        endproperty
        assert property (p_tRCD)
         else $error("tRCD violation: READ/ WRITE too soon after ACT");

    //2)tRAS - PRE after ACT >= 7 cycles
        property p_tRAS;
            @(posedge clk) disable iff (!rst_n);
             (cmd == ACT) |-> ##[1:tRAS - 1] (cmd != ACT);
        endproperty
        assert property (p_tRAS);
         else $error("tRAS violation: PRE too soon after ACT");

    //3)tRP - ACT after PRE >= 3 cycles
         property p_tRP;
            @(posedge clk) disable iff(!rst_n);
             (cmd == PRE) |-> ##[1:tRP-1](cmd != ACT);
         endproperty
         assert property (p_tRP);
            else $error("tRP violation: ACT too soon after PRE");

    //4)READ/WRITE only valid after ACT (before PRE)
            logic row_open;
            always_ff @(posedge clk or negedge rst_n) begin
                if (!rst_n) row_open <= 0;
                else case (cmd)
                    ACT:  row_open <= 1;
                    PRE:  row_open <= 0;
                endcase 

         property p_row_open_access;
            @(posedge clk) disable iff(!rst_n);
              cmd inside {READ, WRITE} |-> row_open;
         endproperty
         assert property (p_row_open_access);
            else $error("Row not open: READ/ WRITE without ACT");

    //5)No back-to-back ACT without PRE
        property p_no_double_ACT;
            @(posedge clk) disable iff (!rst_n);
               (cmd == ACT) |-> !$past(row_open);
        endproperty

        assert property (p_no_double_ACT);
            else $error("Back-to-back ACT violation: ACT without PRE");

end
            

endmodule