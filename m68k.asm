; ******************************************************************************
; motorola 68000 - cpu subroutines
;
; ******************************************************************************


; ==============================================================================
; INIT_M68K_SREG_SR: init motorola 68000 status register [SR] subroutine
;
; set system byte: no trace, supervisor mode; irq level 7
; set user byte  : 0x0
; ------------------------------------------------------------------------------
; input params : no
; output params: no
; ------------------------------------------------------------------------------
; call example:
; jsr INIT_M68K_SREG_SR
; ==============================================================================
INIT_M68K_SREG_SR:
    move #0x2700, SR ; system byte: no trace, supervisor mode; irq level 7
                     ; user byte  : 0x0

    rts


; ==============================================================================
; CLR_M68K_SR: clear motorola 68000 registers subroutine
; set 0x0 to all registers a0-a6 / d0-d7
; ------------------------------------------------------------------------------
; input params : no
; output params: no
; ------------------------------------------------------------------------------
; call example:
; jsr CLR_M68K_SR
; ==============================================================================
CLR_M68K_SR:
    clr.l D0
    clr.l D1
    clr.l D2
    clr.l D3
    clr.l D4
    clr.l D5
    clr.l D6
    clr.l D7

    move.l D0, A0
    move.l D0, A1
    move.l D0, A2
    move.l D0, A3
    move.l D0, A4
    move.l D0, A5
    move.l D0, A6
             ; A7 - stack pointer

    rts
