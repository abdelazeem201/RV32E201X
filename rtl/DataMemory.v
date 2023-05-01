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
module Data_Memory
 (   
    input  wire 		clk_i,
    input  wire 		reset,
    input  wire [4:0] 	op_addr,
    input  wire [31:0] 	addr_i,
    input  wire [31:0] 	data_i,
    input  wire        	MemWrite_i,
    input  wire 		MemRead_i,
	output wire [31:0] 	data_o,
	output wire [31:0] 	data_mem_o
 );





integer i;


reg [7:0] memory [0:31];
wire [31:0] op;

assign op = { memory[addr_i + 3],memory[addr_i + 2],
memory[addr_i + 1],memory[addr_i]};

assign data_mem_o = { memory[op_addr + 3],memory[op_addr + 2],
memory[op_addr + 1],memory[op_addr]};

assign data_o = (MemRead_i) ? op : 32'b0;

always @(posedge clk_i or posedge reset) begin

    if(reset)for(i=0;i<32;i=i+1)memory[i] <= 0;
     else if(MemWrite_i) begin
            memory[addr_i + 3] <= data_i[31:24];
            memory[addr_i + 2] <= data_i[23:16];
            memory[addr_i + 1] <= data_i[15:8];
            memory[addr_i]     <= data_i[7:0];
        end
end

endmodule

