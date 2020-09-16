#
# tilelink_spikey Makefile
# Author: Soumil Krishnanand Heble
#

## Use Configurable Make Variables
RTL_FILES = spikey_spi.v
TB_FILE = spikey_spi_tb.v

## Convenience Make Variables
RTL_DIR = ../rtl
TB_DIR = ../tb
RTL_LIST = $(addprefix $(RTL_DIR)/,$(RTL_FILES))
TB_ENAME = $(basename $(TB_FILE))
TBW_ENAME = $(addprefix w_,$(TB_ENAME))

.PHONY: clean run wrun

$(TB_ENAME): $(RTL_LIST) $(TB_DIR)/$(TB_FILE)
	iverilog -o $@ $^

$(TBW_ENAME): $(RTL_LIST) $(TB_DIR)/$(TB_FILE)
	iverilog -DDUMP_VCD -DVCD_NAME='"$(TB_ENAME).vcd"' -o $@ $^

run: $(TB_ENAME)
	vvp $^

wrun: $(TBW_ENAME)
	vvp $^ -lxt2

$(TB_ENAME).vcd: wrun

vwaves: $(TB_ENAME).vcd
	gtkwave $^

clean:
	@rm $(TB_ENAME) $(TBW_ENAME) $(TB_ENAME).vcd 2>/dev/null || true
