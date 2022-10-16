; ******************************************************************************
; main code section
; ******************************************************************************
    include vector.asm
    include header.asm
    include init.asm
    include macro.asm

MAIN:
    LOAD_PALETTE_MACRO SYS_PAL    , 0x0       ;load system palette colors
    LOAD_TYLES_MACRO   SYS_DATA   , 0x1 , 0x0 ;load system tiles
    LOAD_TYLES_MACRO   FONT_DATA  , 0x24, 0x1 ;load system font
    FILL_SCREEN_MACRO  0x0                  ;clear screen with 0 tyle
    DRAW_TEXT_MACRO    TEST_STRING, 0x0 , 0x0 ;draw text

MAIN_LOOP:
    jmp MAIN_LOOP

HINT:
VINT:
    rte

EXCEPTION:
    stop #$2700 ; halt cpu


    include data.asm
    include font.asm
ROM_END:
