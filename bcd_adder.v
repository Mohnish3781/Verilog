module full_adder (
  input a, b, cin,
  output S, cout);
  assign S = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module four_bit_adder (
  input [3:0] a, b,
  input cin,
  output [3:0] S,
  output cout);
  full_adder fa1 ( a[0], b[0], cin, S0, C1);
  full_adder fa2 ( a[1], b[1], C1, S1, C2);
  full_adder fa3 ( a[2], b[2], C2, S2, C3);
  full_adder fa4 ( a[3], b[3], C3, S3, cout);
  assign S = {S3,S2,S1,S0};
endmodule

module bcd_adder (
	input [3:0] a, b,
	input cin,
	output [3:0] S,
	output cout);
	four_bit_adder A1 ( a, b, cin, r1, c1);
	wire [3:0] t, r1;
	assign t = {1'b0,cout,cout,1'b0};
	four_bit_adder A2 ( t, r1, 0, S, c2);
	assign cout = c1 | (r1[3] & r1[2]) | (r1[3] & r1[1]) ;
endmodule
