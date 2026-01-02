module one_bit_adder_tb;

timeunit 10ns; timeprecision 1ps;

logic A,B,Cin,Sum,Cout;

one_bit_adder dut(.*); //module instantiation 

initial begin 
    
    $dumpfile("one_bit_adder_dump.vcd"); // waveform file
    $dumpvars(0, dut); //dumping of the variables to generate the waveform

    // generating all the eight combinations of the inputs
    for(int i=0; i<8; i=i+1) begin
        {A,B,Cin} = i; // assigning the concatenation of A,B,Cin value to the "i"

        //display the input and output values
        $display("A=%b,B=%b,Cin=%b,Cout=%b,Sum=%b", A,B,Cin,Cout,Sum);

        #10; //wait untill Sum and Cout stabilize

        assert ({Cout,Sum} == A+B+Cin)
            $display("Adder is OK");
            else $error("Adder is NOT OK");
    end
end

endmodule