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
module Control(
    input	wire	[6:0]	Op_i,
    output 	reg		[1:0]   ALUOp_o,
    output  reg      		ALUSrc_o,
    output  reg      		RegWrite_o ,
    output  reg      		MemRd_o,
    output  reg      		MemWr_o,
    output  reg      		MemToReg_o,
    output  reg      		immSelect_o
);

always@(*)begin

  case(Op_i)

  7'b0010011 : begin //addi
  ALUOp_o = 2'b11;
  ALUSrc_o = 1'b1;
  RegWrite_o = 1'b1;
  MemRd_o = 1'b0;
  MemWr_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b0;
  end
  
  7'b0110011 : begin //others
  ALUOp_o = 2'b10;
  ALUSrc_o = 1'b0;
  RegWrite_o = 1'b1;
  MemRd_o = 1'b0;
  MemWr_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b0;
  end

  7'b1100011 : begin //beq
  ALUOp_o = 2'b01;
  ALUSrc_o = 1'b1;
  RegWrite_o = 1'b0;
  MemRd_o = 1'b0;
  MemWr_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b0;
  end

  7'b0000011 : begin //lw
  ALUOp_o = 2'b00;
  ALUSrc_o = 1'b1;
  MemRd_o = 1'b1;
  MemToReg_o = 1'b1;
  RegWrite_o = 1'b1;
  MemWr_o = 1'b0;
  immSelect_o = 1'b0;
  end

  7'b0100011 : begin //sw
  ALUOp_o = 2'b00;
  ALUSrc_o = 1'b1;
  MemWr_o = 1'b1;
  RegWrite_o = 1'b0;
  MemRd_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b1;
  end

  //---------NEW-----------
  7'b1010111: begin //vector
  ALUOp_o = 2'b00; //useless
  ALUSrc_o = 1'b0;
  RegWrite_o = 1'b1;
  MemRd_o = 1'b0;
  MemWr_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b0;
  end
  //---------NEW-----------

  default : begin
  ALUOp_o = 2'b11;
  ALUSrc_o = 1'b1;
  RegWrite_o = 1'b0;
  MemRd_o = 1'b0;
  MemWr_o = 1'b0;
  MemToReg_o = 1'b0;
  immSelect_o = 1'b0;
  end
  endcase
end
endmodule
