# Tilelink Spikey
An SPI/QPI memory controller for ESP PSRAM64H with a Tilelink (Uncached Light, TL-UL) slave agent. This IP is being developed to be a part of a RISC-V CPU/SoC.

## IP Design
There are three major blocks in this design: Tilelink (TL-UL) slave agent that services requests from a Tilelink master. An SPI/QPI memory controller that implements the command sequence for ESP PSRAM64H read/write. This will interface with a generic configurable SPI/QPI master that actually implements the signal logic.

### Tilelink
1. Handle one Tilelink request at a time - Handle all variants of RISC-V load/stores (1-8 bytes).
2. Buffer multiple Tilelink requests
3. Coalesce multiple Tilelink requests of same type in a single SPI request if they're to the same page and ACK request in order.
4. QoS based on Tilelink address space properties

### ESP PSRAM64H QPI/SPI Memory Controller
1. Generic SPI read/write support
2. Fast SPI read/write support
3. QPI read/write support

### Generic QPI/SPI Master
1. SPI master with configurable SCK = FCLK/2/4/8/16/32/64/128/256, CPOL, CPHA and variable size read/writes
2. QPI master implementation

## Resources
1. [Tilelink Specification v1.8.0](https://sifive.cdn.prismic.io/sifive%2Fcab05224-2df1-4af8-adee-8d9cba3378cd_tilelink-spec-1.8.0.pdf)
2. [Tilelink Specification v1.8.1](https://sifive.cdn.prismic.io/sifive/7bef6f5c-ed3a-4712-866a-1a2e0c6b7b13_tilelink_spec_1.8.1.pdf)
3. [Serial Peripheral Interface](https://en.wikipedia.org/wiki/Serial_Peripheral_Interface#Quad_SPI)
