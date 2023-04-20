# VERA Wishbone

VERA Wishbone is an adaption of Frank van den Hoef's VERA (Versatile Embedded Retro Adapter) core for 32-bit wishbone systems. The VERA Wishbone core has a pipelined Wishbone Slave port and includes several modifications to easily and efficiently interface it with a 32-bit CPU Wishbone bus master.

VERA Wishbone has been integrated into [BoxLambda](https://boxlambda.readthedocs.io/en/latest/), an FPGA-based retro-style microcomputer project.

For more information, refer to the following documents:
- [BoxLambda Documentation of the VERA Wishbone Component](https://boxlambda.readthedocs.io/en/latest/components_vera/).
- [BoxLambda Blog Post discussing the VERA Wishbone modifications relative to the original VERA Core](https://epsilon537.github.io/boxlambda/integrating-vera/).
- [The VERA Wishbone Programmer's Guide](https://github.com/epsilon537/vera_wishbone/blob/boxlambda/doc/VERA%20Programmer's%20Reference.md).
  
Currently, only the VGA graphics pipeline has been adapted. Adaptation of the other VERA video output formats, sound, and SPI controller should be straightforward but has not been completed because these features are not required by the BoxLambda project.

Many thanks to Frank van den Hoef for contributing the original VERA code base, 95% of which is being used unmodified in the VERA Wishbone repo. 
