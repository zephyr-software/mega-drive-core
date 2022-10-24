; ******************************************************************************
; time - time subroutines based on m68k / vdp interrupts
;
; irq level 4 - horizontal retrace interrupt
; irq level 6 - vertical retrace interrupt
; ******************************************************************************


; ==============================================================================
; WAIT_VSYNC_SR - wait vertical retrace sync
; ------------------------------------------------------------------------------
; input params: no
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem A0-A6/D0-D7, -(SP)
; jsr WAIT_VSYNC_SR
; movem (SP)+, A0-A6/D0-D7
; ==============================================================================
WAIT_VSYNC_SR:
WAIT_VSYNC_VBLANK_START:
    move.w 0x00C00004, D0 ;move vdp status word to d0
    andi.w #0x0008, D0    ;and with bit 4 (vblank)
    bne WAIT_VSYNC_VBLANK_START

WAIT_VSYNC_VBLANK_END:
    move.w 0x00C00004, D0 ;move vdp status word to d0
    andi.w #0x0008, D0    ;and with bit 4
    beq WAIT_VSYNC_VBLANK_END

    rts

; ==============================================================================
; SLEEP_SEC_SR - stop program exec for x sec
; ------------------------------------------------------------------------------
; input params: D0 - number of seconds to sleep
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem A0-A6/D0-D7, -(SP)
; move.l #0x1, D0
; jsp SLEEP_SEC_SR
; movem (SP)+, A0-A6/D0-D7
; ==============================================================================
SLEEP_SEC_SR:

    mulu.w #0x32, D0 ;50 frames [hz] per 1 sec in pal mega drive
    move.l D0, D1 ;optimization - save time
SLEEP_SEC:
    ; movem A0-A6/D0-D7, -(SP) ;optimization - save time
    jsr WAIT_VSYNC_SR
    ; movem (SP)+, A0-A6/D0-D7 ;optimization - save time

    dbra D1, SLEEP_SEC

    rts
