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
module Sign_Extend(  
	input  wire [11:0] data0_i,data1_i,
	input  wire select_i,
	output wire [31:0] data_o
	);

assign data_o = (select_i)? {{20{data1_i[11]}},data1_i} : {{20{data0_i[11]}},data0_i} ; 

endmodule