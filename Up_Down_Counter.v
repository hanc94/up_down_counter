`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 08:02:30 AM
// Design Name: 
// Module Name: Up_Down_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Up_Down_Counter (clk, rst, u_d, q);

input clk,rst,u_d;
output reg [2:0]q;

reg [2:0] state;
reg [2:0] Next_state;
parameter        CERO = 3'b000,
                 UNO = 3'b001,
                 DOS = 3'b010,
                 TRES = 3'b011,
                 CUATRO = 3'b100,
                 CINCO = 3'b101,
                 SEIS = 3'b110,
                 SIETE = 3'b111;
 
always @(posedge clk)
begin
    if (!rst)
    begin
       state <= CERO;
    end
    else begin
       state <= Next_state;
    end
end

always @(state,u_d)
begin
    case (state)
        CERO : begin if( u_d )begin 
                Next_state = UNO;
                q = UNO;
                end
               else begin 
                Next_state = SIETE;
                q = SIETE;
               end
               end
        UNO : begin if( u_d )begin
                 Next_state = DOS;
                 q = DOS;
                 end
               else begin 
                 Next_state = CERO;
                 q = CERO;
               end
             end
        DOS : begin if( u_d ) begin
                Next_state = TRES;
                q = TRES;
              end
               else begin 
               Next_state = UNO;
               q = UNO;
               end
             end
        TRES : begin if( u_d ) begin 
                Next_state = CUATRO;
                q = CUATRO;
                end
               else begin 
                Next_state = DOS;
                q = DOS;
               end
              end
        CUATRO : begin if( u_d )begin
                   Next_state = CINCO;
                   q = CINCO;
                end
               else begin 
                   Next_state = TRES;
                   q = TRES;
                end
               end
        CINCO : begin if( u_d )begin
                   Next_state = SEIS;
                   q = SEIS;
                end
                else begin 
                   Next_state = CUATRO;
                   q = CUATRO;
                end
               end
        SEIS : begin if( u_d ) begin
                   Next_state = SIETE;
                   q = SIETE;
                   end
               else begin 
                   Next_state = CINCO;
                   q = CINCO;
               end
              end 
        SIETE : begin if( u_d ) begin
                   Next_state = CERO;
                   q = CERO;
                end
               else begin 
                   Next_state = SEIS;
                   q = SEIS;
               end
               end
    endcase
end
endmodule