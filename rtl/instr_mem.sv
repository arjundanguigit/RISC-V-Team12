module instr_mem #(
    parameter ADDRESS_WIDTH = 9
) (
    input  logic [31:0] a,  // Same width as PC
    output logic [31:0] rd
);

    logic [7:0] instr_array[2**ADDRESS_WIDTH-1 : 0];


    initial begin
        $readmemh("../rtl/program.hex", instr_array);
    end

    always_comb begin
        // 4 bytes for one word (32 bits) since hex file is separated at each byte
        rd = {
            {instr_array[a[ADDRESS_WIDTH-1:0]+3]},
            {instr_array[a[ADDRESS_WIDTH-1:0]+2]},
            {instr_array[a[ADDRESS_WIDTH-1:0]+1]},
            {instr_array[a[ADDRESS_WIDTH-1:0]]}
        };
    end

endmodule
