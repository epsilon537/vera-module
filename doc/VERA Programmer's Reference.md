# VERA_Wishbone Programmer's Reference

Version 0.1

_Author: Epsilon/Ruben Lysens. Original Author: Frank van den Hoef_

This document describes the **Wishbone** fork of **V**ersatile **E**mbedded **R**etro **A**dapter or VERA. *VERA_Wishbone* is a retro-style 2D Video Core with a 32-bit Wishbone slave interface for easy integration into Wishbone-based SoCs. 

Features:
  - VGA output format at a fixed resolution of 640x480@60Hz
  - Support for 2 layers, both supporting either tile or bitmap mode.
  - Support for 2 banks of 64 sprites, max. 512 sprite pixels per scanline.
  - Configurable Embedded video RAM size of up to 128kB.
  - Palette with 256 colors selected from a total range of 4096 colors.

# Registers

All registers are 32-bit wide, but higher order bits 31-12 are currently not in use.

<table>
	<tr>
		<th>Addr</th>
		<th>Name</th>
		<th>31-12</th>
		<th>11</th>
		<th>10</th>
		<th>9</th>
		<th>8</th>
		<th>7</th>
		<th>6</th>
		<th>5 </th>
		<th>4</th>
		<th>3 </th>
		<th>2</th>
		<th>1 </th>
		<th>0</th>
	</tr>
	<tr>
		<td>$00</td>
		<td>CTRL</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">SBNK</td>
	</tr>
	<tr>
		<td>$04</td>
		<td>DC_BORDER</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="8" align="center">Border Color</td>
	</tr>
	<tr>
		<td>$08</td>
		<td>IEN</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">SPRCOL</td>
		<td colspan="1" align="center">LINE</td>
		<td colspan="1" align="center">VSYNC</td>
	</tr>
	<tr>
		<td>$0C</td>
		<td>ISR</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="4" align="center">Sprite collissions</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">SPRCOL</td>
		<td colspan="1" align="center">LINE</td>
		<td colspan="1" align="center">VSYNC</td>
	</tr>
	<tr>
		<td>$10</td>
		<td>IRQLINE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">IRQ line</td>
	</tr>
	<tr>
		<td>$14</td>
		<td>SCANLINE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">Scan line</td>
	</tr>
	<tr>
		<td>$18</td>
		<td>DC_VIDEO</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">Sprites Enable</td>
		<td colspan="1" align="center">Layer1 Enable</td>
		<td colspan="1" align="center">Layer0 Enable</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="2" align="center">Output Mode</td>
	</tr>
	<tr>
		<td>$20</td>
		<td>DC_HSCALE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="8" align="center">Active Display H-Scale</td>
	</tr>
	<tr>
		<td>$24</td>
		<td>DC_VSCALE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="8" align="center">Active Display V-Scale</td>
	</tr>
	<tr>
		<td>$28</td>
		<td>DC_HSTART</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">Active Display H-Start</td>
	</tr>
	<tr>
		<td>$2C</td>
		<td>DC_HSTOP</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">Active Display H-Stop</td>
	</tr>
	<tr>
		<td>$30</td>
		<td>DC_VSTART</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">Active Display V-Start</td>
	</tr>
	<tr>
		<td>$34</td>
		<td>DC_VSTOP</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="10" align="center">Active Display V-Stop</td>
	</tr>
	<tr>
		<td>$40</td>
		<td>L0_CONFIG</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="2" align="center">Map Height</td>
		<td colspan="2" align="center">Map Width</td>
		<td colspan="1" align="center">T256C</td>
		<td colspan="1" align="center">Bitmap Mode</td>
		<td colspan="2" align="center">Color Depth</td>
	</tr>
	<tr>
		<td>$44</td>
		<td>L0_MAPBASE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="8" align="center">Map Base Address (16:9)</td>
	</tr>
	<tr>
		<td>$48</td>
		<td>L0_TILEBASE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="6" align="center">Tile Base Address (16:11)</td>
		<td colspan="1" align="center">Tile Height</td>
		<td colspan="1" align="center">Tile Width</td>
	</tr>
	<tr>
		<td>$50</td>
		<td>L0_HSCROLL</td>
		<td colspan="1" align="center">-</td>
		<td colspan="12" align="center">H-Scroll</td>
	</tr>
	<tr>
		<td>$54</td>
		<td>L0_VSCROLL</td>
		<td colspan="1" align="center">-</td>
		<td colspan="12" align="center">V-Scroll</td>
	</tr>
	<tr>
		<td>$80</td>
		<td>L1_CONFIG</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="2" align="center">Map Height</td>
		<td colspan="2" align="center">Map Width</td>
		<td colspan="1" align="center">T256C</td>
		<td colspan="1" align="center">Bitmap Mode</td>
		<td colspan="2" align="center">Color Depth</td>
	</tr>
	<tr>
		<td>$84</td>
		<td>L1_MAPBASE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="8" align="center">Map Base Address (16:9)</td>
	</tr>
	<tr>
		<td>$88</td>
		<td>L1_TILEBASE</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="1" align="center">-</td>
		<td colspan="6" align="center">Tile Base Address (16:11)</td>
		<td colspan="1" align="center">Tile Height</td>
		<td colspan="1" align="center">Tile Width</td>
	</tr>
	<tr>
		<td>$90</td>
		<td>L1_HSCROLL</td>
		<td colspan="1" align="center">-</td>
		<td colspan="12" align="center">H-Scroll</td>
	</tr>
	<tr>
		<td>$94</td>
		<td>L1_VSCROLL</td>
		<td colspan="1" align="center">-</td>
		<td colspan="12" align="center">V-Scroll</td>
	</tr>
</table>

## VERA address space layout

Relative to VERA's Base Address:

| Address range   | Description       |
| --------------- | ----------------- |
| $00000 - $00100 | VERA Registers    |
| $01000 - $01400 | Sprite attributes |
| $02000 - $02200 | Palette           |
| $40000 - $60000 | Video RAM (128KB) |

**_Important notes:_**
- **_Palette and Sprite attributes locations are write-only._**
- **_The Video RAM always starts at $40000. The address range depends on the amount of Video RAM set by the VRAM_SIZE_BYTES macro. The range $40000-$60000 corresponds to a VRAM_SIZE_BYTES setting of (128*1024), i.e. 128KB._**

## Video RAM access

Unlike the original VERA implementation, in the VERA_Wishbone repo, Video RAM is memory mapped. The indirect access method via the VERA register interface from the original VERA implementation has been removed.

## Interrupts

Interrupts will be generated for the interrupt sources set in the lower 4 bits of **IEN**.
**ISR** will indicate the interrupts that have occurred. Writing a 1 to one of the lower 3 bits in **ISR** will clear that interrupt status.

**IRQ_LINE** specifies at which scan line the **LINE** interrupt will be generated.

**SCANLINE** indicates the current scanline being sent to the screen. The value is 0 during the first visible line and 479 during the last. This value continues to count beyond the last visible line, up to 524. Note that VERA renders lines ahead of scanout such that line 1 is being rendered while line 0 is being scanned out. Visible changes may be delayed one scanline because of this.

The upper 4 (read-only) bits of the **ISR** register contain the [sprite collisions](#sprite-collisions) as determined by the sprite renderer.

## Display composer

The display composer is responsible of combining the output of the 2 layer renderers and the sprite renderer into the image that is sent to the video output.

The video output mode can be selected using OUT_MODE in DC_VIDEO. The VERA_Wishbone repo only supports VGA output mode.

| OUT_MODE | Description                                        |
| -------: | -------------------------------------------------- |
|        0 | Video disabled                                     |
|        1 | VGA output                                         |

Setting **'Layer0 Enable'** / **'Layer1 Enable'** / **'Sprites Enable'** will respectively enable output from layer0 / layer1 and the sprites renderer.

**DC_HSCALE** and **DC_VSCALE** will set the fractional scaling factor of the active part of the display. Setting this value to 128 will output 1 output pixel for every input pixel. Setting this to 64 will output 2 output pixels for every input pixel.

**DC_BORDER** determines the palette index which is used for the non-active area of the screen.

**DC_HSTART**/**DC_HSTOP** and **DC_VSTART**/**DC_VSTOP** determines the active part of the screen. The values here are specified in the native 640x480 display space. HSTART=0, HSTOP=640, VSTART=0, VSTOP=480 will set the active area to the full resolution.

## Layer 0/1 registers

**'Map Base Address'** specifies the base address of the tile map. _Note that the register only specifies bits 16:9 of the address, so the address is always aligned to a multiple of 512 bytes._

**'Tile Base Address'** specifies the base address of the tile data. _Note that the register only specifies bits 16:11 of the address, so the address is always aligned to a multiple of 2048 bytes._

**'H-Scroll'** specifies the horizontal scroll offset. A value between 0 and 4095 can be used. Increasing the value will cause the picture to move left, decreasing will cause the picture to move right.

**'V-Scroll'** specifies the vertical scroll offset. A value between 0 and 4095 can be used. Increasing the value will cause the picture to move up, decreasing will cause the picture to move down.

**'Map Width'**, **'Map Height'** specify the dimensions of the tile map:

| Value | Map width / height |
| ----: | ------------------ |
|     0 | 32 tiles           |
|     1 | 64 tiles           |
|     2 | 128 tiles          |
|     3 | 256 tiles          |

**'Tile Width'**, **'Tile Height'** specify the dimensions of a single tile:

| Value | Tile width / height |
| ----: | ------------------- |
|     0 | 8 pixels            |
|     1 | 16 pixels           |

In bitmap modes, the **'H-Scroll (11:8)'** register bits are used to specify the palette offset for the bitmap.

### Layer display modes

The features of the 2 layers are the same. Each layer supports a few different modes which are specified using **T256C** / **'Bitmap Mode'** / **'Color Depth'** in Lx_CONFIG.

**'Color Depth'** specifies the number of bits used per pixel to encode color information:

| Color Depth | Description |
| ----------: | ----------- |
|           0 | 1 bpp       |
|           1 | 2 bpp       |
|           2 | 4 bpp       |
|           3 | 8 bpp       |

The layer can either operate in tile mode or bitmap mode. This is selected using the **'Bitmap Mode'** bit; 0 selects tile mode, 1 selects bitmap mode.

The handling of 1 bpp tile mode is different from the other tile modes. Depending on the **T256C** bit the tiles use either a 16-color foreground and background color or a 256-color foreground color. Other modes ignore the **T256C** bit.

### Tile mode 1 bpp (16 color text mode)

**T256C** should be set to 0.

**MAP_BASE** points to a tile map containing tile map entries, which are 2 bytes each:

<table>
	<tr>
		<th>Offset</th>
		<th>Bit&nbsp;7</th>
		<th>Bit&nbsp;6</th>
		<th>Bit&nbsp;5</th>
		<th>Bit&nbsp;4</th>
		<th>Bit&nbsp;3</th>
		<th>Bit&nbsp;2</th>
		<th>Bit&nbsp;1</th>
		<th>Bit&nbsp;0</th>
	</tr>
	<tr>
		<td>0</td>
		<td align="center" colspan="8">Character index</td>
	</tr>
	<tr>
		<td>1</td>
		<td align="center" colspan="4">Background color</td>
		<td align="center" colspan="4">Foreground color</td>
	</tr>
</table>

**TILE_BASE** points to the tile data.

Each bit in the tile data specifies one pixel. If the bit is set the foreground color as specified in the map data is used, otherwise the background color as specified in the map data is used.

### Tile mode 1 bpp (256 color text mode)

**T256C** should be set to 1.

**MAP_BASE** points to a tile map containing tile map entries, which are 2 bytes each:

<table>
	<tr>
		<th>Offset</th>
		<th>Bit&nbsp;7</th>
		<th>Bit&nbsp;6</th>
		<th>Bit&nbsp;5</th>
		<th>Bit&nbsp;4</th>
		<th>Bit&nbsp;3</th>
		<th>Bit&nbsp;2</th>
		<th>Bit&nbsp;1</th>
		<th>Bit&nbsp;0</th>
	</tr>
	<tr>
		<td>0</td>
		<td align="center" colspan="8">Character index</td>
	</tr>
	<tr>
		<td>1</td>
		<td align="center" colspan="8">Foreground color</td>
	</tr>
</table>

**TILE_BASE** points to the tile data.

Each bit in the tile data specifies one pixel. If the bit is set the foreground color as specified in the map data is used, otherwise color 0 is used (transparent).

### Tile mode 2/4/8 bpp

**MAP_BASE** points to a tile map containing tile map entries, which are 2 bytes each:

<table>
	<tr>
		<th>Offset</th>
		<th>Bit&nbsp;7</th>
		<th>Bit&nbsp;6</th>
		<th>Bit&nbsp;5</th>
		<th>Bit&nbsp;4</th>
		<th>Bit&nbsp;3</th>
		<th>Bit&nbsp;2</th>
		<th>Bit&nbsp;1</th>
		<th>Bit&nbsp;0</th>
	</tr>
	<tr>
		<td>0</td>
		<td align="center" colspan="8">Tile index (7:0)</td>
	</tr>
	<tr>
		<td>1</td>
		<td align="center" colspan="4">Palette offset</td>
		<td align="center">V-flip</td>
		<td align="center">H-flip</td>
		<td align="center" colspan="2">Tile index (9:8)</td>
	</tr>
</table>

**TILE_BASE** points to the tile data.

Each pixel in the tile data gives a color index of either 0-3 (2bpp), 0-15 (4bpp), 0-255 (8bpp). This color index is modified by the palette offset in the tile map data using the following logic:

- Color index 0 (transparent) and 16-255 are unmodified.
- Color index 1-15 is modified by adding 16 x palette offset.

### Bitmap mode 1/2/4/8 bpp

**MAP_BASE** isn’t used in these modes. **TILE_BASE** points to the bitmap data.

**TILEW** specifies the bitmap width. TILEW=0 results in 320 pixels width and TILEW=1 results in 640 pixels width.

The palette offset (in **'H-Scroll (11:8)'**) modifies the color indexes of the bitmap in the same way as in the tile modes.

## Palette

The palette translates 8-bit color indexes into 12-bit output colors. The palette has 256 entries, each with the following format:

<table>
	<tr>
		<th>Bit&nbsp;31-12</th>
		<th>Bit&nbsp;11-8</th>
		<th>Bit&nbsp;7-4</th>
		<th>Bit&nbsp;3-0</th>
	</tr>
	<tr>
		<td align="center">-</td>
		<td align="center">Red</td>
		<td align="center">Green</td>
		<td align="center">Blue</td>
	</tr>
</table>

At reset, the palette will contain a predefined palette:

    000,fff,800,afe,c4c,0c5,00a,ee7,d85,640,f77,333,777,af6,08f,bbb
    000,111,222,333,444,555,666,777,888,999,aaa,bbb,ccc,ddd,eee,fff
    211,433,644,866,a88,c99,fbb,211,422,633,844,a55,c66,f77,200,411
    611,822,a22,c33,f33,200,400,600,800,a00,c00,f00,221,443,664,886
    aa8,cc9,feb,211,432,653,874,a95,cb6,fd7,210,431,651,862,a82,ca3
    fc3,210,430,640,860,a80,c90,fb0,121,343,564,786,9a8,bc9,dfb,121
    342,463,684,8a5,9c6,bf7,120,241,461,582,6a2,8c3,9f3,120,240,360
    480,5a0,6c0,7f0,121,343,465,686,8a8,9ca,bfc,121,242,364,485,5a6
    6c8,7f9,020,141,162,283,2a4,3c5,3f6,020,041,061,082,0a2,0c3,0f3
    122,344,466,688,8aa,9cc,bff,122,244,366,488,5aa,6cc,7ff,022,144
    166,288,2aa,3cc,3ff,022,044,066,088,0aa,0cc,0ff,112,334,456,668
    88a,9ac,bcf,112,224,346,458,56a,68c,79f,002,114,126,238,24a,35c
    36f,002,014,016,028,02a,03c,03f,112,334,546,768,98a,b9c,dbf,112
    324,436,648,85a,96c,b7f,102,214,416,528,62a,83c,93f,102,204,306
    408,50a,60c,70f,212,434,646,868,a8a,c9c,fbe,211,423,635,847,a59
    c6b,f7d,201,413,615,826,a28,c3a,f3c,201,403,604,806,a08,c09,f0b

- Color indexes 0-15 contain the C64 color palette.
- Color indexes 16-31 contain a grayscale ramp.
- Color indexes 32-255 contain various hues, saturation levels, brightness levels.

## Sprite attributes

Two banks of 64 entries of the following format:

<table>
	<tr>
		<th>Word</th>
		<th>31/15</th>
		<th>30/14</th>
		<th>29/13</th>
		<th>28/12</th>
		<th>27/11</th>
		<th>26/10</th>
		<th>25/9</th>
		<th>24/8</th>
		<th>23/7</th>
		<th>22/6</th>
		<th>21/5</th>
		<th>20/4</th>
		<th>19/3</th>
		<th>18/2</th>
		<th>17/1</th>
		<th>16/0</th>
	</tr>
		<tr>
		<td>Word 0 Bits 15-0</td>
		<td align="center" colspan="1">Mode</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="12">Address (16:5)</td>
	</tr>
	<tr>
		<td>Word 0 Bits 31-16</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="10">X</td>
	</tr>
	<tr>
		<td>Word 1 Bits 15-0</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="1">-</td>
		<td align="center" colspan="10">Y</td>
	</tr>
	<tr>
		<td>Word 1 Bits 31-16</td>
		<td align="center" colspan="2">Sprite height</td>
		<td align="center" colspan="2">Sprite width</td>
		<td align="center" colspan="4">Palette offset</td>
		<td align="center" colspan="4">Collision mask</td>
		<td align="center" colspan="2">Z-depth</td>
		<td align="center" colspan="1">V-flip</td>
		<td align="center" colspan="1">H-flip</td>
	</tr>
</table>

| Mode | Description |
| ---- | ----------- |
| 0    | 4 bpp       |
| 1    | 8 bpp       |

| Z-depth | Description                           |
| ------- | ------------------------------------- |
| 0       | Sprite disabled                       |
| 1       | Sprite between background and layer 0 |
| 2       | Sprite between layer 0 and layer 1    |
| 3       | Sprite in front of layer 1            |

| Sprite width / height | Description |
| --------------------- | ----------- |
| 0                     | 8 pixels    |
| 1                     | 16 pixels   |
| 2                     | 32 pixels   |
| 3                     | 64 pixels   |

**Rendering Priority** The sprite memory location dictates the order in which it is rendered. The sprite whose attributes are at the lowest location will be rendered in front of all other sprites; the sprite at the highest location will be rendered behind all other sprites, and so forth.

**Palette offset** works in the same way as with the layers.

The active sprite bank is selected by the SBNK bit in the CTRL register.

The Sprite Renderer can render a maximum of 512 sprite pixels per scanline. That corresponds to 64 8-pixel-wide sprites or 8 64-pixel-wide sprites. The 512 sprite-pixel-per-scanline limit is guaranteed regardless of Layer 0/1 configuration or Wishbone bus access load on Video RAM.

## Sprite collisions

At the start of the vertical blank **Collisions** in **ISR** is updated. This field indicates which groups of sprites have collided. If the field is non-zero the **SPRCOL** interrupt will be set. The interrupt is generated once per field / frame and can be cleared by making sure the sprites no longer collide.
