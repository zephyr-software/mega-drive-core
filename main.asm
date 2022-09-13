; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm
    include init.asm
    include graphics.asm


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
    move.l #0x2,         D0          ; 2 tyles to load
    move.l #0x0,         D1          ; vram tiles offset
    jsr    LOAD_TILES_SR
    movem  (SP)+,        A0-A6/D0-D7

; --------------------------------------
; clear screen with tyle
; --------------------------------------
    movem  A0-A6/D0-D7,   -(SP)
    move.l #0x1,          D0 ; tile number in vdp to fill with
    jsr    FILL_SCREEN_SR
    movem  (SP)+,         A0-A6/D0-D7


MAIN_LOOP:
    jmp MAIN_LOOP


HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu

    include data.asm
ROM_END:
