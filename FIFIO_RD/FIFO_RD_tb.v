`timescale 1ns / 1ps

module FIFO_RD_tb ();

/////////////////////////////////////////////////////
//////////////////clk_generator//////////////////////
/////////////////////////////////////////////////////

parameter clk_period= 20; 
reg r_clk_tb=0; 
always #(clk_period/2) r_clk_tb = ~r_clk_tb;

/////////////////////////////////////////////////////
///////////////Decleration & Instances///////////////
/////////////////////////////////////////////////////

reg		        r_inc_tb;
reg	         	r_rst_tb;
reg     [3:0]	w_ptr_tb; 
wire	[2:0]	r_addr_tb; 
wire	[3:0]	r_ptr_tb; 
wire			r_empty_tb;

 FIFO_RD DUT (
		.r_inc(r_inc_tb),
		.r_rst(r_rst_tb),
		.r_clk(r_clk_tb),
		.gray_w_ptr(w_ptr_tb),
		.r_addr(r_addr_tb),
		.gray_r_ptr(r_ptr_tb),
		.r_empty(r_empty_tb)
		);


/////////////////////////////////////////////////////
///////////////////Initial Block/////////////////////
/////////////////////////////////////////////////////

initial begin 
	$dumpfile("FIFO_RD.vcd"); 
	$dumpvars; 
	reset() ;
	#(clk_period);
	
	w_ptr_tb = 4'b1010;
	r_inc_tb = 1;

end 

/////////////////////////////////////////////////////
//////////////////////Tasks//////////////////////////
/////////////////////////////////////////////////////

task reset;
 begin
 r_rst_tb=1;
 #(clk_period)
 r_rst_tb=0;
 #(clk_period)
 r_rst_tb=1;
 end
endtask


endmodule