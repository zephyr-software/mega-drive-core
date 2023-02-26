; ******************************************************************************
; main code section
;
; ******************************************************************************

    include init.asm


MAIN:
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

; --------------------------------------
; check and print cpu mode
; --------------------------------------
    GET_MD_CPU_MODE_MACRO ; get md cpu mode
    cmp.b  #0x01, D0      ; 0: md cpu ntsc info / 1: md cpu pal info
    beq.s DRAW_MD_CPU_PAL_INFO

    DRAW_TEXT_MACRO CPU_NTSC_INFO_STR, 0x0, 0x3 ; draw text - md cpu ntsc info
    jmp DRAW_MD_CPU_INFO_END

DRAW_MD_CPU_PAL_INFO:
    DRAW_TEXT_MACRO CPU_PAL_INFO_STR, 0x0, 0x3  ; draw text - md cpu pal info

DRAW_MD_CPU_INFO_END:

; --------------------------------------
; main loop
; --------------------------------------
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
