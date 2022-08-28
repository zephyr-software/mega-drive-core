; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm
    include init.asm

MAIN:
    move.l #0xF, D0 ; move 15 into register D0
    move.l D0, D1   ; move contents of register D0 into D1
    jmp MAIN        ; jump back up to main

HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu

    include data.asm
ROM_END:
