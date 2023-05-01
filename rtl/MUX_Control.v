////                                                              ////
////  RISC-V Designe                                              ////
////                                                              ////
////  https://github.com/Abdelazeem201                            ////
////                                                              ////
////  Description                                                 ////
////  Designed RTL of RISC-V system in Verilog                    ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////      - Ahmed Abdelazeen, ahmed-abdelazeem@outlook.com        ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
module MUX_Control(
    input 	wire 		Hazard_i, 
    input 	wire [4:0]	RegDst_i,  
    input   wire [1:0]		 ALUOp_i, 
    input 	wire 		ALUSrc_i,  
    input 	wire 		RegWrite_i, 
    input 	wire 		MemToReg_i, 
    input 	wire 		MemRead_i,
    input 	wire 		MemWrite_i,
    output 	reg [4:0]	RegDst_o,  
    output	reg [1:0]	ALUOp_o , 
    output	reg 		ALUSrc_o,  
    output	reg  		RegWrite_o, 
    output	reg  		MemToReg_o, 
    output	reg  		MemRead_o,
    output	reg  		MemWrite_o  
);

always@(*)begin
    case(Hazard_i)
    1'b1 : begin
    RegDst_o <= 4'b0000;  
    ALUOp_o <= 2'b00;
    ALUSrc_o <= 1'b0; 
    RegWrite_o <= 1'b0;
    MemToReg_o <= 1'b0;
    MemRead_o <= 1'b0;
    MemWrite_o <= 1'b0;
    end

    1'b0 : begin
    RegDst_o <= RegDst_i;  
    ALUOp_o <= ALUOp_i;
    ALUSrc_o <= ALUSrc_i; 
    RegWrite_o <= RegWrite_i;
    MemToReg_o <= MemToReg_i;
    MemRead_o <= MemRead_i;
    MemWrite_o <= MemWrite_i;
    end

    default : begin
    RegDst_o <= RegDst_i;  
    ALUOp_o <= ALUOp_i;
    ALUSrc_o <= ALUSrc_i; 
    RegWrite_o <= RegWrite_i;
    MemToReg_o <= MemToReg_i;
    MemRead_o <= MemRead_i;
    MemWrite_o <= MemWrite_i;
    end

    endcase

end
endmodule
