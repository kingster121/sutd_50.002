/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module compare #(
        parameter SIZE = 6'h20
    ) (
        input wire z,
        input wire v,
        input wire n,
        input wire [5:0] alufn_signal,
        output reg cmp
    );
    logic M_mux_4_s0;
    logic M_mux_4_s1;
    logic [3:0] M_mux_4_in;
    logic M_mux_4_out;
    
    mux_4 mux_4 (
        .s0(M_mux_4_s0),
        .s1(M_mux_4_s1),
        .in(M_mux_4_in),
        .out(M_mux_4_out)
    );
    
    
    logic a;
    always @* begin
        M_mux_4_s0 = alufn_signal[1'h1];
        M_mux_4_s1 = alufn_signal[2'h2];
        M_mux_4_in[1'h0] = 1'h0;
        M_mux_4_in[1'h1] = z;
        a = n ^ v;
        M_mux_4_in[2'h2] = a;
        M_mux_4_in[2'h3] = a | z;
        cmp = M_mux_4_out;
    end
    
    
endmodule