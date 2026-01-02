

module seven_segment_decoder_tb;
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] num;
    logic [6:0] seg;

    seven_segment_decoder dut (.*);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);

        num = 4'd0;  
        #1 assert (seg == 7'b0111111) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd1; 
        #1 assert (seg == 7'b0000110) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd2; 
        #1 assert (seg == 7'b1011011) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd3; 
        #1 assert (seg == 7'b1001111) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd4; 
        #1 assert (seg == 7'b1100110) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd5; 
        #1 assert (seg == 7'b1101101) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd6; 
        #1 assert (seg == 7'b1111101) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd7; 
        #1 assert (seg == 7'b0000111) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd8; 
        #1 assert (seg == 7'b1111111) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 num = 4'd9;  
        #1 assert (seg == 7'b1101111) begin $display("%d - Pass", num); end else $error("%d is invalid", num);
        #10 
        $finish;
    end
endmodule