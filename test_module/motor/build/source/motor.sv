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
    localparam _MP_WIDTH_1770567973 = 4'ha;
    localparam _MP_TOP_1770567973 = 8'hfa;
    localparam _MP_DIV_1770567973 = 2'h3;
    logic [9:0] M_pwm_value;
    logic M_pwm_pulse;
    
    pwm #(
        .WIDTH(_MP_WIDTH_1770567973),
        .TOP(_MP_TOP_1770567973),
        .DIV(_MP_DIV_1770567973)
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
        
        case (motor_speed)
            1'h0: begin
                M_pwm_value = 1'h0;
            end
            1'h1: begin
                M_pwm_value = 6'h23;
            end
            default: begin
                M_pwm_value = 1'h0;
            end
        endcase
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