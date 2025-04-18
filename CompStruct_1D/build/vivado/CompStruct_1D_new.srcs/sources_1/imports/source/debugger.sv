/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module debugger (
        input wire clk,
        input wire rst,
        input wire new_rx,
        input wire [7:0] rx_data,
        output reg new_tx,
        output reg [7:0] tx_data,
        input wire tx_busy,
        input wire [31:0] correct_button,
        input wire [31:0] motor_direction,
        input wire [31:0] motor_speed,
        input wire [31:0] p0_score,
        input wire [31:0] p1_score,
        input wire [31:0] correct_button_compare,
        input wire [31:0] counter,
        input wire [31:0] temp,
        input wire [31:0] temp1,
        input wire [31:0] flag_0,
        input wire [3:0] wa,
        input wire we,
        input wire [31:0] data,
        input wire [31:0] a,
        input wire [31:0] b,
        input wire [5:0] alufn
    );
    localparam E_States_IDLE = 6'h0;
    localparam E_States_LOAD_DFF = 6'h1;
    localparam E_States_SEND_CORRECT_BUTTON_PREFIX = 6'h2;
    localparam E_States_SEND_CORRECT_BUTTON = 6'h3;
    localparam E_States_SEND_MOTOR_DIRECTION_PREFIX = 6'h4;
    localparam E_States_SEND_MOTOR_DIRECTION = 6'h5;
    localparam E_States_SEND_MOTOR_SPEED_PREFIX = 6'h6;
    localparam E_States_SEND_MOTOR_SPEED = 6'h7;
    localparam E_States_SEND_P0_SCORE_PREFIX = 6'h8;
    localparam E_States_SEND_P0_SCORE = 6'h9;
    localparam E_States_SEND_P1_SCORE_PREFIX = 6'ha;
    localparam E_States_SEND_P1_SCORE = 6'hb;
    localparam E_States_SEND_CORRECT_BUTTON_COMPARE_PREFIX = 6'hc;
    localparam E_States_SEND_CORRECT_BUTTON_COMPARE = 6'hd;
    localparam E_States_SEND_COUNTER_PREFIX = 6'he;
    localparam E_States_SEND_COUNTER = 6'hf;
    localparam E_States_SEND_TEMP_PREFIX = 6'h10;
    localparam E_States_SEND_TEMP = 6'h11;
    localparam E_States_SEND_TEMP1_PREFIX = 6'h12;
    localparam E_States_SEND_TEMP1 = 6'h13;
    localparam E_States_SEND_FLAG_0_PREFIX = 6'h14;
    localparam E_States_SEND_FLAG_0 = 6'h15;
    localparam E_States_SEND_WA_PREFIX = 6'h16;
    localparam E_States_SEND_WA = 6'h17;
    localparam E_States_SEND_WE_PREFIX = 6'h18;
    localparam E_States_SEND_WE = 6'h19;
    localparam E_States_SEND_DATA_PREFIX = 6'h1a;
    localparam E_States_SEND_DATA = 6'h1b;
    localparam E_States_SEND_A_PREFIX = 6'h1c;
    localparam E_States_SEND_A = 6'h1d;
    localparam E_States_SEND_B_PREFIX = 6'h1e;
    localparam E_States_SEND_B = 6'h1f;
    localparam E_States_SEND_ALUFN_PREFIX = 6'h20;
    localparam E_States_SEND_ALUFN = 6'h21;
    localparam logic [29:0][7:0] TEXT_CORRECT_BUTTON = {{8'h20, 8'h3a, 8'h6e, 8'h6f, 8'h74, 8'h74, 8'h75, 8'h42, 8'h20, 8'h74, 8'h63, 8'h65, 8'h72, 8'h72, 8'h6f, 8'h43, 8'ha, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'h3d, 8'ha, 8'ha}};
    localparam logic [17:0][7:0] TEXT_MOTOR_DIRECTION = {{8'h20, 8'h3a, 8'h6e, 8'h6f, 8'h69, 8'h74, 8'h63, 8'h65, 8'h72, 8'h69, 8'h44, 8'h20, 8'h72, 8'h6f, 8'h74, 8'h6f, 8'h4d, 8'ha}};
    localparam logic [13:0][7:0] TEXT_MOTOR_SPEED = {{8'h20, 8'h3a, 8'h64, 8'h65, 8'h65, 8'h70, 8'h53, 8'h20, 8'h72, 8'h6f, 8'h74, 8'h6f, 8'h4d, 8'ha}};
    localparam logic [15:0][7:0] TEXT_P0_SCORE = {{8'h20, 8'h3a, 8'h65, 8'h72, 8'h6f, 8'h63, 8'h53, 8'h20, 8'h30, 8'h72, 8'h65, 8'h79, 8'h61, 8'h6c, 8'h50, 8'ha}};
    localparam logic [15:0][7:0] TEXT_P1_SCORE = {{8'h20, 8'h3a, 8'h65, 8'h72, 8'h6f, 8'h63, 8'h53, 8'h20, 8'h31, 8'h72, 8'h65, 8'h79, 8'h61, 8'h6c, 8'h50, 8'ha}};
    localparam logic [24:0][7:0] TEXT_CORRECT_BUTTON_COMPARE = {{8'h20, 8'h3a, 8'h65, 8'h72, 8'h61, 8'h70, 8'h6d, 8'h6f, 8'h43, 8'h20, 8'h6e, 8'h6f, 8'h74, 8'h74, 8'h75, 8'h42, 8'h20, 8'h74, 8'h63, 8'h65, 8'h72, 8'h72, 8'h6f, 8'h43, 8'ha}};
    localparam logic [9:0][7:0] TEXT_COUNTER = {{8'h20, 8'h3a, 8'h72, 8'h65, 8'h74, 8'h6e, 8'h75, 8'h6f, 8'h43, 8'ha}};
    localparam logic [6:0][7:0] TEXT_TEMP = {{8'h20, 8'h3a, 8'h70, 8'h6d, 8'h65, 8'h54, 8'ha}};
    localparam logic [7:0][7:0] TEXT_TEMP1 = {{8'h20, 8'h3a, 8'h31, 8'h70, 8'h6d, 8'h65, 8'h54, 8'ha}};
    localparam logic [8:0][7:0] TEXT_FLAG_0 = {{8'h20, 8'h3a, 8'h30, 8'h20, 8'h67, 8'h61, 8'h6c, 8'h46, 8'ha}};
    localparam logic [5:0][7:0] TEXT_WA = {{8'h20, 8'h3a, 8'h41, 8'h57, 8'ha, 8'ha}};
    localparam logic [4:0][7:0] TEXT_WE = {{8'h20, 8'h3a, 8'h45, 8'h57, 8'ha}};
    localparam logic [6:0][7:0] TEXT_DATA = {{8'h20, 8'h3a, 8'h61, 8'h74, 8'h61, 8'h44, 8'ha}};
    localparam logic [3:0][7:0] TEXT_A = {{8'h20, 8'h3a, 8'h41, 8'ha}};
    localparam logic [3:0][7:0] TEXT_B = {{8'h20, 8'h3a, 8'h42, 8'ha}};
    localparam logic [7:0][7:0] TEXT_ALUFN = {{8'h20, 8'h3a, 8'h6e, 8'h66, 8'h75, 8'h6c, 8'h41, 8'ha}};
    localparam BIT_0 = 8'h30;
    localparam BIT_1 = 8'h31;
    logic [5:0] D_state_d, D_state_q = 6'h0;
    logic [5:0] D_bit_32_count_d, D_bit_32_count_q = 1'h0;
    logic [1:0] D_bit_4_count_d, D_bit_4_count_q = 1'h0;
    logic [2:0] D_bit_6_count_d, D_bit_6_count_q = 1'h0;
    logic [4:0] D_correct_button_count_d, D_correct_button_count_q = 0;
    logic [4:0] D_motor_direction_count_d, D_motor_direction_count_q = 0;
    logic [3:0] D_motor_speed_count_d, D_motor_speed_count_q = 0;
    logic [3:0] D_p0_score_count_d, D_p0_score_count_q = 0;
    logic [3:0] D_p1_score_count_d, D_p1_score_count_q = 0;
    logic [4:0] D_correct_button_compare_count_d, D_correct_button_compare_count_q = 0;
    logic [3:0] D_counter_count_d, D_counter_count_q = 0;
    logic [2:0] D_temp_count_d, D_temp_count_q = 0;
    logic [2:0] D_temp1_count_d, D_temp1_count_q = 0;
    logic [3:0] D_flag_0_count_d, D_flag_0_count_q = 0;
    logic [2:0] D_wa_count_d, D_wa_count_q = 0;
    logic [2:0] D_we_count_d, D_we_count_q = 0;
    logic [2:0] D_data_count_d, D_data_count_q = 0;
    logic [1:0] D_a_count_d, D_a_count_q = 0;
    logic [1:0] D_b_count_d, D_b_count_q = 0;
    logic [2:0] D_alufn_count_d, D_alufn_count_q = 0;
    logic [31:0] D_correct_button_dff_d, D_correct_button_dff_q = 1'h0;
    logic [31:0] D_motor_direction_dff_d, D_motor_direction_dff_q = 1'h0;
    logic [31:0] D_motor_speed_dff_d, D_motor_speed_dff_q = 1'h0;
    logic [31:0] D_p0_score_dff_d, D_p0_score_dff_q = 1'h0;
    logic [31:0] D_p1_score_dff_d, D_p1_score_dff_q = 1'h0;
    logic [31:0] D_correct_button_compare_dff_d, D_correct_button_compare_dff_q = 1'h0;
    logic [31:0] D_counter_dff_d, D_counter_dff_q = 1'h0;
    logic [31:0] D_temp_dff_d, D_temp_dff_q = 1'h0;
    logic [31:0] D_temp1_dff_d, D_temp1_dff_q = 1'h0;
    logic [31:0] D_flag_0_dff_d, D_flag_0_dff_q = 1'h0;
    logic [3:0] D_wa_dff_d, D_wa_dff_q = 1'h0;
    logic D_we_dff_d, D_we_dff_q = 1'h0;
    logic [31:0] D_data_dff_d, D_data_dff_q = 1'h0;
    logic [31:0] D_a_dff_d, D_a_dff_q = 1'h0;
    logic [31:0] D_b_dff_d, D_b_dff_q = 1'h0;
    logic [5:0] D_alufn_dff_d, D_alufn_dff_q = 1'h0;
    logic send_trigger;
    always @* begin
        D_bit_32_count_d = D_bit_32_count_q;
        D_bit_4_count_d = D_bit_4_count_q;
        D_bit_6_count_d = D_bit_6_count_q;
        D_correct_button_count_d = D_correct_button_count_q;
        D_motor_direction_count_d = D_motor_direction_count_q;
        D_motor_speed_count_d = D_motor_speed_count_q;
        D_p0_score_count_d = D_p0_score_count_q;
        D_p1_score_count_d = D_p1_score_count_q;
        D_correct_button_compare_count_d = D_correct_button_compare_count_q;
        D_counter_count_d = D_counter_count_q;
        D_temp_count_d = D_temp_count_q;
        D_temp1_count_d = D_temp1_count_q;
        D_flag_0_count_d = D_flag_0_count_q;
        D_wa_count_d = D_wa_count_q;
        D_we_count_d = D_we_count_q;
        D_data_count_d = D_data_count_q;
        D_a_count_d = D_a_count_q;
        D_b_count_d = D_b_count_q;
        D_alufn_count_d = D_alufn_count_q;
        D_state_d = D_state_q;
        D_correct_button_dff_d = D_correct_button_dff_q;
        D_motor_direction_dff_d = D_motor_direction_dff_q;
        D_motor_speed_dff_d = D_motor_speed_dff_q;
        D_p0_score_dff_d = D_p0_score_dff_q;
        D_p1_score_dff_d = D_p1_score_dff_q;
        D_correct_button_compare_dff_d = D_correct_button_compare_dff_q;
        D_counter_dff_d = D_counter_dff_q;
        D_temp_dff_d = D_temp_dff_q;
        D_temp1_dff_d = D_temp1_dff_q;
        D_flag_0_dff_d = D_flag_0_dff_q;
        D_wa_dff_d = D_wa_dff_q;
        D_we_dff_d = D_we_dff_q;
        D_data_dff_d = D_data_dff_q;
        D_a_dff_d = D_a_dff_q;
        D_b_dff_d = D_b_dff_q;
        D_alufn_dff_d = D_alufn_dff_q;
        
        new_tx = 1'h0;
        tx_data = 8'bxxxxxxxx;
        send_trigger = new_rx & (rx_data == 8'h68);
        
        case (D_state_q)
            6'h0: begin
                if (send_trigger & !tx_busy) begin
                    D_bit_32_count_d = 5'h1f;
                    D_bit_4_count_d = 2'h3;
                    D_bit_6_count_d = 3'h5;
                    D_correct_button_count_d = 1'h0;
                    D_motor_direction_count_d = 1'h0;
                    D_motor_speed_count_d = 1'h0;
                    D_p0_score_count_d = 1'h0;
                    D_p1_score_count_d = 1'h0;
                    D_correct_button_compare_count_d = 1'h0;
                    D_counter_count_d = 1'h0;
                    D_temp_count_d = 1'h0;
                    D_temp1_count_d = 1'h0;
                    D_flag_0_count_d = 1'h0;
                    D_wa_count_d = 1'h0;
                    D_we_count_d = 1'h0;
                    D_data_count_d = 1'h0;
                    D_a_count_d = 1'h0;
                    D_b_count_d = 1'h0;
                    D_alufn_count_d = 1'h0;
                    D_state_d = 6'h1;
                end
            end
            6'h1: begin
                D_correct_button_dff_d = correct_button;
                D_motor_direction_dff_d = motor_direction;
                D_motor_speed_dff_d = motor_speed;
                D_p0_score_dff_d = p0_score;
                D_p1_score_dff_d = p1_score;
                D_correct_button_compare_dff_d = correct_button_compare;
                D_counter_dff_d = counter;
                D_temp_dff_d = temp;
                D_temp1_dff_d = temp1;
                D_flag_0_dff_d = flag_0;
                D_wa_dff_d = wa;
                D_we_dff_d = we;
                D_data_dff_d = data;
                D_a_dff_d = a;
                D_b_dff_d = b;
                D_alufn_dff_d = alufn;
                D_state_d = 6'h2;
            end
            6'h2: begin
                if (!tx_busy) begin
                    D_correct_button_count_d = D_correct_button_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_CORRECT_BUTTON[D_correct_button_count_q];
                    if (D_correct_button_count_q == 6'h1d) begin
                        D_state_d = 6'h3;
                    end
                end
            end
            6'h3: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_correct_button_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h4;
                    end
                end
            end
            6'h4: begin
                if (!tx_busy) begin
                    D_motor_direction_count_d = D_motor_direction_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_MOTOR_DIRECTION[D_motor_direction_count_q];
                    if (D_motor_direction_count_q == 6'h11) begin
                        D_state_d = 6'h5;
                    end
                end
            end
            6'h5: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_motor_direction_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h6;
                    end
                end
            end
            6'h6: begin
                if (!tx_busy) begin
                    D_motor_speed_count_d = D_motor_speed_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_MOTOR_SPEED[D_motor_speed_count_q];
                    if (D_motor_speed_count_q == 5'hd) begin
                        D_state_d = 6'h7;
                    end
                end
            end
            6'h7: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_motor_speed_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h8;
                    end
                end
            end
            6'h8: begin
                if (!tx_busy) begin
                    D_p0_score_count_d = D_p0_score_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_P0_SCORE[D_p0_score_count_q];
                    if (D_p0_score_count_q == 6'hf) begin
                        D_state_d = 6'h9;
                    end
                end
            end
            6'h9: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_p0_score_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'ha;
                    end
                end
            end
            6'ha: begin
                if (!tx_busy) begin
                    D_p1_score_count_d = D_p1_score_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_P1_SCORE[D_p1_score_count_q];
                    if (D_p1_score_count_q == 6'hf) begin
                        D_state_d = 6'hb;
                    end
                end
            end
            6'hb: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_p1_score_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'hc;
                    end
                end
            end
            6'hc: begin
                if (!tx_busy) begin
                    D_correct_button_compare_count_d = D_correct_button_compare_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_CORRECT_BUTTON_COMPARE[D_correct_button_compare_count_q];
                    if (D_correct_button_compare_count_q == 6'h18) begin
                        D_state_d = 6'hd;
                    end
                end
            end
            6'hd: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_correct_button_compare_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'he;
                    end
                end
            end
            6'he: begin
                if (!tx_busy) begin
                    D_counter_count_d = D_counter_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_COUNTER[D_counter_count_q];
                    if (D_counter_count_q == 5'h9) begin
                        D_state_d = 6'hf;
                    end
                end
            end
            6'hf: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_counter_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h10;
                    end
                end
            end
            6'h10: begin
                if (!tx_busy) begin
                    D_temp_count_d = D_temp_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_TEMP[D_temp_count_q];
                    if (D_temp_count_q == 5'h6) begin
                        D_state_d = 6'h11;
                    end
                end
            end
            6'h11: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_temp_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h12;
                    end
                end
            end
            6'h12: begin
                if (!tx_busy) begin
                    D_temp1_count_d = D_temp1_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_TEMP1[D_temp1_count_q];
                    if (D_temp1_count_q == 5'h7) begin
                        D_state_d = 6'h13;
                    end
                end
            end
            6'h13: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_temp1_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h14;
                    end
                end
            end
            6'h14: begin
                if (!tx_busy) begin
                    D_flag_0_count_d = D_flag_0_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_FLAG_0[D_flag_0_count_q];
                    if (D_flag_0_count_q == 5'h7) begin
                        D_state_d = 6'h15;
                    end
                end
            end
            6'h15: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_flag_0_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h16;
                    end
                end
            end
            6'h16: begin
                if (!tx_busy) begin
                    D_wa_count_d = D_wa_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_WA[D_wa_count_q];
                    if (D_wa_count_q == 5'h5) begin
                        D_state_d = 6'h17;
                    end
                end
            end
            6'h17: begin
                if (!tx_busy) begin
                    D_bit_4_count_d = D_bit_4_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_wa_dff_q[D_bit_4_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_4_count_q == 1'h0) begin
                        D_bit_4_count_d = 2'h3;
                        D_state_d = 6'h18;
                    end
                end
            end
            6'h18: begin
                if (!tx_busy) begin
                    D_we_count_d = D_we_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_WE[D_we_count_q];
                    if (D_we_count_q == 5'h4) begin
                        D_state_d = 6'h19;
                    end
                end
            end
            6'h19: begin
                if (!tx_busy) begin
                    new_tx = 1'h1;
                    if (D_we_dff_q == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    D_state_d = 6'h1a;
                end
            end
            6'h1a: begin
                if (!tx_busy) begin
                    D_data_count_d = D_data_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_DATA[D_data_count_q];
                    if (D_data_count_q == 5'h6) begin
                        D_state_d = 6'h1b;
                    end
                end
            end
            6'h1b: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_data_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h1c;
                    end
                end
            end
            6'h1c: begin
                if (!tx_busy) begin
                    D_a_count_d = D_a_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_A[D_a_count_q];
                    if (D_a_count_q == 5'h3) begin
                        D_state_d = 6'h1d;
                    end
                end
            end
            6'h1d: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_a_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h1e;
                    end
                end
            end
            6'h1e: begin
                if (!tx_busy) begin
                    D_b_count_d = D_b_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_B[D_b_count_q];
                    if (D_b_count_q == 5'h3) begin
                        D_state_d = 6'h1f;
                    end
                end
            end
            6'h1f: begin
                if (!tx_busy) begin
                    D_bit_32_count_d = D_bit_32_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_b_dff_q[D_bit_32_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_32_count_q == 1'h0) begin
                        D_bit_32_count_d = 5'h1f;
                        D_state_d = 6'h20;
                    end
                end
            end
            6'h20: begin
                if (!tx_busy) begin
                    D_alufn_count_d = D_alufn_count_q + 1'h1;
                    new_tx = 1'h1;
                    tx_data = TEXT_ALUFN[D_alufn_count_q];
                    if (D_alufn_count_q == 5'h7) begin
                        D_state_d = 6'h21;
                    end
                end
            end
            6'h21: begin
                if (!tx_busy) begin
                    D_bit_6_count_d = D_bit_6_count_q - 1'h1;
                    new_tx = 1'h1;
                    if (D_alufn_dff_q[D_bit_6_count_q] == 1'h1) begin
                        tx_data = 8'h31;
                    end else begin
                        tx_data = 8'h30;
                    end
                    if (D_bit_6_count_q == 1'h0) begin
                        D_bit_6_count_d = 3'h5;
                        D_state_d = 6'h0;
                    end
                end
            end
            default: begin
                D_state_d = 6'h0;
            end
        endcase
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_state_q <= 6'h0;
            D_bit_32_count_q <= 1'h0;
            D_bit_4_count_q <= 1'h0;
            D_bit_6_count_q <= 1'h0;
            D_correct_button_count_q <= 0;
            D_motor_direction_count_q <= 0;
            D_motor_speed_count_q <= 0;
            D_p0_score_count_q <= 0;
            D_p1_score_count_q <= 0;
            D_correct_button_compare_count_q <= 0;
            D_counter_count_q <= 0;
            D_temp_count_q <= 0;
            D_temp1_count_q <= 0;
            D_flag_0_count_q <= 0;
            D_wa_count_q <= 0;
            D_we_count_q <= 0;
            D_data_count_q <= 0;
            D_a_count_q <= 0;
            D_b_count_q <= 0;
            D_alufn_count_q <= 0;
            D_correct_button_dff_q <= 1'h0;
            D_motor_direction_dff_q <= 1'h0;
            D_motor_speed_dff_q <= 1'h0;
            D_p0_score_dff_q <= 1'h0;
            D_p1_score_dff_q <= 1'h0;
            D_correct_button_compare_dff_q <= 1'h0;
            D_counter_dff_q <= 1'h0;
            D_temp_dff_q <= 1'h0;
            D_temp1_dff_q <= 1'h0;
            D_flag_0_dff_q <= 1'h0;
            D_wa_dff_q <= 1'h0;
            D_we_dff_q <= 1'h0;
            D_data_dff_q <= 1'h0;
            D_a_dff_q <= 1'h0;
            D_b_dff_q <= 1'h0;
            D_alufn_dff_q <= 1'h0;
        end else begin
            D_state_q <= D_state_d;
            D_bit_32_count_q <= D_bit_32_count_d;
            D_bit_4_count_q <= D_bit_4_count_d;
            D_bit_6_count_q <= D_bit_6_count_d;
            D_correct_button_count_q <= D_correct_button_count_d;
            D_motor_direction_count_q <= D_motor_direction_count_d;
            D_motor_speed_count_q <= D_motor_speed_count_d;
            D_p0_score_count_q <= D_p0_score_count_d;
            D_p1_score_count_q <= D_p1_score_count_d;
            D_correct_button_compare_count_q <= D_correct_button_compare_count_d;
            D_counter_count_q <= D_counter_count_d;
            D_temp_count_q <= D_temp_count_d;
            D_temp1_count_q <= D_temp1_count_d;
            D_flag_0_count_q <= D_flag_0_count_d;
            D_wa_count_q <= D_wa_count_d;
            D_we_count_q <= D_we_count_d;
            D_data_count_q <= D_data_count_d;
            D_a_count_q <= D_a_count_d;
            D_b_count_q <= D_b_count_d;
            D_alufn_count_q <= D_alufn_count_d;
            D_correct_button_dff_q <= D_correct_button_dff_d;
            D_motor_direction_dff_q <= D_motor_direction_dff_d;
            D_motor_speed_dff_q <= D_motor_speed_dff_d;
            D_p0_score_dff_q <= D_p0_score_dff_d;
            D_p1_score_dff_q <= D_p1_score_dff_d;
            D_correct_button_compare_dff_q <= D_correct_button_compare_dff_d;
            D_counter_dff_q <= D_counter_dff_d;
            D_temp_dff_q <= D_temp_dff_d;
            D_temp1_dff_q <= D_temp1_dff_d;
            D_flag_0_dff_q <= D_flag_0_dff_d;
            D_wa_dff_q <= D_wa_dff_d;
            D_we_dff_q <= D_we_dff_d;
            D_data_dff_q <= D_data_dff_d;
            D_a_dff_q <= D_a_dff_d;
            D_b_dff_q <= D_b_dff_d;
            D_alufn_dff_q <= D_alufn_dff_d;
        end
    end
endmodule