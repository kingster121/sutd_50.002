/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module game_cu (
        input wire clk,
        input wire rst,
        input wire slow_clk,
        input wire [31:0] regfile_rd2,
        input wire p0b0,
        input wire p0b1,
        input wire p1b0,
        input wire p1b1,
        input wire p0wall,
        input wire p1wall,
        output reg [5:0] alufn,
        output reg [2:0] asel,
        output reg [2:0] bsel,
        output reg [1:0] alu_out_sel,
        output reg [3:0] regfile_wa,
        output reg [3:0] regfile_ra1,
        output reg [3:0] regfile_ra2,
        output reg regfile_we
    );
    localparam E_GameStates_IDLE = 5'h0;
    localparam E_GameStates_P0B0_UPDATE_MOTOR = 5'h1;
    localparam E_GameStates_P0B1_UPDATE_MOTOR = 5'h2;
    localparam E_GameStates_P1B0_UPDATE_MOTOR = 5'h3;
    localparam E_GameStates_P1B1_UPDATE_MOTOR = 5'h4;
    localparam E_GameStates_INCREASE_MOTOR_SPEED = 5'h5;
    localparam E_GameStates_P0_INCREASE_SCORE = 5'h6;
    localparam E_GameStates_P0_CHECK_SCORE = 5'h7;
    localparam E_GameStates_P0_WALL_BRANCH = 5'h8;
    localparam E_GameStates_P0_WIN = 5'h9;
    localparam E_GameStates_P0_HAVENT_WIN = 5'ha;
    localparam E_GameStates_P1_INCREASE_SCORE = 5'hb;
    localparam E_GameStates_P1_CHECK_SCORE = 5'hc;
    localparam E_GameStates_P1_WALL_BRANCH = 5'hd;
    localparam E_GameStates_P1_WIN = 5'he;
    localparam E_GameStates_P1_HAVENT_WIN = 5'hf;
    localparam E_GameStates_GAMEOVER = 5'h10;
    localparam E_GameStates_START = 5'h11;
    localparam E_GameStates_RESET_COUNTER = 5'h12;
    localparam E_GameStates_SET_MAX_COUNTER = 5'h13;
    localparam E_GameStates_INCREASE_COUNTER = 5'h14;
    localparam E_GameStates_WAIT_FOR_EDGE_LOW = 5'h15;
    localparam E_GameStates_CHECK_COUNTER = 5'h16;
    localparam E_GameStates_BRANCH_COUNTER = 5'h17;
    localparam E_GameStates_SET_CORRECT_BUTTON = 5'h18;
    localparam E_GameStates_BRANCH_CORRECT_BUTTON = 5'h19;
    localparam E_GameStates_SET_0_CORRECT_BUTTON = 5'h1a;
    localparam E_GameStates_SET_1_CORRECT_BUTTON = 5'h1b;
    logic [4:0] D_game_fsm_d, D_game_fsm_q = 5'h0;
    always @* begin
        D_game_fsm_d = D_game_fsm_q;
        
        alufn = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        alu_out_sel = 1'h0;
        regfile_we = 1'h0;
        regfile_wa = 1'h0;
        regfile_ra1 = 1'h0;
        regfile_ra2 = 1'h0;
        if (rst) begin
            D_game_fsm_d = 5'h0;
        end else begin
            
            case (D_game_fsm_q)
                5'h0: begin
                    alufn = 1'h0;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h0;
                    regfile_wa = 1'h0;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    if (p0b0) begin
                        D_game_fsm_d = 5'h11;
                    end
                    if (p0b1) begin
                        D_game_fsm_d = 5'h2;
                    end
                    if (p1b0) begin
                        D_game_fsm_d = 5'h3;
                    end
                    if (p1b1) begin
                        D_game_fsm_d = 5'h4;
                    end
                    if (p0wall) begin
                        D_game_fsm_d = 5'h6;
                    end
                    if (p1wall) begin
                        D_game_fsm_d = 5'hb;
                    end
                end
                5'h1: begin
                    alufn = 6'h38;
                    asel = 3'h4;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 1'h1;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 3'h5;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h5;
                end
                5'h2: begin
                    alufn = 6'h38;
                    asel = 2'h3;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 1'h1;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 3'h5;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h5;
                end
                5'h3: begin
                    alufn = 6'h39;
                    asel = 2'h2;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 1'h1;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 3'h5;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h5;
                end
                5'h4: begin
                    alufn = 6'h39;
                    asel = 1'h1;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 1'h1;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 3'h5;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h5;
                end
                5'h5: begin
                    alufn = 6'h0;
                    asel = 1'h1;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 2'h2;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 2'h2;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h0;
                end
                5'h11: begin
                    alufn = 6'h0;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h0;
                    regfile_wa = 1'h0;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h12;
                end
                5'h12: begin
                    alufn = 6'h1b;
                    asel = 1'h0;
                    bsel = 3'h4;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h6;
                    regfile_ra1 = 3'h6;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h13;
                end
                5'h13: begin
                    alufn = 6'h3a;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h7;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 2'h2;
                    D_game_fsm_d = 5'h14;
                end
                5'h14: begin
                    alufn = 6'h0;
                    asel = 1'h1;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h6;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 3'h6;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h15;
                end
                5'h15: begin
                    if (~slow_clk) begin
                        D_game_fsm_d = 5'h16;
                    end else begin
                        D_game_fsm_d = 5'h15;
                    end
                end
                5'h16: begin
                    alufn = 6'h35;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 4'h8;
                    regfile_ra1 = 3'h6;
                    regfile_ra2 = 3'h7;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h17;
                end
                5'h17: begin
                    alufn = 6'h0;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h0;
                    regfile_wa = 1'h0;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 4'h8;
                    alu_out_sel = 1'h0;
                    if (~regfile_rd2[1'h0]) begin
                        D_game_fsm_d = 5'h18;
                    end else begin
                        if (slow_clk) begin
                            D_game_fsm_d = 5'h14;
                        end else begin
                            D_game_fsm_d = 5'h17;
                        end
                    end
                end
                5'h18: begin
                    alufn = 6'h0;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 1'h0;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h1;
                    D_game_fsm_d = 5'h19;
                end
                5'h19: begin
                    alufn = 6'h0;
                    asel = 1'h0;
                    bsel = 1'h0;
                    regfile_we = 1'h0;
                    regfile_wa = 1'h0;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    if (~regfile_rd2[1'h0]) begin
                        D_game_fsm_d = 5'h1a;
                    end else begin
                        D_game_fsm_d = 5'h1b;
                    end
                end
                5'h1a: begin
                    alufn = 6'h1b;
                    asel = 1'h0;
                    bsel = 1'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h5;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h0;
                end
                5'h1b: begin
                    alufn = 6'h1b;
                    asel = 1'h0;
                    bsel = 2'h2;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h5;
                    regfile_ra1 = 1'h0;
                    regfile_ra2 = 1'h0;
                    alu_out_sel = 1'h0;
                    D_game_fsm_d = 5'h0;
                end
            endcase
        end
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_game_fsm_q <= 5'h0;
        end else begin
            D_game_fsm_q <= D_game_fsm_d;
        end
    end
endmodule