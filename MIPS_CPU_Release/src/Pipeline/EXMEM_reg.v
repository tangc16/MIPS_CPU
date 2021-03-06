module EXMEM_reg(clk,reset,
                 EX_ALUout,Mem_in,
                 EX_MemWr,Mem_MemWr,
                 EX_MemRd,Mem_MemRd,
                 EX_BusB,Mem_BusB,
                 EX_RegWr,Mem_RegWr,
                 EX_MemtoReg,Mem_MemtoReg,
                 EX_RegDst,Mem_RegDst,
                 EX_WrReg,Mem_WrReg,
                 EX_PC,Mem_PC,
                 EX_rt,Mem_rt,
                 EXcontrol_jal,Memcontrol_jal);
input clk,reset,EX_MemWr,EX_MemRd,EX_RegWr;
input[31:0]EX_ALUout,EX_BusB;
input [30:0]EX_PC;
input[1:0]EX_MemtoReg,EX_RegDst;
input[4:0]EX_WrReg,EX_rt;
input EXcontrol_jal;
output reg Memcontrol_jal;
output reg[4:0]Mem_WrReg,Mem_rt;
output reg[1:0]Mem_MemtoReg,Mem_RegDst;
output reg Mem_MemWr,Mem_MemRd,Mem_RegWr;
output reg [31:0]Mem_in,Mem_BusB;
output reg [30:0] Mem_PC;

always@(posedge clk or posedge reset) begin
    if(reset) begin
        Mem_MemWr<=0;
        Mem_MemRd<=0;
        Mem_in<=0;
        Mem_BusB<=0;
        Mem_MemtoReg<=0;
        Mem_WrReg<=0;
        Mem_RegWr<=0;
        Mem_RegDst<=0;
        Mem_PC<=31'b0;
        Mem_rt<=0;
        Memcontrol_jal<=0;
    end
    else begin
        Mem_MemWr<=EX_MemWr;
        Mem_MemRd<=EX_MemRd;
        Mem_in<=EX_ALUout;
        Mem_BusB<=EX_BusB;
        Mem_MemtoReg<=EX_MemtoReg;
        Mem_WrReg<=EX_WrReg;
        Mem_RegWr<=EX_RegWr;
        Mem_RegDst<=EX_RegDst;
        Mem_PC<=EX_PC;
        Mem_rt<=EX_rt;
        Memcontrol_jal<=EXcontrol_jal;
    end
end
endmodule
