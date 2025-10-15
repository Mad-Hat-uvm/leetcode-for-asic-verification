module tb_assertions;
    logic clk = 0, rst_n = 0;
    logic req, ack, ready, valid;

    always #5 clk = ~clk;

    initial begin
        req = 0; ack = 0; ready = 0; valid = 0;
        repeat (2) @(posedge clk);
        rst_n = 1;

        //Good handshake
        @(posedge clk); req <= 1;
        @(posedge clk); req <= 0;
        repeat (2) @(posedge clk);
        ack <= 1; @(posedge clk); ack <= 0;

        repeat (5) @(posedge clk);
        $finish();
    end

    default clocking cb @(posedge clk);
    endclocking

   //1) Ack within 1-3 cycles after Req
    property p_ack_latency;
        @(posedge clk) disable iff (!rst_n)
        $rose(req) |-> ##[1:3] $rose(ack);
    endproperty
    assert property(p_ack_latency)
    else $error("Ack not received within 1-3 cycles after Req");

    //2) Req and Ack never high together
    property p_mutual_exclusion;
        @(posedge clk) disable iff(!rst_n)
        !(req && ack);
    endproperty
    assert property (p_mutual_exclusion)
    else $error("Req and Ack both high together");

    //3)No new Req until Ack arrives
    property p_no_overlap_req;
        @(posedge clk) disable iff(!rst_n)
        $rose(req) |-> (!req until $rose(ack));
    endproperty
    assert property (p_no_overlap_req)
    else $error("Overlapping Req before Ack");

  // -----------------------------
  // Ready/Valid Protocol Checks
  // -----------------------------

    //4) Valid must stay high until Ready
    property p_hold_valid;
        @(posedge clk) disable iff(!rst_n)
         $rose(valid) |-> valid until ready;
    endproperty
    assert property(p_hold_valid)
    else $error("Valid deassertedbefore Ready");

    //5) Transfer happens when Valid && Ready
    property p_transfer_rule;
        @(posedge clk) disable iff(!rst_n)
        (ready && valid) |-> ##1 !valid;
    endproperty
    assert property(p_transfer_rule)
    else $error("Valid not cleared after transfer");


endmodule