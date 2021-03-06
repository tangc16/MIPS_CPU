module pipeline_IF(clk,reset,stall,PCSrc,ConBA,ALUOut0,ID_BusA,PC,IF_PC,JT,ForwardPC,MEM_PC);
input clk,reset,stall,ALUOut0,ForwardPC;
input [31:0]MEM_PC;
input[31:0]ConBA,ID_BusA;
input[25:0]JT;
input[2:0]PCSrc;
output reg[31:0] PC;
output [31:0]IF_PC;

assign  IF_PC = PC + 4;

wire[31:0] PC_choose;
assign PC_choose= (PCSrc==4) ?  32'h80000004:
                  stall? PC:
                  (PCSrc==0) ? 	PC+4 : //????
                  (PCSrc==1 & ALUOut0==0) ?  ConBA: //branch??
                  (PCSrc==2) ?  {PC[31:28],JT,2'b0}: //????
                  (ForwardPC==1) ? {1'b0, MEM_PC[30:0]}:
                  (PCSrc==3) ?  ID_BusA: //$ra
                  (PCSrc==5) ?  32'h80000008: PC+4;  
always @(posedge clk or posedge reset)
begin
if(reset)
PC<=32'h80000000;
else 
PC<=PC_choose;
end
endmodule
