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
module HazradDetect(
    input 	wire	[4:0]	IF_IDrs1_i,
    input 	wire	[4:0]	IF_IDrs2_i,
    input 	wire	[4:0]	ID_EXrd_i,
    input 	wire	 		ID_EX_MemRead_i,
    output 	wire			Hazard_o
);

assign Hazard_o = ((ID_EX_MemRead_i && (ID_EXrd_i == IF_IDrs1_i || ID_EXrd_i == IF_IDrs2_i))? 1'b1 : 1'b0);

endmodule
