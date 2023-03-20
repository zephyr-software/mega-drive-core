; ******************************************************************************
; main code section
;
; ******************************************************************************

    include init.asm
    include demo.asm

MAIN:
    DEMO_LOAD_SRC_MACRO ; load resources for demo
    DEMO_CLR_MACRO      ; clear screen with 0 tyle and set background color to 0

    DEMO_DRAW_LOGO_MACRO 0x0, 0x0      ; mega drive core

    DEMO_DRAW_SYS_INFO_MACRO 0x0, 0x3  ; mega drive, model name, model version
    DEMO_DRAW_M68K_MODE_MACRO 0x0, 0x9 ; m68k mode
    DEMO_DRAW_M68K_REGS_MACRO 0x0, 0xD ; m68k regs d0-d7/a0-a7/sr/pc

; --------------------------------------
; main loop
; --------------------------------------
    DRAW_TEXT_MACRO UPTIME_STR, 0x1A, 0x1, 0x3      ; uptime

    move.l #0x0, RAM_COUNTER                        ; start counter from 0
MAIN_LOOP:
    NUM_TO_TEXT_MACRO RAM_COUNTER, RAM_COUNTER_STR  ; convert number to text
    SLEEP_SEC_MACRO 0x1                             ; sleep 1 sec
    DRAW_TEXT_MACRO RAM_COUNTER_STR ,0x18, 0x0, 0x3 ; draw text - counter

    move.l RAM_COUNTER, D0
    addq.l #0x1, D0                                 ; increase counter by 1
    move.l D0, RAM_COUNTER

    jmp MAIN_LOOP

HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu


    include data.asm
    include font.asm
    include memory.asm
ROM_END:
