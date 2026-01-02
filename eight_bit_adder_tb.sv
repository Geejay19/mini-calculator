module eight_bit_adder_tb;

timeunit 1ns; timeprecision 1ps;

localparam N = 8 ;

logic [N-1:0] A,B,Sum;
logic Cin,Cout;

// module instantiation
eight_bit_adder #(.N(N)) dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Cout(Cout),
    .Sum(Sum)
); 

initial begin 
    $dumpfile("eight_bit_adder.vcd"); $dumpvars(0,dut);

    //to test the conditions where carry out not occurs
    repeat (5) begin 
        //the summation of the maximum input values of A,B and Cin should below than 255
        //therefore, assigning randomize values to A and B ranging from 0 to 122
        //assigning randomize values to Cin
        #5;
        std::randomize(Cin);
        std::randomize(A) with {A inside {[0:127]};};
        std::randomize(B) with {B inside{[0:127]};};
        #5;
        
        $display("A=%d,B=%d,Cin=%d,Cout=%d,Sum=%d", A,B,Cin,Cout,Sum);

        assert({Cout,Sum} == A+B+Cin)
            $display("Eight bit adder is OK");
            else $error("Eight bit adder is not OK");
    end

    //testing the conditions where carry out occurs

    repeat (5) begin 
        #5;
        //by assigning values higher than 128 for A and B ensures there will be a carry out
        std::randomize(Cin);
        std::randomize(A) with {A inside {[128:255]};};
        std::randomize(B) with {B inside {[128:255]};};
        #5;

        $display("A=%d,B=%d,Cin=%d,Cout=%d,Sum=%d", A,B,Cin,Cout,Sum);

        assert(Cout == 1) //cheking the carry out is high
            $display("OK - Carry out is High");
            else $error("Not OK - Carry Out is low");

        assert({Cout,Sum} == A+B+Cin) //checking the summation is correct
            $display("Eight bit adder is OK") ;
            else $error("Eight bit adder is NOT OK");

    end

    $display("All test conditions completed");
    $finish;
end

endmodule