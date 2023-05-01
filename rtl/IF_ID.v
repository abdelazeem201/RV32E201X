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
module IF_ID(
	input	wire		clk_i,
	input	wire		start_i,
	input	wire [31:0] pc_i,
	input	wire [31:0] inst_i,
	input	wire		hazard_i,
	input	wire		flush_i,
	input	wire [11:0] pcIm_i,
	output	reg	 [11:0] pcIm_o,
	output	reg	 [31:0] pc_o,
	output	reg	 [31:0] inst_o
	);

always@(posedge clk_i) begin
	if(~start_i) begin
		pc_o <= 32'b0;
		inst_o <= 32'b0;
		pcIm_o <= 12'b0;
	end
	else if(flush_i) begin
		pc_o <= pc_i;
		inst_o <= 32'b0;
		pcIm_o <= 12'b0;
	end
	else if(hazard_i) begin
		pc_o <= pc_i;
		inst_o <= inst_o;
		pcIm_o <= pcIm_i;
	end
	else begin
		pc_o <= pc_i;
		inst_o <= inst_i;
		pcIm_o <= pcIm_i;
	end
end

endmodule


