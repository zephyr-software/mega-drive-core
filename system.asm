; ******************************************************************************
; system - mega drive system input / output
;
; ******************************************************************************


; ==============================================================================
; GET_MD_VERSION_SR - get mega drive version subroutine
; get mega drive hardware version
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

; ==============================================================================
; GET_MD_CPU_MODE_SR - get mega drive central processor unit mode subroutine
; get mega drive central processor unit mode
; ------------------------------------------------------------------------------
; input params : no
; output params: D0 - cpu mode
;                     0: ntsc cpu clock 7.67 mhz
;                     1: pal  cpu clock 7.60 mhz
; ------------------------------------------------------------------------------
; call example:
; jsr GET_MD_CPU_MODE_SR
; ==============================================================================
GET_MD_CPU_MODE_SR:
    clr.l D0

    move.b SYSTEM_IO_VERSION_NUMBER_ADDR, D0 ; md cpu mode [bit 6]

    bclr.l #0x7, D0 ; clear mode bit  [domestic model / overseas model]
    lsr.b  #0x6, D0 ; logical shift to 6 bits right
               ; D0 - contains cpu mode

    rts

; ==============================================================================
; GET_MD_MODEL_SR - get mega drive model subroutine
; get mega drive model
; ------------------------------------------------------------------------------
; input params : no
; output params: D0 - model
;                     0: domestic model
;                     1: overseas model
; ------------------------------------------------------------------------------
; call example:
; jsr GET_MD_MODEL_SR
; ==============================================================================
GET_MD_MODEL_SR:
    clr.l D0

    move.b SYSTEM_IO_VERSION_NUMBER_ADDR, D0 ; md model [bit 7]

    lsr.b  #0x7, D0 ; logical shift to 7 bits right
               ; D0 - contains model

    rts
