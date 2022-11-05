; ******************************************************************************
; system initialization code section
; ******************************************************************************


INIT: ; entry point address in cpu vector table

; --------------------------------------
; pass trade mark security signature
; --------------------------------------
    move.l #0x00000000, D0
    move.b 0x00A10001,  D0 ; mega drive hardware version [bits 0-3]
    andi.b #%00001111,  D0 ; mask version

    cmp.b  #0x00,       D0 ; if version 0, skip tmss signature
    beq.s  NO_TMSS

    move.l #'SEGA',     0x00A14000 ; pass tmss
NO_TMSS:

; --------------------------------------
; init video display processor
; --------------------------------------
    move.l #VDP_REG,    A0 ; vdp register table
    move.l #0x00000017, D0 ; 24 vdp register
    move.l #0x00008000, D1 ; set vdp register command [register 0]

VDP_REG_COPY:
    move.b (A0)+,   D1         ; vdp register value
    move.w D1,      0x00C00004 ; set vdp register with vdp control port
    add.w  #0x0100, D1         ; set vdp register command [next register]
    dbra   D0,      VDP_REG_COPY

; -------------------------------------
; clear registers
; -------------------------------------
    lea RAM_ADDR, A0
    move.l #0x00000000, (A0)
    movem.l  (A0), A0-A6/D0-D7

; --------------------------------------
; init status register
; --------------------------------------
    move #0x2700, SR ; no trace, a7 is interrupt stack pointer, no interrupts,
                     ; clear condition code bits

    jmp MAIN
