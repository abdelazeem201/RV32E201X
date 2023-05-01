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
module ForwardingMUX(
	input	wire	[1:0]	select_i,
    input	wire	[31:0]	data_i,
    input	wire	[31:0]	EX_MEM_i,
    input	wire	[31:0]	MEM_WB_i,
    output	reg 	[31:0]	data_o
);


always @(*) begin
	case(select_i)
        2'b00: data_o = data_i;

        2'b01: data_o = MEM_WB_i;

		2'b10: data_o = EX_MEM_i;	

        default : data_o = data_i;
	endcase
end

endmodule
