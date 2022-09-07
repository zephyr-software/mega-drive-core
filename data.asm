; ******************************************************************************
; data section
; ******************************************************************************


; --------------------------------------
; vdp register table
; --------------------------------------
VDP_REG:
    dc.b 0x06 ; 00: mode 1: [h int]- [h,v count]-
    dc.b 0x44 ; 01: mode 2: [display]+ [v int]- [dma]- [v28 cell mode]
    dc.b 0x30 ; 02: plane a table: [0xC000]
    dc.b 0x3E ; 03: window table:  [0xF800]
    dc.b 0x07 ; 04: plane b table: [0xE000]
    dc.b 0x78 ; 05: sprite table:  [0xFE00]
    dc.b 0x00 ; 06: unused
    dc.b 0x00 ; 07: background color: [palette 0] [color 0]
    dc.b 0x00 ; 08: unused
    dc.b 0x00 ; 09: unused
    dc.b 0x00 ; 0A: h int count: [0]
    dc.b 0x00 ; 0B: mode 3: [ext 68k int]- [v scroll full] [h scroll full]
    dc.b 0x00 ; 0C: mode 4: [h32 cell mode] [shadow/hilight]- [no interlace]
    dc.b 0x3F ; 0D: h scroll table: [FC00]
    dc.b 0x00 ; 0E: unused
    dc.b 0x00 ; 0F: auto-increment value: [0]
    dc.b 0x00 ; 10: plane size: [v32 cell] [h32 cell]
    dc.b 0x00 ; 11: window h posisiton: [0]
    dc.b 0x00 ; 12: window v position:  [0]
    dc.b 0x00 ; 13: dma length counter low:  [0]
    dc.b 0x00 ; 14: dma length counter high: [0]
    dc.b 0x00 ; 15: dma source address low:  [0]
    dc.b 0x00 ; 16: dma source address mid:  [0]
    dc.b 0x00 ; 17: dma source address high: [0] [memory to vram]

; --------------------------------------
; system palette
; --------------------------------------
SYS_PAL:
    dc.w 0x0000 ; color #0 - black
    dc.w 0x0E00 ; color #1 - blue
    dc.w 0x00E0 ; color #2 - green
    dc.w 0x000E ; color #3 - red
    dc.w 0x0E0E ; color #4 - purple
    dc.w 0x00EE ; color #5 - yellow
    dc.w 0x0EEE ; color #6 - white
    dc.w 0x0000 ; color #7
    dc.w 0x0000 ; color #8
    dc.w 0x0000 ; color #9
    dc.w 0x0000 ; color #A
    dc.w 0x0000 ; color #B
    dc.w 0x0000 ; color #C
    dc.w 0x0000 ; color #D
    dc.w 0x0000 ; color #E
    dc.w 0x0EEE ; color #F - white [cram debug]

; --------------------------------------
; system data
; --------------------------------------
SYS_DATA:
    dc.l 0x00000000 ; tile 0 - empty
    dc.l 0x00000000
    dc.l 0x00000000
    dc.l 0x00000000
    dc.l 0x00000000
    dc.l 0x00000000
    dc.l 0x00000000
    dc.l 0x00000000

    dc.l 0x22222222 ; tile 1 - grid
    dc.l 0x20000000
    dc.l 0x20000000
    dc.l 0x20000000
    dc.l 0x20000000
    dc.l 0x20000000
    dc.l 0x20000000
    dc.l 0x20000000

