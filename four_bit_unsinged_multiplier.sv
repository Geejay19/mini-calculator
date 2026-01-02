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


//creating adders to get the final product
logic [7:0] sum_temp [3:0]; //for store the addition of the each adder

//first adder to add pp[0] and pp[1]
eight_bit_adder Adder_inst_0(
    .A(pp[0]),
    .B(pp[1]),
    .Cin(1'b0),
    .Cout(),
    .Sum(sum_temp[0])
);

 //second adder to add pp[2] and pp[3]
eight_bit_adder Adder_inst_1(
    .A(pp[2]),
    .B(pp[3]),
    .Cin(1'b0),
    .Cout(),
    .Sum(sum_temp[1])
);

//third adder to add sum_temp[0] and sum_temp[1]
eight_bit_adder Adder_inst_2(
    .A(sum_temp[0]),
    .B(sum_temp[1]),
    .Cin(1'b0),
    .Cout(),
    .Sum(sum_temp[2])
);

//creating a dummy adder as fourth 8 bit adder
eight_bit_adder Adder_inst_3(
    .A(sum_temp[2]),
    .B(8'b0),
    .Cin(1'b0),
    .Cout(),
    .Sum(sum_temp[3])
);

//output of the dummy adder equals to the final output
assign Product = sum_temp[3];

endmodule