module eight_bit_adder #(parameter N=8) // creating a parameterized module. since, this is 8-bit adder N=8.
(
    input logic [N-1:0]A, B, 
    input logic Cin,
    output logic [N-1:0]Sum,
    output logic Cout
);

logic [N:0] Carry_wire; // creating internal wires for connect the carry out of each adder to Carry in of the next adder.

assign Carry_wire[0] = Cin; //assign the innitial carry in value

genvar i; 
generate // start of generation block
for(i=0;i<N;i=i+1) begin : FA
    one_bit_adder FA_inst(
        .A(A[i]),
        .B(B[i]),
        .Cin(Carry_wire[i]),
        .Sum(Sum[i]),
        .Cout(Carry_wire[i+1])
    );

end
endgenerate

assign Cout = Carry_wire[N];

endmodule 