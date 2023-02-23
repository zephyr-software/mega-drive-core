; ******************************************************************************
; macros
;
; ******************************************************************************

    include m68k.asm
    include system.asm
    include ram.asm
    include graphics.asm
    include text.asm
    include time.asm


; ==============================================================================
; m68k macros
; ==============================================================================
INIT_M68K_SREG_MACRO: MACRO
    jsr INIT_M68K_SREG_SR
    ENDM

CLR_M68K_MACRO: MACRO
    jsr CLR_M68K_SR
    ENDM

; ==============================================================================
; system macros
; ==============================================================================
GET_MD_VERSION_MACRO: MACRO
    jsr GET_MD_VERSION_SR
    ENDM

; ==============================================================================
; ram macros
; ==============================================================================
FILL_RAM_MACRO: MACRO start_addr, end_addr, fill_byte
    movem.l A0-A6/D0-D7, -(SP)
    movea.w #start_addr, A0
    movea.w #end_addr, A1
    move.b #fill_byte, D0
    jsr FILL_RAM_SR
    movem.l  (SP)+, A0-A6/D0-D7
    ENDM

; ==============================================================================
; graphic macros
; ==============================================================================
LOAD_PALETTE_MACRO: MACRO pal_addr pal_num
    movem.l A0-A6/D0-D7, -(SP)
    lea pal_addr, A0
    move.l #pal_num, D0
    jsr LOAD_PALETTE_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

LOAD_TYLES_MACRO: MACRO tile_addr tile_num offset_addr
    movem.l A0-A6/D0-D7, -(SP)
    lea tile_addr, A0
    move.l #tile_num, D0
    move.l #offset_addr, D1
    jsr LOAD_TILES_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

FILL_SCREEN_MACRO: MACRO tyle_num
    movem.l A0-A6/D0-D7, -(SP)
    move.l #tyle_num,  D0
    jsr FILL_SCREEN_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

SET_BG_COLOR_MACRO: MACRO color_num
    movem.l A0-A6/D0-D7, -(SP)
    move.l #color_num, D0
    jsr SET_BG_COLOR_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

; ==============================================================================
; text macros
; ==============================================================================
DRAW_TEXT_MACRO: MACRO str_addr x_cord y_cord
    movem.l A0-A6/D0-D7, -(SP)
    lea str_addr, A0
    move.l #x_cord, D0
    move.l #y_cord, D1
    jsr DRAW_TEXT_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

NUM_TO_TEXT_MACRO: MACRO num_ram, num_str_ram
    movem.l A0-A6/D0-D7, -(SP)
    lea RAM_COUNTER, A0
    lea RAM_COUNTER_STR, A1
    jsr NUM_TO_TEXT_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM

; ==============================================================================
; time macros
; ==============================================================================
SLEEP_SEC_MACRO: MACRO sec_num
    movem.l A0-A6/D0-D7, -(SP)
    move.l #sec_num, D0
    jsr SLEEP_SEC_SR
    movem.l (SP)+, A0-A6/D0-D7
    ENDM
