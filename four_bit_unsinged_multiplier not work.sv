module four_bit_us_multiplier(
    input logic [3:0] A,B, //4-bit input. in this case B used as a multiplier.
    output logic [7:0] Product // output of the multiplier
);

//bulding the partial products
logic [7:0] pp [3:0]; //declaration of an array to store partial products(pp)

assign pp[0] = {4'b0, (A & {4{B[0]}})}; //multiply the first bit of the B with A. Also no shift. padded with four '0' after MSB.
assign pp[1] = {3'b0, (A & {4{B[1]}}), 1'b0}; // multiply the second bit of the B with A. shift left by 1 position and padded with one '0'. padded with three '0' after MSB.
assign pp[2] = {2'b0, (A & {4{B[2]}}), 2'b0}; //  multiply the third bit of the B with A. shift left by 2 positions and padded with two '0'. padded with two '0' after MSB
assign pp[3] = {1'b0, (A & {4{B[3]}}), 3'b0}; //  multiply the fourth bit of the B with A. shift left by 3 positions and padded with three '0'. padded with one '0' after MSB


//creating variable for get the summation of the each adder
logic [7:0] sum;
logic [7:0] sum_temp;
logic carry_wire; 

assign sum = 8'b0; //initialising the sum to 0

//to get the product, sending all partial product through four eight bit adders.
genvar i;
generate
//below loop run 4 times creating for adders to get the final product
    for (i = 0; i < 4; i = i+1) begin : Adder
    eight_bit_adder adder_inst(
        .A(sum),
        .B(pp[i]),
        .Cin(1'b0), //carry in of each adder should be zero
        .Sum(sum_temp),
        .Cout(carry_wire)
        );

        //updating the tempory sum value to the sum
        /* assign sum = sum_temp;*/
        if (i==0) begin 
            assign sum = sum_temp;
        end else begin 
            assign sum = sum_temp;
        end
    end
endgenerate

//sum value after the fouh iteration is equal to th efinal product
//therefore assigning the last sum value to the product
assign Product = sum;

endmodule