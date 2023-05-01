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
module MEM_WB(
	input 	wire 			clk_i,
	input 	wire 			start_i,
	input	wire	[31:0]	ALUResult_i,
	input	wire	[31:0]	RDData_i,
	input	wire	[4:0]	RDaddr_i,
	input 	wire 			RegWrite_i,
	input 	wire 			MemToReg_i,
	input	wire	[31:0]	DataMemReadData_i,
	output	reg		[31:0]	ALUResult_o,
	output	reg		[31:0]	RDData_o,
	output	reg		[4:0]	RDaddr_o,
	output	reg				RegWrite_o,
	output	reg				MemToReg_o,
	output	reg		[31:0]	DataMemReadData_o
);

always@(posedge clk_i or negedge start_i) begin
	if(~start_i) begin
		ALUResult_o <= 0;
		RDData_o <= 0;
		RDaddr_o <= 0;
		RegWrite_o <= 0;
		MemToReg_o <= 0;
		DataMemReadData_o<=0;
	end
	else begin
		ALUResult_o <= ALUResult_i;
		RDData_o <= RDData_i;
		RDaddr_o <= RDaddr_i;
		RegWrite_o <= RegWrite_i;
		MemToReg_o <= MemToReg_i;
		DataMemReadData_o <= DataMemReadData_i;
	end
end

endmodule






