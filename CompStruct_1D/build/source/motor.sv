/*
    This file was generated automatically by Alchitry Labs 2.0.24-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module motor (
        input wire clk,
        input wire rst,
        input wire [2:0] motor_speed,
        input wire motor_direction,
        output reg in1,
        output reg in2
    );
    localparam _MP_WIDTH_1014518174 = 4'ha;
    localparam _MP_TOP_1014518174 = 8'hfa;
    localparam _MP_DIV_1014518174 = 2'h3;
    logic [9:0] M_pwm_value;
    logic M_pwm_pulse;
    
    pwm #(
        .WIDTH(_MP_WIDTH_1014518174),
        .TOP(_MP_TOP_1014518174),
        .DIV(_MP_DIV_1014518174)
    ) pwm (
        .update(1'h1),
        .clk(clk),
        .rst(rst),
        .value(M_pwm_value),
        .pulse(M_pwm_pulse)
    );
    
    
    always @* begin
        in1 = 1'h0;
        in2 = 1'h0;
        M_pwm_value = motor_speed * 6'h23;
        if (motor_direction == 1'h1) begin
            in1 = M_pwm_pulse;
            in2 = 1'h0;
        end
        if (motor_direction == 1'h0) begin
            in1 = 1'h0;
            in2 = M_pwm_pulse;
        end
    end
    
    
endmodule