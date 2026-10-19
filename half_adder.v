module half_adder(
  input a, b,
  output S, C );
  assign S = a ^ b;
  assign C = a & b;
endmodule
