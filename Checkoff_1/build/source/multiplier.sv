/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module multiplier #(
        parameter SIZE = 6'h20
    ) (
        input wire [31:0] a,
        input wire [31:0] b,
        output reg [31:0] mul
    );
    logic [4:0] R_5aa8917b_i;
    logic [5:0] RR_5aa8917b_i;
    logic [4:0] R_35b9e7f2_i;
    logic [4:0] RR_35b9e7f2_i;
    logic [31:0] R_04200462_j;
    logic [31:0] RR_04200462_j;
    logic [495:0] M_fa_a;
    logic [495:0] M_fa_b;
    logic [495:0] M_fa_cin;
    logic [495:0] M_fa_s;
    logic [495:0] M_fa_cout;
    
    genvar idx_0_172594993;
    
    generate
        for (idx_0_172594993 = 0; idx_0_172594993 < 496; idx_0_172594993 = idx_0_172594993 + 1) begin: forLoop_idx_0_172594993
            fa fa (
                .a(M_fa_a[idx_0_172594993]),
                .b(M_fa_b[idx_0_172594993]),
                .cin(M_fa_cin[idx_0_172594993]),
                .s(M_fa_s[idx_0_172594993]),
                .cout(M_fa_cout[idx_0_172594993])
            );
        end
    endgenerate
    
    
    logic [8:0] current_row_fa_index;
    logic [8:0] previous_row_fa_index;
    always @* begin
        mul[1'h0] = b[1'h0] & a[1'h0];
        for (RR_5aa8917b_i = 0; RR_5aa8917b_i < 5'h1f; RR_5aa8917b_i = RR_5aa8917b_i + 1) begin
      R_5aa8917b_i = (0) + RR_5aa8917b_i * (1);
            M_fa_a[R_5aa8917b_i] = a[R_5aa8917b_i] & b[1'h1];
            M_fa_b[R_5aa8917b_i] = a[R_5aa8917b_i + 1'h1] & b[1'h0];
            if (R_5aa8917b_i == 1'h0) begin
                M_fa_cin[R_5aa8917b_i] = 1'h0;
            end else begin
                M_fa_cin[R_5aa8917b_i] = M_fa_cout[R_5aa8917b_i - 1'h1];
            end
        end
        previous_row_fa_index = 1'h0;
        current_row_fa_index = 5'h1f;
        mul[1'h1] = M_fa_s[previous_row_fa_index];
        for (RR_35b9e7f2_i = 0; RR_35b9e7f2_i < 5'h1d; RR_35b9e7f2_i = RR_35b9e7f2_i + 1) begin
      R_35b9e7f2_i = (2'h2) + RR_35b9e7f2_i * (1);
            for (RR_04200462_j = 0; RR_04200462_j < 6'h20 - R_35b9e7f2_i; RR_04200462_j = RR_04200462_j + 1) begin
        R_04200462_j = (0) + RR_04200462_j * (1);
                M_fa_a[current_row_fa_index + R_04200462_j] = a[R_04200462_j] & b[R_35b9e7f2_i];
                M_fa_b[current_row_fa_index + R_04200462_j] = M_fa_s[previous_row_fa_index + 1'h1 + R_04200462_j];
                if (R_04200462_j == 1'h0) begin
                    M_fa_cin[current_row_fa_index + R_04200462_j] = 1'h0;
                end else begin
                    M_fa_cin[current_row_fa_index + R_04200462_j] = M_fa_cout[current_row_fa_index + R_04200462_j - 1'h1];
                end
            end
            previous_row_fa_index = current_row_fa_index;
            current_row_fa_index = current_row_fa_index + 6'h20 - R_35b9e7f2_i;
            mul[R_35b9e7f2_i] = M_fa_s[previous_row_fa_index];
        end
        M_fa_a[9'h1ef] = a[1'h0] & b[5'h1f];
        M_fa_b[9'h1ef] = M_fa_s[9'h1ee];
        M_fa_cin[9'h1ef] = 1'h0;
        mul[5'h1f] = M_fa_s[9'h1ef];
    end
    
    
endmodule