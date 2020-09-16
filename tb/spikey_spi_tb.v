`timescale 1ns/1ns
`default_nettype none

module tb;
    reg FCLK;
    reg RST;
    reg rst_div;
    wire [3:0] fclk_div;
    wire [3:0] fclk_div_np;
    wire [3:0] fclk_div_pp;

    spikey_spi DUT (	.FCLK(FCLK),
                    	.RST(RST),
                    	.rst_div(rst_div),
                    	.fclk_div(fclk_div),
                    	.fclk_div_np(fclk_div_np),
                    	.fclk_div_pp(fclk_div_pp));
    
    always #5 FCLK = ~FCLK;

    initial begin
        `ifdef DUMP_VCD
            $dumpfile(`VCD_NAME);
            $dumpvars(0, tb);
        `endif
        FCLK = 0;
        RST = 1;
        rst_div = 0;
        #25 RST = 0;
        #640 rst_div = 1;
        #10 rst_div = 0;
        #640 $finish;
    end

endmodule
