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

module EX_MEM(
	input	wire			clk_i,
	input	wire			start_i,
	input	wire	[31:0]	pc_i,
	input	wire			zero_i,
	input	wire	[31:0]	ALUResult_i,
    input	wire	[31:0]	VALUResult_i, 
	input	wire	[31:0]	RDData_i,
	input	wire	[4:0]	RDaddr_i,
	input	wire			RegWrite_i,
	input	wire			MemToReg_i,
	input	wire			MemRead_i,
	input	wire			MemWrite_i,
	input	wire	[31:0]	instr_i,
	output	reg		[31:0]	instr_o,
	output	reg		[31:0]	pc_o,
	output	reg 		 	zero_o,
	output	reg		[31:0]	ALUResult_o,
    output	reg		[31:0]	VALUResult_o, 
	output	reg		[31:0]	RDData_o,
	output	reg		[4:0]	RDaddr_o,
	output	reg				RegWrite_o,
	output	reg				MemToReg_o,
	output	reg				MemRead_o,
	output	reg				MemWrite_o
	);

always@(posedge clk_i or negedge start_i) begin
	if(~start_i) begin
		pc_o <= 0;
		zero_o <= 0;
		ALUResult_o <= 0;
        VALUResult_o <= 0; //NEW
		RDData_o <= 0;
		RDaddr_o <= 0;
		RegWrite_o <= 0;
		MemToReg_o <= 0;
		MemRead_o <= 0;
		MemWrite_o <= 0;
		instr_o	<= 0;
	end
	else begin
		pc_o <= pc_i;
		zero_o <= zero_i;
		ALUResult_o <= ALUResult_i;
        VALUResult_o <= VALUResult_i; //NEW
		RDData_o <= RDData_i;
		RDaddr_o <= RDaddr_i;
		RegWrite_o <= RegWrite_i;
		MemToReg_o <= MemToReg_i;
		MemRead_o <= MemRead_i;
		MemWrite_o <= MemWrite_i;
		instr_o    <= instr_i;
	end
end

endmodule
