/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module boolean #(
        parameter SIZE = 6'h20
    ) (
        input wire [(SIZE)-1:0] a,
        input wire [(SIZE)-1:0] b,
        input wire [5:0] alufn_signal,
        output reg [(SIZE)-1:0] bool
    );
    logic [31:0] M_mux_4_32_s0;
    logic [31:0] M_mux_4_32_s1;
    logic [31:0][3:0] M_mux_4_32_in;
    logic [31:0] M_mux_4_32_out;
    
    genvar idx_0_324401185;
    
    generate
        for (idx_0_324401185 = 0; idx_0_324401185 < 32; idx_0_324401185 = idx_0_324401185 + 1) begin: forLoop_idx_0_324401185
            mux_4 mux_4_32 (
                .s0(M_mux_4_32_s0[idx_0_324401185]),
                .s1(M_mux_4_32_s1[idx_0_324401185]),
                .in(M_mux_4_32_in[idx_0_324401185]),
                .out(M_mux_4_32_out[idx_0_324401185])
            );
        end
    endgenerate
    
    
    always @* begin
        bool = 1'h0;
        M_mux_4_32_in = {6'h20{{alufn_signal[2'h3:1'h0]}}};
        M_mux_4_32_s1 = b;
        M_mux_4_32_s0 = a;
        bool = M_mux_4_32_out;
    end
    
    
endmodule