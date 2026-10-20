module half_adder(
  input a, b,
  output S, C );
  assign S = a ^ b;
  assign C = a & b;
endmodule

module two_cross_two_multiplier (
	input [1:0] A, B,
	output [3:0] C);
	assign c0 = A[0] & B[0];
	half_adder ha1 ( A[0]&B[1], A[1]&B[0], c1, co);
	half_adder ha2 ( A[1]&B[1], co, c2, c3);
	assign C = {c3, c2, c1, c0};
endmodule
