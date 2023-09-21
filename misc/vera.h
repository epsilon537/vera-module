#ifndef VERA_H_
#define VERA_H

/*Definitions below are offsets relative to VERA base address*/

#define VERA_CTRL         (0x00<<2)

#define VERA_DC_BORDER    (0x01<<2)

#define VERA_IEN          (0x02<<2)
#define VERA_ISR          (0x03<<2)
#define VERA_IRQ_LINE     (0x04<<2)
#define VERA_SCANLINE     (0x05<<2)

#define VERA_DC_VIDEO     (0x06<<2)
#define VERA_DC_HSCALE    (0x08<<2)
#define VERA_DC_VSCALE    (0x09<<2)

#define VERA_DC_HSTART    (0x0A<<2)
#define VERA_DC_HSTOP     (0x0B<<2)
#define VERA_DC_VSTART    (0x0C<<2)
#define VERA_DC_VSTOP     (0x0D<<2)

#define VERA_L0_CONFIG    (0x10<<2)
#define VERA_L0_MAPBASE   (0x11<<2)
#define VERA_L0_TILEBASE  (0x12<<2)
#define VERA_L0_HSCROLL   (0x14<<2)
#define VERA_L0_VSCROLL   (0x15<<2)

#define VERA_L1_CONFIG    (0x20<<2)
#define VERA_L1_MAPBASE   (0x21<<2)
#define VERA_L1_TILEBASE  (0x22<<2)
#define VERA_L1_HSCROLL   (0x24<<2)
#define VERA_L1_VSCROLL   (0x25<<2)

#define VERA_PALETTE_OFFSET (0x2000)
#define VERA_SPRITES_OFFSET (0x1000)

#define VERA_VRAM_OFFSET   (0x40000)

#endif //VERA_H