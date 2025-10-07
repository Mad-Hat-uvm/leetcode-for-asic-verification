module tb_gray_to_binary;

    //Function to convert Gray to Binary
    function automatic logic [31:0] gray_to_bin(input logic [31:0] gray, input int n);
        logic [31:0] bin;
        bin[n-1] = gray[n-1]; //MSB is same
        for(int i = n - 2; i >= 0; i--) begin
            bin[i] = bin[i+1] ^ gray[i]; //XOR with previous binary bit
        end
        return bin;
    endfunction

    initial begin
        logic [3:0] gray, bin;

        gray = 4'b1011;
        bin = gray_to_bin(gray, 4);
        $display("Gray: %b, Binary: %b", gray, bin); //Expected Binary: 1101

        gray = 4'b0110;
        bin = gray_to_bin(gray, 4);
        $display("Gray: %b, Binary: %b", gray, bin); //Expected Binary: 1101
    end
    
endmodule