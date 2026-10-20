module full_adder (
  input a, b, cin,
  output S, cout);
  assign S = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module four_bit_adder_subtractor (
  input [3:0] a, b,
  input cin,
  output [4:0] S);
  full_adder fa1 ( a[0], (b[0] ^ cin), cin, S0, C1);
  full_adder fa2 ( a[1], (b[1] ^ cin), C1, S1, C2);
  full_adder fa3 ( a[2], (b[2] ^ cin), C2, S2, C3);
  full_adder fa4 ( a[3], (b[3] ^ cin), C3, S3, cout);
  assign S = {cout,S3,S2,S1,S0};
endmodule
