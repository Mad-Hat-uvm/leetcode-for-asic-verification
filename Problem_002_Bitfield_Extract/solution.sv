module bitfield_extract;

    //32 bit register value (example)
    int unsigned reg_value = 32'hA2FF0B3C;

    //Extract fields
    int unsigned opcode, address, data_len, flags;

    initial begin
        //Extract fields using bitwise operations
        opcode    = (reg_value >> 28) & 32'hF;    //bits [31:28]
        address   = (reg_value >> 16) & 32'hFFF;  //bits [27:16]
        data_len  = (reg_value >> 8)  & 32'hFF;   //bits [15:8]
        flags     = reg_value & 32'hFF;           //bits [7:0]

        //Display results
        $display("Decode Fields:");
        $display(" opcode     = 0x0%h", opcode);
        $display(" address    = 0x0%h", address);
        $display(" data_len   = 0x0%h", data_len);
        $display(" flags      = 0x0%h", flags);
    end
    
endmodule