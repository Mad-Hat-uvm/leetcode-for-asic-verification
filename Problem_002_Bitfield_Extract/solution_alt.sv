module bitfield_extract;

   
    typedef struct packed {
      logic [3:0]  opcode;   // bits [31:28]
      logic [11:0] address;  // bits [27:16]
      logic [7:0]  data_len; // bits [15:8]
      logic [7:0]  flags;    // bits [7:0]
    }reg_fields_t;
    

    //32 bit register value (example)
    logic [31:0] reg_value = 32'hA2FF0B3C;

    //Struct instance to hold the extracted fields
     reg_fields_t decoded;

    //Task to decode the register using bitwise operation
    task decode_reg (input logic [31:0] val, output reg_fields_t result);
        //Extract fields using bitwise operations
        opcode    = (val >> 28) & 4'hF;    //bits [31:28]
        address   = (val >> 16) & 12'hFFF;  //bits [27:16]
        data_len  = (val >> 8)  & 8'hFF;   //bits [15:8]
        flags     =  val        & 8'hFF;   //bits [7:0]
    endtask

        //Display results
        $display("Decode Fields:");
        $display(" opcode     = 0x0%h", result.opcode);
        $display(" address    = 0x0%h", result.address);
        $display(" data_len   = 0x0%h", result.data_len);
        $display(" flags      = 0x0%h", result.flags);
   
    
endmodule