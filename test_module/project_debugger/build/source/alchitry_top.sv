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
        output reg usb_tx
    );
    logic rst;
    localparam _MP_STAGES_1446016958 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_1446016958)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    localparam _MP_CLK_FREQ_1702479960 = 27'h5f5e100;
    localparam _MP_BAUD_1702479960 = 20'hf4240;
    logic M_rx_rx;
    logic [7:0] M_rx_data;
    logic M_rx_new_data;
    
    uart_rx #(
        .CLK_FREQ(_MP_CLK_FREQ_1702479960),
        .BAUD(_MP_BAUD_1702479960)
    ) rx (
        .clk(clk),
        .rst(rst),
        .rx(M_rx_rx),
        .data(M_rx_data),
        .new_data(M_rx_new_data)
    );
    
    
    localparam _MP_CLK_FREQ_1361612667 = 27'h5f5e100;
    localparam _MP_BAUD_1361612667 = 20'hf4240;
    logic M_tx_tx;
    logic M_tx_block;
    logic M_tx_busy;
    logic [7:0] M_tx_data;
    logic M_tx_new_data;
    
    uart_tx #(
        .CLK_FREQ(_MP_CLK_FREQ_1361612667),
        .BAUD(_MP_BAUD_1361612667)
    ) tx (
        .clk(clk),
        .rst(rst),
        .tx(M_tx_tx),
        .block(M_tx_block),
        .busy(M_tx_busy),
        .data(M_tx_data),
        .new_data(M_tx_new_data)
    );
    
    
    logic M_debugger_new_rx;
    logic [7:0] M_debugger_rx_data;
    logic M_debugger_new_tx;
    logic [7:0] M_debugger_tx_data;
    logic M_debugger_tx_busy;
    logic [31:0] M_debugger_correct_button;
    logic [31:0] M_debugger_motor_direction;
    logic [31:0] M_debugger_motor_speed;
    logic [31:0] M_debugger_p0_score;
    logic [31:0] M_debugger_p1_score;
    logic [31:0] M_debugger_correct_button_compare;
    logic [31:0] M_debugger_counter;
    logic [31:0] M_debugger_temp;
    
    debugger debugger (
        .clk(clk),
        .rst(rst),
        .new_rx(M_debugger_new_rx),
        .rx_data(M_debugger_rx_data),
        .new_tx(M_debugger_new_tx),
        .tx_data(M_debugger_tx_data),
        .tx_busy(M_debugger_tx_busy),
        .correct_button(M_debugger_correct_button),
        .motor_direction(M_debugger_motor_direction),
        .motor_speed(M_debugger_motor_speed),
        .p0_score(M_debugger_p0_score),
        .p1_score(M_debugger_p1_score),
        .correct_button_compare(M_debugger_correct_button_compare),
        .counter(M_debugger_counter),
        .temp(M_debugger_temp)
    );
    
    
    always @* begin
        M_reset_cond_in = ~rst_n;
        rst = M_reset_cond_out;
        led = 8'h0;
        M_rx_rx = usb_rx;
        usb_tx = M_tx_tx;
        M_debugger_new_rx = M_rx_new_data;
        M_debugger_rx_data = M_rx_data;
        M_debugger_correct_button = 32'h0;
        M_debugger_motor_direction = 32'h1;
        M_debugger_motor_speed = 32'h3;
        M_debugger_p0_score = 32'h7;
        M_debugger_p1_score = 32'hf;
        M_debugger_correct_button_compare = 32'h1f;
        M_debugger_counter = 32'h3f;
        M_debugger_temp = 32'h7f;
        M_tx_new_data = M_debugger_new_tx;
        M_tx_data = M_debugger_tx_data;
        M_debugger_tx_busy = M_tx_busy;
        M_tx_block = 1'h0;
    end
    
    
endmodule