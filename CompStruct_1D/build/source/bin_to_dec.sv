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
    logic [31:0] R_6c959212_j;
    logic [31:0] RR_6c959212_j;
    logic [3:0] R_33b98138_i;
    logic [3:0] RR_33b98138_i;
    logic [($bits(value))-1:0] L_58a6f3dd_remainder;
    logic L_58a6f3dd_blank;
    logic [($bits(value))-1:0] L_371667c1_scale;
    logic [($bits(value))-1:0] L_1a6b6895_sub_value;
    always @* begin
        digits = {DIGITS{{{4'hb}}}};
        L_58a6f3dd_remainder = value;
        L_58a6f3dd_blank = !LEADING_ZEROS;
        if (value < (64'(4'ha) ** (DIGITS))) begin
            for (RR_6c959212_j = 0; RR_6c959212_j < DIGITS; RR_6c959212_j = RR_6c959212_j + 1) begin
        R_6c959212_j = (DIGITS - 1'h1) + RR_6c959212_j * (-2'sh1);
                L_371667c1_scale = (64'(4'ha) ** (R_6c959212_j));
                if (L_58a6f3dd_remainder < L_371667c1_scale) begin
                    if (R_6c959212_j != 1'h0 && L_58a6f3dd_blank) begin
                        digits[R_6c959212_j] = 4'ha;
                    end else begin
                        digits[R_6c959212_j] = 1'h0;
                    end
                end else begin
                    L_58a6f3dd_blank = 1'h0;
                    L_1a6b6895_sub_value = 1'h0;
                    for (RR_33b98138_i = 0; RR_33b98138_i < 4'h9; RR_33b98138_i = RR_33b98138_i + 1) begin
            R_33b98138_i = (4'h9) + RR_33b98138_i * (-2'sh1);
                        if (L_58a6f3dd_remainder < (R_33b98138_i + 1'h1) * L_371667c1_scale) begin
                            digits[R_6c959212_j] = R_33b98138_i;
                            L_1a6b6895_sub_value = R_33b98138_i * L_371667c1_scale;
                        end
                    end
                    L_58a6f3dd_remainder = L_58a6f3dd_remainder - L_1a6b6895_sub_value;
                end
            end
        end
    end
    
    
endmodule