/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module fa (
        input wire a,
        input wire b,
        input wire cin,
        output reg s,
        output reg cout
    );
    always @* begin
        s = 1'h0;
        cout = 1'h0;
        if (a ^ b ^ cin) begin
            s = 1'h1;
        end
        if ((a & b) | (a & cin) | (b & cin)) begin
            cout = 1'h1;
        end
    end
    
    
endmodule