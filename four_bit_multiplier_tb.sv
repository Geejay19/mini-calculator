module four_bit_multiplier_tb;

timeunit 1ns;
timeprecision 1ps;

logic [3:0] A,B;
logic [7:0] Product;

//instantiation of the module
four_bit_us_multiplier dut(.*);

initial begin 
    $dumpfile("four_bit_Mul.vcd");
    $dumpvars(0,dut);

    repeat(10) begin 
        #5;
        std::randomize(A);
        std::randomize(B);
        #5;

        $display("A=%d,B=%d,Product=%d", A,B,Product);

        assert(Product == A*B)
            $display("multiplier is OK");
            else $error("Multiplier is not OK");
    end
end

$finish;


endmodule