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

module PC
 (
    input  wire             clk_i,
	input  wire             start_i, hazardpc_i,
	input  wire [31:0]      pc_i,
	output reg  [31:0]      pc_o
 );
// Wires & Registers
reg     flag,flag_next;

always@(*)begin
    if(pc_i == 32'd248)flag_next = 1;
    else flag_next = flag;
end

always@(posedge clk_i or negedge start_i) begin
    if(~start_i) begin
        pc_o <= 32'b0;
        flag <= 0;
    end
    else begin
        flag <= flag_next;
        if(start_i & (!hazardpc_i))
            pc_o <= (flag)? 32'd248 : pc_i ;
        else
            pc_o <= pc_o;
    end
end

endmodule
