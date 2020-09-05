; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm

MAIN:
    move.l #0xF, d0 ; move 15 into register d0
    move.l d0, d1   ; move contents of register d0 into d1
    jmp MAIN        ; jump back up to main

HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu

ROM_END:
