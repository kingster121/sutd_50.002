/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alu_manual_tester (
        input wire clk,
        input wire rst,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select
    );
    logic [31:0] M_alu_a;
    logic [31:0] M_alu_b;
    logic [5:0] M_alu_alufn_signal;
    logic [31:0] M_alu_alu_out;
    logic M_alu_z;
    logic M_alu_v;
    logic M_alu_n;
    
    alu alu (
        .a(M_alu_a),
        .b(M_alu_b),
        .alufn_signal(M_alu_alufn_signal),
        .alu_out(M_alu_alu_out),
        .z(M_alu_z),
        .v(M_alu_v),
        .n(M_alu_n)
    );
    
    
    localparam E_States_IDLE = 2'h0;
    localparam E_States_O1 = 2'h1;
    localparam E_States_O2 = 2'h2;
    localparam CLK_FREQ = 10'h3e8;
    localparam logic [4:0][0:0] _MP_RISE_1025356878 = {{1'h1, 1'h1, 1'h1, 1'h1, 1'h1}};
    localparam logic [4:0][0:0] _MP_FALL_1025356878 = {{1'h0, 1'h0, 1'h0, 1'h0, 1'h0}};
    logic [4:0] M_io_button_edge_in;
    logic [4:0] M_io_button_edge_out;
    
    genvar idx_0_1025356878;
    
    generate
        for (idx_0_1025356878 = 0; idx_0_1025356878 < 5; idx_0_1025356878 = idx_0_1025356878 + 1) begin: forLoop_idx_0_1025356878
            edge_detector #(
                .RISE(_MP_RISE_1025356878[idx_0_1025356878]),
                .FALL(_MP_FALL_1025356878[idx_0_1025356878])
            ) io_button_edge (
                .clk(clk),
                .in(M_io_button_edge_in[idx_0_1025356878]),
                .out(M_io_button_edge_out[idx_0_1025356878])
            );
        end
    endgenerate
    
    
    localparam logic [4:0][9:0] _MP_CLK_FREQ_755531683 = {{10'h3e8, 10'h3e8, 10'h3e8, 10'h3e8, 10'h3e8}};
    localparam _MP_MIN_DELAY_755531683 = 5'h14;
    localparam _MP_NUM_SYNC_755531683 = 2'h2;
    logic [4:0] M_io_button_cond_in;
    logic [4:0] M_io_button_cond_out;
    
    genvar idx_0_755531683;
    
    generate
        for (idx_0_755531683 = 0; idx_0_755531683 < 5; idx_0_755531683 = idx_0_755531683 + 1) begin: forLoop_idx_0_755531683
            button_conditioner #(
                .CLK_FREQ(_MP_CLK_FREQ_755531683[idx_0_755531683]),
                .MIN_DELAY(_MP_MIN_DELAY_755531683),
                .NUM_SYNC(_MP_NUM_SYNC_755531683)
            ) io_button_cond (
                .clk(clk),
                .in(M_io_button_cond_in[idx_0_755531683]),
                .out(M_io_button_cond_out[idx_0_755531683])
            );
        end
    endgenerate
    
    
    logic [1:0] D_states_d, D_states_q = 2'h0;
    logic [31:0] D_a_d, D_a_q = 1'h0;
    logic [31:0] D_b_d, D_b_q = 1'h0;
    always @* begin
        D_states_d = D_states_q;
        D_a_d = D_a_q;
        D_b_d = D_b_q;
        
        io_segment = 1'h0;
        io_select = 4'hf;
        io_led[2'h2] = 1'h0;
        io_led[1'h1] = 1'h0;
        io_led[1'h0] = 1'h0;
        M_io_button_cond_in = io_button;
        M_io_button_edge_in = M_io_button_cond_out;
        D_states_d = D_states_q;
        D_a_d = D_a_q;
        D_b_d = D_b_q;
        M_alu_a = D_a_q;
        M_alu_b = D_b_q;
        M_alu_alufn_signal = io_dip[2'h2][3'h5:1'h0];
        
        case ({io_dip[2'h2][3'h7], io_dip[2'h2][3'h6]})
            2'h0: begin
                D_a_d[5'h1f:5'h18] = io_dip[1'h1];
                D_a_d[5'h17:5'h10] = io_dip[1'h0];
            end
            2'h1: begin
                D_a_d[4'hf:4'h8] = io_dip[1'h1];
                D_a_d[3'h7:1'h0] = io_dip[1'h0];
            end
            2'h3: begin
                D_b_d[5'h1f:5'h18] = io_dip[1'h1];
                D_b_d[5'h17:5'h10] = io_dip[1'h0];
            end
            2'h2: begin
                D_b_d[4'hf:4'h8] = io_dip[1'h1];
                D_b_d[3'h7:1'h0] = io_dip[1'h0];
            end
        endcase
        io_led[2'h2][3'h7:3'h5] = {M_alu_z, M_alu_v, M_alu_n};
        
        case (D_states_q)
            2'h0: begin
                io_led[1'h1] = 8'h0;
                io_led[1'h0] = 8'h0;
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 2'h1;
                end
            end
            2'h1: begin
                io_led[1'h1] = M_alu_alu_out[5'h1f:5'h18];
                io_led[1'h0] = M_alu_alu_out[5'h17:5'h10];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 2'h2;
                end
            end
            2'h2: begin
                io_led[1'h1] = M_alu_alu_out[4'hf:4'h8];
                io_led[1'h0] = M_alu_alu_out[3'h7:1'h0];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 2'h0;
                end
            end
            default: begin
                D_states_d = 2'h0;
            end
        endcase
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_states_q <= 2'h0;
            D_a_q <= 1'h0;
            D_b_q <= 1'h0;
        end else begin
            D_states_q <= D_states_d;
            D_a_q <= D_a_d;
            D_b_q <= D_b_d;
        end
    end
endmodule