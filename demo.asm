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
