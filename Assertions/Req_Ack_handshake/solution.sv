module tb_req_ack_sva;

//------------------------------------------------------
//Clocks
//------------------------------------------------------
    logic clk = 0;
    always #5 clk = ~clk; //100MHz clock

    logic rst_n = 0;      //sync reset (asserted low)

//------------------------------------------------------
//Handshake signals
//------------------------------------------------------
    logic req, ack;

//------------------------------------------------------
//Passing stimulus
//------------------------------------------------------
    initial begin
       req = 0, ack = 0;

        //Hold reset low for a a couple of clock cycles
        repeat (2) @(posedge clk);
        rst_n = 1; //deassert reset

        //Good handshake #1: req pulse, ack after 2 cycles
        @(posedge clk); req <= 1;
        @(posedge clk); req <= 0;
        repeat(2) @(posedge clk); 
        ack <= 1;
        @(posedge clk); ack <= 0;

        //Gap
        repeat(3) @(posedge clk);

        //Good handshake #2: req pulse, ack after 5 cycles (edge case)
        req <= 1;
        @(posedge clk); req <= 0;
        repeat(5) @(posedge clk);
        ack <= 1;
        @(posedge clk); ack <= 0;

        // ---- Uncomment any block below to see failures ----
        //1) Overlapping request (new req before ack)
        /*repeat(3) @(posedge clk);
         req <= 1; @(posedge clk); req <= 0;  //issue req
         @(posedge clk);
         req <= 1; @(posedge clk); req <= 0; //illegal new req before ack
         repeat(2) @(posedge clk); ack <= 1; @(posedge clk); ack <= 0;*/

         //2) Ack too late (>5 cycles after req)
        /*repeat(3) @(posedge clk);
          req <= 1; @(posedge clk); req <= 0; //issue req
          repeat(6) @(posedge clk); ack <= 1; @(posedge clk); ack <= 0; //illegal late ack*/

        //3) Spurious ack(no prior req)
        /*repeat(4) @(posedge clk); 
          ack <= 1; @(posedge clk); ack <= 0; //illegal spurious ack*/

        repeat(6) @(posedge clk);
        $finish();
    end

//------------------------------------------------------
//Assertions
//------------------------------------------------------
default clocking cb @(posedge clk); endclocking

 //1) req is a 1 cycle pulse
    property p_req_single_cycle;
        @(posedge clk) disable iff(!rst_n)
        $rose(req) |-> ##1 !req;
    endproperty

    assert property(p_req_single_cycle)
     else $error("REQ must be a 1 cycle pulse");

 //2) ack is a 1 cycle pulse
     property p_ack_single_cycle;
        @(posedge clk) disable iff(!rst_n)
        $rose(ack) |-> ##1 !ack;
     endproperty

     assert property (p_ack_single_cycle)
     else $error("ACK must be a 1 cycle pulse");

 //3) ACK must arrive 1..5 cycles after REQ
     property p_ack_latency_1_to_5_cycles;
        @(posedge clk) disable iff(!rst_n)
        $rose(req) |-> ##[1 : 5] $rose(ack);
     endproperty

     assert property (p_ack_latency_1_to_5_cycles)
     else $error("ACK must arrive 1 to 5 cycles after REQ");

 //4) No overlapping req before ACK
     //After req rises, req must remain 0 until ack rises
     property p_no_overlap_req_until_ack;
        @(posedge clk) disable iff(!rst_n)
        $rose(req) |-> (!req until $rose(ack));
     endproperty

     assert property (p_no_overlap_req_until_ack)
     else $error("No overlapping REQ before ACK");

 //5) No spurious ACK without a prior REQ in last 1..5 cycles
  // Strict form using $past of $rose(req).
     property p_no_spurious_ack;
        @(posedge clk) disable iff(!rst_n)
        $rose(ack) |-> 
            ($past($rose(req),1, 0)|| $past($rose(req),2, 0) || 
             $past($rose(req),3, 0)|| $past($rose(req),4, 0) || 
             $past($rose(req),5, 0));
     endproperty

     assert property (p_no_spurious_ack)
     else $error("No spurious ACK without a prior REQ in last 1..5 cycles");

    endmodule