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
module Registers
 (
	input  wire        clk_i,
	input  wire        reset,
	input  wire [4:0]  op_address,
	input  wire [4:0]  RSaddr_i,
	input  wire [4:0]  RTaddr_i,
	input  wire [4:0]  RDaddr_i,
	input  wire [31:0] RDdata_i,
	input  wire        RegWrite_i,
	input  wire [3:0]  is_pos_i,
	output wire [31:0] RSdata_o, 
	output wire [31:0] RTdata_o,
	output wire [31:0] reg_o,
	output wire [3:0]  pos_o
 );

// Register File
reg     [31:0]      register        [0:31];
reg     [3:0]       pos             [0:31];
// Read Data      
assign  RSdata_o = register[RSaddr_i];
assign  RTdata_o = register[RTaddr_i];
assign  reg_o    = register[op_address];
assign  pos_o    = pos[op_address];
// Write Data
integer i;
always@(negedge clk_i or posedge reset)begin
    if(reset) begin
        for(i=0;i<32;i=i+1)register[i] <= 0;
        for(i=0;i<32;i=i+1)pos[i]      <= 0;
    end  

    else  begin
        if(RegWrite_i)begin
            register[RDaddr_i] <= RDdata_i;
            pos[RDaddr_i]      <= is_pos_i;
        end
    end      
end
   
endmodule 
