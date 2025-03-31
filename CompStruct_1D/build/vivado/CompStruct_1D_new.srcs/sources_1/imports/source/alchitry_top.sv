/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alchitry_top (
        input wire clk,
        input wire rst_n,
        output reg [7:0] led,
        input wire usb_rx,
        output reg usb_tx,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip
    );
    logic rst;
    localparam CLOCK_DIVIDER = 5'h1a;
    localparam CLK_FREQ = 27'h5f5e100;
    localparam SEG_REFRESH = 4'ha;
    localparam _MP_STAGES_148553977 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_148553977)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    localparam _MP_CLK_FREQ_312087590 = 27'h5f5e100;
    localparam _MP_MIN_DELAY_312087590 = 5'h14;
    localparam _MP_NUM_SYNC_312087590 = 2'h2;
    logic M_io_button_0_out;
    
    button_conditioner #(
        .CLK_FREQ(_MP_CLK_FREQ_312087590),
        .MIN_DELAY(_MP_MIN_DELAY_312087590),
        .NUM_SYNC(_MP_NUM_SYNC_312087590)
    ) io_button_0 (
        .in(io_button[1'h0]),
        .clk(clk),
        .out(M_io_button_0_out)
    );
    
    
    logic [1:0] D_seg_multiplex_d, D_seg_multiplex_q = 1'h0;
    localparam _MP_SIZE_177319451 = 1'h1;
    localparam _MP_DIV_177319451 = 5'h1a;
    localparam _MP_TOP_177319451 = 1'h0;
    localparam _MP_UP_177319451 = 1'h1;
    logic [0:0] M_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_177319451),
        .DIV(_MP_DIV_177319451),
        .TOP(_MP_TOP_177319451),
        .UP(_MP_UP_177319451)
    ) slow_clk (
        .clk(clk),
        .rst(rst),
        .value(M_slow_clk_value)
    );
    
    
    localparam _MP_SIZE_2091964005 = 1'h1;
    localparam _MP_DIV_2091964005 = 4'ha;
    localparam _MP_TOP_2091964005 = 1'h0;
    localparam _MP_UP_2091964005 = 1'h1;
    logic [0:0] M_seg_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_2091964005),
        .DIV(_MP_DIV_2091964005),
        .TOP(_MP_TOP_2091964005),
        .UP(_MP_UP_2091964005)
    ) seg_clk (
        .clk(clk),
        .rst(rst),
        .value(M_seg_clk_value)
    );
    
    
    logic M_test_motor_in1;
    logic M_test_motor_in2;
    
    test_motor test_motor (
        .motor_speed(4'h8),
        .motor_direction(1'h0),
        .clk(clk),
        .rst(rst),
        .in1(M_test_motor_in1),
        .in2(M_test_motor_in2)
    );
    
    
    localparam _MP_RISE_1456503286 = 1'h1;
    localparam _MP_FALL_1456503286 = 1'h0;
    logic M_button_0_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1456503286),
        .FALL(_MP_FALL_1456503286)
    ) button_0_edge (
        .in(M_io_button_0_out),
        .clk(clk),
        .out(M_button_0_edge_out)
    );
    
    
    localparam _MP_RISE_286224342 = 1'h1;
    localparam _MP_FALL_286224342 = 1'h0;
    logic M_seg_clk_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_286224342),
        .FALL(_MP_FALL_286224342)
    ) seg_clk_edge (
        .in(M_seg_clk_value),
        .clk(clk),
        .out(M_seg_clk_edge_out)
    );
    
    
    localparam _MP_SIZE_1145416648 = 4'h8;
    logic [7:0] M_generator_out;
    
    random_number_generator #(
        .SIZE(_MP_SIZE_1145416648)
    ) generator (
        .slow_clk(M_slow_clk_value),
        .refresh(M_button_0_edge_out),
        .clk(clk),
        .out(M_generator_out)
    );
    
    
    localparam _MP_WIDTH_1501906730 = 2'h2;
    logic [3:0] M_seg_selector_out;
    
    decoder #(
        .WIDTH(_MP_WIDTH_1501906730)
    ) seg_selector (
        .in(D_seg_multiplex_q),
        .out(M_seg_selector_out)
    );
    
    
    localparam _MP_DIGITS_29220213 = 3'h4;
    localparam _MP_LEADING_ZEROS_29220213 = 1'h1;
    logic [3:0][3:0] M_bin_to_dec_digits;
    
    bin_to_dec #(
        .DIGITS(_MP_DIGITS_29220213),
        .LEADING_ZEROS(_MP_LEADING_ZEROS_29220213)
    ) bin_to_dec (
        .value(M_generator_out),
        .digits(M_bin_to_dec_digits)
    );
    
    
    logic [3:0][6:0] M_encoder_segs;
    logic [3:0][3:0] M_encoder_char = {M_bin_to_dec_digits[0:0], M_bin_to_dec_digits[1:1], M_bin_to_dec_digits[2:2], M_bin_to_dec_digits[3:3]};
    
    genvar idx_0_1535173697;
    
    generate
        for (idx_0_1535173697 = 0; idx_0_1535173697 < 4; idx_0_1535173697 = idx_0_1535173697 + 1) begin: forLoop_idx_0_1535173697
            seven_segment_encoder encoder (
                .char(M_encoder_char[idx_0_1535173697]),
                .segs(M_encoder_segs[idx_0_1535173697])
            );
        end
    endgenerate
    
    
    always @* begin
        D_seg_multiplex_d = D_seg_multiplex_q;
        
        M_reset_cond_in = ~rst_n;
        rst = M_reset_cond_out;
        led = 8'h0;
        usb_tx = usb_rx;
        D_seg_multiplex_d = D_seg_multiplex_q;
        if (M_seg_clk_edge_out) begin
            D_seg_multiplex_d = D_seg_multiplex_q + 1'h1;
        end
        io_led[2'h2:1'h1] = {{8'h0, 8'h0}};
        io_led[1'h0] = M_generator_out;
        io_segment = ~M_encoder_segs[D_seg_multiplex_q];
        io_select = ~M_seg_selector_out;
        io_led[1'h0][1'h0] = M_test_motor_in1;
        io_led[1'h0][1'h1] = M_test_motor_in2;
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_seg_multiplex_q <= 1'h0;
        end else begin
            D_seg_multiplex_q <= D_seg_multiplex_d;
        end
    end
endmodule