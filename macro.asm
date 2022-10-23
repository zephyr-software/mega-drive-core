; ******************************************************************************
; macros
; ******************************************************************************
    include graphics.asm
    include text.asm

; ==============================================================================
; graphic macros
; ==============================================================================
LOAD_PALETTE_MACRO: MACRO pal_addr pal_num
    movem  A0-A6/D0-D7,    -(SP)
    lea    pal_addr,       A0
    move.l #pal_num,       D0
    jsr    LOAD_PALETTE_SR
    movem  (SP)+,          A0-A6/D0-D7
    ENDM

LOAD_TYLES_MACRO: MACRO tile_addr tile_num offset_addr
    movem  A0-A6/D0-D7,  -(SP)
    lea    tile_addr,    A0
    move.l #tile_num,    D0
    move.l #offset_addr, D1
    jsr    LOAD_TILES_SR
    movem  (SP)+,        A0-A6/D0-D7
    ENDM

FILL_SCREEN_MACRO: MACRO tyle_num
    movem  A0-A6/D0-D7,   -(SP)
    move.l #tyle_num,  D0 ; tile number in vdp to fill with
    jsr    FILL_SCREEN_SR
    movem  (SP)+,         A0-A6/D0-D7
    ENDM

; ==============================================================================
; text macros
; ==============================================================================
DRAW_TEXT_MACRO: MACRO str_addr x_cord y_cord
    movem  A0-A6/D0-D7, -(SP)
    lea str_addr,       A0
    move.l #x_cord,     D0
    move.l #y_cord,     D1
    jsr DRAW_TEXT_SR
    movem  (SP)+,       A0-A6/D0-D7

    ENDM
