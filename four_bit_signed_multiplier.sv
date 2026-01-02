module four_bit_signed_multiplier(
    input logic signed [3:0] A, B, // 4-bit signed inputs
    output logic signed [7:0] Product // 8-bit signed output
);

    // Partial products with sign extension
    logic signed [7:0] pp [3:0]; // Array to store partial products

    // Generate partial products with sign extension
    assign pp[0] = {{4{A[3]}}, (A & {4{B[0]}})}; // Sign-extend A and multiply by B[0]
    assign pp[1] = {{3{A[3]}}, (A & {4{B[1]}}), 1'b0}; // Sign-extend A, multiply by B[1], shift left by 1
    assign pp[2] = {{2{A[3]}}, (A & {4{B[2]}}), 2'b0}; // Sign-extend A, multiply by B[2], shift left by 2
    assign pp[3] = {{1{A[3]}}, (A & {4{B[3]}}), 3'b0}; // Sign-extend A, multiply by B[3], shift left by 3

    // Intermediate sums for addition
    logic signed [7:0] sum_temp [3:0];

    // First adder: Add pp[0] and pp[1]
    eight_bit_adder Adder_inst_0(
        .A(pp[0]),
        .B(pp[1]),
        .Cin(1'b0),
        .Cout(),
        .Sum(sum_temp[0])
    );

    // Second adder: Add pp[2] and pp[3]
    eight_bit_adder Adder_inst_1(
        .A(pp[2]),
        .B(pp[3]),
        .Cin(1'b0),
        .Cout(),
        .Sum(sum_temp[1])
    );

    // Third adder: Add sum_temp[0] and sum_temp[1]
    eight_bit_adder Adder_inst_2(
        .A(sum_temp[0]),
        .B(sum_temp[1]),
        .Cin(1'b0),
        .Cout(),
        .Sum(sum_temp[2])
    );

    // Dummy adder 
    eight_bit_adder Adder_inst_3(
        .A(sum_temp[2]),
        .B(8'b0),
        .Cin(1'b0),
        .Cout(),
        .Sum(sum_temp[3])
    );

    // Final product assignment
    assign Product = sum_temp[3];

endmodule