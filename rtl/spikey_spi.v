`timescale 1ns/1ns
`default_nettype none
module spikey_spi (	input wire FCLK,
                    input wire RST,
                    output reg [3:0] fclk_div,
                    output wire [3:0] fclk_div_np,
                    output wire [3:0] fclk_div_pp);

    always@(posedge FCLK) begin
        if(RST) begin
            fclk_div[3:0] <= 4'b0;
        end
        else begin
            fclk_div[3:0] <= fclk_div[3:0] + 1'b1;
        end
    end

    assign fclk_div_np[0] = FCLK & ~fclk_div[0] & ~RST;
    assign fclk_div_np[1] = fclk_div_np[0] & ~fclk_div[1];
    assign fclk_div_np[2] = fclk_div_np[1] & ~fclk_div[2];
    assign fclk_div_np[3] = fclk_div_np[2] & ~fclk_div[3];

    assign fclk_div_pp[0] = FCLK & fclk_div[0] & ~RST;
    assign fclk_div_pp[1] = fclk_div_np[0] & fclk_div[1];
    assign fclk_div_pp[2] = fclk_div_np[1] & fclk_div[2];
    assign fclk_div_pp[3] = fclk_div_np[2] & fclk_div[3];

endmodule
