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

module VALU_ctrl (	
	input 	wire	[9:0]	vfunct_i, 
	output 	reg		[2:0]	VALUCtrl_o
	);

    always @(*) begin
        case (vfunct_i)
            10'b000000_1_001: begin
                VALUCtrl_o = 3'b010; //vector addition
            end 
            10'b010000_1_000: begin
                VALUCtrl_o = 3'b110; //vector subtraction
            end
            10'b000000_1_111: begin
                VALUCtrl_o = 3'b000; //scalar multiplication
            end
            10'b000000_1_110: begin
                VALUCtrl_o = 3'b001; //dot product
            end
            default: begin
                VALUCtrl_o = 3'b000;
            end
        endcase
    end
endmodule
