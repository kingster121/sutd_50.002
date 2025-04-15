/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module game_datapath (
        input wire clk,
        input wire rst,
        input wire p0b0,
        input wire p0b1,
        input wire p1b0,
        input wire p1b1,
        input wire p0wall,
        input wire p1wall,
        input wire center_button,
        output reg [31:0] correct_button,
        output reg [31:0] motor_direction,
        output reg [31:0] motor_speed,
        output reg [31:0] p0_score,
        output reg [31:0] p1_score,
        output reg [31:0] correct_button_compare,
        output reg [31:0] counter,
        output reg [31:0] temp,
        output reg [31:0] temp1,
        output reg [3:0] wa,
        output reg we,
        output reg [31:0] data,
        output reg [31:0] a,
        output reg [31:0] b,
        output reg [5:0] alufn
    );
    localparam CLOCK_DIVIDER = 4'hf;
    logic [31:0] input_alu_a;
    logic [31:0] input_alu_b;
    logic [31:0] M_game_alu_a;
    logic [31:0] M_game_alu_b;
    logic [5:0] M_game_alu_alufn;
    logic [31:0] M_game_alu_out;
    logic M_game_alu_z;
    logic M_game_alu_v;
    logic M_game_alu_n;
    
    alu game_alu (
        .a(M_game_alu_a),
        .b(M_game_alu_b),
        .alufn(M_game_alu_alufn),
        .out(M_game_alu_out),
        .z(M_game_alu_z),
        .v(M_game_alu_v),
        .n(M_game_alu_n)
    );
    
    
<<<<<<< HEAD
    localparam _MP_SIZE_2126423522 = 1'h1;
    localparam _MP_DIV_2126423522 = 4'hf;
    localparam _MP_TOP_2126423522 = 1'h0;
    localparam _MP_UP_2126423522 = 1'h1;
    logic [0:0] M_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_2126423522),
        .DIV(_MP_DIV_2126423522),
        .TOP(_MP_TOP_2126423522),
        .UP(_MP_UP_2126423522)
=======
    localparam _MP_SIZE_737829541 = 1'h1;
    localparam _MP_DIV_737829541 = 4'hf;
    localparam _MP_TOP_737829541 = 1'h0;
    localparam _MP_UP_737829541 = 1'h1;
    logic [0:0] M_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_737829541),
        .DIV(_MP_DIV_737829541),
        .TOP(_MP_TOP_737829541),
        .UP(_MP_UP_737829541)
>>>>>>> parent of 002b953 (Working V1.1)
    ) slow_clk (
        .rst(rst),
        .clk(clk),
        .value(M_slow_clk_value)
    );
    
    
<<<<<<< HEAD
    localparam _MP_RISE_1397045680 = 1'h1;
    localparam _MP_FALL_1397045680 = 1'h0;
    logic M_slow_clk_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1397045680),
        .FALL(_MP_FALL_1397045680)
=======
    localparam _MP_RISE_2004775252 = 1'h1;
    localparam _MP_FALL_2004775252 = 1'h0;
    logic M_slow_clk_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_2004775252),
        .FALL(_MP_FALL_2004775252)
>>>>>>> parent of 002b953 (Working V1.1)
    ) slow_clk_edge (
        .in(M_slow_clk_value),
        .clk(clk),
        .out(M_slow_clk_edge_out)
    );
    
    
    logic [31:0] M_game_cu_regfile_rd2;
    logic [5:0] M_game_cu_alufn;
    logic [2:0] M_game_cu_asel;
    logic [2:0] M_game_cu_bsel;
    logic [1:0] M_game_cu_alu_out_sel;
    logic [3:0] M_game_cu_regfile_wa;
    logic [3:0] M_game_cu_regfile_ra1;
    logic [3:0] M_game_cu_regfile_ra2;
    logic M_game_cu_regfile_we;
    
    game_cu game_cu (
        .slow_clk(M_slow_clk_edge_out),
        .p0b0(p0b0),
        .p0b1(p0b1),
        .p1b0(p1b0),
        .p1b1(p1b1),
        .p0wall(p0wall),
        .p1wall(p1wall),
        .center_button(center_button),
        .clk(clk),
        .rst(rst),
        .regfile_rd2(M_game_cu_regfile_rd2),
        .alufn(M_game_cu_alufn),
        .asel(M_game_cu_asel),
        .bsel(M_game_cu_bsel),
        .alu_out_sel(M_game_cu_alu_out_sel),
        .regfile_wa(M_game_cu_regfile_wa),
        .regfile_ra1(M_game_cu_regfile_ra1),
        .regfile_ra2(M_game_cu_regfile_ra2),
        .regfile_we(M_game_cu_regfile_we)
    );
    
    
    logic [31:0] M_game_regfiles_data;
    logic [31:0] M_game_regfiles_rd1;
    logic [31:0] M_game_regfiles_rd2;
    logic [31:0] M_game_regfiles_correct_button_out;
    logic [31:0] M_game_regfiles_motor_direction_out;
    logic [31:0] M_game_regfiles_motor_speed_out;
    logic [31:0] M_game_regfiles_p0_score_out;
    logic [31:0] M_game_regfiles_p1_score_out;
    logic [31:0] M_game_regfiles_correct_button_compare_out;
    logic [31:0] M_game_regfiles_counter_out;
    logic [31:0] M_game_regfiles_temp_out;
    logic [31:0] M_game_regfiles_temp1_out;
    logic [3:0] M_game_regfiles_wa_out;
    logic M_game_regfiles_we_out;
    logic [31:0] M_game_regfiles_data_out;
    
    game_regfiles game_regfiles (
        .we(M_game_cu_regfile_we),
        .wa(M_game_cu_regfile_wa),
        .ra1(M_game_cu_regfile_ra1),
        .ra2(M_game_cu_regfile_ra2),
        .clk(clk),
        .rst(rst),
        .data(M_game_regfiles_data),
        .rd1(M_game_regfiles_rd1),
        .rd2(M_game_regfiles_rd2),
        .correct_button_out(M_game_regfiles_correct_button_out),
        .motor_direction_out(M_game_regfiles_motor_direction_out),
        .motor_speed_out(M_game_regfiles_motor_speed_out),
        .p0_score_out(M_game_regfiles_p0_score_out),
        .p1_score_out(M_game_regfiles_p1_score_out),
        .correct_button_compare_out(M_game_regfiles_correct_button_compare_out),
        .counter_out(M_game_regfiles_counter_out),
        .temp_out(M_game_regfiles_temp_out),
        .temp1_out(M_game_regfiles_temp1_out),
        .wa_out(M_game_regfiles_wa_out),
        .we_out(M_game_regfiles_we_out),
        .data_out(M_game_regfiles_data_out)
    );
    
    
<<<<<<< HEAD
    localparam _MP_SIZE_1305312452 = 1'h1;
    logic [0:0] M_rng_1_out;
    
    random_number_generator #(
        .SIZE(_MP_SIZE_1305312452)
=======
    localparam _MP_SIZE_657510209 = 1'h1;
    logic [0:0] M_rng_1_out;
    
    random_number_generator #(
        .SIZE(_MP_SIZE_657510209)
>>>>>>> parent of 002b953 (Working V1.1)
    ) rng_1 (
        .slow_clk(M_slow_clk_value),
        .refresh(rst),
        .clk(clk),
        .out(M_rng_1_out)
    );
    
    
<<<<<<< HEAD
    localparam _MP_SIZE_402114398 = 4'h9;
    logic [8:0] M_rng_500_out;
    
    random_number_generator #(
        .SIZE(_MP_SIZE_402114398)
=======
    localparam _MP_SIZE_1648510023 = 4'h9;
    logic [8:0] M_rng_500_out;
    
    random_number_generator #(
        .SIZE(_MP_SIZE_1648510023)
>>>>>>> parent of 002b953 (Working V1.1)
    ) rng_500 (
        .slow_clk(M_slow_clk_value),
        .refresh(rst),
        .clk(clk),
        .out(M_rng_500_out)
    );
    
    
    always @* begin
        M_game_cu_regfile_rd2 = M_game_regfiles_rd2;
        
        case (M_game_cu_asel)
            1'h0: begin
                input_alu_a = M_game_regfiles_rd1;
            end
            1'h1: begin
                input_alu_a = 32'h1;
            end
            2'h2: begin
                input_alu_a = 32'h2;
            end
            2'h3: begin
                input_alu_a = 32'h4;
            end
            3'h4: begin
                input_alu_a = 32'h8;
            end
            default: begin
                input_alu_a = 1'h0;
            end
        endcase
        
        case (M_game_cu_bsel)
            1'h0: begin
                input_alu_b = M_game_regfiles_rd2;
            end
            1'h1: begin
                input_alu_b = 32'ha;
            end
            2'h2: begin
                input_alu_b = 32'h5;
            end
            2'h3: begin
                input_alu_b = 32'h3;
            end
            3'h4: begin
                input_alu_b = 32'h0;
            end
            default: begin
                input_alu_b = 1'h0;
            end
        endcase
        M_game_alu_a = input_alu_a;
        M_game_alu_b = input_alu_b;
        M_game_alu_alufn = M_game_cu_alufn;
        
        case (M_game_cu_alu_out_sel)
            2'h0: begin
                M_game_regfiles_data = M_game_alu_out;
            end
            2'h1: begin
                M_game_regfiles_data = M_rng_1_out;
            end
            2'h2: begin
                M_game_regfiles_data = M_rng_500_out;
            end
            default: begin
                M_game_regfiles_data = M_game_alu_out;
            end
        endcase
        correct_button = M_game_regfiles_correct_button_out;
        motor_direction = M_game_regfiles_motor_direction_out;
        motor_speed = M_game_regfiles_motor_speed_out;
        p0_score = M_game_regfiles_p0_score_out;
        p1_score = M_game_regfiles_p1_score_out;
        correct_button_compare = M_game_regfiles_correct_button_compare_out;
        counter = M_game_regfiles_counter_out;
        temp = M_game_regfiles_temp_out;
        temp1 = M_game_regfiles_temp1_out;
        wa = M_game_regfiles_wa_out;
        we = M_game_regfiles_we_out;
        data = M_game_regfiles_data_out;
        a = input_alu_a;
        b = input_alu_b;
        alufn = M_game_cu_alufn;
    end
    
    
endmodule