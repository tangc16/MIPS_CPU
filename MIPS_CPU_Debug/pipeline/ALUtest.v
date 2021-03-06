`timescale 1ns/1ps
module ALUtest;
reg[31:0]A,B;
reg Sign;
reg [5:0]ALUFun;
wire[31:0]S;

ALU ALUs(.A(A),.B(B),.S(S),.Sign(Sign),.ALUFun(ALUFun));

initial
begin
A=32'd8;
B=32'h1ff;
Sign=1;
#104160 ALUFun=6'b000000;
#104160 ALUFun=6'b000001;

#104160 ALUFun=6'b011000;
#104160 ALUFun=6'b011110;
#104160 ALUFun=6'b010110;
#104160 ALUFun=6'b010001;
#104160 ALUFun=6'b011010;

#104160 ALUFun=6'b100000;
#104160 ALUFun=6'b100001;
#104160 ALUFun=6'b100011;

#104160 ALUFun=6'b110011;
#104160 ALUFun=6'b110001;
#104160 ALUFun=6'b110101;
#104160 ALUFun=6'b111101;
#104160 ALUFun=6'b111011;
#104160 ALUFun=6'b111111;
end

endmodule
