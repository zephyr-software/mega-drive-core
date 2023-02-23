; ******************************************************************************
; system - mega drive system input / output
;
; ******************************************************************************


; ==============================================================================
; GET_MD_VERSION_SR - get mega drive hardware version
; ------------------------------------------------------------------------------
; input params : no
; output params: D0 - mega drive hardware version
; ------------------------------------------------------------------------------
; call example:
; jsr GET_MD_VERSION_SR
; ==============================================================================
GET_MD_VERSION_SR:
    clr.l D0

    move.b SYSTEM_IO_VERSION_NUMBER_ADDR, D0 ; md hardware version [bits 0-3]

    bclr.l #0x4, D0 ; clear rsv  bit [not used]
    bclr.l #0x5, D0 ; clear disk bit [fdd unit connected / not connected]
    bclr.l #0x6, D0 ; clear vmod bit [ntsc cpu 7.67 Mhz / pal cpu 7.60 Mhz]
    bclr.l #0x7, D0 ; clear mode bit [domestic model / overseas model]

    rts
