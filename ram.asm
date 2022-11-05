; ******************************************************************************
; main memory [ram] - 65536 bytes
;
; ******************************************************************************


; ==============================================================================
; FILL_RAM_SR - fill memory subroutine
; fill memory with the same byte subroutine
; ------------------------------------------------------------------------------
; input params:
; A0 - ram start
; A1 - ram end
; D0 - byte to fill
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7, -(SP)
; move.w #0x0000, A0          ; ram start
; move.w #0xFFFF, A1          ; ram end
; move.b #0x00, D0            ; byte to fill
; movem  (SP)+, A0-A6/D0-D7
; =============================================================================
FILL_RAM_SR:
    move.w A0, D1
    move.w A1, D2

    lea RAM_ADDR, A2
    adda.l A2, A0

    sub.w D1, D2
FILL_RAM:
    move.b D0, (A0)+
    dbra D2, FILL_RAM

    rts
