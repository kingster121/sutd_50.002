/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module bin_to_dec #(
        parameter DIGITS = 3'h4,
        parameter LEADING_ZEROS = 1'h0
    ) (
        input wire [($clog2((64'(4'ha) ** (DIGITS))))-1:0] value,
        output reg [(DIGITS)-1:0][3:0] digits
    );
    logic [31:0] R_4b669764_j;
    logic [31:0] RR_4b669764_j;
    logic [3:0] R_5cfe6518_i;
    logic [3:0] RR_5cfe6518_i;
    logic [($bits(value))-1:0] L_1507f8b9_remainder;
    logic L_1507f8b9_blank;
    logic [($bits(value))-1:0] L_3f984bf4_scale;
    logic [($bits(value))-1:0] L_29ebda1c_sub_value;
    always @* begin
        digits = {DIGITS{{{4'hb}}}};
        L_1507f8b9_remainder = value;
        L_1507f8b9_blank = !LEADING_ZEROS;
        if (value < (64'(4'ha) ** (DIGITS))) begin
            for (RR_4b669764_j = 0; RR_4b669764_j < DIGITS; RR_4b669764_j = RR_4b669764_j + 1) begin
        R_4b669764_j = (DIGITS - 1'h1) + RR_4b669764_j * (-2'sh1);
                L_3f984bf4_scale = (64'(4'ha) ** (R_4b669764_j));
                if (L_1507f8b9_remainder < L_3f984bf4_scale) begin
                    if (R_4b669764_j != 1'h0 && L_1507f8b9_blank) begin
                        digits[R_4b669764_j] = 4'ha;
                    end else begin
                        digits[R_4b669764_j] = 1'h0;
                    end
                end else begin
                    L_1507f8b9_blank = 1'h0;
                    L_29ebda1c_sub_value = 1'h0;
                    for (RR_5cfe6518_i = 0; RR_5cfe6518_i < 4'h9; RR_5cfe6518_i = RR_5cfe6518_i + 1) begin
            R_5cfe6518_i = (4'h9) + RR_5cfe6518_i * (-2'sh1);
                        if (L_1507f8b9_remainder < (R_5cfe6518_i + 1'h1) * L_3f984bf4_scale) begin
                            digits[R_4b669764_j] = R_5cfe6518_i;
                            L_29ebda1c_sub_value = R_5cfe6518_i * L_3f984bf4_scale;
                        end
                    end
                    L_1507f8b9_remainder = L_1507f8b9_remainder - L_29ebda1c_sub_value;
                end
            end
        end
    end
    
    
endmodule