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

module four_cross_three_multiplier (
	input [2:0] A,
	input [3:0] B,
	output [6:0] C);
	wire [3:0] M0, M1, M2, M3, S1, S2;
	assign M0 = { 1'b0, A[0]&B[3], A[0]&B[2], A[0]&B[1]};
	assign M1 = { A[1]&B[3], A[1]&B[2], A[1]&B[1], A[1]&B[0]};
	assign M2 = { A[2]&B[3], A[2]&B[2], A[2]&B[1], A[2]&B[0]};
	four_bit_adder (M0, M1, 1'b0, S1, co1);
	assign M3 = {co1, S1[3], S1[2], S1[1]};
	four_bit_adder (M2, M3, 1'b0, S2, co2);
	assign C = {co2, S2, S1[0], A[0]&B[0]};
endmodule
