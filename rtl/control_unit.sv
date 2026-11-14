module control_unit (
    input logic       eq,
    input logic [6:0] opcode,

    output logic reg_write,  // 1 bit cause you either write or dont for we3
    output logic alu_ctrl,   // 1 bit cause you only have 2 instructions
    output logic alu_src,    // 1 bit cause 2 input mux
    output logic imm_src,    // 1 bit cause you only have I-type and B-type instructions
    output logic pc_src      // 1 bit cause 2 input mux
);

    always_comb begin
        if (opcode == 7'b0010011) begin
            // addi 
            reg_write = 1'b1;
            alu_ctrl  = 1'b0;
            alu_src   = 1'b1;
            imm_src   = 1'b0;
            pc_src    = 1'b0;
        end else if (opcode == 7'b1100011) begin
            // bne
            reg_write = 1'b0;
            alu_ctrl  = 1'b1;
            alu_src   = 1'b0;
            imm_src   = 1'b1;
            if (eq == 0) begin
                pc_src = 1'b1;
            end else if (eq == 1'b1) begin
                pc_src = 1'b0;
            end
        end else begin
            reg_write = 1'b0;
            pc_src    = 1'b0;
        end
    end

endmodule
