; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm
    include init.asm
    include macro.asm

MAIN:
    FILL_RAM_MACRO RAM_START, STACK_END - 1, 0x00 ; fill ram with 0

    LOAD_PALETTE_MACRO SYS_PAL, 0x0          ; load system palette colors
    LOAD_TYLES_MACRO SYS_DATA, 0x1, 0x0      ; load system tiles
    LOAD_TYLES_MACRO FONT_DATA, 0x24, 0x1    ; load system font
    FILL_SCREEN_MACRO 0x0                    ; clear screen with 0 tyle
    SET_BG_COLOR_MACRO 0x4                   ; set background color
    SLEEP_SEC_MACRO 0x1                      ; sleep 1 sec

    SET_BG_COLOR_MACRO 0x0                   ; set background color
    DRAW_TEXT_MACRO MEGA_DRIVE_STR, 0x0, 0x0 ; draw text - mega drive
    DRAW_TEXT_MACRO ZEPHYR_STR, 0x0, 0x1     ; draw text - zephyr
    SLEEP_SEC_MACRO 0x1                      ; sleep 1 sec

    move.l #0x0, RAM_COUNTER                 ; start counter from 0
MAIN_LOOP:
    NUM_TO_TEXT_MACRO RAM_COUNTER, RAM_COUNTER_STR ; convert number to text
    SLEEP_SEC_MACRO 0x1                            ; sleep 1 sec
    DRAW_TEXT_MACRO RAM_COUNTER_STR ,0x18,0x0      ; draw text - counter

    move.l RAM_COUNTER, D0
    addq.l #0x1, D0                                ; increase counter by 1
    move.l D0, RAM_COUNTER

    jmp MAIN_LOOP

HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ;halt cpu


    include data.asm
    include font.asm
    include memory.asm
ROM_END:
