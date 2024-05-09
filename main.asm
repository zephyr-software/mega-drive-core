; ******************************************************************************
; main code section
;
; ******************************************************************************

    include init.asm
    include demo.asm

MAIN:
    DEMO_DRAW_INFO_MACRO

; --------------------------------------
; main loop
; --------------------------------------
MAIN_LOOP:
    DEMO_MAIN_LOOP_MACRO

    jmp MAIN_LOOP


; --------------------------------------
; horizontal retrace
; --------------------------------------
HINT:

    rte


; --------------------------------------
; vertical retrace
; --------------------------------------
VINT:
    UPDATE_TIME_MACRO

    rte


; --------------------------------------
; exception
; --------------------------------------
EXCEPTION:
    stop #$2700 ; halt cpu


    include data.asm
    include font.asm
    include memory.asm
ROM_END:
