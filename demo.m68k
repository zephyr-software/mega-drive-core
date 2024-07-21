; ******************************************************************************
; mega drive core
; demo section
; ******************************************************************************

; ==============================================================================
; DEMO_LOAD_SRC_SR - demo load resources subroutine
; palettes, font
; ==============================================================================
DEMO_LOAD_SRC_SR:

    LOAD_PALETTE_MACRO SYS_PAL0, 0x0, 0xF ; load system palette #0 colors [16]
    LOAD_PALETTE_MACRO SYS_PAL1, 0x1, 0x1 ; load system palette #1 colors [02]
    LOAD_PALETTE_MACRO SYS_PAL2, 0x2, 0x1 ; load system palette #2 colors [02]
    LOAD_PALETTE_MACRO SYS_PAL3, 0x3, 0x1 ; load system palette #3 colors [02]

    LOAD_TYLES_MACRO SYS_DATA, 0x1, 0x0   ; load system tile
    LOAD_TYLES_MACRO FONT_DATA, 0x24, 0x1 ; load system font

    rts


; ==============================================================================
; DEMO_CLR_SR - demo clear screen subroutine
; clear screen and set background color 0 from 0 palette
; ==============================================================================
DEMO_CLR_SR:

    FILL_SCREEN_MACRO 0x0  ; clear screen with 0 tyle
    SET_BG_COLOR_MACRO 0x0 ; set background color

    rts


; ==============================================================================
; DEMO_DRAW_LOGO_SR - demo draw logo subroutine
; mega drive core
; ------------------------------------------------------------------------------
; input params: D0 - x coordinate
;               D1 - y coordinate
; ==============================================================================
DEMO_DRAW_LOGO_SR:

    move.l D0, RAM_DEMO_MD_CORE_POS_X ; save x cord to ram
    move.l D1, RAM_DEMO_MD_CORE_POS_Y ; save y cord to ram

    DRAW_TEXT_MEM_CORD_MACRO MEGA_DRIVE_CORE_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x3 ; mega drive core

    rts


; ==============================================================================
; DEMO_DRAW_SYS_INFO_SR - demo draw system information subroutine
; system name, model name and model version
; ------------------------------------------------------------------------------
; input params: D0 - x coordinate
;               D1 - y coordinate
; ==============================================================================
DEMO_DRAW_SYS_INFO_SR:

    move.l D0, RAM_DEMO_MD_CORE_POS_X ; save x cord to ram
    move.l D1, RAM_DEMO_MD_CORE_POS_Y ; save y cord to ram

    DRAW_TEXT_MEM_CORD_MACRO MEGA_DRIVE_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; mega drive

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x2, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

; --------------------------------------
; check and print md model
; --------------------------------------
    DRAW_TEXT_MEM_CORD_MACRO MODEL_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; md model

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x8, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    GET_MD_MODEL_MACRO ; get md model
    cmp.b  #0x01, D0   ; 0: domestic model / 1: overseas model
    beq.s DRAW_MD_OVERSEAS_MODEL_INFO

    DRAW_TEXT_MEM_CORD_MACRO DOMESTIC_MODEL_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; domestic model
    jmp DRAW_MD_MODEL_INFO_END

DRAW_MD_OVERSEAS_MODEL_INFO:
    DRAW_TEXT_MEM_CORD_MACRO OVERSEAS_MODEL_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; overseas model

DRAW_MD_MODEL_INFO_END:

; --------------------------------------
; check and print md version
; --------------------------------------
    move.l #0x0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO VERSION_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; version

    GET_MD_VERSION_MACRO ; get mega drive hardware version
    add.b #0x30, D0 ; add ascii offse
    lsl.w #0x08, D0 ; logical shift to 8 bits right

    move.w D0, RAM_MD_VER

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x8, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X
    DRAW_TEXT_MEM_CORD_MACRO RAM_MD_VER, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1

    rts


; ==============================================================================
; DEMO_DRAW_M68K_MODE_SR - demo draw motorola 68000 mode subroutine
; check and print cpu mode
; ------------------------------------------------------------------------------
; input params: D0 - x coordinate
;               D1 - y coordinate
; ==============================================================================
DEMO_DRAW_M68K_MODE_SR:

    move.l D0, RAM_DEMO_MD_CORE_POS_X ; save x cord to ram
    move.l D1, RAM_DEMO_MD_CORE_POS_Y ; save y cord to ram

    DRAW_TEXT_MEM_CORD_MACRO MOTOROLA_68000_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; motorola 68000

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x2, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO M68K_MODE_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; mode

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x8, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    GET_MD_CPU_MODE_MACRO ; get md cpu mode
    cmp.b  #0x01, D0      ; 0: md cpu ntsc info / 1: md cpu pal info
    beq.s DRAW_MD_CPU_PAL_INFO

    DRAW_TEXT_MEM_CORD_MACRO M68K_NTSC_INFO_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; ntsc cpu clock 7 67 mhz
    jmp DRAW_MD_CPU_INFO_END

DRAW_MD_CPU_PAL_INFO:
    DRAW_TEXT_MEM_CORD_MACRO M68K_PAL_INFO_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1  ; pal cpu clock 7 60 mhz

DRAW_MD_CPU_INFO_END:

    rts


; ==============================================================================
; DEMO_DRAW_M68K_REGS_SR - demo draw motorola 68000 registers subroutine
; print d0-d7 / a0-a7 / sr / pc
; ------------------------------------------------------------------------------
; input params: D0 - x coordinate
;               D1 - y coordinate
; ==============================================================================
DEMO_DRAW_M68K_REGS_SR:

    move.l D0, RAM_DEMO_MD_CORE_POS_X ; save x cord to ram
    move.l D1, RAM_DEMO_MD_CORE_POS_Y ; save y cord to ram

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

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D0_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d0

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D0_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d0 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D1_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d1

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D1_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d1 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D2_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d2

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D2_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d2 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D3_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d3

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D3_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d3 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D4_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d4

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D4_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d4 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D5_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d5

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D5_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d5 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D6_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d6

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D6_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d6 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_D7_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; d7

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_D7_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; d7 register value


    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x9, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; dec y cord
    sub.l #0x7, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A0_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a0

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A0_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a0 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A1_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a1

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A1_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a1 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A2_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a2

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A2_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a2 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A3_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a3

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A3_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a3 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A4_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a4

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A4_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a4 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A5_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a5

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A5_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a5 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A6_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; a6

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A6_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a6 register value

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x1, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_A7_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; sp

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_A7_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; a7 register value


; --------------------------------------
; print status register info
; --------------------------------------
    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; dec x cord
    sub.l #0xF, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    move.l RAM_DEMO_MD_CORE_POS_Y, D0 ; inc y cord
    add.l #0x2, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_Y

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_SR_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; sr

    clr.l D0
    move.w SR, D0
    move.l D0, RAM_M68K_SR

    NUM_TO_TEXT_MACRO RAM_M68K_SR, RAM_M68K_SR_STR  ; convert number to text

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_SR_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; status register value

; --------------------------------------
; print program counter register info
; --------------------------------------
    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x9, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO CPU_M68K_PC_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x2 ; pc

RAM_PC:
    lea(RAM_PC, PC), A0
    move.l A0, RAM_M68K_PC

    NUM_TO_TEXT_MACRO RAM_M68K_PC, RAM_M68K_PC_STR ; convert number to text

    move.l RAM_DEMO_MD_CORE_POS_X, D0 ; inc x cord
    add.l #0x3, D0
    move.l D0, RAM_DEMO_MD_CORE_POS_X

    DRAW_TEXT_MEM_CORD_MACRO RAM_M68K_PC_STR, RAM_DEMO_MD_CORE_POS_X, RAM_DEMO_MD_CORE_POS_Y, 0x1 ; program counter reg value


    rts
