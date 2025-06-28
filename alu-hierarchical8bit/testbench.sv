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
  integer fd;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, alu8_tb);
    
    
    // Open a file to write output
    fd = $fopen("alu_output.txt", "w");
    if (fd == 0) begin
      $display("Error opening file!");
      $finish;
    end

    // Write column headers
    $fwrite(fd, "Time, A, B, Opcode, Out\n");

    //$monitor("Time=%0t | a=%b, b=%b | opcode=%b | out=%b", 
             // $time, a, b, opcode, out);

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
      #1 $fwrite(fd, "%0t, %0d, %0d, %0d, %0d\n", $time, a, b, opcode, out);
    end

    // Edge case 3: A = alternating, B = alternating
    a = 8'b10101010;
    b = 8'b01010101;
    for (i = 0; i < 8; i = i + 1) begin
      #5 opcode = i;
      #1 $fwrite(fd, "%0t, %0d, %0d, %0d, %0d\n", $time, a, b, opcode, out);
    end

    // Random test cases
    for (i = 0; i < 8; i = i + 1) begin
      #5;
      a = $random & 8'hFF;
      b = $random & 8'hFF;
      opcode = i;
      #1 $fwrite(fd, "%0t, %0d, %0d, %0d, %0d\n", $time, a, b, opcode, out);
    end
    
    $fclose(fd); // Close the file

    #10 $finish;
  end

endmodule

