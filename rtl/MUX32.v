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
module MUX32(

    input wire [31:0]  data1_i    ,

    input wire [31:0]  data2_i    ,

    input wire         select_i   ,

    output wire [31:0] data_o     

 );


assign data_o = (select_i)? data2_i : data1_i ;



endmodule
