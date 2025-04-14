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
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        output reg motorIN1,
        output reg motorIN2
    );
    logic rst;
    logic [2:0] M_motor_motor_speed;
    logic M_motor_motor_direction;
    logic M_motor_in1;
    logic M_motor_in2;
    
    motor motor (
        .clk(clk),
        .rst(rst),
        .motor_speed(M_motor_motor_speed),
        .motor_direction(M_motor_motor_direction),
        .in1(M_motor_in1),
        .in2(M_motor_in2)
    );
    
    
    localparam _MP_STAGES_440828766 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_440828766)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    always @* begin
        M_reset_cond_in = ~rst_n;
        rst = M_reset_cond_out;
        led = 8'h0;
        io_segment = 1'h0;
        io_select = 1'h0;
        usb_tx = usb_rx;
        M_motor_motor_speed = 3'h4;
        M_motor_motor_direction = 1'h0;
        motorIN1 = M_motor_in1;
        motorIN2 = M_motor_in2;
    end
    
    
endmodule