def decode_register(reg_value):
    result = {}

    result['opcode']    = (reg_value >> 28) & 0xF
    result['address']   = (reg_value >> 16) & 0xFFF
    result['data_len']  = (reg_value >> 8) & 0xFF
    result['flags']     = reg_value & 0xFF

    return result

# ==================================
# Test Case
# ==================================
if __name__ == "__main__":
    reg_value = 0xA2FF0B3C
    decoded = decode_register(reg_value)
    print("Decoded Fields:")
    for k, v in decoded.items():
        print(f"  {k:9s}: 0x{v:02X}")
