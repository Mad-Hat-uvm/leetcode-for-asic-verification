class segment_gen;
    rand int start[10];
    rand int finish[10];
    int sp, ep;

    function new(int s, int e);
        sp = s;
        ep = e;
    endfunction

    constraint c_range{
        foreach (start[i]) {
            start[i]  inside {[sp : ep - 1]};
            finish[i] inside {[sp+1 : ep]};
        }
    }

    //Ensure segments do not overlap
    constraint c_non_overlap {
        foreach (start[i]) {
            foreach (start[j]) {
                if(i != j){
                    (finish[i] < start[j]) || (finish[j] < start[i]);
                }
            }
        }
    }

    function void display();
        foreach (start[i])
         $display("Segment %0d: [%0d, %0d]", start[i], finish[i]);
    endfunction
endclass

//Testbench
module tb;
    initial begin
        segment_gen sg = new(10, 90);
        if(!sg.randomize()) begin
            $error("Randomization failed");
        end else begin
            $display("Generated non-overlapping segments:");
            sg.display();
        end

    end
endmodule
