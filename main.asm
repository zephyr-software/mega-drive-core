; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm
    include init.asm
    include graphics.asm
    include text.asm

MAIN:
; --------------------------------------
; load system palette colors into cram
; --------------------------------------
    movem  A0-A6/D0-D7,    -(SP)
    lea    SYS_PAL,        A0
    move.l #0x0,           D0          ; palette num 0
    jsr    LOAD_PALETTE_SR
    movem  (SP)+,          A0-A6/D0-D7

; --------------------------------------
; load system tyles
; --------------------------------------
    movem  A0-A6/D0-D7,  -(SP)
    lea    SYS_DATA,     A0
    move.l #0x1,         D0          ; 1 tyle to load
    move.l #0x0,         D1          ; vram tiles offset
    jsr    LOAD_TILES_SR
    movem  (SP)+,        A0-A6/D0-D7

; --------------------------------------
; load system font
; --------------------------------------
    movem  A0-A6/D0-D7,  -(SP)
    lea    FONT_DATA,    A0
    move.l #0x24,        D0          ; 36 tyles to load
    move.l #0x1,         D1          ; vram tiles offset
    jsr    LOAD_TILES_SR
    movem  (SP)+,        A0-A6/D0-D7

; --------------------------------------
; clear screen with tyle
; --------------------------------------
    movem  A0-A6/D0-D7,   -(SP)
    move.l #0x0,          D0 ; tile number in vdp to fill with
    jsr    FILL_SCREEN_SR
    movem  (SP)+,         A0-A6/D0-D7

; --------------------------------------
; draw text
; --------------------------------------
    move.w #0x8702, 0x00C00004

    movem  A0-A6/D0-D7,   -(SP)
    lea TEST_STRING, A0
    move.l #0x0,     A1
    move.l #0x1,     A2
    jsr DRAW_TEXT_SR
    movem  (SP)+,         A0-A6/D0-D7

MAIN_LOOP:
    jmp MAIN_LOOP


HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu


    include data.asm
    include font.asm
ROM_END:
