/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module decoder #(
        parameter WIDTH = 4'h8
    ) (
        input wire [(WIDTH)-1:0] in,
        output reg [({1'h1, {WIDTH{1'h0}}})-1:0] out
    );
    always @* begin
        out = 1'h0;
        out[in] = 1'h1;
    end
    
    
endmodule