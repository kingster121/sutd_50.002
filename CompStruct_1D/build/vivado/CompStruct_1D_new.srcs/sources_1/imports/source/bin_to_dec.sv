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
    logic [31:0] R_62739d61_j;
    logic [31:0] RR_62739d61_j;
    logic [3:0] R_155103af_i;
    logic [3:0] RR_155103af_i;
    logic [($bits(value))-1:0] L_750f2c4d_remainder;
    logic L_750f2c4d_blank;
    logic [($bits(value))-1:0] L_68f8274c_scale;
    logic [($bits(value))-1:0] L_5a131423_sub_value;
    always @* begin
        digits = {DIGITS{{{4'hb}}}};
        L_750f2c4d_remainder = value;
        L_750f2c4d_blank = !LEADING_ZEROS;
        if (value < (64'(4'ha) ** (DIGITS))) begin
            for (RR_62739d61_j = 0; RR_62739d61_j < DIGITS; RR_62739d61_j = RR_62739d61_j + 1) begin
        R_62739d61_j = (DIGITS - 1'h1) + RR_62739d61_j * (-2'sh1);
                L_68f8274c_scale = (64'(4'ha) ** (R_62739d61_j));
                if (L_750f2c4d_remainder < L_68f8274c_scale) begin
                    if (R_62739d61_j != 1'h0 && L_750f2c4d_blank) begin
                        digits[R_62739d61_j] = 4'ha;
                    end else begin
                        digits[R_62739d61_j] = 1'h0;
                    end
                end else begin
                    L_750f2c4d_blank = 1'h0;
                    L_5a131423_sub_value = 1'h0;
                    for (RR_155103af_i = 0; RR_155103af_i < 4'h9; RR_155103af_i = RR_155103af_i + 1) begin
            R_155103af_i = (4'h9) + RR_155103af_i * (-2'sh1);
                        if (L_750f2c4d_remainder < (R_155103af_i + 1'h1) * L_68f8274c_scale) begin
                            digits[R_62739d61_j] = R_155103af_i;
                            L_5a131423_sub_value = R_155103af_i * L_68f8274c_scale;
                        end
                    end
                    L_750f2c4d_remainder = L_750f2c4d_remainder - L_5a131423_sub_value;
                end
            end
        end
    end
    
    
endmodule