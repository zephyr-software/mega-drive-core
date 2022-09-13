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


; ==============================================================================
; LOAD_TILES_SR - load tiles subroutine
; load tiles into vram
; ------------------------------------------------------------------------------
; input params:
; A0 - tyle data address
; D0 - total tiles
; D1 - tile offset in vram
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7,  -(SP)
; lea    IMAGE_DATA,   A0
; move.l #0x4,         D0          ; 4 tyles
; move.l #0x2,         D1          ; vram tiles offset
; jsr    LOAD_TILES_SR
; movem  (SP)+,        A0-A6/D0-D7
; ==============================================================================
LOAD_TILES_SR:
    move.l #0x40000000, D2                     ; vram address 0x0
    sub.l  #0x00200000, D2
LOAD_TYLES__SET_OFFSET:
    add.l  #0x00200000, D2                     ; add address for new tile
    dbra D1,            LOAD_TYLES__SET_OFFSET

    mulu.w #0x8, D0
    sub.l #0x1,  D0

    move.w #0x8F02, 0x00C00004       ; set vdp auto increment on

    move.l D2,      0x00C00004       ; set vdp to write to vram with offest
LOAD_TYLES__LOOP:
    move.l (A0)+,   0x00C00000       ; move data to vdp data port
    dbra D0,        LOAD_TYLES__LOOP

    move.w #0x8F00, 0x00C00004       ; set vdp auto increment off

    rts


; ==============================================================================
; FILL_SCREEN_SR - clear screen subroutine
; clear screen with tyle for plane a and b
; ------------------------------------------------------------------------------
; input params:
; D0 - tile number in vdp to fill with
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7,   -(SP)
; move.l #0x0,          D0          ; tile number in vdp to fill with
; jsr    FILL_SCREEN_SR
; movem  (SP)+,         A0-A6/D0-D7
; ============================================================================== 
FILL_SCREEN_SR:
    move.w #0x8F02,     0x00C00004 ; set vdp auto increment on
    move.l #0x40000003, 0x00C00004 ; set vdp to write to vram 0xC000

    move.l #0x3FF, D1 ; 32 * 32 - 1 tiles
FILL_SCREEN__CLEAR_PLANE_A:
    move.w D0,     0x00C00000              ; tile number to clear
    dbra D1,       FILL_SCREEN__CLEAR_PLANE_A

    move.l #0x60000003, 0x00C00004         ; set vdp to write to vram 0xE000

    move.l #0x3FF,      D1                 ; 32 * 32 - 1 tyles to write
CLEAR_SCREEN_PLANE_B:
    move.w D0,          0x00C00000
    dbra D1,            CLEAR_SCREEN_PLANE_B

    move.w #0x8F00,     0x00C00004           ; set vdp auto increment off
    rts
