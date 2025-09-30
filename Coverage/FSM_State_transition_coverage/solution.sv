module tb_fsm_cov;

    //Clock
    logic clk = 0;
    always #5 clk = ~clk; //100 Mhz

    //FSM
    typedef enum logic [1:0] {IDLE, BUSY, DONE} state_e;
    state_e state, next;

    //Covergroup sampling on posedge clk
    covergroup cg_state @(posedge clk);
        //State hits
        cp_state: coverpoint state {
            bins idle = {IDLE};
            bins busy = {BUSY};
            bins done = {DONE};
        }

        //Transition coverage(use consecutive sample values)
        cp_trans: coverpoint state {
            bins idle_to_busy = (IDLE => BUSY);
            bins busy_to_done = (BUSY => DONE);
            bins done_to_idle = (DONE => IDLE);
            
            //This bin must never occur in legal operation
            illegal_bins skip_busy = (IDLE => DONE);
        }

    endgroup

    cg_state cg = new();

    //Simple legal stimulus: IDLE -> BUSY -> DONE -> IDLE (repeat)
    initial begin
        state = IDLE;
        next  = IDLE;

        //Run a few legal cycles to hit all legal transition bins
        repeat (3) begin
            @(posedge clk); next = BUSY;  //IDLE -> BUSY
            @(posedge clk); next = DONE ; //BUSY -> DONE
            @(posedge clk); next = IDLE;  //DONE -> IDLE
        end

        //Wait for a few cycles for sampling to settle
        repeat(2) @(posedge clk);

        $display("Coverage: %0.2f%%", cg.get_inst_coverage());
        $finish();
    end

    //State register
    always_ff@(posedge clk) begin
        state <= next;
    end

endmodule