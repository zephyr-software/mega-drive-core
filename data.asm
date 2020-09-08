; ******************************************************************************
; data section
; ******************************************************************************

; --------------------------------------
; vdp register table
; --------------------------------------
VDP_REG:
    dc.b 0x14 ; 0: enable h interrupt (68000 level 4); enable read hv counter
    dc.b 0x74 ; 1: enable display; enable v interrupt (68000 level 6); dma enable
    dc.b 0x30 ; 2: pattern name table base address for scroll a 0xC000
    dc.b 0x34 ; 3: pattern name table base address for window 0xD000
    dc.b 0x07 ; 4: pattern name table base address for scroll b 0xE000
    dc.b 0x78 ; 5: sprite attribute table base address 0xF000
    dc.b 0x00 ; 6:
    dc.b 0x00 ; 7: background color 0
    dc.b 0x00 ; 8:
    dc.b 0x00 ; 9:
    dc.b 0x00 ; 10: register makes h interrupt timing by number of raster
    dc.b 0x00 ; 11: disable external interrupt; v scroll mode full scroll; h scroll mode full scroll.
    dc.b 0x00 ; 12: 32 cell mode; disable shadow / highlight; no interlace
    dc.b 0x3E ; 13: h scroll data table base address 0xF800
    dc.b 0x00 ; 14:
    dc.b 0x00 ; 15: register controls bias number of increment data
    dc.b 0x00 ; 16: scroll size: v 32 cell; h 32 cell
    dc.b 0x00 ; 17: window h position
    dc.b 0x00 ; 18: window v position
    dc.b 0x00 ; 19: dma length counter low
    dc.b 0x00 ; 20: dma length counter high
    dc.b 0x00 ; 21: dma source address low
    dc.b 0x00 ; 22: dma source address mid
    dc.b 0x00 ; 23: dma source address high; memory to vram
