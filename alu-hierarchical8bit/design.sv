// Code your design here

//8-Bit ALU

module alu8(a,b,opcode,out);
  input [7:0] a,b;
  input [2:0] opcode;
  output reg [7:0] out;
  wire c_out,b_out;
  wire [2:0] op_main;
  wire op;
  assign op_main = opcode[2:1];
  assign op = opcode[0];

  wire [7:0] adder_out,subtractor_out,logic_out,shift_out;
  
  
  adder u1(.a(a),.b(b),.c_in(op),.sum(adder_out),.c_out(c_out));
  subtractor u2(.a(a), .b(b), .b_in(op), .difference(subtractor_out),.b_out(b_out));
  logicoperations u3(.a(a),.b(b),.sel({2'b00, op}),.out(logic_out));
  shiftoperations u4(.a(a),.opt({1'b0, op}),.result(shift_out));
  
  always @(*) begin
    case (op_main)
      2'b00: out = adder_out;
      2'b01: out = subtractor_out;
      2'b10: out = logic_out;
      2'b11: out = shift_out;
      default: out = 8'b0;
    endcase
    
  end
endmodule



//8-Bit Adder
module adder(a,b,c_in,sum,c_out);
  input [7:0] a,b;
  input c_in;
  output [7:0] sum;
  output c_out;
  assign {c_out,sum} = a + b + c_in;
  
endmodule

//8-bit subtractor

module subtractor (a,b,b_in,difference,b_out);
  input [7:0] a,b;
  input b_in;
  output [7:0] difference;
  output b_out;
  assign {b_out,difference} = {1'b0,a} - b - b_in;
endmodule

//Logic Operators

module logicoperations (a,b,sel,out);
  input [7:0] a,b;
  input [2:0] sel;
  output reg [7:0] out;
  
always @(*) begin
    case (sel)
      3'b000: out = a & b;
      3'b001: out = a | b;
      3'b010: out = ~a;
      3'b011: out = ~b;
      3'b100: out = a ^ b;
      3'b101: out = a ~^ b;
      default: out = 8'b0;
    endcase
  end
endmodule
//Shift Register

module shiftoperations (a,opt,result);
  input [7:0] a;
  input [1:0] opt;
  output reg [7:0] result;
  always @(*) begin
    case (opt)
      2'b00: result = a<<1;
      2'b01: result = a>>1;
      default:result = 8'b0;
    endcase
  end
endmodule