#ifndef VERA_H_
#define VERA_H

#ifndef VERA_BASE
#define VERA_BASE 0
#endif

#define VERA_CTRL         (VERA_BASE + (0x00<<2))

#define VERA_DC_BORDER    (VERA_BASE + (0x01<<2))

#define VERA_IEN          (VERA_BASE + (0x02<<2))
#define VERA_ISR          (VERA_BASE + (0x03<<2))
#define VERA_IRQ_LINE     (VERA_BASE + (0x04<<2))
#define VERA_SCANLINE     (VERA_BASE + (0x05<<2))

#define VERA_DC_VIDEO     (VERA_BASE + (0x06<<2))
#define VERA_DC_HSCALE    (VERA_BASE + (0x08<<2))
#define VERA_DC_VSCALE    (VERA_BASE + (0x09<<2))

#define VERA_DC_HSTART    (VERA_BASE + (0x0A<<2))
#define VERA_DC_HSTOP     (VERA_BASE + (0x0B<<2))
#define VERA_DC_VSTART    (VERA_BASE + (0x0C<<2))
#define VERA_DC_VSTOP     (VERA_BASE + (0x0D<<2))

#define VERA_L0_CONFIG    (VERA_BASE + (0x10<<2))
#define VERA_L0_MAPBASE   (VERA_BASE + (0x11<<2))
#define VERA_L0_TILEBASE  (VERA_BASE + (0x12<<2))
#define VERA_L0_HSCROLL   (VERA_BASE + (0x14<<2))
#define VERA_L0_VSCROLL   (VERA_BASE + (0x15<<2))

#define VERA_L1_CONFIG    (VERA_BASE + (0x20<<2))
#define VERA_L1_MAPBASE   (VERA_BASE + (0x21<<2))
#define VERA_L1_TILEBASE  (VERA_BASE + (0x22<<2))
#define VERA_L1_HSCROLL   (VERA_BASE + (0x24<<2))
#define VERA_L1_VSCROLL   (VERA_BASE + (0x25<<2))

#define VERA_PALETTE_BASE  (VERA_BASE + (0x2000))
#define VERA_SPRITES_BASE  (VERA_BASE + (0x1000))

#define VERA_VRAM_BASE    (VERA_BASE + (0x40000))

#endif //VERA_H