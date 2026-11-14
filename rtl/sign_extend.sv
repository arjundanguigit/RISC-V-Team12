module sign_extend (
    input logic [31:7] imm,
    input logic        imm_src,

    output logic [31:0] imm_op
);

    always_comb begin
        if (imm_src == 1'b0) begin
            imm_op = {{20{imm[31]}}, imm[31:20]};
        end else if (imm_src == 1'b1) begin
            imm_op = {{19{imm[31]}}, imm[31], imm[7], imm[30:25], imm[11:8], 1'b0};
        end
    end

endmodule
