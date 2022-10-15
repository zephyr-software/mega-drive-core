; ******************************************************************************
; yamaha ym7101 - text subroutines
; ******************************************************************************


; ==============================================================================
; DRAW_TEXT_SR - draw text subroutine
; draw text
; ------------------------------------------------------------------------------
; input params:
; A0 - string address
; A1 - x tile coord of the screen
; A2 - y tile coord of the screen
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7, -(SP)
; lea    TEST_STRING, A0
; move.l #0x0,        A1
; move.l #0x1,        A2
; movem  (SP)+,       SA0-A6/D0-D7
; ==============================================================================
DRAW_TEXT_SR:
    move.w #0x8F02, 0x00C00004 ; set vdp auto increment

    move.l #0x40000003, 0x00C00004; draw to vdp plane A [0xC000]

DRAW_CHAR:
    clr D0
    move.b (A0)+, D0   ; move ASCII code
    cmp.b 0x0, D0
    beq.b DRAW_CHAR_END

    sub.w #0x20, D0   ; substract not exist symbols in ASCII map implementation
    lea ASCII_MAP, A4 ; load ASCII map addr
    add.w D0, A4      ; set ASCII symbol inxed from table
    move.b (A4), D0

    move.w D0, 0x00C00000
    jmp DRAW_CHAR

DRAW_CHAR_END:
    move.w #0x8F00, 0x00C00004 ; disable vdp auto increment 

    rts
