; ******************************************************************************
; main code section
;
; ******************************************************************************

    include init.asm


MAIN:
    LOAD_PALETTE_MACRO SYS_PAL0, 0x0, 0xF ; load system palette 0 colors
    LOAD_PALETTE_MACRO SYS_PAL1, 0x1, 0x1 ; load system palette 1 colors
    LOAD_PALETTE_MACRO SYS_PAL2, 0x2, 0x1 ; load system palette 2 colors
    LOAD_PALETTE_MACRO SYS_PAL3, 0x3, 0x1 ; load system palette 3 colors

    LOAD_TYLES_MACRO SYS_DATA, 0x1, 0x0      ; load system tiles
    LOAD_TYLES_MACRO FONT_DATA, 0x24, 0x1    ; load system font
    FILL_SCREEN_MACRO 0x0                    ; clear screen with 0 tyle
    SET_BG_COLOR_MACRO 0x4                   ; set background color
    SLEEP_SEC_MACRO 0x1                      ; sleep 1 sec

    SET_BG_COLOR_MACRO 0x0                             ; set background color
    DRAW_TEXT_MACRO MEGA_DRIVE_CORE_STR, 0x0, 0x0,0x2  ; mega drive core
    DRAW_TEXT_MACRO UPTIME_STR, 0x1A, 0x1, 0x3         ; uptime

; --------------------------------------
; check and print md model
; --------------------------------------
    DRAW_TEXT_MACRO MD_MODEL_STR, 0x0, 0x2, 0x2 ; md model

    GET_MD_MODEL_MACRO ; get md model
    cmp.b  #0x01, D0   ; 0: domestic model / 1: overseas model
    beq.s DRAW_MD_OVERSEAS_MODEL_INFO

    DRAW_TEXT_MACRO MD_DOMESTIC_MODEL_STR, 0x9, 0x2, 0x1 ; domestic model
    jmp DRAW_MD_MODEL_INFO_END

DRAW_MD_OVERSEAS_MODEL_INFO:
    DRAW_TEXT_MACRO MD_OVERSEAS_MODEL_STR, 0x9, 0x2, 0x1 ; overseas model

DRAW_MD_MODEL_INFO_END:

; --------------------------------------
; check and print md version
; --------------------------------------
    DRAW_TEXT_MACRO MD_VER_STR, 0x0, 0x3, 0x2 ; md ver

    GET_MD_VERSION_MACRO ; get mega drive hardware version
    add.b #0x30, D0 ; add ascii offset
    lsl.w #0x08, D0 ; logical shift to 8 bits right
    move.w D0, RAM_MD_VER

    DRAW_TEXT_MACRO RAM_MD_VER, 0x9, 0x3, 0x1

; --------------------------------------
; check and print cpu mode
; --------------------------------------
    DRAW_TEXT_MACRO MOTOROLA_68000_STR, 0x0, 0x5, 0x2 ; motorola 68000
    DRAW_TEXT_MACRO M68K_MODE_STR,      0x0, 0x7, 0x2 ; mode

    GET_MD_CPU_MODE_MACRO ; get md cpu mode
    cmp.b  #0x01, D0      ; 0: md cpu ntsc info / 1: md cpu pal info
    beq.s DRAW_MD_CPU_PAL_INFO

    DRAW_TEXT_MACRO M68K_NTSC_INFO_STR, 0x9, 0x7, 0x1 ; ntsc cpu clock 7 67 mhz
    jmp DRAW_MD_CPU_INFO_END

DRAW_MD_CPU_PAL_INFO:
    DRAW_TEXT_MACRO M68K_PAL_INFO_STR, 0x9, 0x7, 0x1  ; pal cpu clock 7 60 mhz

DRAW_MD_CPU_INFO_END:

; --------------------------------------
; print status register info
; --------------------------------------
    DRAW_TEXT_MACRO CPU_M68K_SR_STR, 0x0, 0x9, 0x2 ; M68K SR

    clr.l D0
    move.w SR, D0
    move.l D0, RAM_M68K_SR

    NUM_TO_TEXT_MACRO RAM_M68K_SR, RAM_M68K_SR_STR ; convert number to text
    DRAW_TEXT_MACRO RAM_M68K_SR_STR, 0x3, 0x9, 0x1 ; status register value

; --------------------------------------
; print d0-d7 registers info
; --------------------------------------
    move.l #0xD0D0D0D0, D0 ; test data
    move.l #0xD1D1D1D1, D1
    move.l #0xD2D2D2D2, D2
    move.l #0xD3D3D3D3, D3
    move.l #0xD4D4D4D4, D4
    move.l #0xD5D5D5D5, D5
    move.l #0xD6D6D6D6, D6
    move.l #0xD7D7D7D7, D7

    move.l #0xA0A0A0A0, A0
    move.l #0xA1A1A1A1, A1
    move.l #0xA2A2A2A2, A2
    move.l #0xA3A3A3A3, A3
    move.l #0xA4A4A4A4, A4
    move.l #0xA5A5A5A5, A5
    move.l #0xA6A6A6A6, A6
                      ; A7 = SP stack pointer

    SAVE_M68K_REGS_MACRO

    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x0, RAM_M68K_D0_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x1, RAM_M68K_D1_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x2, RAM_M68K_D2_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x3, RAM_M68K_D3_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x4, RAM_M68K_D4_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x5, RAM_M68K_D5_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x6, RAM_M68K_D6_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x7, RAM_M68K_D7_STR

    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x8, RAM_M68K_A0_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0x9, RAM_M68K_A1_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xA, RAM_M68K_A2_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xB, RAM_M68K_A3_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xC, RAM_M68K_A4_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xD, RAM_M68K_A5_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xE, RAM_M68K_A6_STR
    NUM_TO_TEXT_MACRO RAM_M68K_D0_D7_A0_A7 + 0x4 * 0xF, RAM_M68K_A7_STR

    DRAW_TEXT_MACRO CPU_M68K_D0_STR, 0x0, 0x0A, 0x2 ; D0
    DRAW_TEXT_MACRO CPU_M68K_D1_STR, 0x0, 0x0B, 0x2 ; D1
    DRAW_TEXT_MACRO CPU_M68K_D2_STR, 0x0, 0x0C, 0x2 ; D2
    DRAW_TEXT_MACRO CPU_M68K_D3_STR, 0x0, 0x0D, 0x2 ; D3
    DRAW_TEXT_MACRO CPU_M68K_D4_STR, 0x0, 0x0E, 0x2 ; D4
    DRAW_TEXT_MACRO CPU_M68K_D5_STR, 0x0, 0x0F, 0x2 ; D5
    DRAW_TEXT_MACRO CPU_M68K_D6_STR, 0x0, 0x10, 0x2 ; D6
    DRAW_TEXT_MACRO CPU_M68K_D7_STR, 0x0, 0x11, 0x2 ; D7

    DRAW_TEXT_MACRO CPU_M68K_A0_STR, 0xC, 0x0A, 0x2 ; A0
    DRAW_TEXT_MACRO CPU_M68K_A1_STR, 0xC, 0x0B, 0x2 ; A1
    DRAW_TEXT_MACRO CPU_M68K_A2_STR, 0xC, 0x0C, 0x2 ; A2
    DRAW_TEXT_MACRO CPU_M68K_A3_STR, 0xC, 0x0D, 0x2 ; A3
    DRAW_TEXT_MACRO CPU_M68K_A4_STR, 0xC, 0x0E, 0x2 ; A4
    DRAW_TEXT_MACRO CPU_M68K_A5_STR, 0xC, 0x0F, 0x2 ; A5
    DRAW_TEXT_MACRO CPU_M68K_A6_STR, 0xC, 0x10, 0x2 ; A6
    DRAW_TEXT_MACRO CPU_M68K_A7_STR, 0xC, 0x11, 0x2 ; A7

    DRAW_TEXT_MACRO RAM_M68K_D0_STR, 0x3, 0x0A, 0x1 ; d0 register value
    DRAW_TEXT_MACRO RAM_M68K_D1_STR, 0x3, 0x0B, 0x1 ; d1 register value
    DRAW_TEXT_MACRO RAM_M68K_D2_STR, 0x3, 0x0C, 0x1 ; d2 register value
    DRAW_TEXT_MACRO RAM_M68K_D3_STR, 0x3, 0x0D, 0x1 ; d3 register value
    DRAW_TEXT_MACRO RAM_M68K_D4_STR, 0x3, 0x0E, 0x1 ; d4 register value
    DRAW_TEXT_MACRO RAM_M68K_D5_STR, 0x3, 0x0F, 0x1 ; d5 register value
    DRAW_TEXT_MACRO RAM_M68K_D6_STR, 0x3, 0x10, 0x1 ; d6 register value
    DRAW_TEXT_MACRO RAM_M68K_D7_STR, 0x3, 0x11, 0x1 ; d7 register value

    DRAW_TEXT_MACRO RAM_M68K_A0_STR, 0xF, 0x0A, 0x1 ; a0 register value
    DRAW_TEXT_MACRO RAM_M68K_A1_STR, 0xF, 0x0B, 0x1 ; a1 register value
    DRAW_TEXT_MACRO RAM_M68K_A2_STR, 0xF, 0x0C, 0x1 ; a2 register value
    DRAW_TEXT_MACRO RAM_M68K_A3_STR, 0xF, 0x0D, 0x1 ; a3 register value
    DRAW_TEXT_MACRO RAM_M68K_A4_STR, 0xF, 0x0E, 0x1 ; a4 register value
    DRAW_TEXT_MACRO RAM_M68K_A5_STR, 0xF, 0x0F, 0x1 ; a5 register value
    DRAW_TEXT_MACRO RAM_M68K_A6_STR, 0xF, 0x10, 0x1 ; a6 register value
    DRAW_TEXT_MACRO RAM_M68K_A7_STR, 0xF, 0x11, 0x1 ; a7 register value

; --------------------------------------
; main loop
; --------------------------------------
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
    stop #$2700 ;halt cpu


    include data.asm
    include font.asm
    include memory.asm
ROM_END:
