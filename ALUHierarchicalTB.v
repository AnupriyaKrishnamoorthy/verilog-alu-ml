// Code your testbench here
// or browse Examples
module alu8_tb;

  // Inputs
  reg [7:0] a, b;
  reg [2:0] opcode;
  wire [7:0] out;
  
  // Instantiate ALU
  alu8 alu8(.a(a), .b(b), .opcode(opcode), .out(out));

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, alu8_tb);

    $monitor("Time=%0t | a=%b, b=%b | opcode=%b | out=%b", 
              $time, a, b, opcode, out);

	// Edge case 1: A = 0, B = 0
    a = 8'b00000000;
    b = 8'b00000000;
    for (i = 0; i < 8; i = i + 1) begin
      #5 opcode = i;
    end

    // Edge case 2: A = 255, B = 255
    a = 8'b11111111;
    b = 8'b11111111;
    for (i = 0; i < 8; i = i + 1) begin
      #5 opcode = i;
    end

    // Edge case 3: A = alternating, B = alternating
    a = 8'b10101010;
    b = 8'b01010101;
    for (i = 0; i < 8; i = i + 1) begin
      #5 opcode = i;
    end

    // Random test cases
    for (i = 0; i < 8; i = i + 1) begin
      #5;
      a = $random & 8'hFF;
      b = $random & 8'hFF;
      opcode = i;
    end

    #10 $finish;
  end

endmodule

