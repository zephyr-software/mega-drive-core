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

    move.w #0x8704, 0x00C00004; set background colour to palette 0, colour 4

MAIN_LOOP:
    jmp MAIN_LOOP


HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu

    include data.asm
ROM_END:
