; ******************************************************************************
; yamaha ym7101 - vdp graphics subroutines
; ******************************************************************************


; ==============================================================================
; LOAD_PALETTE_SR - load palette subroutine
; load palette to color ram
; ------------------------------------------------------------------------------
; input params:
; A0 - palette start address
; D0 - palette number [0-3]
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7,    -(SP)
; lea    PAL,            A0
; move.l #0x0,           D0
; jsr    LOAD_PALETTE_SR
; movem  (SP)+,          A0-A6/D0-D7
; ==============================================================================
LOAD_PALETTE_SR:
    move.l #0xC0000000, D1; cram address 0x0
    sub.l  #0x00200000, D1
SELECT_PALLETE_LOOP:
    add.l  #0x00200000, D1 ; add address for new palette [0-3]
    dbra   D0,          SELECT_PALLETE_LOOP

    move.w #0x8F02, 0x00C00004 ; set autoincrement to 2 byte
    move.l D1,      0x00C00004 ; set up vdp to write to cram address 0x0000

    move.w #0x000F, D2         ; 16 words of data
LOAD_PALLETE_LOOP:
    move.w (A0)+,   0x00C00000 ; move data to vdp data port
    dbra D2,        LOAD_PALLETE_LOOP

    move.w #0x8F00, 0x00C00004 ; set autoincrement to 0 byte

    rts
